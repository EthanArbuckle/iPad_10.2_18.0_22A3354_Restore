@implementation PHSearchSuggestion

- (PHSearchSuggestion)init
{
  PHSearchSuggestion *v2;
  id v3;

  v2 = self;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PHSearchSuggestion)initWithType:(unint64_t)a3 categoriesType:(unint64_t)a4 text:(id)a5 matchRangeOfSearchText:(_NSRange)a6 count:(unint64_t)a7 suggestionComponents:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  PHSearchSuggestion *v17;
  uint64_t v18;
  NSString *text;
  uint64_t v20;
  NSArray *suggestionComponents;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  length = a6.length;
  location = a6.location;
  v15 = a5;
  v16 = a8;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("categoriesType != PHSearchSuggestionCategoriesTypeUndefined"));

    if (v15)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != PHSearchSuggestionTypeUndefined"));

  if (!a4)
    goto LABEL_14;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text"));

LABEL_4:
  if (a3 - 1 <= 1)
  {
    if (!objc_msgSend(v16, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionComponents.count > 0"));

    }
    if (a3 == 1 && location == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchRangeOfSearchText.location != NSNotFound"));

    }
  }
  v28.receiver = self;
  v28.super_class = (Class)PHSearchSuggestion;
  v17 = -[PHSearchSuggestion init](&v28, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    text = v17->_text;
    v17->_text = (NSString *)v18;

    v17->_type = a3;
    v17->_categoriesType = a4;
    v17->_matchRangeOfSearchText.location = location;
    v17->_matchRangeOfSearchText.length = length;
    v17->_count = a7;
    v20 = objc_msgSend(v16, "copy");
    suggestionComponents = v17->_suggestionComponents;
    v17->_suggestionComponents = (NSArray *)v20;

  }
  return v17;
}

- (BOOL)hasApproximateCount
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    objc_msgSend((id)objc_opt_class(), "indexCategoriesWithApproximateCounts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PHSearchSuggestion suggestionComponents](self, "suggestionComponents", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(v3, "containsIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "indexCategory")) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (float)score
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t i;
  float v11;
  float v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PHSearchSuggestion suggestionComponents](self, "suggestionComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0.0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PHSearchSuggestion suggestionComponents](self, "suggestionComponents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "score");
        v9 = v9 + v11;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  -[PHSearchSuggestion suggestionComponents](self, "suggestionComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9 / (float)(unint64_t)objc_msgSend(v13, "count");

  return v12;
}

- (NSArray)personUUIDs
{
  NSArray *personUUIDs;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  personUUIDs = self->_personUUIDs;
  if (!personUUIDs)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PHSearchSuggestion suggestionComponents](self, "suggestionComponents", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "indexCategory") == 1300
            || objc_msgSend(v10, "indexCategory") == 1301
            || objc_msgSend(v10, "indexCategory") == 1330
            || objc_msgSend(v10, "indexCategory") == 1331)
          {
            objc_msgSend(v10, "lookupIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v12 = (NSArray *)objc_msgSend(v4, "copy");
    v13 = self->_personUUIDs;
    self->_personUUIDs = v12;

    personUUIDs = self->_personUUIDs;
  }
  return personUUIDs;
}

