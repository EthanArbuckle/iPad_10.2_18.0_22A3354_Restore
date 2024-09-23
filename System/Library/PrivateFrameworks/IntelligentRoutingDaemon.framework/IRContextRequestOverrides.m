@implementation IRContextRequestOverrides

- (IRContextRequestOverrides)initWithOverrideAppInFocusWindow:(BOOL)a3 overrideBundleId:(id)a4
{
  _BOOL8 v4;
  id v6;
  IRContextRequestOverrides *v7;
  IRContextRequestOverrides *v8;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)IRContextRequestOverrides;
  v7 = -[IRContextRequestOverrides init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[IRContextRequestOverrides setOverrideBundleId:](v7, "setOverrideBundleId:", v6);
    -[IRContextRequestOverrides setOverrideAppInFocusWindow:](v8, "setOverrideAppInFocusWindow:", v4);
  }

  return v8;
}

- (BOOL)overrideAppInFocusWindow
{
  return self->_overrideAppInFocusWindow;
}

- (void)setOverrideAppInFocusWindow:(BOOL)a3
{
  self->_overrideAppInFocusWindow = a3;
}

- (NSString)overrideBundleId
{
  return self->_overrideBundleId;
}

- (void)setOverrideBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_overrideBundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideBundleId, 0);
}

@end
