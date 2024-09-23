@implementation BMSafariBrowsingAssistantVisualComponentPresentationEnded

- (BMSafariBrowsingAssistantVisualComponentPresentationEnded)initWithHideReason:(int)a3
{
  BMSafariBrowsingAssistantVisualComponentPresentationEnded *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMSafariBrowsingAssistantVisualComponentPresentationEnded;
  v4 = -[BMEventBase init](&v6, sel_init);
  if (v4)
  {
    v4->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v4->_hideReason = a3;
  }
  return v4;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMSafariBrowsingAssistantHideReasonAsString(-[BMSafariBrowsingAssistantVisualComponentPresentationEnded hideReason](self, "hideReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantVisualComponentPresentationEnded with hideReason: %@"), v4);

  return (NSString *)v5;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantVisualComponentPresentationEnded *v5;
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
  BMSafariBrowsingAssistantVisualComponentPresentationEnded *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMSafariBrowsingAssistantVisualComponentPresentationEnded;
  v5 = -[BMEventBase init](&v27, sel_init);
  if (!v5)
    goto LABEL_38;
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
            goto LABEL_30;
          v19 += 7;
          v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_32;
          }
        }
        v4[*v8] = 1;
LABEL_30:
        if (v4[*v8])
          LODWORD(v21) = 0;
LABEL_32:
        if (v21 >= 4)
          LODWORD(v21) = 0;
        v5->_hideReason = v21;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_37;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_37:
    v25 = 0;
  else
LABEL_38:
    v25 = v5;

  return v25;
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantVisualComponentPresentationEnded writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationEnded)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  id *v7;
  BMSafariBrowsingAssistantVisualComponentPresentationEnded *v8;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("hideReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_9:
    self = -[BMSafariBrowsingAssistantVisualComponentPresentationEnded initWithHideReason:](self, "initWithHideReason:", objc_msgSend(a4, "intValue"));
    v8 = self;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
LABEL_8:
    a4 = v7;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantHideReasonFromString(v6));
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a4)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0D025B8];
    v14 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("hideReason"));
    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 2, v13);

    a4 = 0;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)jsonDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentPresentationEnded hideReason](self, "hideReason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("hideReason");
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
  int v6;
  int v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMSafariBrowsingAssistantVisualComponentPresentationEnded hideReason](self, "hideReason");
    v7 = objc_msgSend(v5, "hideReason");

    v8 = v6 == v7;
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

- (int)hideReason
{
  return self->_hideReason;
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

    v4 = -[BMSafariBrowsingAssistantVisualComponentPresentationEnded initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentPresentationEnded alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hideReason"), 0, 0, 1, 4, 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D2A8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hideReason"), 1, 4, 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
