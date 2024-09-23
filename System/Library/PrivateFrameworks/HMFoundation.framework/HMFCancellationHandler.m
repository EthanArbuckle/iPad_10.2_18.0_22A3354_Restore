@implementation HMFCancellationHandler

- (HMFCancellationHandler)initWithBlock:(id)a3
{
  id v4;
  HMFCancellationHandler *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFCancellationHandler;
  v5 = -[HMFCancellationHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)cancel
{
  void (**v3)(void);
  id block;
  void (**v5)(void);

  v3 = (void (**)(void))MEMORY[0x1A1AC373C](self->_block, a2);
  if (v3)
  {
    v5 = v3;
    v3[2]();
    block = self->_block;
    self->_block = 0;

    v3 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
