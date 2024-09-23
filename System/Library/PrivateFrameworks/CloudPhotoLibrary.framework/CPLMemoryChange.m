@implementation CPLMemoryChange

- (id)propertiesDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu assets"), -[CPLMemoryAssetList assetsCount](self->_assetList, "assetsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %lu custom user assets"), -[CPLMemoryAssetList assetsCount](self->_customUserAssetList, "assetsCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  void *v3;
  objc_super v5;

  if (sel_notificationState == a3)
    return &__block_literal_global_4001;
  if (sel_blacklistedFeature == a3)
  {
    v3 = (void *)MEMORY[0x1B5E08DC4](_CPLDefaultValueObjectNil, a2);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLMemoryChange;
    -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](&v5, sel_checkDefaultValueBlockForPropertyWithSelector_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (int64_t)subcategory
{
  return self->_subcategory;
}

- (void)setSubcategory:(int64_t)a3
{
  self->_subcategory = a3;
}

- (CPLMemoryAssetList)assetList
{
  return self->_assetList;
}

- (void)setAssetList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (CPLMemoryAssetList)customUserAssetList
{
  return self->_customUserAssetList;
}

- (void)setCustomUserAssetList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSData)assetListPredicate
{
  return self->_assetListPredicate;
}

- (void)setAssetListPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSData)graphData
{
  return self->_graphData;
}

- (void)setGraphData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (int64_t)graphVersion
{
  return self->_graphVersion;
}

