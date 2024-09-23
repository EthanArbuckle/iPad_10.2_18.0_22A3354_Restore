@implementation ICSSceneDelegate

- (NSMapTable)windowSceneToWindow
{
  return self->_windowSceneToWindow;
}

- (void)setWindowSceneToWindow:(id)a3
{
  objc_storeStrong((id *)&self->_windowSceneToWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneToWindow, 0);
}

@end
