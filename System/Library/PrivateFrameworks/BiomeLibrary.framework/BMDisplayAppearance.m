@implementation BMDisplayAppearance

- (BMDisplayAppearance)initWithState:(int)a3 reason:(int)a4
{
  BMDisplayAppearance *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMDisplayAppearance;
  v6 = -[BMEventBase init](&v8, sel_init);
  if (v6)
  {
    v6->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v6->_state = a3;
    v6->_reason = a4;
  }
  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMDisplayAppearanceStateAsString(-[BMDisplayAppearance state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMDisplayAppearanceReasonAsString(-[BMDisplayAppearance reason](self, "reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDisplayAppearance with state: %@, reason: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDisplayAppearance *v5;
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  int *v30;
  BMDisplayAppearance *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMDisplayAppearance;
  v5 = -[BMEventBase init](&v33, sel_init);
  if (!v5)
    goto LABEL_53;
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
      if ((v12 >> 3) == 1)
      {
        v25 = 0;
        v26 = 0;
        v21 = 0;
        while (1)
        {
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          if (v28 == -1 || v28 >= *(_QWORD *)&v4[*v7])
            break;
          v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v28);
          *(_QWORD *)&v4[v27] = v28 + 1;
          v21 |= (unint64_t)(v29 & 0x7F) << v25;
          if ((v29 & 0x80) == 0)
            goto LABEL_44;
          v25 += 7;
          v16 = v26++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_46;
          }
        }
        v4[*v8] = 1;
LABEL_44:
        if (v4[*v8])
          LODWORD(v21) = 0;
LABEL_46:
        if (v21 >= 3)
          LODWORD(v21) = 0;
        v30 = &OBJC_IVAR___BMDisplayAppearance__state;
      }
      else
      {
        if ((v12 >> 3) != 2)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_52;
          continue;
        }
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
            goto LABEL_38;
          v19 += 7;
          v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8])
          LODWORD(v21) = 0;
LABEL_40:
        if (v21 >= 5)
          LODWORD(v21) = 0;
        v30 = &OBJC_IVAR___BMDisplayAppearance__reason;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + *v30) = v21;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_52:
    v31 = 0;
  else
LABEL_53:
    v31 = v5;

  return v31;
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDisplayAppearance writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDisplayAppearance)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  BMDisplayAppearance *v13;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
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
          v13 = 0;
          goto LABEL_19;
        }
        v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v16 = *MEMORY[0x1E0D025B8];
        v24 = *MEMORY[0x1E0CB2D50];
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("state"));
        v25[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v10);
        v8 = 0;
        v13 = 0;
        *a4 = v17;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDisplayAppearanceStateFromString(v7));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v19 = *MEMORY[0x1E0D025B8];
          v22 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("reason"));
          v23 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v21);

        }
        v11 = 0;
        v13 = 0;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDisplayAppearanceReasonFromString(v10));
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v12;
  }
  else
  {
    v11 = 0;
  }
  self = -[BMDisplayAppearance initWithState:reason:](self, "initWithState:reason:", objc_msgSend(v8, "intValue"), objc_msgSend(v11, "intValue"));
  v13 = self;
LABEL_18:

LABEL_19:
  return v13;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDisplayAppearance state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDisplayAppearance reason](self, "reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("state");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("reason");
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
  int v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMDisplayAppearance state](self, "state");
    if (v6 == objc_msgSend(v5, "state"))
    {
      v7 = -[BMDisplayAppearance reason](self, "reason");
      v8 = v7 == objc_msgSend(v5, "reason");
    }
    else
    {
      v8 = 0;
    }

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

- (int)state
{
  return self->_state;
}

- (int)reason
{
  return self->_reason;
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

    v4 = -[BMDisplayAppearance initByReadFrom:]([BMDisplayAppearance alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("state"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reason"), 0, 0, 2, 4, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1BA30;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("state"), 1, 4, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reason"), 2, 4, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
