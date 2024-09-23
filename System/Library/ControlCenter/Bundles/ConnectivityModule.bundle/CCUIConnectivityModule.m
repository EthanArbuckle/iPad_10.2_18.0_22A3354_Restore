@implementation CCUIConnectivityModule

- (CCUIConnectivityModule)init
{
  const char *v2;
  uint64_t v3;
  CCUIConnectivityModule *v4;
  uint64_t v5;
  CCUIConnectivityManager *connectivityManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityModule;
  v4 = -[CCUIConnectivityModule init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_sharedInstance(CCUIConnectivityManager, v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    connectivityManager = v4->_connectivityManager;
    v4->_connectivityManager = (CCUIConnectivityManager *)v5;

  }
  return v4;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (id)contentViewControllerForContext:(id)a3
{
  CCUIConnectivityModuleViewController *v4;
  const char *v5;

  v4 = [CCUIConnectivityModuleViewController alloc];
  return (id)objc_msgSend_initWithContentModuleContext_(v4, v5, (uint64_t)self->_contentModuleContext);
}

- (unint64_t)supportedGridSizeClasses
{
  return 1552;
}

- (CCUIConnectivityManager)connectivityManager
{
  return self->_connectivityManager;
}

- (void)setConnectivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_connectivityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectivityManager, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
