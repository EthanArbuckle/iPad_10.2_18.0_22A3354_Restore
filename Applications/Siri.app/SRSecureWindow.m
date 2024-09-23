@implementation SRSecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (void)didAddSubview:(id)a3
{
  id v4;
  Class v5;
  char isKindOfClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SRSecureWindow;
  v4 = a3;
  -[SRSecureWindow didAddSubview:](&v7, "didAddSubview:", v4);
  v5 = NSClassFromString(CFSTR("_UIContextMenuContainerView"));
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
    -[SRSecureWindow setContextMenuIsPresented:](self, "setContextMenuIsPresented:", 1, v7.receiver, v7.super_class);
}

- (void)willRemoveSubview:(id)a3
{
  id v4;
  Class v5;
  char isKindOfClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SRSecureWindow;
  v4 = a3;
  -[SRSecureWindow willRemoveSubview:](&v7, "willRemoveSubview:", v4);
  v5 = NSClassFromString(CFSTR("_UIContextMenuContainerView"));
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
    -[SRSecureWindow setContextMenuIsPresented:](self, "setContextMenuIsPresented:", 0, v7.receiver, v7.super_class);
}

- (BOOL)contextMenuIsPresented
{
  return self->_contextMenuIsPresented;
}

- (void)setContextMenuIsPresented:(BOOL)a3
{
  self->_contextMenuIsPresented = a3;
}

@end
