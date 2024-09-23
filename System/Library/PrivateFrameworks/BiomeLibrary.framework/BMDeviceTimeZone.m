@implementation BMDeviceTimeZone

- (BMDeviceTimeZone)initWithSecondsFromGMT:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  BMDeviceTimeZone *v8;
  double v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMDeviceTimeZone;
  v8 = -[BMEventBase init](&v11, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v8->_hasSecondsFromGMT = 1;
      objc_msgSend(v6, "doubleValue");
    }
    else
    {
      v8->_hasSecondsFromGMT = 0;
      v9 = -1.0;
    }
    v8->_secondsFromGMT = v9;
    objc_storeStrong((id *)&v8->_name, a4);
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
  -[BMDeviceTimeZone secondsFromGMT](self, "secondsFromGMT");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceTimeZone name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceTimeZone with secondsFromGMT: %@, name: %@"), v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceTimeZone *v5;
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
  uint64_t v20;
  unint64_t v21;
  double v22;
  uint64_t v23;
  NSString *name;
  BMDeviceTimeZone *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMDeviceTimeZone;
  v5 = -[BMEventBase init](&v27, sel_init);
  if (!v5)
    goto LABEL_32;
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
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        name = v5->_name;
        v5->_name = (NSString *)v23;

      }
      else if ((v12 >> 3) == 1)
      {
        v5->_hasSecondsFromGMT = 1;
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
        v5->_secondsFromGMT = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_31;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_31:
    v25 = 0;
  else
LABEL_32:
    v25 = v5;

  return v25;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasSecondsFromGMT)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_name)
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
  -[BMDeviceTimeZone writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceTimeZone)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMDeviceTimeZone *v11;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("secondsFromGMT"));
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
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("secondsFromGMT"));
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
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
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
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
  self = -[BMDeviceTimeZone initWithSecondsFromGMT:name:](self, "initWithSecondsFromGMT:name:", v8, v10);
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
  if (!-[BMDeviceTimeZone hasSecondsFromGMT](self, "hasSecondsFromGMT")
    || (-[BMDeviceTimeZone secondsFromGMT](self, "secondsFromGMT"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMDeviceTimeZone secondsFromGMT](self, "secondsFromGMT");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMDeviceTimeZone secondsFromGMT](self, "secondsFromGMT");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMDeviceTimeZone name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("secondsFromGMT");
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = CFSTR("name");
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
      goto LABEL_11;
LABEL_13:

    goto LABEL_11;
  }
  if (!v5)
    goto LABEL_13;
LABEL_11:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!-[BMDeviceTimeZone hasSecondsFromGMT](self, "hasSecondsFromGMT")
      && !objc_msgSend(v5, "hasSecondsFromGMT")
      || -[BMDeviceTimeZone hasSecondsFromGMT](self, "hasSecondsFromGMT")
      && objc_msgSend(v5, "hasSecondsFromGMT")
      && (-[BMDeviceTimeZone secondsFromGMT](self, "secondsFromGMT"),
          v7 = v6,
          objc_msgSend(v5, "secondsFromGMT"),
          v7 == v8))
    {
      -[BMDeviceTimeZone name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
      {
        v13 = 1;
      }
      else
      {
        -[BMDeviceTimeZone name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)secondsFromGMT
{
  return self->_secondsFromGMT;
}

- (BOOL)hasSecondsFromGMT
{
  return self->_hasSecondsFromGMT;
}

- (void)setHasSecondsFromGMT:(BOOL)a3
{
  self->_hasSecondsFromGMT = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
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

    v4 = -[BMDeviceTimeZone initByReadFrom:]([BMDeviceTimeZone alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("secondsFromGMT"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 2, 13, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C108;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("secondsFromGMT"), 1, 0, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 2, 13, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)timeZone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  -[BMDeviceTimeZone name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E80];
    -[BMDeviceTimeZone name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeZoneWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[BMDeviceTimeZone hasSecondsFromGMT](self, "hasSecondsFromGMT"))
  {
    v7 = (void *)MEMORY[0x1E0C99E80];
    -[BMDeviceTimeZone secondsFromGMT](self, "secondsFromGMT");
    objc_msgSend(v7, "timeZoneForSecondsFromGMT:", (uint64_t)v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BMDeviceTimeZone)initWithSecondsFromGMT:(id)a3
{
  return -[BMDeviceTimeZone initWithSecondsFromGMT:name:](self, "initWithSecondsFromGMT:name:", a3, 0);
}

@end
