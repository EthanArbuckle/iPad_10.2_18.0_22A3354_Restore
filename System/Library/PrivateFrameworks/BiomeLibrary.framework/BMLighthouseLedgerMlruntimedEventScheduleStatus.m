@implementation BMLighthouseLedgerMlruntimedEventScheduleStatus

- (BMLighthouseLedgerMlruntimedEventScheduleStatus)initWithScheduled:(id)a3
{
  id v4;
  BMLighthouseLedgerMlruntimedEventScheduleStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BMLighthouseLedgerMlruntimedEventScheduleStatus;
  v5 = -[BMEventBase init](&v7, sel_init);
  if (v5)
  {
    v5->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v4)
    {
      v5->_hasScheduled = 1;
      v5->_scheduled = objc_msgSend(v4, "BOOLValue");
    }
    else
    {
      v5->_hasScheduled = 0;
      v5->_scheduled = 0;
    }
  }

  return v5;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLighthouseLedgerMlruntimedEventScheduleStatus scheduled](self, "scheduled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseLedgerMlruntimedEventScheduleStatus with scheduled: %@"), v4);

  return (NSString *)v5;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseLedgerMlruntimedEventScheduleStatus *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BMLighthouseLedgerMlruntimedEventScheduleStatus *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMLighthouseLedgerMlruntimedEventScheduleStatus;
  v5 = -[BMEventBase init](&v29, sel_init);
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
      if ((v12 >> 3) == 1)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v5->_hasScheduled = 1;
        while (1)
        {
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          v25 = v24 + 1;
          if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
            break;
          v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
          *(_QWORD *)&v4[v23] = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0)
            goto LABEL_30;
          v20 += 7;
          v17 = v21++ >= 9;
          if (v17)
          {
            v22 = 0;
            goto LABEL_32;
          }
        }
        v4[*v8] = 1;
LABEL_30:
        if (v4[*v8])
          v22 = 0;
LABEL_32:
        v5->_scheduled = v22 != 0;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_35;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_35:
    v27 = 0;
  else
LABEL_36:
    v27 = v5;

  return v27;
}

- (void)writeTo:(id)a3
{
  if (self->_hasScheduled)
    PBDataWriterWriteBOOLField();
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLighthouseLedgerMlruntimedEventScheduleStatus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseLedgerMlruntimedEventScheduleStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  BMLighthouseLedgerMlruntimedEventScheduleStatus *v7;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("scheduled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_4:
    self = -[BMLighthouseLedgerMlruntimedEventScheduleStatus initWithScheduled:](self, "initWithScheduled:", a4);
    v7 = self;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a4 = v6;
    goto LABEL_4;
  }
  if (a4)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0D025B8];
    v13 = *MEMORY[0x1E0CB2D50];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("scheduled"));
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 2, v12);

    v7 = 0;
    a4 = 0;
  }
  else
  {
    v7 = 0;
  }
LABEL_5:

  return v7;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[BMLighthouseLedgerMlruntimedEventScheduleStatus hasScheduled](self, "hasScheduled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLighthouseLedgerMlruntimedEventScheduleStatus scheduled](self, "scheduled"));
    v3 = objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("scheduled");
    if (v3)
    {
      v4 = (void *)v3;
      v5 = 0;
      v6 = (void *)v3;
      goto LABEL_6;
    }
  }
  else
  {
    v9 = CFSTR("scheduled");
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 1;
LABEL_6:
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  int v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMLighthouseLedgerMlruntimedEventScheduleStatus hasScheduled](self, "hasScheduled")
      || objc_msgSend(v5, "hasScheduled"))
    {
      if (-[BMLighthouseLedgerMlruntimedEventScheduleStatus hasScheduled](self, "hasScheduled")
        && objc_msgSend(v5, "hasScheduled"))
      {
        v6 = -[BMLighthouseLedgerMlruntimedEventScheduleStatus scheduled](self, "scheduled");
        v7 = v6 ^ objc_msgSend(v5, "scheduled") ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 1;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

- (BOOL)hasScheduled
{
  return self->_hasScheduled;
}

- (void)setHasScheduled:(BOOL)a3
{
  self->_hasScheduled = a3;
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

    v4 = -[BMLighthouseLedgerMlruntimedEventScheduleStatus initByReadFrom:]([BMLighthouseLedgerMlruntimedEventScheduleStatus alloc], "initByReadFrom:", v7);
    v4[5] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("scheduled"), 0, 0, 1, 12, 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E028;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("scheduled"), 1, 12, 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
