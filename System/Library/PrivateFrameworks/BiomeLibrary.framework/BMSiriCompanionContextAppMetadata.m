@implementation BMSiriCompanionContextAppMetadata

- (BMSiriCompanionContextAppMetadata)initWithAppBundleId:(id)a3 mediaCategories:(id)a4 subscriptionStatus:(id)a5 localizedAppName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMSiriCompanionContextAppMetadata *v15;
  int v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMSiriCompanionContextAppMetadata;
  v15 = -[BMEventBase init](&v18, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_appBundleId, a3);
    objc_storeStrong((id *)&v15->_mediaCategories, a4);
    if (v13)
    {
      v15->_hasSubscriptionStatus = 1;
      v16 = objc_msgSend(v13, "intValue");
    }
    else
    {
      v15->_hasSubscriptionStatus = 0;
      v16 = -1;
    }
    v15->_subscriptionStatus = v16;
    objc_storeStrong((id *)&v15->_localizedAppName, a6);
  }

  return v15;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriCompanionContextAppMetadata appBundleId](self, "appBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriCompanionContextAppMetadata mediaCategories](self, "mediaCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriCompanionContextAppMetadata subscriptionStatus](self, "subscriptionStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriCompanionContextAppMetadata localizedAppName](self, "localizedAppName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriCompanionContextAppMetadata with appBundleId: %@, mediaCategories: %@, subscriptionStatus: %@, localizedAppName: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriCompanionContextAppMetadata *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  void *v30;
  uint64_t v31;
  NSArray *mediaCategories;
  int v33;
  BMSiriCompanionContextAppMetadata *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSiriCompanionContextAppMetadata;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_41;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        if (v15 == -1 || v15 >= *(_QWORD *)&v4[*v8])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v17 = v12++ >= 9;
        if (v17)
        {
          v13 = 0;
          v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v18 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v18 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_31;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
            goto LABEL_43;
          v23 = (void *)v22;
          objc_msgSend(v6, "addObject:", v22);

          continue;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          v5->_hasSubscriptionStatus = 1;
          break;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
LABEL_31:
          v30 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_43:

          goto LABEL_40;
      }
      while (1)
      {
        v27 = *v7;
        v28 = *(_QWORD *)&v4[v27];
        if (v28 == -1 || v28 >= *(_QWORD *)&v4[*v8])
          break;
        v29 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v28);
        *(_QWORD *)&v4[v27] = v28 + 1;
        v26 |= (unint64_t)(v29 & 0x7F) << v24;
        if ((v29 & 0x80) == 0)
          goto LABEL_35;
        v24 += 7;
        v17 = v25++ >= 9;
        if (v17)
        {
          LODWORD(v26) = 0;
          goto LABEL_37;
        }
      }
      v4[*v9] = 1;
LABEL_35:
      if (v4[*v9])
        LODWORD(v26) = 0;
LABEL_37:
      v5->_subscriptionStatus = v26;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v31 = objc_msgSend(v6, "copy");
  mediaCategories = v5->_mediaCategories;
  v5->_mediaCategories = (NSArray *)v31;

  v33 = v4[*v9];
  if (v33)
LABEL_40:
    v34 = 0;
  else
LABEL_41:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_appBundleId)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_mediaCategories;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_hasSubscriptionStatus)
    PBDataWriterWriteInt32Field();
  if (self->_localizedAppName)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriCompanionContextAppMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriCompanionContextAppMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void **v22;
  uint64_t *v23;
  id v24;
  void *v25;
  id v26;
  BMSiriCompanionContextAppMetadata *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id *v32;
  id v33;
  void *v34;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  id *v44;
  id v45;
  BMSiriCompanionContextAppMetadata *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appBundleId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v62 = *MEMORY[0x1E0CB2D50];
        v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("appBundleId"));
        v63[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v27 = 0;
        *a4 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v11);
        goto LABEL_44;
      }
      v25 = 0;
      v27 = 0;
      goto LABEL_46;
    }
    v45 = v7;
  }
  else
  {
    v45 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaCategories"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  v44 = a4;
  if (v10)
  {
    v42 = v7;
    v46 = self;

    v8 = 0;
  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v31 = *MEMORY[0x1E0D025B8];
          v60 = *MEMORY[0x1E0CB2D50];
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("mediaCategories"));
          v61 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
          v32 = a4;
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v33 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v18);
          v27 = 0;
          *v32 = v33;
          v25 = v45;
          goto LABEL_43;
        }
        v27 = 0;
        v25 = v45;
        goto LABEL_45;
      }
    }
    v42 = v7;
    v46 = self;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v8 = v8;
  v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (!v12)
    goto LABEL_18;
  v13 = v12;
  v14 = *(_QWORD *)v48;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v48 != v14)
        objc_enumerationMutation(v8);
      v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v44)
        {
          v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v20 = *MEMORY[0x1E0D025B8];
          v57 = *MEMORY[0x1E0CB2D50];
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("mediaCategories"));
          v58 = v17;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = &v58;
          v23 = &v57;
LABEL_27:
          objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v25 = v45;
          v26 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v24);
          v27 = 0;
          v7 = v42;
          *v44 = v26;
          v18 = v8;
          goto LABEL_41;
        }
