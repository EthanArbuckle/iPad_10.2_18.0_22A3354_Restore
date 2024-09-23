@implementation BMHealthMedicationsAddedMed

- (BMHealthMedicationsAddedMed)initWithMedicationName:(id)a3
{
  id v5;
  BMHealthMedicationsAddedMed *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMHealthMedicationsAddedMed;
  v6 = -[BMEventBase init](&v8, sel_init);
  if (v6)
  {
    v6->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v6->_medicationName, a3);
  }

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMHealthMedicationsAddedMed medicationName](self, "medicationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMHealthMedicationsAddedMed with medicationName: %@"), v4);

  return (NSString *)v5;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMHealthMedicationsAddedMed *v5;
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
  uint64_t v19;
  NSString *medicationName;
  BMHealthMedicationsAddedMed *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BMHealthMedicationsAddedMed;
  v5 = -[BMEventBase init](&v23, sel_init);
  if (!v5)
    goto LABEL_25;
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
      if ((v12 >> 3) == 1)
      {
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        medicationName = v5->_medicationName;
        v5->_medicationName = (NSString *)v19;

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_24;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_24:
    v21 = 0;
  else
LABEL_25:
    v21 = v5;

  return v21;
}

- (void)writeTo:(id)a3
{
  if (self->_medicationName)
    PBDataWriterWriteStringField();
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMHealthMedicationsAddedMed writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMHealthMedicationsAddedMed)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  BMHealthMedicationsAddedMed *v8;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("medicationName"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7
    && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("medication_name")),
        (v7 = (id)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_7:
    self = -[BMHealthMedicationsAddedMed initWithMedicationName:](self, "initWithMedicationName:", a4);
    v8 = self;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v7;
    a4 = (id *)v7;
    goto LABEL_7;
  }
  if (a4)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0D025B8];
    v14 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("medicationName"));
    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 2, v13);

    v8 = 0;
    a4 = 0;
  }
  else
  {
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)jsonDictionary
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[BMHealthMedicationsAddedMed medicationName](self, "medicationName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v8 = CFSTR("medicationName");
  if (v3)
  {
    v9 = CFSTR("medication_name");
    v10[0] = v3;
    v5 = (void *)v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("medication_name");
    v10[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMHealthMedicationsAddedMed medicationName](self, "medicationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medicationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[BMHealthMedicationsAddedMed medicationName](self, "medicationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "medicationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)medicationName
{
  return self->_medicationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicationName, 0);
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

    v4 = -[BMHealthMedicationsAddedMed initByReadFrom:]([BMHealthMedicationsAddedMed alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("medicationName"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("medication_name"), 2, 0, 1, 13, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DE90;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("medicationName"), 1, 13, 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
