@implementation BMFeedbackEvaluationResponse

- (BMFeedbackEvaluationResponse)initWithEvaluationUuid:(id)a3 userResponse:(int)a4
{
  id v6;
  BMFeedbackEvaluationResponse *v7;
  uint64_t v8;
  NSData *raw_evaluationUuid;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMFeedbackEvaluationResponse;
  v7 = -[BMEventBase init](&v11, sel_init);
  if (v7)
  {
    v7->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v12[0] = 0;
      v12[1] = 0;
      objc_msgSend(v6, "getUUIDBytes:", v12);
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v12, 16);
      raw_evaluationUuid = v7->_raw_evaluationUuid;
      v7->_raw_evaluationUuid = (NSData *)v8;
    }
    else
    {
      raw_evaluationUuid = v7->_raw_evaluationUuid;
      v7->_raw_evaluationUuid = 0;
    }

    v7->_userResponse = a4;
  }

  return v7;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMFeedbackEvaluationResponse evaluationUuid](self, "evaluationUuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMFeedbackEvaluationResponseUserResponseAsString(-[BMFeedbackEvaluationResponse userResponse](self, "userResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMFeedbackEvaluationResponse with evaluationUuid: %@, userResponse: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFeedbackEvaluationResponse *v5;
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
  BOOL v16;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  NSData *v25;
  NSData *raw_evaluationUuid;
  BMFeedbackEvaluationResponse *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMFeedbackEvaluationResponse;
  v5 = -[BMEventBase init](&v29, sel_init);
  if (!v5)
    goto LABEL_41;
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
        v16 = v11++ >= 9;
        if (v16)
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
      if ((v12 >> 3) == 1)
      {
        PBReaderReadData();
        v25 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (-[NSData length](v25, "length") != 16)
        {

          goto LABEL_40;
        }
        raw_evaluationUuid = v5->_raw_evaluationUuid;
        v5->_raw_evaluationUuid = v25;

      }
      else if ((v12 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        while (1)
        {
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
            break;
          v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
          *(_QWORD *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_33;
          v19 += 7;
          v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_35;
          }
        }
        v4[*v8] = 1;
LABEL_33:
        if (v4[*v8])
          LODWORD(v21) = 0;
LABEL_35:
        if (v21 >= 8)
          LODWORD(v21) = 0;
        v5->_userResponse = v21;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_40;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_40:
    v27 = 0;
  else
LABEL_41:
    v27 = v5;

  return v27;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_raw_evaluationUuid)
    PBDataWriterWriteDataField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMFeedbackEvaluationResponse writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMFeedbackEvaluationResponse)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  BMFeedbackEvaluationResponse *v17;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("evaluationUuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userResponse"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v20 = *MEMORY[0x1E0D025B8];
            v26 = *MEMORY[0x1E0CB2D50];
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userResponse"));
            v27 = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v22);

          }
          v10 = 0;
          v17 = 0;
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFeedbackEvaluationResponseUserResponseFromString(v9));
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v13;
    }
    else
    {
      v10 = 0;
    }
    self = -[BMFeedbackEvaluationResponse initWithEvaluationUuid:userResponse:](self, "initWithEvaluationUuid:userResponse:", v8, objc_msgSend(v10, "intValue"));
    v17 = self;
LABEL_18:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v17 = 0;
      goto LABEL_21;
    }
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0D025B8];
    v28 = *MEMORY[0x1E0CB2D50];
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("evaluationUuid"));
    v29 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v10);
    v17 = 0;
    *a4 = v16;
    goto LABEL_19;
  }
  v8 = v7;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  if (v11)
  {
    v12 = (void *)v11;

    v8 = v12;
    goto LABEL_4;
  }
  if (!a4)
  {
    v17 = 0;
    goto LABEL_20;
  }
  v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v24 = *MEMORY[0x1E0D025B8];
  v30 = *MEMORY[0x1E0CB2D50];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("evaluationUuid"));
  v31[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v25);

  v17 = 0;
LABEL_19:

LABEL_20:
LABEL_21:

  return v17;
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
  -[BMFeedbackEvaluationResponse evaluationUuid](self, "evaluationUuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFeedbackEvaluationResponse userResponse](self, "userResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("evaluationUuid");
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("userResponse");
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

    if (v4)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_9;
LABEL_7:

  return v8;
}

- (NSUUID)evaluationUuid
{
  NSData *raw_evaluationUuid;
  void *v3;

  raw_evaluationUuid = self->_raw_evaluationUuid;
  if (raw_evaluationUuid)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_evaluationUuid, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
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
  BOOL v12;
  int v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMFeedbackEvaluationResponse evaluationUuid](self, "evaluationUuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "evaluationUuid");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMFeedbackEvaluationResponse evaluationUuid](self, "evaluationUuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "evaluationUuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v13 = -[BMFeedbackEvaluationResponse userResponse](self, "userResponse");
    v12 = v13 == objc_msgSend(v5, "userResponse");
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)userResponse
{
  return self->_userResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raw_evaluationUuid, 0);
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

    v4 = -[BMFeedbackEvaluationResponse initByReadFrom:]([BMFeedbackEvaluationResponse alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("evaluationUuid"), 6, 0, 1, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userResponse"), 0, 0, 2, 4, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D488;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("evaluationUuid"), 1, 14, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userResponse"), 2, 4, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
