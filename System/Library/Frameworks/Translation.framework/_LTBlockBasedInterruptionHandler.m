@implementation _LTBlockBasedInterruptionHandler

- (void)didReceiveInterruptionFromHandler:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[_LTBlockBasedInterruptionHandler handler](self, "handler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_LTBlockBasedInterruptionHandler handler](self, "handler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
