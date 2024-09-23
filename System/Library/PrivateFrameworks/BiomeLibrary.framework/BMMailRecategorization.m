@implementation BMMailRecategorization

- (BMMailRecategorization)initWithCategory:(int)a3 previous:(int)a4 scope:(int)a5 sender:(id)a6 domain:(id)a7 language:(id)a8
{
  id v15;
  id v16;
  id v17;
  BMMailRecategorization *v18;
  objc_super v20;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BMMailRecategorization;
  v18 = -[BMEventBase init](&v20, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v18->_category = a3;
    v18->_previous = a4;
    v18->_scope = a5;
    objc_storeStrong((id *)&v18->_sender, a6);
    objc_storeStrong((id *)&v18->_domain, a7);
    objc_storeStrong((id *)&v18->_language, a8);
  }

  return v18;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMMailRecategorizationCategoryAsString(-[BMMailRecategorization category](self, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMailRecategorizationCategoryAsString(-[BMMailRecategorization previous](self, "previous"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMMailRecategorizationScopeAsString(-[BMMailRecategorization scope](self, "scope"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailRecategorization sender](self, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailRecategorization domain](self, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailRecategorization language](self, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMailRecategorization with category: %@, previous: %@, scope: %@, sender: %@, domain: %@, language: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMailRecategorization *v5;
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
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  BMMailRecategorization *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMMailRecategorization;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_69;
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
              goto LABEL_48;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_50;
            }
          }
          v4[*v8] = 1;
LABEL_48:
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_50:
          if (v21 >= 7)
            LODWORD(v21) = 0;
          v38 = 20;
          goto LABEL_65;
        case 2u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          while (2)
          {
            v27 = *v6;
            v28 = *(_QWORD *)&v4[v27];
            if (v28 == -1 || v28 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v28);
              *(_QWORD *)&v4[v27] = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_56:
          if (v21 >= 7)
            LODWORD(v21) = 0;
          v38 = 24;
          goto LABEL_65;
        case 3u:
          v30 = 0;
          v31 = 0;
          v21 = 0;
          break;
        case 4u:
          PBReaderReadString();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = 32;
          goto LABEL_46;
        case 5u:
          PBReaderReadString();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = 40;
          goto LABEL_46;
        case 6u:
          PBReaderReadString();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = 48;
LABEL_46:
          v37 = *(Class *)((char *)&v5->super.super.isa + v36);
          *(Class *)((char *)&v5->super.super.isa + v36) = (Class)v35;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_68;
          continue;
      }
      while (1)
      {
        v32 = *v6;
        v33 = *(_QWORD *)&v4[v32];
        if (v33 == -1 || v33 >= *(_QWORD *)&v4[*v7])
          break;
        v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
        *(_QWORD *)&v4[v32] = v33 + 1;
        v21 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0)
          goto LABEL_60;
        v30 += 7;
        v16 = v31++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_62;
        }
      }
      v4[*v8] = 1;
LABEL_60:
      if (v4[*v8])
        LODWORD(v21) = 0;
LABEL_62:
      if (v21 >= 3)
        LODWORD(v21) = 0;
      v38 = 28;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v21;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_68:
    v39 = 0;
  else
LABEL_69:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_sender)
    PBDataWriterWriteStringField();
  if (self->_domain)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_language)
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
  -[BMMailRecategorization writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMailRecategorization)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  BMMailRecategorization *v18;
  BMMailRecategorization *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v41 = 0;
          v19 = 0;
          v18 = self;
          goto LABEL_54;
        }
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v54 = *MEMORY[0x1E0CB2D50];
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("category"));
        v55[0] = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        v19 = 0;
        *a4 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v8);
        goto LABEL_67;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMailRecategorizationCategoryFromString(v5));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v7;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previous"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
LABEL_16:
        v43 = v9;
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMailRecategorizationCategoryFromString(v8));
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if (a4)
      {
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = *MEMORY[0x1E0D025B8];
        v52 = *MEMORY[0x1E0CB2D50];
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("previous"));
        v53 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        v19 = 0;
        *a4 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 2, v10);
        goto LABEL_69;
      }
      v43 = 0;
      v19 = 0;
LABEL_67:
      v18 = self;
      goto LABEL_53;
    }
  }
  v43 = 0;
LABEL_17:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scope"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v8;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
LABEL_24:
        v42 = v11;
        goto LABEL_25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMailRecategorizationScopeFromString(v10));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      if (a4)
      {
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v50 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("scope"));
        v51 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        v19 = 0;
        *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v12);
        goto LABEL_62;
      }
      v42 = 0;
      v19 = 0;
