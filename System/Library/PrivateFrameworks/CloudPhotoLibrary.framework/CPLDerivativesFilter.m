@implementation CPLDerivativesFilter

- (CPLDerivativesFilter)init
{
  CPLDerivativesFilter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *skipInfoForAssetChange;
  NSMutableDictionary *v5;
  NSMutableDictionary *skipInfoForMasterChange;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPLDerivativesFilter;
  v2 = -[CPLDerivativesFilter init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    skipInfoForAssetChange = v2->_skipInfoForAssetChange;
    v2->_skipInfoForAssetChange = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    skipInfoForMasterChange = v2->_skipInfoForMasterChange;
    v2->_skipInfoForMasterChange = v5;

  }
  return v2;
}

- (CPLDerivativesFilter)initWithCoder:(id)a3
{
  id v4;
  CPLDerivativesFilter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *skipInfoForAssetChange;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *skipInfoForMasterChange;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CPLDerivativesFilter;
  v5 = -[CPLDerivativesFilter init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("dropForAssetChange"));
    v11 = objc_claimAutoreleasedReturnValue();
    skipInfoForAssetChange = v5->_skipInfoForAssetChange;
    v5->_skipInfoForAssetChange = (NSMutableDictionary *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("dropForMasterChange"));
    v18 = objc_claimAutoreleasedReturnValue();
    skipInfoForMasterChange = v5->_skipInfoForMasterChange;
    v5->_skipInfoForMasterChange = (NSMutableDictionary *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *skipInfoForAssetChange;
  id v5;

  skipInfoForAssetChange = self->_skipInfoForAssetChange;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", skipInfoForAssetChange, CFSTR("dropForAssetChange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_skipInfoForMasterChange, CFSTR("dropForMasterChange"));

}

- (id)_getTargetDictionaryForChangeType:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v4 = 16;
    return *(id *)((char *)&self->super.isa + v4);
  }
  if (a3 == 2)
  {
    v4 = 8;
    return *(id *)((char *)&self->super.isa + v4);
  }
  if (!_CPLSilentLogging)
  {
    __CPLDerivativesOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:](CPLDropDerivativesRecipe, "shortDescriptionForResourceChangeRecordType:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Unknown upload skip record type: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  return 0;
}

- (BOOL)_isValidDropDerivativeRecipeWithUTI:(id)a3 sourceType:(unint64_t)a4 derivativeTypes:(id)a5 changeType:(unint64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (a4 && v11 && objc_msgSend(v10, "count"))
  {

    if (a6)
    {
      v13 = 1;
      goto LABEL_12;
    }
  }
  else
  {

  }
  if (!_CPLSilentLogging)
  {
    __CPLDerivativesOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _shortDescriptionForArrayOfCPLResourceTypes(v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:](CPLDropDerivativesRecipe, "shortDescriptionForResourceChangeRecordType:", a6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v15;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Invalid CPLDropDerivativesRecipe, sourceType: %@, UTI: %@, derivativeTypes: %@, recordChangetype: %@", (uint8_t *)&v19, 0x2Au);

    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)addServerDropDerivativesRecipes:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CPLDerivativesFilter_addServerDropDerivativesRecipes___block_invoke;
  v6[3] = &unk_1E60D9870;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

- (BOOL)addServerDropDerivativesRecipe:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uti");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "sourceResourceType");
  v7 = objc_msgSend(v4, "changeType");
  objc_msgSend(v4, "derivativeTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPLDerivativesFilter _isValidDropDerivativeRecipeWithUTI:sourceType:derivativeTypes:changeType:](self, "_isValidDropDerivativeRecipeWithUTI:sourceType:derivativeTypes:changeType:", v5, v6, v8, v7))
  {
    -[CPLDerivativesFilter _getTargetDictionaryForChangeType:](self, "_getTargetDictionaryForChangeType:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v24 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        v13 = v11;
      else
        v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = v13;

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __55__CPLDerivativesFilter_addServerDropDerivativesRecipe___block_invoke;
      v25[3] = &unk_1E60D98C0;
      v16 = v15;
      v26 = v16;
      v17 = v5;
      v27 = v17;
      v29 = v6;
      v18 = v8;
      v28 = v18;
      v30 = v7;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v25);
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v24);
      if (!_CPLSilentLogging)
      {
        __CPLDerivativesOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          _shortDescriptionForArrayOfCPLResourceTypes(v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:](CPLDropDerivativesRecipe, "shortDescriptionForResourceChangeRecordType:", v7);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v32 = (uint64_t)v20;
          v33 = 2112;
          v34 = v17;
          v35 = 2112;
          v36 = v21;
          v37 = 2112;
          v38 = v22;
          _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEFAULT, "Added server supported derivative upload skip info to derivativesFilter. SourceType: %@, UTI: %@, derivativeTypes: %@, recordChangetype: %@", buf, 0x2Au);

        }
        v10 = v9 != 0;
      }

      v14 = v24;
LABEL_18:

      goto LABEL_19;
    }
    if (!_CPLSilentLogging)
    {
      __CPLDerivativesOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v32 = v7;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Invalid derivative dropping rule. Record change type not supported: %lu", buf, 0xCu);
      }
      goto LABEL_18;
    }
    v9 = 0;
  }
  else
  {
    if (_CPLSilentLogging)
    {
      v10 = 0;
      goto LABEL_20;
    }
    __CPLDerivativesOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = (uint64_t)v4;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Invalid derivative dropping rule: %@", buf, 0xCu);
    }
  }
  v10 = 0;
