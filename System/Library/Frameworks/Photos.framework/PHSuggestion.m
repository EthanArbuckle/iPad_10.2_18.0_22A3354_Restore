@implementation PHSuggestion

- (id)localizedSubtitle
{
  return self->_subtitle;
}

- (id)creationDate
{
  return self->_creationDate;
}

- (unint64_t)estimatedAssetCount
{
  return self->_approximateCount;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_approximatePhotosCount;
}

- (unint64_t)estimatedVideosCount
{
  return self->_approximateVideosCount;
}

- (PHSuggestion)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHSuggestion *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  __int16 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDate *creationDate;
  uint64_t v22;
  NSDate *startDate;
  uint64_t v24;
  NSDate *endDate;
  uint64_t v26;
  NSDate *activationDate;
  uint64_t v28;
  NSDate *relevantUntilDate;
  uint64_t v30;
  NSDate *expungeDate;
  uint64_t v32;
  NSData *actionData;
  uint64_t v34;
  NSData *featuresData;
  uint64_t v36;
  NSString *subtitle;
  uint64_t v38;
  NSString *context;
  uint64_t v40;
  NSString *relatedCollectionUUID;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v48;

  v8 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PHSuggestion;
  v9 = -[PHAssetCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v48, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (unsigned __int16)objc_msgSend(v10, "integerValue");
    if ((v11 - 1) >= 0xA)
      LOWORD(v11) = 0;
    v9->_type = v11;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtype"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_subtype = PHSuggestionSubtypeForCPLSuggestionSubtype((unsigned __int16)objc_msgSend(v12, "integerValue"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (unsigned __int16)objc_msgSend(v13, "integerValue");
    if ((v14 - 1) >= 4)
      LOWORD(v14) = 0;
    v9->_state = v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("notificationState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (unsigned __int16)objc_msgSend(v15, "integerValue");
    if (v16 == 2)
      v17 = 2;
    else
      v17 = v16 == 1;
    v9->_notificationState = v17;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("featuredState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_featuredState = (unsigned __int16)objc_msgSend(v18, "integerValue") != 0;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_version = objc_msgSend(v19, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v20;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    startDate = v9->super._startDate;
    v9->super._startDate = (NSDate *)v22;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    endDate = v9->super._endDate;
    v9->super._endDate = (NSDate *)v24;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activationDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    activationDate = v9->_activationDate;
    v9->_activationDate = (NSDate *)v26;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("relevantUntilDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    relevantUntilDate = v9->_relevantUntilDate;
    v9->_relevantUntilDate = (NSDate *)v28;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("expungeDate"));
    v30 = objc_claimAutoreleasedReturnValue();
    expungeDate = v9->_expungeDate;
    v9->_expungeDate = (NSDate *)v30;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("actionData"));
    v32 = objc_claimAutoreleasedReturnValue();
    actionData = v9->_actionData;
    v9->_actionData = (NSData *)v32;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("featuresData"));
    v34 = objc_claimAutoreleasedReturnValue();
    featuresData = v9->_featuresData;
    v9->_featuresData = (NSData *)v34;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v36 = objc_claimAutoreleasedReturnValue();
    subtitle = v9->_subtitle;
    v9->_subtitle = (NSString *)v36;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("suggestionContext"));
    v38 = objc_claimAutoreleasedReturnValue();
    context = v9->_context;
    v9->_context = (NSString *)v38;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("relatedCollectionUUID"));
    v40 = objc_claimAutoreleasedReturnValue();
    relatedCollectionUUID = v9->_relatedCollectionUUID;
    v9->_relatedCollectionUUID = (NSString *)v40;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cachedCount"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_approximateCount = objc_msgSend(v42, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cachedPhotosCount"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_approximatePhotosCount = objc_msgSend(v43, "integerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cachedVideosCount"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_approximateVideosCount = objc_msgSend(v44, "integerValue");

    v9->super._assetCollectionType = 8;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sharingComposition"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_sharingComposition = objc_msgSend(v45, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("availableFeatures"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_availableFeatures = objc_msgSend(v46, "unsignedIntegerValue");

  }
  return v9;
}