- (BOOL)isEqual:(id)a3
{
  PHSearchSuggestion *v4;
  PHSearchSuggestion *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  unint64_t v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v4 = (PHSearchSuggestion *)a3;
  if (v4 == self)
  {
    v10 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  v6 = -[PHSearchSuggestion type](self, "type");
  if (v6 != -[PHSearchSuggestion type](v5, "type"))
    goto LABEL_5;
  -[PHSearchSuggestion text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSearchSuggestion text](v5, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "localizedCaseInsensitiveCompare:", v8);

  if (v9)
    goto LABEL_5;
  -[PHSearchSuggestion personUUIDs](self, "personUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (-[PHSearchSuggestion personUUIDs](v5, "personUUIDs"), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    v15 = (void *)MEMORY[0x1E0C99E60];
    -[PHSearchSuggestion personUUIDs](self, "personUUIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99E60];
    -[PHSearchSuggestion personUUIDs](v5, "personUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "isEqualToSet:", v20);

    if ((v21 & 1) == 0)
      goto LABEL_5;
  }
  else
  {
    -[PHSearchSuggestion personUUIDs](self, "personUUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchSuggestion personUUIDs](v5, "personUUIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    if (v22 != v23)
      goto LABEL_5;
  }
  v24 = -[PHSearchSuggestion count](self, "count");
  if (v24 != -[PHSearchSuggestion count](v5, "count"))
    goto LABEL_5;
  v25 = -[PHSearchSuggestion hasApproximateCount](self, "hasApproximateCount");
  if (v25 != -[PHSearchSuggestion hasApproximateCount](v5, "hasApproximateCount"))
    goto LABEL_5;
  -[PHSearchSuggestion startDate](self, "startDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26 && (-[PHSearchSuggestion startDate](v5, "startDate"), (v27 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = (void *)v27;
    -[PHSearchSuggestion startDate](self, "startDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchSuggestion startDate](v5, "startDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqualToDate:", v30);

    if ((v31 & 1) == 0)
      goto LABEL_5;
  }
  else
  {
    -[PHSearchSuggestion startDate](self, "startDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchSuggestion startDate](v5, "startDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    if (v32 != v33)
      goto LABEL_5;
  }
  -[PHSearchSuggestion endDate](self, "endDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34 && (-[PHSearchSuggestion endDate](v5, "endDate"), (v35 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v36 = (void *)v35;
    -[PHSearchSuggestion endDate](self, "endDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchSuggestion endDate](v5, "endDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqualToDate:", v38);

    if ((v39 & 1) == 0)
      goto LABEL_5;
  }
  else
  {
    -[PHSearchSuggestion endDate](self, "endDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchSuggestion endDate](v5, "endDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    if (v40 != v41)
      goto LABEL_5;
  }
  -[PHSearchSuggestion locationAssetUUIDs](self, "locationAssetUUIDs");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42
    && (-[PHSearchSuggestion locationAssetUUIDs](v5, "locationAssetUUIDs"),
        (v43 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v44 = (void *)v43;
    -[PHSearchSuggestion locationAssetUUIDs](self, "locationAssetUUIDs");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchSuggestion locationAssetUUIDs](v5, "locationAssetUUIDs");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqualToSet:", v46);

    if ((v47 & 1) == 0)
      goto LABEL_5;
  }
  else
  {
    -[PHSearchSuggestion locationAssetUUIDs](self, "locationAssetUUIDs");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchSuggestion locationAssetUUIDs](v5, "locationAssetUUIDs");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    if (v48 != v49)
      goto LABEL_5;
  }
  v50 = -[PHSearchSuggestion categoriesType](self, "categoriesType");
  if (v50 == -[PHSearchSuggestion categoriesType](v5, "categoriesType"))
  {
    -[PHSearchSuggestion suggestionComponents](self, "suggestionComponents");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51
      && (-[PHSearchSuggestion suggestionComponents](v5, "suggestionComponents"),
          (v52 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v53 = (void *)v52;
      -[PHSearchSuggestion suggestionComponents](self, "suggestionComponents");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHSearchSuggestion suggestionComponents](v5, "suggestionComponents");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v54, "isEqualToArray:", v55);

      v56 = v54;
    }
    else
    {
      -[PHSearchSuggestion suggestionComponents](self, "suggestionComponents");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHSearchSuggestion suggestionComponents](v5, "suggestionComponents");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v53 == v56;
    }

    goto LABEL_6;
  }
LABEL_5:
  v10 = 0;
LABEL_6:

LABEL_9:
  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;

  v3 = -[PHSearchSuggestion type](self, "type");
  -[PHSearchSuggestion text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedLowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[PHSearchSuggestion personUUIDs](self, "personUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ v3 ^ objc_msgSend(v7, "hash");
  v9 = -[PHSearchSuggestion matchRangeOfSearchText](self, "matchRangeOfSearchText");
  -[PHSearchSuggestion startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[PHSearchSuggestion endDate](self, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 ^ v11 ^ objc_msgSend(v12, "hash");
  -[PHSearchSuggestion locationAssetUUIDs](self, "locationAssetUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  v16 = v15 ^ -[PHSearchSuggestion count](self, "count");
  v17 = v16 ^ -[PHSearchSuggestion hasApproximateCount](self, "hasApproximateCount");
  v18 = v13 ^ v17 ^ -[PHSearchSuggestion categoriesType](self, "categoriesType");
  -[PHSearchSuggestion suggestionComponents](self, "suggestionComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");

  return v20;
}

- (PHSearchSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  PHSearchSuggestion *v26;
  PHSearchSuggestion *v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchSuggestionPropertyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchSuggestionPropertyCategoriesType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchSuggestionPropertyText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchSuggestionPropertyMatchRangeOfSearchText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v8, "rangeValue");
  v10 = v9;

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("PHSearchSuggestionPropertyPersonUUIDs"));
  v34 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchSuggestionPropertyCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchSuggestionPropertyStartDate"));
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchSuggestionPropertyEndDate"));
  v32 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("PHSearchSuggestionPropertyLocationAssetUUIDs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("PHSearchSuggestionPropertySuggestionComponents"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v35;
  if (v36 != 3)
    goto LABEL_7;
  if (!objc_msgSend((id)objc_opt_class(), "_suggestionsCategoryTypeIsSupportedForDisambiguation:", v37))
  {
    v26 = 0;
    goto LABEL_10;
  }
  if (v37 == 1)
  {
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      self = (PHSearchSuggestion *)-[PHSearchSuggestion initForLocationFilterWithAssetUUIDs:locationText:](self, "initForLocationFilterWithAssetUUIDs:locationText:", v31, 0);

      v26 = self;
      goto LABEL_10;
    }
    v27 = -[PHSearchSuggestion initForLocationFilterWithAssetUUIDs:locationText:](self, "initForLocationFilterWithAssetUUIDs:locationText:", 0, v7);
    goto LABEL_8;
  }
  if (v37 == 4)
  {
    v29 = (void *)v32;
    v28 = (void *)v33;
    self = (PHSearchSuggestion *)-[PHSearchSuggestion initForDateFilterWithStartDate:endDate:](self, "initForDateFilterWithStartDate:endDate:", v33, v32);
    v26 = self;
    v25 = (void *)v34;
    goto LABEL_12;
  }
  v24 = v35;
  if (v37 != 7)
  {
LABEL_7:
    v27 = -[PHSearchSuggestion initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:](self, "initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:", v36, v37, v7, v24, v10, v15, v23);
LABEL_8:
    self = v27;
    v26 = self;
LABEL_10:
    v25 = (void *)v34;
    goto LABEL_11;
  }
  v25 = (void *)v34;
  self = (PHSearchSuggestion *)-[PHSearchSuggestion initForPersonFilterWithPersonUUIDs:](self, "initForPersonFilterWithPersonUUIDs:", v34);
  v26 = self;
LABEL_11:
  v29 = (void *)v32;
  v28 = (void *)v33;
LABEL_12:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t type;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v11 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("PHSearchSuggestionPropertyType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_categoriesType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("PHSearchSuggestionPropertyCategoriesType"));

  objc_msgSend(v11, "encodeObject:forKey:", self->_text, CFSTR("PHSearchSuggestionPropertyText"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_matchRangeOfSearchText.location, self->_matchRangeOfSearchText.length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("PHSearchSuggestionPropertyMatchRangeOfSearchText"));

  objc_msgSend(v11, "encodeObject:forKey:", self->_personUUIDs, CFSTR("PHSearchSuggestionPropertyPersonUUIDs"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_count);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("PHSearchSuggestionPropertyCount"));

  objc_msgSend(v11, "encodeObject:forKey:", self->_startDate, CFSTR("PHSearchSuggestionPropertyStartDate"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_endDate, CFSTR("PHSearchSuggestionPropertyEndDate"));
  -[NSSet allObjects](self->_locationAssetUUIDs, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("PHSearchSuggestionPropertyLocationAssetUUIDs"));

  objc_msgSend(v11, "encodeObject:forKey:", self->_suggestionComponents, CFSTR("PHSearchSuggestionPropertySuggestionComponents"));
}

- (id)description
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  unint64_t type;
  __CFString *v7;
  __CFString *v8;
  unint64_t categoriesType;
  __CFString *v10;
  __CFString *v11;
  NSString *text;
  NSUInteger location;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;

  v3 = -[PHSearchSuggestion hasApproximateCount](self, "hasApproximateCount");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  v19 = (void *)MEMORY[0x1E0CB3940];
  v5 = v4;
  v18 = objc_opt_class();
  type = self->_type;
  if (type - 1 > 3)
    v7 = CFSTR("PHSearchSuggestionTypeUndefined");
  else
    v7 = off_1E35D5F38[type - 1];
  v8 = v7;
  categoriesType = self->_categoriesType;
  if (categoriesType - 1 > 0x28)
    v10 = CFSTR("PHSearchSuggestionCategoriesTypeUndefined");
  else
    v10 = off_1E35D8E08[categoriesType - 1];
  v11 = v10;
  text = self->_text;
  location = self->_matchRangeOfSearchText.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = CFSTR("NSNotFound");
  }
  else
  {
    NSStringFromRange(self->_matchRangeOfSearchText);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[PHSearchSuggestion personUUIDs](self, "personUUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@: %p, type: %ld (%@), categories type: %ld (%@) text: '%@', match range: %@, personUUIDs: %@, count: %tu, hasApproximateCount: %@, start date: %@, end date: %@, location asset UUIDs: %@"), v18, self, type, v8, categoriesType, v11, text, v14, v15, self->_count, v5, self->_startDate, self->_endDate, self->_locationAssetUUIDs);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (location != 0x7FFFFFFFFFFFFFFFLL)
  return v16;
}

- (id)jsonDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSUInteger location;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  unint64_t categoriesType;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[5];
  NSRange v22;

  v21[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v20[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchSuggestion type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v20[1] = CFSTR("categories_type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchSuggestion categoriesType](self, "categoriesType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  v20[2] = CFSTR("text");
  -[PHSearchSuggestion text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v6;
  v20[3] = CFSTR("match_range");
  location = self->_matchRangeOfSearchText.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = &stru_1E35DFFF8;
  }
  else
  {
    v22.location = -[PHSearchSuggestion matchRangeOfSearchText](self, "matchRangeOfSearchText");
    NSStringFromRange(v22);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v21[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithDictionary:", v9);

  if (location != 0x7FFFFFFFFFFFFFFFLL)
  if (self->_type - 1 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchSuggestion count](self, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("count"));

    if (-[PHSearchSuggestion hasApproximateCount](self, "hasApproximateCount"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("has_approximate_count"));
  }
  categoriesType = self->_categoriesType;
  if (categoriesType == 9 || categoriesType == 7)
  {
    -[PHSearchSuggestion personUUIDs](self, "personUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("personUUIDs"));

    categoriesType = self->_categoriesType;
  }
  if (categoriesType == 1)
  {
    -[PHSearchSuggestion locationAssetUUIDs](self, "locationAssetUUIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("location_assetUUIDs"));

    categoriesType = self->_categoriesType;
  }
  if (categoriesType == 4)
  {
    -[PHSearchSuggestion startDate](self, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("start_date"));

    -[PHSearchSuggestion endDate](self, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("end_date"));

  }
  v18 = (void *)objc_msgSend(v10, "copy");

  return v18;
}

- (PHSearchSuggestion)initWithType:(unint64_t)a3 entityType:(unint64_t)a4 text:(id)a5 matchRangeOfSearchText:(_NSRange)a6 personUUID:(id)a7 count:(unint64_t)a8
{
  NSUInteger length;
  NSUInteger location;
  id v16;
  id v17;
  NSObject *v18;
  PHSearchSuggestion *v19;
  PHSearchSuggestion *v20;
  uint64_t v21;
  NSArray *personUUIDs;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[16];
  _QWORD v30[2];

  length = a6.length;
  location = a6.location;
  v30[1] = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v17 = a7;
  PLSearchBackendQueryGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_ERROR, "WARNING: this PHSearchSuggestion initializer has been deprecated, and will not behave as expected in the Photos Search query pipeline.", buf, 2u);
  }

  if (a3)
  {
    if (v16)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != PHSearchSuggestionTypeUndefined"));

    if (v16)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text"));

LABEL_5:
  if ((a4 == 1330 || a4 == 1300) && !objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 284, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUID.length > 0"));

  }
  if (a3 == 1 && location == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matchRangeOfSearchText.location != NSNotFound"));

  }
  v28.receiver = self;
  v28.super_class = (Class)PHSearchSuggestion;
  v19 = -[PHSearchSuggestion init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_text, a5);
    v20->_type = a3;
    v20->_entityType = a4;
    if (objc_msgSend(v17, "length"))
    {
      v30[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v21 = objc_claimAutoreleasedReturnValue();
      personUUIDs = v20->_personUUIDs;
      v20->_personUUIDs = (NSArray *)v21;
    }
    else
    {
      personUUIDs = v20->_personUUIDs;
      v20->_personUUIDs = 0;
    }

    v20->_matchRangeOfSearchText.location = location;
    v20->_matchRangeOfSearchText.length = length;
    v20->_count = a8;
  }

  return v20;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)categoriesType
{
  return self->_categoriesType;
}

- (_NSRange)matchRangeOfSearchText
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_matchRangeOfSearchText.length;
  location = self->_matchRangeOfSearchText.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setPersonUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_personUUIDs, a3);
}

- (unint64_t)entityType
{
  return self->_entityType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSSet)locationAssetUUIDs
{
  return self->_locationAssetUUIDs;
}

- (NSArray)suggestionComponents
{
  return self->_suggestionComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionComponents, 0);
  objc_storeStrong((id *)&self->_locationAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_personUUIDs, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (PHSearchSuggestion)new
{
  id v2;
  id v3;

  v2 = a1;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)indexCategoriesWithApproximateCounts
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 1500);
  objc_msgSend(v2, "addIndex:", 1501);
  objc_msgSend(v2, "addIndex:", 2600);
  objc_msgSend(v2, "addIndex:", 2601);
  objc_msgSend(v2, "addIndex:", 2500);
  objc_msgSend(v2, "addIndex:", 2501);
  objc_msgSend(v2, "addIndex:", 1104);
  objc_msgSend(v2, "addIndex:", 1510);
  objc_msgSend(v2, "addIndex:", 1520);
  objc_msgSend(v2, "addIndex:", 1530);
  objc_msgSend(v2, "addIndex:", 1540);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_suggestionsCategoryTypeIsSupportedForDisambiguation:(unint64_t)a3
{
  return (a3 < 8) & (0x92u >> a3);
}

- (id)initForLocationFilterWithAssetUUIDs:(id)a3 locationText:(id)a4
{
  id v8;
  __CFString *v9;
  char *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = (__CFString *)a4;
  if (!objc_msgSend(v8, "count") && !-[__CFString length](v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUIDs.count > 0 || locationText.length > 0"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PHSearchSuggestion;
  v10 = -[PHSearchSuggestion init](&v16, sel_init);
  if (v10)
  {
    if (objc_msgSend(v8, "count"))
    {
      v11 = (void *)*((_QWORD *)v10 + 1);
      *((_QWORD *)v10 + 1) = &stru_1E35DFFF8;
    }
    else
    {
      v12 = &stru_1E35DFFF8;
      if (v9)
        v12 = v9;
      v13 = v12;
      v11 = (void *)*((_QWORD *)v10 + 1);
      *((_QWORD *)v10 + 1) = v13;
    }

    objc_storeStrong((id *)v10 + 9, a3);
    *((_OWORD *)v10 + 1) = xmmword_19944ACE0;
    *(_OWORD *)(v10 + 88) = xmmword_19944AC80;
  }

  return v10;
}

- (id)initForPersonFilterWithPersonUUIDs:(id)a3
{
  id v6;
  PHSearchSuggestion *v7;
  PHSearchSuggestion *v8;
  NSString *text;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUIDs.count > 0"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PHSearchSuggestion;
  v7 = -[PHSearchSuggestion init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    text = v7->_text;
    v7->_text = (NSString *)&stru_1E35DFFF8;

    *(_OWORD *)&v8->_type = xmmword_19944ACF0;
    objc_storeStrong((id *)&v8->_personUUIDs, a3);
    v8->_matchRangeOfSearchText = (_NSRange)xmmword_19944AC80;
  }

  return v8;
}

- (id)initForDateFilterWithStartDate:(id)a3 endDate:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PHSearchSuggestion *v11;
  PHSearchSuggestion *v12;
  NSString *text;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)PHSearchSuggestion;
  v11 = -[PHSearchSuggestion init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    text = v11->_text;
    v11->_text = (NSString *)&stru_1E35DFFF8;

    *(_OWORD *)&v12->_type = xmmword_19944AD00;
    v12->_matchRangeOfSearchText = (_NSRange)xmmword_19944AC80;
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
  }

  return v12;
}

- (id)initForGenericLocationFilterWithText:(id)a3 genericLocationTuples:(id)a4 allowedIndexCategories:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHSearchSuggestion *v12;
  PHSearchSuggestion *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  id v23;
  void *v24;
  double v25;
  void *v26;
  BOOL v27;
  id v28;
  double v29;
  uint64_t v30;
  NSArray *suggestionComponents;
  PHSearchSuggestion *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v39.receiver = self;
  v39.super_class = (Class)PHSearchSuggestion;
  v12 = -[PHSearchSuggestion init](&v39, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_text, a3);
    *(_OWORD *)&v13->_type = xmmword_19944AD10;
    v33 = v13;
    v13->_matchRangeOfSearchText = (_NSRange)xmmword_19944AC80;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v10;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (!v16)
      goto LABEL_27;
    v17 = v16;
    v18 = *(_QWORD *)v36;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "indexCategory");
        if (!objc_msgSend(v11, "count") || objc_msgSend(v11, "containsIndex:", v21))
        {
          if (v21 > 1599)
          {
            v27 = (unint64_t)(v21 - 1800) > 3 || v21 == 1801;
            if (!v27 || (unint64_t)(v21 - 1600) < 2 || (unint64_t)(v21 - 1700) < 2)
            {
              v28 = objc_alloc(MEMORY[0x1E0D71AF8]);
              LODWORD(v29) = 0;
              v26 = (void *)objc_msgSend(v28, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v9, 0, 0, 0, 0, v21, v29, 0, 3, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
              if (v26)
              {
LABEL_24:
                objc_msgSend(v14, "addObject:", v26);

                continue;
              }
            }
          }
          else if ((unint64_t)(v21 - 1500) <= 0x1F && ((1 << (v21 + 36)) & 0xC0300C03) != 0)
          {
            v23 = objc_alloc(MEMORY[0x1E0D71AF8]);
            objc_msgSend(v20, "lookupIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v25) = 0;
            v26 = (void *)objc_msgSend(v23, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v9, 0, 0, 0, 0, v21, v25, v24, 3, 0, 0x7FFFFFFFFFFFFFFFLL, 0);

            if (v26)
              goto LABEL_24;
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (!v17)
      {
LABEL_27:

        v30 = objc_msgSend(v14, "copy");
        v13 = v33;
        suggestionComponents = v33->_suggestionComponents;
        v33->_suggestionComponents = (NSArray *)v30;

        v10 = v34;
        break;
      }
    }
  }

  return v13;
}

- (id)initForTripFilterWithLocationName:(id)a3
{
  id v6;
  PHSearchSuggestion *v7;
  PHSearchSuggestion *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 426, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationName.length > 0"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PHSearchSuggestion;
  v7 = -[PHSearchSuggestion init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_text, a3);
    *(_OWORD *)&v8->_type = xmmword_19944AD20;
    v8->_matchRangeOfSearchText = (_NSRange)xmmword_19944AC80;
  }

  return v8;
}

- (id)initForMeaningFilterWitMeaningfulEvent:(id)a3
{
  id v6;
  PHSearchSuggestion *v7;
  PHSearchSuggestion *v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *suggestionComponents;
  void *v16;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchSuggestion.m"), 442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("meaningfulEvent.length > 0"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PHSearchSuggestion;
  v7 = -[PHSearchSuggestion init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_text, a3);
    *(_OWORD *)&v8->_type = xmmword_19944AD10;
    v8->_matchRangeOfSearchText = (_NSRange)xmmword_19944AC80;
    v9 = objc_alloc(MEMORY[0x1E0D71AF8]);
    LODWORD(v10) = 0;
    v11 = objc_msgSend(v9, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v6, 0, 0, 0, 0, 1600, v10, 0, 3, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    v12 = (void *)v11;
    if (v11)
    {
      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      suggestionComponents = v8->_suggestionComponents;
      v8->_suggestionComponents = (NSArray *)v13;

    }
  }

  return v8;
}

@end
