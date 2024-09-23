@implementation AVTPassthroughEventCoalescer

- (void)registerEventForCoalescingWithLabel:(id)a3 handler:(id)a4
{
  -[AVTPassthroughEventCoalescer setHandler:](self, "setHandler:", a4);
}

- (void)eventDidOccur:(id)a3
{
  void (**v4)(void);
  void *v5;
  id v6;

  v6 = a3;
  -[AVTPassthroughEventCoalescer handler](self, "handler");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    v5 = v6;
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
