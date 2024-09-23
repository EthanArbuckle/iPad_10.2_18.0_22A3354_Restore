@implementation HKCountrySet

+ (int64_t)isRegionCodeFound:(id)a3 availabilityWatch:(id)a4 availabilityPhone:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKCountrySet *v11;
  HKCountrySet *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;

  v8 = a3;
  if (v8)
  {
    v9 = a5;
    v10 = a4;
    v11 = -[HKCountrySet initWithDictionaryRepresentation:provenance:]([HKCountrySet alloc], "initWithDictionaryRepresentation:provenance:", v10, 0);

    v12 = -[HKCountrySet initWithDictionaryRepresentation:provenance:]([HKCountrySet alloc], "initWithDictionaryRepresentation:provenance:", v9, 0);
    if (v12)
    {
      if (v11)
      {
        -[HKCountrySet countrySetByIntersectingCountriesInSet:](v11, "countrySetByIntersectingCountriesInSet:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsCountryCode:", v8);
        v15 = +[HKCountrySet _versionsMatchBetweenAvailabilityRegions:availabilityRegions:]((uint64_t)a1, v11, v12);
        objc_opt_self();
        v16 = 1;
        if (!v14)
          v16 = 2;
        v17 = 3;
        if (v14)
          v17 = 4;
        if (v15)
          v18 = v16;
        else
          v18 = v17;

      }
      else
      {
        v18 = 6;
      }
    }
    else
    {
      v18 = 5;
    }

  }
  else
  {
    v18 = 2;
  }

  return v18;
}

+ (BOOL)_versionsMatchBetweenAvailabilityRegions:(void *)a3 availabilityRegions:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_msgSend(v5, "compatibilityVersion");

  v7 = objc_msgSend(v4, "compatibilityVersion");
  return v6 == v7;
}

