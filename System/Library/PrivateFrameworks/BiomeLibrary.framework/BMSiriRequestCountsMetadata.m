@implementation BMSiriRequestCountsMetadata

- (BMSiriRequestCountsMetadata)initWithSchedule:(int)a3 aggregationWindowStartTimestamp:(id)a4 odmId:(id)a5
{
  id v8;
  id v9;
  BMSiriRequestCountsMetadata *v10;
  double v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMSiriRequestCountsMetadata;
  v10 = -[BMEventBase init](&v13, sel_init);
  if (v10)
  {
    v10->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v10->_schedule = a3;
    if (v8)
    {
      v10->_hasRaw_aggregationWindowStartTimestamp = 1;
      objc_msgSend(v8, "timeIntervalSince1970");
    }
    else
    {
      v10->_hasRaw_aggregationWindowStartTimestamp = 0;
      v11 = -1.0;
    }
    v10->_raw_aggregationWindowStartTimestamp = v11;
    objc_storeStrong((id *)&v10->_odmId, a5);
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
  BMSiriRequestCountsMetadataScheduleAsString(-[BMSiriRequestCountsMetadata schedule](self, "schedule"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestCountsMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestCountsMetadata odmId](self, "odmId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriRequestCountsMetadata with schedule: %@, aggregationWindowStartTimestamp: %@, odmId: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRequestCountsMetadata *v5;
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
  NSString *odmId;
  uint64_t v30;
  unint64_t v31;
  double v32;
  BMSiriRequestCountsMetadata *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMSiriRequestCountsMetadata;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_46;
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
        odmId = v5->_odmId;
        v5->_odmId = (NSString *)v28;

      }
      else if ((_DWORD)v20 == 2)
      {
        v5->_hasRaw_aggregationWindowStartTimestamp = 1;
        v30 = *v6;
        v31 = *(_QWORD *)&v4[v30];
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v32 = *(double *)(*(_QWORD *)&v4[*v9] + v31);
          *(_QWORD *)&v4[v30] = v31 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v32 = 0.0;
        }
        v5->_raw_aggregationWindowStartTimestamp = v32;
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
            goto LABEL_36;
          v21 += 7;
          v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_38;
          }
        }
        v4[*v8] = 1;
LABEL_36:
        if (v4[*v8])
          LODWORD(v23) = 0;
LABEL_38:
        if (v23 >= 4)
          LODWORD(v23) = 0;
        v5->_schedule = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_45;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_45:
    v33 = 0;
  else
LABEL_46:
    v33 = v5;

  return v33;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_aggregationWindowStartTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_odmId)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriRequestCountsMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRequestCountsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  BMSiriRequestCountsMetadata *v21;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("schedule"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("aggregationWindowStartTimestamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (objc_class *)MEMORY[0x1E0C99D68];
        v13 = v10;
        v14 = [v12 alloc];
        objc_msgSend(v13, "doubleValue");
        v16 = v15;

        v17 = (id)objc_msgSend(v14, "initWithTimeIntervalSince1970:", v16);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v18, "dateFromString:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v11 = 0;
            v21 = 0;
            goto LABEL_22;
          }
          v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v27 = *MEMORY[0x1E0D025B8];
          v34 = *MEMORY[0x1E0CB2D50];
          v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("aggregationWindowStartTimestamp"));
          v35 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v27, 2, v19);
          v11 = 0;
          v21 = 0;
          *a4 = v28;
          goto LABEL_21;
        }
        v17 = v10;
      }
      v11 = v17;
    }
    else
    {
      v11 = 0;
    }
LABEL_17:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("odmId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v29 = *MEMORY[0x1E0D025B8];
          v32 = *MEMORY[0x1E0CB2D50];
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("odmId"));
          v33 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v29, 2, v24);

        }
        v20 = 0;
        v21 = 0;
        goto LABEL_21;
      }
      v20 = v19;
    }
    else
    {
      v20 = 0;
    }
    self = -[BMSiriRequestCountsMetadata initWithSchedule:aggregationWindowStartTimestamp:odmId:](self, "initWithSchedule:aggregationWindowStartTimestamp:odmId:", objc_msgSend(v8, "intValue"), v11, v20);
    v21 = self;
LABEL_21:

    goto LABEL_22;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriRequestCountsMetadataScheduleFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v21 = 0;
    goto LABEL_23;
  }
  v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v26 = *MEMORY[0x1E0D025B8];
  v36 = *MEMORY[0x1E0CB2D50];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("schedule"));
  v37[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v21 = 0;
  *a4 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v10);
LABEL_22:

LABEL_23:
  return v21;
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
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRequestCountsMetadata schedule](self, "schedule"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestCountsMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriRequestCountsMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMSiriRequestCountsMetadata odmId](self, "odmId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("schedule");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v9;
  v14[1] = CFSTR("aggregationWindowStartTimestamp");
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v10;
  v14[2] = CFSTR("odmId");
  v11 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_12;
LABEL_15:

    if (v3)
      goto LABEL_13;
LABEL_16:

    goto LABEL_13;
  }

  if (!v7)
    goto LABEL_15;
LABEL_12:
  if (!v3)
    goto LABEL_16;
LABEL_13:

  return v12;
}

- (NSDate)aggregationWindowStartTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_aggregationWindowStartTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_aggregationWindowStartTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMSiriRequestCountsMetadata schedule](self, "schedule");
    if (v6 == objc_msgSend(v5, "schedule"))
    {
      -[BMSiriRequestCountsMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "aggregationWindowStartTimestamp");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMSiriRequestCountsMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "aggregationWindowStartTimestamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[BMSiriRequestCountsMetadata odmId](self, "odmId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "odmId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
        v13 = 1;
      }
      else
      {
        -[BMSiriRequestCountsMetadata odmId](self, "odmId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "odmId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v16, "isEqual:", v17);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)schedule
{
  return self->_schedule;
}

- (NSString)odmId
{
  return self->_odmId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odmId, 0);
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

    v4 = -[BMSiriRequestCountsMetadata initByReadFrom:]([BMSiriRequestCountsMetadata alloc], "initByReadFrom:", v7);
    v4[8] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("schedule"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("aggregationWindowStartTimestamp"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("odmId"), 2, 0, 3, 13, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C1B0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("schedule"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aggregationWindowStartTimestamp"), 2, 0, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("odmId"), 3, 13, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
