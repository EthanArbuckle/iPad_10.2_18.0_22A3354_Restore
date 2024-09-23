@implementation BMAeroMLPhotosSearchSession

- (BMAeroMLPhotosSearchSession)initWithQueryRaw:(id)a3 queryEmbedding:(id)a4 presentedAssets:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMAeroMLPhotosSearchSession *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMAeroMLPhotosSearchSession;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_queryRaw, a3);
    objc_storeStrong((id *)&v12->_queryEmbedding, a4);
    objc_storeStrong((id *)&v12->_presentedAssets, a5);
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAeroMLPhotosSearchSession queryRaw](self, "queryRaw");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAeroMLPhotosSearchSession queryEmbedding](self, "queryEmbedding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAeroMLPhotosSearchSession presentedAssets](self, "presentedAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAeroMLPhotosSearchSession with queryRaw: %@, queryEmbedding: %@, presentedAssets: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAeroMLPhotosSearchSession *v5;
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
  uint64_t v20;
  int v21;
  unint64_t v23;
  uint64_t v24;
  NSString *queryRaw;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *queryEmbedding;
  uint64_t v35;
  NSArray *presentedAssets;
  int v37;
  BMAeroMLPhotosSearchSession *v38;
  objc_super v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMAeroMLPhotosSearchSession;
  v5 = -[BMEventBase init](&v40, sel_init);
  if (!v5)
    goto LABEL_38;
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
        goto LABEL_36;
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
          v20 = *v10;
          v21 = v4[v20];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      v20 = *v10;
      v21 = v4[v20];
      if (v4[v20])
        v14 = 0;
LABEL_15:
      if (v21 || (v14 & 7) == 4)
        goto LABEL_36;
      v23 = v14 >> 3;
      if ((v14 >> 3) == 3)
        break;
      if ((_DWORD)v23 == 2)
      {
        v28 = (void *)MEMORY[0x1E0CB37E8];
        v29 = *v8;
        v30 = *(_QWORD *)&v4[v29];
        if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v9])
        {
          v31 = *(double *)(*(_QWORD *)&v4[*v11] + v30);
          *(_QWORD *)&v4[v29] = v30 + 8;
        }
        else
        {
          v4[v20] = 1;
          v31 = 0.0;
        }
        objc_msgSend(v28, "numberWithDouble:", v31);
        v32 = objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
LABEL_40:

          goto LABEL_37;
        }
        v27 = (void *)v32;
        objc_msgSend(v6, "addObject:", v32);
        goto LABEL_34;
      }
      if ((_DWORD)v23 == 1)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        queryRaw = v5->_queryRaw;
        v5->_queryRaw = (NSString *)v24;

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_40;
      }
LABEL_35:
      if (*(_QWORD *)&v4[*v8] >= *(_QWORD *)&v4[*v9])
        goto LABEL_36;
    }
    v41 = 0;
    v42 = 0;
    if ((PBReaderPlaceMark() & 1) == 0)
      goto LABEL_40;
    v26 = -[BMAeroMLPhotosSearchSessionAsset initByReadFrom:]([BMAeroMLPhotosSearchSessionAsset alloc], "initByReadFrom:", v4);
    if (!v26)
      goto LABEL_40;
    v27 = v26;
    objc_msgSend(v7, "addObject:", v26);
    PBReaderRecallMark();
LABEL_34:

    goto LABEL_35;
  }
LABEL_36:
  v33 = objc_msgSend(v6, "copy");
  queryEmbedding = v5->_queryEmbedding;
  v5->_queryEmbedding = (NSArray *)v33;

  v35 = objc_msgSend(v7, "copy");
  presentedAssets = v5->_presentedAssets;
  v5->_presentedAssets = (NSArray *)v35;

  v37 = v4[*v10];
  if (v37)
LABEL_37:
    v38 = 0;
  else
