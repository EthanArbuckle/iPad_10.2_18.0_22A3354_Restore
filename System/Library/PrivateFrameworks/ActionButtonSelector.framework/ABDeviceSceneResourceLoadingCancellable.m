@implementation ABDeviceSceneResourceLoadingCancellable

- (ABDeviceSceneResourceLoadingCancellable)initWithCancelBlock:(id)a3
{
  id v4;
  ABDeviceSceneResourceLoadingCancellable *v5;
  uint64_t v6;
  id cancelBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ABDeviceSceneResourceLoadingCancellable;
  v5 = -[ABDeviceSceneResourceLoadingCancellable init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x23B7E420C](v4);
    cancelBlock = v5->_cancelBlock;
    v5->_cancelBlock = (id)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  (*((void (**)(void))self->_cancelBlock + 2))();
  v3.receiver = self;
  v3.super_class = (Class)ABDeviceSceneResourceLoadingCancellable;
  -[ABDeviceSceneResourceLoadingCancellable dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end
