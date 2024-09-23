@implementation BMSystemSettingsAppearanceSetup

- (BMSystemSettingsAppearanceSetup)initWithChoice:(id)a3 childSetup:(id)a4 childChoice:(id)a5 childAge:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMSystemSettingsAppearanceSetup *v15;
  unsigned int v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMSystemSettingsAppearanceSetup;
  v15 = -[BMEventBase init](&v18, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_choice, a3);
    if (v12)
    {
      v15->_hasChildSetup = 1;
      v15->_childSetup = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v15->_hasChildSetup = 0;
      v15->_childSetup = 0;
    }
    objc_storeStrong((id *)&v15->_childChoice, a5);
    if (v14)
    {
      v15->_hasChildAge = 1;
      v16 = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v16 = 0;
      v15->_hasChildAge = 0;
    }
    v15->_childAge = v16;
  }

  return v15;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSystemSettingsAppearanceSetup choice](self, "choice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsAppearanceSetup childSetup](self, "childSetup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSystemSettingsAppearanceSetup childChoice](self, "childChoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSystemSettingsAppearanceSetup childAge](self, "childAge"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSystemSettingsAppearanceSetup with choice: %@, childSetup: %@, childChoice: %@, childAge: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSystemSettingsAppearanceSetup *v5;
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
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  BMSystemSettingsAppearanceSetup *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSystemSettingsAppearanceSetup;
  v5 = -[BMEventBase init](&v36, sel_init);
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
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_31;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          v5->_hasChildSetup = 1;
          while (2)
          {
            v24 = *v6;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
              *(_QWORD *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  v23 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v23 = 0;
LABEL_42:
          v5->_childSetup = v23 != 0;
          continue;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
LABEL_31:
          v27 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 4u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasChildAge = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_49;
          continue;
      }
      while (1)
      {
        v31 = *v6;
        v32 = *(_QWORD *)&v4[v31];
        if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
          break;
        v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
        *(_QWORD *)&v4[v31] = v32 + 1;
        v30 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0)
          goto LABEL_44;
        v28 += 7;
        v16 = v29++ >= 9;
        if (v16)
        {
          LODWORD(v30) = 0;
          goto LABEL_46;
        }
      }
      v4[*v8] = 1;
LABEL_44:
      if (v4[*v8])
        LODWORD(v30) = 0;
LABEL_46:
      v5->_childAge = v30;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_49:
    v34 = 0;
  else
LABEL_50:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_choice)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasChildSetup)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_childChoice)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasChildAge)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSystemSettingsAppearanceSetup writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSystemSettingsAppearanceSetup)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMSystemSettingsAppearanceSetup *v11;
  id v12;
  void *v13;
  id v14;
  BMSystemSettingsAppearanceSetup *v15;
  id v17;
  uint64_t v18;
  id *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id *v28;
  id v29;
  id *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("choice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("childSetup"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_16;
        }
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0D025B8];
        v36 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("childSetup"));
        v37 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        *a4 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v10);
        a4 = 0;
        goto LABEL_15;
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("childChoice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v30;
          goto LABEL_15;
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = a4;
        v23 = *MEMORY[0x1E0D025B8];
        v34 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("childChoice"));
        v35 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v13);
        v15 = 0;
        v12 = 0;
        a4 = v30;
        *v28 = v24;
        goto LABEL_14;
      }
      v12 = v10;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("childAge"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v27 = *MEMORY[0x1E0D025B8];
          v32 = *MEMORY[0x1E0CB2D50];
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("childAge"));
          v33 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v27, 2, v26);

        }
        v14 = 0;
        v15 = 0;
        a4 = v30;
        goto LABEL_14;
      }
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    a4 = v30;
    v15 = -[BMSystemSettingsAppearanceSetup initWithChoice:childSetup:childChoice:childAge:](v11, "initWithChoice:childSetup:childChoice:childAge:", v8, v30, v12, v14);
    v11 = v15;
LABEL_14:

    self = v11;