- (id)predicateForAllAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D71B60];
  -[PHObject objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContextForCurrentQueueQoS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForAllAssetsInSuggestion:managedObjectContext:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)predicateForAllMomentsFromRepresentativeAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D71B60];
  -[PHObject objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContextForCurrentQueueQoS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForAllMomentsFromRepresentativeAssetsInSuggestion:managedObjectContext:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)actionProperties
{
  NSDictionary *actionProperties;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSData *actionData;
  NSDictionary *v12;
  id v13;
  NSDictionary *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  actionProperties = self->_actionProperties;
  if (actionProperties)
    return actionProperties;
  if (!self->_actionData)
  {
    actionProperties = 0;
    return actionProperties;
  }
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  actionData = self->_actionData;
  v16 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v10, actionData, &v16);
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  v14 = self->_actionProperties;
  self->_actionProperties = v12;

  if (!self->_actionProperties)
  {
    self->_actionProperties = (NSDictionary *)MEMORY[0x1E0C9AA70];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unarchiving actionData from Suggestion: %@", buf, 0xCu);
    }
  }

  return self->_actionProperties;
}

- (NSDictionary)featuresProperties
{
  NSDictionary *featuresProperties;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSData *featuresData;
  NSDictionary *v13;
  id v14;
  NSDictionary *v15;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  featuresProperties = self->_featuresProperties;
  if (featuresProperties)
    return featuresProperties;
  if (!self->_featuresData)
  {
    featuresProperties = 0;
    return featuresProperties;
  }
  v17 = (void *)MEMORY[0x1E0CB3710];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  featuresData = self->_featuresData;
  v18 = 0;
  objc_msgSend(v17, "unarchivedObjectOfClasses:fromData:error:", v11, featuresData, &v18);
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v14 = v18;
  v15 = self->_featuresProperties;
  self->_featuresProperties = v13;

  if (!self->_featuresProperties)
  {
    self->_featuresProperties = (NSDictionary *)MEMORY[0x1E0C9AA70];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v14;
      _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unarchiving featuresData from Suggestion: %@", buf, 0xCu);
    }
  }

  return self->_featuresProperties;
}

- (NSString)relatedCollectionUUID
{
  void *v4;

  if (-[PHSuggestion type](self, "type") <= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSuggestion.m"), 676, CFSTR("%s cannot be called on %hu type Suggestion"), "-[PHSuggestion relatedCollectionUUID]", -[PHSuggestion type](self, "type"));

  }
  return self->_relatedCollectionUUID;
}

- (id)description
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PHSuggestion;
  -[PHAssetCollection description](&v20, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PHSuggestion type](self, "type") - 1;
  if (v4 > 9)
    v5 = CFSTR("Unknown Type");
  else
    v5 = off_1E35DDBA8[(unsigned __int16)v4];
  PHSuggestionStringWithSubtype(-[PHSuggestion subtype](self, "subtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PHSuggestion state](self, "state");
  if (v7 > 4)
    v8 = CFSTR("Unknown State");
  else
    v8 = off_1E35DDBF8[v7];
  v9 = -[PHSuggestion notificationState](self, "notificationState");
  v10 = CFSTR("Unknown State");
  if (v9 <= 2)
    v10 = off_1E35DDC20[v9];
  v11 = -[PHSuggestion featuredState](self, "featuredState");
  v12 = CFSTR("Currently Featured");
  if (v11 != 1)
    v12 = CFSTR("Unknown State");
  if (!v11)
    v12 = CFSTR("Not Featured");
  v13 = v12;
  v14 = -[PHSuggestion version](self, "version");
  -[PHSuggestion creationDate](self, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSuggestion relevantUntilDate](self, "relevantUntilDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSuggestion activationDate](self, "activationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", type: %@, subtype: %@, state: %@, notificationState: %@, featuredState: %@ version: %ld, created: %@, onlyRelevantUntil: %@, activationDate: %@"), v5, v6, v8, v10, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[PHSuggestion description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHSuggestion actionProperties](self, "actionProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nactionProperties: %@"), v6);

  -[PHSuggestion featuresProperties](self, "featuresProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nfeaturesProperties: %@"), v7);

  return v5;
}

- (BOOL)containsUnverifiedPersons
{
  void *v2;
  void *v3;

  -[PHSuggestion featuresProperties](self, "featuresProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("containsUnverifiedPersons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (id)assets
{
  NSArray *assets;
  objc_super v4;

  assets = self->_assets;
  if (assets)
    return assets;
  v4.receiver = self;
  v4.super_class = (Class)PHSuggestion;
  -[PHAssetCollection assets](&v4, sel_assets);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)notificationState
{
  return self->_notificationState;
}

- (unsigned)featuredState
{
  return self->_featuredState;
}

- (unint64_t)availableFeatures
{
  return self->_availableFeatures;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)context
{
  return self->_context;
}

- (NSDate)activationDate
{
  return self->_activationDate;
}

- (NSDate)relevantUntilDate
{
  return self->_relevantUntilDate;
}

- (NSDate)expungeDate
{
  return self->_expungeDate;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_expungeDate, 0);
  objc_storeStrong((id *)&self->_relevantUntilDate, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_featuresProperties, 0);
  objc_storeStrong((id *)&self->_actionProperties, 0);
  objc_storeStrong((id *)&self->_relatedCollectionUUID, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_featuresData, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PHSuggestion_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_33716 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_33716, block);
  return (id)propertiesToFetchWithHint__array_33717;
}

+ (id)managedEntityName
{
  return CFSTR("Suggestion");
}

+ (id)localIdentifierWithUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "identifierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/L0/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHSuggestion");
  return CFSTR("PHSuggestion");
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 1;
}

