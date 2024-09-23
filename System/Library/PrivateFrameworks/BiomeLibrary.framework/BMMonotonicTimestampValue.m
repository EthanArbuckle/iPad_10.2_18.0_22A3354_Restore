@implementation BMMonotonicTimestampValue

- (BMMonotonicTimestampValue)initWithSuspendingNanosecondsSinceBoot:(id)a3 continuousNanosecondsSinceBoot:(id)a4
{
  id v6;
  id v7;
  BMMonotonicTimestampValue *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMMonotonicTimestampValue;
  v8 = -[BMEventBase init](&v12, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v8->_hasSuspendingNanosecondsSinceBoot = 1;
      v9 = objc_msgSend(v6, "unsignedLongLongValue");
    }
    else
    {
      v9 = 0;
      v8->_hasSuspendingNanosecondsSinceBoot = 0;
    }
    v8->_suspendingNanosecondsSinceBoot = v9;
    if (v7)
    {
      v8->_hasContinuousNanosecondsSinceBoot = 1;
      v10 = objc_msgSend(v7, "unsignedLongLongValue");
    }
    else
    {
      v10 = 0;
      v8->_hasContinuousNanosecondsSinceBoot = 0;
    }
    v8->_continuousNanosecondsSinceBoot = v10;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMMonotonicTimestampValue suspendingNanosecondsSinceBoot](self, "suspendingNanosecondsSinceBoot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMMonotonicTimestampValue continuousNanosecondsSinceBoot](self, "continuousNanosecondsSinceBoot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMonotonicTimestampValue with suspendingNanosecondsSinceBoot: %@, continuousNanosecondsSinceBoot: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMonotonicTimestampValue *v5;
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
  char v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  BOOL v25;
  int *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  BMMonotonicTimestampValue *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMMonotonicTimestampValue;
  v5 = -[BMEventBase init](&v34, sel_init);
  if (!v5)
    goto LABEL_48;
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
        v27 = 0;
        v28 = 0;
        v21 = 0;
        v5->_hasContinuousNanosecondsSinceBoot = 1;
        while (1)
        {
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
            break;
          v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
          *(_QWORD *)&v4[v29] = v30 + 1;
          v21 |= (unint64_t)(v31 & 0x7F) << v27;
          if ((v31 & 0x80) == 0)
          {
            v26 = &OBJC_IVAR___BMMonotonicTimestampValue__continuousNanosecondsSinceBoot;
            goto LABEL_42;
          }
          v27 += 7;
          v25 = v28++ > 8;
          if (v25)
          {
            v21 = 0;
            v26 = &OBJC_IVAR___BMMonotonicTimestampValue__continuousNanosecondsSinceBoot;
            goto LABEL_44;
          }
        }
        v26 = &OBJC_IVAR___BMMonotonicTimestampValue__continuousNanosecondsSinceBoot;
LABEL_39:
        v4[*v8] = 1;
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_47;
          continue;
        }
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v5->_hasSuspendingNanosecondsSinceBoot = 1;
        while (1)
        {
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
          {
            v26 = &OBJC_IVAR___BMMonotonicTimestampValue__suspendingNanosecondsSinceBoot;
            goto LABEL_39;
          }
          v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
          *(_QWORD *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            break;
          v19 += 7;
          v25 = v20++ > 8;
          if (v25)
          {
            v21 = 0;
            v26 = &OBJC_IVAR___BMMonotonicTimestampValue__suspendingNanosecondsSinceBoot;
            goto LABEL_44;
          }
        }
        v26 = &OBJC_IVAR___BMMonotonicTimestampValue__suspendingNanosecondsSinceBoot;
      }
LABEL_42:
      if (v4[*v8])
        v21 = 0;
LABEL_44:
      *(Class *)((char *)&v5->super.super.isa + *v26) = (Class)v21;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_47:
    v32 = 0;
  else
