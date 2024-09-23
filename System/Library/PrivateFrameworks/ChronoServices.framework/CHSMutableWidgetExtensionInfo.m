@implementation CHSMutableWidgetExtensionInfo

+ (id)new
{
  return objc_alloc_init(CHSMutableWidgetExtensionInfo);
}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  bundleIdentifier = self->super._bundleIdentifier;
  self->super._bundleIdentifier = v4;

}

- (void)setContainerBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *containerBundleIdentifier;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  containerBundleIdentifier = self->super._containerBundleIdentifier;
  self->super._containerBundleIdentifier = v4;

}

- (void)setEffectiveContainerBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *effectiveContainerBundleIdentifier;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  effectiveContainerBundleIdentifier = self->super._effectiveContainerBundleIdentifier;
  self->super._effectiveContainerBundleIdentifier = v4;

}

- (void)setVersion:(id)a3
{
  NSString *v4;
  NSString *version;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  version = self->super._version;
  self->super._version = v4;

}

- (void)setLastModifiedDate:(id)a3
{
  NSDate *v4;
  NSDate *lastModifiedDate;
  id v6;

  v6 = a3;
  v4 = (NSDate *)objc_msgSend(v6, "copy");
  lastModifiedDate = self->super._lastModifiedDate;
  self->super._lastModifiedDate = v4;

}

- (void)setBundleURL:(id)a3
{
  NSURL *v4;
  NSURL *bundleURL;
  id v6;

  v6 = a3;
  v4 = (NSURL *)objc_msgSend(v6, "copy");
  bundleURL = self->super._bundleURL;
  self->super._bundleURL = v4;

}

- (void)setContainerURL:(id)a3
{
  NSURL *v4;
  NSURL *containerURL;
  id v6;

  v6 = a3;
  v4 = (NSURL *)objc_msgSend(v6, "copy");
  containerURL = self->super._containerURL;
  self->super._containerURL = v4;

}

- (void)setSystemDataContainerURL:(id)a3
{
  NSURL *v4;
  NSURL *systemDataContainerURL;
  id v6;

  v6 = a3;
  v4 = (NSURL *)objc_msgSend(v6, "copy");
  systemDataContainerURL = self->super._systemDataContainerURL;
  self->super._systemDataContainerURL = v4;

}

- (void)setDataProtectionLevel:(id)a3
{
  NSString *v4;
  NSString *dataProtectionLevel;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  dataProtectionLevel = self->super._dataProtectionLevel;
  self->super._dataProtectionLevel = v4;

}

- (void)setIsDevelopmentExtension:(BOOL)a3
{
  self->super._isDevelopmentExtension = a3;
}

- (void)setWantsLocation:(BOOL)a3
{
  self->super._wantsLocation = a3;
}

- (void)setAvailableLocalizations:(id)a3
{
  NSArray *v4;
  NSArray *availableLocalizations;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  availableLocalizations = self->super._availableLocalizations;
  self->super._availableLocalizations = v4;

}

- (void)setAllowsMixedLocalizations:(BOOL)a3
{
  self->super._allowsMixedLocalizations = a3;
}

- (void)setSdkVersion:(id)a3
{
  NSString *v4;
  NSString *sdkVersion;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  sdkVersion = self->super._sdkVersion;
  self->super._sdkVersion = v4;

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

}

- (void)setDescriptors:(id)a3
{
  NSArray *v4;
  NSArray *descriptors;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  descriptors = self->super._descriptors;
  self->super._descriptors = v4;

}

- (void)setWidgetConfigurations:(id)a3
{
  NSArray *v4;
  NSArray *widgetConfigurations;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  widgetConfigurations = self->super._widgetConfigurations;
  self->super._widgetConfigurations = v4;

}

- (void)setControlConfigurations:(id)a3
{
  NSArray *v4;
  NSArray *controlConfigurations;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  controlConfigurations = self->super._controlConfigurations;
  self->super._controlConfigurations = v4;

}

- (void)setSnapshotURLs:(id)a3
{
  NSArray *v4;
  NSArray *snapshotURLs;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  snapshotURLs = self->super._snapshotURLs;
  self->super._snapshotURLs = v4;

}

- (void)setPlaceholderURLs:(id)a3
{
  NSArray *v4;
  NSArray *placeholderURLs;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  placeholderURLs = self->super._placeholderURLs;
  self->super._placeholderURLs = v4;

}

- (void)setTimelineURLs:(id)a3
{
  NSArray *v4;
  NSArray *timelineURLs;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  timelineURLs = self->super._timelineURLs;
  self->super._timelineURLs = v4;

}

- (void)setLiveControlURLs:(id)a3
{
  NSArray *v4;
  NSArray *liveControlURLs;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  liveControlURLs = self->super._liveControlURLs;
  self->super._liveControlURLs = v4;

}

- (void)setLivePlaceholderControlURLs:(id)a3
{
  NSArray *v4;
  NSArray *livePlaceholderControlURLs;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  livePlaceholderControlURLs = self->super._livePlaceholderControlURLs;
  self->super._livePlaceholderControlURLs = v4;

}

- (void)setPreviewControlURLs:(id)a3
{
  NSArray *v4;
  NSArray *previewControlURLs;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  previewControlURLs = self->super._previewControlURLs;
  self->super._previewControlURLs = v4;

}

- (void)setNominatedContainerBundleIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *nominatedContainerBundleIdentifiers;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  nominatedContainerBundleIdentifiers = self->super._nominatedContainerBundleIdentifiers;
  self->super._nominatedContainerBundleIdentifiers = v4;

}

- (void)setDisablesImplicitDiscovery:(BOOL)a3
{
  self->super._disablesImplicitDiscovery = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetExtensionInfo _initWithInfo:]([CHSWidgetExtensionInfo alloc], "_initWithInfo:", self);
}

@end
