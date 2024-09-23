@implementation _INPBIntentMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_suggestedInvocationPhrase, 0);
  objc_storeStrong((id *)&self->_preferredAudioOutputRouteId, 0);
  objc_storeStrong((id *)&self->_parameterImages, 0);
  objc_storeStrong((id *)&self->_originatingDeviceRapportMediaSystemId, 0);
  objc_storeStrong((id *)&self->_originatingDeviceRapportEffectiveId, 0);
  objc_storeStrong((id *)&self->_originatingDeviceIdsIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRouteId, 0);
  objc_storeStrong((id *)&self->_intentId, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_forceNeedsValueForParameters, 0);
  objc_storeStrong((id *)&self->_endpointId, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_airPlayRouteIds, 0);
  objc_storeStrong((id *)&self->_systemUIExtensionBundleId, 0);
  objc_storeStrong((id *)&self->_systemExtensionBundleId, 0);
  objc_storeStrong((id *)&self->_nanoLaunchId, 0);
  objc_storeStrong((id *)&self->_launchId, 0);
  objc_storeStrong((id *)&self->_defaultImageValue, 0);
  objc_storeStrong((id *)&self->_categoryVerb, 0);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentMetadataReadFrom(self, (uint64_t)a3);
}

- (void)setUserConfirmationRequired:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_userConfirmationRequired = a3;
}

- (void)setVersioningHash:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_versioningHash = a3;
}

- (void)setLaunchId:(id)a3
{
  NSString *v4;
  NSString *launchId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  launchId = self->_launchId;
  self->_launchId = v4;

}

- (void)setIntentCategory:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFFD;
  }
  else
  {
    *(_WORD *)&self->_has = has | 2;
    self->_intentCategory = a3;
  }
}

- (void)setCategoryVerb:(id)a3
{
  NSString *v4;
  NSString *categoryVerb;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  categoryVerb = self->_categoryVerb;
  self->_categoryVerb = v4;

}

- (void)setSuggestedInvocationPhrase:(id)a3
{
  NSString *v4;
  NSString *suggestedInvocationPhrase;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  suggestedInvocationPhrase = self->_suggestedInvocationPhrase;
  self->_suggestedInvocationPhrase = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentMetadata *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v5 = -[_INPBIntentMetadata init](+[_INPBIntentMetadata allocWithZone:](_INPBIntentMetadata, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_categoryVerb, "copyWithZone:", a3);
  -[_INPBIntentMetadata setCategoryVerb:](v5, "setCategoryVerb:", v6);

  v7 = -[_INPBImageValue copyWithZone:](self->_defaultImageValue, "copyWithZone:", a3);
  -[_INPBIntentMetadata setDefaultImageValue:](v5, "setDefaultImageValue:", v7);

  if (-[_INPBIntentMetadata hasExecutionContext](self, "hasExecutionContext"))
    -[_INPBIntentMetadata setExecutionContext:](v5, "setExecutionContext:", -[_INPBIntentMetadata executionContext](self, "executionContext"));
  if (-[_INPBIntentMetadata hasIntentCategory](self, "hasIntentCategory"))
    -[_INPBIntentMetadata setIntentCategory:](v5, "setIntentCategory:", -[_INPBIntentMetadata intentCategory](self, "intentCategory"));
  v8 = (void *)-[NSString copyWithZone:](self->_launchId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setLaunchId:](v5, "setLaunchId:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_nanoLaunchId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setNanoLaunchId:](v5, "setNanoLaunchId:", v9);

  PBRepeatedInt32Copy();
  v10 = (void *)-[NSString copyWithZone:](self->_systemExtensionBundleId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setSystemExtensionBundleId:](v5, "setSystemExtensionBundleId:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_systemUIExtensionBundleId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setSystemUIExtensionBundleId:](v5, "setSystemUIExtensionBundleId:", v11);

  v12 = (void *)-[NSArray copyWithZone:](self->_airPlayRouteIds, "copyWithZone:", a3);
  -[_INPBIntentMetadata setAirPlayRouteIds:](v5, "setAirPlayRouteIds:", v12);

  v13 = (void *)-[NSData copyWithZone:](self->_auditTokenData, "copyWithZone:", a3);
  -[_INPBIntentMetadata setAuditTokenData:](v5, "setAuditTokenData:", v13);

  if (-[_INPBIntentMetadata hasBackgroundLaunch](self, "hasBackgroundLaunch"))
    -[_INPBIntentMetadata setBackgroundLaunch:](v5, "setBackgroundLaunch:", -[_INPBIntentMetadata backgroundLaunch](self, "backgroundLaunch"));
  if (-[_INPBIntentMetadata hasBypassAppProtectionAuthentication](self, "hasBypassAppProtectionAuthentication"))
    -[_INPBIntentMetadata setBypassAppProtectionAuthentication:](v5, "setBypassAppProtectionAuthentication:", -[_INPBIntentMetadata bypassAppProtectionAuthentication](self, "bypassAppProtectionAuthentication"));
  if (-[_INPBIntentMetadata hasConfirmed](self, "hasConfirmed"))
    -[_INPBIntentMetadata setConfirmed:](v5, "setConfirmed:", -[_INPBIntentMetadata confirmed](self, "confirmed"));
  v14 = (void *)-[NSString copyWithZone:](self->_endpointId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setEndpointId:](v5, "setEndpointId:", v14);

  if (-[_INPBIntentMetadata hasEndpointMediaPlaybackEnabled](self, "hasEndpointMediaPlaybackEnabled"))
    -[_INPBIntentMetadata setEndpointMediaPlaybackEnabled:](v5, "setEndpointMediaPlaybackEnabled:", -[_INPBIntentMetadata endpointMediaPlaybackEnabled](self, "endpointMediaPlaybackEnabled"));
  v15 = (void *)-[NSArray copyWithZone:](self->_forceNeedsValueForParameters, "copyWithZone:", a3);
  -[_INPBIntentMetadata setForceNeedsValueForParameters:](v5, "setForceNeedsValueForParameters:", v15);

  if (-[_INPBIntentMetadata hasIdiom](self, "hasIdiom"))
    -[_INPBIntentMetadata setIdiom:](v5, "setIdiom:", -[_INPBIntentMetadata idiom](self, "idiom"));
  v16 = (void *)-[NSString copyWithZone:](self->_intentDescription, "copyWithZone:", a3);
  -[_INPBIntentMetadata setIntentDescription:](v5, "setIntentDescription:", v16);

  v17 = (void *)-[NSString copyWithZone:](self->_intentId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setIntentId:](v5, "setIntentId:", v17);

  if (-[_INPBIntentMetadata hasIsOwnedByCurrentUser](self, "hasIsOwnedByCurrentUser"))
    -[_INPBIntentMetadata setIsOwnedByCurrentUser:](v5, "setIsOwnedByCurrentUser:", -[_INPBIntentMetadata isOwnedByCurrentUser](self, "isOwnedByCurrentUser"));
  if (-[_INPBIntentMetadata hasIsPrimaryDisplayDisabled](self, "hasIsPrimaryDisplayDisabled"))
    -[_INPBIntentMetadata setIsPrimaryDisplayDisabled:](v5, "setIsPrimaryDisplayDisabled:", -[_INPBIntentMetadata isPrimaryDisplayDisabled](self, "isPrimaryDisplayDisabled"));
  v18 = (void *)-[NSString copyWithZone:](self->_mediaRouteId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setMediaRouteId:](v5, "setMediaRouteId:", v18);

  if (-[_INPBIntentMetadata hasMsLimitReached](self, "hasMsLimitReached"))
    -[_INPBIntentMetadata setMsLimitReached:](v5, "setMsLimitReached:", -[_INPBIntentMetadata msLimitReached](self, "msLimitReached"));
  v19 = (void *)-[NSString copyWithZone:](self->_originatingDeviceIdsIdentifier, "copyWithZone:", a3);
  -[_INPBIntentMetadata setOriginatingDeviceIdsIdentifier:](v5, "setOriginatingDeviceIdsIdentifier:", v19);

  v20 = (void *)-[NSString copyWithZone:](self->_originatingDeviceRapportEffectiveId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setOriginatingDeviceRapportEffectiveId:](v5, "setOriginatingDeviceRapportEffectiveId:", v20);

  v21 = (void *)-[NSString copyWithZone:](self->_originatingDeviceRapportMediaSystemId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setOriginatingDeviceRapportMediaSystemId:](v5, "setOriginatingDeviceRapportMediaSystemId:", v21);

  v22 = (void *)-[NSArray copyWithZone:](self->_parameterImages, "copyWithZone:", a3);
  -[_INPBIntentMetadata setParameterImages:](v5, "setParameterImages:", v22);

  v23 = (void *)-[NSString copyWithZone:](self->_preferredAudioOutputRouteId, "copyWithZone:", a3);
  -[_INPBIntentMetadata setPreferredAudioOutputRouteId:](v5, "setPreferredAudioOutputRouteId:", v23);

  PBRepeatedInt32Copy();
  if (-[_INPBIntentMetadata hasShowsWhenRun](self, "hasShowsWhenRun"))
    -[_INPBIntentMetadata setShowsWhenRun:](v5, "setShowsWhenRun:", -[_INPBIntentMetadata showsWhenRun](self, "showsWhenRun"));
  v24 = (void *)-[NSString copyWithZone:](self->_suggestedInvocationPhrase, "copyWithZone:", a3);
  -[_INPBIntentMetadata setSuggestedInvocationPhrase:](v5, "setSuggestedInvocationPhrase:", v24);

  if (-[_INPBIntentMetadata hasTriggerMethod](self, "hasTriggerMethod"))
    -[_INPBIntentMetadata setTriggerMethod:](v5, "setTriggerMethod:", -[_INPBIntentMetadata triggerMethod](self, "triggerMethod"));
  if (-[_INPBIntentMetadata hasUserConfirmationRequired](self, "hasUserConfirmationRequired"))
    -[_INPBIntentMetadata setUserConfirmationRequired:](v5, "setUserConfirmationRequired:", -[_INPBIntentMetadata userConfirmationRequired](self, "userConfirmationRequired"));
  v25 = -[_INPBString copyWithZone:](self->_userUtterance, "copyWithZone:", a3);
  -[_INPBIntentMetadata setUserUtterance:](v5, "setUserUtterance:", v25);

  if (-[_INPBIntentMetadata hasVersioningHash](self, "hasVersioningHash"))
    -[_INPBIntentMetadata setVersioningHash:](v5, "setVersioningHash:", -[_INPBIntentMetadata versioningHash](self, "versioningHash"));
  return v5;
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBIntentMetadata categoryVerb](self, "categoryVerb");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBIntentMetadata defaultImageValue](self, "defaultImageValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBIntentMetadata defaultImageValue](self, "defaultImageValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBIntentMetadata hasExecutionContext](self, "hasExecutionContext"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBIntentMetadata hasIntentCategory](self, "hasIntentCategory"))
    PBDataWriterWriteInt32Field();
  -[_INPBIntentMetadata launchId](self, "launchId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_INPBIntentMetadata nanoLaunchId](self, "nanoLaunchId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  if (self->_requiredEntitlements.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_requiredEntitlements.count);
  }
  -[_INPBIntentMetadata systemExtensionBundleId](self, "systemExtensionBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[_INPBIntentMetadata systemUIExtensionBundleId](self, "systemUIExtensionBundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = self->_airPlayRouteIds;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v50;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v50 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v15);
  }

  -[_INPBIntentMetadata auditTokenData](self, "auditTokenData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteDataField();
  if (-[_INPBIntentMetadata hasBackgroundLaunch](self, "hasBackgroundLaunch"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBIntentMetadata hasBypassAppProtectionAuthentication](self, "hasBypassAppProtectionAuthentication"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBIntentMetadata hasConfirmed](self, "hasConfirmed"))
    PBDataWriterWriteBOOLField();
  -[_INPBIntentMetadata endpointId](self, "endpointId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  if (-[_INPBIntentMetadata hasEndpointMediaPlaybackEnabled](self, "hasEndpointMediaPlaybackEnabled"))
    PBDataWriterWriteBOOLField();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v20 = self->_forceNeedsValueForParameters;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v46;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v46 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v22);
  }

  if (-[_INPBIntentMetadata hasIdiom](self, "hasIdiom"))
    PBDataWriterWriteInt32Field();
  -[_INPBIntentMetadata intentDescription](self, "intentDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    PBDataWriterWriteStringField();
  -[_INPBIntentMetadata intentId](self, "intentId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    PBDataWriterWriteStringField();
  if (-[_INPBIntentMetadata hasIsOwnedByCurrentUser](self, "hasIsOwnedByCurrentUser"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBIntentMetadata hasIsPrimaryDisplayDisabled](self, "hasIsPrimaryDisplayDisabled"))
    PBDataWriterWriteBOOLField();
  -[_INPBIntentMetadata mediaRouteId](self, "mediaRouteId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    PBDataWriterWriteStringField();
  if (-[_INPBIntentMetadata hasMsLimitReached](self, "hasMsLimitReached"))
    PBDataWriterWriteBOOLField();
  -[_INPBIntentMetadata originatingDeviceIdsIdentifier](self, "originatingDeviceIdsIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    PBDataWriterWriteStringField();
  -[_INPBIntentMetadata originatingDeviceRapportEffectiveId](self, "originatingDeviceRapportEffectiveId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    PBDataWriterWriteStringField();
  -[_INPBIntentMetadata originatingDeviceRapportMediaSystemId](self, "originatingDeviceRapportMediaSystemId");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    PBDataWriterWriteStringField();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v31 = self->_parameterImages;
  v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v42;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v33);
  }

  -[_INPBIntentMetadata preferredAudioOutputRouteId](self, "preferredAudioOutputRouteId", v41);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    PBDataWriterWriteStringField();
  if (self->_shortcutAvailabilities.count)
  {
    v37 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v37;
    }
    while (v37 < self->_shortcutAvailabilities.count);
  }
  if (-[_INPBIntentMetadata hasShowsWhenRun](self, "hasShowsWhenRun"))
    PBDataWriterWriteBOOLField();
  -[_INPBIntentMetadata suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
    PBDataWriterWriteStringField();
  if (-[_INPBIntentMetadata hasTriggerMethod](self, "hasTriggerMethod"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBIntentMetadata hasUserConfirmationRequired](self, "hasUserConfirmationRequired"))
    PBDataWriterWriteBOOLField();
  -[_INPBIntentMetadata userUtterance](self, "userUtterance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[_INPBIntentMetadata userUtterance](self, "userUtterance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBIntentMetadata hasVersioningHash](self, "hasVersioningHash"))
    PBDataWriterWriteUint64Field();

}

- (BOOL)hasIntentCategory
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (NSString)categoryVerb
{
  return self->_categoryVerb;
}

- (NSString)launchId
{
  return self->_launchId;
}

- (NSString)systemExtensionBundleId
{
  return self->_systemExtensionBundleId;
}

- (NSString)suggestedInvocationPhrase
{
  return self->_suggestedInvocationPhrase;
}

- (BOOL)hasVersioningHash
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasUserConfirmationRequired
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasTriggerMethod
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasShowsWhenRun
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasMsLimitReached
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasIsPrimaryDisplayDisabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasIsOwnedByCurrentUser
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasIdiom
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasExecutionContext
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasEndpointMediaPlaybackEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasConfirmed
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasBackgroundLaunch
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (NSString)intentDescription
{
  return self->_intentDescription;
}

- (_INPBImageValue)defaultImageValue
{
  return self->_defaultImageValue;
}

- (_INPBString)userUtterance
{
  return self->_userUtterance;
}

- (NSString)systemUIExtensionBundleId
{
  return self->_systemUIExtensionBundleId;
}

- (NSString)preferredAudioOutputRouteId
{
  return self->_preferredAudioOutputRouteId;
}

- (NSString)originatingDeviceRapportMediaSystemId
{
  return self->_originatingDeviceRapportMediaSystemId;
}

- (NSString)originatingDeviceRapportEffectiveId
{
  return self->_originatingDeviceRapportEffectiveId;
}

- (NSString)originatingDeviceIdsIdentifier
{
  return self->_originatingDeviceIdsIdentifier;
}

- (NSString)nanoLaunchId
{
  return self->_nanoLaunchId;
}

- (NSString)mediaRouteId
{
  return self->_mediaRouteId;
}

- (NSString)intentId
{
  return self->_intentId;
}

- (NSString)endpointId
{
  return self->_endpointId;
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (int)intentCategory
{
  return self->_intentCategory;
}

- (void)dealloc
{
  objc_super v3;

  -[_INPBIntentMetadata clearRequiredEntitlements](self, "clearRequiredEntitlements");
  -[_INPBIntentMetadata clearShortcutAvailabilities](self, "clearShortcutAvailabilities");
  v3.receiver = self;
  v3.super_class = (Class)_INPBIntentMetadata;
  -[_INPBIntentMetadata dealloc](&v3, sel_dealloc);
}

- (void)clearShortcutAvailabilities
{
  PBRepeatedInt32Clear();
}

- (void)clearRequiredEntitlements
{
  PBRepeatedInt32Clear();
}

- (void)setDefaultImageValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultImageValue, a3);
}