LABEL_19:

LABEL_20:
  return v10;
}

- (BOOL)mightDropSomeDerivativesForSourceType:(unint64_t)a3 forChangeType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[CPLDerivativesFilter _getTargetDictionaryForChangeType:](self, "_getTargetDictionaryForChangeType:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (BOOL)shouldDropDerivativeWithDropDerivativeRecipe:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  objc_msgSend(v4, "uti");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "sourceResourceType");
  v7 = objc_msgSend(v4, "changeType");
  objc_msgSend(v4, "derivativeTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPLDerivativesFilter _isValidDropDerivativeRecipeWithUTI:sourceType:derivativeTypes:changeType:](self, "_isValidDropDerivativeRecipeWithUTI:sourceType:derivativeTypes:changeType:", v5, v6, v8, v7)&& objc_msgSend(v8, "count") == 1)
  {
    -[CPLDerivativesFilter _getTargetDictionaryForChangeType:](self, "_getTargetDictionaryForChangeType:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__CPLDerivativesFilter_shouldDropDerivativeWithDropDerivativeRecipe___block_invoke;
    v18[3] = &unk_1E60D98E8;
    v15 = v14;
    v19 = v15;
    v20 = &v21;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v18);
    v16 = *((_BYTE *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_enumerateDropDerivativeRules:(id)a3 ofType:(unint64_t)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke;
  v9[3] = &unk_1E60D9988;
  v10 = v7;
  v11 = a4;
  v8 = v7;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (BOOL)isEqual:(id)a3
{
  CPLDerivativesFilter *v4;
  CPLDerivativesFilter *v5;
  char v6;

  v4 = (CPLDerivativesFilter *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSMutableDictionary isEqualToDictionary:](self->_skipInfoForAssetChange, "isEqualToDictionary:", v5->_skipInfoForAssetChange))v6 = -[NSMutableDictionary isEqualToDictionary:](self->_skipInfoForMasterChange, "isEqualToDictionary:", v5->_skipInfoForMasterChange);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)reset
{
  NSMutableDictionary *v3;
  NSMutableDictionary *skipInfoForAssetChange;
  NSMutableDictionary *v5;
  NSMutableDictionary *skipInfoForMasterChange;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  skipInfoForAssetChange = self->_skipInfoForAssetChange;
  self->_skipInfoForAssetChange = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  skipInfoForMasterChange = self->_skipInfoForMasterChange;
  self->_skipInfoForMasterChange = v5;

}

- (BOOL)isEmpty
{
  return !-[NSMutableDictionary count](self->_skipInfoForAssetChange, "count")
      && -[NSMutableDictionary count](self->_skipInfoForMasterChange, "count") == 0;
}

- (id)_descriptionForStoredResponse:(id)a3 recordType:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CPLDerivativesFilter__descriptionForStoredResponse_recordType___block_invoke;
  v12[3] = &unk_1E60D99B0;
  v13 = v8;
  v9 = v8;
  -[CPLDerivativesFilter _enumerateDropDerivativeRules:ofType:withBlock:](self, "_enumerateDropDerivativeRules:ofType:withBlock:", v7, a4, v12);

  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)plistDescription
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__CPLDerivativesFilter_plistDescription__block_invoke;
  v6[3] = &unk_1E60D99B0;
  v4 = v3;
  v7 = v4;
  -[CPLDerivativesFilter enumerateDropDerivativeRulesWithBlock:](self, "enumerateDropDerivativeRulesWithBlock:", v6);

  return (NSArray *)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", &stru_1E60DF6B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](self->_skipInfoForAssetChange, "count"))
  {
    -[CPLDerivativesFilter _descriptionForStoredResponse:recordType:](self, "_descriptionForStoredResponse:recordType:", self->_skipInfoForAssetChange, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n\t"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n[DerivativeSkipInfoForAssetChange: \n\t%@]"), v6);

  }
  if (-[NSMutableDictionary count](self->_skipInfoForMasterChange, "count"))
  {
    -[CPLDerivativesFilter _descriptionForStoredResponse:recordType:](self, "_descriptionForStoredResponse:recordType:", self->_skipInfoForMasterChange, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n\t"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n[DerivativeSkipInfoForMasterChange: \n\t%@]"), v9);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)enumerateDropDerivativeRulesWithBlock:(id)a3
{
  NSMutableDictionary *skipInfoForMasterChange;
  id v5;

  skipInfoForMasterChange = self->_skipInfoForMasterChange;
  v5 = a3;
  -[CPLDerivativesFilter _enumerateDropDerivativeRules:ofType:withBlock:](self, "_enumerateDropDerivativeRules:ofType:withBlock:", skipInfoForMasterChange, 1, v5);
  -[CPLDerivativesFilter _enumerateDropDerivativeRules:ofType:withBlock:](self, "_enumerateDropDerivativeRules:ofType:withBlock:", self->_skipInfoForAssetChange, 2, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipInfoForMasterChange, 0);
  objc_storeStrong((id *)&self->_skipInfoForAssetChange, 0);
}

void __40__CPLDerivativesFilter_plistDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "plistDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __65__CPLDerivativesFilter__descriptionForStoredResponse_recordType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v5 = a2;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_2;
  v18[3] = &unk_1E60D9938;
  v19 = v8;
  v13 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v18);

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_4;
  v14[3] = &unk_1E60D9960;
  v11 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v5;
  v17 = v10;
  v16 = v11;
  v12 = v5;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v14);

}