LABEL_69:
      v18 = self;
      goto LABEL_52;
    }
  }
  v42 = 0;
LABEL_25:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sender"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v5;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        goto LABEL_28;
      }
      if (a4)
      {
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0D025B8];
        v48 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sender"));
        v49 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v14);
        v19 = 0;
        v13 = 0;
        *a4 = v22;
        goto LABEL_64;
      }
      v13 = 0;
      v19 = 0;
LABEL_62:
      v18 = self;
      goto LABEL_51;
    }
  }
  v13 = 0;
LABEL_28:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        goto LABEL_31;
      }
      if (a4)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v46 = *MEMORY[0x1E0CB2D50];
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domain"));
        v47 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v16);
        v19 = 0;
        v15 = 0;
        *a4 = v25;
        goto LABEL_48;
      }
      v15 = 0;
      v19 = 0;
LABEL_64:
      v18 = self;
      goto LABEL_50;
    }
  }
  v15 = 0;
LABEL_31:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("language"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        goto LABEL_34;
      }
      if (a4)
      {
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = *MEMORY[0x1E0D025B8];
        v44 = *MEMORY[0x1E0CB2D50];
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("language"));
        v45 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v35, 2, v27);

      }
      v17 = 0;
      v19 = 0;
LABEL_48:
      v18 = self;
      goto LABEL_49;
    }
  }
  v17 = 0;
LABEL_34:
  v18 = -[BMMailRecategorization initWithCategory:previous:scope:sender:domain:language:](self, "initWithCategory:previous:scope:sender:domain:language:", objc_msgSend(v6, "intValue"), objc_msgSend(v43, "intValue"), objc_msgSend(v42, "intValue"), v13, v15, v17);
  v19 = v18;
LABEL_49:

LABEL_50:
  v5 = v37;
LABEL_51:

  v8 = v39;
LABEL_52:

LABEL_53:
LABEL_54:

  return v19;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMailRecategorization category](self, "category"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMailRecategorization previous](self, "previous"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMailRecategorization scope](self, "scope"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailRecategorization sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailRecategorization domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMailRecategorization language](self, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("category");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = CFSTR("previous");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("scope");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("sender");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("domain");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("language");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_15;
LABEL_21:

    if (v6)
      goto LABEL_16;
    goto LABEL_22;
  }

  if (!v7)
    goto LABEL_21;
LABEL_15:
  if (v6)
    goto LABEL_16;
LABEL_22:

LABEL_16:
  if (v5)
  {
    if (v4)
      goto LABEL_18;
LABEL_24:

    if (v20)
      goto LABEL_19;
LABEL_25:

    goto LABEL_19;
  }

  if (!v4)
    goto LABEL_24;
LABEL_18:
  if (!v20)
    goto LABEL_25;
LABEL_19:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMMailRecategorization category](self, "category");
    if (v6 != objc_msgSend(v5, "category"))
      goto LABEL_12;
    v7 = -[BMMailRecategorization previous](self, "previous");
    if (v7 != objc_msgSend(v5, "previous"))
      goto LABEL_12;
    v8 = -[BMMailRecategorization scope](self, "scope");
    if (v8 != objc_msgSend(v5, "scope"))
      goto LABEL_12;
    -[BMMailRecategorization sender](self, "sender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sender");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      -[BMMailRecategorization sender](self, "sender");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sender");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_12;
    }
    -[BMMailRecategorization domain](self, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[BMMailRecategorization domain](self, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
      {
LABEL_12:
        v15 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    -[BMMailRecategorization language](self, "language");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "language");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 == v24)
    {
      v15 = 1;
    }
    else
    {
      -[BMMailRecategorization language](self, "language");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "language");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v25, "isEqual:", v26);

    }
    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)category
{
  return self->_category;
}

- (int)previous
{
  return self->_previous;
}

- (int)scope
{
  return self->_scope;
}

- (NSString)sender
{
  return self->_sender;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)language
{
  return self->_language;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_sender, 0);
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

    v4 = -[BMMailRecategorization initByReadFrom:]([BMMailRecategorization alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("category"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("previous"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("scope"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sender"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domain"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("language"), 2, 0, 6, 13, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D6C8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("category"), 1, 4, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("previous"), 2, 4, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("scope"), 3, 4, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sender"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domain"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("language"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