+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    *(_QWORD *)&a3 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("sharingComposition"), a3, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)identifierCode
{
  return CFSTR("160");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_33702;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PHSuggestion_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_33693 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_33693, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_33694, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (double)lifetimeAfterBecomingActive
{
  return 5184000.0;
}

+ (id)predicateForAllFeaturedStateEnabledSuggestionTypesForWidget
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "allFeaturedStateEnabledSuggestionTypesForWidget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("type"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "allFeaturedStateEnabledSuggestionTypesForWallpaper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("type"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allTopWallpaperSuggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E36574F8);
}

+ (id)allShuffleWallpaperSuggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3657510);
}

+ (id)allShuffleWallpaperAlbumSuggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3657528);
}

+ (id)allAmbientSuggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3657540);
}

+ (id)allCollectionSuggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3657558);
}

+ (BOOL)hasPersonLocalIdentifierInContextForSuggestionSubype:(unsigned __int16)a3
{
  BOOL result;

  result = 1;
  if ((a3 - 602) > 0x33 || ((1 << (a3 - 90)) & 0xC000000000003) == 0)
    return (a3 - 803) < 2;
  return result;
}

+ (id)predicateForAllTopWallpaperSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("type"), 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "allTopWallpaperSuggestionSubtypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("subtype"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForAllShuffleWallpaperSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("type"), 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "allShuffleWallpaperSuggestionSubtypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("subtype"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForAllShuffleWallpaperAlbumSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("type"), 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "allShuffleWallpaperAlbumSuggestionSubtypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("subtype"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForAllAmbientSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("type"), 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "allAmbientSuggestionSubtypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("subtype"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)allFeaturedStateEnabledSuggestionTypes
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "allFeaturedStateEnabledSuggestionTypesForWidget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend(a1, "allFeaturedStateEnabledSuggestionTypesForWallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

+ (id)allFeaturedStateEnabledSuggestionTypesForWidget
{
  return &unk_1E3657570;
}

+ (id)allFeaturedStateEnabledSuggestionTypesForWallpaper
{
  return &unk_1E3657588;
}

+ (id)fetchSuggestionsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_33683);
}

