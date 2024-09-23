@implementation FBSApplicationUninstallOptions

+ (id)userInitiated
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setUserInitiated:", 1);
  return v2;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)showsArchiveOption
{
  return self->_showsArchiveOption;
}

- (void)setShowsArchiveOption:(BOOL)a3
{
  self->_showsArchiveOption = a3;
}

@end
