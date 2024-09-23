@implementation CPLSuggestionChange

- (id)propertiesDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu asset"), -[CPLSuggestionRecordList assetsCount](self->_recordList, "assetsCount"));
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  void *v3;
  objc_super v5;

  if (sel_notificationState == a3)
  {
    v3 = &__block_literal_global_2125;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLSuggestionChange;
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

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unsigned __int16)a3
{
  self->_subtype = a3;
}

- (CPLSuggestionRecordList)recordList
{
  return self->_recordList;
}

- (void)setRecordList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (unsigned)notificationState
{
  return self->_notificationState;
}

- (void)setNotificationState:(unsigned __int16)a3
{
  self->_notificationState = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int16)a3
{
  self->_state = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSDate)activationDate
{
  return self->_activationDate;
}

- (void)setActivationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSDate)relevantUntilDate
{
  return self->_relevantUntilDate;
}

- (void)setRelevantUntilDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDate)expungeDate
{
  return self->_expungeDate;
}

- (void)setExpungeDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSData)actionData
{
  return self->_actionData;
}

- (void)setActionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSData)featuresData
{
  return self->_featuresData;
}

- (void)setFeaturesData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresData, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_expungeDate, 0);
  objc_storeStrong((id *)&self->_relevantUntilDate, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_recordList, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

BOOL __69__CPLSuggestionChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notificationState") == 0;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

+ (id)_createTestSuggestionWithKeyAssets:(id)a3 representativeAssets:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CPLSuggestionRecordList *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  CPLSuggestionAssetFlag *v29;
  CPLSuggestionAsset *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  CPLSuggestionAssetFlag *v38;
  CPLSuggestionAsset *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scopeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v45 = v6;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scopedIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scopeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      CPLPrimaryScopeIdentifierForCurrentUniverse();
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v16;

  }
  v47 = v11;
  v17 = +[CPLRecordChange newRecordInScopeWithIdentifier:](CPLSuggestionChange, "newRecordInScopeWithIdentifier:", v11);
  objc_msgSend(v17, "setTitle:", CFSTR("Test suggestion title"));
  objc_msgSend(v17, "setSubtitle:", CFSTR("Test suggestion subtitle"));
  objc_msgSend(v17, "setType:", 2);
  objc_msgSend(v17, "setSubtype:", 201);
  objc_msgSend(v17, "setState:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCreationDate:", v18);

  objc_msgSend(v17, "setVersion:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActivationDate:", v19);

  objc_msgSend(v17, "setNotificationState:", 0);
  objc_msgSend(CFSTR("action data"), "dataUsingEncoding:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActionData:", v20);

  objc_msgSend(CFSTR("features data"), "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFeaturesData:", v21);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRelevantUntilDate:");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 5184000.0);
  v46 = v17;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setExpungeDate:");
  v22 = objc_alloc_init(CPLSuggestionRecordList);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v53 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v29 = objc_alloc_init(CPLSuggestionAssetFlag);
        -[CPLSuggestionAssetFlag setIsKeyAsset:](v29, "setIsKeyAsset:", 1);
        -[CPLSuggestionAssetFlag setIsRepresentative:](v29, "setIsRepresentative:", 0);
        v30 = objc_alloc_init(CPLSuggestionAsset);
        objc_msgSend(v28, "_unscopedIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLSuggestionAsset setAssetIdentifier:](v30, "setAssetIdentifier:", v31);

        -[CPLSuggestionAsset setAssetFlag:](v30, "setAssetFlag:", v29);
        -[CPLSuggestionRecordList addAsset:](v22, "addAsset:", v30);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v25);
  }
  v42 = v23;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v32 = v45;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v49 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        v38 = objc_alloc_init(CPLSuggestionAssetFlag);
        -[CPLSuggestionAssetFlag setIsKeyAsset:](v38, "setIsKeyAsset:", 0, v42);
        -[CPLSuggestionAssetFlag setIsRepresentative:](v38, "setIsRepresentative:", 1);
        v39 = objc_alloc_init(CPLSuggestionAsset);
        objc_msgSend(v37, "_unscopedIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLSuggestionAsset setAssetIdentifier:](v39, "setAssetIdentifier:", v40);

        -[CPLSuggestionAsset setAssetFlag:](v39, "setAssetFlag:", v38);
        -[CPLSuggestionRecordList addAsset:](v22, "addAsset:", v39);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v34);
  }

  objc_msgSend(v46, "setRecordList:", v22);
  return v46;
}

