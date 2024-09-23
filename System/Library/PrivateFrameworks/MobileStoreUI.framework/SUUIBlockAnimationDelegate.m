@implementation SUUIBlockAnimationDelegate

- (SUUIBlockAnimationDelegate)initWithCompletionHandler:(id)a3
{
  id v4;
  SUUIBlockAnimationDelegate *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIBlockAnimationDelegate;
  v5 = -[SUUIBlockAnimationDelegate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void (**block)(id, id, BOOL);
  id v6;

  block = (void (**)(id, id, BOOL))self->_block;
  if (block)
  {
    block[2](block, a3, a4);
    v6 = self->_block;
    self->_block = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
