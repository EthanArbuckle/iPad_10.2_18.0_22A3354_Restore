@implementation MDMBlockOperation

+ (MDMBlockOperation)blockOperationWithBlock:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setBlock:", v3);

  return (MDMBlockOperation *)v4;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  v3 = (void *)MEMORY[0x22767CA14](self, a2);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setOperation:", self);
  -[MDMBlockOperation block](self, "block");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v4);

  objc_autoreleasePoolPop(v3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
