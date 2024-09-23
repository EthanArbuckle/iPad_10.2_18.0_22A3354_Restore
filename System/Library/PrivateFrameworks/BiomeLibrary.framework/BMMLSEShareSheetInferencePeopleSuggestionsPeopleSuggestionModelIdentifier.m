@implementation BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier)initWithModelType:(int)a3 trialIdentifier:(id)a4 otherModelTypeName:(id)a5
{
  id v9;
  id v10;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *v11;
  objc_super v13;

  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier;
  v11 = -[BMEventBase init](&v13, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v11->_modelType = a3;
    objc_storeStrong((id *)&v11->_trialIdentifier, a4);
    objc_storeStrong((id *)&v11->_otherModelTypeName, a5);
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeAsString(-[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier modelType](self, "modelType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier trialIdentifier](self, "trialIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier otherModelTypeName](self, "otherModelTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier with modelType: %@, trialIdentifier: %@, otherModelTypeName: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  unint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  NSString *otherModelTypeName;
  BMTrialIdentifier *v30;
  BMTrialIdentifier *trialIdentifier;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *v32;
  objc_super v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier;
  v5 = -[BMEventBase init](&v34, sel_init);
  if (!v5)
    goto LABEL_44;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        otherModelTypeName = v5->_otherModelTypeName;
        v5->_otherModelTypeName = (NSString *)v28;

      }
      else if ((_DWORD)v20 == 2)
      {
        v35 = 0;
        v36 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_43;
        v30 = -[BMTrialIdentifier initByReadFrom:]([BMTrialIdentifier alloc], "initByReadFrom:", v4);
        if (!v30)
          goto LABEL_43;
        trialIdentifier = v5->_trialIdentifier;
        v5->_trialIdentifier = v30;

        PBReaderRecallMark();
      }
      else if ((_DWORD)v20 == 1)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (1)
        {
          v24 = *v6;
          v25 = *(_QWORD *)&v4[v24];
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)&v4[*v7])
            break;
          v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
          *(_QWORD *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0)
            goto LABEL_36;
          v21 += 7;
          v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_38;
          }
        }
        v4[*v8] = 1;
LABEL_36:
        if (v4[*v8])
          LODWORD(v23) = 0;
LABEL_38:
        if (v23 >= 0x1E)
          LODWORD(v23) = 0;
        v5->_modelType = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_43;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_43:
    v32 = 0;
  else
LABEL_44:
    v32 = v5;

  return v32;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_trialIdentifier)
  {
    PBDataWriterPlaceMark();
    -[BMTrialIdentifier writeTo:](self->_trialIdentifier, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_otherModelTypeName)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BMTrialIdentifier *v11;
  void *v12;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *v13;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  BMTrialIdentifier *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v8 = 0;
          v13 = 0;
          goto LABEL_19;
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v33 = *MEMORY[0x1E0CB2D50];
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("modelType"));
        v34[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
        v11 = (BMTrialIdentifier *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v11);
        v8 = 0;
        v13 = 0;
        *a4 = v24;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeFromString(v7));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trialIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v10;
    v28 = 0;
    v11 = -[BMTrialIdentifier initWithJSONDictionary:error:]([BMTrialIdentifier alloc], "initWithJSONDictionary:error:", v15, &v28);
    v16 = v28;
    if (v16)
    {
      v17 = v16;
      if (a4)
        *a4 = objc_retainAutorelease(v16);

      v13 = 0;
      v10 = v15;
      goto LABEL_17;
    }

LABEL_12:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("otherModelTypeName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v25 = *MEMORY[0x1E0D025B8];
          v29 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("otherModelTypeName"));
          v30 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v25, 2, v21);

          v13 = 0;
          a4 = 0;
        }
        else
        {
          v13 = 0;
        }
        goto LABEL_16;
      }
      a4 = v12;
    }
    else
    {
      a4 = 0;
    }
    self = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier initWithModelType:trialIdentifier:otherModelTypeName:](self, "initWithModelType:trialIdentifier:otherModelTypeName:", objc_msgSend(v8, "intValue"), v11, a4);
    v13 = self;
LABEL_16:

    goto LABEL_17;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_18;
  }
  v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = *MEMORY[0x1E0D025B8];
  v31 = *MEMORY[0x1E0CB2D50];
  v11 = (BMTrialIdentifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("trialIdentifier"));
  v32 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v18, 2, v19);

  v13 = 0;
LABEL_17:

LABEL_18:
LABEL_19:

  return v13;
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
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier modelType](self, "modelType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier trialIdentifier](self, "trialIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier otherModelTypeName](self, "otherModelTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("modelType");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v7;
  v12[1] = CFSTR("trialIdentifier");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  v12[2] = CFSTR("otherModelTypeName");
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_9;
LABEL_12:

    if (v3)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v5)
    goto LABEL_12;
LABEL_9:
  if (!v3)
    goto LABEL_13;
LABEL_10:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier modelType](self, "modelType");
    if (v6 == objc_msgSend(v5, "modelType"))
    {
      -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier trialIdentifier](self, "trialIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trialIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier trialIdentifier](self, "trialIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "trialIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier otherModelTypeName](self, "otherModelTypeName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "otherModelTypeName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
        v13 = 1;
      }
      else
      {
        -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier otherModelTypeName](self, "otherModelTypeName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "otherModelTypeName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v16, "isEqual:", v17);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)modelType
{
  return self->_modelType;
}

- (BMTrialIdentifier)trialIdentifier
{
  return self->_trialIdentifier;
}

- (NSString)otherModelTypeName
{
  return self->_otherModelTypeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherModelTypeName, 0);
  objc_storeStrong((id *)&self->_trialIdentifier, 0);
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

    v4 = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier initByReadFrom:]([BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modelType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("trialIdentifier_json"), 5, 1, &__block_literal_global_96);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("otherModelTypeName"), 2, 0, 3, 13, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FE40;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modelType"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trialIdentifier"), 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("otherModelTypeName"), 3, 13, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __84__BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trialIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