- (void)setSystemExtensionBundleId:(id)a3
{
  NSString *v4;
  NSString *systemExtensionBundleId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  systemExtensionBundleId = self->_systemExtensionBundleId;
  self->_systemExtensionBundleId = v4;

}

- (void)setUserUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_userUtterance, a3);
}

- (void)setSystemUIExtensionBundleId:(id)a3
{
  NSString *v4;
  NSString *systemUIExtensionBundleId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  systemUIExtensionBundleId = self->_systemUIExtensionBundleId;
  self->_systemUIExtensionBundleId = v4;

}

- (void)setPreferredAudioOutputRouteId:(id)a3
{
  NSString *v4;
  NSString *preferredAudioOutputRouteId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  preferredAudioOutputRouteId = self->_preferredAudioOutputRouteId;
  self->_preferredAudioOutputRouteId = v4;

}

- (void)setParameterImages:(id)a3
{
  NSArray *v4;
  NSArray *parameterImages;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  parameterImages = self->_parameterImages;
  self->_parameterImages = v4;

}

- (void)setOriginatingDeviceRapportMediaSystemId:(id)a3
{
  NSString *v4;
  NSString *originatingDeviceRapportMediaSystemId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  originatingDeviceRapportMediaSystemId = self->_originatingDeviceRapportMediaSystemId;
  self->_originatingDeviceRapportMediaSystemId = v4;

}

- (void)setOriginatingDeviceRapportEffectiveId:(id)a3
{
  NSString *v4;
  NSString *originatingDeviceRapportEffectiveId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  originatingDeviceRapportEffectiveId = self->_originatingDeviceRapportEffectiveId;
  self->_originatingDeviceRapportEffectiveId = v4;

}

- (void)setOriginatingDeviceIdsIdentifier:(id)a3
{
  NSString *v4;
  NSString *originatingDeviceIdsIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  originatingDeviceIdsIdentifier = self->_originatingDeviceIdsIdentifier;
  self->_originatingDeviceIdsIdentifier = v4;

}

- (void)setNanoLaunchId:(id)a3
{
  NSString *v4;
  NSString *nanoLaunchId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  nanoLaunchId = self->_nanoLaunchId;
  self->_nanoLaunchId = v4;

}

- (void)setMediaRouteId:(id)a3
{
  NSString *v4;
  NSString *mediaRouteId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  mediaRouteId = self->_mediaRouteId;
  self->_mediaRouteId = v4;

}

- (void)setIntentId:(id)a3
{
  NSString *v4;
  NSString *intentId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  intentId = self->_intentId;
  self->_intentId = v4;

}

- (void)setIntentDescription:(id)a3
{
  NSString *v4;
  NSString *intentDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  intentDescription = self->_intentDescription;
  self->_intentDescription = v4;

}

