@implementation _HMFObjectObserverInternal

- (void)dealloc
{
  void (**deallocationBlock)(id, SEL);
  objc_super v4;

  deallocationBlock = (void (**)(id, SEL))self->_deallocationBlock;
  if (deallocationBlock)
    deallocationBlock[2](deallocationBlock, a2);
  v4.receiver = self;
  v4.super_class = (Class)_HMFObjectObserverInternal;
  -[_HMFObjectObserverInternal dealloc](&v4, sel_dealloc);
}

- (void)setDeallocationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocationBlock, 0);
}

- (id)deallocationBlock
{
  return self->_deallocationBlock;
}

@end
