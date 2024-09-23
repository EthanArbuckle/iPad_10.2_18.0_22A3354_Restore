@implementation BMDeviceBatteryLevel

- (BMDeviceBatteryLevel)initWithBatteryPercentage:(id)a3 fullyCharged:(id)a4
{
  id v6;
  id v7;
  BMDeviceBatteryLevel *v8;
  double v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMDeviceBatteryLevel;
  v8 = -[BMEventBase init](&v11, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v8->_hasBatteryPercentage = 1;
      objc_msgSend(v6, "doubleValue");
    }
    else
    {
      v8->_hasBatteryPercentage = 0;
      v9 = -1.0;
    }
    v8->_batteryPercentage = v9;
    if (v7)
    {
      v8->_hasFullyCharged = 1;
      v8->_fullyCharged = objc_msgSend(v7, "BOOLValue");
    }
    else
    {
      v8->_hasFullyCharged = 0;
      v8->_fullyCharged = 0;
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
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMDeviceBatteryLevel batteryPercentage](self, "batteryPercentage");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBatteryLevel fullyCharged](self, "fullyCharged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceBatteryLevel with batteryPercentage: %@, fullyCharged: %@"), v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceBatteryLevel *v5;
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
  uint64_t v20;
  unint64_t v21;
  double v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  BMDeviceBatteryLevel *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMDeviceBatteryLevel;
  v5 = -[BMEventBase init](&v32, sel_init);
  if (!v5)
    goto LABEL_42;
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
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v5->_hasFullyCharged = 1;
        while (1)
        {
          v26 = *v6;
          v27 = *(_QWORD *)&v4[v26];
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
            break;
          v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
          *(_QWORD *)&v4[v26] = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0)
            goto LABEL_34;
          v23 += 7;
          v17 = v24++ >= 9;
          if (v17)
          {
            v25 = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8])
          v25 = 0;
LABEL_36:
        v5->_fullyCharged = v25 != 0;
      }
      else if ((v12 >> 3) == 1)
      {
        v5->_hasBatteryPercentage = 1;
        v20 = *v6;
        v21 = *(_QWORD *)&v4[v20];
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v22 = *(double *)(*(_QWORD *)&v4[*v9] + v21);
          *(_QWORD *)&v4[v20] = v21 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v22 = 0.0;
        }
        v5->_batteryPercentage = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_41;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_41:
    v30 = 0;
  else
LABEL_42:
    v30 = v5;

  return v30;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasBatteryPercentage)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasFullyCharged)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceBatteryLevel writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceBatteryLevel)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMDeviceBatteryLevel *v11;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("batteryPercentage"));
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
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("batteryPercentage"));
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullyCharged"));
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
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("fullyCharged"));
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
  self = -[BMDeviceBatteryLevel initWithBatteryPercentage:fullyCharged:](self, "initWithBatteryPercentage:fullyCharged:", v8, v10);
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)jsonDictionary
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (!-[BMDeviceBatteryLevel hasBatteryPercentage](self, "hasBatteryPercentage")
    || (-[BMDeviceBatteryLevel batteryPercentage](self, "batteryPercentage"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMDeviceBatteryLevel batteryPercentage](self, "batteryPercentage");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMDeviceBatteryLevel batteryPercentage](self, "batteryPercentage");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[BMDeviceBatteryLevel hasFullyCharged](self, "hasFullyCharged"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBatteryLevel fullyCharged](self, "fullyCharged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v11[0] = CFSTR("batteryPercentage");
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = CFSTR("fullyCharged");
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

    if (v5)
      goto LABEL_14;
LABEL_16:

    goto LABEL_14;
  }
  if (!v5)
    goto LABEL_16;
LABEL_14:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  int v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMDeviceBatteryLevel hasBatteryPercentage](self, "hasBatteryPercentage")
      || objc_msgSend(v5, "hasBatteryPercentage"))
    {
      if (!-[BMDeviceBatteryLevel hasBatteryPercentage](self, "hasBatteryPercentage"))
        goto LABEL_13;
      if (!objc_msgSend(v5, "hasBatteryPercentage"))
        goto LABEL_13;
      -[BMDeviceBatteryLevel batteryPercentage](self, "batteryPercentage");
      v7 = v6;
      objc_msgSend(v5, "batteryPercentage");
      if (v7 != v8)
        goto LABEL_13;
    }
    if (!-[BMDeviceBatteryLevel hasFullyCharged](self, "hasFullyCharged")
      && !objc_msgSend(v5, "hasFullyCharged"))
    {
      LOBYTE(v10) = 1;
      goto LABEL_14;
    }
    if (-[BMDeviceBatteryLevel hasFullyCharged](self, "hasFullyCharged")
      && objc_msgSend(v5, "hasFullyCharged"))
    {
      v9 = -[BMDeviceBatteryLevel fullyCharged](self, "fullyCharged");
      v10 = v9 ^ objc_msgSend(v5, "fullyCharged") ^ 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v10) = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  LOBYTE(v10) = 0;
LABEL_15:

  return v10;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)batteryPercentage
{
  return self->_batteryPercentage;
}

- (BOOL)hasBatteryPercentage
{
  return self->_hasBatteryPercentage;
}

- (void)setHasBatteryPercentage:(BOOL)a3
{
  self->_hasBatteryPercentage = a3;
}

- (BOOL)fullyCharged
{
  return self->_fullyCharged;
}

- (BOOL)hasFullyCharged
{
  return self->_hasFullyCharged;
}

- (void)setHasFullyCharged:(BOOL)a3
{
  self->_hasFullyCharged = a3;
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

    v4 = -[BMDeviceBatteryLevel initByReadFrom:]([BMDeviceBatteryLevel alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("batteryPercentage"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fullyCharged"), 0, 0, 2, 12, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CF78;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("batteryPercentage"), 1, 0, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fullyCharged"), 2, 12, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
