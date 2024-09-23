@implementation CRCarPlayAppPolicy

- (CRCarPlayAppPolicy)init
{
  CRCarPlayAppPolicy *v2;
  CRCarPlayAppPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRCarPlayAppPolicy;
  v2 = -[CRCarPlayAppPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CRCarPlayAppPolicy setCarPlayCapable:](v2, "setCarPlayCapable:", 0);
    -[CRCarPlayAppPolicy setCarPlaySupported:](v3, "setCarPlaySupported:", 0);
    -[CRCarPlayAppPolicy setCanDisplayOnCarScreen:](v3, "setCanDisplayOnCarScreen:", 0);
    -[CRCarPlayAppPolicy setLaunchUsingSiri:](v3, "setLaunchUsingSiri:", 0);
    -[CRCarPlayAppPolicy setLaunchNotificationsUsingSiri:](v3, "setLaunchNotificationsUsingSiri:", 0);
    -[CRCarPlayAppPolicy setSiriActivationOptions:](v3, "setSiriActivationOptions:", 0);
    -[CRCarPlayAppPolicy setLaunchUsingMusicUIService:](v3, "setLaunchUsingMusicUIService:", 0);
    -[CRCarPlayAppPolicy setBadgesAppIcon:](v3, "setBadgesAppIcon:", 0);
    -[CRCarPlayAppPolicy setShowsNotifications:](v3, "setShowsNotifications:", 0);
    -[CRCarPlayAppPolicy setHandlesCarIntents:](v3, "setHandlesCarIntents:", 0);
    -[CRCarPlayAppPolicy setLaunchUsingTemplateUI:](v3, "setLaunchUsingTemplateUI:", 0);
    -[CRCarPlayAppPolicy setApplicationCategory:](v3, "setApplicationCategory:", 0);
  }
  return v3;
}

- (unint64_t)bannerLaunchTypeForNotificationContentType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC868]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC878]);

  return v4;
}

- (BOOL)isCarPlaySupported
{
  return self->_carPlaySupported;
}

- (void)setCarPlaySupported:(BOOL)a3
{
  self->_carPlaySupported = a3;
}

- (BOOL)canDisplayOnCarScreen
{
  return self->_canDisplayOnCarScreen;
}

- (void)setCanDisplayOnCarScreen:(BOOL)a3
{
  self->_canDisplayOnCarScreen = a3;
}

- (BOOL)launchUsingSiri
{
  return self->_launchUsingSiri;
}

- (void)setLaunchUsingSiri:(BOOL)a3
{
  self->_launchUsingSiri = a3;
}

- (BOOL)launchNotificationsUsingSiri
{
  return self->_launchNotificationsUsingSiri;
}

- (void)setLaunchNotificationsUsingSiri:(BOOL)a3
{
  self->_launchNotificationsUsingSiri = a3;
}

- (NSDictionary)siriActivationOptions
{
  return self->_siriActivationOptions;
}

- (void)setSiriActivationOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)launchUsingMusicUIService
{
  return self->_launchUsingMusicUIService;
}

- (void)setLaunchUsingMusicUIService:(BOOL)a3
{
  self->_launchUsingMusicUIService = a3;
}

- (BOOL)badgesAppIcon
{
  return self->_badgesAppIcon;
}

- (void)setBadgesAppIcon:(BOOL)a3
{
  self->_badgesAppIcon = a3;
}

- (BOOL)showsNotifications
{
  return self->_showsNotifications;
}

- (void)setShowsNotifications:(BOOL)a3
{
  self->_showsNotifications = a3;
}

- (BOOL)handlesCarIntents
{
  return self->_handlesCarIntents;
}

- (void)setHandlesCarIntents:(BOOL)a3
{
  self->_handlesCarIntents = a3;
}

- (BOOL)launchUsingTemplateUI
{
  return self->_launchUsingTemplateUI;
}

- (void)setLaunchUsingTemplateUI:(BOOL)a3
{
  self->_launchUsingTemplateUI = a3;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (unint64_t)applicationCategory
{
  return self->_applicationCategory;
}

- (void)setApplicationCategory:(unint64_t)a3
{
  self->_applicationCategory = a3;
}

- (BOOL)isCarPlayCapable
{
  return self->_carPlayCapable;
}

- (void)setCarPlayCapable:(BOOL)a3
{
  self->_carPlayCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_siriActivationOptions, 0);
}

@end
