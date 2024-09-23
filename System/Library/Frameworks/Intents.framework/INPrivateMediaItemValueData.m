@implementation INPrivateMediaItemValueData

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 mediaSubItems:(id)a5
{
  return -[INPrivateMediaItemValueData initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:mediaSubItems:](self, "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:mediaSubItems:", a3, a4, 0, 0, a5);
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 mediaSubItems:(id)a7
{
  return -[INPrivateMediaItemValueData initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:mediaSubItems:](self, "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:mediaSubItems:", a3, a4, a5, a6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, a7);
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 mediaSubItems:(id)a14
{
  return -[INPrivateMediaItemValueData initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:mediaSubItems:](self, "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:mediaSubItems:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0, 0, 0, a14);
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 internalSignals:(id)a14 mediaSubItems:(id)a15
{
  return -[INPrivateMediaItemValueData initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:mediaSubItems:](self, "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:mediaSubItems:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, 0, 0, a15);
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 internalSignals:(id)a14 ampConfidenceScore:(id)a15 ampConfidenceLevel:(int64_t)a16 pegasusMetaData:(id)a17 mediaSubItems:(id)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  INPrivateMediaItemValueData *v35;
  uint64_t v36;
  NSString *recommendationId;
  uint64_t v38;
  NSString *assetInfo;
  uint64_t v40;
  NSString *sharedUserIdFromPlayableMusicAccount;
  uint64_t v42;
  NSString *punchoutURI;
  uint64_t v44;
  NSNumber *requiresSubscription;
  uint64_t v46;
  NSString *provider;
  uint64_t v48;
  NSNumber *isAvailable;
  uint64_t v50;
  NSNumber *isHardBan;
  uint64_t v52;
  NSString *bundleId;
  uint64_t v54;
  NSString *universalResourceLink;
  uint64_t v56;
  NSString *providerAppName;
  uint64_t v58;
  NSArray *internalSignals;
  uint64_t v60;
  NSNumber *ampConfidenceScore;
  uint64_t v62;
  NSData *pegasusMetaData;
  uint64_t v64;
  NSArray *mediaSubItems;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  objc_super v74;

  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v73 = a7;
  v72 = a8;
  v27 = v26;
  v71 = a9;
  v28 = v25;
  v70 = a10;
  v29 = v24;
  v69 = a11;
  v68 = a12;
  v30 = a13;
  v31 = a14;
  v32 = a15;
  v33 = a17;
  v34 = a18;
  v74.receiver = self;
  v74.super_class = (Class)INPrivateMediaItemValueData;
  v35 = -[INPrivateMediaItemValueData init](&v74, sel_init);
  if (v35)
  {
    v36 = objc_msgSend(v23, "copy");
    recommendationId = v35->_recommendationId;
    v35->_recommendationId = (NSString *)v36;

    v38 = objc_msgSend(v29, "copy");
    assetInfo = v35->_assetInfo;
    v35->_assetInfo = (NSString *)v38;

    v40 = objc_msgSend(v28, "copy");
    sharedUserIdFromPlayableMusicAccount = v35->_sharedUserIdFromPlayableMusicAccount;
    v35->_sharedUserIdFromPlayableMusicAccount = (NSString *)v40;

    v42 = objc_msgSend(v27, "copy");
    punchoutURI = v35->_punchoutURI;
    v35->_punchoutURI = (NSString *)v42;

    v44 = objc_msgSend(v73, "copy");
    requiresSubscription = v35->_requiresSubscription;
    v35->_requiresSubscription = (NSNumber *)v44;

    v46 = objc_msgSend(v72, "copy");
    provider = v35->_provider;
    v35->_provider = (NSString *)v46;

    v48 = objc_msgSend(v71, "copy");
    isAvailable = v35->_isAvailable;
    v35->_isAvailable = (NSNumber *)v48;

    v50 = objc_msgSend(v70, "copy");
    isHardBan = v35->_isHardBan;
    v35->_isHardBan = (NSNumber *)v50;

    v52 = objc_msgSend(v69, "copy");
    bundleId = v35->_bundleId;
    v35->_bundleId = (NSString *)v52;

    v54 = objc_msgSend(v68, "copy");
    universalResourceLink = v35->_universalResourceLink;
    v35->_universalResourceLink = (NSString *)v54;

    v56 = objc_msgSend(v30, "copy");
    providerAppName = v35->_providerAppName;
    v35->_providerAppName = (NSString *)v56;

    v58 = objc_msgSend(v31, "copy");
    internalSignals = v35->_internalSignals;
    v35->_internalSignals = (NSArray *)v58;

    v60 = objc_msgSend(v32, "copy");
    ampConfidenceScore = v35->_ampConfidenceScore;
    v35->_ampConfidenceScore = (NSNumber *)v60;

    v35->_ampConfidenceLevel = a16;
    v62 = objc_msgSend(v33, "copy");
    pegasusMetaData = v35->_pegasusMetaData;
    v35->_pegasusMetaData = (NSData *)v62;

    v64 = objc_msgSend(v34, "copy");
    mediaSubItems = v35->_mediaSubItems;
    v35->_mediaSubItems = (NSArray *)v64;

  }
  return v35;
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 internalSignals:(id)a14 ampConfidenceScore:(id)a15 ampConfidenceLevel:(int64_t)a16 mediaSubItems:(id)a17
{
  return -[INPrivateMediaItemValueData initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:](self, "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 0,
           a17);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v3 = -[NSString hash](self->_recommendationId, "hash");
  v4 = -[NSString hash](self->_assetInfo, "hash") ^ v3;
  v5 = -[NSString hash](self->_sharedUserIdFromPlayableMusicAccount, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_punchoutURI, "hash");
  v7 = -[NSNumber hash](self->_requiresSubscription, "hash");
  v8 = v7 ^ -[NSString hash](self->_provider, "hash");
  v9 = v6 ^ v8 ^ -[NSNumber hash](self->_isAvailable, "hash");
  v10 = -[NSNumber hash](self->_isHardBan, "hash");
  v11 = v10 ^ -[NSString hash](self->_bundleId, "hash");
  v12 = v11 ^ -[NSString hash](self->_universalResourceLink, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_providerAppName, "hash");
  v14 = -[NSArray hash](self->_internalSignals, "hash");
  v15 = v14 ^ -[NSNumber hash](self->_ampConfidenceScore, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_ampConfidenceLevel);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  v18 = v13 ^ v17 ^ -[NSData hash](self->_pegasusMetaData, "hash");
  v19 = v18 ^ -[NSArray hash](self->_mediaSubItems, "hash");

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  INPrivateMediaItemValueData *v4;
  INPrivateMediaItemValueData *v5;
  NSString *recommendationId;
  NSString *assetInfo;
  NSString *sharedUserIdFromPlayableMusicAccount;
  NSString *punchoutURI;
  NSNumber *requiresSubscription;
  NSString *provider;
  NSNumber *isAvailable;
  NSNumber *isHardBan;
  NSString *bundleId;
  NSString *universalResourceLink;
  NSString *providerAppName;
  NSArray *internalSignals;
  NSNumber *ampConfidenceScore;
  NSData *pegasusMetaData;
  NSArray *mediaSubItems;
  BOOL v21;

  v4 = (INPrivateMediaItemValueData *)a3;
  if (v4 == self)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      recommendationId = self->_recommendationId;
      if (recommendationId != v5->_recommendationId
        && !-[NSString isEqual:](recommendationId, "isEqual:"))
      {
        goto LABEL_37;
      }
      assetInfo = self->_assetInfo;
      if (assetInfo != v5->_assetInfo && !-[NSString isEqual:](assetInfo, "isEqual:"))
        goto LABEL_37;
      sharedUserIdFromPlayableMusicAccount = self->_sharedUserIdFromPlayableMusicAccount;
      if (sharedUserIdFromPlayableMusicAccount != v5->_sharedUserIdFromPlayableMusicAccount
        && !-[NSString isEqual:](sharedUserIdFromPlayableMusicAccount, "isEqual:"))
      {
        goto LABEL_37;
      }
      punchoutURI = self->_punchoutURI;
      if (punchoutURI != v5->_punchoutURI && !-[NSString isEqual:](punchoutURI, "isEqual:"))
        goto LABEL_37;
      requiresSubscription = self->_requiresSubscription;
      if (requiresSubscription != v5->_requiresSubscription
        && !-[NSNumber isEqual:](requiresSubscription, "isEqual:"))
      {
        goto LABEL_37;
      }
      provider = self->_provider;
      if (provider != v5->_provider && !-[NSString isEqual:](provider, "isEqual:"))
        goto LABEL_37;
      isAvailable = self->_isAvailable;
      if (isAvailable != v5->_isAvailable && !-[NSNumber isEqual:](isAvailable, "isEqual:"))
        goto LABEL_37;
      isHardBan = self->_isHardBan;
      if (isHardBan != v5->_isHardBan && !-[NSNumber isEqual:](isHardBan, "isEqual:"))
        goto LABEL_37;
      if (((bundleId = self->_bundleId, bundleId == v5->_bundleId)
         || -[NSString isEqual:](bundleId, "isEqual:"))
        && ((universalResourceLink = self->_universalResourceLink, universalResourceLink == v5->_universalResourceLink)
         || -[NSString isEqual:](universalResourceLink, "isEqual:"))
        && ((providerAppName = self->_providerAppName, providerAppName == v5->_providerAppName)
         || -[NSString isEqual:](providerAppName, "isEqual:"))
        && ((internalSignals = self->_internalSignals, internalSignals == v5->_internalSignals)
         || -[NSArray isEqual:](internalSignals, "isEqual:"))
        && ((ampConfidenceScore = self->_ampConfidenceScore, ampConfidenceScore == v5->_ampConfidenceScore)
         || -[NSNumber isEqual:](ampConfidenceScore, "isEqual:"))
        && self->_ampConfidenceLevel == v5->_ampConfidenceLevel
        && ((pegasusMetaData = self->_pegasusMetaData, pegasusMetaData == v5->_pegasusMetaData)
         || -[NSData isEqual:](pegasusMetaData, "isEqual:"))
        && ((mediaSubItems = self->_mediaSubItems, mediaSubItems == v5->_mediaSubItems)
         || -[NSArray isEqual:](mediaSubItems, "isEqual:")))
      {
        v21 = 1;
      }
      else
      {
LABEL_37:
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (INPrivateMediaItemValueData)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  INPrivateMediaItemValueData *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("recommendationId"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("assetInfo"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("sharedUserIdFromPlayableMusicAccount"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("punchoutURI"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiresSubscription"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("provider"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAvailable"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isHardBan"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("bundleId"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("universalResourceLink"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("providerAppName"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0C99E60];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v54[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWithArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("internalSignals"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ampConfidenceScore"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ampConfidenceLevel"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pegasusMetaData"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0C99E60];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWithArray:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("mediaSubItems"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = -[INPrivateMediaItemValueData initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:](self, "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:", v52, v51, v50, v49, v46, v45, v44, v43, v42, v41, v28, v40, v32, v33, v34,
          v38);

  return v48;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *recommendationId;
  id v5;

  recommendationId = self->_recommendationId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recommendationId, CFSTR("recommendationId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetInfo, CFSTR("assetInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedUserIdFromPlayableMusicAccount, CFSTR("sharedUserIdFromPlayableMusicAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_punchoutURI, CFSTR("punchoutURI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requiresSubscription, CFSTR("requiresSubscription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provider, CFSTR("provider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isAvailable, CFSTR("isAvailable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isHardBan, CFSTR("isHardBan"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleId, CFSTR("bundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_universalResourceLink, CFSTR("universalResourceLink"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerAppName, CFSTR("providerAppName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_internalSignals, CFSTR("internalSignals"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ampConfidenceScore, CFSTR("ampConfidenceScore"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_ampConfidenceLevel, CFSTR("ampConfidenceLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pegasusMetaData, CFSTR("pegasusMetaData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaSubItems, CFSTR("mediaSubItems"));

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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_recommendationId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("recommendationId"));

  objc_msgSend(v6, "encodeObject:", self->_assetInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("assetInfo"));

  objc_msgSend(v6, "encodeObject:", self->_sharedUserIdFromPlayableMusicAccount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("sharedUserIdFromPlayableMusicAccount"));

  objc_msgSend(v6, "encodeObject:", self->_punchoutURI);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("punchoutURI"));

  objc_msgSend(v6, "encodeObject:", self->_requiresSubscription);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("requiresSubscription"));

  objc_msgSend(v6, "encodeObject:", self->_provider);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("provider"));

  objc_msgSend(v6, "encodeObject:", self->_isAvailable);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("isAvailable"));

  objc_msgSend(v6, "encodeObject:", self->_isHardBan);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("isHardBan"));

  objc_msgSend(v6, "encodeObject:", self->_bundleId);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("bundleId"));

  objc_msgSend(v6, "encodeObject:", self->_universalResourceLink);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("universalResourceLink"));

  objc_msgSend(v6, "encodeObject:", self->_providerAppName);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, CFSTR("providerAppName"));

  objc_msgSend(v6, "encodeObject:", self->_internalSignals);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("internalSignals"));

  objc_msgSend(v6, "encodeObject:", self->_ampConfidenceScore);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, CFSTR("ampConfidenceScore"));

  v21 = self->_ampConfidenceLevel - 1;
  if (v21 > 2)
    v22 = CFSTR("unknown");
  else
    v22 = off_1E2294A40[v21];
  v23 = v22;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, CFSTR("ampConfidenceLevel"));

  objc_msgSend(v6, "encodeObject:", self->_pegasusMetaData);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, CFSTR("pegasusMetaData"));

  objc_msgSend(v6, "encodeObject:", self->_mediaSubItems);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, CFSTR("mediaSubItems"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPrivateMediaItemValueData descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPrivateMediaItemValueData;
  -[INPrivateMediaItemValueData description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPrivateMediaItemValueData _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t recommendationId;
  uint64_t assetInfo;
  uint64_t sharedUserIdFromPlayableMusicAccount;
  uint64_t punchoutURI;
  uint64_t requiresSubscription;
  uint64_t provider;
  uint64_t isAvailable;
  uint64_t isHardBan;
  uint64_t bundleId;
  NSString *universalResourceLink;
  uint64_t v13;
  NSString *providerAppName;
  uint64_t v15;
  NSArray *internalSignals;
  uint64_t v17;
  NSNumber *ampConfidenceScore;
  void *v19;
  void *v20;
  NSData *pegasusMetaData;
  void *v22;
  NSArray *mediaSubItems;
  void *v24;
  uint64_t v26;
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
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[16];
  _QWORD v50[18];

  v50[16] = *MEMORY[0x1E0C80C00];
  recommendationId = (uint64_t)self->_recommendationId;
  v48 = recommendationId;
  v49[0] = CFSTR("recommendationId");
  if (!recommendationId)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    recommendationId = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)recommendationId;
  v50[0] = recommendationId;
  v49[1] = CFSTR("assetInfo");
  assetInfo = (uint64_t)self->_assetInfo;
  v47 = assetInfo;
  if (!assetInfo)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    assetInfo = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)assetInfo;
  v50[1] = assetInfo;
  v49[2] = CFSTR("sharedUserIdFromPlayableMusicAccount");
  sharedUserIdFromPlayableMusicAccount = (uint64_t)self->_sharedUserIdFromPlayableMusicAccount;
  v46 = sharedUserIdFromPlayableMusicAccount;
  if (!sharedUserIdFromPlayableMusicAccount)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    sharedUserIdFromPlayableMusicAccount = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)sharedUserIdFromPlayableMusicAccount;
  v50[2] = sharedUserIdFromPlayableMusicAccount;
  v49[3] = CFSTR("punchoutURI");
  punchoutURI = (uint64_t)self->_punchoutURI;
  v45 = punchoutURI;
  if (!punchoutURI)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    punchoutURI = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)punchoutURI;
  v50[3] = punchoutURI;
  v49[4] = CFSTR("requiresSubscription");
  requiresSubscription = (uint64_t)self->_requiresSubscription;
  v44 = requiresSubscription;
  if (!requiresSubscription)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    requiresSubscription = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)requiresSubscription;
  v50[4] = requiresSubscription;
  v49[5] = CFSTR("provider");
  provider = (uint64_t)self->_provider;
  v43 = provider;
  if (!provider)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    provider = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)provider;
  v50[5] = provider;
  v49[6] = CFSTR("isAvailable");
  isAvailable = (uint64_t)self->_isAvailable;
  v42 = isAvailable;
  if (!isAvailable)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    isAvailable = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)isAvailable;
  v50[6] = isAvailable;
  v49[7] = CFSTR("isHardBan");
  isHardBan = (uint64_t)self->_isHardBan;
  v41 = isHardBan;
  if (!isHardBan)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    isHardBan = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)isHardBan;
  v50[7] = isHardBan;
  v49[8] = CFSTR("bundleId");
  bundleId = (uint64_t)self->_bundleId;
  v40 = bundleId;
  if (!bundleId)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    bundleId = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)bundleId;
  v50[8] = bundleId;
  v49[9] = CFSTR("universalResourceLink");
  universalResourceLink = self->_universalResourceLink;
  v13 = (uint64_t)universalResourceLink;
  if (!universalResourceLink)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v13;
  v50[9] = v13;
  v49[10] = CFSTR("providerAppName");
  providerAppName = self->_providerAppName;
  v15 = (uint64_t)providerAppName;
  if (!providerAppName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v15;
  v50[10] = v15;
  v49[11] = CFSTR("internalSignals");
  internalSignals = self->_internalSignals;
  v17 = (uint64_t)internalSignals;
  if (!internalSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v26 = v17;
  v50[11] = v17;
  v49[12] = CFSTR("ampConfidenceScore");
  ampConfidenceScore = self->_ampConfidenceScore;
  v19 = ampConfidenceScore;
  if (!ampConfidenceScore)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v17, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50[12] = v19;
  v49[13] = CFSTR("ampConfidenceLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_ampConfidenceLevel, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50[13] = v20;
  v49[14] = CFSTR("pegasusMetaData");
  pegasusMetaData = self->_pegasusMetaData;
  v22 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50[14] = v22;
  v49[15] = CFSTR("mediaSubItems");
  mediaSubItems = self->_mediaSubItems;
  v24 = mediaSubItems;
  if (!mediaSubItems)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50[15] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 16);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (mediaSubItems)
  {
    if (pegasusMetaData)
      goto LABEL_33;
  }
  else
  {

    if (pegasusMetaData)
      goto LABEL_33;
  }

LABEL_33:
  if (ampConfidenceScore)
  {
    if (internalSignals)
      goto LABEL_35;
  }
  else
  {

    if (internalSignals)
    {
LABEL_35:
      if (providerAppName)
        goto LABEL_36;
LABEL_60:

      if (universalResourceLink)
        goto LABEL_37;
      goto LABEL_61;
    }
  }

  if (!providerAppName)
    goto LABEL_60;
LABEL_36:
  if (universalResourceLink)
    goto LABEL_37;
LABEL_61:

LABEL_37:
  if (!v40)

  if (!v41)
  if (!v42)

  if (!v43)
  if (!v44)

  if (!v45)
  if (!v46)

  if (!v47)
  if (!v48)

  return v39;
}

- (NSString)recommendationId
{
  return self->_recommendationId;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (NSString)sharedUserIdFromPlayableMusicAccount
{
  return self->_sharedUserIdFromPlayableMusicAccount;
}

- (NSString)punchoutURI
{
  return self->_punchoutURI;
}

- (NSNumber)requiresSubscription
{
  return self->_requiresSubscription;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSNumber)isAvailable
{
  return self->_isAvailable;
}

- (NSNumber)isHardBan
{
  return self->_isHardBan;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)universalResourceLink
{
  return self->_universalResourceLink;
}

- (NSString)providerAppName
{
  return self->_providerAppName;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (NSNumber)ampConfidenceScore
{
  return self->_ampConfidenceScore;
}

- (int64_t)ampConfidenceLevel
{
  return self->_ampConfidenceLevel;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (NSArray)mediaSubItems
{
  return self->_mediaSubItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSubItems, 0);
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_ampConfidenceScore, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_providerAppName, 0);
  objc_storeStrong((id *)&self->_universalResourceLink, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_isHardBan, 0);
  objc_storeStrong((id *)&self->_isAvailable, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_requiresSubscription, 0);
  objc_storeStrong((id *)&self->_punchoutURI, 0);
  objc_storeStrong((id *)&self->_sharedUserIdFromPlayableMusicAccount, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
  objc_storeStrong((id *)&self->_recommendationId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
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

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("recommendationId"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("assetInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sharedUserIdFromPlayableMusicAccount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("punchoutURI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("requiresSubscription"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("provider"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isAvailable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isHardBan"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("universalResourceLink"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("providerAppName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("internalSignals"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ampConfidenceScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ampConfidenceLevel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = INMediaConfidenceLevelWithString(v12);

    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pegasusMetaData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v14, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mediaSubItems"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:", v31, v28, v30, v29, v27, v25, v26, v24, v23, v22, v9, v10, v11, v13, v21,
                    v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
