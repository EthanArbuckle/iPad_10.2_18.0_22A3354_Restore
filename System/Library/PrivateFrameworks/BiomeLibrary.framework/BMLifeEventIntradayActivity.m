@implementation BMLifeEventIntradayActivity

- (BMLifeEventIntradayActivity)initWithActivity:(id)a3
{
  id v5;
  BMLifeEventIntradayActivity *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMLifeEventIntradayActivity;
  v6 = -[BMEventBase init](&v8, sel_init);
  if (v6)
  {
    v6->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v6->_activity, a3);
  }

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMLifeEventIntradayActivity activity](self, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLifeEventIntradayActivity with activity: %@"), v4);

  return (NSString *)v5;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLifeEventIntradayActivity *v5;
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
  BMLifeEventActivity *v19;
  BMLifeEventActivity *activity;
  BMLifeEventIntradayActivity *v21;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BMLifeEventIntradayActivity;
  v5 = -[BMEventBase init](&v23, sel_init);
  if (!v5)
    goto LABEL_27;
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
      if ((v12 >> 3) == 1)
      {
        v24 = 0;
        v25 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_26;
        v19 = -[BMLifeEventActivity initByReadFrom:]([BMLifeEventActivity alloc], "initByReadFrom:", v4);
        if (!v19)
          goto LABEL_26;
        activity = v5->_activity;
        v5->_activity = v19;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_26;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_26:
    v21 = 0;
  else
LABEL_27:
    v21 = v5;

  return v21;
}

- (void)writeTo:(id)a3
{
  id v4;

  if (self->_activity)
  {
    v4 = a3;
    PBDataWriterPlaceMark();
    -[BMLifeEventActivity writeTo:](self->_activity, "writeTo:", v4);
    PBDataWriterRecallMark();

  }
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLifeEventIntradayActivity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLifeEventIntradayActivity)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  void *v6;
  BMLifeEventActivity *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("activity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    self = -[BMLifeEventIntradayActivity initWithActivity:](self, "initWithActivity:", v7);
    p_isa = (id *)&self->super.super.isa;
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v15 = 0;
    v7 = -[BMLifeEventActivity initWithJSONDictionary:error:]([BMLifeEventActivity alloc], "initWithJSONDictionary:error:", v8, &v15);
    v9 = v15;
    if (!v9)
    {

      goto LABEL_4;
    }
    v10 = v9;
    if (p_isa)
      *p_isa = objc_retainAutorelease(v9);

LABEL_12:
    p_isa = 0;
    goto LABEL_13;
  }
  if (p_isa)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = *MEMORY[0x1E0D025B8];
    v16 = *MEMORY[0x1E0CB2D50];
    v7 = (BMLifeEventActivity *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("activity"));
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *p_isa = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 2, v13);

    goto LABEL_12;
  }
LABEL_14:

  return (BMLifeEventIntradayActivity *)p_isa;
}

- (id)jsonDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[BMLifeEventIntradayActivity activity](self, "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("activity");
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)

  return v5;
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
    -[BMLifeEventIntradayActivity activity](self, "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[BMLifeEventIntradayActivity activity](self, "activity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activity");
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

- (BMLifeEventActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMLifeEventIntradayActivity initByReadFrom:]([BMLifeEventIntradayActivity alloc], "initByReadFrom:", v6);
    v7[4] = 1;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)columns
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("activity_json"), 5, 1, &__block_literal_global_29724);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C318;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activity"), 1, 14, objc_opt_class());
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __38__BMLifeEventIntradayActivity_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