LABEL_15:

    v7 = v31;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    v8 = 0;
    goto LABEL_17;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = *MEMORY[0x1E0D025B8];
  v38 = *MEMORY[0x1E0CB2D50];
  v19 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("choice"));
  v39[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v9);
  a4 = v19;
LABEL_16:

LABEL_17:
  return v15;
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
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  -[BMSystemSettingsAppearanceSetup choice](self, "choice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSystemSettingsAppearanceSetup hasChildSetup](self, "hasChildSetup"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsAppearanceSetup childSetup](self, "childSetup"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[BMSystemSettingsAppearanceSetup childChoice](self, "childChoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSystemSettingsAppearanceSetup hasChildAge](self, "hasChildAge"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSystemSettingsAppearanceSetup childAge](self, "childAge"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v13[0] = CFSTR("choice");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("childSetup");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("childChoice");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("childAge");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_17;
  }
  else
  {

    if (v5)
    {
LABEL_17:
      if (v4)
        goto LABEL_18;
LABEL_22:

      if (v3)
        goto LABEL_19;
LABEL_23:

      goto LABEL_19;
    }
  }

  if (!v4)
    goto LABEL_22;
LABEL_18:
  if (!v3)
    goto LABEL_23;
LABEL_19:

  return v11;
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
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  unsigned int v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSystemSettingsAppearanceSetup choice](self, "choice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "choice");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSystemSettingsAppearanceSetup choice](self, "choice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "choice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    if (-[BMSystemSettingsAppearanceSetup hasChildSetup](self, "hasChildSetup")
      || objc_msgSend(v5, "hasChildSetup"))
    {
      if (!-[BMSystemSettingsAppearanceSetup hasChildSetup](self, "hasChildSetup"))
        goto LABEL_21;
      if (!objc_msgSend(v5, "hasChildSetup"))
        goto LABEL_21;
      v13 = -[BMSystemSettingsAppearanceSetup childSetup](self, "childSetup");
      if (v13 != objc_msgSend(v5, "childSetup"))
        goto LABEL_21;
    }
    -[BMSystemSettingsAppearanceSetup childChoice](self, "childChoice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childChoice");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMSystemSettingsAppearanceSetup childChoice](self, "childChoice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "childChoice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_21;
    }
    if (!-[BMSystemSettingsAppearanceSetup hasChildAge](self, "hasChildAge")
      && !objc_msgSend(v5, "hasChildAge"))
    {
      v12 = 1;
      goto LABEL_22;
    }
    if (-[BMSystemSettingsAppearanceSetup hasChildAge](self, "hasChildAge")
      && objc_msgSend(v5, "hasChildAge"))
    {
      v20 = -[BMSystemSettingsAppearanceSetup childAge](self, "childAge");
      v12 = v20 == objc_msgSend(v5, "childAge");
LABEL_22:

      goto LABEL_23;
    }
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)choice
{
  return self->_choice;
}

- (BOOL)childSetup
{
  return self->_childSetup;
}

- (BOOL)hasChildSetup
{
  return self->_hasChildSetup;
}

- (void)setHasChildSetup:(BOOL)a3
{
  self->_hasChildSetup = a3;
}

- (NSString)childChoice
{
  return self->_childChoice;
}

- (unsigned)childAge
{
  return self->_childAge;
}

- (BOOL)hasChildAge
{
  return self->_hasChildAge;
}

- (void)setHasChildAge:(BOOL)a3
{
  self->_hasChildAge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childChoice, 0);
  objc_storeStrong((id *)&self->_choice, 0);
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

    v4 = -[BMSystemSettingsAppearanceSetup initByReadFrom:]([BMSystemSettingsAppearanceSetup alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("choice"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("childSetup"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("childChoice"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("childAge"), 0, 0, 4, 4, 0);
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
  return &unk_1E5F1BEF8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("choice"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("childSetup"), 2, 12, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("childChoice"), 3, 13, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("childAge"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
