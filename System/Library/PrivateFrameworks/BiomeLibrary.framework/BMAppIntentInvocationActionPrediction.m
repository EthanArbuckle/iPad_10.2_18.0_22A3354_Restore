@implementation BMAppIntentInvocationActionPrediction

- (BMAppIntentInvocationActionPrediction)initWithParameterIdentifiers:(id)a3 displayRepresentation:(id)a4
{
  id v7;
  id v8;
  BMAppIntentInvocationActionPrediction *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMAppIntentInvocationActionPrediction;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_parameterIdentifiers, a3);
    objc_storeStrong((id *)&v9->_displayRepresentation, a4);
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
  -[BMAppIntentInvocationActionPrediction parameterIdentifiers](self, "parameterIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionPrediction displayRepresentation](self, "displayRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppIntentInvocationActionPrediction with parameterIdentifiers: %@, displayRepresentation: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntentInvocationActionPrediction *v5;
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
  uint64_t v21;
  void *v22;
  BMAppIntentInvocationDisplayRepresentation *v23;
  BMAppIntentInvocationDisplayRepresentation *displayRepresentation;
  uint64_t v25;
  NSArray *parameterIdentifiers;
  int v27;
  BMAppIntentInvocationActionPrediction *v28;
  objc_super v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMAppIntentInvocationActionPrediction;
  v5 = -[BMEventBase init](&v30, sel_init);
  if (!v5)
    goto LABEL_29;
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
      if ((v13 >> 3) == 2)
      {
        v31 = 0;
        v32 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v23 = -[BMAppIntentInvocationDisplayRepresentation initByReadFrom:]([BMAppIntentInvocationDisplayRepresentation alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_30:

          goto LABEL_31;
        }
        displayRepresentation = v5->_displayRepresentation;
        v5->_displayRepresentation = v23;

        PBReaderRecallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_30;
        v22 = (void *)v21;
        objc_msgSend(v6, "addObject:", v21);

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_30;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v25 = objc_msgSend(v6, "copy");
  parameterIdentifiers = v5->_parameterIdentifiers;
  v5->_parameterIdentifiers = (NSArray *)v25;

  v27 = v4[*v9];
  if (v27)
LABEL_31:
    v28 = 0;
  else
LABEL_29:
    v28 = v5;

  return v28;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  v5 = self->_parameterIdentifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_displayRepresentation)
  {
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationDisplayRepresentation writeTo:](self->_displayRepresentation, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppIntentInvocationActionPrediction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntentInvocationActionPrediction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BMAppIntentInvocationActionPrediction *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BMAppIntentInvocationDisplayRepresentation *v18;
  BMAppIntentInvocationActionPrediction *v19;
  id *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  id *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  BMAppIntentInvocationDisplayRepresentation *v46;
  uint64_t v47;
  BMAppIntentInvocationDisplayRepresentation *v48;
  uint64_t v49;
  BMAppIntentInvocationDisplayRepresentation *v50;
  _BYTE v51[128];
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("parameterIdentifiers"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v39 = a4;

    v7 = 0;
LABEL_6:
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v7 = v7;
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (!v11)
      goto LABEL_15;
    v12 = v11;
    v13 = *(_QWORD *)v42;
    v38 = v6;
LABEL_8:
    v14 = self;
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v13)
        objc_enumerationMutation(v7);
      v16 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v15);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v39)
        {
          v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v27 = *MEMORY[0x1E0D025B8];
          v47 = *MEMORY[0x1E0CB2D50];
          v18 = (BMAppIntentInvocationDisplayRepresentation *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("parameterIdentifiers"));
          v48 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v26;
          v25 = v27;
          v20 = v39;
          goto LABEL_23;
        }
        goto LABEL_25;
      }
      objc_msgSend(v10, "addObject:", v16);
      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        self = v14;
        v6 = v38;
        if (v12)
          goto LABEL_8;
LABEL_15:

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayRepresentation"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v18 = 0;
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v32 = v17;
          v40 = 0;
          v18 = -[BMAppIntentInvocationDisplayRepresentation initWithJSONDictionary:error:]([BMAppIntentInvocationDisplayRepresentation alloc], "initWithJSONDictionary:error:", v32, &v40);
          v33 = v40;
          if (v33)
          {
            v34 = v33;
            if (v39)
              *v39 = objc_retainAutorelease(v33);

            v19 = 0;
            v17 = v32;
          }
          else
          {

LABEL_18:
            self = -[BMAppIntentInvocationActionPrediction initWithParameterIdentifiers:displayRepresentation:](self, "initWithParameterIdentifiers:displayRepresentation:", v10, v18);
            v19 = self;
          }
LABEL_24:

        }
        else
        {
          if (v39)
          {
            v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v36 = *MEMORY[0x1E0D025B8];
            v45 = *MEMORY[0x1E0CB2D50];
            v18 = (BMAppIntentInvocationDisplayRepresentation *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("displayRepresentation"));
            v46 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *v39 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v37);

            v19 = 0;
            goto LABEL_24;
          }
          v19 = 0;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    v20 = v39;
    if (v39)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0D025B8];
      v49 = *MEMORY[0x1E0CB2D50];
      v18 = (BMAppIntentInvocationDisplayRepresentation *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("parameterIdentifiers"));
      v50 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      v25 = v22;
LABEL_23:
      self = v14;
      *v20 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v23);

      v19 = 0;
      v17 = v7;
      v6 = v38;
      goto LABEL_24;
    }
LABEL_25:
    v19 = 0;
    v17 = v7;
    self = v14;
    v6 = v38;
    goto LABEL_28;
  }
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v39 = a4;
    goto LABEL_6;
  }
  if (a4)
  {
    v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v29 = *MEMORY[0x1E0D025B8];
    v52 = *MEMORY[0x1E0CB2D50];
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("parameterIdentifiers"));
    v53[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v17);
    v19 = 0;
    *a4 = v30;
    goto LABEL_28;
  }
  v19 = 0;
LABEL_29:

  return v19;
}

- (id)_parameterIdentifiersJSONArray
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
  -[BMAppIntentInvocationActionPrediction parameterIdentifiers](self, "parameterIdentifiers", 0);
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
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[BMAppIntentInvocationActionPrediction _parameterIdentifiersJSONArray](self, "_parameterIdentifiersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationActionPrediction displayRepresentation](self, "displayRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = CFSTR("parameterIdentifiers");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("displayRepresentation");
  v11[0] = v6;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    if (v3)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_9;
LABEL_7:

  return v8;
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
    -[BMAppIntentInvocationActionPrediction parameterIdentifiers](self, "parameterIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parameterIdentifiers");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppIntentInvocationActionPrediction parameterIdentifiers](self, "parameterIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parameterIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMAppIntentInvocationActionPrediction displayRepresentation](self, "displayRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMAppIntentInvocationActionPrediction displayRepresentation](self, "displayRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayRepresentation");
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

- (NSArray)parameterIdentifiers
{
  return self->_parameterIdentifiers;
}

- (BMAppIntentInvocationDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_parameterIdentifiers, 0);
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

    v4 = -[BMAppIntentInvocationActionPrediction initByReadFrom:]([BMAppIntentInvocationActionPrediction alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("parameterIdentifiers_json"), 5, 1, &__block_literal_global_775);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("displayRepresentation_json"), 5, 1, &__block_literal_global_776);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CC60;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("parameterIdentifiers"), 1, 13, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("displayRepresentation"), 2, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __48__BMAppIntentInvocationActionPrediction_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __48__BMAppIntentInvocationActionPrediction_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_parameterIdentifiersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