- (CPLSuggestionChange)initWithCoder:(id)a3
{
  id v4;
  CPLSuggestionChange *v5;
  CPLSuggestionChange *v6;
  void *v7;
  void *v8;
  CPLSuggestionRecordList *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLSuggestionChange;
  v5 = -[CPLRecordChange initWithCoder:](&v11, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[CPLSuggestionChange recordList](v5, "recordList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetList"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v9 = -[CPLSuggestionRecordList initWithData:]([CPLSuggestionRecordList alloc], "initWithData:", v8);
        if (initWithCoder__onceToken_70 != -1)
          dispatch_once(&initWithCoder__onceToken_70, &__block_literal_global_71);
        -[CPLSuggestionChange setRecordList:](v6, "setRecordList:", v9);

      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

void __50__CPLSuggestionChange_CPLNSCoding__initWithCoder___block_invoke()
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
      _os_log_impl(&dword_1B03C2000, v0, OS_LOG_TYPE_DEFAULT, "Storage might contain old serialized assetList", v1, 2u);
    }

  }
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("assetList")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLSuggestionChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
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
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CPLScopedIdentifier *v33;
  void *v34;
  id v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v50.receiver = self;
  v50.super_class = (Class)CPLSuggestionChange;
  -[CPLRecordChange scopedIdentifiersForMapping](&v50, sel_scopedIdentifiersForMapping);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[CPLSuggestionChange recordList](self, "recordList");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v10), "assetIdentifier");
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
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v8);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v37, "memorys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v43;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v20), "memoryIdentifier");
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
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v18);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v37, "persons");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v39;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v30), "personIdentifier");
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (void *)v31;
          v33 = [CPLScopedIdentifier alloc];
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v33, "initRelativeToScopedIdentifier:identifier:", v34, v32);

          if (v35)
          {
            objc_msgSend(v5, "addObject:", v35);

          }
        }
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v28);
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
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  uint64_t v43;
  void *v44;
  CPLScopedIdentifier *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)CPLSuggestionChange;
  -[CPLRecordChange translateToCloudChangeUsingIDMapping:error:](&v67, sel_translateToCloudChangeUsingIDMapping_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v52 = v7;
    objc_msgSend(v7, "recordList");
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v64 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
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
              v62 = 0;
              objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v19, &v62);
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
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      }
      while (v11);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v53, "memorys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v59 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          objc_msgSend(v28, "memoryIdentifier");
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
              v62 = 0;
              objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v33, &v62);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34;
              if (v34)
              {
                objc_msgSend(v34, "identifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setMemoryIdentifier:", v36);

              }
            }
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      }
      while (v25);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v53, "persons");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v55 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          objc_msgSend(v42, "personIdentifier");
          v43 = objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            v44 = (void *)v43;
            v45 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v45, "initRelativeToScopedIdentifier:identifier:", v46, v44);

            if (v47)
            {
              v62 = 0;
              objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v47, &v62);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v48;
              if (v48)
              {
                objc_msgSend(v48, "identifier");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setPersonIdentifier:", v50);

              }
            }
          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      }
      while (v39);
    }

    v8 = v52;
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
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  uint64_t v43;
  void *v44;
  CPLScopedIdentifier *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v66.receiver = self;
  v66.super_class = (Class)CPLSuggestionChange;
  -[CPLRecordChange translateToClientChangeUsingIDMapping:error:](&v66, sel_translateToClientChangeUsingIDMapping_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v52 = v7;
    objc_msgSend(v7, "recordList");
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v63 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
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
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v11);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v53, "memorys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v59 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          objc_msgSend(v28, "memoryIdentifier");
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
                objc_msgSend(v28, "setMemoryIdentifier:", v36);

              }
            }
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      }
      while (v25);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v53, "persons");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v55 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          objc_msgSend(v42, "personIdentifier");
          v43 = objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            v44 = (void *)v43;
            v45 = [CPLScopedIdentifier alloc];
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v45, "initRelativeToScopedIdentifier:identifier:", v46, v44);

            if (v47)
            {
              objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:", v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v48;
              if (v48)
              {
                objc_msgSend(v48, "identifier");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setPersonIdentifier:", v50);

              }
            }
          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      }
      while (v39);
    }

    v8 = v52;
  }

  return v8;
}

@end