+ (id)fetchSuggestionsWithState:(unsigned __int16)a3 withOptions:(id)a4
{
  _QWORD v5[4];
  unsigned __int16 v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PHSuggestion_fetchSuggestionsWithState_withOptions___block_invoke;
  v5[3] = &__block_descriptor_34_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v6 = a3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchSuggestionsWithState:(unsigned __int16)a3 ofType:(unsigned __int16)a4 withOptions:(id)a5
{
  _QWORD v6[4];
  unsigned __int16 v7;
  unsigned __int16 v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PHSuggestion_fetchSuggestionsWithState_ofType_withOptions___block_invoke;
  v6[3] = &__block_descriptor_36_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v7 = a3;
  v8 = a4;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchSuggestionsWithState:(unsigned __int16)a3 ofType:(unsigned __int16)a4 subtype:(unsigned __int16)a5 withOptions:(id)a6
{
  _QWORD v7[4];
  unsigned __int16 v8;
  unsigned __int16 v9;
  unsigned __int16 v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PHSuggestion_fetchSuggestionsWithState_ofType_subtype_withOptions___block_invoke;
  v7[3] = &__block_descriptor_38_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchAllFeaturedStateEnabledSuggestionsWithOptions:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PHSuggestion_fetchAllFeaturedStateEnabledSuggestionsWithOptions___block_invoke;
  v4[3] = &__block_descriptor_40_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v4[4] = a1;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchWidgetSuggestionsWithFeaturedState:(unsigned __int16)a3 withOptions:(id)a4
{
  _QWORD v5[5];
  unsigned __int16 v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PHSuggestion_fetchWidgetSuggestionsWithFeaturedState_withOptions___block_invoke;
  v5[3] = &__block_descriptor_42_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v5[4] = a1;
  v6 = a3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchWallpaperSuggestionsWithFeaturedState:(unsigned __int16)a3 withOptions:(id)a4
{
  _QWORD v5[5];
  unsigned __int16 v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PHSuggestion_fetchWallpaperSuggestionsWithFeaturedState_withOptions___block_invoke;
  v5[3] = &__block_descriptor_42_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v5[4] = a1;
  v6 = a3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchRecentInterestSuggestionsForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "allFeaturedStateEnabledSuggestionTypesForWidget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K IN (%@)"), CFSTR("type"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v9);

  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForAssetCollectionsContainingAssets:withType:options:](PHQuery, "queryForAssetCollectionsContainingAssets:withType:options:", v10, 8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "executeQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)transientSuggestionWithInfo:(id)a3 photoLibrary:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  PHSuggestion *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *assets;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("uuid"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("type"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subtype"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("subtype"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("title"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("subtitle"));
  v34 = (void *)v11;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("context"));
  v15 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v15;
  if (v15)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("suggestionContext"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relatedCollectionUUID"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:");
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relatedCollectionUUID"));
    v28 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("creationDate"), v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("creationDate"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("universalStartDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("startDate"));
  v31 = (void *)v14;
  v32 = (void *)v13;
  v33 = (void *)v12;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("universalEndDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("endDate"));
  v19 = -[PHSuggestion initWithFetchDictionary:propertyHint:photoLibrary:]([PHSuggestion alloc], "initWithFetchDictionary:propertyHint:photoLibrary:", v8, -1, v7);
  +[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", v7, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keyAssetUUID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v23, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchedObjects");
  v25 = objc_claimAutoreleasedReturnValue();
  assets = v19->_assets;
  v19->_assets = (NSArray *)v25;

  return v19;
}

+ (id)availableSuggestionTypeInfosWithOptions:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "photoAnalysisClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "requestAvailableSuggestionTypeInfosWithOptions:error:", v5, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (!v7)
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "suggesterInfosWithOptions encountered error:%@", buf, 0xCu);
    }

  }
  return v7;
}

+ (id)suggestionInfosWithOptions:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "photoAnalysisClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "requestSuggestionInfosWithOptions:error:", v5, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (!v7)
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "suggestionInfosWithOptions encountered error:%@", buf, 0xCu);
    }

  }
  return v7;
}

