@implementation BMMLSEVirtualFeatureStore

- (BMMLSEVirtualFeatureStore)initWithItemIdentifier:(id)a3 featureVersion:(id)a4 featureVector:(id)a5 deviceIdentifier:(id)a6 shareSessionIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BMMLSEVirtualFeatureStore *v18;
  unsigned int v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMMLSEVirtualFeatureStore;
  v18 = -[BMEventBase init](&v21, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_itemIdentifier, a3);
    if (v14)
    {
      v18->_hasFeatureVersion = 1;
      v19 = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v19 = 0;
      v18->_hasFeatureVersion = 0;
    }
    v18->_featureVersion = v19;
    objc_storeStrong((id *)&v18->_featureVector, a5);
    objc_storeStrong((id *)&v18->_deviceIdentifier, a6);
    objc_storeStrong((id *)&v18->_shareSessionIdentifier, a7);
  }

  return v18;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMLSEVirtualFeatureStore itemIdentifier](self, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStore featureVersion](self, "featureVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEVirtualFeatureStore featureVector](self, "featureVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEVirtualFeatureStore deviceIdentifier](self, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEVirtualFeatureStore shareSessionIdentifier](self, "shareSessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEVirtualFeatureStore with itemIdentifier: %@, featureVersion: %@, featureVector: %@, deviceIdentifier: %@, shareSessionIdentifier: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEVirtualFeatureStore *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *featureVector;
  int v35;
  BMMLSEVirtualFeatureStore *v36;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMMLSEVirtualFeatureStore;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
    goto LABEL_43;
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
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 32;
          goto LABEL_35;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasFeatureVersion = 1;
          break;
        case 3u:
          v39 = 0;
          v40 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_45;
          v30 = -[BMMLSEVirtualFeatureStoreFeature initByReadFrom:]([BMMLSEVirtualFeatureStoreFeature alloc], "initByReadFrom:", v4);
          if (!v30)
            goto LABEL_45;
          v31 = v30;
          objc_msgSend(v6, "addObject:", v30);
          PBReaderRecallMark();

          continue;
        case 4u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 48;
          goto LABEL_35;
        case 5u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 56;
LABEL_35:
          v32 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_45:

          goto LABEL_42;
      }
      while (1)
      {
        v26 = *v7;
        v27 = *(_QWORD *)&v4[v26];
        v28 = v27 + 1;
        if (v27 == -1 || v28 > *(_QWORD *)&v4[*v8])
          break;
        v29 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v27);
        *(_QWORD *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0)
          goto LABEL_37;
        v23 += 7;
        v18 = v24++ >= 9;
        if (v18)
        {
          LODWORD(v25) = 0;
          goto LABEL_39;
        }
      }
      v4[*v9] = 1;
LABEL_37:
      if (v4[*v9])
        LODWORD(v25) = 0;
LABEL_39:
      v5->_featureVersion = v25;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v33 = objc_msgSend(v6, "copy");
  featureVector = v5->_featureVector;
  v5->_featureVector = (NSArray *)v33;

  v35 = v4[*v9];
  if (v35)
LABEL_42:
    v36 = 0;
  else
LABEL_43:
    v36 = v5;

  return v36;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_itemIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasFeatureVersion)
    PBDataWriterWriteUint32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_featureVector;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_deviceIdentifier)
    PBDataWriterWriteStringField();
  if (self->_shareSessionIdentifier)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEVirtualFeatureStore writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEVirtualFeatureStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  BMMLSEVirtualFeatureStoreFeature *v20;
  BMMLSEVirtualFeatureStoreFeature *v21;
  id v22;
  id v23;
  id *v24;
  id v25;
  uint64_t v26;
  BMMLSEVirtualFeatureStore *v27;
  id v28;
  void *v29;
  void *v30;
  BMMLSEVirtualFeatureStore *v31;
  id *v32;
  id v33;
  uint64_t v34;
  id *v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id *v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v53;
  id v54;
  id v55;
  id *v56;
  id v57;
  uint64_t v58;
  BMMLSEVirtualFeatureStore *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  _BYTE v79[128];
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v24 = a4;
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v27 = self;
        v28 = objc_alloc(MEMORY[0x1E0CB3940]);
        v53 = objc_opt_class();
        v29 = v28;
        self = v27;
        v30 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v53, CFSTR("itemIdentifier"));
        v85[0] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        v8 = 0;
        *v24 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v10);
        goto LABEL_70;
      }
      v31 = 0;
      v8 = 0;
      goto LABEL_71;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureVersion"));
  v9 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v9;
  v63 = v7;
  if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v32 = a4;
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v82 = *MEMORY[0x1E0CB2D50];
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("featureVersion"));
        v83 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        v30 = 0;
        *v32 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2);

        goto LABEL_69;
      }
      v30 = 0;
      v31 = 0;
      goto LABEL_70;
    }
    v61 = v10;
  }
  else
  {
    v61 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureVector"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
    v56 = a4;
    v57 = v8;
    v59 = self;

    v11 = 0;
  }
  else
  {
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v31 = 0;
          v30 = v61;
          goto LABEL_69;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v80 = *MEMORY[0x1E0CB2D50];
        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("featureVector"));
        v81 = v64;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v45 = a4;
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v46 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v23);
        v31 = 0;
        *v45 = v46;