- (void)setGraphVersion:(int64_t)a3
{
  self->_graphVersion = a3;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (BOOL)isRejected
{
  return self->_rejected;
}

- (void)setRejected:(BOOL)a3
{
  self->_rejected = a3;
}

- (int64_t)userActionOptions
{
  return self->_userActionOptions;
}

- (void)setUserActionOptions:(int64_t)a3
{
  self->_userActionOptions = a3;
}

- (NSData)movieData
{
  return self->_movieData;
}

- (void)setMovieData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (int64_t)notificationState
{
  return self->_notificationState;
}

- (void)setNotificationState:(int64_t)a3
{
  self->_notificationState = a3;
}

- (NSData)blacklistedFeature
{
  return self->_blacklistedFeature;
}

- (void)setBlacklistedFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (int64_t)shareCount
{
  return self->_shareCount;
}

- (void)setShareCount:(int64_t)a3
{
  self->_shareCount = a3;
}

- (int64_t)viewCount
{
  return self->_viewCount;
}

- (void)setViewCount:(int64_t)a3
{
  self->_viewCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedFeature, 0);
  objc_storeStrong((id *)&self->_movieData, 0);
  objc_storeStrong((id *)&self->_graphData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_assetListPredicate, 0);
  objc_storeStrong((id *)&self->_customUserAssetList, 0);
  objc_storeStrong((id *)&self->_assetList, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

BOOL __65__CPLMemoryChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notificationState") == 0;
}

+ (id)_createTestMemoryWithAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CPLMemoryAssetList *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  CPLMemoryAssetFlag *v21;
  CPLMemoryAsset *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v25 = v9;
  v10 = +[CPLRecordChange newRecordInScopeWithIdentifier:](CPLMemoryChange, "newRecordInScopeWithIdentifier:", v9);
  objc_msgSend(v10, "setTitle:", CFSTR("Test Memory Title"));
  objc_msgSend(v10, "setSubtitle:", CFSTR("Test Memory Subtitle"));
  objc_msgSend(v10, "setCategory:", 301);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCreationDate:", v11);

  objc_msgSend(CFSTR("graphData"), "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGraphData:", v12);

  objc_msgSend(v10, "setGraphVersion:", 1);
  objc_msgSend(CFSTR("movieData"), "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMovieData:", v13);

  objc_msgSend(v10, "setScore:", 10.0);
  objc_msgSend(v10, "setNotificationState:", 1);
  objc_msgSend(v10, "setPlayCount:", 10);
  objc_msgSend(v10, "setShareCount:", 10);
  objc_msgSend(v10, "setViewCount:", 10);
  v14 = objc_alloc_init(CPLMemoryAssetList);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = v3;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v21 = objc_alloc_init(CPLMemoryAssetFlag);
        -[CPLMemoryAssetFlag setIsRepresentative:](v21, "setIsRepresentative:", 1);
        -[CPLMemoryAssetFlag setIsCurated:](v21, "setIsCurated:", 1);
        -[CPLMemoryAssetFlag setIsMovieCurated:](v21, "setIsMovieCurated:", 0);
        -[CPLMemoryAssetFlag setIsKeyAsset:](v21, "setIsKeyAsset:", 0);
        v22 = objc_alloc_init(CPLMemoryAsset);
        objc_msgSend(v20, "_unscopedIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLMemoryAsset setAssetIdentifier:](v22, "setAssetIdentifier:", v23);

        -[CPLMemoryAsset setAssetFlag:](v22, "setAssetFlag:", v21);
        -[CPLMemoryAssetList addAsset:](v14, "addAsset:", v22);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

  objc_msgSend(v10, "setAssetList:", v14);
  return v10;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

- (CPLMemoryChange)initWithCoder:(id)a3
{
  id v4;
  CPLMemoryChange *v5;
  CPLMemoryChange *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLMemoryChange;
  v5 = -[CPLRecordChange initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5
    && !-[CPLMemoryChange userActionOptions](v5, "userActionOptions")
    && objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userCreated")))
  {
    if (initWithCoder__onceToken_75 != -1)
      dispatch_once(&initWithCoder__onceToken_75, &__block_literal_global_76);
    -[CPLMemoryChange setUserActionOptions:](v6, "setUserActionOptions:", 1);
  }

  return v6;
}

void __46__CPLMemoryChange_CPLNSCoding__initWithCoder___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1B03C2000, v0, OS_LOG_TYPE_DEFAULT, "Storage might contain old serialized userCreated values", v1, 2u);
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)scopedIdentifiersForMapping
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CPLScopedIdentifier *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  CPLScopedIdentifier *v23;
  void *v24;
  id v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v37.receiver = self;
  v37.super_class = (Class)CPLMemoryChange;
  -[CPLRecordChange scopedIdentifiersForMapping](&v37, sel_scopedIdentifiersForMapping);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[CPLMemoryChange assetList](self, "assetList");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v10), "assetIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          v13 = [CPLScopedIdentifier alloc];
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v13, "initRelativeToScopedIdentifier:identifier:", v14, v12);

          if (v15)
          {
            objc_msgSend(v5, "addObject:", v15);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  -[CPLMemoryChange customUserAssetList](self, "customUserAssetList");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "assets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v20), "assetIdentifier");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          v23 = [CPLScopedIdentifier alloc];
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v23, "initRelativeToScopedIdentifier:identifier:", v24, v22);

          if (v25)
          {
            objc_msgSend(v5, "addObject:", v25);

          }
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v18);
  }

  return v5;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  CPLScopedIdentifier *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  void *v30;
  CPLScopedIdentifier *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CPLMemoryChange;
  -[CPLRecordChange translateToCloudChangeUsingIDMapping:error:](&v50, sel_translateToCloudChangeUsingIDMapping_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v40 = v7;
    objc_msgSend(v7, "assetList");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v47 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v14, "assetIdentifier");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            v17 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v17, "initRelativeToScopedIdentifier:identifier:", v18, v16);

            if (v19)
            {
              v45 = 0;
              objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v19, &v45);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20;
              if (v20)
              {
                objc_msgSend(v20, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setAssetIdentifier:", v22);

              }
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v11);
    }

    objc_msgSend(v40, "customUserAssetList");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "assets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v28, "assetIdentifier");
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)v29;
            v31 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v31, "initRelativeToScopedIdentifier:identifier:", v32, v30);

            if (v33)
            {
              v45 = 0;
              objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v33, &v45);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34;
              if (v34)
              {
                objc_msgSend(v34, "identifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setAssetIdentifier:", v36);

              }
            }
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v25);
    }

    v8 = v40;
  }

  return v8;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  CPLScopedIdentifier *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  void *v30;
  CPLScopedIdentifier *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
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
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CPLMemoryChange;
  -[CPLRecordChange translateToClientChangeUsingIDMapping:error:](&v49, sel_translateToClientChangeUsingIDMapping_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v40 = v7;
    objc_msgSend(v7, "assetList");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v14, "assetIdentifier");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            v17 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v17, "initRelativeToScopedIdentifier:identifier:", v18, v16);

            if (v19)
            {
              objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20;
              if (v20)
              {
                objc_msgSend(v20, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setAssetIdentifier:", v22);

              }
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v11);
    }

    objc_msgSend(v40, "customUserAssetList");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "assets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v28, "assetIdentifier");
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)v29;
            v31 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v31, "initRelativeToScopedIdentifier:identifier:", v32, v30);

            if (v33)
            {
              objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34;
              if (v34)
              {
                objc_msgSend(v34, "identifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setAssetIdentifier:", v36);

              }
            }
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v25);
    }

    v8 = v40;
  }

  return v8;
}

@end