- (void)setForceNeedsValueForParameters:(id)a3
{
  NSArray *v4;
  NSArray *forceNeedsValueForParameters;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  forceNeedsValueForParameters = self->_forceNeedsValueForParameters;
  self->_forceNeedsValueForParameters = v4;

}

- (void)setEndpointId:(id)a3
{
  NSString *v4;
  NSString *endpointId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  endpointId = self->_endpointId;
  self->_endpointId = v4;

}

- (void)setAuditTokenData:(id)a3
{
  NSData *v4;
  NSData *auditTokenData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  auditTokenData = self->_auditTokenData;
  self->_auditTokenData = v4;

}

- (void)setAirPlayRouteIds:(id)a3
{
  NSArray *v4;
  NSArray *airPlayRouteIds;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  airPlayRouteIds = self->_airPlayRouteIds;
  self->_airPlayRouteIds = v4;

}

- (unint64_t)shortcutAvailabilitiesCount
{
  return self->_shortcutAvailabilities.count;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  NSUInteger v39;

  v39 = -[NSString hash](self->_categoryVerb, "hash");
  v38 = -[_INPBImageValue hash](self->_defaultImageValue, "hash");
  if (-[_INPBIntentMetadata hasExecutionContext](self, "hasExecutionContext"))
    v37 = 2654435761 * self->_executionContext;
  else
    v37 = 0;
  if (-[_INPBIntentMetadata hasIntentCategory](self, "hasIntentCategory"))
    v36 = 2654435761 * self->_intentCategory;
  else
    v36 = 0;
  v35 = -[NSString hash](self->_launchId, "hash");
  v34 = -[NSString hash](self->_nanoLaunchId, "hash");
  v33 = PBRepeatedInt32Hash();
  v32 = -[NSString hash](self->_systemExtensionBundleId, "hash");
  v31 = -[NSString hash](self->_systemUIExtensionBundleId, "hash");
  v30 = -[NSArray hash](self->_airPlayRouteIds, "hash");
  v29 = -[NSData hash](self->_auditTokenData, "hash");
  if (-[_INPBIntentMetadata hasBackgroundLaunch](self, "hasBackgroundLaunch"))
    v28 = 2654435761 * self->_backgroundLaunch;
  else
    v28 = 0;
  if (-[_INPBIntentMetadata hasBypassAppProtectionAuthentication](self, "hasBypassAppProtectionAuthentication"))
    v27 = 2654435761 * self->_bypassAppProtectionAuthentication;
  else
    v27 = 0;
  if (-[_INPBIntentMetadata hasConfirmed](self, "hasConfirmed"))
    v26 = 2654435761 * self->_confirmed;
  else
    v26 = 0;
  v25 = -[NSString hash](self->_endpointId, "hash");
  if (-[_INPBIntentMetadata hasEndpointMediaPlaybackEnabled](self, "hasEndpointMediaPlaybackEnabled"))
    v24 = 2654435761 * self->_endpointMediaPlaybackEnabled;
  else
    v24 = 0;
  v23 = -[NSArray hash](self->_forceNeedsValueForParameters, "hash");
  if (-[_INPBIntentMetadata hasIdiom](self, "hasIdiom"))
    v22 = 2654435761 * self->_idiom;
  else
    v22 = 0;
  v21 = -[NSString hash](self->_intentDescription, "hash");
  v20 = -[NSString hash](self->_intentId, "hash");
  if (-[_INPBIntentMetadata hasIsOwnedByCurrentUser](self, "hasIsOwnedByCurrentUser"))
    v19 = 2654435761 * self->_isOwnedByCurrentUser;
  else
    v19 = 0;
  if (-[_INPBIntentMetadata hasIsPrimaryDisplayDisabled](self, "hasIsPrimaryDisplayDisabled"))
    v18 = 2654435761 * self->_isPrimaryDisplayDisabled;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_mediaRouteId, "hash");
  if (-[_INPBIntentMetadata hasMsLimitReached](self, "hasMsLimitReached"))
    v16 = 2654435761 * self->_msLimitReached;
  else
    v16 = 0;
  v15 = -[NSString hash](self->_originatingDeviceIdsIdentifier, "hash");
  v14 = -[NSString hash](self->_originatingDeviceRapportEffectiveId, "hash");
  v13 = -[NSString hash](self->_originatingDeviceRapportMediaSystemId, "hash");
  v3 = -[NSArray hash](self->_parameterImages, "hash");
  v4 = -[NSString hash](self->_preferredAudioOutputRouteId, "hash");
  v5 = PBRepeatedInt32Hash();
  if (-[_INPBIntentMetadata hasShowsWhenRun](self, "hasShowsWhenRun"))
    v6 = 2654435761 * self->_showsWhenRun;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_suggestedInvocationPhrase, "hash");
  if (-[_INPBIntentMetadata hasTriggerMethod](self, "hasTriggerMethod"))
    v8 = 2654435761 * self->_triggerMethod;
  else
    v8 = 0;
  if (-[_INPBIntentMetadata hasUserConfirmationRequired](self, "hasUserConfirmationRequired"))
    v9 = 2654435761 * self->_userConfirmationRequired;
  else
    v9 = 0;
  v10 = -[_INPBString hash](self->_userUtterance, "hash");
  if (-[_INPBIntentMetadata hasVersioningHash](self, "hasVersioningHash"))
    v11 = 2654435761u * self->_versioningHash;
  else
    v11 = 0;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (NSArray)parameterImages
{
  return self->_parameterImages;
}

- (BOOL)hasCategoryVerb
{
  return self->_categoryVerb != 0;
}

- (BOOL)hasDefaultImageValue
{
  return self->_defaultImageValue != 0;
}

- (void)setExecutionContext:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFFE;
  }
  else
  {
    *(_WORD *)&self->_has = has | 1;
    self->_executionContext = a3;
  }
}

- (void)setHasExecutionContext:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (id)executionContextAsString:(int)a3
{
  if ((a3 - 1) < 0xA)
    return off_1E228A270[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsExecutionContext:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASSISTANT_DIALOG")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASSISTANT_VOICE_SHORTCUT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COVER_SHEET_PREDICTION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_PREDICTION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_SEARCH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WORKFLOW")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_FACE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASSISTANT_VOICE_SHORTCUT_VIA_CLOUD_RELAY")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_HOME_SCREEN")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setHasIntentCategory:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (id)intentCategoryAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0x15 && ((0x1FFDFFu >> v3) & 1) != 0)
  {
    v4 = off_1E228A2C0[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsIntentCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_INFORMATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_PLAY_AUDIO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_PLAY_VIDEO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_ORDER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_NAVIGATION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_START")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_SHARE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CREATE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_SEARCH")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_TOGGLE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_DOWNLOAD")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_LOG")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CHECK_IN")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_WORKFLOW")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_REQUEST")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_SET")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CALL_AUDIO")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CALL_VIDEO")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_PLAY_SOUND")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_USER_ACTIVITY")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasLaunchId
{
  return self->_launchId != 0;
}

- (BOOL)hasNanoLaunchId
{
  return self->_nanoLaunchId != 0;
}

- (void)setRequiredEntitlements:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)requiredEntitlements
{
  return self->_requiredEntitlements.list;
}

- (void)addRequiredEntitlement:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)requiredEntitlementsCount
{
  return self->_requiredEntitlements.count;
}

- (int)requiredEntitlementAtIndex:(unint64_t)a3
{
  return self->_requiredEntitlements.list[a3];
}

- (id)requiredEntitlementsAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("CONTACTS");
  if (a3 == 2)
  {
    v3 = CFSTR("LOCATION");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRequiredEntitlements:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACTS")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasSystemExtensionBundleId
{
  return self->_systemExtensionBundleId != 0;
}

- (BOOL)hasSystemUIExtensionBundleId
{
  return self->_systemUIExtensionBundleId != 0;
}

- (void)clearAirPlayRouteIds
{
  -[NSArray removeAllObjects](self->_airPlayRouteIds, "removeAllObjects");
}

- (void)addAirPlayRouteIds:(id)a3
{
  id v4;
  NSArray *airPlayRouteIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  airPlayRouteIds = self->_airPlayRouteIds;
  v8 = v4;
  if (!airPlayRouteIds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_airPlayRouteIds;
    self->_airPlayRouteIds = v6;

    v4 = v8;
    airPlayRouteIds = self->_airPlayRouteIds;
  }
  -[NSArray addObject:](airPlayRouteIds, "addObject:", v4);

}

- (unint64_t)airPlayRouteIdsCount
{
  return -[NSArray count](self->_airPlayRouteIds, "count");
}

- (id)airPlayRouteIdsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_airPlayRouteIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasAuditTokenData
{
  return self->_auditTokenData != 0;
}

- (void)setBackgroundLaunch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_backgroundLaunch = a3;
}

- (void)setHasBackgroundLaunch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setBypassAppProtectionAuthentication:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_bypassAppProtectionAuthentication = a3;
}

- (BOOL)hasBypassAppProtectionAuthentication
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasBypassAppProtectionAuthentication:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setConfirmed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_confirmed = a3;
}

- (void)setHasConfirmed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEndpointId
{
  return self->_endpointId != 0;
}

- (void)setEndpointMediaPlaybackEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_endpointMediaPlaybackEnabled = a3;
}

- (void)setHasEndpointMediaPlaybackEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)clearForceNeedsValueForParameters
{
  -[NSArray removeAllObjects](self->_forceNeedsValueForParameters, "removeAllObjects");
}

- (void)addForceNeedsValueForParameter:(id)a3
{
  id v4;
  NSArray *forceNeedsValueForParameters;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  forceNeedsValueForParameters = self->_forceNeedsValueForParameters;
  v8 = v4;
  if (!forceNeedsValueForParameters)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_forceNeedsValueForParameters;
    self->_forceNeedsValueForParameters = v6;

    v4 = v8;
    forceNeedsValueForParameters = self->_forceNeedsValueForParameters;
  }
  -[NSArray addObject:](forceNeedsValueForParameters, "addObject:", v4);

}