LABEL_48:
    v32 = v5;

  return v32;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasSuspendingNanosecondsSinceBoot)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_hasContinuousNanosecondsSinceBoot)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMonotonicTimestampValue writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMonotonicTimestampValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMMonotonicTimestampValue *v11;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suspendingNanosecondsSinceBoot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v11 = 0;
        v8 = 0;
        goto LABEL_9;
      }
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = *MEMORY[0x1E0D025B8];
      v22 = *MEMORY[0x1E0CB2D50];
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("suspendingNanosecondsSinceBoot"));
      v23[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2, v9);
      v11 = 0;
      v8 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("continuousNanosecondsSinceBoot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D025B8];
        v20 = *MEMORY[0x1E0CB2D50];
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("continuousNanosecondsSinceBoot"));
        v21 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v19);

      }
      v10 = 0;
      v11 = 0;
      goto LABEL_8;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  self = -[BMMonotonicTimestampValue initWithSuspendingNanosecondsSinceBoot:continuousNanosecondsSinceBoot:](self, "initWithSuspendingNanosecondsSinceBoot:continuousNanosecondsSinceBoot:", v8, v10);
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (-[BMMonotonicTimestampValue hasSuspendingNanosecondsSinceBoot](self, "hasSuspendingNanosecondsSinceBoot"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMMonotonicTimestampValue suspendingNanosecondsSinceBoot](self, "suspendingNanosecondsSinceBoot"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMMonotonicTimestampValue hasContinuousNanosecondsSinceBoot](self, "hasContinuousNanosecondsSinceBoot"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMMonotonicTimestampValue continuousNanosecondsSinceBoot](self, "continuousNanosecondsSinceBoot"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v9[0] = CFSTR("suspendingNanosecondsSinceBoot");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("continuousNanosecondsSinceBoot");
  v10[0] = v5;
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    if (v3)
      goto LABEL_13;
LABEL_15:

    goto LABEL_13;
  }
  if (!v3)
    goto LABEL_15;
LABEL_13:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMMonotonicTimestampValue hasSuspendingNanosecondsSinceBoot](self, "hasSuspendingNanosecondsSinceBoot")
      || objc_msgSend(v5, "hasSuspendingNanosecondsSinceBoot"))
    {
      if (!-[BMMonotonicTimestampValue hasSuspendingNanosecondsSinceBoot](self, "hasSuspendingNanosecondsSinceBoot"))
        goto LABEL_13;
      if (!objc_msgSend(v5, "hasSuspendingNanosecondsSinceBoot"))
        goto LABEL_13;
      v6 = -[BMMonotonicTimestampValue suspendingNanosecondsSinceBoot](self, "suspendingNanosecondsSinceBoot");
      if (v6 != objc_msgSend(v5, "suspendingNanosecondsSinceBoot"))
        goto LABEL_13;
    }
    if (!-[BMMonotonicTimestampValue hasContinuousNanosecondsSinceBoot](self, "hasContinuousNanosecondsSinceBoot")
      && !objc_msgSend(v5, "hasContinuousNanosecondsSinceBoot"))
    {
      v8 = 1;
      goto LABEL_14;
    }
    if (-[BMMonotonicTimestampValue hasContinuousNanosecondsSinceBoot](self, "hasContinuousNanosecondsSinceBoot")
      && objc_msgSend(v5, "hasContinuousNanosecondsSinceBoot"))
    {
      v7 = -[BMMonotonicTimestampValue continuousNanosecondsSinceBoot](self, "continuousNanosecondsSinceBoot");
      v8 = v7 == objc_msgSend(v5, "continuousNanosecondsSinceBoot");
    }
    else
    {
LABEL_13:
      v8 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unint64_t)suspendingNanosecondsSinceBoot
{
  return self->_suspendingNanosecondsSinceBoot;
}

- (BOOL)hasSuspendingNanosecondsSinceBoot
{
  return self->_hasSuspendingNanosecondsSinceBoot;
}

- (void)setHasSuspendingNanosecondsSinceBoot:(BOOL)a3
{
  self->_hasSuspendingNanosecondsSinceBoot = a3;
}

- (unint64_t)continuousNanosecondsSinceBoot
{
  return self->_continuousNanosecondsSinceBoot;
}

- (BOOL)hasContinuousNanosecondsSinceBoot
{
  return self->_hasContinuousNanosecondsSinceBoot;
}

- (void)setHasContinuousNanosecondsSinceBoot:(BOOL)a3
{
  self->_hasContinuousNanosecondsSinceBoot = a3;
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

    v4 = -[BMMonotonicTimestampValue initByReadFrom:]([BMMonotonicTimestampValue alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suspendingNanosecondsSinceBoot"), 0, 0, 1, 5, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("continuousNanosecondsSinceBoot"), 0, 0, 2, 5, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B388;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suspendingNanosecondsSinceBoot"), 1, 5, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("continuousNanosecondsSinceBoot"), 2, 5, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
