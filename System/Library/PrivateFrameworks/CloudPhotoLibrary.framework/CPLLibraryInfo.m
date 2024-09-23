@implementation CPLLibraryInfo

+ (id)cplAdditionalSecureClassesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (cplAdditionalSecureClassesForProperty__onceToken_126 != -1)
    dispatch_once(&cplAdditionalSecureClassesForProperty__onceToken_126, &__block_literal_global_127);
  objc_msgSend((id)cplAdditionalSecureClassesForProperty__additionalClasses_125, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___CPLLibraryInfo;
    objc_msgSendSuper2(&v10, sel_cplAdditionalSecureClassesForProperty_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

void __69__CPLLibraryInfo_CPLNSCoding__cplAdditionalSecureClassesForProperty___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("assetCounts");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)cplAdditionalSecureClassesForProperty__additionalClasses_125;
  cplAdditionalSecureClassesForProperty__additionalClasses_125 = v3;

}

- (CPLLibraryInfo)initWithCoder:(id)a3
{
  id v4;
  CPLLibraryInfo *v5;
  uint64_t v6;
  NSDictionary *assetCounts;
  NSDictionary *v8;
  CPLLibraryInfo *v9;
  uint64_t v10;
  CPLFeatureVersionHistory *featureVersionHistory;
  uint64_t v12;
  NSData *accountFlagsData;
  uint64_t v14;
  CPLMomentShare *momentShare;
  uint64_t v16;
  NSNumber *featureCompatibleVersion;
  CPLLibraryInfo *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, _BYTE *);
  void *v23;
  CPLLibraryInfo *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CPLLibraryInfo;
  v5 = -[CPLLibraryInfo init](&v30, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken_12398 != -1)
      dispatch_once(&initWithCoder__onceToken_12398, &__block_literal_global_12399);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__countsClasses, CFSTR("counts"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetCounts = v5->_assetCounts;
    v5->_assetCounts = (NSDictionary *)v6;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    v8 = v5->_assetCounts;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __32__CPLLibraryInfo_initWithCoder___block_invoke_2;
    v23 = &unk_1E60DA908;
    v25 = &v26;
    v9 = v5;
    v24 = v9;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", &v20);
    if (!*((_BYTE *)v27 + 24))
    {

      _Block_object_dispose(&v26, 8);
      v18 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("history"), v20, v21, v22, v23);
    v10 = objc_claimAutoreleasedReturnValue();
    featureVersionHistory = v9->_featureVersionHistory;
    v9->_featureVersionHistory = (CPLFeatureVersionHistory *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flags"));
    v12 = objc_claimAutoreleasedReturnValue();
    accountFlagsData = v9->_accountFlagsData;
    v9->_accountFlagsData = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("momentShare"));
    v14 = objc_claimAutoreleasedReturnValue();
    momentShare = v9->_momentShare;
    v9->_momentShare = (CPLMomentShare *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureCompatibleVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    featureCompatibleVersion = v9->_featureCompatibleVersion;
    v9->_featureCompatibleVersion = (NSNumber *)v16;

    _Block_object_dispose(&v26, 8);
  }
  v18 = v5;
LABEL_8:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *assetCounts;
  id v5;

  assetCounts = self->_assetCounts;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assetCounts, CFSTR("counts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_featureVersionHistory, CFSTR("history"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountFlagsData, CFSTR("flags"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_momentShare, CFSTR("momentShare"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_featureCompatibleVersion, CFSTR("featureCompatibleVersion"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CPLLibraryInfo *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(CPLLibraryInfo);
  -[CPLLibraryInfo setAssetCounts:](v4, "setAssetCounts:", self->_assetCounts);
  v5 = (void *)-[CPLFeatureVersionHistory copy](self->_featureVersionHistory, "copy");
  -[CPLLibraryInfo setFeatureVersionHistory:](v4, "setFeatureVersionHistory:", v5);

  -[CPLLibraryInfo setAccountFlagsData:](v4, "setAccountFlagsData:", self->_accountFlagsData);
  v6 = (void *)-[CPLMomentShare copy](self->_momentShare, "copy");
  -[CPLLibraryInfo setMomentShare:](v4, "setMomentShare:", v6);

  v7 = (void *)-[NSNumber copy](self->_featureCompatibleVersion, "copy");
  -[CPLLibraryInfo setFeatureCompatibleVersion:](v4, "setFeatureCompatibleVersion:", v7);

  return v4;
}

- (id)prettyDescriptionWithAnchorDesciptionBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  CPLFeatureVersionHistory *featureVersionHistory;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  NSNumber *featureCompatibleVersion;
  int64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v4 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__12365;
  v47 = __Block_byref_object_dispose__12366;
  v48 = 0;
  v5 = &__block_literal_global_19;
  if (v4)
    v5 = v4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__12365;
  v41 = __Block_byref_object_dispose__12366;
  v42 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = -1;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = -1;
  v6 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke_2;
  v27[3] = &unk_1E60DA970;
  v29 = &v43;
  v30 = v36;
  v7 = v5;
  v28 = v7;
  v31 = &v37;
  v8 = (void *)MEMORY[0x1B5E08DC4](v27);
  featureVersionHistory = self->_featureVersionHistory;
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke_3;
  v22[3] = &unk_1E60DA998;
  v24 = &v32;
  v25 = &v37;
  v26 = v36;
  v10 = v8;
  v23 = v10;
  -[CPLFeatureVersionHistory enumerateHistoryWithBlock:](featureVersionHistory, "enumerateHistoryWithBlock:", v22);
  if (v38[5])
    (*((void (**)(id, uint64_t))v10 + 2))(v10, v33[3]);
  if (!v44[5])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("History: None"));
    v12 = (void *)v44[5];
    v44[5] = v11;

  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[CPLLibraryInfo accountFlags](self, "accountFlags");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("none");
  -[CPLLibraryInfo assetCounts](self, "assetCounts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  featureCompatibleVersion = self->_featureCompatibleVersion;
  v19 = -[CPLFeatureVersionHistory currentFeatureVersion](self->_featureVersionHistory, "currentFeatureVersion");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Account flags: %@\nAsset counts:\n%@\nFeature compatible version: %@\n\nCurrent feature version: %ld\n%@"), v16, v17, featureCompatibleVersion, v19, v44[5]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  return v20;
}

