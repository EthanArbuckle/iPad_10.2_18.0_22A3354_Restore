@implementation BMAppIntentInvocationAction

- (BMAppIntentInvocationAction)initWithIdentifier:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  BMAppIntentInvocationAction *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMAppIntentInvocationAction;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_parameters, a4);
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
  -[BMAppIntentInvocationAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationAction parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppIntentInvocationAction with identifier: %@, parameters: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntentInvocationAction *v5;
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
  NSString *identifier;
  id v23;
  void *v24;
  uint64_t v25;
  NSArray *parameters;
  int v27;
  BMAppIntentInvocationAction *v28;
  objc_super v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMAppIntentInvocationAction;
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
      if ((v13 >> 3) == 7)
      {
        v31 = 0;
        v32 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v23 = -[BMAppIntentInvocationProperty initByReadFrom:]([BMAppIntentInvocationProperty alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_31:

          goto LABEL_28;
        }
        v24 = v23;
        objc_msgSend(v6, "addObject:", v23);
        PBReaderRecallMark();

      }
      else if ((v13 >> 3) == 1)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        identifier = v5->_identifier;
        v5->_identifier = (NSString *)v21;

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v25 = objc_msgSend(v6, "copy");
  parameters = v5->_parameters;
  v5->_parameters = (NSArray *)v25;

  v27 = v4[*v9];
  if (v27)
LABEL_28:
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
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_parameters;
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
  -[BMAppIntentInvocationAction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntentInvocationAction)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  BMAppIntentInvocationProperty *v19;
  BMAppIntentInvocationProperty *v20;
  id v21;
  id v22;
  id *v23;
  uint64_t v24;
  id v25;
  id *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id *v30;
  uint64_t *v31;
  void *v32;
  uint64_t v33;
  id v35;
  id *v36;
  uint64_t v37;
  void *v38;
  id *v39;
  id v40;
  BMAppIntentInvocationAction *v41;
  id v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = p_isa;
        v24 = *MEMORY[0x1E0D025B8];
        v56 = *MEMORY[0x1E0CB2D50];
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v57[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v24, 2, v12);
        p_isa = 0;
        v8 = 0;
        *v23 = v25;
        goto LABEL_34;
      }
      v8 = 0;
      goto LABEL_36;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("parameters"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  v43 = v7;
  if (v11)
  {
    v39 = p_isa;
    v40 = v6;
    v41 = self;
    v42 = v8;

    v9 = 0;
LABEL_9:
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v9 = v9;
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (!v13)
      goto LABEL_19;
    v14 = v13;
    v15 = *(_QWORD *)v46;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v15)
        objc_enumerationMutation(v9);
      v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = v40;
        self = v41;
        v7 = v43;
        v26 = v39;
        if (!v39)
          goto LABEL_33;
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v49 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("parameters"));
        v50 = v18;
        v29 = (void *)MEMORY[0x1E0C99D80];
        v30 = &v50;
        v31 = &v49;
        goto LABEL_28;
      }
      v18 = v17;
      v19 = [BMAppIntentInvocationProperty alloc];
      v44 = 0;
      v20 = -[BMAppIntentInvocationProperty initWithJSONDictionary:error:](v19, "initWithJSONDictionary:error:", v18, &v44);
      v21 = v44;
      if (v21)
      {
        v32 = v21;
        if (v39)
          *v39 = objc_retainAutorelease(v21);

        v6 = v40;
        self = v41;
        v7 = v43;
LABEL_32:

LABEL_33:
        p_isa = 0;
        v8 = v42;
        goto LABEL_34;
      }
      objc_msgSend(v12, "addObject:", v20);

      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v14)
          goto LABEL_11;
LABEL_19:

        v8 = v42;
        self = -[BMAppIntentInvocationAction initWithIdentifier:parameters:](v41, "initWithIdentifier:parameters:", v42, v12);
        p_isa = (id *)&self->super.super.isa;
        v6 = v40;
        v7 = v43;
LABEL_34:

        goto LABEL_35;
      }
    }
    v6 = v40;
    self = v41;
    v7 = v43;
    v26 = v39;
    if (!v39)
      goto LABEL_33;
    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v28 = *MEMORY[0x1E0D025B8];
    v51 = *MEMORY[0x1E0CB2D50];
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("parameters"));
    v52 = v18;
    v29 = (void *)MEMORY[0x1E0C99D80];
    v30 = &v52;
    v31 = &v51;
LABEL_28:
    objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v28;
    v7 = v43;
    *v26 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v33, 2, v32);
    goto LABEL_32;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v39 = p_isa;
    v40 = v6;
    v41 = self;
    v42 = v8;
    goto LABEL_9;
  }
  if (p_isa)
  {
    v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v36 = p_isa;
    v37 = *MEMORY[0x1E0D025B8];
    v54 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("parameters"));
    v55 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *v36 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v37, 2, v38);

    p_isa = 0;
    goto LABEL_34;
  }
LABEL_35:

LABEL_36:
  return (BMAppIntentInvocationAction *)p_isa;
}

- (id)_parametersJSONArray
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
  -[BMAppIntentInvocationAction parameters](self, "parameters", 0);
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
  -[BMAppIntentInvocationAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationAction _parametersJSONArray](self, "_parametersJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("identifier");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("parameters");
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
    -[BMAppIntentInvocationAction identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppIntentInvocationAction identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMAppIntentInvocationAction parameters](self, "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMAppIntentInvocationAction parameters](self, "parameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parameters");
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

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMAppIntentInvocationAction initByReadFrom:]([BMAppIntentInvocationAction alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("parameters_json"), 5, 1, &__block_literal_global_577);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CC00;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("parameters"), 7, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __38__BMAppIntentInvocationAction_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_parametersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