LABEL_38:
    v38 = v5;

  return v38;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_queryRaw)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_queryEmbedding;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "doubleValue");
        PBDataWriterWriteDoubleField();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_presentedAssets;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        PBDataWriterPlaceMark();
        objc_msgSend(v15, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAeroMLPhotosSearchSession writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAeroMLPhotosSearchSession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  BMAeroMLPhotosSearchSession *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void *v21;
  int v22;
  id *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  BMAeroMLPhotosSearchSession *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  BMAeroMLPhotosSearchSessionAsset *v40;
  BMAeroMLPhotosSearchSessionAsset *v41;
  id v42;
  id v43;
  uint64_t v44;
  id *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id *v49;
  uint64_t *v50;
  void *v51;
  id v53;
  uint64_t v54;
  void *v55;
  BMAeroMLPhotosSearchSession *v56;
  id v57;
  void *v58;
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  _BYTE v75[128];
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;
  void *v84;
  uint64_t v85;
  _QWORD v86[3];

  v86[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryRaw"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v5;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v85 = *MEMORY[0x1E0CB2D50];
        v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("queryRaw"));
        v86[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        v31 = 0;
        *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v13);
        goto LABEL_60;
      }
      v7 = 0;
      v31 = 0;
      goto LABEL_62;
    }
    v58 = v6;
    v7 = v6;
  }
  else
  {
    v58 = v6;
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryEmbedding"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    v57 = v7;
    v11 = self;

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
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v83 = *MEMORY[0x1E0CB2D50];
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("queryEmbedding"));
          v84 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v31 = 0;
          *a4 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v20);
          goto LABEL_59;
        }
        v31 = 0;
        v6 = v58;
        goto LABEL_61;
      }
    }
    v57 = v7;
    v11 = self;
  }
  v12 = 0x1E0C99000uLL;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v8 = v8;
  v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
  if (!v14)
    goto LABEL_18;
  v15 = v14;
  v16 = *(_QWORD *)v68;
  do
  {
    v17 = v12;
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v68 != v16)
        objc_enumerationMutation(v8);
      v19 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = a4;
        if (a4)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v25 = *MEMORY[0x1E0D025B8];
          v80 = *MEMORY[0x1E0CB2D50];
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("queryEmbedding"));
          v81 = v61;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v24;
          v28 = v25;
LABEL_26:
          self = v11;
          *v23 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v26);

          v31 = 0;
          v20 = v8;
          v7 = v57;
          goto LABEL_58;
        }
LABEL_27:
        v31 = 0;
        v20 = v8;
        self = v11;
        v7 = v57;
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = a4;
        if (a4)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v30 = *MEMORY[0x1E0D025B8];
          v78 = *MEMORY[0x1E0CB2D50];
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("queryEmbedding"));
          v79 = v61;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v29;
          v28 = v30;
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      objc_msgSend(v13, "addObject:", v19);
    }
    v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    v12 = v17;
  }
  while (v15);
LABEL_18:

  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("presentedAssets"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if (v22)
  {

    v20 = 0;
    self = v11;
LABEL_32:
    v61 = (void *)objc_msgSend(objc_alloc(*(Class *)(v12 + 3560)), "initWithCapacity:", objc_msgSend(v20, "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v20 = v20;
    v34 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (!v34)
      goto LABEL_42;
    v35 = v34;
    v36 = *(_QWORD *)v64;
    v56 = self;
LABEL_34:
    v37 = 0;
    while (1)
    {
      if (*(_QWORD *)v64 != v36)
        objc_enumerationMutation(v20);
      v38 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v37);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v56;
        v7 = v57;
        v45 = a4;
        if (!a4)
          goto LABEL_56;
        v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v47 = *MEMORY[0x1E0D025B8];
        v71 = *MEMORY[0x1E0CB2D50];
        v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("presentedAssets"));
        v72 = v39;
        v48 = (void *)MEMORY[0x1E0C99D80];
        v49 = &v72;
        v50 = &v71;
        goto LABEL_51;
      }
      v39 = v38;
      v40 = [BMAeroMLPhotosSearchSessionAsset alloc];
      v62 = 0;
      v41 = -[BMAeroMLPhotosSearchSessionAsset initWithJSONDictionary:error:](v40, "initWithJSONDictionary:error:", v39, &v62);
      v42 = v62;
      if (v42)
      {
        v51 = v42;
        if (a4)
          *a4 = objc_retainAutorelease(v42);

        self = v56;
        v7 = v57;
LABEL_55:

LABEL_56:
        goto LABEL_57;
      }
      objc_msgSend(v61, "addObject:", v41);

      if (v35 == ++v37)
      {
        v35 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        self = v56;
        if (v35)
          goto LABEL_34;
LABEL_42:

        v7 = v57;
        self = -[BMAeroMLPhotosSearchSession initWithQueryRaw:queryEmbedding:presentedAssets:](self, "initWithQueryRaw:queryEmbedding:presentedAssets:", v57, v13, v61);
        v31 = self;
LABEL_58:

        goto LABEL_59;
      }
    }
    self = v56;
    v7 = v57;
    v45 = a4;
    if (!a4)
      goto LABEL_56;
    v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v47 = *MEMORY[0x1E0D025B8];
    v73 = *MEMORY[0x1E0CB2D50];
    v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("presentedAssets"));
    v74 = v39;
    v48 = (void *)MEMORY[0x1E0C99D80];
    v49 = &v74;
    v50 = &v73;