- (CPLAccountFlags)accountFlags
{
  CPLAccountFlags *v2;

  if (self->_accountFlagsData)
    v2 = -[CPLAccountFlags initWithData:]([CPLAccountFlags alloc], "initWithData:", self->_accountFlagsData);
  else
    v2 = 0;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  CPLLibraryInfo *v4;
  unint64_t v5;
  void *v6;
  NSDictionary *assetCounts;
  char v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  CPLFeatureVersionHistory *featureVersionHistory;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  NSData *accountFlagsData;
  char v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  CPLMomentShare *momentShare;
  BOOL v24;
  unint64_t v26;
  unint64_t v27;
  NSNumber *v28;
  unint64_t v29;

  v4 = (CPLLibraryInfo *)a3;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  v5 = self->_assetCounts;
  v6 = (void *)v5;
  assetCounts = v4->_assetCounts;
  if (v5 && assetCounts)
  {
    v8 = objc_msgSend((id)v5, "isEqual:");

    if ((v8 & 1) == 0)
      goto LABEL_22;
  }
  else
  {
    v10 = v5 | (unint64_t)assetCounts;

    if (v10)
      goto LABEL_22;
  }
  v11 = self->_featureVersionHistory;
  v12 = (void *)v11;
  featureVersionHistory = v4->_featureVersionHistory;
  if (v11 && featureVersionHistory)
  {
    v14 = objc_msgSend((id)v11, "isEqual:");

    if (!v14)
      goto LABEL_22;
  }
  else
  {
    v15 = v11 | (unint64_t)featureVersionHistory;

    if (v15)
      goto LABEL_22;
  }
  v16 = self->_accountFlagsData;
  v17 = (void *)v16;
  accountFlagsData = v4->_accountFlagsData;
  if (v16 && accountFlagsData)
  {
    v19 = objc_msgSend((id)v16, "isEqual:");

    if ((v19 & 1) == 0)
      goto LABEL_22;
    goto LABEL_19;
  }
  v20 = v16 | (unint64_t)accountFlagsData;

  if (v20)
  {
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
LABEL_19:
  v21 = self->_momentShare;
  v22 = (void *)v21;
  momentShare = v4->_momentShare;
  if (v21 && momentShare)
  {
    v24 = objc_msgSend((id)v21, "isEqual:");

    if (!v24)
      goto LABEL_22;
  }
  else
  {
    v26 = v21 | (unint64_t)momentShare;

    if (v26)
      goto LABEL_22;
  }
  v27 = self->_featureCompatibleVersion;
  v28 = v4->_featureCompatibleVersion;
  v29 = (unint64_t)v28;
  v9 = v27 && v28 && (objc_msgSend((id)v27, "isEqual:", v28) & 1) != 0 || (v27 | v29) == 0;

LABEL_23:
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSDictionary hash](self->_assetCounts, "hash");
  v4 = -[CPLFeatureVersionHistory hash](self->_featureVersionHistory, "hash") ^ v3;
  v5 = -[NSData hash](self->_accountFlagsData, "hash");
  v6 = v4 ^ v5 ^ -[CPLMomentShare hash](self->_momentShare, "hash");
  return v6 ^ -[NSNumber hash](self->_featureCompatibleVersion, "hash");
}

