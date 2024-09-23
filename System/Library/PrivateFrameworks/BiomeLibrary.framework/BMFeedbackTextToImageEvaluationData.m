@implementation BMFeedbackTextToImageEvaluationData

- (BMFeedbackTextToImageEvaluationData)initWithCommonMetadata:(id)a3 originalContent:(id)a4 generatedContent:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMFeedbackTextToImageEvaluationData *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMFeedbackTextToImageEvaluationData;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_commonMetadata, a3);
    objc_storeStrong((id *)&v12->_originalContent, a4);
    objc_storeStrong((id *)&v12->_generatedContent, a5);
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
  -[BMFeedbackTextToImageEvaluationData commonMetadata](self, "commonMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFeedbackTextToImageEvaluationData originalContent](self, "originalContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFeedbackTextToImageEvaluationData generatedContent](self, "generatedContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMFeedbackTextToImageEvaluationData with commonMetadata: %@, originalContent: %@, generatedContent: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFeedbackTextToImageEvaluationData *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v17;
  unint64_t v19;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  BMFeedbackTextToImageEvaluationData *v23;
  objc_super v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMFeedbackTextToImageEvaluationData;
  v5 = -[BMEventBase init](&v25, sel_init);
  if (!v5)
    goto LABEL_36;
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
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v26 = 0;
        v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_35;
        v20 = -[BMImageContent initByReadFrom:]([BMImageContent alloc], "initByReadFrom:", v4);
        if (!v20)
          goto LABEL_35;
        v21 = 40;
      }
      else if ((_DWORD)v19 == 2)
      {
        v26 = 0;
        v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_35;
        v20 = -[BMTextContent initByReadFrom:]([BMTextContent alloc], "initByReadFrom:", v4);
        if (!v20)
          goto LABEL_35;
        v21 = 32;
      }
      else
      {
        if ((_DWORD)v19 != 1)
        {
          if (!PBReaderSkipValueWithTag())
            goto LABEL_35;
          continue;
        }
        v26 = 0;
        v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_35;
        v20 = -[BMEvaluationCommonMetadata initByReadFrom:]([BMEvaluationCommonMetadata alloc], "initByReadFrom:", v4);
        if (!v20)
          goto LABEL_35;
        v21 = 24;
      }
      v22 = *(Class *)((char *)&v5->super.super.isa + v21);
      *(Class *)((char *)&v5->super.super.isa + v21) = v20;

      PBReaderRecallMark();
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_35:
    v23 = 0;
  else