id __71__PHSuggestion_fetchWallpaperSuggestionsWithFeaturedState_withOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "allFeaturedStateEnabledSuggestionTypesForWallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForSuggestionsWithFeaturedState:types:options:](PHQuery, "queryForSuggestionsWithFeaturedState:types:options:", *(unsigned __int16 *)(a1 + 40), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "executeQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __68__PHSuggestion_fetchWidgetSuggestionsWithFeaturedState_withOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "allFeaturedStateEnabledSuggestionTypesForWidget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForSuggestionsWithFeaturedState:types:options:](PHQuery, "queryForSuggestionsWithFeaturedState:types:options:", *(unsigned __int16 *)(a1 + 40), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "executeQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __67__PHSuggestion_fetchAllFeaturedStateEnabledSuggestionsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allFeaturedStateEnabledSuggestionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHQuery queryForSuggestionsWithTypes:options:](PHQuery, "queryForSuggestionsWithTypes:options:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "executeQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __69__PHSuggestion_fetchSuggestionsWithState_ofType_subtype_withOptions___block_invoke(unsigned __int16 *a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForSuggestionsWithState:type:subtype:options:](PHQuery, "queryForSuggestionsWithState:type:subtype:options:", a1[16], a1[17], a1[18], a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __61__PHSuggestion_fetchSuggestionsWithState_ofType_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForSuggestionsWithState:type:subtype:options:](PHQuery, "queryForSuggestionsWithState:type:subtype:options:", *(unsigned __int16 *)(a1 + 32), *(unsigned __int16 *)(a1 + 34), 0, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __54__PHSuggestion_fetchSuggestionsWithState_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForSuggestionsWithState:options:](PHQuery, "queryForSuggestionsWithState:options:", *(unsigned __int16 *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __44__PHSuggestion_fetchSuggestionsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForSuggestionsWithOptions:](PHQuery, "queryForSuggestionsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __52__PHSuggestion_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[22];

  v4[21] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("uuid");
  v4[1] = CFSTR("type");
  v4[2] = CFSTR("subtype");
  v4[3] = CFSTR("state");
  v4[4] = CFSTR("notificationState");
  v4[5] = CFSTR("featuredState");
  v4[6] = CFSTR("version");
  v4[7] = CFSTR("creationDate");
  v4[8] = CFSTR("startDate");
  v4[9] = CFSTR("endDate");
  v4[10] = CFSTR("activationDate");
  v4[11] = CFSTR("relevantUntilDate");
  v4[12] = CFSTR("expungeDate");
  v4[13] = CFSTR("title");
  v4[14] = CFSTR("subtitle");
  v4[15] = CFSTR("context");
  v4[16] = CFSTR("estimatedAssetCount");
  v4[17] = CFSTR("estimatedPhotosCount");
  v4[18] = CFSTR("estimatedVideosCount");
  v4[19] = CFSTR("sharingComposition");
  v4[20] = CFSTR("availableFeatures");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 21);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_33694;
  transformValueExpression_forKeyPath___passThroughSet_33694 = v2;

}

void __28__PHSuggestion_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PHEntityKeyMap *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  _QWORD v46[21];
  _QWORD v47[23];

  v47[21] = *MEMORY[0x1E0C80C00];
  v19 = [PHEntityKeyMap alloc];
  v45 = CFSTR("uuid");
  v46[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v24;
  v46[1] = CFSTR("type");
  v44 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v23;
  v46[2] = CFSTR("subtype");
  v43 = CFSTR("subtype");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v22;
  v46[3] = CFSTR("state");
  v42 = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v21;
  v46[4] = CFSTR("notificationState");
  v41 = CFSTR("notificationState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v20;
  v46[5] = CFSTR("featuredState");
  v40 = CFSTR("featuredState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v18;
  v46[6] = CFSTR("version");
  v39 = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v17;
  v46[7] = CFSTR("creationDate");
  v38 = CFSTR("creationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v16;
  v46[8] = CFSTR("startDate");
  v37 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = v15;
  v46[9] = CFSTR("endDate");
  v36 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v14;
  v46[10] = CFSTR("activationDate");
  v35 = CFSTR("activationDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v13;
  v46[11] = CFSTR("relevantUntilDate");
  v34 = CFSTR("relevantUntilDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v12;
  v46[12] = CFSTR("expungeDate");
  v33 = CFSTR("expungeDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v47[12] = v0;
  v46[13] = CFSTR("title");
  v32[0] = CFSTR("title");
  v32[1] = CFSTR("localizedTitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v47[13] = v1;
  v46[14] = CFSTR("subtitle");
  v31[0] = CFSTR("subtitle");
  v31[1] = CFSTR("localizedSubtitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47[14] = v2;
  v46[15] = CFSTR("suggestionContext");
  v30 = CFSTR("context");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47[15] = v3;
  v46[16] = CFSTR("cachedCount");
  v29 = CFSTR("estimatedAssetCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47[16] = v4;
  v46[17] = CFSTR("cachedPhotosCount");
  v28 = CFSTR("estimatedPhotosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[17] = v5;
  v46[18] = CFSTR("cachedVideosCount");
  v27 = CFSTR("estimatedVideosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47[18] = v6;
  v46[19] = CFSTR("sharingComposition");
  v26 = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47[19] = v7;
  v46[20] = CFSTR("availableFeatures");
  v25 = CFSTR("availableFeatures");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47[20] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v19, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_33702;
  entityKeyMap_pl_once_object_15_33702 = v10;

}

void __42__PHSuggestion_propertiesToFetchWithHint___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[26];

  v4[25] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v0, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExpression:", v1);

  objc_msgSend(v0, "setExpressionResultType:", 2000);
  v4[0] = v0;
  v4[1] = CFSTR("uuid");
  v4[2] = CFSTR("type");
  v4[3] = CFSTR("subtype");
  v4[4] = CFSTR("state");
  v4[5] = CFSTR("notificationState");
  v4[6] = CFSTR("featuredState");
  v4[7] = CFSTR("version");
  v4[8] = CFSTR("creationDate");
  v4[9] = CFSTR("startDate");
  v4[10] = CFSTR("endDate");
  v4[11] = CFSTR("activationDate");
  v4[12] = CFSTR("relevantUntilDate");
  v4[13] = CFSTR("expungeDate");
  v4[14] = CFSTR("title");
  v4[15] = CFSTR("subtitle");
  v4[16] = CFSTR("suggestionContext");
  v4[17] = CFSTR("relatedCollectionUUID");
  v4[18] = CFSTR("actionData");
  v4[19] = CFSTR("featuresData");
  v4[20] = CFSTR("cachedCount");
  v4[21] = CFSTR("cachedPhotosCount");
  v4[22] = CFSTR("cachedVideosCount");
  v4[23] = CFSTR("sharingComposition");
  v4[24] = CFSTR("availableFeatures");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 25);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesToFetchWithHint__array_33717;
  propertiesToFetchWithHint__array_33717 = v2;

}

@end
