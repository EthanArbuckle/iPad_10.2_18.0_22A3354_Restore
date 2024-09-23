@implementation MSVSystemDialogOptions

- (NSString)alertHeader
{
  return self->_alertHeader;
}

- (void)setAlertHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)alertIconURL
{
  return self->_alertIconURL;
}

- (void)setAlertIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)allowedApplicationBundleIDs
{
  return self->_allowedApplicationBundleIDs;
}

- (void)setAllowedApplicationBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)showAsTopmost
{
  return self->_showAsTopmost;
}

- (void)setShowAsTopmost:(BOOL)a3
{
  self->_showAsTopmost = a3;
}

- (BOOL)forceModalAlertAppearance
{
  return self->_forceModalAlertAppearance;
}

- (void)setForceModalAlertAppearance:(BOOL)a3
{
  self->_forceModalAlertAppearance = a3;
}

- (BOOL)showOnLockscreen
{
  return self->_showOnLockscreen;
}

- (void)setShowOnLockscreen:(BOOL)a3
{
  self->_showOnLockscreen = a3;
}

- (BOOL)dismissOverlaysOnLockscreen
{
  return self->_dismissOverlaysOnLockscreen;
}

- (void)setDismissOverlaysOnLockscreen:(BOOL)a3
{
  self->_dismissOverlaysOnLockscreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_allowedApplicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_alertIconURL, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertHeader, 0);
}

@end
