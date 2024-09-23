@implementation BMSiriService

- (BMSiriService)initWithDismissalReason:(int)a3 unintended:(id)a4 requestSource:(int)a5
{
  id v8;
  BMSiriService *v9;
  objc_super v11;

  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMSiriService;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v9->_dismissalReason = a3;
    if (v8)
    {
      v9->_hasUnintended = 1;
      v9->_unintended = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      v9->_hasUnintended = 0;
      v9->_unintended = 0;
    }
    v9->_requestSource = a5;
  }

  return v9;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMSiriServiceDismissalReasonAsString(-[BMSiriService dismissalReason](self, "dismissalReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriService unintended](self, "unintended"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriServiceRequestSourceAsString(-[BMSiriService requestSource](self, "requestSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriService with dismissalReason: %@, unintended: %@, requestSource: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriService *v5;
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
  unint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  BMSiriService *v38;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMSiriService;
  v5 = -[BMEventBase init](&v40, sel_init);
  if (!v5)
    goto LABEL_65;
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
      v19 = v12 >> 3;
      if ((v12 >> 3) == 1)
      {
        v26 = 0;
        v27 = 0;
        v22 = 0;
        while (1)
        {
          v28 = *v6;
          v29 = *(_QWORD *)&v4[v28];
          if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v7])
            break;
          v30 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
          *(_QWORD *)&v4[v28] = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_52;
          v26 += 7;
          v16 = v27++ >= 9;
          if (v16)
          {
            LODWORD(v22) = 0;
            goto LABEL_54;
          }
        }
        v4[*v8] = 1;
LABEL_52:
        if (v4[*v8])
          LODWORD(v22) = 0;
LABEL_54:
        if (v22 >= 0x36)
          LODWORD(v22) = 0;
        v37 = 24;
      }
      else
      {
        if ((_DWORD)v19 == 2)
        {
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasUnintended = 1;
          while (1)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v7])
              break;
            v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 1;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if ((v36 & 0x80) == 0)
              goto LABEL_59;
            v31 += 7;
            v16 = v32++ >= 9;
            if (v16)
            {
              v33 = 0;
              goto LABEL_61;
            }
          }
          v4[*v8] = 1;
LABEL_59:
          if (v4[*v8])
            v33 = 0;
LABEL_61:
          v5->_unintended = v33 != 0;
          continue;
        }
        if ((_DWORD)v19 != 3)
        {
          if (!PBReaderSkipValueWithTag())
            goto LABEL_64;
          continue;
        }
        v20 = 0;
        v21 = 0;
        v22 = 0;
        while (1)
        {
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 == -1 || v24 >= *(_QWORD *)&v4[*v7])
            break;
          v25 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
          *(_QWORD *)&v4[v23] = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_46;
          v20 += 7;
          v16 = v21++ >= 9;
          if (v16)
          {
            LODWORD(v22) = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8])
          LODWORD(v22) = 0;
LABEL_48:
        if (v22 >= 0x2D)
          LODWORD(v22) = 0;
        v37 = 28;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + v37) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_64:
    v38 = 0;
  else
LABEL_65:
    v38 = v5;

  return v38;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasUnintended)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriService writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriService)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  BMSiriService *v17;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dismissalReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("unintended"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v17 = 0;
          goto LABEL_26;
        }
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v15 = *MEMORY[0x1E0D025B8];
        v28 = *MEMORY[0x1E0CB2D50];
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("unintended"));
        v29 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v15, 2, v12);
        v11 = 0;
        v17 = 0;
        *a4 = v16;
        goto LABEL_25;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v23 = *MEMORY[0x1E0D025B8];
            v26 = *MEMORY[0x1E0CB2D50];
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("requestSource"));
            v27 = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v23, 2, v22);

          }
          v13 = 0;
          v17 = 0;
          goto LABEL_25;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriServiceRequestSourceFromString(v12));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v14;
    }
    else
    {
      v13 = 0;
    }
    self = -[BMSiriService initWithDismissalReason:unintended:requestSource:](self, "initWithDismissalReason:unintended:requestSource:", objc_msgSend(v8, "intValue"), v11, objc_msgSend(v13, "intValue"));
    v17 = self;
LABEL_25:

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriServiceDismissalReasonFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v17 = 0;
    goto LABEL_27;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0D025B8];
  v30 = *MEMORY[0x1E0CB2D50];
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("dismissalReason"));
  v31[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v17 = 0;
  *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v10);
LABEL_26:

LABEL_27:
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
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriService dismissalReason](self, "dismissalReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriService hasUnintended](self, "hasUnintended"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriService unintended](self, "unintended"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriService requestSource](self, "requestSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("dismissalReason");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("unintended");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("requestSource");
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
  int v6;
  int v7;
  BOOL v8;
  int v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMSiriService dismissalReason](self, "dismissalReason");
    if (v6 == objc_msgSend(v5, "dismissalReason")
      && (!-[BMSiriService hasUnintended](self, "hasUnintended") && !objc_msgSend(v5, "hasUnintended")
       || -[BMSiriService hasUnintended](self, "hasUnintended")
       && objc_msgSend(v5, "hasUnintended")
       && (v7 = -[BMSiriService unintended](self, "unintended"), v7 == objc_msgSend(v5, "unintended"))))
    {
      v10 = -[BMSiriService requestSource](self, "requestSource");
      v8 = v10 == objc_msgSend(v5, "requestSource");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)dismissalReason
{
  return self->_dismissalReason;
}

- (BOOL)unintended
{
  return self->_unintended;
}

- (BOOL)hasUnintended
{
  return self->_hasUnintended;
}

- (void)setHasUnintended:(BOOL)a3
{
  self->_hasUnintended = a3;
}

- (int)requestSource
{
  return self->_requestSource;
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

    v4 = -[BMSiriService initByReadFrom:]([BMSiriService alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dismissalReason"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("unintended"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requestSource"), 0, 0, 3, 4, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FB70;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dismissalReason"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("unintended"), 2, 12, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestSource"), 3, 4, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
