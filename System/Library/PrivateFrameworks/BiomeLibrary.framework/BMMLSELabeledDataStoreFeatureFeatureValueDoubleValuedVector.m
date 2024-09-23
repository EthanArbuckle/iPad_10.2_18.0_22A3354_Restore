@implementation BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector

- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)initWithVectorWithDoubles:(id)a3
{
  id v5;
  BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector;
  v6 = -[BMEventBase init](&v8, sel_init);
  if (v6)
  {
    v6->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v6->_vectorWithDoubles, a3);
  }

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector vectorWithDoubles](self, "vectorWithDoubles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector with vectorWithDoubles: %@"), v4);

  return (NSString *)v5;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *v5;
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
  uint64_t v19;
  int v20;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *vectorWithDoubles;
  int v30;
  BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector;
  v5 = -[BMEventBase init](&v33, sel_init);
  if (!v5)
    goto LABEL_31;
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
        if (v12++ >= 9)
        {
          v13 = 0;
          v19 = *v9;
          v20 = v4[v19];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = *v9;
      v20 = v4[v19];
      if (v4[v19])
        v13 = 0;
LABEL_15:
      if (v20 || (v13 & 7) == 4)
        break;
      if ((v13 >> 3) == 1)
      {
        v22 = (void *)MEMORY[0x1E0CB37E8];
        v23 = *v7;
        v24 = *(_QWORD *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v25 = *(double *)(*(_QWORD *)&v4[*v10] + v24);
          *(_QWORD *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[v19] = 1;
          v25 = 0.0;
        }
        objc_msgSend(v22, "numberWithDouble:", v25);
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
LABEL_33:

          goto LABEL_30;
        }
        v27 = (void *)v26;
        objc_msgSend(v6, "addObject:", v26);

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_33;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v28 = objc_msgSend(v6, "copy");
  vectorWithDoubles = v5->_vectorWithDoubles;
  v5->_vectorWithDoubles = (NSArray *)v28;

  v30 = v4[*v9];
  if (v30)
LABEL_30:
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
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_vectorWithDoubles;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "doubleValue", (_QWORD)v10);
        PBDataWriterWriteDoubleField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vectorWithDoubles"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {

    v6 = 0;
LABEL_5:
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = v6;
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (!v10)
      goto LABEL_14;
    v11 = v10;
    v12 = *(_QWORD *)v29;
LABEL_7:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v12)
        objc_enumerationMutation(v6);
      v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (p_isa)
        {
          v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v32 = *MEMORY[0x1E0CB2D50];
          v23 = objc_alloc(MEMORY[0x1E0CB3940]);
          v17 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("vectorWithDoubles"), (_QWORD)v28);
          v33 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v21;
          v20 = v22;
LABEL_19:
          *p_isa = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v18);

        }
        goto LABEL_20;
      }
      objc_msgSend(v9, "addObject:", v14);
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v11)
          goto LABEL_7;
LABEL_14:

        self = -[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector initWithVectorWithDoubles:](self, "initWithVectorWithDoubles:", v9);
        p_isa = (id *)&self->super.super.isa;
LABEL_22:

        goto LABEL_23;
      }
    }
    if (p_isa)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v16 = *MEMORY[0x1E0D025B8];
      v34 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("vectorWithDoubles"));
      v35 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15;
      v20 = v16;
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!v6)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_5;
  if (p_isa)
  {
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v26 = *MEMORY[0x1E0D025B8];
    v37 = *MEMORY[0x1E0CB2D50];
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("vectorWithDoubles"));
    v38[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *p_isa = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v27);

LABEL_21:
    p_isa = 0;
    goto LABEL_22;
  }
LABEL_23:

  return (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)p_isa;
}

- (id)_vectorWithDoublesJSONArray
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
  -[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector vectorWithDoubles](self, "vectorWithDoubles", 0);
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

- (id)jsonDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector _vectorWithDoublesJSONArray](self, "_vectorWithDoublesJSONArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("vectorWithDoubles");
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector vectorWithDoubles](self, "vectorWithDoubles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vectorWithDoubles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector vectorWithDoubles](self, "vectorWithDoubles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vectorWithDoubles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector)vectorWithDoubles
{
  return (BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector *)self->_vectorWithDoubles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorWithDoubles, 0);
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

    v4 = -[BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector initByReadFrom:]([BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("vectorWithDoubles_json"), 5, 1, &__block_literal_global_33);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AE00;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("vectorWithDoubles"), 1, 0, 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __70__BMMLSELabeledDataStoreFeatureFeatureValueDoubleValuedVector_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_vectorWithDoublesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
