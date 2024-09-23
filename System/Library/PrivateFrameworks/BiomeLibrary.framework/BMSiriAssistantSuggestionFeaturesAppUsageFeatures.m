@implementation BMSiriAssistantSuggestionFeaturesAppUsageFeatures

- (BMSiriAssistantSuggestionFeaturesAppUsageFeatures)initWithAppUsage:(id)a3 appCategoryUsage:(id)a4
{
  id v7;
  id v8;
  BMSiriAssistantSuggestionFeaturesAppUsageFeatures *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMSiriAssistantSuggestionFeaturesAppUsageFeatures;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_appUsage, a3);
    objc_storeStrong((id *)&v9->_appCategoryUsage, a4);
  }

  return v9;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures appUsage](self, "appUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures appCategoryUsage](self, "appCategoryUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesAppUsageFeatures with appUsage: %@, appCategoryUsage: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeaturesAppUsageFeatures *v5;
  void *v6;
  void *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  int v20;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSArray *appUsage;
  uint64_t v28;
  NSArray *appCategoryUsage;
  int v30;
  BMSiriAssistantSuggestionFeaturesAppUsageFeatures *v31;
  objc_super v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMSiriAssistantSuggestionFeaturesAppUsageFeatures;
  v5 = -[BMEventBase init](&v33, sel_init);
  if (!v5)
    goto LABEL_31;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v10])
        goto LABEL_30;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = *v8;
        v16 = *(_QWORD *)&v4[v15];
        v17 = v16 + 1;
        if (v16 == -1 || v17 > *(_QWORD *)&v4[*v9])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v4[*v11] + v16);
        *(_QWORD *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0)
          goto LABEL_13;
        v12 += 7;
        if (v13++ >= 9)
        {
          v14 = 0;
          v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v20 = v4[*v10];
      if (v4[*v10])
        v14 = 0;
LABEL_15:
      if (v20 || (v14 & 7) == 4)
        goto LABEL_30;
      if ((v14 >> 3) == 2)
        break;
      if ((v14 >> 3) == 1)
      {
        v34 = 0;
        v35 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_32;
        v22 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket initByReadFrom:]([BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket alloc], "initByReadFrom:", v4);
        if (!v22)
          goto LABEL_32;
        v23 = v22;
        v24 = v6;
LABEL_27:
        objc_msgSend(v24, "addObject:", v23);
        PBReaderRecallMark();

        goto LABEL_29;
      }
      if (!PBReaderSkipValueWithTag())
        goto LABEL_32;
LABEL_29:
      if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
        goto LABEL_30;
    }
    v34 = 0;
    v35 = 0;
    if ((PBReaderPlaceMark() & 1) == 0
      || (v25 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket initByReadFrom:]([BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket alloc], "initByReadFrom:", v4)) == 0)
    {
LABEL_32:

      goto LABEL_33;
    }
    v23 = v25;
    v24 = v7;
    goto LABEL_27;
  }
LABEL_30:
  v26 = objc_msgSend(v6, "copy");
  appUsage = v5->_appUsage;
  v5->_appUsage = (NSArray *)v26;

  v28 = objc_msgSend(v7, "copy");
  appCategoryUsage = v5->_appCategoryUsage;
  v5->_appCategoryUsage = (NSArray *)v28;

  v30 = v4[*v10];
  if (v30)
LABEL_33:
    v31 = 0;
  else
LABEL_31:
    v31 = v5;

  return v31;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_appUsage;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v21 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_appCategoryUsage;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        v21 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4, (_QWORD)v17);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v13);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesAppUsageFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket *v16;
  BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  id *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id *v26;
  uint64_t *v27;
  void *v28;
  void *v29;
  BMSiriAssistantSuggestionFeaturesAppUsageFeatures *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket *v37;
  BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket *v38;
  id v39;
  id v40;
  uint64_t v41;
  id *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id *v46;
  uint64_t *v47;
  void *v48;
  id v50;
  uint64_t v51;
  void *v52;
  id *v53;
  BMSiriAssistantSuggestionFeaturesAppUsageFeatures *v54;
  id v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  _BYTE v71[128];
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  _BYTE v78[128];
  uint64_t v79;
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appUsage"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  v55 = v6;
  if (v9)
  {
    v53 = a4;
    v54 = self;

    v7 = 0;
  }
  else
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v41 = *MEMORY[0x1E0D025B8];
          v79 = *MEMORY[0x1E0CB2D50];
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("appUsage"));
          v80[0] = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          *a4 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v19);
          goto LABEL_56;
        }
        v30 = 0;
        goto LABEL_57;
      }
    }
    v53 = a4;
    v54 = self;
  }
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v7 = v7;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
  if (!v10)
    goto LABEL_16;
  v11 = v10;
  v12 = *(_QWORD *)v64;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v64 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v53;
        if (v53)
        {
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v24 = *MEMORY[0x1E0D025B8];
          v76 = *MEMORY[0x1E0CB2D50];
          v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("appUsage"));
          v77 = v15;
          v25 = (void *)MEMORY[0x1E0C99D80];
          v26 = &v77;
          v27 = &v76;
          goto LABEL_22;
        }
