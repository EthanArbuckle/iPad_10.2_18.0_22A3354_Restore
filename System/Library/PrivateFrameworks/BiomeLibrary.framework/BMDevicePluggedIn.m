@implementation BMDevicePluggedIn

- (BMDevicePluggedIn)initWithStarting:(id)a3 wireless:(id)a4 adapterType:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMDevicePluggedIn *v11;
  uint64_t v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMDevicePluggedIn;
  v11 = -[BMEventBase init](&v14, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v8)
    {
      v11->_hasStarting = 1;
      v11->_starting = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      v11->_hasStarting = 0;
      v11->_starting = 0;
    }
    if (v9)
    {
      v11->_hasWireless = 1;
      v11->_wireless = objc_msgSend(v9, "BOOLValue");
    }
    else
    {
      v11->_hasWireless = 0;
      v11->_wireless = 0;
    }
    if (v10)
    {
      v11->_hasAdapterType = 1;
      v12 = objc_msgSend(v10, "longLongValue");
    }
    else
    {
      v11->_hasAdapterType = 0;
      v12 = -1;
    }
    v11->_adapterType = v12;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDevicePluggedIn starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDevicePluggedIn wireless](self, "wireless"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMDevicePluggedIn adapterType](self, "adapterType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDevicePluggedIn with starting: %@, wireless: %@, adapterType: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDevicePluggedIn *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  BOOL v38;
  uint64_t v39;
  BMDevicePluggedIn *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMDevicePluggedIn;
  v5 = -[BMEventBase init](&v42, sel_init);
  if (!v5)
    goto LABEL_61;
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
        break;
      v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v26 = 0;
        v27 = 0;
        v28 = 0;
        v5->_hasAdapterType = 1;
        while (1)
        {
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
            break;
          v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
          *(_QWORD *)&v4[v29] = v30 + 1;
          v28 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0)
            goto LABEL_50;
          v26 += 7;
          v16 = v27++ >= 9;
          if (v16)
          {
            v28 = 0;
            goto LABEL_52;
          }
        }
        v4[*v8] = 1;
LABEL_50:
        if (v4[*v8])
          v28 = 0;
LABEL_52:
        v5->_adapterType = v28;
      }
      else
      {
        if ((_DWORD)v19 == 2)
        {
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v5->_hasWireless = 1;
          while (1)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v7])
              break;
            v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
            *(_QWORD *)&v4[v35] = v36 + 1;
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if ((v37 & 0x80) == 0)
              goto LABEL_54;
            v32 += 7;
            v16 = v33++ >= 9;
            if (v16)
            {
              v34 = 0;
              goto LABEL_56;
            }
          }
          v4[*v8] = 1;
LABEL_54:
          if (v4[*v8])
            v34 = 0;
LABEL_56:
          v38 = v34 != 0;
          v39 = 18;
        }
        else
        {
          if ((_DWORD)v19 != 1)
          {
            if (!PBReaderSkipValueWithTag())
              goto LABEL_60;
            continue;
          }
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasStarting = 1;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            if (v24 == -1 || v24 >= *(_QWORD *)&v4[*v7])
              break;
            v25 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0)
              goto LABEL_46;
            v20 += 7;
            v16 = v21++ >= 9;
            if (v16)
            {
              v22 = 0;
              goto LABEL_48;
            }
          }
          v4[*v8] = 1;
LABEL_46:
          if (v4[*v8])
            v22 = 0;
LABEL_48:
          v38 = v22 != 0;
          v39 = 16;
        }
        *((_BYTE *)&v5->super.super.isa + v39) = v38;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_60:
    v40 = 0;
  else
LABEL_61:
    v40 = v5;

  return v40;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasWireless)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasAdapterType)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDevicePluggedIn writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDevicePluggedIn)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMDevicePluggedIn *v13;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wireless"));
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
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("wireless"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("adapterType"));
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
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("adapterType"));
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
    self = -[BMDevicePluggedIn initWithStarting:wireless:adapterType:](self, "initWithStarting:wireless:adapterType:", v8, v10, v12);
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
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
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
  if (-[BMDevicePluggedIn hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDevicePluggedIn starting](self, "starting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMDevicePluggedIn hasWireless](self, "hasWireless"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDevicePluggedIn wireless](self, "wireless"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMDevicePluggedIn hasAdapterType](self, "hasAdapterType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMDevicePluggedIn adapterType](self, "adapterType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v11[0] = CFSTR("starting");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("wireless");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("adapterType");
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
  int v6;
  int v7;
  int64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMDevicePluggedIn hasStarting](self, "hasStarting") || objc_msgSend(v5, "hasStarting"))
    {
      if (!-[BMDevicePluggedIn hasStarting](self, "hasStarting"))
        goto LABEL_18;
      if (!objc_msgSend(v5, "hasStarting"))
        goto LABEL_18;
      v6 = -[BMDevicePluggedIn starting](self, "starting");
      if (v6 != objc_msgSend(v5, "starting"))
        goto LABEL_18;
    }
    if (-[BMDevicePluggedIn hasWireless](self, "hasWireless") || objc_msgSend(v5, "hasWireless"))
    {
      if (!-[BMDevicePluggedIn hasWireless](self, "hasWireless"))
        goto LABEL_18;
      if (!objc_msgSend(v5, "hasWireless"))
        goto LABEL_18;
      v7 = -[BMDevicePluggedIn wireless](self, "wireless");
      if (v7 != objc_msgSend(v5, "wireless"))
        goto LABEL_18;
    }
    if (!-[BMDevicePluggedIn hasAdapterType](self, "hasAdapterType")
      && !objc_msgSend(v5, "hasAdapterType"))
    {
      v9 = 1;
      goto LABEL_19;
    }
    if (-[BMDevicePluggedIn hasAdapterType](self, "hasAdapterType") && objc_msgSend(v5, "hasAdapterType"))
    {
      v8 = -[BMDevicePluggedIn adapterType](self, "adapterType");
      v9 = v8 == objc_msgSend(v5, "adapterType");
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

- (BOOL)starting
{
  return self->_starting;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (BOOL)wireless
{
  return self->_wireless;
}

- (BOOL)hasWireless
{
  return self->_hasWireless;
}

- (void)setHasWireless:(BOOL)a3
{
  self->_hasWireless = a3;
}

- (int64_t)adapterType
{
  return self->_adapterType;
}

- (BOOL)hasAdapterType
{
  return self->_hasAdapterType;
}

- (void)setHasAdapterType:(BOOL)a3
{
  self->_hasAdapterType = a3;
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

    v4 = -[BMDevicePluggedIn initByReadFrom:]([BMDevicePluggedIn alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("wireless"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("adapterType"), 0, 0, 3, 3, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F360;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("wireless"), 2, 12, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("adapterType"), 3, 3, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
