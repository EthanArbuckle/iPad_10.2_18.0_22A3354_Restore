@implementation BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts

- (BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts)initWithTimeInterval:(id)a3 cohortType:(id)a4 cohortDataAvailabilityState:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *v12;
  int v13;
  int v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts;
  v12 = -[BMEventBase init](&v16, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_timeInterval, a3);
    if (v10)
    {
      v12->_hasCohortType = 1;
      v13 = objc_msgSend(v10, "intValue");
    }
    else
    {
      v12->_hasCohortType = 0;
      v13 = -1;
    }
    v12->_cohortType = v13;
    if (v11)
    {
      v12->_hasCohortDataAvailabilityState = 1;
      v14 = objc_msgSend(v11, "intValue");
    }
    else
    {
      v12->_hasCohortDataAvailabilityState = 0;
      v14 = -1;
    }
    v12->_cohortDataAvailabilityState = v14;
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts timeInterval](self, "timeInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortType](self, "cohortType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortDataAvailabilityState](self, "cohortDataAvailabilityState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts with timeInterval: %@, cohortType: %@, cohortDataAvailabilityState: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *v5;
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
  unint64_t v19;
  BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *v20;
  BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *timeInterval;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *v34;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_53;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v8])
        goto LABEL_51;
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
        goto LABEL_51;
      v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
        break;
      if ((_DWORD)v19 == 2)
      {
        v28 = 0;
        v29 = 0;
        v24 = 0;
        v5->_hasCohortType = 1;
        while (1)
        {
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 == -1 || v31 >= *(_QWORD *)&v4[*v7])
            break;
          v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
          *(_QWORD *)&v4[v30] = v31 + 1;
          v24 |= (unint64_t)(v32 & 0x7F) << v28;
          if ((v32 & 0x80) == 0)
            goto LABEL_46;
          v28 += 7;
          v16 = v29++ >= 9;
          if (v16)
          {
            LODWORD(v24) = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8])
          LODWORD(v24) = 0;
LABEL_48:
        v33 = 24;
LABEL_49:
        *(_DWORD *)((char *)&v5->super.super.isa + v33) = v24;
        goto LABEL_50;
      }
      if ((_DWORD)v19 == 1)
      {
        v37 = 0;
        v38 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_52;
        v20 = -[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval initByReadFrom:]([BMSiriOnDeviceDigestSegmentsCohortsTimeInterval alloc], "initByReadFrom:", v4);
        if (!v20)
          goto LABEL_52;
        timeInterval = v5->_timeInterval;
        v5->_timeInterval = v20;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_52;
      }
LABEL_50:
      if (*(_QWORD *)&v4[*v6] >= *(_QWORD *)&v4[*v7])
        goto LABEL_51;
    }
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v5->_hasCohortDataAvailabilityState = 1;
    while (1)
    {
      v25 = *v6;
      v26 = *(_QWORD *)&v4[v25];
      if (v26 == -1 || v26 >= *(_QWORD *)&v4[*v7])
        break;
      v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
      *(_QWORD *)&v4[v25] = v26 + 1;
      v24 |= (unint64_t)(v27 & 0x7F) << v22;
      if ((v27 & 0x80) == 0)
        goto LABEL_42;
      v22 += 7;
      v16 = v23++ >= 9;
      if (v16)
      {
        LODWORD(v24) = 0;
        goto LABEL_44;
      }
    }
    v4[*v8] = 1;
LABEL_42:
    if (v4[*v8])
      LODWORD(v24) = 0;
LABEL_44:
    v33 = 28;
    goto LABEL_49;
  }
LABEL_51:
  if (v4[*v8])
LABEL_52:
    v34 = 0;
  else
