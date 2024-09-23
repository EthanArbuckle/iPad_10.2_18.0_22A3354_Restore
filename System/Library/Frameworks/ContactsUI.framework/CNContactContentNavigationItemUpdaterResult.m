@implementation CNContactContentNavigationItemUpdaterResult

- (BOOL)enableEditShortcut
{
  return self->_enableEditShortcut;
}

- (void)setEnableEditShortcut:(BOOL)a3
{
  self->_enableEditShortcut = a3;
}

- (BOOL)enableCancelShortcut
{
  return self->_enableCancelShortcut;
}

- (void)setEnableCancelShortcut:(BOOL)a3
{
  self->_enableCancelShortcut = a3;
}

- (BOOL)enableSaveShortcut
{
  return self->_enableSaveShortcut;
}

- (void)setEnableSaveShortcut:(BOOL)a3
{
  self->_enableSaveShortcut = a3;
}

@end