- (unint64_t)forceNeedsValueForParametersCount
{
  return -[NSArray count](self->_forceNeedsValueForParameters, "count");
}

- (id)forceNeedsValueForParameterAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_forceNeedsValueForParameters, "objectAtIndexedSubscript:", a3);
}

- (void)setIdiom:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFBF;
  }
  else
  {
    *(_WORD *)&self->_has = has | 0x40;
    self->_idiom = a3;
  }
}

- (void)setHasIdiom:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (id)idiomAsString:(int)a3
{
  if ((a3 - 1) < 7)
    return off_1E228A368[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIdiom:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_POD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_TV")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAC")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasIntentDescription
{
  return self->_intentDescription != 0;
}

- (BOOL)hasIntentId
{
  return self->_intentId != 0;
}

- (void)setIsOwnedByCurrentUser:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isOwnedByCurrentUser = a3;
}

- (void)setHasIsOwnedByCurrentUser:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setIsPrimaryDisplayDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isPrimaryDisplayDisabled = a3;
}

- (void)setHasIsPrimaryDisplayDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMediaRouteId
{
  return self->_mediaRouteId != 0;
}

- (void)setMsLimitReached:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_msLimitReached = a3;
}

- (void)setHasMsLimitReached:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOriginatingDeviceIdsIdentifier
{
  return self->_originatingDeviceIdsIdentifier != 0;
}

- (BOOL)hasOriginatingDeviceRapportEffectiveId
{
  return self->_originatingDeviceRapportEffectiveId != 0;
}

- (BOOL)hasOriginatingDeviceRapportMediaSystemId
{
  return self->_originatingDeviceRapportMediaSystemId != 0;
}

- (void)clearParameterImages
{
  -[NSArray removeAllObjects](self->_parameterImages, "removeAllObjects");
}

- (void)addParameterImages:(id)a3
{
  id v4;
  NSArray *parameterImages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  parameterImages = self->_parameterImages;
  v8 = v4;
  if (!parameterImages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_parameterImages;
    self->_parameterImages = v6;

    v4 = v8;
    parameterImages = self->_parameterImages;
  }
  -[NSArray addObject:](parameterImages, "addObject:", v4);

}

- (unint64_t)parameterImagesCount
{
  return -[NSArray count](self->_parameterImages, "count");
}

- (id)parameterImagesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_parameterImages, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasPreferredAudioOutputRouteId
{
  return self->_preferredAudioOutputRouteId != 0;
}

- (void)setShortcutAvailabilities:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)shortcutAvailabilities
{
  return self->_shortcutAvailabilities.list;
}

- (void)addShortcutAvailability:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (int)shortcutAvailabilityAtIndex:(unint64_t)a3
{
  return self->_shortcutAvailabilities.list[a3];
}

- (id)shortcutAvailabilitiesAsString:(int)a3
{
  if (a3 < 7)
    return off_1E228A3A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsShortcutAvailabilities:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_MINDFULNESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_JOURNALING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_MUSIC")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_PODCASTS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_READING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_WRAP_UP_YOUR_DAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_YOGA_AND_STRETCHING")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setShowsWhenRun:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_showsWhenRun = a3;
}

- (void)setHasShowsWhenRun:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSuggestedInvocationPhrase
{
  return self->_suggestedInvocationPhrase != 0;
}

- (void)setTriggerMethod:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xF7FF;
  }
  else
  {
    *(_WORD *)&self->_has = has | 0x800;
    self->_triggerMethod = a3;
  }
}

- (void)setHasTriggerMethod:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (id)triggerMethodAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 19)
  {
    if (a3 == 20)
      return CFSTR("RemoteButton");
    if (a3 == 30)
      return CFSTR("VoiceTrigger");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("Other");
  if (a3 != 10)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("HomeButton");
  return v3;
}