+ (id)bitmaskPathForCountryCode:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(a3, "uppercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(&unk_1E389DBA0, "count"))
    {
      v4 = 0;
      while (1)
      {
        objc_msgSend(&unk_1E389DBB8, "objectAtIndexedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
          break;
        if (++v4 >= (unint64_t)objc_msgSend(&unk_1E389DBA0, "count"))
          goto LABEL_6;
      }
      +[HKCountrySetBitmaskPath pathWithBitmask:index:](HKCountrySetBitmaskPath, "pathWithBitmask:index:", objc_msgSend(v6, "unsignedLongLongValue"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_6:
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)countryCodeForBitmaskPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  objc_msgSend(&unk_1E389DBD0, "objectAtIndexedSubscript:", objc_msgSend(v5, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HKCountrySet_BitmaskEncoding__countryCodeForBitmaskPath___block_invoke;
  v12[3] = &unk_1E37EBD10;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "hk_filterKeysWithBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCountrySet+BitmaskEncoding.m"), 604, CFSTR("Each availability mask corresponds to one ISO 3166-1 country."));

  }
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __59__HKCountrySet_BitmaskEncoding__countryCodeForBitmaskPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v2, "bitmask");
  v5 = objc_msgSend(v3, "unsignedLongLongValue");

  return (v5 & v4) != 0;
}

+ (id)countryCodesForCountryBitmasks:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E389DBE8, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__HKCountrySet_BitmaskEncoding__countryCodesForCountryBitmasks___block_invoke;
      v13[3] = &unk_1E37EBD10;
      v14 = v6;
      v8 = v6;
      objc_msgSend(v7, "hk_filterKeysWithBlock:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v10);

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

BOOL __64__HKCountrySet_BitmaskEncoding__countryCodesForCountryBitmasks___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = objc_msgSend(v2, "unsignedLongLongValue");
  v5 = objc_msgSend(v3, "unsignedLongLongValue");

  return (v5 & v4) != 0;
}

- (HKCountrySet)initWithDictionaryRepresentation:(id)a3 provenance:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HKCountrySet *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "hk_safeArrayIfExistsForKeyPath:error:", CFSTR("countryBitmasks"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v7, "hk_safeArrayForKeyPath:error:", CFSTR("AvailableRegions"), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    if (objc_msgSend(v12, "count") == 5
      && objc_msgSend(v12, "hk_allObjectsPassTest:", &__block_literal_global_36))
    {
      objc_msgSend(v7, "hk_safeNumberIfExistsForKeyPath:error:", CFSTR("compatibilityVersion"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(v7, "hk_safeNumberForKeyPath:error:", CFSTR("AvailableRegionsVersion"), 0);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;

      v17 = objc_msgSend(v16, "integerValue");
      v11 = 0;
      if (v17)
      {
        v18 = v17;
        if (v17 != 0x7FFFFFFF)
        {
          objc_msgSend(v7, "hk_safeNumberIfExistsForKeyPath:error:", CFSTR("contentVersion"), 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "integerValue");

          self = -[HKCountrySet initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:](self, "initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:", v12, v18, v20, a4);
          v11 = self;
        }
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __60__HKCountrySet_initWithDictionaryRepresentation_provenance___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HKCountrySet)initWithCountryBitmasks:(id)a3 compatibilityVersion:(int64_t)a4 contentVersion:(int64_t)a5 provenance:(int64_t)a6
{
  id v11;
  HKCountrySet *v12;
  NSObject *v13;
  HKCountrySet *v14;
  uint64_t v15;
  NSArray *countryBitmasks;
  void *v18;
  objc_super v19;

  v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKCountrySet;
  v12 = -[HKCountrySet init](&v19, sel_init);
  if (!v12)
    goto LABEL_9;
  if (objc_msgSend(v11, "count") != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("HKCountrySet.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("countryBitmasks.count == 5"));

  }
  if (a4 < 2)
  {
    v15 = objc_msgSend(v11, "copy");
    countryBitmasks = v12->_countryBitmasks;
    v12->_countryBitmasks = (NSArray *)v15;

    v12->_compatibilityVersion = a4;
    v12->_contentVersion = a5;
    v12->_provenance = a6;
LABEL_9:
    v14 = v12;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  HKLogInfrastructure();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[HKCountrySet initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:].cold.1((uint64_t)v12, a4, v13);

  v14 = 0;
LABEL_10:

  return v14;
}

- (HKCountrySet)initWithSupportedCountryCodes:(id)a3 contentVersion:(int64_t)a4
{
  return -[HKCountrySet initWithSupportedCountryCodes:contentVersion:provenance:](self, "initWithSupportedCountryCodes:contentVersion:provenance:", a3, a4, -1);
}

- (HKCountrySet)initWithSupportedCountryCodes:(id)a3 contentVersion:(int64_t)a4 provenance:(int64_t)a5
{
  id v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HKCountrySet *v27;
  int64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v29 = a4;
    v9 = a5;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x19AEC7968]();
        +[HKCountrySet bitmaskPathForCountryCode:](HKCountrySet, "bitmaskPathForCountryCode:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "bitmask");
        v16 = objc_msgSend(v14, "index");
        *((_QWORD *)&v37 + v16) |= v15;

        objc_autoreleasePoolPop(v13);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
    v17 = *((_QWORD *)&v37 + 1);
    v8 = v37;
    v19 = *((_QWORD *)&v38 + 1);
    v18 = v38;
    v20 = v39;
    a5 = v9;
    a4 = v29;
  }
  else
  {
    v20 = 0;
    v19 = 0;
    v18 = 0;
    v17 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HKCountrySet initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:](self, "initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:", v26, 1, a4, a5);

  return v27;
}

+ (id)emptyCountrySet
{
  HKCountrySet *v2;

  v2 = [HKCountrySet alloc];
  return -[HKCountrySet initWithSupportedCountryCodes:contentVersion:provenance:](v2, "initWithSupportedCountryCodes:contentVersion:provenance:", MEMORY[0x1E0C9AA60], 0, 3);
}

- (NSDictionary)dictionaryRepresentation
{
  int64_t compatibilityVersion;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  compatibilityVersion = self->_compatibilityVersion;
  v9[0] = self->_countryBitmasks;
  v8[0] = CFSTR("countryBitmasks");
  v8[1] = CFSTR("compatibilityVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", compatibilityVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("contentVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_contentVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKCountrySet allCountryCodes](self, "allCountryCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_contentVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_provenance);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ countries=%@ contentVersion=%@ provenance=%@>"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD *v6;
  _QWORD *v7;
  NSArray *countryBitmasks;
  NSArray *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKCountrySet;
  if (-[HKCountrySet isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6;
      v5 = self->_compatibilityVersion == v6[2]
        && self->_contentVersion == v6[3]
        && ((countryBitmasks = self->_countryBitmasks, v9 = (NSArray *)v7[1], countryBitmasks == v9)
         || v9 && -[NSArray isEqual:](countryBitmasks, "isEqual:"))
        && self->_provenance == v7[4];

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_contentVersion ^ self->_compatibilityVersion;
  return v2 ^ -[NSArray hash](self->_countryBitmasks, "hash") ^ self->_provenance;
}

- (BOOL)containsCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "bitmaskPathForCountryCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HKCountrySet countryBitmasks](self, "countryBitmasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "index"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongLongValue");

    v9 = (objc_msgSend(v5, "bitmask") & v8) != 0;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)allCountryCodes
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[HKCountrySet countryBitmasks](self, "countryBitmasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCodesForCountryBitmasks:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)countrySetByIntersectingCountriesInSet:(id)a3
{
  int64_t contentVersion;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  contentVersion = self->_contentVersion;
  v5 = a3;
  v6 = objc_msgSend(v5, "contentVersion");
  if (contentVersion >= v6)
    v7 = v6;
  else
    v7 = contentVersion;
  -[HKCountrySet _countrySetByOperatingWithCountriesInSet:contentVersion:enumerationBlock:]((uint64_t)self, v5, v7, &__block_literal_global_32_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __55__HKCountrySet_countrySetByIntersectingCountriesInSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 & a2;
}

- (id)_countrySetByOperatingWithCountriesInSet:(uint64_t)a3 contentVersion:(void *)a4 enumerationBlock:
{
  uint64_t (**v6)(id, uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;

  v6 = a4;
  if (a1)
  {
    v7 = *(id *)(a1 + 8);
    objc_msgSend(a2, "countryBitmasks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "count");
    v11 = objc_msgSend(v8, "count");
    if (v10 >= v11)
      v12 = v11;
    else
      v12 = v10;
    if (v12)
    {
      v13 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedLongLongValue");

        objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedLongLongValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6[2](v6, v15, v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v18);

        ++v13;
        v19 = objc_msgSend(v7, "count");
        v20 = objc_msgSend(v8, "count");
        if (v19 >= v20)
          v21 = v20;
        else
          v21 = v19;
      }
      while (v13 < v21);
    }
    v22 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:", v9, *(_QWORD *)(a1 + 16), a3, 0);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)countrySetByAddingCountriesInSet:(id)a3
{
  int64_t contentVersion;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  contentVersion = self->_contentVersion;
  v5 = a3;
  v6 = objc_msgSend(v5, "contentVersion");
  if (contentVersion <= v6)
    v7 = v6;
  else
    v7 = contentVersion;
  -[HKCountrySet _countrySetByOperatingWithCountriesInSet:contentVersion:enumerationBlock:]((uint64_t)self, v5, v7 + 1, &__block_literal_global_33_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __49__HKCountrySet_countrySetByAddingCountriesInSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3 | a2;
}

- (id)countrySetByRemovingCountriesInSet:(id)a3
{
  int64_t contentVersion;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  contentVersion = self->_contentVersion;
  v5 = a3;
  v6 = objc_msgSend(v5, "contentVersion");
  if (contentVersion <= v6)
    v7 = v6;
  else
    v7 = contentVersion;
  -[HKCountrySet _countrySetByOperatingWithCountriesInSet:contentVersion:enumerationBlock:]((uint64_t)self, v5, v7 + 1, &__block_literal_global_34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __51__HKCountrySet_countrySetByRemovingCountriesInSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 & ~a3;
}

- (BOOL)isEmpty
{
  return !-[NSArray hk_containsObjectPassingTest:](self->_countryBitmasks, "hk_containsObjectPassingTest:", &__block_literal_global_37);
}

BOOL __23__HKCountrySet_isEmpty__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unsignedLongLongValue") != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t compatibilityVersion;
  id v5;

  compatibilityVersion = self->_compatibilityVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", compatibilityVersion, CFSTR("compatibilityVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contentVersion, CFSTR("contentVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryBitmasks, CFSTR("countryBitmasks"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_provenance, CFSTR("provenance"));

}

- (HKCountrySet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKCountrySet *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("countryBitmasks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 5)
  {
    self = -[HKCountrySet initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:](self, "initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:", v6, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("compatibilityVersion")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentVersion")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("provenance")));
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)countryBitmasks
{
  return self->_countryBitmasks;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryBitmasks, 0);
}

+ (id)regionsWithPlistAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  v6 = a3;
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v8 = (id)objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("plist"));
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v6, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
  {
    +[HKCountrySet _decodePlistDictionary:]((uint64_t)a1, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v10;
    v14 = v13;
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError(v13);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)_decodePlistDictionary:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AvailableRegionsVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AvailableRegions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v7, "getBytes:length:", &v12, 8);
      v12 = bswap64(v12);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      ++v6;
    }
    while (objc_msgSend(v4, "count") > v6);
  }
  v13[0] = CFSTR("countryBitmasks");
  v9 = (void *)objc_msgSend(v5, "copy");
  v13[1] = CFSTR("compatibilityVersion");
  v14[0] = v9;
  v14[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)countrySetWithPlistURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  HKCountrySet *v8;
  HKCountrySet *v9;
  HKCountrySet *v10;
  HKCountrySet *v11;
  id v13;

  v13 = 0;
  objc_msgSend(a1, "regionsWithPlistAtURL:error:", a3, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  v7 = v6;
  if (!v5)
  {
    v11 = (HKCountrySet *)v6;
    v9 = v11;
    if (v11)
    {
      if (a4)
      {
        v9 = objc_retainAutorelease(v11);
        v10 = 0;
        *a4 = v9;
        goto LABEL_10;
      }
      _HKLogDroppedError(v11);
    }
    v10 = 0;
    goto LABEL_10;
  }
  v8 = -[HKCountrySet initWithDictionaryRepresentation:provenance:]([HKCountrySet alloc], "initWithDictionaryRepresentation:provenance:", v5, 1);
  v9 = v8;
  if (v8)
  {
    v9 = v8;
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 3, CFSTR("Plist contents were in an invalid format"));
    v10 = 0;
  }
LABEL_10:

  return v10;
}

- (void)initWithCountryBitmasks:(NSObject *)a3 compatibilityVersion:contentVersion:provenance:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = v5;
  objc_msgSend(v6, "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v5;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Attempted to decode unsupported version: %{public}@", (uint8_t *)&v9, 0x16u);

}

@end
