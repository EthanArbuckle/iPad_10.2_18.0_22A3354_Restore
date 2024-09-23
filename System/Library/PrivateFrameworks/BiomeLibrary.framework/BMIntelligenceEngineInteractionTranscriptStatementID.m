@implementation BMIntelligenceEngineInteractionTranscriptStatementID

- (BMIntelligenceEngineInteractionTranscriptStatementID)initWithSessionId:(id)a3 statementIndex:(id)a4
{
  id v6;
  id v7;
  BMIntelligenceEngineInteractionTranscriptStatementID *v8;
  uint64_t v9;
  NSData *raw_sessionId;
  unsigned int v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMIntelligenceEngineInteractionTranscriptStatementID;
  v8 = -[BMEventBase init](&v13, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v14[0] = 0;
      v14[1] = 0;
      objc_msgSend(v6, "getUUIDBytes:", v14);
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v14, 16);
      raw_sessionId = v8->_raw_sessionId;
      v8->_raw_sessionId = (NSData *)v9;
    }
    else
    {
      raw_sessionId = v8->_raw_sessionId;
      v8->_raw_sessionId = 0;
    }

    if (v7)
    {
      v8->_hasStatementIndex = 1;
      v11 = objc_msgSend(v7, "unsignedIntValue");
    }
    else
    {
      v11 = 0;
      v8->_hasStatementIndex = 0;
    }
    v8->_statementIndex = v11;
  }

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMIntelligenceEngineInteractionTranscriptStatementID sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMIntelligenceEngineInteractionTranscriptStatementID statementIndex](self, "statementIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligenceEngineInteractionTranscriptStatementID with sessionId: %@, statementIndex: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligenceEngineInteractionTranscriptStatementID *v5;
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
  NSData *v20;
  NSData *raw_sessionId;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  BMIntelligenceEngineInteractionTranscriptStatementID *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMIntelligenceEngineInteractionTranscriptStatementID;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
    goto LABEL_39;
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
      if ((v12 >> 3) == 2)
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v5->_hasStatementIndex = 1;
        while (1)
        {
          v25 = *v6;
          v26 = *(_QWORD *)&v4[v25];
          v27 = v26 + 1;
          if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            break;
          v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
          *(_QWORD *)&v4[v25] = v27;
          v24 |= (unint64_t)(v28 & 0x7F) << v22;
          if ((v28 & 0x80) == 0)
            goto LABEL_33;
          v22 += 7;
          v17 = v23++ >= 9;
          if (v17)
          {
            LODWORD(v24) = 0;
            goto LABEL_35;
          }
        }
        v4[*v8] = 1;
LABEL_33:
        if (v4[*v8])
          LODWORD(v24) = 0;
LABEL_35:
        v5->_statementIndex = v24;
      }
      else if ((v12 >> 3) == 1)
      {
        PBReaderReadData();
        v20 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (-[NSData length](v20, "length") != 16)
        {

          goto LABEL_38;
        }
        raw_sessionId = v5->_raw_sessionId;
        v5->_raw_sessionId = v20;

      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_38;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_38:
    v29 = 0;
  else
LABEL_39:
    v29 = v5;

  return v29;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_raw_sessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_hasStatementIndex)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligenceEngineInteractionTranscriptStatementID writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligenceEngineInteractionTranscriptStatementID)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMIntelligenceEngineInteractionTranscriptStatementID *v11;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("statementIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v19 = *MEMORY[0x1E0D025B8];
          v25 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("statementIndex"));
          v26 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v21);

        }
        v11 = 0;
        v10 = 0;
        goto LABEL_8;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    self = -[BMIntelligenceEngineInteractionTranscriptStatementID initWithSessionId:statementIndex:](self, "initWithSessionId:statementIndex:", v8, v10);
    v11 = self;
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v11 = 0;
      goto LABEL_11;
    }
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = *MEMORY[0x1E0D025B8];
    v27 = *MEMORY[0x1E0CB2D50];
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sessionId"));
    v28 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v10);
    v11 = 0;
    *a4 = v17;
    goto LABEL_9;
  }
  v8 = v7;
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  if (v13)
  {
    v14 = (void *)v13;

    v8 = v14;
    goto LABEL_4;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_10;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v23 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("sessionId"));
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v24);

  v11 = 0;
LABEL_9:

LABEL_10:
LABEL_11:

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
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[BMIntelligenceEngineInteractionTranscriptStatementID sessionId](self, "sessionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMIntelligenceEngineInteractionTranscriptStatementID hasStatementIndex](self, "hasStatementIndex"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMIntelligenceEngineInteractionTranscriptStatementID statementIndex](self, "statementIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v10[0] = CFSTR("sessionId");
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("statementIndex");
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
      goto LABEL_10;
LABEL_12:

    goto LABEL_10;
  }
  if (!v4)
    goto LABEL_12;
LABEL_10:

  return v8;
}

- (NSUUID)sessionId
{
  NSData *raw_sessionId;
  void *v3;

  raw_sessionId = self->_raw_sessionId;
  if (raw_sessionId)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_sessionId, 3);
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
  unsigned int v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligenceEngineInteractionTranscriptStatementID sessionId](self, "sessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligenceEngineInteractionTranscriptStatementID sessionId](self, "sessionId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_12;
    }
    if (!-[BMIntelligenceEngineInteractionTranscriptStatementID hasStatementIndex](self, "hasStatementIndex")
      && !objc_msgSend(v5, "hasStatementIndex"))
    {
      v12 = 1;
      goto LABEL_13;
    }
    if (-[BMIntelligenceEngineInteractionTranscriptStatementID hasStatementIndex](self, "hasStatementIndex")
      && objc_msgSend(v5, "hasStatementIndex"))
    {
      v13 = -[BMIntelligenceEngineInteractionTranscriptStatementID statementIndex](self, "statementIndex");
      v12 = v13 == objc_msgSend(v5, "statementIndex");
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)statementIndex
{
  return self->_statementIndex;
}

- (BOOL)hasStatementIndex
{
  return self->_hasStatementIndex;
}

- (void)setHasStatementIndex:(BOOL)a3
{
  self->_hasStatementIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raw_sessionId, 0);
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

    v4 = -[BMIntelligenceEngineInteractionTranscriptStatementID initByReadFrom:]([BMIntelligenceEngineInteractionTranscriptStatementID alloc], "initByReadFrom:", v7);
    v4[7] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionId"), 6, 0, 1, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("statementIndex"), 0, 0, 2, 4, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C090;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionId"), 1, 14, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("statementIndex"), 2, 4, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