LABEL_42:
        v30 = 0;
        v19 = v7;
        self = v54;
        goto LABEL_56;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = v53;
        if (!v53)
          goto LABEL_42;
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v74 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("appUsage"));
        v75 = v15;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v75;
        v27 = &v74;
LABEL_22:
        objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *v22 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v28);

LABEL_26:
        v30 = 0;
        v19 = v7;
        self = v54;
        goto LABEL_55;
      }
      v15 = v14;
      v16 = [BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket alloc];
      v62 = 0;
      v17 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket initWithJSONDictionary:error:](v16, "initWithJSONDictionary:error:", v15, &v62);
      v18 = v62;
      if (v18)
      {
        v29 = v18;
        if (v53)
          *v53 = objc_retainAutorelease(v18);

        goto LABEL_26;
      }
      objc_msgSend(v56, "addObject:", v17);

    }
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
    v6 = v55;
  }
  while (v11);
LABEL_16:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appCategoryUsage"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if (v21)
  {

    v19 = 0;
LABEL_29:
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v19 = v19;
    v31 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    if (!v31)
      goto LABEL_39;
    v32 = v31;
    v33 = *(_QWORD *)v59;
LABEL_31:
    v34 = 0;
    while (1)
    {
      if (*(_QWORD *)v59 != v33)
        objc_enumerationMutation(v19);
      v35 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v34);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = v53;
        self = v54;
        if (!v53)
          goto LABEL_53;
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v67 = *MEMORY[0x1E0CB2D50];
        v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("appCategoryUsage"));
        v68 = v36;
        v45 = (void *)MEMORY[0x1E0C99D80];
        v46 = &v68;
        v47 = &v67;
        goto LABEL_48;
      }
      v36 = v35;
      v37 = [BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket alloc];
      v57 = 0;
      v38 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucket initWithJSONDictionary:error:](v37, "initWithJSONDictionary:error:", v36, &v57);
      v39 = v57;
      if (v39)
      {
        v48 = v39;
        if (v53)
          *v53 = objc_retainAutorelease(v39);

        self = v54;
LABEL_52:

LABEL_53:
        goto LABEL_54;
      }
      objc_msgSend(v15, "addObject:", v38);

      if (v32 == ++v34)
      {
        v32 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
        if (v32)
          goto LABEL_31;
LABEL_39:

        self = -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures initWithAppUsage:appCategoryUsage:](v54, "initWithAppUsage:appCategoryUsage:", v56, v15);
        v30 = self;
LABEL_55:

        goto LABEL_56;
      }
    }
    v42 = v53;
    self = v54;
    if (!v53)
      goto LABEL_53;
    v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v44 = *MEMORY[0x1E0D025B8];
    v69 = *MEMORY[0x1E0CB2D50];
    v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("appCategoryUsage"));
    v70 = v36;
    v45 = (void *)MEMORY[0x1E0C99D80];
    v46 = &v70;
    v47 = &v69;
LABEL_48:
    objc_msgSend(v45, "dictionaryWithObjects:forKeys:count:", v46, v47, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *v42 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v48);
    goto LABEL_52;
  }
  if (!v19)
    goto LABEL_29;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_29;
  self = v54;
  if (v53)
  {
    v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v51 = *MEMORY[0x1E0D025B8];
    v72 = *MEMORY[0x1E0CB2D50];
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("appCategoryUsage"));
    v73 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *v53 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v52);

LABEL_54:
    v30 = 0;
    goto LABEL_55;
  }
  v30 = 0;
LABEL_56:

  v6 = v55;
LABEL_57:

  return v30;
}

- (id)_appUsageJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures appUsage](self, "appUsage", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_appCategoryUsageJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures appCategoryUsage](self, "appCategoryUsage", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures _appUsageJSONArray](self, "_appUsageJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures _appCategoryUsageJSONArray](self, "_appCategoryUsageJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("appUsage");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("appCategoryUsage");
  v10[0] = v5;
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    if (v3)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_9;
LABEL_7:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures appUsage](self, "appUsage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appUsage");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures appUsage](self, "appUsage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appUsage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures appCategoryUsage](self, "appCategoryUsage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appCategoryUsage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures appCategoryUsage](self, "appCategoryUsage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appCategoryUsage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqual:", v16);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)appUsage
{
  return self->_appUsage;
}

- (NSArray)appCategoryUsage
{
  return self->_appCategoryUsage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appCategoryUsage, 0);
  objc_storeStrong((id *)&self->_appUsage, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesAppUsageFeatures alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("appUsage_json"), 5, 1, &__block_literal_global_395);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("appCategoryUsage_json"), 5, 1, &__block_literal_global_396);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B280;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appUsage"), 1, 14, objc_opt_class());
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appCategoryUsage"), 2, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __60__BMSiriAssistantSuggestionFeaturesAppUsageFeatures_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appCategoryUsageJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __60__BMSiriAssistantSuggestionFeaturesAppUsageFeatures_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appUsageJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