- (NSDictionary)assetCounts
{
  return self->_assetCounts;
}

- (void)setAssetCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CPLFeatureVersionHistory)featureVersionHistory
{
  return self->_featureVersionHistory;
}

- (void)setFeatureVersionHistory:(id)a3
{
  objc_storeStrong((id *)&self->_featureVersionHistory, a3);
}

- (NSData)accountFlagsData
{
  return self->_accountFlagsData;
}

- (void)setAccountFlagsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CPLMomentShare)momentShare
{
  return self->_momentShare;
}

- (void)setMomentShare:(id)a3
{
  objc_storeStrong((id *)&self->_momentShare, a3);
}

- (NSNumber)featureCompatibleVersion
{
  return self->_featureCompatibleVersion;
}

- (void)setFeatureCompatibleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureCompatibleVersion, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_accountFlagsData, 0);
  objc_storeStrong((id *)&self->_featureVersionHistory, 0);
  objc_storeStrong((id *)&self->_assetCounts, 0);
}

void __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v4)
  {
    (*(void (**)(void))(a1[4] + 16))();
    v6 = objc_claimAutoreleasedReturnValue();
    v14 = (id)v6;
    if (v5 == a2)
      objc_msgSend(v4, "appendFormat:", CFSTR("\n  %ld: %@"), a2, v6, v13);
    else
      objc_msgSend(v4, "appendFormat:", CFSTR("\n  %ld-%ld: %@"), v5, a2, v6);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    (*(void (**)(void))(a1[4] + 16))();
    v9 = objc_claimAutoreleasedReturnValue();
    v14 = (id)v9;
    if (v5 == a2)
      v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("History:\n  %ld: %@"), v8, v9, v13);
    else
      v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("History:\n  %ld-%ld: %@"), v8, a2, v9);
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v7 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v7 + 40);
  v8 = (id *)(v7 + 40);
  v9 = v10;
  v11 = v6;
  if (!v10)
    goto LABEL_4;
  if ((objc_msgSend(v9, "isEqual:", v6) & 1) == 0)
  {
    (*(void (**)(void))(a1[4] + 16))();
    v8 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
LABEL_4:
    objc_storeStrong(v8, a3);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a2;
  }

}

uint64_t __61__CPLLibraryInfo_prettyDescriptionWithAnchorDesciptionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplSyncAnchorSimpleDescription");
}

void __32__CPLLibraryInfo_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v12 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __32__CPLLibraryInfo_initWithCoder___block_invoke_3;
    block[3] = &unk_1E60D6EC0;
    v9 = *(id *)(a1 + 32);
    v14 = v9;
    v10 = v12;
    v15 = v10;
    v11 = v7;
    v16 = v11;
    if (initWithCoder__logOnceToken != -1)
    {
      dispatch_once(&initWithCoder__logOnceToken, block);
      v10 = v15;
      v11 = v16;
      v9 = v14;
    }
    *a4 = 1;

  }
}

void __32__CPLLibraryInfo_initWithCoder___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = (void *)objc_opt_class();
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Failed to deserialize %@ - invalid assetCounts dictionary %@: %@", (uint8_t *)&v7, 0x20u);

    }
  }
}

void __32__CPLLibraryInfo_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)initWithCoder__countsClasses;
  initWithCoder__countsClasses = v3;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
