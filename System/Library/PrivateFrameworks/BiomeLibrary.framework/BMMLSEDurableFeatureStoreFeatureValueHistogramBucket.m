@implementation BMMLSEDurableFeatureStoreFeatureValueHistogramBucket

- (BMMLSEDurableFeatureStoreFeatureValueHistogramBucket)initWithBucketName:(id)a3 hasEver:(id)a4 counts:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValueHistogramBucket;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_bucketName, a3);
    if (v10)
    {
      v12->_hasHasEver = 1;
      v12->_hasEver = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v12->_hasHasEver = 0;
      v12->_hasEver = 0;
    }
    objc_storeStrong((id *)&v12->_counts, a5);
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
  -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket bucketName](self, "bucketName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket hasEver](self, "hasEver"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket counts](self, "counts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEDurableFeatureStoreFeatureValueHistogramBucket with bucketName: %@, hasEver: %@, counts: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *v5;
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
  unint64_t v21;
  uint64_t v22;
  NSString *bucketName;
  id v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  NSArray *counts;
  int v35;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *v36;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValueHistogramBucket;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
    goto LABEL_42;
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
      v21 = v13 >> 3;
      if ((v13 >> 3) == 3)
      {
        v39 = 0;
        v40 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v24 = -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount initByReadFrom:]([BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_44:

          goto LABEL_41;
        }
        v25 = v24;
        objc_msgSend(v6, "addObject:", v24);
        PBReaderRecallMark();

      }
      else if ((_DWORD)v21 == 2)
      {
        v26 = 0;
        v27 = 0;
        v28 = 0;
        v5->_hasHasEver = 1;
        while (1)
        {
          v29 = *v7;
          v30 = *(_QWORD *)&v4[v29];
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)&v4[*v8])
            break;
          v32 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v30);
          *(_QWORD *)&v4[v29] = v31;
          v28 |= (unint64_t)(v32 & 0x7F) << v26;
          if ((v32 & 0x80) == 0)
            goto LABEL_36;
          v26 += 7;
          v18 = v27++ >= 9;
          if (v18)
          {
            v28 = 0;
            goto LABEL_38;
          }
        }
        v4[*v9] = 1;
LABEL_36:
        if (v4[*v9])
          v28 = 0;
LABEL_38:
        v5->_hasEver = v28 != 0;
      }
      else if ((_DWORD)v21 == 1)
      {
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        bucketName = v5->_bucketName;
        v5->_bucketName = (NSString *)v22;

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_44;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v33 = objc_msgSend(v6, "copy");
  counts = v5->_counts;
  v5->_counts = (NSArray *)v33;

  v35 = v4[*v9];
  if (v35)
LABEL_41:
    v36 = 0;
  else
LABEL_42:
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
  if (self->_bucketName)
    PBDataWriterWriteStringField();
  if (self->_hasHasEver)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_counts;
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

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEDurableFeatureStoreFeatureValueHistogramBucket)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  id v21;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount *v22;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount *v23;
  id v24;
  void *v25;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  id *v32;
  void *v33;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *v34;
  id v35;
  void *v36;
  id v37;
  id *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id *v42;
  uint64_t *v43;
  void *v44;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucket *v50;
  id *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bucketName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x1E0C99000uLL;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v26 = 0;
        v9 = 0;
        goto LABEL_45;
      }
      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v71 = *MEMORY[0x1E0CB2D50];
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bucketName"));
      v72[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v10);
      v26 = 0;
      v9 = 0;
      *a4 = v29;
      goto LABEL_44;
    }
    v9 = v7;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasEver"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v7;
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v51 = a4;
    v55 = 0;
LABEL_7:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("counts"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      v52 = v10;
      v53 = v9;
      v54 = v6;

      v11 = 0;
LABEL_12:
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v11 = v11;
      v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (!v15)
        goto LABEL_22;
      v16 = v15;
      v17 = *(_QWORD *)v59;
      v50 = self;
LABEL_14:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v59 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          self = v50;
          v38 = v51;
          v10 = v52;
          v9 = v53;
          if (!v51)
            goto LABEL_40;
          v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v62 = *MEMORY[0x1E0CB2D50];
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("counts"));
          v63 = v21;
          v41 = (void *)MEMORY[0x1E0C99D80];
          v42 = &v63;
          v43 = &v62;
          goto LABEL_35;
        }
        v20 = v8;
        v21 = v19;
        v22 = [BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount alloc];
        v57 = 0;
        v23 = -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount initWithJSONDictionary:error:](v22, "initWithJSONDictionary:error:", v21, &v57);
        v24 = v57;
        if (v24)
        {
          v44 = v24;
          if (v51)
            *v51 = objc_retainAutorelease(v24);

          self = v50;
          v10 = v52;
          v9 = v53;
LABEL_39:

LABEL_40:
          v26 = 0;
          v6 = v54;
          goto LABEL_41;
        }
        objc_msgSend(v14, "addObject:", v23);

        ++v18;
        v8 = v20;
        if (v16 == v18)
        {
          v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          self = v50;
          if (v16)
            goto LABEL_14;
LABEL_22:

          v9 = v53;
          v25 = v55;
          self = -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket initWithBucketName:hasEver:counts:](self, "initWithBucketName:hasEver:counts:", v53, v55, v14);
          v26 = self;
          v6 = v54;
          v10 = v52;
