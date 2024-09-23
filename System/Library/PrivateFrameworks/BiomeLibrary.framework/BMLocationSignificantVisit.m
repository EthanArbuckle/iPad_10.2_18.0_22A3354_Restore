@implementation BMLocationSignificantVisit

- (BMLocationSignificantVisit)initWithType:(int)a3 identifier:(id)a4
{
  id v7;
  BMLocationSignificantVisit *v8;
  objc_super v10;

  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BMLocationSignificantVisit;
  v8 = -[BMEventBase init](&v10, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_identifier, a4);
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
  BMLocationSignificantVisitTypeAsString(-[BMLocationSignificantVisit type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationSignificantVisit identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLocationSignificantVisit with type: %@, identifier: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLocationSignificantVisit *v5;
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  NSString *identifier;
  BMLocationSignificantVisit *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMLocationSignificantVisit;
  v5 = -[BMEventBase init](&v29, sel_init);
  if (!v5)
    goto LABEL_40;
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
      if ((v12 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        identifier = v5->_identifier;
        v5->_identifier = (NSString *)v25;

      }
      else if ((v12 >> 3) == 1)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        while (1)
        {
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
            break;
          v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
          *(_QWORD *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_32;
          v19 += 7;
          v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_34;
          }
        }
        v4[*v8] = 1;
LABEL_32:
        if (v4[*v8])
          LODWORD(v21) = 0;
LABEL_34:
        if (v21 >= 5)
          LODWORD(v21) = 0;
        v5->_type = v21;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_39;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_39:
    v27 = 0;
  else
LABEL_40:
    v27 = v5;

  return v27;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_identifier)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLocationSignificantVisit writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLocationSignificantVisit)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  BMLocationSignificantVisit *v12;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
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
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
        v24[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v10);
        v8 = 0;
        v12 = 0;
        *a4 = v20;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationSignificantVisitTypeFromString(v7));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
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
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
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
  self = -[BMLocationSignificantVisit initWithType:identifier:](self, "initWithType:identifier:", objc_msgSend(v8, "intValue"), v11);
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationSignificantVisit type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationSignificantVisit identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("type");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("identifier");
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
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_9;
LABEL_7:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMLocationSignificantVisit type](self, "type");
    if (v6 == objc_msgSend(v5, "type"))
    {
      -[BMLocationSignificantVisit identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        v11 = 1;
      }
      else
      {
        -[BMLocationSignificantVisit identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMLocationSignificantVisit initByReadFrom:]([BMLocationSignificantVisit alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 2, 13, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F390;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 1, 4, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 2, 13, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