LABEL_53:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_timeInterval)
  {
    PBDataWriterPlaceMark();
    -[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval writeTo:](self->_timeInterval, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasCohortType)
    PBDataWriterWriteInt32Field();
  if (self->_hasCohortDataAvailabilityState)
    PBDataWriterWriteInt32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *v13;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    v26 = 0;
    v8 = -[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval initWithJSONDictionary:error:]([BMSiriOnDeviceDigestSegmentsCohortsTimeInterval alloc], "initWithJSONDictionary:error:", v10, &v26);
    v15 = v26;
    if (v15)
    {
      v16 = v15;
      if (a4)
        *a4 = objc_retainAutorelease(v15);

      v13 = 0;
      goto LABEL_13;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cohortType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v13 = 0;
          v10 = 0;
          goto LABEL_12;
        }
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = *MEMORY[0x1E0D025B8];
        v29 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cohortType"));
        v30 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v19, 2, v11);
        v13 = 0;
        v10 = 0;
        *a4 = v20;
        goto LABEL_11;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cohortDataAvailabilityState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v23 = *MEMORY[0x1E0D025B8];
          v27 = *MEMORY[0x1E0CB2D50];
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cohortDataAvailabilityState"));
          v28 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v23, 2, v22);

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
    self = -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts initWithTimeInterval:cohortType:cohortDataAvailabilityState:](self, "initWithTimeInterval:cohortType:cohortDataAvailabilityState:", v8, v10, v12);
    v13 = self;
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_14;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = *MEMORY[0x1E0D025B8];
  v31 = *MEMORY[0x1E0CB2D50];
  v8 = (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("timeInterval"));
  v32[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  *a4 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v10);
LABEL_13:

LABEL_14:
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
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts timeInterval](self, "timeInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts hasCohortType](self, "hasCohortType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortType](self, "cohortType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts hasCohortDataAvailabilityState](self, "hasCohortDataAvailabilityState"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortDataAvailabilityState](self, "cohortDataAvailabilityState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v12[0] = CFSTR("timeInterval");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v7;
  v12[1] = CFSTR("cohortType");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  v12[2] = CFSTR("cohortDataAvailabilityState");
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_15;
LABEL_18:

    if (v4)
      goto LABEL_16;
LABEL_19:

    goto LABEL_16;
  }

  if (!v5)
    goto LABEL_18;
LABEL_15:
  if (!v4)
    goto LABEL_19;
LABEL_16:

  return v10;
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
  int v13;
  int v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts timeInterval](self, "timeInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeInterval");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts timeInterval](self, "timeInterval");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    if (!-[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts hasCohortType](self, "hasCohortType")
      && !objc_msgSend(v5, "hasCohortType")
      || -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts hasCohortType](self, "hasCohortType")
      && objc_msgSend(v5, "hasCohortType")
      && (v13 = -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortType](self, "cohortType"),
          v13 == objc_msgSend(v5, "cohortType")))
    {
      if (!-[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts hasCohortDataAvailabilityState](self, "hasCohortDataAvailabilityState")&& !objc_msgSend(v5, "hasCohortDataAvailabilityState"))
      {
        v12 = 1;
        goto LABEL_18;
      }
      if (-[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts hasCohortDataAvailabilityState](self, "hasCohortDataAvailabilityState")&& objc_msgSend(v5, "hasCohortDataAvailabilityState"))
      {
        v14 = -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortDataAvailabilityState](self, "cohortDataAvailabilityState");
        v12 = v14 == objc_msgSend(v5, "cohortDataAvailabilityState");
LABEL_18:

        goto LABEL_19;
      }
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

- (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (int)cohortType
{
  return self->_cohortType;
}

- (BOOL)hasCohortType
{
  return self->_hasCohortType;
}

- (void)setHasCohortType:(BOOL)a3
{
  self->_hasCohortType = a3;
}

- (int)cohortDataAvailabilityState
{
  return self->_cohortDataAvailabilityState;
}

- (BOOL)hasCohortDataAvailabilityState
{
  return self->_hasCohortDataAvailabilityState;
}

- (void)setHasCohortDataAvailabilityState:(BOOL)a3
{
  self->_hasCohortDataAvailabilityState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInterval, 0);
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

    v4 = -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts initByReadFrom:]([BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("timeInterval_json"), 5, 1, &__block_literal_global_252_32703);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cohortType"), 0, 0, 2, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cohortDataAvailabilityState"), 0, 0, 3, 2, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C5E8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeInterval"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cohortType"), 2, 2, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cohortDataAvailabilityState"), 3, 2, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __59__BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
