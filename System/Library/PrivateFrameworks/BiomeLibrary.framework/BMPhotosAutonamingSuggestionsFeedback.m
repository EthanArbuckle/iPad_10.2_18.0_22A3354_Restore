@implementation BMPhotosAutonamingSuggestionsFeedback

- (BMPhotosAutonamingSuggestionsFeedback)initWithFeedbackType:(int)a3 associationType:(int)a4
{
  return -[BMPhotosAutonamingSuggestionsFeedback initWithFeedbackType:associationType:feedbackId:visualId:](self, "initWithFeedbackType:associationType:feedbackId:visualId:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0, 0);
}

- (BMPhotosAutonamingSuggestionsFeedback)initWithFeedbackType:(int)a3 associationType:(int)a4 feedbackId:(id)a5 visualId:(id)a6
{
  id v11;
  id v12;
  BMPhotosAutonamingSuggestionsFeedback *v13;
  objc_super v15;

  v11 = a5;
  v12 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BMPhotosAutonamingSuggestionsFeedback;
  v13 = -[BMEventBase init](&v15, sel_init);
  if (v13)
  {
    v13->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v13->_feedbackType = a3;
    v13->_associationType = a4;
    objc_storeStrong((id *)&v13->_feedbackId, a5);
    objc_storeStrong((id *)&v13->_visualId, a6);
  }

  return v13;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeAsString(-[BMPhotosAutonamingSuggestionsFeedback feedbackType](self, "feedbackType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosAutonamingSuggestionsFeedbackAssociationTypeAsString(-[BMPhotosAutonamingSuggestionsFeedback associationType](self, "associationType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosAutonamingSuggestionsFeedback feedbackId](self, "feedbackId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosAutonamingSuggestionsFeedback visualId](self, "visualId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPhotosAutonamingSuggestionsFeedback with feedbackType: %@, associationType: %@, feedbackId: %@, visualId: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPhotosAutonamingSuggestionsFeedback *v5;
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  BMPhotosAutonamingSuggestionsFeedback *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMPhotosAutonamingSuggestionsFeedback;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_55;
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
      switch((v12 >> 3))
      {
        case 1u:
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
              goto LABEL_40;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_42;
            }
          }
          v4[*v8] = 1;
LABEL_40:
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_42:
          if (v21 >= 4)
            LODWORD(v21) = 0;
          v33 = 20;
          goto LABEL_51;
        case 2u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          break;
        case 3u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 32;
          goto LABEL_38;
        case 4u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 40;
LABEL_38:
          v32 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = (Class)v30;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_54;
          continue;
      }
      while (1)
      {
        v27 = *v6;
        v28 = *(_QWORD *)&v4[v27];
        if (v28 == -1 || v28 >= *(_QWORD *)&v4[*v7])
          break;
        v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v28);
        *(_QWORD *)&v4[v27] = v28 + 1;
        v21 |= (unint64_t)(v29 & 0x7F) << v25;
        if ((v29 & 0x80) == 0)
          goto LABEL_46;
        v25 += 7;
        v16 = v26++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_48;
        }
      }
      v4[*v8] = 1;
LABEL_46:
      if (v4[*v8])
        LODWORD(v21) = 0;
LABEL_48:
      if (v21 >= 9)
        LODWORD(v21) = 0;
      v33 = 24;
LABEL_51:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v21;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_54:
    v34 = 0;
  else
LABEL_55:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_feedbackId)
    PBDataWriterWriteStringField();
  if (self->_visualId)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPhotosAutonamingSuggestionsFeedback writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPhotosAutonamingSuggestionsFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  BMPhotosAutonamingSuggestionsFeedback *v15;
  BMPhotosAutonamingSuggestionsFeedback *v16;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id *v29;
  id v30;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feedbackType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v32 = 0;
          v16 = 0;
          v15 = self;
          goto LABEL_27;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v39 = *MEMORY[0x1E0CB2D50];
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("feedbackType"));
        v40[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        v16 = 0;
        *a4 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v8);
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeFromString(v6));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v32 = v7;
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("associationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v8;
LABEL_16:
        v9 = v10;
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosAutonamingSuggestionsFeedbackAssociationTypeFromString(v8));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if (a4)
      {
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v37 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("associationType"));
        v38 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v11);
        v9 = 0;
        v16 = 0;
        *a4 = v27;
        goto LABEL_42;
      }
      v9 = 0;
      v16 = 0;
