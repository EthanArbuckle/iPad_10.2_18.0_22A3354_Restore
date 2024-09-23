@implementation BMSiriSELFProcessedEventLogicalTimestamp

- (BMSiriSELFProcessedEventLogicalTimestamp)initWithTimestampInNanoseconds:(id)a3 clockIdentifier:(id)a4
{
  id v6;
  id v7;
  BMSiriSELFProcessedEventLogicalTimestamp *v8;
  uint64_t v9;
  uint64_t v10;
  NSData *raw_clockIdentifier;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSiriSELFProcessedEventLogicalTimestamp;
  v8 = -[BMEventBase init](&v13, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v8->_hasTimestampInNanoseconds = 1;
      v9 = objc_msgSend(v6, "longLongValue");
    }
    else
    {
      v8->_hasTimestampInNanoseconds = 0;
      v9 = -1;
    }
    v8->_timestampInNanoseconds = v9;
    if (v7)
    {
      v14[0] = 0;
      v14[1] = 0;
      objc_msgSend(v7, "getUUIDBytes:", v14);
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v14, 16);
      raw_clockIdentifier = v8->_raw_clockIdentifier;
      v8->_raw_clockIdentifier = (NSData *)v10;
    }
    else
    {
      raw_clockIdentifier = v8->_raw_clockIdentifier;
      v8->_raw_clockIdentifier = 0;
    }

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriSELFProcessedEventLogicalTimestamp timestampInNanoseconds](self, "timestampInNanoseconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriSELFProcessedEventLogicalTimestamp clockIdentifier](self, "clockIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriSELFProcessedEventLogicalTimestamp with timestampInNanoseconds: %@, clockIdentifier: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriSELFProcessedEventLogicalTimestamp *v5;
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
  int64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  NSData *v25;
  NSData *raw_clockIdentifier;
  BMSiriSELFProcessedEventLogicalTimestamp *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriSELFProcessedEventLogicalTimestamp;
  v5 = -[BMEventBase init](&v29, sel_init);
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
      if ((v12 >> 3) == 2)
      {
        PBReaderReadData();
        v25 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (-[NSData length](v25, "length") != 16)
        {

          goto LABEL_38;
        }
        raw_clockIdentifier = v5->_raw_clockIdentifier;
        v5->_raw_clockIdentifier = v25;

      }
      else if ((v12 >> 3) == 1)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v5->_hasTimestampInNanoseconds = 1;
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
            v21 = 0;
            goto LABEL_35;
          }
        }
        v4[*v8] = 1;
LABEL_33:
        if (v4[*v8])
          v21 = 0;
LABEL_35:
        v5->_timestampInNanoseconds = v21;
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
    v27 = 0;
  else
LABEL_39:
    v27 = v5;

  return v27;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasTimestampInNanoseconds)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_raw_clockIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriSELFProcessedEventLogicalTimestamp writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriSELFProcessedEventLogicalTimestamp)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestampInNanoseconds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = *MEMORY[0x1E0D025B8];
      v29 = *MEMORY[0x1E0CB2D50];
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("timestampInNanoseconds"));
      v30[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *p_isa = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v16);

      p_isa = 0;
      v8 = 0;
      goto LABEL_8;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clockIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0D025B8];
        v25 = *MEMORY[0x1E0CB2D50];
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clockIdentifier"));
        v26 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *p_isa = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v20);

        p_isa = 0;
      }
      goto LABEL_8;
    }
    v12 = v9;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
    if (!v13)
    {
      if (p_isa)
      {
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("clockIdentifier"));
        v28 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *p_isa = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v24);

      }
      p_isa = 0;
      v9 = v12;
      goto LABEL_8;
    }
    v10 = (void *)v13;

  }
  else
  {
    v10 = 0;
  }
  self = -[BMSiriSELFProcessedEventLogicalTimestamp initWithTimestampInNanoseconds:clockIdentifier:](self, "initWithTimestampInNanoseconds:clockIdentifier:", v8, v10);

  p_isa = (id *)&self->super.super.isa;
LABEL_8:

LABEL_9:
  return (BMSiriSELFProcessedEventLogicalTimestamp *)p_isa;
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
  if (-[BMSiriSELFProcessedEventLogicalTimestamp hasTimestampInNanoseconds](self, "hasTimestampInNanoseconds"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriSELFProcessedEventLogicalTimestamp timestampInNanoseconds](self, "timestampInNanoseconds"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMSiriSELFProcessedEventLogicalTimestamp clockIdentifier](self, "clockIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = CFSTR("timestampInNanoseconds");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("clockIdentifier");
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

    if (v3)
      goto LABEL_10;
LABEL_12:

    goto LABEL_10;
  }
  if (!v3)
    goto LABEL_12;
LABEL_10:

  return v8;
}

- (NSUUID)clockIdentifier
{
  NSData *raw_clockIdentifier;
  void *v3;

  raw_clockIdentifier = self->_raw_clockIdentifier;
  if (raw_clockIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_clockIdentifier, 3);
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
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!-[BMSiriSELFProcessedEventLogicalTimestamp hasTimestampInNanoseconds](self, "hasTimestampInNanoseconds")
      && !objc_msgSend(v5, "hasTimestampInNanoseconds")
      || -[BMSiriSELFProcessedEventLogicalTimestamp hasTimestampInNanoseconds](self, "hasTimestampInNanoseconds")
      && objc_msgSend(v5, "hasTimestampInNanoseconds")
      && (v6 = -[BMSiriSELFProcessedEventLogicalTimestamp timestampInNanoseconds](self, "timestampInNanoseconds"),
          v6 == objc_msgSend(v5, "timestampInNanoseconds")))
    {
      -[BMSiriSELFProcessedEventLogicalTimestamp clockIdentifier](self, "clockIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clockIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        v11 = 1;
      }
      else
      {
        -[BMSiriSELFProcessedEventLogicalTimestamp clockIdentifier](self, "clockIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "clockIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int64_t)timestampInNanoseconds
{
  return self->_timestampInNanoseconds;
}

- (BOOL)hasTimestampInNanoseconds
{
  return self->_hasTimestampInNanoseconds;
}

- (void)setHasTimestampInNanoseconds:(BOOL)a3
{
  self->_hasTimestampInNanoseconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raw_clockIdentifier, 0);
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

    v4 = -[BMSiriSELFProcessedEventLogicalTimestamp initByReadFrom:]([BMSiriSELFProcessedEventLogicalTimestamp alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestampInNanoseconds"), 0, 0, 1, 3, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clockIdentifier"), 6, 0, 2, 14, 3);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1BBF8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestampInNanoseconds"), 1, 3, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clockIdentifier"), 2, 14, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