LABEL_42:

          v7 = v56;
          goto LABEL_43;
        }
      }
      self = v50;
      v38 = v51;
      v10 = v52;
      v9 = v53;
      if (!v51)
        goto LABEL_40;
      v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v40 = *MEMORY[0x1E0D025B8];
      v64 = *MEMORY[0x1E0CB2D50];
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("counts"));
      v65 = v21;
      v41 = (void *)MEMORY[0x1E0C99D80];
      v42 = &v65;
      v43 = &v64;
LABEL_35:
      objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *v38 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v44);
      goto LABEL_39;
    }
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v52 = v10;
      v53 = v9;
      v54 = v6;
      goto LABEL_12;
    }
    if (v51)
    {
      v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v47 = *MEMORY[0x1E0D025B8];
      v67 = *MEMORY[0x1E0CB2D50];
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("counts"));
      v68 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *v51 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2, v48);

      v26 = 0;
LABEL_41:
      v25 = v55;
      goto LABEL_42;
    }
    v26 = 0;
    v25 = v55;
LABEL_43:

    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = a4;
    v55 = v10;
    goto LABEL_7;
  }
  if (a4)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v31 = *MEMORY[0x1E0D025B8];
    v69 = *MEMORY[0x1E0CB2D50];
    v32 = a4;
    v33 = v10;
    v34 = self;
    v35 = objc_alloc(MEMORY[0x1E0CB3940]);
    v49 = objc_opt_class();
    v36 = v35;
    self = v34;
    v10 = v33;
    v11 = (id)objc_msgSend(v36, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v49, CFSTR("hasEver"));
    v70 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v14);
    v26 = 0;
    v25 = 0;
    *v32 = v37;
    goto LABEL_42;
  }
  v25 = 0;
  v26 = 0;
LABEL_44:

LABEL_45:
  return v26;
}

- (id)_countsJSONArray
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
  -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket counts](self, "counts", 0);
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
  -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket bucketName](self, "bucketName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket hasHasEver](self, "hasHasEver"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket hasEver](self, "hasEver"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket _countsJSONArray](self, "_countsJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("bucketName");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("hasEver");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("counts");
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
      goto LABEL_12;
LABEL_15:

    if (v3)
      goto LABEL_13;
LABEL_16:

    goto LABEL_13;
  }

  if (!v4)
    goto LABEL_15;
LABEL_12:
  if (!v3)
    goto LABEL_16;
LABEL_13:

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
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket bucketName](self, "bucketName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bucketName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket bucketName](self, "bucketName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bucketName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_12;
    }
    if (!-[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket hasHasEver](self, "hasHasEver")
      && !objc_msgSend(v5, "hasHasEver")
      || -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket hasHasEver](self, "hasHasEver")
      && objc_msgSend(v5, "hasHasEver")
      && (v13 = -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket hasEver](self, "hasEver"),
          v13 == objc_msgSend(v5, "hasEver")))
    {
      -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket counts](self, "counts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "counts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
        v12 = 1;
      }
      else
      {
        -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket counts](self, "counts");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "counts");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v16, "isEqual:", v17);

      }
      goto LABEL_17;
    }
LABEL_12:
    v12 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)bucketName
{
  return self->_bucketName;
}

- (BOOL)hasEver
{
  return self->_hasEver;
}

- (BOOL)hasHasEver
{
  return self->_hasHasEver;
}

- (void)setHasHasEver:(BOOL)a3
{
  self->_hasHasEver = a3;
}

- (NSArray)counts
{
  return self->_counts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_bucketName, 0);
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

    v4 = -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucket initByReadFrom:]([BMMLSEDurableFeatureStoreFeatureValueHistogramBucket alloc], "initByReadFrom:", v7);
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
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bucketName"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasEver"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("counts_json"), 5, 1, &__block_literal_global_1175);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C660;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bucketName"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasEver"), 2, 12, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("counts"), 3, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __63__BMMLSEDurableFeatureStoreFeatureValueHistogramBucket_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_countsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
