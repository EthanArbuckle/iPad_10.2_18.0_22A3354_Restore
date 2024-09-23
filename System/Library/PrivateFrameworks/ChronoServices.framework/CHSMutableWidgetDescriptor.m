@implementation CHSMutableWidgetDescriptor

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

- (void)setWidgetVisibility:(int64_t)a3
{
  self->super._widgetVisibility = a3;
}

- (void)setSupportsInteraction:(BOOL)a3
{
  self->super._supportsInteraction = a3;
}

- (void)setEnablesMultipleTapTargets:(BOOL)a3
{
  self->super._enablesMultipleTapTargets = a3;
}

- (void)setBackgroundRemovable:(BOOL)a3
{
  self->super._backgroundRemovable = a3;
  -[CHSWidgetDescriptor _evaluateSupportsAccentedContent](self, "_evaluateSupportsAccentedContent");
}

- (void)setSupportsVibrantContent:(BOOL)a3
{
  self->super.super._supportsVibrantContent = a3;
}

- (void)setPreferredBackgroundStyle:(int64_t)a3
{
  self->super.super._preferredBackgroundStyle = a3;
}

- (void)setHiddenBySensitiveUI:(BOOL)a3
{
  self->super.super._hiddenBySensitiveUI = a3;
}

- (void)setSdkVersion:(id)a3
{
  objc_storeStrong((id *)&self->super.super._sdkVersion, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetDescriptor initFromDescriptor:includeIntents:]([CHSWidgetDescriptor alloc], "initFromDescriptor:includeIntents:", self, 1);
}

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

- (void)setNativeContainerBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *nativeContainerBundleIdentifier;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  nativeContainerBundleIdentifier = self->super.super._nativeContainerBundleIdentifier;
  self->super.super._nativeContainerBundleIdentifier = v4;

}

- (void)setKind:(id)a3
{
  NSString *v4;
  NSString *kind;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  kind = self->super._kind;
  self->super._kind = v4;

}

- (void)setSupportedFamilies:(unint64_t)a3
{
  self->super._supportedFamilies = a3;
}

- (void)setIntentType:(id)a3
{
  NSString *v4;
  NSString *intentType;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  intentType = self->super._intentType;
  self->super._intentType = v4;

}

- (void)setIntentRecommendationsContainer:(id)a3
{
  objc_storeStrong((id *)&self->super._intentRecommendationsContainer, a3);
}

- (void)setDisfavoredLocations:(id)a3
{
  objc_storeStrong((id *)&self->super._disfavoredLocations, a3);
}

- (void)setDisfavoredLocations:(unint64_t)a3 on:(int64_t)a4
{
  NSDictionary *v7;
  void *v8;
  void *v9;
  NSDictionary *disfavoredLocations;

  v7 = (NSDictionary *)-[NSDictionary mutableCopy](self->super._disfavoredLocations, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, v9);

  disfavoredLocations = self->super._disfavoredLocations;
  self->super._disfavoredLocations = v7;

}

- (void)setTransparent:(BOOL)a3
{
  int64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->super.super._preferredBackgroundStyle = v3;
  self->super.super._supportsVibrantContent = a3;
}

- (void)setSupportsAccentedContent:(BOOL)a3
{
  self->super._supportsAccentedContent = -[CHSBaseDescriptor isLinkedOnOrAfter:](self, "isLinkedOnOrAfter:", 1) && a3;
}

- (void)setPlatform:(unint64_t)a3
{
  self->super.super._platform = a3;
}

- (void)setPromptsForUserConfiguration:(BOOL)a3
{
  self->super.super._promptsForUserConfiguration = a3;
}

- (void)setEnablement:(unint64_t)a3
{
  self->super.super._enablement = a3;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  CHSExtensionIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  CHSExtensionIdentity *v8;
  CHSExtensionIdentity *extensionIdentity;
  id v10;

  v10 = a3;
  v4 = [CHSExtensionIdentity alloc];
  v5 = (void *)objc_msgSend(v10, "copy");
  -[CHSExtensionIdentity containerBundleIdentifier](self->super.super._extensionIdentity, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSExtensionIdentity deviceIdentifier](self->super.super._extensionIdentity, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](v4, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, v7);
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v8;

}

- (void)setContainerBundleIdentifier:(id)a3
{
  CHSExtensionIdentity *v4;
  void *v5;
  void *v6;
  void *v7;
  CHSExtensionIdentity *v8;
  CHSExtensionIdentity *extensionIdentity;
  id v10;

  v10 = a3;
  v4 = [CHSExtensionIdentity alloc];
  -[CHSExtensionIdentity extensionBundleIdentifier](self->super.super._extensionIdentity, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v10, "copy");
  -[CHSExtensionIdentity deviceIdentifier](self->super.super._extensionIdentity, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CHSExtensionIdentity initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:](v4, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, v7);
  extensionIdentity = self->super.super._extensionIdentity;
  self->super.super._extensionIdentity = v8;

}

@end
