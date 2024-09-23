@implementation _SLAuthHostViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void (**v7)(void);
  objc_super v8;

  v5 = a3;
  _SLLog(v3, 3, CFSTR("_SLAuthHostViewController: (this may be harmless) viewServiceDidTerminateWithError: %@"));
  v8.receiver = self;
  v8.super_class = (Class)_SLAuthHostViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v8, sel_viewServiceDidTerminateWithError_, v5, v5);

  -[_SLAuthHostViewController viewServiceTerminationBlock](self, "viewServiceTerminationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_SLAuthHostViewController viewServiceTerminationBlock](self, "viewServiceTerminationBlock");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
}

- (id)viewServiceTerminationBlock
{
  return self->_viewServiceTerminationBlock;
}

- (void)setViewServiceTerminationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1472);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewServiceTerminationBlock, 0);
}

@end