LABEL_28:
        v27 = 0;
        v18 = v8;
        v25 = v45;
        self = v46;
        v7 = v42;
        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v44)
        {
          v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v20 = *MEMORY[0x1E0D025B8];
          v55 = *MEMORY[0x1E0CB2D50];
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("mediaCategories"));
          v56 = v17;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = &v56;
          v23 = &v55;
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      objc_msgSend(v11, "addObject:", v16);
    }
    v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v13)
      continue;
    break;
  }
LABEL_18:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subscriptionStatus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v18 = 0;
    v7 = v42;
    goto LABEL_36;
  }
  objc_opt_class();
  v7 = v42;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0;
LABEL_36:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localizedAppName"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v24 = 0;
      v25 = v45;
      goto LABEL_39;
    }
    objc_opt_class();
    v25 = v45;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v34;
LABEL_39:
      v27 = -[BMSiriCompanionContextAppMetadata initWithAppBundleId:mediaCategories:subscriptionStatus:localizedAppName:](v46, "initWithAppBundleId:mediaCategories:subscriptionStatus:localizedAppName:", v25, v11, v18, v24);
      v46 = v27;
    }
    else
    {
      if (v44)
      {
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v51 = *MEMORY[0x1E0CB2D50];
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("localizedAppName"));
        v52 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *v44 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v41, 2, v39);

      }
      v24 = 0;
      v27 = 0;
    }
LABEL_40:

LABEL_41:
    self = v46;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
      goto LABEL_36;
    }
    if (v44)
    {
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v36 = *MEMORY[0x1E0D025B8];
      v53 = *MEMORY[0x1E0CB2D50];
      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("subscriptionStatus"));
      v54 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v36, 2, v34);
      v27 = 0;
      v18 = 0;
      *v44 = v37;
      v25 = v45;
      goto LABEL_40;
    }
    v18 = 0;
    v27 = 0;
    v25 = v45;
    self = v46;
  }

LABEL_43:
LABEL_44:

LABEL_45:
LABEL_46:

  return v27;
}

- (id)_mediaCategoriesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMSiriCompanionContextAppMetadata mediaCategories](self, "mediaCategories", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  -[BMSiriCompanionContextAppMetadata appBundleId](self, "appBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriCompanionContextAppMetadata _mediaCategoriesJSONArray](self, "_mediaCategoriesJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriCompanionContextAppMetadata hasSubscriptionStatus](self, "hasSubscriptionStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriCompanionContextAppMetadata subscriptionStatus](self, "subscriptionStatus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMSiriCompanionContextAppMetadata localizedAppName](self, "localizedAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("appBundleId");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("mediaCategories");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("subscriptionStatus");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("localizedAppName");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_14;
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4)
        goto LABEL_15;
LABEL_19:

      if (v3)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!v4)
    goto LABEL_19;
LABEL_15:
  if (!v3)
    goto LABEL_20;
LABEL_16:

  return v11;
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriCompanionContextAppMetadata appBundleId](self, "appBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appBundleId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriCompanionContextAppMetadata appBundleId](self, "appBundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appBundleId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_18;
    }
    -[BMSiriCompanionContextAppMetadata mediaCategories](self, "mediaCategories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaCategories");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriCompanionContextAppMetadata mediaCategories](self, "mediaCategories");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaCategories");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_18;
    }
    if (!-[BMSiriCompanionContextAppMetadata hasSubscriptionStatus](self, "hasSubscriptionStatus")
      && !objc_msgSend(v5, "hasSubscriptionStatus")
      || -[BMSiriCompanionContextAppMetadata hasSubscriptionStatus](self, "hasSubscriptionStatus")
      && objc_msgSend(v5, "hasSubscriptionStatus")
      && (v19 = -[BMSiriCompanionContextAppMetadata subscriptionStatus](self, "subscriptionStatus"),
          v19 == objc_msgSend(v5, "subscriptionStatus")))
    {
      -[BMSiriCompanionContextAppMetadata localizedAppName](self, "localizedAppName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedAppName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == v21)
      {
        v12 = 1;
      }
      else
      {
        -[BMSiriCompanionContextAppMetadata localizedAppName](self, "localizedAppName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedAppName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v22, "isEqual:", v23);

      }
      goto LABEL_19;
    }
LABEL_18:
    v12 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (NSArray)mediaCategories
{
  return self->_mediaCategories;
}

- (int)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (BOOL)hasSubscriptionStatus
{
  return self->_hasSubscriptionStatus;
}

- (void)setHasSubscriptionStatus:(BOOL)a3
{
  self->_hasSubscriptionStatus = a3;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_mediaCategories, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
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

    v4 = -[BMSiriCompanionContextAppMetadata initByReadFrom:]([BMSiriCompanionContextAppMetadata alloc], "initByReadFrom:", v7);
    v4[5] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appBundleId"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("mediaCategories_json"), 5, 1, &__block_literal_global_44305);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subscriptionStatus"), 0, 0, 3, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("localizedAppName"), 2, 0, 4, 13, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D518;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appBundleId"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaCategories"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subscriptionStatus"), 3, 2, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("localizedAppName"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __44__BMSiriCompanionContextAppMetadata_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mediaCategoriesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
