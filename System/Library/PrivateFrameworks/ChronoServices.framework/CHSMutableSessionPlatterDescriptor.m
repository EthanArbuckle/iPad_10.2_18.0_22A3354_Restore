@implementation CHSMutableSessionPlatterDescriptor

- (void)setExtensionIdentity:(id)a3
{
  CHSExtensionIdentity *v4;
  CHSExtensionIdentity *extensionIdentity;
  id v6;

  v6 = a3;
  v4 = (CHSExtensionIdentity *)objc_msgSend(v6, "copy");
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v4;

}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  displayName = self->super.super._displayName;
  self->super.super._displayName = v4;

}

- (void)setWidgetDescription:(id)a3
{
  NSString *v4;
  NSString *widgetDescription;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  widgetDescription = self->super.super._widgetDescription;
  self->super.super._widgetDescription = v4;

}

- (void)setLocaleToken:(id)a3
{
  NSData *v4;
  NSData *localeToken;
  id v6;

  v6 = a3;
  v4 = (NSData *)objc_msgSend(v6, "copy");
  localeToken = self->super.super._localeToken;
  self->super.super._localeToken = v4;

}

- (void)setEventMachServiceName:(id)a3
{
  NSString *v4;
  NSString *eventMachServiceName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  eventMachServiceName = self->super.super._eventMachServiceName;
  self->super.super._eventMachServiceName = v4;

}

- (void)setActivityAttributesType:(id)a3
{
  NSData *v4;
  NSData *activityAttributesType;
  id v6;

  v6 = a3;
  v4 = (NSData *)objc_msgSend(v6, "copy");
  activityAttributesType = self->super._activityAttributesType;
  self->super._activityAttributesType = v4;

}

- (void)setPreferredBackgroundStyle:(int64_t)a3
{
  self->super.super._preferredBackgroundStyle = a3;
}

- (void)setSupportsVibrantContent:(BOOL)a3
{
  self->super.super._supportsVibrantContent = a3;
}

- (void)setSdkVersion:(id)a3
{
  objc_storeStrong((id *)&self->super.super._sdkVersion, a3);
}

- (void)setPlatform:(unint64_t)a3
{
  self->super.super._platform = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSSessionPlatterDescriptor _initWithDescriptor:]([CHSSessionPlatterDescriptor alloc], "_initWithDescriptor:", self);
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  CHSExtensionIdentity *v4;
  void *v5;
  void *v6;
  CHSExtensionIdentity *v7;
  CHSExtensionIdentity *extensionIdentity;
  id v9;

  v9 = a3;
  v4 = [CHSExtensionIdentity alloc];
  v5 = (void *)objc_msgSend(v9, "copy");
  -[CHSExtensionIdentity containerBundleIdentifier](self->super.super._extensionIdentity, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](v4, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, 0);
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v7;

}

- (void)setContainerBundleIdentifier:(id)a3
{
  CHSExtensionIdentity *v4;
  void *v5;
  void *v6;
  CHSExtensionIdentity *v7;
  CHSExtensionIdentity *extensionIdentity;
  id v9;

  v9 = a3;
  v4 = [CHSExtensionIdentity alloc];
  -[CHSExtensionIdentity extensionBundleIdentifier](self->super.super._extensionIdentity, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v9, "copy");
  v7 = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](v4, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, 0);
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v7;

}

@end
