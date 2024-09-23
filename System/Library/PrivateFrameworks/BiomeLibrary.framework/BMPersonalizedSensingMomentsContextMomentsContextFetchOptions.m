@implementation BMPersonalizedSensingMomentsContextMomentsContextFetchOptions

- (BMPersonalizedSensingMomentsContextMomentsContextFetchOptions)initWithContextFormat:(id)a3 contextRetrieval:(id)a4 contextCount:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextFetchOptions;
  v11 = -[BMEventBase init](&v16, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v8)
    {
      v11->_hasContextFormat = 1;
      v12 = objc_msgSend(v8, "unsignedIntValue");
    }
    else
    {
      v12 = 0;
      v11->_hasContextFormat = 0;
    }
    v11->_contextFormat = v12;
    if (v9)
    {
      v11->_hasContextRetrieval = 1;
      v13 = objc_msgSend(v9, "unsignedIntValue");
    }
    else
    {
      v13 = 0;
      v11->_hasContextRetrieval = 0;
    }
    v11->_contextRetrieval = v13;
    if (v10)
    {
      v11->_hasContextCount = 1;
      v14 = objc_msgSend(v10, "unsignedIntValue");
    }
    else
    {
      v14 = 0;
      v11->_hasContextCount = 0;
    }
    v11->_contextCount = v14;
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextFormat](self, "contextFormat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextRetrieval](self, "contextRetrieval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextCount](self, "contextCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPersonalizedSensingMomentsContextMomentsContextFetchOptions with contextFormat: %@, contextRetrieval: %@, contextCount: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *v5;
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
  int v18;
  unint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  BOOL v28;
  int *v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextFetchOptions;
  v5 = -[BMEventBase init](&v44, sel_init);
  if (!v5)
    goto LABEL_59;
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
        if (v11++ >= 9)
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
        v30 = 0;
        v31 = 0;
        v23 = 0;
        v5->_hasContextCount = 1;
        while (1)
        {
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          v34 = v33 + 1;
          if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
            break;
          v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
          *(_QWORD *)&v4[v32] = v34;
          v23 |= (unint64_t)(v35 & 0x7F) << v30;
          if ((v35 & 0x80) == 0)
          {
            v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextCount;
            goto LABEL_49;
          }
          v30 += 7;
          v28 = v31++ > 8;
          if (v28)
          {
            LODWORD(v23) = 0;
            v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextCount;
            goto LABEL_51;
          }
        }
        v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextCount;
LABEL_48:
        v4[*v8] = 1;
      }
      else if ((_DWORD)v20 == 2)
      {
        v36 = 0;
        v37 = 0;
        v23 = 0;
        v5->_hasContextRetrieval = 1;
        while (1)
        {
          v38 = *v6;
          v39 = *(_QWORD *)&v4[v38];
          v40 = v39 + 1;
          if (v39 == -1 || v40 > *(_QWORD *)&v4[*v7])
          {
            v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextRetrieval;
            goto LABEL_48;
          }
          v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v39);
          *(_QWORD *)&v4[v38] = v40;
          v23 |= (unint64_t)(v41 & 0x7F) << v36;
          if ((v41 & 0x80) == 0)
            break;
          v36 += 7;
          v28 = v37++ > 8;
          if (v28)
          {
            LODWORD(v23) = 0;
            v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextRetrieval;
            goto LABEL_51;
          }
        }
        v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextRetrieval;
      }
      else
      {
        if ((_DWORD)v20 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_58;
          continue;
        }
        v21 = 0;
        v22 = 0;
        v23 = 0;
        v5->_hasContextFormat = 1;
        while (1)
        {
          v24 = *v6;
          v25 = *(_QWORD *)&v4[v24];
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)&v4[*v7])
          {
            v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextFormat;
            goto LABEL_48;
          }
          v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
          *(_QWORD *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0)
            break;
          v21 += 7;
          v28 = v22++ > 8;
          if (v28)
          {
            LODWORD(v23) = 0;
            v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextFormat;
            goto LABEL_51;
          }
        }
        v29 = &OBJC_IVAR___BMPersonalizedSensingMomentsContextMomentsContextFetchOptions__contextFormat;
      }
LABEL_49:
      if (v4[*v8])
        LODWORD(v23) = 0;
