@implementation CLSDeallocNotifier

- (CLSDeallocNotifier)initWithDeallocCallbackBlock:(id)a3
{
  id v4;
  CLSDeallocNotifier *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSDeallocNotifier;
  v5 = -[CLSDeallocNotifier init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1D82575D0](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)dealloc
{
  void (**block)(id, SEL);
  objc_super v4;

  block = (void (**)(id, SEL))self->_block;
  if (block)
    block[2](block, a2);
  v4.receiver = self;
  v4.super_class = (Class)CLSDeallocNotifier;
  -[CLSDeallocNotifier dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