LABEL_45:
        v30 = v61;
        goto LABEL_67;
      }
    }
    v56 = a4;
    v57 = v8;
    v59 = self;
  }
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v11 = v11;
  v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
  if (!v14)
    goto LABEL_22;
  v15 = v14;
  v16 = *(_QWORD *)v68;
  v55 = v6;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v68 != v16)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v56;
        if (v56)
        {
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = *MEMORY[0x1E0D025B8];
          v77 = *MEMORY[0x1E0CB2D50];
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("featureVector"));
          v78 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v39 = v36;
          v40 = v37;
LABEL_37:
          v31 = 0;
          *v35 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v38);
LABEL_41:
          v23 = v11;
          v6 = v55;
          v8 = v57;
          self = v59;
          v30 = v61;
          goto LABEL_65;
        }
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = v56;
        if (v56)
        {
          v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v42 = *MEMORY[0x1E0D025B8];
          v75 = *MEMORY[0x1E0CB2D50];
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("featureVector"));
          v76 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          v39 = v41;
          v40 = v42;
          goto LABEL_37;
        }
LABEL_44:
        v31 = 0;
        v23 = v11;
        v6 = v55;
        v8 = v57;
        self = v59;
        goto LABEL_45;
      }
      v19 = v18;
      v20 = [BMMLSEVirtualFeatureStoreFeature alloc];
      v66 = 0;
      v21 = -[BMMLSEVirtualFeatureStoreFeature initWithJSONDictionary:error:](v20, "initWithJSONDictionary:error:", v19, &v66);
      v22 = v66;
      if (v22)
      {
        v38 = v22;
        if (v56)
          *v56 = objc_retainAutorelease(v22);

        v31 = 0;
        goto LABEL_41;
      }
      objc_msgSend(v64, "addObject:", v21);

    }
    v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    v6 = v55;
    if (v15)
      continue;
    break;
  }
LABEL_22:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceIdentifier"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v23 = 0;
    self = v59;
    goto LABEL_49;
  }
  objc_opt_class();
  self = v59;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v19;
      goto LABEL_49;
    }
    if (!v56)
    {
      v23 = 0;
      v31 = 0;
      v8 = v57;
      v30 = v61;
      goto LABEL_66;
    }
    v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v48 = *MEMORY[0x1E0D025B8];
    v73 = *MEMORY[0x1E0CB2D50];
    v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceIdentifier"));
    v74 = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v48, 2, v47);
    v31 = 0;
    v23 = 0;
    *v56 = v49;
    v8 = v57;
LABEL_63:
    v30 = v61;
    goto LABEL_64;
  }
  v23 = 0;
LABEL_49:
  v8 = v57;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shareSessionIdentifier"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v38 = 0;
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v56)
    {
      v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v58 = *MEMORY[0x1E0D025B8];
      v71 = *MEMORY[0x1E0CB2D50];
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("shareSessionIdentifier"));
      v72 = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *v56 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v58, 2, v51);

    }
    v38 = 0;
    v31 = 0;
    goto LABEL_63;
  }
  v38 = v47;
