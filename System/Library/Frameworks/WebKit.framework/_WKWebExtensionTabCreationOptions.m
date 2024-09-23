@implementation _WKWebExtensionTabCreationOptions

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionTabCreationOptions;
  return -[_WKWebExtensionTabCreationOptions init](&v3, sel_init);
}

- (_WKWebExtensionWindow)desiredWindow
{
  return self->_desiredWindow;
}

- (void)_setDesiredWindow:(id)a3
{
  objc_storeStrong((id *)&self->_desiredWindow, a3);
}

- (unint64_t)desiredIndex
{
  return self->_desiredIndex;
}

- (void)_setDesiredIndex:(unint64_t)a3
{
  self->_desiredIndex = a3;
}

- (_WKWebExtensionTab)desiredParentTab
{
  return self->_desiredParentTab;
}

- (void)_setDesiredParentTab:(id)a3
{
  objc_storeStrong((id *)&self->_desiredParentTab, a3);
}

- (NSURL)desiredURL
{
  return self->_desiredURL;
}

- (void)_setDesiredURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldActivate
{
  return self->_shouldActivate;
}

- (void)_setShouldActivate:(BOOL)a3
{
  self->_shouldActivate = a3;
}

- (BOOL)shouldSelect
{
  return self->_shouldSelect;
}

- (void)_setShouldSelect:(BOOL)a3
{
  self->_shouldSelect = a3;
}

- (BOOL)shouldPin
{
  return self->_shouldPin;
}

- (void)_setShouldPin:(BOOL)a3
{
  self->_shouldPin = a3;
}

- (BOOL)shouldMute
{
  return self->_shouldMute;
}

- (void)_setShouldMute:(BOOL)a3
{
  self->_shouldMute = a3;
}

- (BOOL)shouldShowReaderMode
{
  return self->_shouldShowReaderMode;
}

- (void)_setShouldShowReaderMode:(BOOL)a3
{
  self->_shouldShowReaderMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredURL, 0);
  objc_storeStrong((id *)&self->_desiredParentTab, 0);
  objc_storeStrong((id *)&self->_desiredWindow, 0);
}

@end
