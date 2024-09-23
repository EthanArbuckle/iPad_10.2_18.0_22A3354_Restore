@implementation CHSMutableWidgetExtension

- (void)setIdentity:(id)a3
{
  CHSExtensionIdentity *v4;
  CHSExtensionIdentity *identity;
  id v6;

  v6 = a3;
  v4 = (CHSExtensionIdentity *)objc_msgSend(v6, "copy");
  identity = self->super._identity;
  self->super._identity = v4;

  self->super._hasValidHash = 0;
}

- (void)setLocalizedDisplayName:(id)a3
{
  NSString *v4;
  NSString *localizedDisplayName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  localizedDisplayName = self->super._localizedDisplayName;
  self->super._localizedDisplayName = v4;

  self->super._hasValidHash = 0;
}

- (void)setContainerBundleLocalizedDisplayName:(id)a3
{
  NSString *v4;
  NSString *containerBundleLocalizedDisplayName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  containerBundleLocalizedDisplayName = self->super._containerBundleLocalizedDisplayName;
  self->super._containerBundleLocalizedDisplayName = v4;

  self->super._hasValidHash = 0;
}

- (void)setOrderedWidgetDescriptors:(id)a3
{
  NSArray *v4;
  NSArray *orderedWidgetDescriptors;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  orderedWidgetDescriptors = self->super._orderedWidgetDescriptors;
  self->super._orderedWidgetDescriptors = v4;

  self->super._hasValidHash = 0;
}

- (void)setOrderedControlDescriptors:(id)a3
{
  NSArray *v4;
  NSArray *orderedControlDescriptors;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  orderedControlDescriptors = self->super._orderedControlDescriptors;
  self->super._orderedControlDescriptors = v4;

  self->super._hasValidHash = 0;
}

- (void)setEntitlements:(id)a3
{
  CHSEntitlementCollection *v4;
  CHSEntitlementCollection *entitlements;
  id v6;

  v6 = a3;
  v4 = (CHSEntitlementCollection *)objc_msgSend(v6, "copy");
  entitlements = self->super._entitlements;
  self->super._entitlements = v4;

  self->super._hasValidHash = 0;
}

- (void)setDataProtectionLevel:(int64_t)a3
{
  self->super._dataProtectionLevel = a3;
  self->super._hasValidHash = 0;
}

@end
