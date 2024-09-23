@implementation BMSiriTaskAggregationMetadata

- (BMSiriTaskAggregationMetadata)initWithSchedule:(int)a3 aggregationWindowStartTimestamp:(id)a4 aggregationWindowEndTimestamp:(id)a5
{
  return -[BMSiriTaskAggregationMetadata initWithSchedule:aggregationWindowStartTimestamp:aggregationWindowEndTimestamp:odmId:](self, "initWithSchedule:aggregationWindowStartTimestamp:aggregationWindowEndTimestamp:odmId:", *(_QWORD *)&a3, a4, a5, 0);
}

- (BMSiriTaskAggregationMetadata)initWithSchedule:(int)a3 aggregationWindowStartTimestamp:(id)a4 aggregationWindowEndTimestamp:(id)a5 odmId:(id)a6
{
  id v10;
  id v11;
  id v12;
  BMSiriTaskAggregationMetadata *v13;
  double v14;
  double v15;
  objc_super v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMSiriTaskAggregationMetadata;
  v13 = -[BMEventBase init](&v17, sel_init);
  if (v13)
  {
    v13->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v13->_schedule = a3;
    if (v10)
    {
      v13->_hasAggregationWindowStartTimestamp = 1;
      objc_msgSend(v10, "doubleValue");
    }
    else
    {
      v13->_hasAggregationWindowStartTimestamp = 0;
      v14 = -1.0;
    }
    v13->_aggregationWindowStartTimestamp = v14;
    if (v11)
    {
      v13->_hasAggregationWindowEndTimestamp = 1;
      objc_msgSend(v11, "doubleValue");
    }
    else
    {
      v13->_hasAggregationWindowEndTimestamp = 0;
      v15 = -1.0;
    }
    v13->_aggregationWindowEndTimestamp = v15;
    objc_storeStrong((id *)&v13->_odmId, a6);
  }

  return v13;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMSiriTaskAggregationMetadataScheduleAsString(-[BMSiriTaskAggregationMetadata schedule](self, "schedule"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriTaskAggregationMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriTaskAggregationMetadata aggregationWindowEndTimestamp](self, "aggregationWindowEndTimestamp");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationMetadata odmId](self, "odmId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriTaskAggregationMetadata with schedule: %@, aggregationWindowStartTimestamp: %@, aggregationWindowEndTimestamp: %@, odmId: %@"), v4, v6, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriTaskAggregationMetadata *v5;
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
  uint64_t v27;
  unint64_t v28;
  objc_class *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSString *odmId;
  uint64_t v34;
  BMSiriTaskAggregationMetadata *v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMSiriTaskAggregationMetadata;
  v5 = -[BMEventBase init](&v37, sel_init);
  if (!v5)
    goto LABEL_50;
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
      switch((v12 >> 3))
      {
        case 1u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          break;
        case 2u:
          v5->_hasAggregationWindowStartTimestamp = 1;
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v28);
            *(_QWORD *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v34 = 32;
          goto LABEL_46;
        case 3u:
          v5->_hasAggregationWindowEndTimestamp = 1;
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0;
          }
          v34 = 40;
LABEL_46:
          *(Class *)((char *)&v5->super.super.isa + v34) = v29;
          continue;
        case 4u:
          PBReaderReadString();
          v32 = objc_claimAutoreleasedReturnValue();
          odmId = v5->_odmId;
          v5->_odmId = (NSString *)v32;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_49;
          continue;
      }
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
          goto LABEL_37;
        v20 += 7;
        v17 = v21++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_39;
        }
      }
      v4[*v8] = 1;
LABEL_37:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_39:
      if (v22 >= 4)
        LODWORD(v22) = 0;
      v5->_schedule = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_49:
    v35 = 0;
  else
LABEL_50:
    v35 = v5;

  return v35;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasAggregationWindowStartTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_hasAggregationWindowEndTimestamp)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_odmId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriTaskAggregationMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriTaskAggregationMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMSiriTaskAggregationMetadata *v13;
  id *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  BMSiriTaskAggregationMetadata *v19;
  BMSiriTaskAggregationMetadata *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id *v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("schedule"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v36 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("aggregationWindowStartTimestamp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v20 = 0;
          goto LABEL_35;
        }
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v41 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("aggregationWindowStartTimestamp"));
        v42 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v11);
        v20 = 0;
        v10 = 0;
        *a4 = v23;
        goto LABEL_34;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("aggregationWindowEndTimestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          v20 = 0;
          goto LABEL_34;
        }
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v39 = *MEMORY[0x1E0CB2D50];
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("aggregationWindowEndTimestamp"));
        v40 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v12 = v10;
        v13 = self;
        v25 = a4;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v24, 2, v16);
        v20 = 0;
        v15 = 0;
        *v25 = v26;
        goto LABEL_32;
      }
      v12 = v10;
      v13 = self;
      v14 = a4;
      v15 = v11;
    }
    else
    {
      v12 = v10;
      v13 = self;
      v14 = a4;
      v15 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("odmId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v17 = 0;
LABEL_18:
      v18 = objc_msgSend(v36, "intValue");
      v19 = v13;
      v10 = v12;
      self = -[BMSiriTaskAggregationMetadata initWithSchedule:aggregationWindowStartTimestamp:aggregationWindowEndTimestamp:odmId:](v19, "initWithSchedule:aggregationWindowStartTimestamp:aggregationWindowEndTimestamp:odmId:", v18, v12, v15, v17);
      v20 = self;
LABEL_33:

      v7 = v35;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
      goto LABEL_18;
    }
    if (v14)
    {
      v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v32 = *MEMORY[0x1E0D025B8];
      v37 = *MEMORY[0x1E0CB2D50];
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("odmId"));
      v38 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *v14 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v32, 2, v28);

    }
    v17 = 0;
    v20 = 0;