LABEL_51:
      *(_DWORD *)((char *)&v5->super.super.isa + *v29) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_58:
    v42 = 0;
  else
LABEL_59:
    v42 = v5;

  return v42;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasContextFormat)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasContextRetrieval)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasContextCount)
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
  -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPersonalizedSensingMomentsContextMomentsContextFetchOptions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMPersonalizedSensingMomentsContextMomentsContextFetchOptions *v13;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextFormat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextRetrieval"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v13 = 0;
          goto LABEL_12;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("contextRetrieval"));
        v28 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v18, 2, v11);
        v13 = 0;
        v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v25 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("contextCount"));
          v26 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v21);

        }
        v12 = 0;
        v13 = 0;
        goto LABEL_11;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    self = -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions initWithContextFormat:contextRetrieval:contextCount:](self, "initWithContextFormat:contextRetrieval:contextCount:", v8, v10, v12);
    v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v13 = 0;
    v8 = 0;
    goto LABEL_13;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("contextFormat"));
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v9);
  v13 = 0;
  v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
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
  if (-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextFormat](self, "hasContextFormat"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextFormat](self, "contextFormat"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextRetrieval](self, "hasContextRetrieval"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextRetrieval](self, "contextRetrieval"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextCount](self, "hasContextCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextCount](self, "contextCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v11[0] = CFSTR("contextFormat");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("contextRetrieval");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("contextCount");
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
      goto LABEL_18;
LABEL_21:

    if (v3)
      goto LABEL_19;
LABEL_22:

    goto LABEL_19;
  }

  if (!v4)
    goto LABEL_21;
LABEL_18:
  if (!v3)
    goto LABEL_22;
LABEL_19:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextFormat](self, "hasContextFormat")
      || objc_msgSend(v5, "hasContextFormat"))
    {
      if (!-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextFormat](self, "hasContextFormat"))
        goto LABEL_18;
      if (!objc_msgSend(v5, "hasContextFormat"))
        goto LABEL_18;
      v6 = -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextFormat](self, "contextFormat");
      if (v6 != objc_msgSend(v5, "contextFormat"))
        goto LABEL_18;
    }
    if (-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextRetrieval](self, "hasContextRetrieval")|| objc_msgSend(v5, "hasContextRetrieval"))
    {
      if (!-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextRetrieval](self, "hasContextRetrieval"))goto LABEL_18;
      if (!objc_msgSend(v5, "hasContextRetrieval"))
        goto LABEL_18;
      v7 = -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextRetrieval](self, "contextRetrieval");
      if (v7 != objc_msgSend(v5, "contextRetrieval"))
        goto LABEL_18;
    }
    if (!-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextCount](self, "hasContextCount")
      && !objc_msgSend(v5, "hasContextCount"))
    {
      v9 = 1;
      goto LABEL_19;
    }
    if (-[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions hasContextCount](self, "hasContextCount")
      && objc_msgSend(v5, "hasContextCount"))
    {
      v8 = -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions contextCount](self, "contextCount");
      v9 = v8 == objc_msgSend(v5, "contextCount");
    }
    else
    {
LABEL_18:
      v9 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  v9 = 0;
LABEL_20:

  return v9;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)contextFormat
{
  return self->_contextFormat;
}

- (BOOL)hasContextFormat
{
  return self->_hasContextFormat;
}

- (void)setHasContextFormat:(BOOL)a3
{
  self->_hasContextFormat = a3;
}

- (unsigned)contextRetrieval
{
  return self->_contextRetrieval;
}

- (BOOL)hasContextRetrieval
{
  return self->_hasContextRetrieval;
}

- (void)setHasContextRetrieval:(BOOL)a3
{
  self->_hasContextRetrieval = a3;
}

- (unsigned)contextCount
{
  return self->_contextCount;
}

- (BOOL)hasContextCount
{
  return self->_hasContextCount;
}

- (void)setHasContextCount:(BOOL)a3
{
  self->_hasContextCount = a3;
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

    v4 = -[BMPersonalizedSensingMomentsContextMomentsContextFetchOptions initByReadFrom:]([BMPersonalizedSensingMomentsContextMomentsContextFetchOptions alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contextFormat"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contextRetrieval"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contextCount"), 0, 0, 3, 4, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F438;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextFormat"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextRetrieval"), 2, 4, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextCount"), 3, 4, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
