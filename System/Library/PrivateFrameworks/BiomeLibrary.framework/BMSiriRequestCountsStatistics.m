@implementation BMSiriRequestCountsStatistics

- (BMSiriRequestCountsStatistics)initWithAllRequestCount:(id)a3 userRequestCount:(id)a4
{
  id v6;
  id v7;
  BMSiriRequestCountsStatistics *v8;
  unsigned int v9;
  unsigned int v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSiriRequestCountsStatistics;
  v8 = -[BMEventBase init](&v12, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v8->_hasAllRequestCount = 1;
      v9 = objc_msgSend(v6, "unsignedIntValue");
    }
    else
    {
      v9 = 0;
      v8->_hasAllRequestCount = 0;
    }
    v8->_allRequestCount = v9;
    if (v7)
    {
      v8->_hasUserRequestCount = 1;
      v10 = objc_msgSend(v7, "unsignedIntValue");
    }
    else
    {
      v10 = 0;
      v8->_hasUserRequestCount = 0;
    }
    v8->_userRequestCount = v10;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriRequestCountsStatistics allRequestCount](self, "allRequestCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriRequestCountsStatistics userRequestCount](self, "userRequestCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriRequestCountsStatistics with allRequestCount: %@, userRequestCount: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRequestCountsStatistics *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BOOL v27;
  int *v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  BMSiriRequestCountsStatistics *v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMSiriRequestCountsStatistics;
  v5 = -[BMEventBase init](&v37, sel_init);
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
      if ((v12 >> 3) == 2)
      {
        v29 = 0;
        v30 = 0;
        v22 = 0;
        v5->_hasUserRequestCount = 1;
        while (1)
        {
          v31 = *v6;
          v32 = *(_QWORD *)&v4[v31];
          v33 = v32 + 1;
          if (v32 == -1 || v33 > *(_QWORD *)&v4[*v7])
            break;
          v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
          *(_QWORD *)&v4[v31] = v33;
          v22 |= (unint64_t)(v34 & 0x7F) << v29;
          if ((v34 & 0x80) == 0)
          {
            v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__userRequestCount;
            goto LABEL_42;
          }
          v29 += 7;
          v27 = v30++ > 8;
          if (v27)
          {
            LODWORD(v22) = 0;
            v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__userRequestCount;
            goto LABEL_44;
          }
        }
        v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__userRequestCount;
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
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v5->_hasAllRequestCount = 1;
        while (1)
        {
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          v25 = v24 + 1;
          if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
          {
            v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__allRequestCount;
            goto LABEL_39;
          }
          v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
          *(_QWORD *)&v4[v23] = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0)
            break;
          v20 += 7;
          v27 = v21++ > 8;
          if (v27)
          {
            LODWORD(v22) = 0;
            v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__allRequestCount;
            goto LABEL_44;
          }
        }
        v28 = &OBJC_IVAR___BMSiriRequestCountsStatistics__allRequestCount;
      }
LABEL_42:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_44:
      *(_DWORD *)((char *)&v5->super.super.isa + *v28) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_47:
    v35 = 0;
  else
LABEL_48:
    v35 = v5;

  return v35;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasAllRequestCount)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasUserRequestCount)
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
  -[BMSiriRequestCountsStatistics writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRequestCountsStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMSiriRequestCountsStatistics *v11;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allRequestCount"));
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
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("allRequestCount"));
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userRequestCount"));
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
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("userRequestCount"));
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
  self = -[BMSiriRequestCountsStatistics initWithAllRequestCount:userRequestCount:](self, "initWithAllRequestCount:userRequestCount:", v8, v10);
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
  if (-[BMSiriRequestCountsStatistics hasAllRequestCount](self, "hasAllRequestCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriRequestCountsStatistics allRequestCount](self, "allRequestCount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriRequestCountsStatistics hasUserRequestCount](self, "hasUserRequestCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriRequestCountsStatistics userRequestCount](self, "userRequestCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v9[0] = CFSTR("allRequestCount");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("userRequestCount");
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
  unsigned int v6;
  unsigned int v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriRequestCountsStatistics hasAllRequestCount](self, "hasAllRequestCount")
      || objc_msgSend(v5, "hasAllRequestCount"))
    {
      if (!-[BMSiriRequestCountsStatistics hasAllRequestCount](self, "hasAllRequestCount"))
        goto LABEL_13;
      if (!objc_msgSend(v5, "hasAllRequestCount"))
        goto LABEL_13;
      v6 = -[BMSiriRequestCountsStatistics allRequestCount](self, "allRequestCount");
      if (v6 != objc_msgSend(v5, "allRequestCount"))
        goto LABEL_13;
    }
    if (!-[BMSiriRequestCountsStatistics hasUserRequestCount](self, "hasUserRequestCount")
      && !objc_msgSend(v5, "hasUserRequestCount"))
    {
      v8 = 1;
      goto LABEL_14;
    }
    if (-[BMSiriRequestCountsStatistics hasUserRequestCount](self, "hasUserRequestCount")
      && objc_msgSend(v5, "hasUserRequestCount"))
    {
      v7 = -[BMSiriRequestCountsStatistics userRequestCount](self, "userRequestCount");
      v8 = v7 == objc_msgSend(v5, "userRequestCount");
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

- (unsigned)allRequestCount
{
  return self->_allRequestCount;
}

- (BOOL)hasAllRequestCount
{
  return self->_hasAllRequestCount;
}

- (void)setHasAllRequestCount:(BOOL)a3
{
  self->_hasAllRequestCount = a3;
}

- (unsigned)userRequestCount
{
  return self->_userRequestCount;
}

- (BOOL)hasUserRequestCount
{
  return self->_hasUserRequestCount;
}

- (void)setHasUserRequestCount:(BOOL)a3
{
  self->_hasUserRequestCount = a3;
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

    v4 = -[BMSiriRequestCountsStatistics initByReadFrom:]([BMSiriRequestCountsStatistics alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("allRequestCount"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userRequestCount"), 0, 0, 2, 4, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C1C8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("allRequestCount"), 1, 4, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userRequestCount"), 2, 4, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
