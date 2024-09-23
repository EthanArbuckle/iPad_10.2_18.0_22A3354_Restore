@implementation CPSClipLaunchOptions

+ (id)optionsForAppClipRecord:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "userNotificationGranted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserNotificationGranted:", v6);

  objc_msgSend(v4, "locationConfirmationGranted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLocationConfirmationGranted:", v7);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUserNotificationGranted:", self->_userNotificationGranted);
  objc_msgSend(v4, "setLocationConfirmationGranted:", self->_locationConfirmationGranted);
  v5 = (void *)-[NSString copy](self->_predefinedBundleID, "copy");
  objc_msgSend(v4, "setPredefinedBundleID:", v5);

  objc_msgSend(v4, "setSkipsLaunching:", self->_skipsLaunching);
  objc_msgSend(v4, "setShowsAppAttributionBanner:", self->_showsAppAttributionBanner);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSClipLaunchOptions)initWithCoder:(id)a3
{
  id v4;
  CPSClipLaunchOptions *v5;
  uint64_t v6;
  NSNumber *userNotificationGranted;
  uint64_t v8;
  NSNumber *locationConfirmationGranted;
  uint64_t v10;
  NSString *predefinedBundleID;
  CPSClipLaunchOptions *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPSClipLaunchOptions;
  v5 = -[CPSClipLaunchOptions init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserNotificationPermissionEnabled"));
    v6 = objc_claimAutoreleasedReturnValue();
    userNotificationGranted = v5->_userNotificationGranted;
    v5->_userNotificationGranted = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocationConfirmationPermissionEnabled"));
    v8 = objc_claimAutoreleasedReturnValue();
    locationConfirmationGranted = v5->_locationConfirmationGranted;
    v5->_locationConfirmationGranted = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PredefinedBundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    predefinedBundleID = v5->_predefinedBundleID;
    v5->_predefinedBundleID = (NSString *)v10;

    v5->_skipsLaunching = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("InstallWithoutLaunching"));
    v5->_showsAppAttributionBanner = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShowsAppAttributionBanner"));
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *userNotificationGranted;
  id v5;

  userNotificationGranted = self->_userNotificationGranted;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userNotificationGranted, CFSTR("UserNotificationPermissionEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationConfirmationGranted, CFSTR("LocationConfirmationPermissionEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predefinedBundleID, CFSTR("PredefinedBundleID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_skipsLaunching, CFSTR("InstallWithoutLaunching"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showsAppAttributionBanner, CFSTR("ShowsAppAttributionBanner"));

}

- (NSNumber)userNotificationGranted
{
  return self->_userNotificationGranted;
}

- (void)setUserNotificationGranted:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationGranted, a3);
}

- (NSNumber)locationConfirmationGranted
{
  return self->_locationConfirmationGranted;
}

- (void)setLocationConfirmationGranted:(id)a3
{
  objc_storeStrong((id *)&self->_locationConfirmationGranted, a3);
}

- (NSString)predefinedBundleID
{
  return self->_predefinedBundleID;
}

- (void)setPredefinedBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)skipsLaunching
{
  return self->_skipsLaunching;
}

- (void)setSkipsLaunching:(BOOL)a3
{
  self->_skipsLaunching = a3;
}

- (BOOL)showsAppAttributionBanner
{
  return self->_showsAppAttributionBanner;
}

- (void)setShowsAppAttributionBanner:(BOOL)a3
{
  self->_showsAppAttributionBanner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predefinedBundleID, 0);
  objc_storeStrong((id *)&self->_locationConfirmationGranted, 0);
  objc_storeStrong((id *)&self->_userNotificationGranted, 0);
}

@end
