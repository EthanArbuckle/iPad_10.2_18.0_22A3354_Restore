@implementation INPrivateMediaIntentData

- (INPrivateMediaIntentData)initWithSpeakerIDInfo:(id)a3 proxiedThirdPartyAppInfo:(id)a4 isAppAttributionRequired:(id)a5 useDialogMemoryForAttribution:(id)a6 isAppCorrection:(id)a7 fallbackUsername:(id)a8 wholeHouseAudioMetadata:(id)a9 nlConfidenceScore:(id)a10 nlConfidenceLevel:(int64_t)a11 asrConfidenceScore:(id)a12 asrConfidenceLevel:(int64_t)a13
{
  return -[INPrivateMediaIntentData initWithSpeakerIDInfo:proxiedThirdPartyAppInfo:isAppAttributionRequired:useDialogMemoryForAttribution:isAppCorrection:fallbackUsername:wholeHouseAudioMetadata:nlConfidenceScore:nlConfidenceLevel:asrConfidenceScore:asrConfidenceLevel:resolvedSharedUserID:homeAutomationEntityProvider:](self, "initWithSpeakerIDInfo:proxiedThirdPartyAppInfo:isAppAttributionRequired:useDialogMemoryForAttribution:isAppCorrection:fallbackUsername:wholeHouseAudioMetadata:nlConfidenceScore:nlConfidenceLevel:asrConfidenceScore:asrConfidenceLevel:resolvedSharedUserID:homeAutomationEntityProvider:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0, 0);
}

- (INPrivateMediaIntentData)initWithSpeakerIDInfo:(id)a3 proxiedThirdPartyAppInfo:(id)a4 isAppAttributionRequired:(id)a5 useDialogMemoryForAttribution:(id)a6 isAppCorrection:(id)a7 fallbackUsername:(id)a8 wholeHouseAudioMetadata:(id)a9 nlConfidenceScore:(id)a10 nlConfidenceLevel:(int64_t)a11 asrConfidenceScore:(id)a12 asrConfidenceLevel:(int64_t)a13 resolvedSharedUserID:(id)a14
{
  return -[INPrivateMediaIntentData initWithSpeakerIDInfo:proxiedThirdPartyAppInfo:isAppAttributionRequired:useDialogMemoryForAttribution:isAppCorrection:fallbackUsername:wholeHouseAudioMetadata:nlConfidenceScore:nlConfidenceLevel:asrConfidenceScore:asrConfidenceLevel:resolvedSharedUserID:homeAutomationEntityProvider:](self, "initWithSpeakerIDInfo:proxiedThirdPartyAppInfo:isAppAttributionRequired:useDialogMemoryForAttribution:isAppCorrection:fallbackUsername:wholeHouseAudioMetadata:nlConfidenceScore:nlConfidenceLevel:asrConfidenceScore:asrConfidenceLevel:resolvedSharedUserID:homeAutomationEntityProvider:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, 0);
}

- (INPrivateMediaIntentData)initWithSpeakerIDInfo:(id)a3 proxiedThirdPartyAppInfo:(id)a4 isAppAttributionRequired:(id)a5 useDialogMemoryForAttribution:(id)a6 isAppCorrection:(id)a7 fallbackUsername:(id)a8 wholeHouseAudioMetadata:(id)a9 nlConfidenceScore:(id)a10 nlConfidenceLevel:(int64_t)a11 asrConfidenceScore:(id)a12 asrConfidenceLevel:(int64_t)a13 resolvedSharedUserID:(id)a14 homeAutomationEntityProvider:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  INPrivateMediaIntentData *v28;
  uint64_t v29;
  INSpeakerIDInfo *speakerIDInfo;
  uint64_t v31;
  INAppIdentifier *proxiedThirdPartyAppInfo;
  uint64_t v33;
  NSNumber *isAppAttributionRequired;
  uint64_t v35;
  NSNumber *useDialogMemoryForAttribution;
  uint64_t v37;
  NSNumber *isAppCorrection;
  uint64_t v39;
  NSString *fallbackUsername;
  uint64_t v41;
  INWholeHouseAudioMetadata *wholeHouseAudioMetadata;
  uint64_t v43;
  NSNumber *nlConfidenceScore;
  uint64_t v45;
  NSNumber *asrConfidenceScore;
  uint64_t v47;
  NSString *resolvedSharedUserID;
  uint64_t v49;
  INHomeAutomationEntityProvider *homeAutomationEntityProvider;
  id v53;
  id v54;
  id v55;
  objc_super v56;

  v20 = a3;
  v21 = a4;
  v55 = a5;
  v54 = a6;
  v53 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a12;
  v26 = a14;
  v27 = a15;
  v56.receiver = self;
  v56.super_class = (Class)INPrivateMediaIntentData;
  v28 = -[INPrivateMediaIntentData init](&v56, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v20, "copy");
    speakerIDInfo = v28->_speakerIDInfo;
    v28->_speakerIDInfo = (INSpeakerIDInfo *)v29;

    v31 = objc_msgSend(v21, "copy");
    proxiedThirdPartyAppInfo = v28->_proxiedThirdPartyAppInfo;
    v28->_proxiedThirdPartyAppInfo = (INAppIdentifier *)v31;

    v33 = objc_msgSend(v55, "copy");
    isAppAttributionRequired = v28->_isAppAttributionRequired;
    v28->_isAppAttributionRequired = (NSNumber *)v33;

    v35 = objc_msgSend(v54, "copy");
    useDialogMemoryForAttribution = v28->_useDialogMemoryForAttribution;
    v28->_useDialogMemoryForAttribution = (NSNumber *)v35;

    v37 = objc_msgSend(v53, "copy");
    isAppCorrection = v28->_isAppCorrection;
    v28->_isAppCorrection = (NSNumber *)v37;

    v39 = objc_msgSend(v22, "copy");
    fallbackUsername = v28->_fallbackUsername;
    v28->_fallbackUsername = (NSString *)v39;

    v41 = objc_msgSend(v23, "copy");
    wholeHouseAudioMetadata = v28->_wholeHouseAudioMetadata;
    v28->_wholeHouseAudioMetadata = (INWholeHouseAudioMetadata *)v41;

    v43 = objc_msgSend(v24, "copy");
    nlConfidenceScore = v28->_nlConfidenceScore;
    v28->_nlConfidenceScore = (NSNumber *)v43;

    v28->_nlConfidenceLevel = a11;
    v45 = objc_msgSend(v25, "copy");
    asrConfidenceScore = v28->_asrConfidenceScore;
    v28->_asrConfidenceScore = (NSNumber *)v45;

    v28->_asrConfidenceLevel = a13;
    v47 = objc_msgSend(v26, "copy");
    resolvedSharedUserID = v28->_resolvedSharedUserID;
    v28->_resolvedSharedUserID = (NSString *)v47;

    v49 = objc_msgSend(v27, "copy");
    homeAutomationEntityProvider = v28->_homeAutomationEntityProvider;
    v28->_homeAutomationEntityProvider = (INHomeAutomationEntityProvider *)v49;

  }
  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSUInteger v16;
  unint64_t v17;

  v3 = -[INSpeakerIDInfo hash](self->_speakerIDInfo, "hash");
  v4 = -[INAppIdentifier hash](self->_proxiedThirdPartyAppInfo, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_isAppAttributionRequired, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_useDialogMemoryForAttribution, "hash");
  v7 = -[NSNumber hash](self->_isAppCorrection, "hash");
  v8 = v7 ^ -[NSString hash](self->_fallbackUsername, "hash");
  v9 = v6 ^ v8 ^ -[INWholeHouseAudioMetadata hash](self->_wholeHouseAudioMetadata, "hash");
  v10 = -[NSNumber hash](self->_nlConfidenceScore, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_nlConfidenceLevel);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9 ^ v10 ^ objc_msgSend(v11, "hash");
  v13 = -[NSNumber hash](self->_asrConfidenceScore, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_asrConfidenceLevel);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  v16 = v12 ^ v15 ^ -[NSString hash](self->_resolvedSharedUserID, "hash");
  v17 = v16 ^ -[INHomeAutomationEntityProvider hash](self->_homeAutomationEntityProvider, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  INPrivateMediaIntentData *v4;
  INPrivateMediaIntentData *v5;
  INSpeakerIDInfo *speakerIDInfo;
  INAppIdentifier *proxiedThirdPartyAppInfo;
  NSNumber *isAppAttributionRequired;
  NSNumber *useDialogMemoryForAttribution;
  NSNumber *isAppCorrection;
  NSString *fallbackUsername;
  INWholeHouseAudioMetadata *wholeHouseAudioMetadata;
  NSNumber *nlConfidenceScore;
  NSNumber *asrConfidenceScore;
  NSString *resolvedSharedUserID;
  INHomeAutomationEntityProvider *homeAutomationEntityProvider;
  BOOL v17;

  v4 = (INPrivateMediaIntentData *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      speakerIDInfo = self->_speakerIDInfo;
      if (speakerIDInfo != v5->_speakerIDInfo && !-[INSpeakerIDInfo isEqual:](speakerIDInfo, "isEqual:"))
        goto LABEL_30;
      proxiedThirdPartyAppInfo = self->_proxiedThirdPartyAppInfo;
      if (proxiedThirdPartyAppInfo != v5->_proxiedThirdPartyAppInfo
        && !-[INAppIdentifier isEqual:](proxiedThirdPartyAppInfo, "isEqual:"))
      {
        goto LABEL_30;
      }
      isAppAttributionRequired = self->_isAppAttributionRequired;
      if (isAppAttributionRequired != v5->_isAppAttributionRequired
        && !-[NSNumber isEqual:](isAppAttributionRequired, "isEqual:"))
      {
        goto LABEL_30;
      }
      useDialogMemoryForAttribution = self->_useDialogMemoryForAttribution;
      if (useDialogMemoryForAttribution != v5->_useDialogMemoryForAttribution
        && !-[NSNumber isEqual:](useDialogMemoryForAttribution, "isEqual:"))
      {
        goto LABEL_30;
      }
      if (((isAppCorrection = self->_isAppCorrection, isAppCorrection == v5->_isAppCorrection)
         || -[NSNumber isEqual:](isAppCorrection, "isEqual:"))
        && ((fallbackUsername = self->_fallbackUsername, fallbackUsername == v5->_fallbackUsername)
         || -[NSString isEqual:](fallbackUsername, "isEqual:"))
        && ((wholeHouseAudioMetadata = self->_wholeHouseAudioMetadata,
             wholeHouseAudioMetadata == v5->_wholeHouseAudioMetadata)
         || -[INWholeHouseAudioMetadata isEqual:](wholeHouseAudioMetadata, "isEqual:"))
        && ((nlConfidenceScore = self->_nlConfidenceScore, nlConfidenceScore == v5->_nlConfidenceScore)
         || -[NSNumber isEqual:](nlConfidenceScore, "isEqual:"))
        && self->_nlConfidenceLevel == v5->_nlConfidenceLevel
        && ((asrConfidenceScore = self->_asrConfidenceScore, asrConfidenceScore == v5->_asrConfidenceScore)
         || -[NSNumber isEqual:](asrConfidenceScore, "isEqual:"))
        && self->_asrConfidenceLevel == v5->_asrConfidenceLevel
        && ((resolvedSharedUserID = self->_resolvedSharedUserID, resolvedSharedUserID == v5->_resolvedSharedUserID)
         || -[NSString isEqual:](resolvedSharedUserID, "isEqual:"))
        && ((homeAutomationEntityProvider = self->_homeAutomationEntityProvider,
             homeAutomationEntityProvider == v5->_homeAutomationEntityProvider)
         || -[INHomeAutomationEntityProvider isEqual:](homeAutomationEntityProvider, "isEqual:")))
      {
        v17 = 1;
      }
      else
      {
LABEL_30:
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (INPrivateMediaIntentData)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  INPrivateMediaIntentData *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speakerIDInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxiedThirdPartyAppInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAppAttributionRequired"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useDialogMemoryForAttribution"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAppCorrection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackUsername"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wholeHouseAudioMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nlConfidenceScore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("nlConfidenceLevel"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asrConfidenceScore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("asrConfidenceLevel"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolvedSharedUserID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeAutomationEntityProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[INPrivateMediaIntentData initWithSpeakerIDInfo:proxiedThirdPartyAppInfo:isAppAttributionRequired:useDialogMemoryForAttribution:isAppCorrection:fallbackUsername:wholeHouseAudioMetadata:nlConfidenceScore:nlConfidenceLevel:asrConfidenceScore:asrConfidenceLevel:resolvedSharedUserID:homeAutomationEntityProvider:](self, "initWithSpeakerIDInfo:proxiedThirdPartyAppInfo:isAppAttributionRequired:useDialogMemoryForAttribution:isAppCorrection:fallbackUsername:wholeHouseAudioMetadata:nlConfidenceScore:nlConfidenceLevel:asrConfidenceScore:asrConfidenceLevel:resolvedSharedUserID:homeAutomationEntityProvider:", v19, v14, v4, v16, v5, v15, v6, v7, v8, v9, v10, v11, v12);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakerIDInfo *speakerIDInfo;
  id v5;

  speakerIDInfo = self->_speakerIDInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", speakerIDInfo, CFSTR("speakerIDInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedThirdPartyAppInfo, CFSTR("proxiedThirdPartyAppInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isAppAttributionRequired, CFSTR("isAppAttributionRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_useDialogMemoryForAttribution, CFSTR("useDialogMemoryForAttribution"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isAppCorrection, CFSTR("isAppCorrection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fallbackUsername, CFSTR("fallbackUsername"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wholeHouseAudioMetadata, CFSTR("wholeHouseAudioMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nlConfidenceScore, CFSTR("nlConfidenceScore"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_nlConfidenceLevel, CFSTR("nlConfidenceLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_asrConfidenceScore, CFSTR("asrConfidenceScore"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_asrConfidenceLevel, CFSTR("asrConfidenceLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resolvedSharedUserID, CFSTR("resolvedSharedUserID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeAutomationEntityProvider, CFSTR("homeAutomationEntityProvider"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
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
  unint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_speakerIDInfo);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("speakerIDInfo"));

  objc_msgSend(v6, "encodeObject:", self->_proxiedThirdPartyAppInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("proxiedThirdPartyAppInfo"));

  objc_msgSend(v6, "encodeObject:", self->_isAppAttributionRequired);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("isAppAttributionRequired"));

  objc_msgSend(v6, "encodeObject:", self->_useDialogMemoryForAttribution);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("useDialogMemoryForAttribution"));

  objc_msgSend(v6, "encodeObject:", self->_isAppCorrection);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("isAppCorrection"));

  objc_msgSend(v6, "encodeObject:", self->_fallbackUsername);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("fallbackUsername"));

  objc_msgSend(v6, "encodeObject:", self->_wholeHouseAudioMetadata);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("wholeHouseAudioMetadata"));

  objc_msgSend(v6, "encodeObject:", self->_nlConfidenceScore);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("nlConfidenceScore"));

  v16 = self->_nlConfidenceLevel - 1;
  if (v16 > 2)
    v17 = CFSTR("unknown");
  else
    v17 = off_1E2294A40[v16];
  v18 = v17;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, CFSTR("nlConfidenceLevel"));

  objc_msgSend(v6, "encodeObject:", self->_asrConfidenceScore);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("asrConfidenceScore"));

  v20 = self->_asrConfidenceLevel - 1;
  if (v20 > 2)
    v21 = CFSTR("unknown");
  else
    v21 = off_1E2294A40[v20];
  v22 = v21;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, CFSTR("asrConfidenceLevel"));

  objc_msgSend(v6, "encodeObject:", self->_resolvedSharedUserID);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, CFSTR("resolvedSharedUserID"));

  objc_msgSend(v6, "encodeObject:", self->_homeAutomationEntityProvider);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, CFSTR("homeAutomationEntityProvider"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPrivateMediaIntentData descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INPrivateMediaIntentData;
  -[INPrivateMediaIntentData description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPrivateMediaIntentData _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t speakerIDInfo;
  uint64_t proxiedThirdPartyAppInfo;
  uint64_t isAppAttributionRequired;
  uint64_t useDialogMemoryForAttribution;
  uint64_t isAppCorrection;
  uint64_t fallbackUsername;
  INWholeHouseAudioMetadata *wholeHouseAudioMetadata;
  uint64_t v10;
  NSNumber *nlConfidenceScore;
  uint64_t v12;
  void *v13;
  NSNumber *asrConfidenceScore;
  void *v15;
  void *v16;
  NSString *resolvedSharedUserID;
  void *v18;
  INHomeAutomationEntityProvider *homeAutomationEntityProvider;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[13];
  _QWORD v38[15];

  v38[13] = *MEMORY[0x1E0C80C00];
  speakerIDInfo = (uint64_t)self->_speakerIDInfo;
  v36 = speakerIDInfo;
  v37[0] = CFSTR("speakerIDInfo");
  if (!speakerIDInfo)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    speakerIDInfo = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)speakerIDInfo;
  v38[0] = speakerIDInfo;
  v37[1] = CFSTR("proxiedThirdPartyAppInfo");
  proxiedThirdPartyAppInfo = (uint64_t)self->_proxiedThirdPartyAppInfo;
  v35 = proxiedThirdPartyAppInfo;
  if (!proxiedThirdPartyAppInfo)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    proxiedThirdPartyAppInfo = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)proxiedThirdPartyAppInfo;
  v38[1] = proxiedThirdPartyAppInfo;
  v37[2] = CFSTR("isAppAttributionRequired");
  isAppAttributionRequired = (uint64_t)self->_isAppAttributionRequired;
  v34 = isAppAttributionRequired;
  if (!isAppAttributionRequired)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    isAppAttributionRequired = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)isAppAttributionRequired;
  v38[2] = isAppAttributionRequired;
  v37[3] = CFSTR("useDialogMemoryForAttribution");
  useDialogMemoryForAttribution = (uint64_t)self->_useDialogMemoryForAttribution;
  v33 = useDialogMemoryForAttribution;
  if (!useDialogMemoryForAttribution)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    useDialogMemoryForAttribution = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)useDialogMemoryForAttribution;
  v38[3] = useDialogMemoryForAttribution;
  v37[4] = CFSTR("isAppCorrection");
  isAppCorrection = (uint64_t)self->_isAppCorrection;
  v32 = isAppCorrection;
  if (!isAppCorrection)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    isAppCorrection = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)isAppCorrection;
  v38[4] = isAppCorrection;
  v37[5] = CFSTR("fallbackUsername");
  fallbackUsername = (uint64_t)self->_fallbackUsername;
  v31 = fallbackUsername;
  if (!fallbackUsername)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    fallbackUsername = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)fallbackUsername;
  v38[5] = fallbackUsername;
  v37[6] = CFSTR("wholeHouseAudioMetadata");
  wholeHouseAudioMetadata = self->_wholeHouseAudioMetadata;
  v10 = (uint64_t)wholeHouseAudioMetadata;
  if (!wholeHouseAudioMetadata)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v10;
  v38[6] = v10;
  v37[7] = CFSTR("nlConfidenceScore");
  nlConfidenceScore = self->_nlConfidenceScore;
  v12 = (uint64_t)nlConfidenceScore;
  if (!nlConfidenceScore)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v12;
  v38[7] = v12;
  v37[8] = CFSTR("nlConfidenceLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_nlConfidenceLevel);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v13;
  v37[9] = CFSTR("asrConfidenceScore");
  asrConfidenceScore = self->_asrConfidenceScore;
  v15 = asrConfidenceScore;
  if (!asrConfidenceScore)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[9] = v15;
  v37[10] = CFSTR("asrConfidenceLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_asrConfidenceLevel);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v16;
  v37[11] = CFSTR("resolvedSharedUserID");
  resolvedSharedUserID = self->_resolvedSharedUserID;
  v18 = resolvedSharedUserID;
  if (!resolvedSharedUserID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[11] = v18;
  v37[12] = CFSTR("homeAutomationEntityProvider");
  homeAutomationEntityProvider = self->_homeAutomationEntityProvider;
  v20 = homeAutomationEntityProvider;
  if (!homeAutomationEntityProvider)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[12] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 13);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (homeAutomationEntityProvider)
  {
    if (resolvedSharedUserID)
      goto LABEL_25;
  }
  else
  {

    if (resolvedSharedUserID)
      goto LABEL_25;
  }

LABEL_25:
  if (!asrConfidenceScore)

  if (nlConfidenceScore)
  {
    if (wholeHouseAudioMetadata)
      goto LABEL_29;
  }
  else
  {

    if (wholeHouseAudioMetadata)
      goto LABEL_29;
  }

LABEL_29:
  if (!v31)

  if (!v32)
  if (!v33)

  if (!v34)
  if (!v35)

  if (!v36)
  return v30;
}

- (INSpeakerIDInfo)speakerIDInfo
{
  return self->_speakerIDInfo;
}

- (void)setSpeakerIDInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (INAppIdentifier)proxiedThirdPartyAppInfo
{
  return self->_proxiedThirdPartyAppInfo;
}

- (void)setProxiedThirdPartyAppInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)isAppAttributionRequired
{
  return self->_isAppAttributionRequired;
}

