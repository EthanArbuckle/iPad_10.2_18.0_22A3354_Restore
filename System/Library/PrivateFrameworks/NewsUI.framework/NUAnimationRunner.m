@implementation NUAnimationRunner

- (void)runWithFinishBlock:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[NUAnimationRunner runBlock](self, "runBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NUAnimationRunner runBlock](self, "runBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void (**)(void)))v5)[2](v5, v6);

  }
  else if (v6)
  {
    v6[2]();
  }

}

- (id)runBlock
{
  return self->_runBlock;
}

- (NUAnimationRunner)initWithRunBlock:(id)a3
{
  id v4;
  NUAnimationRunner *v5;
  uint64_t v6;
  id runBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUAnimationRunner;
  v5 = -[NUAnimationRunner init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x2199FC190](v4);
    runBlock = v5->_runBlock;
    v5->_runBlock = (id)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_runBlock, 0);
}

@end
