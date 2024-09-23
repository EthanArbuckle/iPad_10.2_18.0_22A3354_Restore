@implementation BMActivitySchedulerDependencyResult

- (BMActivitySchedulerDependencyResult)initWithResultIdentifier:(id)a3 activityIdentifier:(id)a4 resultCount:(id)a5 type:(int)a6
{
  id v11;
  id v12;
  id v13;
  BMActivitySchedulerDependencyResult *v14;
  unsigned int v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BMActivitySchedulerDependencyResult;
  v14 = -[BMEventBase init](&v17, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v14->_resultIdentifier, a3);
    objc_storeStrong((id *)&v14->_activityIdentifier, a4);
    if (v13)
    {
      v14->_hasResultCount = 1;
      v15 = objc_msgSend(v13, "unsignedIntValue");
    }
    else
    {
      v15 = 0;
      v14->_hasResultCount = 0;
    }
    v14->_resultCount = v15;
    v14->_type = a6;
  }

  return v14;
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
  -[BMActivitySchedulerDependencyResult resultIdentifier](self, "resultIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMActivitySchedulerDependencyResult activityIdentifier](self, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMActivitySchedulerDependencyResult resultCount](self, "resultCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMActivitySchedulerDependencyResultEventTypeAsString(-[BMActivitySchedulerDependencyResult type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMActivitySchedulerDependencyResult with resultIdentifier: %@, activityIdentifier: %@, resultCount: %@, type: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMActivitySchedulerDependencyResult *v5;
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
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  BMActivitySchedulerDependencyResult *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMActivitySchedulerDependencyResult;
  v5 = -[BMEventBase init](&v36, sel_init);
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
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
LABEL_24:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasResultCount = 1;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            if (v26 == -1 || v26 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                v16 = v23++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_42:
          v5->_resultCount = v24;
          continue;
        case 4u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_51;
          continue;
      }
      while (1)
      {
        v31 = *v6;
        v32 = *(_QWORD *)&v4[v31];
        if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
          break;
        v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
        *(_QWORD *)&v4[v31] = v32 + 1;
        v30 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0)
          goto LABEL_44;
        v28 += 7;
        v16 = v29++ >= 9;
        if (v16)
        {
          LODWORD(v30) = 0;
          goto LABEL_46;
        }
      }
      v4[*v8] = 1;
LABEL_44:
      if (v4[*v8])
        LODWORD(v30) = 0;
LABEL_46:
      if (v30 >= 3)
        LODWORD(v30) = 0;
      v5->_type = v30;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_51:
    v34 = 0;
  else
LABEL_52:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_resultIdentifier)
    PBDataWriterWriteStringField();
  if (self->_activityIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasResultCount)
    PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMActivitySchedulerDependencyResult writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMActivitySchedulerDependencyResult)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMActivitySchedulerDependencyResult *v11;
  BMActivitySchedulerDependencyResult *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  BMActivitySchedulerDependencyResult *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id *v29;
  id *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("resultIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v33 = 0;
          v11 = 0;
          goto LABEL_33;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = a4;
        v20 = *MEMORY[0x1E0D025B8];
        v38 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("activityIdentifier"));
        v39 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v11 = 0;
        *v29 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v10);
        goto LABEL_32;
      }
      v33 = v9;
    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("resultCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v13 = 0;
          v11 = 0;
          goto LABEL_32;
        }
        v30 = a4;
        v12 = self;
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v36 = *MEMORY[0x1E0CB2D50];
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("resultCount"));
        v37 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v14);
        v13 = 0;
        v11 = 0;
        *v30 = v23;
        goto LABEL_31;
      }
      v11 = (BMActivitySchedulerDependencyResult *)a4;
      v12 = self;
      v13 = v10;
    }
    else
    {
      v11 = (BMActivitySchedulerDependencyResult *)a4;
      v12 = self;
      v13 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v11)
          {
            v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v28 = *MEMORY[0x1E0D025B8];
            v34 = *MEMORY[0x1E0CB2D50];
            v25 = v11;
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
            v35 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v25->super.super.isa = (Class)(id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v28, 2, v27);

            v15 = 0;
            v11 = 0;
          }
          else
          {
            v15 = 0;
          }
          goto LABEL_31;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMActivitySchedulerDependencyResultEventTypeFromString(v14));
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v16;
    }
    else
    {
      v15 = 0;
    }
    v11 = -[BMActivitySchedulerDependencyResult initWithResultIdentifier:activityIdentifier:resultCount:type:](v12, "initWithResultIdentifier:activityIdentifier:resultCount:type:", v8, v33, v13, objc_msgSend(v15, "intValue"));
    v12 = v11;
LABEL_31:

    v8 = v32;
    self = v12;
LABEL_32:

    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v8 = 0;
    v11 = 0;
    goto LABEL_34;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = *MEMORY[0x1E0D025B8];
  v40 = *MEMORY[0x1E0CB2D50];
  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("resultIdentifier"));
  v41[0] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v11 = 0;
  *a4 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v9);
LABEL_33:

LABEL_34:
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
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  -[BMActivitySchedulerDependencyResult resultIdentifier](self, "resultIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMActivitySchedulerDependencyResult activityIdentifier](self, "activityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMActivitySchedulerDependencyResult hasResultCount](self, "hasResultCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMActivitySchedulerDependencyResult resultCount](self, "resultCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMActivitySchedulerDependencyResult type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("resultIdentifier");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("activityIdentifier");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("resultCount");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("type");
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
      goto LABEL_14;
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4)
        goto LABEL_15;
LABEL_19:

      if (v3)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!v4)
    goto LABEL_19;
LABEL_15:
  if (!v3)
    goto LABEL_20;
LABEL_16:

  return v11;
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  unsigned int v19;
  int v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMActivitySchedulerDependencyResult resultIdentifier](self, "resultIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resultIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMActivitySchedulerDependencyResult resultIdentifier](self, "resultIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resultIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMActivitySchedulerDependencyResult activityIdentifier](self, "activityIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMActivitySchedulerDependencyResult activityIdentifier](self, "activityIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    if (!-[BMActivitySchedulerDependencyResult hasResultCount](self, "hasResultCount")
      && !objc_msgSend(v5, "hasResultCount")
      || -[BMActivitySchedulerDependencyResult hasResultCount](self, "hasResultCount")
      && objc_msgSend(v5, "hasResultCount")
      && (v19 = -[BMActivitySchedulerDependencyResult resultCount](self, "resultCount"),
          v19 == objc_msgSend(v5, "resultCount")))
    {
      v20 = -[BMActivitySchedulerDependencyResult type](self, "type");
      v12 = v20 == objc_msgSend(v5, "type");
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (unsigned)resultCount
{
  return self->_resultCount;
}

- (BOOL)hasResultCount
{
  return self->_hasResultCount;
}

- (void)setHasResultCount:(BOOL)a3
{
  self->_hasResultCount = a3;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
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

    v4 = -[BMActivitySchedulerDependencyResult initByReadFrom:]([BMActivitySchedulerDependencyResult alloc], "initByReadFrom:", v7);
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
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("resultIdentifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityIdentifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("resultCount"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 4, 4, 0);
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
  return &unk_1E5F1C2E8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resultIdentifier"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityIdentifier"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("resultCount"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