LABEL_52:
  v30 = v61;
  self = -[BMMLSEVirtualFeatureStore initWithItemIdentifier:featureVersion:featureVector:deviceIdentifier:shareSessionIdentifier:](self, "initWithItemIdentifier:featureVersion:featureVector:deviceIdentifier:shareSessionIdentifier:", v57, v61, v64, v23, v38);
  v31 = self;
LABEL_64:

LABEL_65:
LABEL_66:

LABEL_67:
LABEL_69:

  v10 = v62;
  v7 = v63;
LABEL_70:

LABEL_71:
  return v31;
}

- (id)_featureVectorJSONArray
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
  -[BMMLSEVirtualFeatureStore featureVector](self, "featureVector", 0);
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  -[BMMLSEVirtualFeatureStore itemIdentifier](self, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMLSEVirtualFeatureStore hasFeatureVersion](self, "hasFeatureVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStore featureVersion](self, "featureVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[BMMLSEVirtualFeatureStore _featureVectorJSONArray](self, "_featureVectorJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEVirtualFeatureStore deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEVirtualFeatureStore shareSessionIdentifier](self, "shareSessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("itemIdentifier");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("featureVersion");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("featureVector");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("deviceIdentifier");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("shareSessionIdentifier");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_16;
  }
  else
  {

    if (v6)
    {
LABEL_16:
      if (v5)
        goto LABEL_17;
      goto LABEL_22;
    }
  }

  if (v5)
  {
LABEL_17:
    if (v4)
      goto LABEL_18;
LABEL_23:

    if (v3)
      goto LABEL_19;
LABEL_24:

    goto LABEL_19;
  }
LABEL_22:

  if (!v4)
    goto LABEL_23;
LABEL_18:
  if (!v3)
    goto LABEL_24;
LABEL_19:

  return v13;
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
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMLSEVirtualFeatureStore itemIdentifier](self, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMLSEVirtualFeatureStore itemIdentifier](self, "itemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_18;
    }
    if (-[BMMLSEVirtualFeatureStore hasFeatureVersion](self, "hasFeatureVersion")
      || objc_msgSend(v5, "hasFeatureVersion"))
    {
      if (!-[BMMLSEVirtualFeatureStore hasFeatureVersion](self, "hasFeatureVersion"))
        goto LABEL_18;
      if (!objc_msgSend(v5, "hasFeatureVersion"))
        goto LABEL_18;
      v13 = -[BMMLSEVirtualFeatureStore featureVersion](self, "featureVersion");
      if (v13 != objc_msgSend(v5, "featureVersion"))
        goto LABEL_18;
    }
    -[BMMLSEVirtualFeatureStore featureVector](self, "featureVector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureVector");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMMLSEVirtualFeatureStore featureVector](self, "featureVector");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "featureVector");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_18;
    }
    -[BMMLSEVirtualFeatureStore deviceIdentifier](self, "deviceIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMMLSEVirtualFeatureStore deviceIdentifier](self, "deviceIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
      {
LABEL_18:
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    -[BMMLSEVirtualFeatureStore shareSessionIdentifier](self, "shareSessionIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shareSessionIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 == v28)
    {
      v12 = 1;
    }
    else
    {
      -[BMMLSEVirtualFeatureStore shareSessionIdentifier](self, "shareSessionIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shareSessionIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v29, "isEqual:", v30);

    }
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (unsigned)featureVersion
{
  return self->_featureVersion;
}

- (BOOL)hasFeatureVersion
{
  return self->_hasFeatureVersion;
}

- (void)setHasFeatureVersion:(BOOL)a3
{
  self->_hasFeatureVersion = a3;
}

- (NSArray)featureVector
{
  return self->_featureVector;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)shareSessionIdentifier
{
  return self->_shareSessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_featureVector, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
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

    v4 = -[BMMLSEVirtualFeatureStore initByReadFrom:]([BMMLSEVirtualFeatureStore alloc], "initByReadFrom:", v7);
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
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemIdentifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("featureVersion"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("featureVector_json"), 5, 1, &__block_literal_global_1716);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceIdentifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shareSessionIdentifier"), 2, 0, 5, 13, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B4A8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemIdentifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureVersion"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureVector"), 3, 14, objc_opt_class());
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceIdentifier"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shareSessionIdentifier"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __36__BMMLSEVirtualFeatureStore_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_featureVectorJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
