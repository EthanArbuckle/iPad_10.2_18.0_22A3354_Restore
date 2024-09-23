@implementation CNMutableContainer

- (void)setProviderMetadata:(id)a3
{
  CNProviderMetadata *v4;
  CNProviderMetadata *providerMetadata;

  if (self->super._providerMetadata != a3)
  {
    v4 = (CNProviderMetadata *)objc_msgSend(a3, "copy");
    providerMetadata = self->super._providerMetadata;
    self->super._providerMetadata = v4;

  }
}

- (void)setProviderIdentifier:(id)a3
{
  NSString *v4;
  NSString *providerIdentifier;

  if (self->super._providerIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    providerIdentifier = self->super._providerIdentifier;
    self->super._providerIdentifier = v4;

  }
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  if (self->super._name != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    name = self->super._name;
    self->super._name = v4;

  }
}

- (void)setMeIdentifier:(id)a3
{
  NSString *v4;
  NSString *meIdentifier;

  if (self->super._meIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    meIdentifier = self->super._meIdentifier;
    self->super._meIdentifier = v4;

  }
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  if (self->super._identifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    identifier = self->super._identifier;
    self->super._identifier = v4;

  }
}

- (void)setExternalSyncTag:(id)a3
{
  NSString *v4;
  NSString *externalSyncTag;

  if (self->super._externalSyncTag != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    externalSyncTag = self->super._externalSyncTag;
    self->super._externalSyncTag = v4;

  }
}

- (void)setExternalSyncData:(id)a3
{
  NSData *v4;
  NSData *externalSyncData;

  if (self->super._externalSyncData != a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    externalSyncData = self->super._externalSyncData;
    self->super._externalSyncData = v4;

  }
}

- (void)setExternalModificationTag:(id)a3
{
  NSString *v4;
  NSString *externalModificationTag;

  if (self->super._externalModificationTag != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    externalModificationTag = self->super._externalModificationTag;
    self->super._externalModificationTag = v4;

  }
}

- (void)setExternalIdentifier:(id)a3
{
  NSString *v4;
  NSString *externalIdentifier;

  if (self->super._externalIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    externalIdentifier = self->super._externalIdentifier;
    self->super._externalIdentifier = v4;

  }
}

- (void)setConstraintsPath:(id)a3
{
  NSString *v4;
  NSString *constraintsPath;

  if (self->super._constraintsPath != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    constraintsPath = self->super._constraintsPath;
    self->super._constraintsPath = v4;

  }
}

- (void)setAccountIdentifier:(id)a3
{
  NSString *v4;
  NSString *accountIdentifier;

  if (self->super._accountIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    accountIdentifier = self->super._accountIdentifier;
    self->super._accountIdentifier = v4;

  }
}

- (id)freeze
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

- (id)freezeWithSelfAsSnapshot
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContainer setSnapshot:](self, "setSnapshot:", v3);

  return -[CNMutableContainer freeze](self, "freeze");
}

- (void)setSnapshot:(id)a3
{
  CNContainer *snapshot;
  id v5;
  CNContainer *v6;
  CNContainer *v7;

  snapshot = self->super._snapshot;
  if (snapshot != a3)
  {
    self->super._snapshot = 0;
    v5 = a3;

    v6 = (CNContainer *)objc_msgSend(v5, "copy");
    v7 = self->super._snapshot;
    self->super._snapshot = v6;

  }
}

- (void)setType:(int64_t)a3
{
  self->super._type = a3;
}

- (void)setRestrictions:(unint64_t)a3
{
  self->super._restrictions = a3;
}

- (void)setLastSyncDate:(id)a3
{
  NSDate *v4;
  NSDate *lastSyncDate;

  if (self->super._lastSyncDate != a3)
  {
    v4 = (NSDate *)objc_msgSend(a3, "copy");
    lastSyncDate = self->super._lastSyncDate;
    self->super._lastSyncDate = v4;

  }
}

- (void)setIOSLegacyIdentifier:(int)a3
{
  self->super._iOSLegacyIdentifier = a3;
}

- (void)setGuardianStateDirty:(BOOL)a3
{
  self->super._guardianStateDirty = a3;
}

- (void)setGuardianRestricted:(BOOL)a3
{
  self->super._guardianRestricted = a3;
  self->super._guardianStateDirty = 1;
}

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

- (id)copy
{
  return -[CNContainer initWithContainer:]([CNContainer alloc], "initWithContainer:", self);
}

- (NSString)identifier
{
  return self->super._identifier;
}

- (NSString)name
{
  return self->super._name;
}

- (int64_t)type
{
  return self->super._type;
}

- (int)iOSLegacyIdentifier
{
  return self->super._iOSLegacyIdentifier;
}

- (NSString)accountIdentifier
{
  return self->super._accountIdentifier;
}

- (BOOL)isEnabled
{
  return self->super._enabled;
}

- (NSString)externalIdentifier
{
  return self->super._externalIdentifier;
}

- (NSString)externalModificationTag
{
  return self->super._externalModificationTag;
}

- (NSString)externalSyncTag
{
  return self->super._externalSyncTag;
}

- (NSData)externalSyncData
{
  return self->super._externalSyncData;
}

- (NSString)constraintsPath
{
  return self->super._constraintsPath;
}

- (NSString)meIdentifier
{
  return self->super._meIdentifier;
}

- (unint64_t)restrictions
{
  return self->super._restrictions;
}

- (BOOL)isGuardianRestricted
{
  return self->super._guardianRestricted;
}

- (BOOL)isGuardianStateDirty
{
  return self->super._guardianStateDirty;
}

- (void)setGuardianRestricted:(BOOL)a3 shouldPushChangeToServer:(BOOL)a4
{
  self->super._guardianRestricted = a3;
  self->super._guardianStateDirty = a4;
}

- (NSDate)lastSyncDate
{
  return self->super._lastSyncDate;
}

- (void)adoptValuesFromAndSetSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    +[CN writableContainerProperties](CN, "writableContainerProperties", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v10, "CNValueForContainer:", v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setCNValue:onContainer:", v11, self);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  -[CNMutableContainer setSnapshot:](self, "setSnapshot:", v4);

}

- (NSString)providerIdentifier
{
  return self->super._providerIdentifier;
}

- (CNProviderMetadata)providerMetadata
{
  return self->super._providerMetadata;
}

@end