LABEL_32:
    self = v13;
    v10 = v12;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_8:
    v36 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriTaskAggregationMetadataScheduleFromString(v7));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v36 = 0;
    v20 = 0;
    goto LABEL_36;
  }
  v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v31 = *MEMORY[0x1E0D025B8];
  v43 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("schedule"));
  v44[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v20 = 0;
  *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v9);
LABEL_35:

LABEL_36:
  return v20;
}

- (id)jsonDictionary
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriTaskAggregationMetadata schedule](self, "schedule"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMSiriTaskAggregationMetadata hasAggregationWindowStartTimestamp](self, "hasAggregationWindowStartTimestamp")
    || (-[BMSiriTaskAggregationMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp"),
        fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMSiriTaskAggregationMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriTaskAggregationMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMSiriTaskAggregationMetadata hasAggregationWindowEndTimestamp](self, "hasAggregationWindowEndTimestamp")
    || (-[BMSiriTaskAggregationMetadata aggregationWindowEndTimestamp](self, "aggregationWindowEndTimestamp"),
        fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMSiriTaskAggregationMetadata aggregationWindowEndTimestamp](self, "aggregationWindowEndTimestamp");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriTaskAggregationMetadata aggregationWindowEndTimestamp](self, "aggregationWindowEndTimestamp");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMSiriTaskAggregationMetadata odmId](self, "odmId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("schedule");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v11;
  v17[1] = CFSTR("aggregationWindowStartTimestamp");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v12;
  v17[2] = CFSTR("aggregationWindowEndTimestamp");
  v13 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[2] = v13;
  v17[3] = CFSTR("odmId");
  v14 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_19;
  }
  else
  {

    if (v9)
    {
LABEL_19:
      if (v6)
        goto LABEL_20;
LABEL_24:

      if (v3)
        goto LABEL_21;
LABEL_25:

      goto LABEL_21;
    }
  }

  if (!v6)
    goto LABEL_24;
LABEL_20:
  if (!v3)
    goto LABEL_25;
LABEL_21:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMSiriTaskAggregationMetadata schedule](self, "schedule");
    if (v6 == objc_msgSend(v5, "schedule")
      && (!-[BMSiriTaskAggregationMetadata hasAggregationWindowStartTimestamp](self, "hasAggregationWindowStartTimestamp")&& !objc_msgSend(v5, "hasAggregationWindowStartTimestamp")|| -[BMSiriTaskAggregationMetadata hasAggregationWindowStartTimestamp](self, "hasAggregationWindowStartTimestamp")&& objc_msgSend(v5, "hasAggregationWindowStartTimestamp")&& (-[BMSiriTaskAggregationMetadata aggregationWindowStartTimestamp](self, "aggregationWindowStartTimestamp"), v8 = v7, objc_msgSend(v5, "aggregationWindowStartTimestamp"), v8 == v9))&& (!-[BMSiriTaskAggregationMetadata hasAggregationWindowEndTimestamp](self, "hasAggregationWindowEndTimestamp")&& !objc_msgSend(v5, "hasAggregationWindowEndTimestamp")|| -[BMSiriTaskAggregationMetadata hasAggregationWindowEndTimestamp](self, "hasAggregationWindowEndTimestamp")&& objc_msgSend(v5, "hasAggregationWindowEndTimestamp")&& (-[BMSiriTaskAggregationMetadata aggregationWindowEndTimestamp](self, "aggregationWindowEndTimestamp"), v11 = v10, objc_msgSend(v5, "aggregationWindowEndTimestamp"), v11 == v12)))
    {
      -[BMSiriTaskAggregationMetadata odmId](self, "odmId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "odmId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
      {
        v17 = 1;
      }
      else
      {
        -[BMSiriTaskAggregationMetadata odmId](self, "odmId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "odmId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)schedule
{
  return self->_schedule;
}

- (double)aggregationWindowStartTimestamp
{
  return self->_aggregationWindowStartTimestamp;
}

- (BOOL)hasAggregationWindowStartTimestamp
{
  return self->_hasAggregationWindowStartTimestamp;
}

- (void)setHasAggregationWindowStartTimestamp:(BOOL)a3
{
  self->_hasAggregationWindowStartTimestamp = a3;
}

- (double)aggregationWindowEndTimestamp
{
  return self->_aggregationWindowEndTimestamp;
}

- (BOOL)hasAggregationWindowEndTimestamp
{
  return self->_hasAggregationWindowEndTimestamp;
}

- (void)setHasAggregationWindowEndTimestamp:(BOOL)a3
{
  self->_hasAggregationWindowEndTimestamp = a3;
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

    v4 = -[BMSiriTaskAggregationMetadata initByReadFrom:]([BMSiriTaskAggregationMetadata alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("schedule"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("aggregationWindowStartTimestamp"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("aggregationWindowEndTimestamp"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("odmId"), 2, 0, 4, 13, 0);
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
  return &unk_1E5F1F060;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("schedule"), 1, 4, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aggregationWindowStartTimestamp"), 2, 0, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aggregationWindowEndTimestamp"), 3, 0, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("odmId"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
