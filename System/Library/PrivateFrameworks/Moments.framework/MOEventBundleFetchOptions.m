@implementation MOEventBundleFetchOptions

- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 filterBundle:(BOOL)a7
{
  return -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:", a3, a4, a5, a6, 0, 0);
}

- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 includeDeletedBundles:(BOOL)a6 skipRanking:(BOOL)a7
{
  return -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:", 0, a3, a4, a5, a6, a7);
}

- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 includeDeletedBundles:(BOOL)a6 skipRanking:(BOOL)a7 interfaceType:(unint64_t)a8
{
  return -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:](self, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:", 0, a3, a4, a5, a6, a7, a8);
}

- (MOEventBundleFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5 filterBundle:(BOOL)a6
{
  return -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", a3, a4, a5, 0, 0);
}

- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 includeDeletedBundles:(BOOL)a7 skipRanking:(BOOL)a8
{
  return -[MOEventBundleFetchOptions initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:](self, "initWithAllowedCategories:dateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:", a3, a4, a5, a6, a7, a8, 16);
}

- (MOEventBundleFetchOptions)initWithAllowedCategories:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 includeDeletedBundles:(BOOL)a7 skipRanking:(BOOL)a8 interfaceType:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  MOEventBundleFetchOptions *v19;
  MOEventBundleFetchOptions *v20;
  objc_super v22;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MOEventBundleFetchOptions;
  v19 = -[MOEventBundleFetchOptions init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_ascending = a5;
    objc_storeStrong((id *)&v19->_dateInterval, a4);
    objc_storeStrong((id *)&v20->_limit, a6);
    v20->_filterBundle = 0;
    objc_storeStrong((id *)&v20->_categories, a3);
    v20->_includeDeletedBundles = a7;
    v20->_skipRanking = a8;
    v20->_interfaceType = a9;
  }

  return v20;
}

- (MOEventBundleFetchOptions)initWithIdentifiers:(id)a3 ascending:(BOOL)a4 filterBundle:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  MOEventBundleFetchOptions *v9;
  MOEventBundleFetchOptions *v10;

  v5 = a4;
  v8 = a3;
  v9 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", 0, v5, 0, 0, 0);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_identifiers, a3);

  return v10;
}

- (MOEventBundleFetchOptions)initWithIdentifiers:(id)a3 ascending:(BOOL)a4 filterBundle:(BOOL)a5 skipRanking:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  MOEventBundleFetchOptions *v11;
  MOEventBundleFetchOptions *v12;

  v6 = a6;
  v7 = a4;
  v10 = a3;
  v11 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", 0, v7, 0, 0, v6);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->_identifiers, a3);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 ascending;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  ascending = self->_ascending;
  v8 = a3;
  objc_msgSend(v4, "numberWithBool:", ascending);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("ascending"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_skipRanking);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("skipRanking"));

  objc_msgSend(v8, "encodeBool:forKey:", self->_includeDeletedBundles, CFSTR("includeDeletedBundles"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_identifiers, CFSTR("identifiers"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_interfaceType, CFSTR("interfaceType"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_personalizedSensingFilter, CFSTR("pssFilter"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_personalizedSensingVisitsAllowed, CFSTR("pssVisits"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_skipLocalization, CFSTR("skipLocalization"));

}

- (MOEventBundleFetchOptions)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MOEventBundleFetchOptions *v18;
  MOEventBundleFetchOptions *v19;
  unsigned int v21;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ascending"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skipRanking"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("includeDeletedBundles"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("skipLocalization"));
  v11 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("pssFilter"));
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("pssVisits"));
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("identifiers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("interfaceType"));
  v18 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:](self, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:", v5, v21, v6, v9, v8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifiers, v16);
    v19->_interfaceType = v17;
    v19->_personalizedSensingFilter = v11;
    v19->_personalizedSensingVisitsAllowed = v12;
    v19->_skipLocalization = v10;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  MOEventBundleFetchOptions *v4;
  MOEventBundleFetchOptions *v5;
  BOOL v6;

  v4 = (MOEventBundleFetchOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MOEventBundleFetchOptions isEqualToFetchOptions:](self, "isEqualToFetchOptions:", v5);

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  void *v3;
  id v5;
  int ascending;
  int v7;
  NSDateInterval *dateInterval;
  uint64_t v9;
  void *v10;
  NSDateInterval *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  NSNumber *limit;
  void *v18;
  int filterBundle;
  int v20;
  int skipRanking;
  int v22;
  BOOL v23;

  v5 = a3;
  ascending = self->_ascending;
  v7 = objc_msgSend(v5, "ascending");
  dateInterval = self->_dateInterval;
  if (dateInterval)
    goto LABEL_2;
  objc_msgSend(v5, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v13 = 1;
    goto LABEL_11;
  }
  if (self->_dateInterval)
  {
LABEL_2:
    objc_msgSend(v5, "dateInterval");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = self->_dateInterval;
      objc_msgSend(v5, "dateInterval");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSDateInterval isEqualToDateInterval:](v11, "isEqualToDateInterval:", v12);

      if (dateInterval)
        goto LABEL_12;
    }
    else
    {
      v13 = 0;
      if (dateInterval)
        goto LABEL_12;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_11:

LABEL_12:
  if (self->_limit)
  {
    objc_msgSend(v5, "limit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = 1;
    }
    else if (self->_limit)
    {
      objc_msgSend(v5, "limit");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        limit = self->_limit;
        objc_msgSend(v5, "limit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[NSNumber isEqualToNumber:](limit, "isEqualToNumber:", v18);

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  filterBundle = self->_filterBundle;
  v20 = objc_msgSend(v5, "filterBundle");
  skipRanking = self->_skipRanking;
  v22 = objc_msgSend(v5, "skipRanking");
  v23 = 0;
  if (ascending == v7 && ((v13 ^ 1) & 1) == 0 && v15)
    v23 = filterBundle == v20 && skipRanking == v22;

  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ascending);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSDateInterval hash](self->_dateInterval, "hash");
  v6 = v5 ^ -[NSNumber hash](self->_limit, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_filterBundle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_skipRanking);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_ascending)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_filterBundle)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_skipRanking)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_personalizedSensingFilter)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_personalizedSensingVisitsAllowed)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ascending, %@,  startDate, %@, endDate, %@, limit, %@, filterBundle, %@, skipRanking, %@, interfaceType, %lu, pssFilter, %@, pssVisits, %@"), v4, v6, v8, self->_limit, v10, v11, self->_interfaceType, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)limit
{
  return self->_limit;
}

- (BOOL)filterBundle
{
  return self->_filterBundle;
}

- (BOOL)includeDeletedBundles
{
  return self->_includeDeletedBundles;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)skipRanking
{
  return self->_skipRanking;
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (BOOL)personalizedSensingFilter
{
  return self->_personalizedSensingFilter;
}

- (void)setPersonalizedSensingFilter:(BOOL)a3
{
  self->_personalizedSensingFilter = a3;
}

- (BOOL)personalizedSensingVisitsAllowed
{
  return self->_personalizedSensingVisitsAllowed;
}

- (void)setPersonalizedSensingVisitsAllowed:(BOOL)a3
{
  self->_personalizedSensingVisitsAllowed = a3;
}

- (BOOL)skipLocalization
{
  return self->_skipLocalization;
}

- (void)setSkipLocalization:(BOOL)a3
{
  self->_skipLocalization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