- (int)StringAsTriggerMethod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeButton")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoteButton")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceTrigger")))
  {
    v4 = 30;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasUserConfirmationRequired:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasUserUtterance
{
  return self->_userUtterance != 0;
}

- (void)setHasVersioningHash:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (_INPBIntentMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentMetadata *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentMetadata initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBIntentMetadata data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int executionContext;
  int v19;
  int intentCategory;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  int bypassAppProtectionAuthentication;
  int v53;
  int backgroundLaunch;
  int v55;
  int confirmed;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  int v62;
  int endpointMediaPlaybackEnabled;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  int v69;
  int idiom;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  int v81;
  int isOwnedByCurrentUser;
  int v83;
  int isPrimaryDisplayDisabled;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  int v90;
  int msLimitReached;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  int v117;
  int showsWhenRun;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  int v124;
  int triggerMethod;
  int v126;
  int userConfirmationRequired;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  int v132;
  BOOL v133;
  int v135;
  unint64_t versioningHash;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_156;
  -[_INPBIntentMetadata categoryVerb](self, "categoryVerb");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryVerb");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata categoryVerb](self, "categoryVerb");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentMetadata categoryVerb](self, "categoryVerb");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryVerb");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata defaultImageValue](self, "defaultImageValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultImageValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata defaultImageValue](self, "defaultImageValue");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBIntentMetadata defaultImageValue](self, "defaultImageValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultImageValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_156;
  }
  else
  {

  }
  v17 = -[_INPBIntentMetadata hasExecutionContext](self, "hasExecutionContext");
  if (v17 != objc_msgSend(v4, "hasExecutionContext"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasExecutionContext](self, "hasExecutionContext"))
  {
    if (objc_msgSend(v4, "hasExecutionContext"))
    {
      executionContext = self->_executionContext;
      if (executionContext != objc_msgSend(v4, "executionContext"))
        goto LABEL_156;
    }
  }
  v19 = -[_INPBIntentMetadata hasIntentCategory](self, "hasIntentCategory");
  if (v19 != objc_msgSend(v4, "hasIntentCategory"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasIntentCategory](self, "hasIntentCategory"))
  {
    if (objc_msgSend(v4, "hasIntentCategory"))
    {
      intentCategory = self->_intentCategory;
      if (intentCategory != objc_msgSend(v4, "intentCategory"))
        goto LABEL_156;
    }
  }
  -[_INPBIntentMetadata launchId](self, "launchId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata launchId](self, "launchId");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBIntentMetadata launchId](self, "launchId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "launchId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata nanoLaunchId](self, "nanoLaunchId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nanoLaunchId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata nanoLaunchId](self, "nanoLaunchId");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBIntentMetadata nanoLaunchId](self, "nanoLaunchId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nanoLaunchId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_156;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_156;
  -[_INPBIntentMetadata systemExtensionBundleId](self, "systemExtensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemExtensionBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata systemExtensionBundleId](self, "systemExtensionBundleId");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_INPBIntentMetadata systemExtensionBundleId](self, "systemExtensionBundleId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemExtensionBundleId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata systemUIExtensionBundleId](self, "systemUIExtensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUIExtensionBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata systemUIExtensionBundleId](self, "systemUIExtensionBundleId");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_INPBIntentMetadata systemUIExtensionBundleId](self, "systemUIExtensionBundleId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUIExtensionBundleId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata airPlayRouteIds](self, "airPlayRouteIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "airPlayRouteIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata airPlayRouteIds](self, "airPlayRouteIds");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[_INPBIntentMetadata airPlayRouteIds](self, "airPlayRouteIds");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "airPlayRouteIds");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata auditTokenData](self, "auditTokenData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auditTokenData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata auditTokenData](self, "auditTokenData");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_INPBIntentMetadata auditTokenData](self, "auditTokenData");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auditTokenData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_156;
  }
  else
  {

  }
  v51 = -[_INPBIntentMetadata hasBypassAppProtectionAuthentication](self, "hasBypassAppProtectionAuthentication");
  if (v51 != objc_msgSend(v4, "hasBypassAppProtectionAuthentication"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasBypassAppProtectionAuthentication](self, "hasBypassAppProtectionAuthentication"))
  {
    if (objc_msgSend(v4, "hasBypassAppProtectionAuthentication"))
    {
      bypassAppProtectionAuthentication = self->_bypassAppProtectionAuthentication;
      if (bypassAppProtectionAuthentication != objc_msgSend(v4, "bypassAppProtectionAuthentication"))
        goto LABEL_156;
    }
  }
  v53 = -[_INPBIntentMetadata hasBackgroundLaunch](self, "hasBackgroundLaunch");
  if (v53 != objc_msgSend(v4, "hasBackgroundLaunch"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasBackgroundLaunch](self, "hasBackgroundLaunch"))
  {
    if (objc_msgSend(v4, "hasBackgroundLaunch"))
    {
      backgroundLaunch = self->_backgroundLaunch;
      if (backgroundLaunch != objc_msgSend(v4, "backgroundLaunch"))
        goto LABEL_156;
    }
  }
  v55 = -[_INPBIntentMetadata hasConfirmed](self, "hasConfirmed");
  if (v55 != objc_msgSend(v4, "hasConfirmed"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasConfirmed](self, "hasConfirmed"))
  {
    if (objc_msgSend(v4, "hasConfirmed"))
    {
      confirmed = self->_confirmed;
      if (confirmed != objc_msgSend(v4, "confirmed"))
        goto LABEL_156;
    }
  }
  -[_INPBIntentMetadata endpointId](self, "endpointId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata endpointId](self, "endpointId");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_INPBIntentMetadata endpointId](self, "endpointId");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointId");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_156;
  }
  else
  {

  }
  v62 = -[_INPBIntentMetadata hasEndpointMediaPlaybackEnabled](self, "hasEndpointMediaPlaybackEnabled");
  if (v62 != objc_msgSend(v4, "hasEndpointMediaPlaybackEnabled"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasEndpointMediaPlaybackEnabled](self, "hasEndpointMediaPlaybackEnabled"))
  {
    if (objc_msgSend(v4, "hasEndpointMediaPlaybackEnabled"))
    {
      endpointMediaPlaybackEnabled = self->_endpointMediaPlaybackEnabled;
      if (endpointMediaPlaybackEnabled != objc_msgSend(v4, "endpointMediaPlaybackEnabled"))
        goto LABEL_156;
    }
  }
  -[_INPBIntentMetadata forceNeedsValueForParameters](self, "forceNeedsValueForParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceNeedsValueForParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata forceNeedsValueForParameters](self, "forceNeedsValueForParameters");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[_INPBIntentMetadata forceNeedsValueForParameters](self, "forceNeedsValueForParameters");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forceNeedsValueForParameters");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_156;
  }
  else
  {

  }
  v69 = -[_INPBIntentMetadata hasIdiom](self, "hasIdiom");
  if (v69 != objc_msgSend(v4, "hasIdiom"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasIdiom](self, "hasIdiom"))
  {
    if (objc_msgSend(v4, "hasIdiom"))
    {
      idiom = self->_idiom;
      if (idiom != objc_msgSend(v4, "idiom"))
        goto LABEL_156;
    }
  }
  -[_INPBIntentMetadata intentDescription](self, "intentDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata intentDescription](self, "intentDescription");
  v71 = objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v72 = (void *)v71;
    -[_INPBIntentMetadata intentDescription](self, "intentDescription");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentDescription");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v73, "isEqual:", v74);

    if (!v75)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata intentId](self, "intentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata intentId](self, "intentId");
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v77 = (void *)v76;
    -[_INPBIntentMetadata intentId](self, "intentId");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentId");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v78, "isEqual:", v79);

    if (!v80)
      goto LABEL_156;
  }
  else
  {

  }
  v81 = -[_INPBIntentMetadata hasIsOwnedByCurrentUser](self, "hasIsOwnedByCurrentUser");
  if (v81 != objc_msgSend(v4, "hasIsOwnedByCurrentUser"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasIsOwnedByCurrentUser](self, "hasIsOwnedByCurrentUser"))
  {
    if (objc_msgSend(v4, "hasIsOwnedByCurrentUser"))
    {
      isOwnedByCurrentUser = self->_isOwnedByCurrentUser;
      if (isOwnedByCurrentUser != objc_msgSend(v4, "isOwnedByCurrentUser"))
        goto LABEL_156;
    }
  }
  v83 = -[_INPBIntentMetadata hasIsPrimaryDisplayDisabled](self, "hasIsPrimaryDisplayDisabled");
  if (v83 != objc_msgSend(v4, "hasIsPrimaryDisplayDisabled"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasIsPrimaryDisplayDisabled](self, "hasIsPrimaryDisplayDisabled"))
  {
    if (objc_msgSend(v4, "hasIsPrimaryDisplayDisabled"))
    {
      isPrimaryDisplayDisabled = self->_isPrimaryDisplayDisabled;
      if (isPrimaryDisplayDisabled != objc_msgSend(v4, "isPrimaryDisplayDisabled"))
        goto LABEL_156;
    }
  }
  -[_INPBIntentMetadata mediaRouteId](self, "mediaRouteId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaRouteId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata mediaRouteId](self, "mediaRouteId");
  v85 = objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v86 = (void *)v85;
    -[_INPBIntentMetadata mediaRouteId](self, "mediaRouteId");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaRouteId");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "isEqual:", v88);

    if (!v89)
      goto LABEL_156;
  }
  else
  {

  }
  v90 = -[_INPBIntentMetadata hasMsLimitReached](self, "hasMsLimitReached");
  if (v90 != objc_msgSend(v4, "hasMsLimitReached"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasMsLimitReached](self, "hasMsLimitReached"))
  {
    if (objc_msgSend(v4, "hasMsLimitReached"))
    {
      msLimitReached = self->_msLimitReached;
      if (msLimitReached != objc_msgSend(v4, "msLimitReached"))
        goto LABEL_156;
    }
  }
  -[_INPBIntentMetadata originatingDeviceIdsIdentifier](self, "originatingDeviceIdsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatingDeviceIdsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata originatingDeviceIdsIdentifier](self, "originatingDeviceIdsIdentifier");
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
    -[_INPBIntentMetadata originatingDeviceIdsIdentifier](self, "originatingDeviceIdsIdentifier");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originatingDeviceIdsIdentifier");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v94, "isEqual:", v95);

    if (!v96)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata originatingDeviceRapportEffectiveId](self, "originatingDeviceRapportEffectiveId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatingDeviceRapportEffectiveId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata originatingDeviceRapportEffectiveId](self, "originatingDeviceRapportEffectiveId");
  v97 = objc_claimAutoreleasedReturnValue();
  if (v97)
  {
    v98 = (void *)v97;
    -[_INPBIntentMetadata originatingDeviceRapportEffectiveId](self, "originatingDeviceRapportEffectiveId");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originatingDeviceRapportEffectiveId");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v99, "isEqual:", v100);

    if (!v101)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata originatingDeviceRapportMediaSystemId](self, "originatingDeviceRapportMediaSystemId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originatingDeviceRapportMediaSystemId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata originatingDeviceRapportMediaSystemId](self, "originatingDeviceRapportMediaSystemId");
  v102 = objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v103 = (void *)v102;
    -[_INPBIntentMetadata originatingDeviceRapportMediaSystemId](self, "originatingDeviceRapportMediaSystemId");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originatingDeviceRapportMediaSystemId");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v104, "isEqual:", v105);

    if (!v106)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata parameterImages](self, "parameterImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata parameterImages](self, "parameterImages");
  v107 = objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    v108 = (void *)v107;
    -[_INPBIntentMetadata parameterImages](self, "parameterImages");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterImages");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v109, "isEqual:", v110);

    if (!v111)
      goto LABEL_156;
  }
  else
  {

  }
  -[_INPBIntentMetadata preferredAudioOutputRouteId](self, "preferredAudioOutputRouteId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredAudioOutputRouteId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata preferredAudioOutputRouteId](self, "preferredAudioOutputRouteId");
  v112 = objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v113 = (void *)v112;
    -[_INPBIntentMetadata preferredAudioOutputRouteId](self, "preferredAudioOutputRouteId");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredAudioOutputRouteId");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v114, "isEqual:", v115);

    if (!v116)
      goto LABEL_156;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_156;
  v117 = -[_INPBIntentMetadata hasShowsWhenRun](self, "hasShowsWhenRun");
  if (v117 != objc_msgSend(v4, "hasShowsWhenRun"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasShowsWhenRun](self, "hasShowsWhenRun"))
  {
    if (objc_msgSend(v4, "hasShowsWhenRun"))
    {
      showsWhenRun = self->_showsWhenRun;
      if (showsWhenRun != objc_msgSend(v4, "showsWhenRun"))
        goto LABEL_156;
    }
  }
  -[_INPBIntentMetadata suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestedInvocationPhrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_155;
  -[_INPBIntentMetadata suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
  v119 = objc_claimAutoreleasedReturnValue();
  if (v119)
  {
    v120 = (void *)v119;
    -[_INPBIntentMetadata suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestedInvocationPhrase");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v121, "isEqual:", v122);

    if (!v123)
      goto LABEL_156;
  }
  else
  {

  }
  v124 = -[_INPBIntentMetadata hasTriggerMethod](self, "hasTriggerMethod");
  if (v124 != objc_msgSend(v4, "hasTriggerMethod"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasTriggerMethod](self, "hasTriggerMethod"))
  {
    if (objc_msgSend(v4, "hasTriggerMethod"))
    {
      triggerMethod = self->_triggerMethod;
      if (triggerMethod != objc_msgSend(v4, "triggerMethod"))
        goto LABEL_156;
    }
  }
  v126 = -[_INPBIntentMetadata hasUserConfirmationRequired](self, "hasUserConfirmationRequired");
  if (v126 != objc_msgSend(v4, "hasUserConfirmationRequired"))
    goto LABEL_156;
  if (-[_INPBIntentMetadata hasUserConfirmationRequired](self, "hasUserConfirmationRequired"))
  {
    if (objc_msgSend(v4, "hasUserConfirmationRequired"))
    {
      userConfirmationRequired = self->_userConfirmationRequired;
      if (userConfirmationRequired != objc_msgSend(v4, "userConfirmationRequired"))
        goto LABEL_156;
    }
  }
  -[_INPBIntentMetadata userUtterance](self, "userUtterance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userUtterance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_155:

    goto LABEL_156;
  }
  -[_INPBIntentMetadata userUtterance](self, "userUtterance");
  v128 = objc_claimAutoreleasedReturnValue();
  if (v128)
  {
    v129 = (void *)v128;
    -[_INPBIntentMetadata userUtterance](self, "userUtterance");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userUtterance");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v130, "isEqual:", v131);

    if (!v132)
      goto LABEL_156;
  }
  else
  {

  }
  v135 = -[_INPBIntentMetadata hasVersioningHash](self, "hasVersioningHash");
  if (v135 == objc_msgSend(v4, "hasVersioningHash"))
  {
    if (!-[_INPBIntentMetadata hasVersioningHash](self, "hasVersioningHash")
      || !objc_msgSend(v4, "hasVersioningHash")
      || (versioningHash = self->_versioningHash, versioningHash == objc_msgSend(v4, "versioningHash")))
    {
      v133 = 1;
      goto LABEL_157;
    }
  }
LABEL_156:
  v133 = 0;
LABEL_157:

  return v133;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  int v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  uint64_t v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_categoryVerb)
  {
    -[_INPBIntentMetadata categoryVerb](self, "categoryVerb");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_categoryVerb"));

  }
  -[_INPBIntentMetadata defaultImageValue](self, "defaultImageValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_defaultImageValue"));

  if (-[_INPBIntentMetadata hasExecutionContext](self, "hasExecutionContext"))
  {
    v8 = -[_INPBIntentMetadata executionContext](self, "executionContext");
    if ((v8 - 1) >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228A270[(v8 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("_executionContext"));

  }
  if (-[_INPBIntentMetadata hasIntentCategory](self, "hasIntentCategory"))
  {
    v10 = -[_INPBIntentMetadata intentCategory](self, "intentCategory");
    v11 = v10 - 1;
    if ((v10 - 1) < 0x15 && ((0x1FFDFFu >> v11) & 1) != 0)
    {
      v12 = off_1E228A2C0[v11];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("_intentCategory"));

  }
  if (self->_launchId)
  {
    -[_INPBIntentMetadata launchId](self, "launchId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("_launchId"));

  }
  if (self->_nanoLaunchId)
  {
    -[_INPBIntentMetadata nanoLaunchId](self, "nanoLaunchId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("_nanoLaunchId"));

  }
  if (self->_requiredEntitlements.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBIntentMetadata requiredEntitlementsCount](self, "requiredEntitlementsCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBIntentMetadata requiredEntitlementsCount](self, "requiredEntitlementsCount"))
    {
      v18 = 0;
      do
      {
        v19 = self->_requiredEntitlements.list[v18];
        if (v19 == 1)
        {
          v20 = CFSTR("CONTACTS");
        }
        else if (v19 == 2)
        {
          v20 = CFSTR("LOCATION");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requiredEntitlements.list[v18]);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "addObject:", v20);

        ++v18;
      }
      while (v18 < -[_INPBIntentMetadata requiredEntitlementsCount](self, "requiredEntitlementsCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("_requiredEntitlement"));

  }
  if (self->_systemExtensionBundleId)
  {
    -[_INPBIntentMetadata systemExtensionBundleId](self, "systemExtensionBundleId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("_systemExtensionBundleId"));

  }
  if (self->_systemUIExtensionBundleId)
  {
    -[_INPBIntentMetadata systemUIExtensionBundleId](self, "systemUIExtensionBundleId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("_systemUIExtensionBundleId"));

  }
  if (self->_airPlayRouteIds)
  {
    -[_INPBIntentMetadata airPlayRouteIds](self, "airPlayRouteIds");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("airPlayRouteIds"));

  }
  if (self->_auditTokenData)
  {
    -[_INPBIntentMetadata auditTokenData](self, "auditTokenData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("auditTokenData"));

  }
  if (-[_INPBIntentMetadata hasBackgroundLaunch](self, "hasBackgroundLaunch"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata backgroundLaunch](self, "backgroundLaunch"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("backgroundLaunch"));

  }
  if (-[_INPBIntentMetadata hasBypassAppProtectionAuthentication](self, "hasBypassAppProtectionAuthentication"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata bypassAppProtectionAuthentication](self, "bypassAppProtectionAuthentication"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("bypassAppProtectionAuthentication"));

  }
  if (-[_INPBIntentMetadata hasConfirmed](self, "hasConfirmed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata confirmed](self, "confirmed"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("confirmed"));

  }
  if (self->_endpointId)
  {
    -[_INPBIntentMetadata endpointId](self, "endpointId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("endpointId"));

  }
  if (-[_INPBIntentMetadata hasEndpointMediaPlaybackEnabled](self, "hasEndpointMediaPlaybackEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata endpointMediaPlaybackEnabled](self, "endpointMediaPlaybackEnabled"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("endpointMediaPlaybackEnabled"));

  }
  if (self->_forceNeedsValueForParameters)
  {
    -[_INPBIntentMetadata forceNeedsValueForParameters](self, "forceNeedsValueForParameters");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("forceNeedsValueForParameter"));

  }
  if (-[_INPBIntentMetadata hasIdiom](self, "hasIdiom"))
  {
    v37 = -[_INPBIntentMetadata idiom](self, "idiom");
    if ((v37 - 1) >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v37);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E228A368[(v37 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("idiom"));

  }
  if (self->_intentDescription)
  {
    -[_INPBIntentMetadata intentDescription](self, "intentDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("intentDescription"));

  }
  if (self->_intentId)
  {
    -[_INPBIntentMetadata intentId](self, "intentId");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("intent_id"));

  }
  if (-[_INPBIntentMetadata hasIsOwnedByCurrentUser](self, "hasIsOwnedByCurrentUser"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata isOwnedByCurrentUser](self, "isOwnedByCurrentUser"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("isOwnedByCurrentUser"));

  }
  if (-[_INPBIntentMetadata hasIsPrimaryDisplayDisabled](self, "hasIsPrimaryDisplayDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata isPrimaryDisplayDisabled](self, "isPrimaryDisplayDisabled"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("isPrimaryDisplayDisabled"));

  }
  if (self->_mediaRouteId)
  {
    -[_INPBIntentMetadata mediaRouteId](self, "mediaRouteId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("mediaRouteId"));

  }
  if (-[_INPBIntentMetadata hasMsLimitReached](self, "hasMsLimitReached"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata msLimitReached](self, "msLimitReached"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("msLimitReached"));

  }
  if (self->_originatingDeviceIdsIdentifier)
  {
    -[_INPBIntentMetadata originatingDeviceIdsIdentifier](self, "originatingDeviceIdsIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("originatingDeviceIdsIdentifier"));

  }
  if (self->_originatingDeviceRapportEffectiveId)
  {
    -[_INPBIntentMetadata originatingDeviceRapportEffectiveId](self, "originatingDeviceRapportEffectiveId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("originatingDeviceRapportEffectiveId"));

  }
  if (self->_originatingDeviceRapportMediaSystemId)
  {
    -[_INPBIntentMetadata originatingDeviceRapportMediaSystemId](self, "originatingDeviceRapportMediaSystemId");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("originatingDeviceRapportMediaSystemId"));

  }
  if (-[NSArray count](self->_parameterImages, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v55 = self->_parameterImages;
    v56 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v79 != v58)
            objc_enumerationMutation(v55);
          objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "dictionaryRepresentation");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v60);

        }
        v57 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
      }
      while (v57);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("parameterImages"));
  }
  if (self->_preferredAudioOutputRouteId)
  {
    -[_INPBIntentMetadata preferredAudioOutputRouteId](self, "preferredAudioOutputRouteId");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v61, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("preferredAudioOutputRouteId"));

  }
  if (self->_shortcutAvailabilities.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBIntentMetadata shortcutAvailabilitiesCount](self, "shortcutAvailabilitiesCount"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBIntentMetadata shortcutAvailabilitiesCount](self, "shortcutAvailabilitiesCount"))
    {
      v64 = 0;
      do
      {
        v65 = self->_shortcutAvailabilities.list[v64];
        if (v65 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_shortcutAvailabilities.list[v64]);
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v66 = off_1E228A3A0[v65];
        }
        objc_msgSend(v63, "addObject:", v66);

        ++v64;
      }
      while (v64 < -[_INPBIntentMetadata shortcutAvailabilitiesCount](self, "shortcutAvailabilitiesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("shortcutAvailability"));

  }
  if (-[_INPBIntentMetadata hasShowsWhenRun](self, "hasShowsWhenRun"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata showsWhenRun](self, "showsWhenRun"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("showsWhenRun"));

  }
  if (self->_suggestedInvocationPhrase)
  {
    -[_INPBIntentMetadata suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v68, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("suggestedInvocationPhrase"));

  }
  if (-[_INPBIntentMetadata hasTriggerMethod](self, "hasTriggerMethod"))
  {
    v70 = -[_INPBIntentMetadata triggerMethod](self, "triggerMethod");
    if ((int)v70 > 19)
    {
      if ((_DWORD)v70 == 20)
      {
        v71 = CFSTR("RemoteButton");
        goto LABEL_105;
      }
      if ((_DWORD)v70 == 30)
      {
        v71 = CFSTR("VoiceTrigger");
        goto LABEL_105;
      }
    }
    else
    {
      if (!(_DWORD)v70)
      {
        v71 = CFSTR("Other");
        goto LABEL_105;
      }
      if ((_DWORD)v70 == 10)
      {
        v71 = CFSTR("HomeButton");
LABEL_105:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("triggerMethod"));

        goto LABEL_106;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v70);
    v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_105;
  }
LABEL_106:
  if (-[_INPBIntentMetadata hasUserConfirmationRequired](self, "hasUserConfirmationRequired"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata userConfirmationRequired](self, "userConfirmationRequired"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("userConfirmationRequired"));

  }
  -[_INPBIntentMetadata userUtterance](self, "userUtterance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "dictionaryRepresentation");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("userUtterance"));

  if (-[_INPBIntentMetadata hasVersioningHash](self, "hasVersioningHash"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_INPBIntentMetadata versioningHash](self, "versioningHash"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("versioningHash"));

  }
  v76 = v3;

  return v76;
}

- (int)executionContext
{
  return self->_executionContext;
}

- (NSArray)airPlayRouteIds
{
  return self->_airPlayRouteIds;
}

- (BOOL)backgroundLaunch
{
  return self->_backgroundLaunch;
}

- (BOOL)bypassAppProtectionAuthentication
{
  return self->_bypassAppProtectionAuthentication;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (BOOL)endpointMediaPlaybackEnabled
{
  return self->_endpointMediaPlaybackEnabled;
}

- (NSArray)forceNeedsValueForParameters
{
  return self->_forceNeedsValueForParameters;
}

- (int)idiom
{
  return self->_idiom;
}

- (BOOL)isOwnedByCurrentUser
{
  return self->_isOwnedByCurrentUser;
}

- (BOOL)isPrimaryDisplayDisabled
{
  return self->_isPrimaryDisplayDisabled;
}

- (BOOL)msLimitReached
{
  return self->_msLimitReached;
}

- (BOOL)showsWhenRun
{
  return self->_showsWhenRun;
}

- (int)triggerMethod
{
  return self->_triggerMethod;
}

- (BOOL)userConfirmationRequired
{
  return self->_userConfirmationRequired;
}

- (unint64_t)versioningHash
{
  return self->_versioningHash;
}

+ (Class)parameterImagesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t i;
  id v94;
  void *v95;
  id v96;
  _INPBPair *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t j;
  id v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t k;
  id v122;
  void *v123;
  id v124;
  id v125;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v140 = a3;
  v7 = a4;
  v8 = a5;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v137 = v7;
    v9 = v8;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("categoryVerb"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v8;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v12, CFSTR("categoryVerb"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("launchId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v15, CFSTR("launchId"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("nanoLaunchId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v18, CFSTR("nanoLaunchId"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("systemExtensionBundleId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v21, CFSTR("systemExtensionBundleId"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("systemUIExtensionBundleId"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    v24 = v23;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v24, CFSTR("systemUIExtensionBundleId"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("intentDescription"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v27, CFSTR("intentDescription"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("intentId"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v30 = v29;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v30, CFSTR("intentId"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("originatingDeviceIdsIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v32 = v31;
      else
        v32 = 0;
    }
    else
    {
      v32 = 0;
    }
    v33 = v32;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v33, CFSTR("originatingDeviceIdsIdentifier"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("suggestedInvocationPhrase"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v35 = v34;
      else
        v35 = 0;
    }
    else
    {
      v35 = 0;
    }
    v36 = v35;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v36, CFSTR("suggestedInvocationPhrase"));
    v37 = objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("auditTokenData"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = v38;
      else
        v39 = 0;
    }
    else
    {
      v39 = 0;
    }
    v40 = v39;

    objc_msgSend(v140, "decodeObjectOfClass:from:", v37, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v41, CFSTR("auditTokenData"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endpointId"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v43 = v42;
      else
        v43 = 0;
    }
    else
    {
      v43 = 0;
    }
    v44 = v43;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v44, CFSTR("endpointId"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mediaRouteId"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v46 = v45;
      else
        v46 = 0;
    }
    else
    {
      v46 = 0;
    }
    v47 = v46;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v47, CFSTR("mediaRouteId"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("preferredAudioOutputRouteId"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v49 = v48;
      else
        v49 = 0;
    }
    else
    {
      v49 = 0;
    }
    v50 = v49;

    -[_INPBIntentMetadata if_setValueIfNonNil:forKey:](self, "if_setValueIfNonNil:forKey:", v50, CFSTR("preferredAudioOutputRouteId"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("msLimitReached"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v52 = v51;
      else
        v52 = 0;
    }
    else
    {
      v52 = 0;
    }
    v53 = v52;

    -[_INPBIntentMetadata setMsLimitReached:](self, "setMsLimitReached:", objc_msgSend(v53, "BOOLValue"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endpointMediaPlaybackEnabled"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v55 = v54;
      else
        v55 = 0;
    }
    else
    {
      v55 = 0;
    }
    v56 = v55;

    -[_INPBIntentMetadata setEndpointMediaPlaybackEnabled:](self, "setEndpointMediaPlaybackEnabled:", objc_msgSend(v56, "BOOLValue"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("userConfirmationRequired"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v58 = v57;
      else
        v58 = 0;
    }
    else
    {
      v58 = 0;
    }
    v59 = v58;

    -[_INPBIntentMetadata setUserConfirmationRequired:](self, "setUserConfirmationRequired:", objc_msgSend(v59, "BOOLValue"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("backgroundLaunch"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v61 = v60;
      else
        v61 = 0;
    }
    else
    {
      v61 = 0;
    }
    v62 = v61;

    -[_INPBIntentMetadata setBackgroundLaunch:](self, "setBackgroundLaunch:", objc_msgSend(v62, "BOOLValue"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("confirmed"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v64 = v63;
      else
        v64 = 0;
    }
    else
    {
      v64 = 0;
    }
    v65 = v64;

    -[_INPBIntentMetadata setConfirmed:](self, "setConfirmed:", objc_msgSend(v65, "BOOLValue"));
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("showsWhenRun"));
    v66 = (id)objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = v66;

        -[_INPBIntentMetadata setShowsWhenRun:](self, "setShowsWhenRun:", objc_msgSend(v66, "BOOLValue"));
      }
    }

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("executionContext"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v68 = v67;
      else
        v68 = 0;
    }
    else
    {
      v68 = 0;
    }
    v69 = v68;

    if (v69)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("executionContext"));
      v70 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v70, "isEqualToString:", CFSTR("ASSISTANT_DIALOG")) & 1) != 0)
      {
        v71 = 1;
      }
      else if ((objc_msgSend(v70, "isEqualToString:", CFSTR("ASSISTANT_VOICE_SHORTCUT")) & 1) != 0)
      {
        v71 = 2;
      }
      else if ((objc_msgSend(v70, "isEqualToString:", CFSTR("COVER_SHEET_PREDICTION")) & 1) != 0)
      {
        v71 = 3;
      }
      else if ((objc_msgSend(v70, "isEqualToString:", CFSTR("SPOTLIGHT_PREDICTION")) & 1) != 0)
      {
        v71 = 4;
      }
      else if ((objc_msgSend(v70, "isEqualToString:", CFSTR("SPOTLIGHT_SEARCH")) & 1) != 0)
      {
        v71 = 5;
      }
      else if ((objc_msgSend(v70, "isEqualToString:", CFSTR("MAPS")) & 1) != 0)
      {
        v71 = 6;
      }
      else if ((objc_msgSend(v70, "isEqualToString:", CFSTR("WORKFLOW")) & 1) != 0)
      {
        v71 = 7;
      }
      else if ((objc_msgSend(v70, "isEqualToString:", CFSTR("WATCH_FACE")) & 1) != 0)
      {
        v71 = 8;
      }
      else if ((objc_msgSend(v70, "isEqualToString:", CFSTR("ASSISTANT_VOICE_SHORTCUT_VIA_CLOUD_RELAY")) & 1) != 0)
      {
        v71 = 9;
      }
      else if (objc_msgSend(v70, "isEqualToString:", CFSTR("CARPLAY_HOME_SCREEN")))
      {
        v71 = 10;
      }
      else
      {
        v71 = 1;
      }

      -[_INPBIntentMetadata setExecutionContext:](self, "setExecutionContext:", v71);
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("intentCategory"), v135);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v73 = v72;
      else
        v73 = 0;
    }
    else
    {
      v73 = 0;
    }
    v74 = v73;

    v138 = v9;
    if (v74)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("intentCategory"));
      v75 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_INFORMATION")) & 1) != 0)
      {
        v76 = 1;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_PLAY_AUDIO")) & 1) != 0)
      {
        v76 = 2;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_PLAY_VIDEO")) & 1) != 0)
      {
        v76 = 3;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_ORDER")) & 1) != 0)
      {
        v76 = 4;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_NAVIGATION")) & 1) != 0)
      {
        v76 = 5;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_START")) & 1) != 0)
      {
        v76 = 6;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_SHARE")) & 1) != 0)
      {
        v76 = 7;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_CREATE")) & 1) != 0)
      {
        v76 = 8;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_SEARCH")) & 1) != 0)
      {
        v76 = 9;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_TOGGLE")) & 1) != 0)
      {
        v76 = 11;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_DOWNLOAD")) & 1) != 0)
      {
        v76 = 12;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_LOG")) & 1) != 0)
      {
        v76 = 13;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_CHECK_IN")) & 1) != 0)
      {
        v76 = 14;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_WORKFLOW")) & 1) != 0)
      {
        v76 = 15;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_REQUEST")) & 1) != 0)
      {
        v76 = 16;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_SET")) & 1) != 0)
      {
        v76 = 17;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_CALL_AUDIO")) & 1) != 0)
      {
        v76 = 18;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_CALL_VIDEO")) & 1) != 0)
      {
        v76 = 19;
      }
      else if ((objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_PLAY_SOUND")) & 1) != 0)
      {
        v76 = 20;
      }
      else if (objc_msgSend(v75, "isEqualToString:", CFSTR("CATEGORY_USER_ACTIVITY")))
      {
        v76 = 21;
      }
      else
      {
        v76 = 1;
      }

      -[_INPBIntentMetadata setIntentCategory:](self, "setIntentCategory:", v76);
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("triggerMethod"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v78 = v77;
      else
        v78 = 0;
    }
    else
    {
      v78 = 0;
    }
    v79 = v78;

    if (v79)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("triggerMethod"));
      v80 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v80, "isEqualToString:", CFSTR("Other")) & 1) != 0)
      {
        v81 = 0;
      }
      else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("HomeButton")) & 1) != 0)
      {
        v81 = 10;
      }
      else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("RemoteButton")) & 1) != 0)
      {
        v81 = 20;
      }
      else if (objc_msgSend(v80, "isEqualToString:", CFSTR("VoiceTrigger")))
      {
        v81 = 30;
      }
      else
      {
        v81 = 0;
      }

      -[_INPBIntentMetadata setTriggerMethod:](self, "setTriggerMethod:", v81);
    }
    v82 = objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("defaultImageValue"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "decodeObjectOfClass:from:", v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformToImageValue(v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INPBIntentMetadata setDefaultImageValue:](self, "setDefaultImageValue:", v85);

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("parameterImages"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v87 = v86;
      else
        v87 = 0;
    }
    else
    {
      v87 = 0;
    }
    v88 = v87;

    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    v139 = v88;
    objc_msgSend(v88, "allKeys");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v150, v156, 16);
    if (v90)
    {
      v91 = v90;
      v92 = *(_QWORD *)v151;
      do
      {
        for (i = 0; i != v91; ++i)
        {
          if (*(_QWORD *)v151 != v92)
            objc_enumerationMutation(v89);
          v94 = *(id *)(*((_QWORD *)&v150 + 1) + 8 * i);
          if (v94)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v95 = v94;
            else
              v95 = 0;
          }
          else
          {
            v95 = 0;
          }
          v96 = v95;

          if (v96)
          {
            v97 = objc_alloc_init(_INPBPair);
            -[_INPBPair setKey:](v97, "setKey:", v94);
            v98 = objc_opt_class();
            objc_msgSend(v139, "objectForKeyedSubscript:", v94);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "decodeObjectOfClass:from:", v98, v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            INIntentSlotValueTransformToImageValue(v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            -[_INPBPair addPairImageValue:](v97, "addPairImageValue:", v101);

            -[_INPBIntentMetadata addParameterImages:](self, "addParameterImages:", v97);
          }
        }
        v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v150, v156, 16);
      }
      while (v91);
    }

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("forceNeedsValueForParameters"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v103 = v102;
      else
        v103 = 0;
    }
    else
    {
      v103 = 0;
    }
    v104 = v103;

    v105 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v106 = v104;
    v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
    if (v107)
    {
      v108 = v107;
      v109 = *(_QWORD *)v147;
      do
      {
        for (j = 0; j != v108; ++j)
        {
          if (*(_QWORD *)v147 != v109)
            objc_enumerationMutation(v106);
          v111 = *(id *)(*((_QWORD *)&v146 + 1) + 8 * j);
          if (v111)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v112 = v111;
            else
              v112 = 0;
          }
          else
          {
            v112 = 0;
          }
          v113 = v112;

          objc_msgSend(v105, "if_addObjectIfNonNil:", v113);
        }
        v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v146, v155, 16);
      }
      while (v108);
    }

    -[_INPBIntentMetadata setForceNeedsValueForParameters:](self, "setForceNeedsValueForParameters:", v105);
    objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("requiredEntitlements"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (v114)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v115 = v114;
      else
        v115 = 0;
    }
    else
    {
      v115 = 0;
    }
    v116 = v115;

    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    v117 = v116;
    v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v142, v154, 16);
    if (v118)
    {
      v119 = v118;
      v120 = *(_QWORD *)v143;
      do
      {
        for (k = 0; k != v119; ++k)
        {
          if (*(_QWORD *)v143 != v120)
            objc_enumerationMutation(v117);
          v122 = *(id *)(*((_QWORD *)&v142 + 1) + 8 * k);
          if (v122)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v123 = v122;
            else
              v123 = 0;
          }
          else
          {
            v123 = 0;
          }
          v124 = v123;

          if (v124)
          {
            v125 = v122;
            if ((objc_msgSend(v125, "isEqualToString:", CFSTR("CONTACTS")) & 1) != 0)
            {
              v126 = 1;
            }
            else if (objc_msgSend(v125, "isEqualToString:", CFSTR("LOCATION")))
            {
              v126 = 2;
            }
            else
            {
              v126 = 1;
            }

            -[_INPBIntentMetadata addRequiredEntitlement:](self, "addRequiredEntitlement:", v126);
          }
        }
        v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v142, v154, 16);
      }
      while (v119);
    }

    objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("userUtterance"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    if (v127)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v128 = v127;
      else
        v128 = 0;
    }
    else
    {
      v128 = 0;
    }
    v129 = v128;

    INIntentSlotValueTransformToString(v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INPBIntentMetadata setUserUtterance:](self, "setUserUtterance:", v130);

    objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("versioningHash"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (v131)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v132 = v131;
      else
        v132 = 0;
    }
    else
    {
      v132 = 0;
    }
    v133 = v132;

    if (v133)
    {
      objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("versioningHash"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBIntentMetadata setVersioningHash:](self, "setVersioningHash:", objc_msgSend(v134, "unsignedLongLongValue"));

    }
    v8 = v136;
    v7 = v137;
  }
  else
  {

  }
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  int v25;
  __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _INPBIntentMetadata *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_INPBIntentMetadata categoryVerb](self, "categoryVerb");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v7, CFSTR("categoryVerb"));

  -[_INPBIntentMetadata launchId](self, "launchId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, CFSTR("launchId"));

  -[_INPBIntentMetadata nanoLaunchId](self, "nanoLaunchId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v9, CFSTR("nanoLaunchId"));

  -[_INPBIntentMetadata systemExtensionBundleId](self, "systemExtensionBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, CFSTR("systemExtensionBundleId"));

  -[_INPBIntentMetadata systemUIExtensionBundleId](self, "systemUIExtensionBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v11, CFSTR("systemUIExtensionBundleId"));

  -[_INPBIntentMetadata intentDescription](self, "intentDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, CFSTR("intentDescription"));

  -[_INPBIntentMetadata intentId](self, "intentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v13, CFSTR("intentId"));

  -[_INPBIntentMetadata originatingDeviceIdsIdentifier](self, "originatingDeviceIdsIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v14, CFSTR("originatingDeviceIdsIdentifier"));

  -[_INPBIntentMetadata suggestedInvocationPhrase](self, "suggestedInvocationPhrase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v15, CFSTR("suggestedInvocationPhrase"));

  -[_INPBIntentMetadata auditTokenData](self, "auditTokenData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v17, CFSTR("auditTokenData"));

  -[_INPBIntentMetadata endpointId](self, "endpointId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v18, CFSTR("endpointId"));

  -[_INPBIntentMetadata mediaRouteId](self, "mediaRouteId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v19, CFSTR("mediaRouteId"));

  -[_INPBIntentMetadata preferredAudioOutputRouteId](self, "preferredAudioOutputRouteId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v20, CFSTR("preferredAudioOutputRouteId"));

  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata msLimitReached](self, "msLimitReached"), CFSTR("msLimitReached"));
  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata endpointMediaPlaybackEnabled](self, "endpointMediaPlaybackEnabled"), CFSTR("endpointMediaPlaybackEnabled"));
  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata userConfirmationRequired](self, "userConfirmationRequired"), CFSTR("userConfirmationRequired"));
  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata backgroundLaunch](self, "backgroundLaunch"), CFSTR("backgroundLaunch"));
  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata confirmed](self, "confirmed"), CFSTR("confirmed"));
  if (-[_INPBIntentMetadata hasShowsWhenRun](self, "hasShowsWhenRun"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentMetadata showsWhenRun](self, "showsWhenRun"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v21, CFSTR("showsWhenRun"));

  }
  if (-[_INPBIntentMetadata hasExecutionContext](self, "hasExecutionContext"))
  {
    v22 = -[_INPBIntentMetadata executionContext](self, "executionContext");
    if ((v22 - 1) >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E228DF58[(v22 - 1)];
    }
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v23, CFSTR("executionContext"));

  }
  else
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("executionContext"));
  }
  if (-[_INPBIntentMetadata hasIntentCategory](self, "hasIntentCategory"))
  {
    v24 = -[_INPBIntentMetadata intentCategory](self, "intentCategory");
    v25 = v24 - 1;
    if ((v24 - 1) < 0x15 && ((0x1FFDFFu >> v25) & 1) != 0)
    {
      v26 = off_1E228DFA8[v25];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v24);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v26, CFSTR("intentCategory"));

  }
  else
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("intentCategory"));
  }
  if (!-[_INPBIntentMetadata hasTriggerMethod](self, "hasTriggerMethod"))
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, CFSTR("triggerMethod"));
    goto LABEL_29;
  }
  v27 = -[_INPBIntentMetadata triggerMethod](self, "triggerMethod");
  if ((int)v27 > 19)
  {
    if ((_DWORD)v27 == 20)
    {
      v28 = CFSTR("RemoteButton");
      goto LABEL_28;
    }
    if ((_DWORD)v27 == 30)
    {
      v28 = CFSTR("VoiceTrigger");
      goto LABEL_28;
    }
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v27);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (!(_DWORD)v27)
  {
    v28 = CFSTR("Other");
    goto LABEL_28;
  }
  if ((_DWORD)v27 != 10)
    goto LABEL_27;
  v28 = CFSTR("HomeButton");
LABEL_28:
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v28, CFSTR("triggerMethod"));

LABEL_29:
  -[_INPBIntentMetadata defaultImageValue](self, "defaultImageValue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromImageValue(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  objc_msgSend(v5, "encodeObject:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v6;
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v32, CFSTR("defaultImageValue"));

  v33 = (void *)MEMORY[0x1E0C99E08];
  -[_INPBIntentMetadata parameterImages](self, "parameterImages");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v62 = self;
  -[_INPBIntentMetadata parameterImages](self, "parameterImages");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v70 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v40, "pairImageValues");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "firstObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        INIntentSlotValueTransformFromImageValue(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "encodeObject:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "key");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "if_setObjectIfNonNil:forKey:", v44, v45);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v37);
  }

  if (objc_msgSend(v64, "count"))
    objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v64, CFSTR("parameterImages"));
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[_INPBIntentMetadata forceNeedsValueForParameters](v62, "forceNeedsValueForParameters");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v66 != v50)
          objc_enumerationMutation(v47);
        objc_msgSend(v31, "encodeObject:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "if_addObjectIfNonNil:", v52);

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v49);
  }

  if (objc_msgSend(v46, "count"))
    objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v46, CFSTR("forceNeedsValueForParameters"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBIntentMetadata requiredEntitlementsCount](v62, "requiredEntitlementsCount"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBIntentMetadata requiredEntitlementsCount](v62, "requiredEntitlementsCount"))
  {
    v54 = 0;
    do
    {
      v55 = -[_INPBIntentMetadata requiredEntitlementAtIndex:](v62, "requiredEntitlementAtIndex:", v54);
      if ((_DWORD)v55 == 1)
      {
        v56 = CFSTR("CONTACTS");
      }
      else if ((_DWORD)v55 == 2)
      {
        v56 = CFSTR("LOCATION");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v55);
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v53, "addObject:", v56);

      ++v54;
    }
    while (v54 < -[_INPBIntentMetadata requiredEntitlementsCount](v62, "requiredEntitlementsCount"));
  }
  if (objc_msgSend(v53, "count"))
    objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v53, CFSTR("requiredEntitlements"));
  -[_INPBIntentMetadata userUtterance](v62, "userUtterance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v58, CFSTR("userUtterance"));

  if (-[_INPBIntentMetadata hasVersioningHash](v62, "hasVersioningHash"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_INPBIntentMetadata versioningHash](v62, "versioningHash"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v59, CFSTR("versioningHash"));

  }
  v60 = (void *)objc_msgSend(v63, "copy");

  return v60;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  id v9;
  _INPBIntentMetadata *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_INPBIntentMetadata);
  -[_INPBIntentMetadata _intents_decodeWithJSONDecoder:codableDescription:from:](v10, "_intents_decodeWithJSONDecoder:codableDescription:from:", v9, v8, v7);

  return v10;
}

@end