LABEL_51:
    objc_msgSend(v48, "dictionaryWithObjects:forKeys:count:", v49, v50, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *v45 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2, v51);
    goto LABEL_55;
  }
  self = v11;
  if (!v20)
    goto LABEL_32;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_32;
  v7 = v57;
  if (a4)
  {
    v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v54 = *MEMORY[0x1E0D025B8];
    v76 = *MEMORY[0x1E0CB2D50];
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("presentedAssets"));
    v77 = v61;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v55);

LABEL_57:
    v31 = 0;
    goto LABEL_58;
  }
  v31 = 0;
LABEL_59:

  v6 = v58;
LABEL_60:

  v5 = v60;
LABEL_61:

LABEL_62:
  return v31;
}

- (id)_queryEmbeddingJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BMAeroMLPhotosSearchSession queryEmbedding](self, "queryEmbedding", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "doubleValue");
        if (fabs(v10) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_presentedAssetsJSONArray
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
  -[BMAeroMLPhotosSearchSession presentedAssets](self, "presentedAssets", 0);
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
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[BMAeroMLPhotosSearchSession queryRaw](self, "queryRaw");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAeroMLPhotosSearchSession _queryEmbeddingJSONArray](self, "_queryEmbeddingJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAeroMLPhotosSearchSession _presentedAssetsJSONArray](self, "_presentedAssetsJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("queryRaw");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("queryEmbedding");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("presentedAssets");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      goto LABEL_9;
LABEL_12:

    if (v3)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v4)
    goto LABEL_12;
LABEL_9:
  if (!v3)
    goto LABEL_13;
LABEL_10:

  return v9;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAeroMLPhotosSearchSession queryRaw](self, "queryRaw");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryRaw");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAeroMLPhotosSearchSession queryRaw](self, "queryRaw");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "queryRaw");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMAeroMLPhotosSearchSession queryEmbedding](self, "queryEmbedding");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryEmbedding");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAeroMLPhotosSearchSession queryEmbedding](self, "queryEmbedding");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "queryEmbedding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[BMAeroMLPhotosSearchSession presentedAssets](self, "presentedAssets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentedAssets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMAeroMLPhotosSearchSession presentedAssets](self, "presentedAssets");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentedAssets");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "isEqual:", v22);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)queryRaw
{
  return self->_queryRaw;
}

- (NSArray)queryEmbedding
{
  return self->_queryEmbedding;
}

- (NSArray)presentedAssets
{
  return self->_presentedAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedAssets, 0);
  objc_storeStrong((id *)&self->_queryEmbedding, 0);
  objc_storeStrong((id *)&self->_queryRaw, 0);
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

    v4 = -[BMAeroMLPhotosSearchSession initByReadFrom:]([BMAeroMLPhotosSearchSession alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryRaw"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("queryEmbedding_json"), 5, 1, &__block_literal_global_3591);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("presentedAssets_json"), 5, 1, &__block_literal_global_146);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AA40;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryRaw"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryEmbedding"), 2, 0, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("presentedAssets"), 3, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __38__BMAeroMLPhotosSearchSession_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presentedAssetsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __38__BMAeroMLPhotosSearchSession_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queryEmbeddingJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
