@implementation AVProxyPlayerLayer

- (id)avkit_window
{
  return 0;
}

- (UIWindow)avkit_originalWindow
{
  return self->_avkit_originalWindow;
}

- (void)avkit_setOriginalWindow:(id)a3
{
  objc_storeStrong((id *)&self->_avkit_originalWindow, a3);
}

- (BOOL)avkit_isFullScreen
{
  return self->_avkit_isFullScreen;
}

- (void)avkit_setIsFullScreen:(BOOL)a3
{
  self->_avkit_isFullScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avkit_originalWindow, 0);
}

@end
