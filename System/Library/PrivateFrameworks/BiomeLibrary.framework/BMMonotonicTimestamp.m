@implementation BMMonotonicTimestamp

- (BMMonotonicTimestamp)initWithBootSessionUUID:(id)a3 machAbsoluteTime:(id)a4 machContinuousTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  BMMonotonicTimestampValue *v18;
  BMMonotonicTimestamp *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = objc_msgSend(v9, "unsignedLongLongValue");
    if (_CpuTickRate_onceToken != -1)
      dispatch_once(&_CpuTickRate_onceToken, &__block_literal_global_11074);
    objc_msgSend(v12, "numberWithUnsignedLongLong:", (unint64_t)(*(double *)&_CpuTickRate_rate * (double)v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_5;
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  v14 = 0;
  if (!v10)
    goto LABEL_9;
LABEL_5:
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend(v11, "unsignedLongLongValue");
  if (_CpuTickRate_onceToken != -1)
    dispatch_once(&_CpuTickRate_onceToken, &__block_literal_global_11074);
  objc_msgSend(v15, "numberWithUnsignedLongLong:", (unint64_t)(*(double *)&_CpuTickRate_rate * (double)v16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v18 = -[BMMonotonicTimestampValue initWithSuspendingNanosecondsSinceBoot:continuousNanosecondsSinceBoot:]([BMMonotonicTimestampValue alloc], "initWithSuspendingNanosecondsSinceBoot:continuousNanosecondsSinceBoot:", v14, v17);
  v19 = -[BMMonotonicTimestamp initWithBootSessionUUID:value:](self, "initWithBootSessionUUID:value:", v8, v18);

  return v19;
}

+ (id)nowFromSuspendingClock
{
  BMMonotonicTimestamp *v2;
  void *v3;
  void *v4;
  BMMonotonicTimestamp *v5;

  v2 = [BMMonotonicTimestamp alloc];
  _CurrentBootSessionUUID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMMonotonicTimestamp initWithBootSessionUUID:machAbsoluteTime:machContinuousTime:](v2, "initWithBootSessionUUID:machAbsoluteTime:machContinuousTime:", v3, v4, 0);

  return v5;
}

+ (id)nowFromContinuousClock
{
  BMMonotonicTimestamp *v2;
  void *v3;
  void *v4;
  BMMonotonicTimestamp *v5;

  v2 = [BMMonotonicTimestamp alloc];
  _CurrentBootSessionUUID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_continuous_time());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMMonotonicTimestamp initWithBootSessionUUID:machAbsoluteTime:machContinuousTime:](v2, "initWithBootSessionUUID:machAbsoluteTime:machContinuousTime:", v3, 0, v4);

  return v5;
}

- (BMMonotonicTimestamp)initWithBootSessionUUID:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  BMMonotonicTimestamp *v8;
  uint64_t v9;
  NSData *raw_bootSessionUUID;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMMonotonicTimestamp;
  v8 = -[BMEventBase init](&v12, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v13[0] = 0;
      v13[1] = 0;
      objc_msgSend(v6, "getUUIDBytes:", v13);
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v13, 16);
      raw_bootSessionUUID = v8->_raw_bootSessionUUID;
      v8->_raw_bootSessionUUID = (NSData *)v9;
    }
    else
    {
      raw_bootSessionUUID = v8->_raw_bootSessionUUID;
      v8->_raw_bootSessionUUID = 0;
    }

    objc_storeStrong((id *)&v8->_value, a4);
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
  -[BMMonotonicTimestamp bootSessionUUID](self, "bootSessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMonotonicTimestamp value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMonotonicTimestamp with bootSessionUUID: %@, value: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMonotonicTimestamp *v5;
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
  NSData *v19;
  NSData *raw_bootSessionUUID;
  BMMonotonicTimestampValue *v21;
  BMMonotonicTimestampValue *value;
  BMMonotonicTimestamp *v23;
  objc_super v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMMonotonicTimestamp;
  v5 = -[BMEventBase init](&v25, sel_init);
  if (!v5)
    goto LABEL_30;
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
        v26 = 0;
        v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_29;
        v21 = -[BMMonotonicTimestampValue initByReadFrom:]([BMMonotonicTimestampValue alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_29;
        value = v5->_value;
        v5->_value = v21;

        PBReaderRecallMark();
      }
      else if ((v12 >> 3) == 1)
      {
        PBReaderReadData();
        v19 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (-[NSData length](v19, "length") != 16)
        {

          goto LABEL_29;
        }
        raw_bootSessionUUID = v5->_raw_bootSessionUUID;
        v5->_raw_bootSessionUUID = v19;

      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_29;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_29:
    v23 = 0;
  else
LABEL_30:
    v23 = v5;

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_raw_bootSessionUUID)
    PBDataWriterWriteDataField();
  if (self->_value)
  {
    PBDataWriterPlaceMark();
    -[BMMonotonicTimestampValue writeTo:](self->_value, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMonotonicTimestamp writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMonotonicTimestamp)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BMMonotonicTimestampValue *v10;
  BMMonotonicTimestamp *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  BMMonotonicTimestampValue *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bootSessionUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v11 = 0;
        goto LABEL_24;
      }
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = *MEMORY[0x1E0D025B8];
      v30 = *MEMORY[0x1E0CB2D50];
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bootSessionUUID"));
      v31 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v9);
      v11 = 0;
      *a4 = v19;
      goto LABEL_22;
    }
    v8 = v7;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    if (!v12)
    {
      if (!a4)
      {
        v11 = 0;
        goto LABEL_23;
      }
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v24 = *MEMORY[0x1E0D025B8];
      v32 = *MEMORY[0x1E0CB2D50];
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("bootSessionUUID"));
      v33[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v25);

      goto LABEL_27;
    }
    v13 = (void *)v12;

    v8 = v13;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v9;
        v27 = 0;
        v10 = -[BMMonotonicTimestampValue initWithJSONDictionary:error:]([BMMonotonicTimestampValue alloc], "initWithJSONDictionary:error:", v14, &v27);
        v15 = v27;
        if (!v15)
        {

          goto LABEL_7;
        }
        v16 = v15;
        if (a4)
          *a4 = objc_retainAutorelease(v15);