LABEL_45:
      v15 = self;
      goto LABEL_26;
    }
  }
  v9 = 0;
LABEL_17:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feedbackId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v29 = a4;
      v19 = *MEMORY[0x1E0D025B8];
      v35 = *MEMORY[0x1E0CB2D50];
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("feedbackId"));
      v36 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v13);
      v16 = 0;
      v12 = 0;
      v15 = self;
      *v29 = v20;
      goto LABEL_24;
    }
    v12 = 0;
    v16 = 0;
LABEL_42:
    v15 = self;
    goto LABEL_25;
  }
  v12 = v11;
LABEL_20:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visualId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v33 = *MEMORY[0x1E0CB2D50];
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("visualId"));
        v34 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v22);

      }
      v14 = 0;
      v16 = 0;
      v15 = self;
      goto LABEL_24;
    }
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  v15 = -[BMPhotosAutonamingSuggestionsFeedback initWithFeedbackType:associationType:feedbackId:visualId:](self, "initWithFeedbackType:associationType:feedbackId:visualId:", objc_msgSend(v32, "intValue"), objc_msgSend(v9, "intValue"), v12, v14);
  v16 = v15;
LABEL_24:

LABEL_25:
LABEL_26:

LABEL_27:
  return v16;
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
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosAutonamingSuggestionsFeedback feedbackType](self, "feedbackType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosAutonamingSuggestionsFeedback associationType](self, "associationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosAutonamingSuggestionsFeedback feedbackId](self, "feedbackId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosAutonamingSuggestionsFeedback visualId](self, "visualId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("feedbackType");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("associationType");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("feedbackId");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("visualId");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_11;
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4)
        goto LABEL_12;
LABEL_16:

      if (v3)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v4)
    goto LABEL_16;
LABEL_12:
  if (!v3)
    goto LABEL_17;
LABEL_13:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  v6 = -[BMPhotosAutonamingSuggestionsFeedback feedbackType](self, "feedbackType");
  if (v6 != objc_msgSend(v5, "feedbackType"))
    goto LABEL_6;
  v7 = -[BMPhotosAutonamingSuggestionsFeedback associationType](self, "associationType");
  if (v7 != objc_msgSend(v5, "associationType"))
    goto LABEL_6;
  -[BMPhotosAutonamingSuggestionsFeedback feedbackId](self, "feedbackId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbackId");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v8 == (void *)v9)
  {

    goto LABEL_11;
  }
  v10 = (void *)v9;
  -[BMPhotosAutonamingSuggestionsFeedback feedbackId](self, "feedbackId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbackId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
LABEL_11:
    -[BMPhotosAutonamingSuggestionsFeedback visualId](self, "visualId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == v17)
    {
      v14 = 1;
    }
    else
    {
      -[BMPhotosAutonamingSuggestionsFeedback visualId](self, "visualId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v18, "isEqual:", v19);

    }
    goto LABEL_7;
  }
LABEL_6:
  v14 = 0;
LABEL_7:

LABEL_9:
  return v14;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)feedbackType
{
  return self->_feedbackType;
}

- (int)associationType
{
  return self->_associationType;
}

- (NSString)feedbackId
{
  return self->_feedbackId;
}

- (NSString)visualId
{
  return self->_visualId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualId, 0);
  objc_storeStrong((id *)&self->_feedbackId, 0);
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

    v4 = -[BMPhotosAutonamingSuggestionsFeedback initByReadFrom:]([BMPhotosAutonamingSuggestionsFeedback alloc], "initByReadFrom:", v7);
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
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("feedbackType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("associationType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("feedbackId"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visualId"), 2, 0, 4, 13, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E640;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("feedbackType"), 1, 4, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("associationType"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("feedbackId"), 3, 13, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visualId"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
