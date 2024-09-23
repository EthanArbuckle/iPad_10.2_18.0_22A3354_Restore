@implementation BMContextualUnderstandingActivityInference

- (BMContextualUnderstandingActivityInference)initWithInferredActivities:(id)a3
{
  id v5;
  BMContextualUnderstandingActivityInference *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMContextualUnderstandingActivityInference;
  v6 = -[BMEventBase init](&v8, sel_init);
  if (v6)
  {
    v6->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v6->_inferredActivities, a3);
  }

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMContextualUnderstandingActivityInference inferredActivities](self, "inferredActivities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextualUnderstandingActivityInference with inferredActivities: %@"), v4);

  return (NSString *)v5;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextualUnderstandingActivityInference *v5;
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
  int v19;
  id v21;
  void *v22;
  uint64_t v23;
  NSArray *inferredActivities;
  int v25;
  BMContextualUnderstandingActivityInference *v26;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMContextualUnderstandingActivityInference;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_26;
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
      if ((v13 >> 3) == 1)
      {
        v29 = 0;
        v30 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v21 = -[BMContextualUnderstandingActivityInferenceInferredActivity initByReadFrom:]([BMContextualUnderstandingActivityInferenceInferredActivity alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_27:

          goto LABEL_28;
        }
        v22 = v21;
        objc_msgSend(v6, "addObject:", v21);
        PBReaderRecallMark();

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_27;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v23 = objc_msgSend(v6, "copy");
  inferredActivities = v5->_inferredActivities;
  v5->_inferredActivities = (NSArray *)v23;

  v25 = v4[*v9];
  if (v25)
LABEL_28:
    v26 = 0;
  else
LABEL_26:
    v26 = v5;

  return v26;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_inferredActivities;
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
  -[BMContextualUnderstandingActivityInference writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMContextualUnderstandingActivityInference)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  BMContextualUnderstandingActivityInferenceInferredActivity *v16;
  BMContextualUnderstandingActivityInferenceInferredActivity *v17;
  id v18;
  id *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id *v23;
  uint64_t *v24;
  void *v25;
  id v27;
  uint64_t v28;
  BMContextualUnderstandingActivityInference *v29;
  void *v30;
  BMContextualUnderstandingActivityInference *v31;
  id *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("inferredActivities"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v32 = p_isa;

    v6 = 0;
LABEL_6:
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = v6;
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (!v10)
      goto LABEL_16;
    v11 = v10;
    v12 = *(_QWORD *)v35;
    v31 = self;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        self = v31;
        v19 = v32;
        if (!v32)
          goto LABEL_26;
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0D025B8];
        v38 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("inferredActivities"));
        v39 = v15;
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = &v39;
        v24 = &v38;
        goto LABEL_21;
      }
      v15 = v14;
      v16 = [BMContextualUnderstandingActivityInferenceInferredActivity alloc];
      v33 = 0;
      v17 = -[BMContextualUnderstandingActivityInferenceInferredActivity initWithJSONDictionary:error:](v16, "initWithJSONDictionary:error:", v15, &v33);
      v18 = v33;
      if (v18)
      {
        v25 = v18;
        if (v32)
          *v32 = objc_retainAutorelease(v18);

        self = v31;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      objc_msgSend(v9, "addObject:", v17);

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        self = v31;
        if (v11)
          goto LABEL_8;
LABEL_16:

        self = -[BMContextualUnderstandingActivityInference initWithInferredActivities:](self, "initWithInferredActivities:", v9);
        p_isa = (id *)&self->super.super.isa;
LABEL_28:

        goto LABEL_29;
      }
    }
    self = v31;
    v19 = v32;
    if (!v32)
      goto LABEL_26;
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = *MEMORY[0x1E0D025B8];
    v40 = *MEMORY[0x1E0CB2D50];
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("inferredActivities"));
    v41 = v15;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v41;
    v24 = &v40;
LABEL_21:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *v19 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v25);
    goto LABEL_25;
  }
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v32 = p_isa;
    goto LABEL_6;
  }
  if (p_isa)
  {
    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v28 = *MEMORY[0x1E0D025B8];
    v43 = *MEMORY[0x1E0CB2D50];
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("inferredActivities"));
    v44[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v29 = self;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *p_isa = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v30);

    self = v29;
LABEL_27:
    p_isa = 0;
    goto LABEL_28;
  }
LABEL_29:

  return (BMContextualUnderstandingActivityInference *)p_isa;
}

- (id)_inferredActivitiesJSONArray
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
  -[BMContextualUnderstandingActivityInference inferredActivities](self, "inferredActivities", 0);
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
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[BMContextualUnderstandingActivityInference _inferredActivitiesJSONArray](self, "_inferredActivitiesJSONArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("inferredActivities");
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
    -[BMContextualUnderstandingActivityInference inferredActivities](self, "inferredActivities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inferredActivities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[BMContextualUnderstandingActivityInference inferredActivities](self, "inferredActivities");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inferredActivities");
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

- (NSArray)inferredActivities
{
  return self->_inferredActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredActivities, 0);
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

    v4 = -[BMContextualUnderstandingActivityInference initByReadFrom:]([BMContextualUnderstandingActivityInference alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("inferredActivities_json"), 5, 1, &__block_literal_global_138_53032);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DFB0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("inferredActivities"), 1, 14, objc_opt_class());
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __53__BMContextualUnderstandingActivityInference_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inferredActivitiesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
