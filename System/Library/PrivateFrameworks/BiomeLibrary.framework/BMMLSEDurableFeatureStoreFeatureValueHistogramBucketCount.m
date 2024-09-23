@implementation BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount

- (BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount)initWithInterval:(int)a3 value:(id)a4
{
  id v6;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount *v7;
  unsigned int v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount;
  v7 = -[BMEventBase init](&v10, sel_init);
  if (v7)
  {
    v7->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v7->_interval = a3;
    if (v6)
    {
      v7->_hasValue = 1;
      v8 = objc_msgSend(v6, "unsignedIntValue");
    }
    else
    {
      v8 = 0;
      v7->_hasValue = 0;
    }
    v7->_value = v8;
  }

  return v7;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalAsString(-[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount interval](self, "interval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount value](self, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount with interval: %@, value: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount *v5;
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
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  int *v33;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_51;
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
        v27 = 0;
        v28 = 0;
        v22 = 0;
        v5->_hasValue = 1;
        while (1)
        {
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)&v4[*v7])
            break;
          v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
          *(_QWORD *)&v4[v29] = v31;
          v22 |= (unint64_t)(v32 & 0x7F) << v27;
          if ((v32 & 0x80) == 0)
            goto LABEL_44;
          v27 += 7;
          v17 = v28++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_46;
          }
        }
        v4[*v8] = 1;
LABEL_44:
        if (v4[*v8])
          LODWORD(v22) = 0;
LABEL_46:
        v33 = &OBJC_IVAR___BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount__value;
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_50;
          continue;
        }
        v20 = 0;
        v21 = 0;
        v22 = 0;
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
            goto LABEL_38;
          v20 += 7;
          v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8])
          LODWORD(v22) = 0;
LABEL_40:
        if (v22 >= 6)
          LODWORD(v22) = 0;
        v33 = &OBJC_IVAR___BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount__interval;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + *v33) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_50:
    v34 = 0;
  else
LABEL_51:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasValue)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount *v12;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v8 = 0;
          v12 = 0;
          goto LABEL_14;
        }
        v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = *MEMORY[0x1E0D025B8];
        v23 = *MEMORY[0x1E0CB2D50];
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("interval"));
        v24[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v10);
        v8 = 0;
        v12 = 0;
        *a4 = v20;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalFromString(v7));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v15 = *MEMORY[0x1E0D025B8];
        v21 = *MEMORY[0x1E0CB2D50];
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("value"));
        v22 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v17);

      }
      v11 = 0;
      v12 = 0;
      goto LABEL_13;
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  self = -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount initWithInterval:value:](self, "initWithInterval:value:", objc_msgSend(v8, "intValue"), v11);
  v12 = self;
LABEL_13:

LABEL_14:
  return v12;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount interval](self, "interval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount hasValue](self, "hasValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount value](self, "value"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v9[0] = CFSTR("interval");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("value");
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
      goto LABEL_10;
LABEL_12:

    goto LABEL_10;
  }
  if (!v3)
    goto LABEL_12;
LABEL_10:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  unsigned int v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount interval](self, "interval");
    if (v6 != objc_msgSend(v5, "interval"))
      goto LABEL_9;
    if (!-[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount hasValue](self, "hasValue")
      && !objc_msgSend(v5, "hasValue"))
    {
      v8 = 1;
      goto LABEL_10;
    }
    if (-[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount hasValue](self, "hasValue")
      && objc_msgSend(v5, "hasValue"))
    {
      v7 = -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount value](self, "value");
      v8 = v7 == objc_msgSend(v5, "value");
    }
    else
    {
LABEL_9:
      v8 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)interval
{
  return self->_interval;
}

- (unsigned)value
{
  return self->_value;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (void)setHasValue:(BOOL)a3
{
  self->_hasValue = a3;
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

    v4 = -[BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount initByReadFrom:]([BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCount alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interval"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("value"), 0, 0, 2, 4, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C648;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interval"), 1, 4, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value"), 2, 4, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