LABEL_20:
        v11 = 0;
        goto LABEL_21;
      }
      if (a4)
      {
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = *MEMORY[0x1E0D025B8];
        v28 = *MEMORY[0x1E0CB2D50];
        v10 = (BMMonotonicTimestampValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("value"));
        v29 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v20, 2, v21);

        goto LABEL_20;
      }
LABEL_27:
      v11 = 0;
      goto LABEL_22;
    }
  }
  v10 = 0;
LABEL_7:
  self = -[BMMonotonicTimestamp initWithBootSessionUUID:value:](self, "initWithBootSessionUUID:value:", v8, v10);
  v11 = self;
LABEL_21:

LABEL_22:
LABEL_23:

LABEL_24:
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
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[BMMonotonicTimestamp bootSessionUUID](self, "bootSessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMMonotonicTimestamp value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = CFSTR("bootSessionUUID");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = CFSTR("value");
  v12[0] = v7;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    if (v4)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_9;
LABEL_7:

  return v9;
}

- (NSUUID)bootSessionUUID
{
  NSData *raw_bootSessionUUID;
  void *v3;

  raw_bootSessionUUID = self->_raw_bootSessionUUID;
  if (raw_bootSessionUUID)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_bootSessionUUID, 3);
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
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMonotonicTimestamp bootSessionUUID](self, "bootSessionUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bootSessionUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMonotonicTimestamp bootSessionUUID](self, "bootSessionUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bootSessionUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMMonotonicTimestamp value](self, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMMonotonicTimestamp value](self, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqual:", v16);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMMonotonicTimestampValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_raw_bootSessionUUID, 0);
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

    v4 = -[BMMonotonicTimestamp initByReadFrom:]([BMMonotonicTimestamp alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bootSessionUUID"), 6, 0, 1, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("value_json"), 5, 1, &__block_literal_global_11228);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B3A0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bootSessionUUID"), 1, 14, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value"), 2, 14, objc_opt_class());
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __31__BMMonotonicTimestamp_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMMonotonicTimestamp)initWithBootSessionUUID:(id)a3 suspendingNanosecondsSinceBoot:(id)a4 continuousNanosecondsSinceBoot:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMMonotonicTimestampValue *v11;
  BMMonotonicTimestamp *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[BMMonotonicTimestampValue initWithSuspendingNanosecondsSinceBoot:continuousNanosecondsSinceBoot:]([BMMonotonicTimestampValue alloc], "initWithSuspendingNanosecondsSinceBoot:continuousNanosecondsSinceBoot:", v9, v8);

  v12 = -[BMMonotonicTimestamp initWithBootSessionUUID:value:](self, "initWithBootSessionUUID:value:", v10, v11);
  return v12;
}

- (unint64_t)suspendingNanosecondsSinceBoot
{
  void *v2;
  unint64_t v3;

  -[BMMonotonicTimestamp value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suspendingNanosecondsSinceBoot");

  return v3;
}

- (BOOL)hasSuspendingNanosecondsSinceBoot
{
  void *v2;
  char v3;

  -[BMMonotonicTimestamp value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuspendingNanosecondsSinceBoot");

  return v3;
}

- (void)setHasSuspendingNanosecondsSinceBoot:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[BMMonotonicTimestamp value](self, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasSuspendingNanosecondsSinceBoot:", v3);

}

- (unint64_t)continuousNanosecondsSinceBoot
{
  void *v2;
  unint64_t v3;

  -[BMMonotonicTimestamp value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "continuousNanosecondsSinceBoot");

  return v3;
}

- (BOOL)hasContinuousNanosecondsSinceBoot
{
  void *v2;
  char v3;

  -[BMMonotonicTimestamp value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasContinuousNanosecondsSinceBoot");

  return v3;
}

- (void)setHasContinuousNanosecondsSinceBoot:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[BMMonotonicTimestamp value](self, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasContinuousNanosecondsSinceBoot:", v3);

}

@end
