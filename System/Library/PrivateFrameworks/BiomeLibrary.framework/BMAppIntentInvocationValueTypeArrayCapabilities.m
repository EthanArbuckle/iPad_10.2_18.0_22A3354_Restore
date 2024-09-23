@implementation BMAppIntentInvocationValueTypeArrayCapabilities

- (BMAppIntentInvocationValueTypeArrayCapabilities)initWithValue:(int)a3
{
  BMAppIntentInvocationValueTypeArrayCapabilities *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMAppIntentInvocationValueTypeArrayCapabilities;
  v4 = -[BMEventBase init](&v6, sel_init);
  if (v4)
  {
    v4->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v4->_value = a3;
  }
  return v4;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMAppIntentInvocationValueTypeArrayCapabilitiesCapabilitiesValueAsString(-[BMAppIntentInvocationValueTypeArrayCapabilities value](self, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppIntentInvocationValueTypeArrayCapabilities with value: %@"), v4);

  return (NSString *)v5;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntentInvocationValueTypeArrayCapabilities *v5;
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
  BMAppIntentInvocationValueTypeArrayCapabilities *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMAppIntentInvocationValueTypeArrayCapabilities;
  v5 = -[BMEventBase init](&v29, sel_init);
  if (!v5)
    goto LABEL_38;
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
      if ((v12 >> 3) == 1)
      {
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
            goto LABEL_30;
          v20 += 7;
          v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_32;
          }
        }
        v4[*v8] = 1;
LABEL_30:
        if (v4[*v8])
          LODWORD(v22) = 0;
LABEL_32:
        if (v22 >= 3)
          LODWORD(v22) = 0;
        v5->_value = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_37;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_37:
    v27 = 0;
  else
LABEL_38:
    v27 = v5;

  return v27;
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppIntentInvocationValueTypeArrayCapabilities writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntentInvocationValueTypeArrayCapabilities)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  id *v7;
  BMAppIntentInvocationValueTypeArrayCapabilities *v8;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_9:
    self = -[BMAppIntentInvocationValueTypeArrayCapabilities initWithValue:](self, "initWithValue:", objc_msgSend(a4, "intValue"));
    v8 = self;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
LABEL_8:
    a4 = v7;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentInvocationValueTypeArrayCapabilitiesCapabilitiesValueFromString(v6));
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a4)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0D025B8];
    v14 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("value"));
    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 2, v13);

    a4 = 0;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)jsonDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntentInvocationValueTypeArrayCapabilities value](self, "value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("value");
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMAppIntentInvocationValueTypeArrayCapabilities value](self, "value");
    v7 = objc_msgSend(v5, "value");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)value
{
  return self->_value;
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

    v4 = -[BMAppIntentInvocationValueTypeArrayCapabilities initByReadFrom:]([BMAppIntentInvocationValueTypeArrayCapabilities alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("value"), 0, 0, 1, 4, 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CB58;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value"), 1, 4, 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
