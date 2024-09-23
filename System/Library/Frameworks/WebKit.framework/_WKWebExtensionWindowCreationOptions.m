@implementation _WKWebExtensionWindowCreationOptions

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionWindowCreationOptions;
  return -[_WKWebExtensionWindowCreationOptions init](&v3, sel_init);
}

- (int64_t)desiredWindowType
{
  return self->_desiredWindowType;
}

- (void)_setDesiredWindowType:(int64_t)a3
{
  self->_desiredWindowType = a3;
}

- (int64_t)desiredWindowState
{
  return self->_desiredWindowState;
}

- (void)_setDesiredWindowState:(int64_t)a3
{
  self->_desiredWindowState = a3;
}

- (CGRect)desiredFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_desiredFrame.origin.x;
  y = self->_desiredFrame.origin.y;
  width = self->_desiredFrame.size.width;
  height = self->_desiredFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setDesiredFrame:(CGRect)a3
{
  self->_desiredFrame = a3;
}

- (NSArray)desiredURLs
{
  return self->_desiredURLs;
}

- (void)_setDesiredURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)desiredTabs
{
  return self->_desiredTabs;
}

- (void)_setDesiredTabs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldFocus
{
  return self->_shouldFocus;
}

- (void)_setShouldFocus:(BOOL)a3
{
  self->_shouldFocus = a3;
}

- (BOOL)shouldUsePrivateBrowsing
{
  return self->_shouldUsePrivateBrowsing;
}

- (void)_setSouldUsePrivateBrowsing:(BOOL)a3
{
  self->_shouldUsePrivateBrowsing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredTabs, 0);
  objc_storeStrong((id *)&self->_desiredURLs, 0);
}

@end
