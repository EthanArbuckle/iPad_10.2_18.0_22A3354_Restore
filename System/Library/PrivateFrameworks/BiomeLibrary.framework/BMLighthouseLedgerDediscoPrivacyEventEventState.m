@implementation BMLighthouseLedgerDediscoPrivacyEventEventState

- (BMLighthouseLedgerDediscoPrivacyEventEventState)initWithPhase:(int)a3 succeeded:(id)a4 errorMessage:(id)a5
{
  id v8;
  id v9;
  BMLighthouseLedgerDediscoPrivacyEventEventState *v10;
  objc_super v12;

  v8 = a4;
  v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)BMLighthouseLedgerDediscoPrivacyEventEventState;
  v10 = -[BMEventBase init](&v12, sel_init);
  if (v10)
  {
    v10->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v10->_phase = a3;
    if (v8)
    {
      v10->_hasSucceeded = 1;
      v10->_succeeded = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      v10->_hasSucceeded = 0;
      v10->_succeeded = 0;
    }
    objc_storeStrong((id *)&v10->_errorMessage, a5);
  }

  return v10;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMLighthouseLedgerDediscoPrivacyEventEventPhaseAsString(-[BMLighthouseLedgerDediscoPrivacyEventEventState phase](self, "phase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLighthouseLedgerDediscoPrivacyEventEventState succeeded](self, "succeeded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseLedgerDediscoPrivacyEventEventState errorMessage](self, "errorMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseLedgerDediscoPrivacyEventEventState with phase: %@, succeeded: %@, errorMessage: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseLedgerDediscoPrivacyEventEventState *v5;
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
  NSString *errorMessage;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  BMLighthouseLedgerDediscoPrivacyEventEventState *v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMLighthouseLedgerDediscoPrivacyEventEventState;
  v5 = -[BMEventBase init](&v39, sel_init);
  if (!v5)
    goto LABEL_52;
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
        errorMessage = v5->_errorMessage;
        v5->_errorMessage = (NSString *)v28;

      }
      else if ((_DWORD)v20 == 2)
      {
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v5->_hasSucceeded = 1;
        while (1)
        {
          v33 = *v6;
          v34 = *(_QWORD *)&v4[v33];
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
            break;
          v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
          *(_QWORD *)&v4[v33] = v35;
          v32 |= (unint64_t)(v36 & 0x7F) << v30;
          if ((v36 & 0x80) == 0)
            goto LABEL_46;
          v30 += 7;
          v17 = v31++ >= 9;
          if (v17)
          {
            v32 = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8])
          v32 = 0;
LABEL_48:
        v5->_succeeded = v32 != 0;
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
            goto LABEL_40;
          v21 += 7;
          v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8])
          LODWORD(v23) = 0;
LABEL_42:
        if (v23 >= 6)
          LODWORD(v23) = 0;
        v5->_phase = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_51;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_51:
    v37 = 0;
  else
LABEL_52:
    v37 = v5;

  return v37;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasSucceeded)
    PBDataWriterWriteBOOLField();
  if (self->_errorMessage)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLighthouseLedgerDediscoPrivacyEventEventState writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseLedgerDediscoPrivacyEventEventState)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  BMLighthouseLedgerDediscoPrivacyEventEventState *v14;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("succeeded"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v14 = 0;
          goto LABEL_17;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v16 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("succeeded"));
        v28 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v16, 2, v12);
        v14 = 0;
        v11 = 0;
        *a4 = v17;
        goto LABEL_16;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorMessage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v25 = *MEMORY[0x1E0CB2D50];
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("errorMessage"));
          v26 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v19);

        }
        v13 = 0;
        v14 = 0;
        goto LABEL_16;
      }
      v13 = v12;
    }
    else
    {
      v13 = 0;
    }
    self = -[BMLighthouseLedgerDediscoPrivacyEventEventState initWithPhase:succeeded:errorMessage:](self, "initWithPhase:succeeded:errorMessage:", objc_msgSend(v8, "intValue"), v11, v13);
    v14 = self;
LABEL_16:

    goto LABEL_17;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLighthouseLedgerDediscoPrivacyEventEventPhaseFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v14 = 0;
    goto LABEL_18;
  }
  v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v21 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("phase"));
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v14 = 0;
  *a4 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v10);
LABEL_17:

LABEL_18:
  return v14;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLighthouseLedgerDediscoPrivacyEventEventState phase](self, "phase"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMLighthouseLedgerDediscoPrivacyEventEventState hasSucceeded](self, "hasSucceeded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLighthouseLedgerDediscoPrivacyEventEventState succeeded](self, "succeeded"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[BMLighthouseLedgerDediscoPrivacyEventEventState errorMessage](self, "errorMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("phase");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("succeeded");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("errorMessage");
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
  char v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMLighthouseLedgerDediscoPrivacyEventEventState phase](self, "phase");
    if (v6 == objc_msgSend(v5, "phase")
      && (!-[BMLighthouseLedgerDediscoPrivacyEventEventState hasSucceeded](self, "hasSucceeded")
       && !objc_msgSend(v5, "hasSucceeded")
       || -[BMLighthouseLedgerDediscoPrivacyEventEventState hasSucceeded](self, "hasSucceeded")
       && objc_msgSend(v5, "hasSucceeded")
       && (v7 = -[BMLighthouseLedgerDediscoPrivacyEventEventState succeeded](self, "succeeded"),
           v7 == objc_msgSend(v5, "succeeded"))))
    {
      -[BMLighthouseLedgerDediscoPrivacyEventEventState errorMessage](self, "errorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {
        v8 = 1;
      }
      else
      {
        -[BMLighthouseLedgerDediscoPrivacyEventEventState errorMessage](self, "errorMessage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "errorMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "isEqual:", v13);

      }
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

- (int)phase
{
  return self->_phase;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (BOOL)hasSucceeded
{
  return self->_hasSucceeded;
}

- (void)setHasSucceeded:(BOOL)a3
{
  self->_hasSucceeded = a3;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
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

    v4 = -[BMLighthouseLedgerDediscoPrivacyEventEventState initByReadFrom:]([BMLighthouseLedgerDediscoPrivacyEventEventState alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("phase"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("succeeded"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("errorMessage"), 2, 0, 3, 13, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DFC8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("phase"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("succeeded"), 2, 12, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("errorMessage"), 3, 13, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
