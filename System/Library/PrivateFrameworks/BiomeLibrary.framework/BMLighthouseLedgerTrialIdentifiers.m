@implementation BMLighthouseLedgerTrialIdentifiers

- (BMLighthouseLedgerTrialIdentifiers)initWithExperimentIdentifiers:(id)a3 bmltIdentifiers:(id)a4
{
  id v7;
  id v8;
  BMLighthouseLedgerTrialIdentifiers *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMLighthouseLedgerTrialIdentifiers;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_experimentIdentifiers, a3);
    objc_storeStrong((id *)&v9->_bmltIdentifiers, a4);
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
  -[BMLighthouseLedgerTrialIdentifiers experimentIdentifiers](self, "experimentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerTrialIdentifiers bmltIdentifiers](self, "bmltIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseLedgerTrialIdentifiers with experimentIdentifiers: %@, bmltIdentifiers: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseLedgerTrialIdentifiers *v5;
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
  objc_class *v19;
  uint64_t v20;
  void *v21;
  BMLighthouseLedgerTrialIdentifiers *v22;
  objc_super v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMLighthouseLedgerTrialIdentifiers;
  v5 = -[BMEventBase init](&v24, sel_init);
  if (!v5)
    goto LABEL_32;
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
      if ((v12 >> 3) == 2)
      {
        v25 = 0;
        v26 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_31;
        v19 = -[BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers initByReadFrom:]([BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers alloc], "initByReadFrom:", v4);
        if (!v19)
          goto LABEL_31;
        v20 = 32;
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
          if (!PBReaderSkipValueWithTag())
            goto LABEL_31;
          continue;
        }
        v25 = 0;
        v26 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_31;
        v19 = -[BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers initByReadFrom:]([BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers alloc], "initByReadFrom:", v4);
        if (!v19)
          goto LABEL_31;
        v20 = 24;
      }
      v21 = *(Class *)((char *)&v5->super.super.isa + v20);
      *(Class *)((char *)&v5->super.super.isa + v20) = v19;

      PBReaderRecallMark();
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_31:
    v22 = 0;
  else
LABEL_32:
    v22 = v5;

  return v22;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_experimentIdentifiers)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers writeTo:](self->_experimentIdentifiers, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_bmltIdentifiers)
  {
    PBDataWriterPlaceMark();
    -[BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers writeTo:](self->_bmltIdentifiers, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLighthouseLedgerTrialIdentifiers writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseLedgerTrialIdentifiers)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers *v8;
  id v9;
  BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers *v10;
  BMLighthouseLedgerTrialIdentifiers *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("experimentIdentifiers"));
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
    v25 = 0;
    v8 = -[BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers initWithJSONDictionary:error:]([BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers alloc], "initWithJSONDictionary:error:", v9, &v25);
    v12 = v25;
    if (v12)
    {
      v13 = v12;
      if (a4)
        *a4 = objc_retainAutorelease(v12);

      goto LABEL_26;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bmltIdentifiers"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
LABEL_7:
      self = -[BMLighthouseLedgerTrialIdentifiers initWithExperimentIdentifiers:bmltIdentifiers:](self, "initWithExperimentIdentifiers:bmltIdentifiers:", v8, v10);
      v11 = self;
LABEL_23:

      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v9;
      v24 = 0;
      v10 = -[BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers initWithJSONDictionary:error:]([BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers alloc], "initWithJSONDictionary:error:", v14, &v24);
      v15 = v24;
      if (!v15)
      {

        goto LABEL_7;
      }
      v16 = v15;
      if (a4)
        *a4 = objc_retainAutorelease(v15);

LABEL_22:
      v11 = 0;
      goto LABEL_23;
    }
    if (a4)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0D025B8];
      v26 = *MEMORY[0x1E0CB2D50];
      v10 = (BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("bmltIdentifiers"));
      v27 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v20, 2, v21);

      goto LABEL_22;
    }
LABEL_26:
    v11 = 0;
    goto LABEL_24;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_25;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = *MEMORY[0x1E0D025B8];
  v28 = *MEMORY[0x1E0CB2D50];
  v8 = (BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("experimentIdentifiers"));
  v29[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v9);
  v11 = 0;
  *a4 = v19;
LABEL_24:

LABEL_25:
  return v11;
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
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[BMLighthouseLedgerTrialIdentifiers experimentIdentifiers](self, "experimentIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLighthouseLedgerTrialIdentifiers bmltIdentifiers](self, "bmltIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = CFSTR("experimentIdentifiers");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = CFSTR("bmltIdentifiers");
  v12[0] = v7;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    if (v4)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_9;
LABEL_7:

  return v9;
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
    -[BMLighthouseLedgerTrialIdentifiers experimentIdentifiers](self, "experimentIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentIdentifiers");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLighthouseLedgerTrialIdentifiers experimentIdentifiers](self, "experimentIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "experimentIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMLighthouseLedgerTrialIdentifiers bmltIdentifiers](self, "bmltIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bmltIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMLighthouseLedgerTrialIdentifiers bmltIdentifiers](self, "bmltIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bmltIdentifiers");
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

- (BMLighthouseLedgerTrialIdentifiersExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (BMLighthouseLedgerTrialIdentifiersBMLTIdentifiers)bmltIdentifiers
{
  return self->_bmltIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmltIdentifiers, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
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

    v4 = -[BMLighthouseLedgerTrialIdentifiers initByReadFrom:]([BMLighthouseLedgerTrialIdentifiers alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("experimentIdentifiers_json"), 5, 1, &__block_literal_global_29150);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("bmltIdentifiers_json"), 5, 1, &__block_literal_global_138);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C2B8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("experimentIdentifiers"), 1, 14, objc_opt_class());
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bmltIdentifiers"), 2, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __45__BMLighthouseLedgerTrialIdentifiers_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bmltIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __45__BMLighthouseLedgerTrialIdentifiers_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "experimentIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