LABEL_36:
    v23 = v5;

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_commonMetadata)
  {
    PBDataWriterPlaceMark();
    -[BMEvaluationCommonMetadata writeTo:](self->_commonMetadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_originalContent)
  {
    PBDataWriterPlaceMark();
    -[BMTextContent writeTo:](self->_originalContent, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_generatedContent)
  {
    PBDataWriterPlaceMark();
    -[BMImageContent writeTo:](self->_generatedContent, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMFeedbackTextToImageEvaluationData writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMFeedbackTextToImageEvaluationData)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMEvaluationCommonMetadata *v8;
  id v9;
  BMTextContent *v10;
  id v11;
  BMImageContent *v12;
  BMFeedbackTextToImageEvaluationData *v13;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  BMImageContent *v35;
  uint64_t v36;
  BMTextContent *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("commonMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v33 = 0;
    v8 = -[BMEvaluationCommonMetadata initWithJSONDictionary:error:]([BMEvaluationCommonMetadata alloc], "initWithJSONDictionary:error:", v9, &v33);
    v15 = v33;
    if (v15)
    {
      v16 = v15;
      if (a4)
        *a4 = objc_retainAutorelease(v15);

      goto LABEL_34;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("originalContent"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v9;
      v32 = 0;
      v10 = -[BMTextContent initWithJSONDictionary:error:]([BMTextContent alloc], "initWithJSONDictionary:error:", v11, &v32);
      v17 = v32;
      if (v17)
      {
        v18 = v17;
        if (a4)
          *a4 = objc_retainAutorelease(v17);

        goto LABEL_37;
      }

LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("generatedContent"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v12 = 0;
LABEL_10:
        self = -[BMFeedbackTextToImageEvaluationData initWithCommonMetadata:originalContent:generatedContent:](self, "initWithCommonMetadata:originalContent:generatedContent:", v8, v10, v12);
        v13 = self;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = a4;
        v19 = v11;
        v31 = 0;
        v12 = -[BMImageContent initWithJSONDictionary:error:]([BMImageContent alloc], "initWithJSONDictionary:error:", v19, &v31);
        v20 = v31;
        if (v20)
        {
          v21 = v20;
          if (v28)
            *v28 = objc_retainAutorelease(v20);

          v13 = 0;
          goto LABEL_11;
        }

        goto LABEL_10;
      }
      if (a4)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v34 = *MEMORY[0x1E0CB2D50];
        v12 = (BMImageContent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("generatedContent"));
        v35 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v27, 2, v26);

        v13 = 0;
        goto LABEL_11;
      }
LABEL_37:
      v13 = 0;
      goto LABEL_12;
    }
    if (a4)
    {
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v24 = *MEMORY[0x1E0D025B8];
      v36 = *MEMORY[0x1E0CB2D50];
      v10 = (BMTextContent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("originalContent"));
      v37 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v24, 2, v11);
      v13 = 0;
      *a4 = v25;
      goto LABEL_12;
    }
LABEL_34:
    v13 = 0;
    goto LABEL_13;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_14;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v23 = *MEMORY[0x1E0D025B8];
  v38 = *MEMORY[0x1E0CB2D50];
  v8 = (BMEvaluationCommonMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("commonMetadata"));
  v39[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  *a4 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v9);
LABEL_13:

LABEL_14:
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
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  -[BMFeedbackTextToImageEvaluationData commonMetadata](self, "commonMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMFeedbackTextToImageEvaluationData originalContent](self, "originalContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMFeedbackTextToImageEvaluationData generatedContent](self, "generatedContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = CFSTR("commonMetadata");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v9;
  v14[1] = CFSTR("originalContent");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v10;
  v14[2] = CFSTR("generatedContent");
  v11 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
      goto LABEL_9;
LABEL_12:

    if (v4)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v6)
    goto LABEL_12;
LABEL_9:
  if (!v4)
    goto LABEL_13;
LABEL_10:

  return v12;
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
    -[BMFeedbackTextToImageEvaluationData commonMetadata](self, "commonMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commonMetadata");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMFeedbackTextToImageEvaluationData commonMetadata](self, "commonMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "commonMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMFeedbackTextToImageEvaluationData originalContent](self, "originalContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalContent");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMFeedbackTextToImageEvaluationData originalContent](self, "originalContent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "originalContent");
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
    -[BMFeedbackTextToImageEvaluationData generatedContent](self, "generatedContent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "generatedContent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMFeedbackTextToImageEvaluationData generatedContent](self, "generatedContent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "generatedContent");
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

- (BMEvaluationCommonMetadata)commonMetadata
{
  return self->_commonMetadata;
}

- (BMTextContent)originalContent
{
  return self->_originalContent;
}

- (BMImageContent)generatedContent
{
  return self->_generatedContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedContent, 0);
  objc_storeStrong((id *)&self->_originalContent, 0);
  objc_storeStrong((id *)&self->_commonMetadata, 0);
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

    v4 = -[BMFeedbackTextToImageEvaluationData initByReadFrom:]([BMFeedbackTextToImageEvaluationData alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("commonMetadata_json"), 5, 1, &__block_literal_global_7988);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("originalContent_json"), 5, 1, &__block_literal_global_26);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("generatedContent_json"), 5, 1, &__block_literal_global_27);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AF08;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("commonMetadata"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("originalContent"), 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("generatedContent"), 3, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__BMFeedbackTextToImageEvaluationData_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generatedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__BMFeedbackTextToImageEvaluationData_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__BMFeedbackTextToImageEvaluationData_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