void __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_3;
  v7[3] = &unk_1E60D9910;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CPLDropDerivativesRecipe *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[CPLDropDerivativesRecipe initWithSourceResourceType:uti:changeType:droppingDerivativeTypes:]([CPLDropDerivativesRecipe alloc], "initWithSourceResourceType:uti:changeType:droppingDerivativeTypes:", objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue"), v6, *(_QWORD *)(a1 + 48), v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__CPLDerivativesFilter__enumerateDropDerivativeRules_ofType_withBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = v7;

  objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v4);

}

void __69__CPLDerivativesFilter_shouldDropDerivativeWithDropDerivativeRecipe___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "conformsToType:", v7);

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __55__CPLDerivativesFilter_addServerDropDerivativesRecipe___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __55__CPLDerivativesFilter_addServerDropDerivativesRecipe___block_invoke_2;
  v16 = &unk_1E60D9898;
  v9 = v8;
  v17 = v9;
  v10 = *(_QWORD *)(a1 + 56);
  v20 = &v23;
  v21 = v10;
  v18 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 64);
  v19 = v11;
  v22 = v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v13);
  if (!*((_BYTE *)v24 + 24))
  {
    objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40), v13, v14, v15, v16, v17, v18);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v3);
  }

  _Block_object_dispose(&v23, 8);
}

void __55__CPLDerivativesFilter_addServerDropDerivativesRecipe___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "conformsToType:", v7);

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
    if (!_CPLSilentLogging)
    {
      __CPLDerivativesOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", *(_QWORD *)(a1 + 64));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 40);
        _shortDescriptionForArrayOfCPLResourceTypes(*(void **)(a1 + 48));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLDropDerivativesRecipe shortDescriptionForResourceChangeRecordType:](CPLDropDerivativesRecipe, "shortDescriptionForResourceChangeRecordType:", *(_QWORD *)(a1 + 72));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138413058;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Duplicate server rule found in response, sourceType: %@, UTI: %@, derivativeTypes: %@, recordChangetype: %@", (uint8_t *)&v13, 0x2Au);

      }
    }
  }
}

uint64_t __56__CPLDerivativesFilter_addServerDropDerivativesRecipes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addServerDropDerivativesRecipe:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