- (void)setIsAppAttributionRequired:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)useDialogMemoryForAttribution
{
  return self->_useDialogMemoryForAttribution;
}

- (void)setUseDialogMemoryForAttribution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)isAppCorrection
{
  return self->_isAppCorrection;
}

- (NSString)fallbackUsername
{
  return self->_fallbackUsername;
}

- (void)setFallbackUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (INWholeHouseAudioMetadata)wholeHouseAudioMetadata
{
  return self->_wholeHouseAudioMetadata;
}

- (NSNumber)nlConfidenceScore
{
  return self->_nlConfidenceScore;
}

- (int64_t)nlConfidenceLevel
{
  return self->_nlConfidenceLevel;
}

- (NSNumber)asrConfidenceScore
{
  return self->_asrConfidenceScore;
}

- (int64_t)asrConfidenceLevel
{
  return self->_asrConfidenceLevel;
}

- (NSString)resolvedSharedUserID
{
  return self->_resolvedSharedUserID;
}

- (void)setResolvedSharedUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (INHomeAutomationEntityProvider)homeAutomationEntityProvider
{
  return self->_homeAutomationEntityProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAutomationEntityProvider, 0);
  objc_storeStrong((id *)&self->_resolvedSharedUserID, 0);
  objc_storeStrong((id *)&self->_asrConfidenceScore, 0);
  objc_storeStrong((id *)&self->_nlConfidenceScore, 0);
  objc_storeStrong((id *)&self->_wholeHouseAudioMetadata, 0);
  objc_storeStrong((id *)&self->_fallbackUsername, 0);
  objc_storeStrong((id *)&self->_isAppCorrection, 0);
  objc_storeStrong((id *)&self->_useDialogMemoryForAttribution, 0);
  objc_storeStrong((id *)&self->_isAppAttributionRequired, 0);
  objc_storeStrong((id *)&self->_proxiedThirdPartyAppInfo, 0);
  objc_storeStrong((id *)&self->_speakerIDInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = (objc_class *)a1;
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("speakerIDInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("proxiedThirdPartyAppInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v11, v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isAppAttributionRequired"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("useDialogMemoryForAttribution"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isAppCorrection"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fallbackUsername"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("wholeHouseAudioMetadata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nlConfidenceScore"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nlConfidenceLevel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = INMediaConfidenceLevelWithString(v17);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asrConfidenceScore"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("asrConfidenceLevel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = INMediaConfidenceLevelWithString(v19);

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("resolvedSharedUserID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("homeAutomationEntityProvider"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)objc_msgSend([v32 alloc], "initWithSpeakerIDInfo:proxiedThirdPartyAppInfo:isAppAttributionRequired:useDialogMemoryForAttribution:isAppCorrection:fallbackUsername:wholeHouseAudioMetadata:nlConfidenceScore:nlConfidenceLevel:asrConfidenceScore:asrConfidenceLevel:resolvedSharedUserID:homeAutomationEntityProvider:", v38, v37, v36, v35, v34, v33, v30, v31, v18, v29, v20, v23, v26);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

@end
