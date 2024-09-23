@implementation CHSMutableControlDescriptor

- (void)setControlVersion:(unint64_t)a3
{
  self->super._controlVersion = a3;
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

- (void)setControlType:(unint64_t)a3
{
  self->super._controlType = a3;
}

- (void)setPreferredControlSize:(unint64_t)a3
{
  self->super._preferredControlSize = a3;
}

- (void)setSupportsPush:(BOOL)a3
{
  self->super._supportsPush = a3;
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

- (void)setVisibility:(int64_t)a3
{
  self->super._visibility = a3;
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

- (void)setSdkVersion:(id)a3
{
  objc_storeStrong((id *)&self->super.super._sdkVersion, a3);
}

- (void)setPlatform:(unint64_t)a3
{
  self->super.super._platform = a3;
}

- (void)setHiddenControl:(BOOL)a3
{
  self->super._hiddenControl = a3;
}

- (void)setShowsContextualMenu:(BOOL)a3
{
  self->super._showsContextualMenu = a3;
}

- (void)setDisablesControlStateCaching:(BOOL)a3
{
  self->super._disablesControlStateCaching = a3;
}

- (void)setActionMetadata:(id)a3
{
  CHSControlActionMetadata *v4;
  CHSControlActionMetadata *actionMetadata;
  id v6;

  v6 = a3;
  v4 = (CHSControlActionMetadata *)objc_msgSend(v6, "copy");
  actionMetadata = self->super._actionMetadata;
  self->super._actionMetadata = v4;

}

- (void)setDefaultIntentReference:(id)a3
{
  CHSIntentReference *v5;
  CHSIntentReference *v6;

  v5 = (CHSIntentReference *)a3;
  if (self->super._defaultIntentReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._defaultIntentReference, a3);
    v5 = v6;
  }

}

- (void)setHiddenBySensitiveUI:(BOOL)a3
{
  self->super.super._hiddenBySensitiveUI = a3;
}

- (void)setPromptsForUserConfiguration:(BOOL)a3
{
  self->super.super._promptsForUserConfiguration = a3;
}

- (void)setEnablement:(unint64_t)a3
{
  self->super.super._enablement = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSControlDescriptor initFromDescriptor:includeIntents:]([CHSControlDescriptor alloc], "initFromDescriptor:includeIntents:", self, 1);
}

@end
