@implementation SFBrowserController

- (void)setProxy:(id)a3
{
  objc_storeWeak((id *)&self->_proxy, a3);
}

- (SFBrowserControllerProxy)proxy
{
  return (SFBrowserControllerProxy *)objc_loadWeakRetained((id *)&self->_proxy);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxy);
}

@end
