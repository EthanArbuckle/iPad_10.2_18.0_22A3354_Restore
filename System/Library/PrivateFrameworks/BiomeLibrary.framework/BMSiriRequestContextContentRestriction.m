@implementation BMSiriRequestContextContentRestriction

- (BMSiriRequestContextContentRestriction)initWithAppRestriction:(id)a3 countryCode:(id)a4 movieRestriction:(id)a5 tvRestriction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMSiriRequestContextContentRestriction *v14;
  int v15;
  int v16;
  int v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMSiriRequestContextContentRestriction;
  v14 = -[BMEventBase init](&v19, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasAppRestriction = 1;
      v15 = objc_msgSend(v10, "intValue");
    }
    else
    {
      v14->_hasAppRestriction = 0;
      v15 = -1;
    }
    v14->_appRestriction = v15;
    objc_storeStrong((id *)&v14->_countryCode, a4);
    if (v12)
    {
      v14->_hasMovieRestriction = 1;
      v16 = objc_msgSend(v12, "intValue");
    }
    else
    {
      v14->_hasMovieRestriction = 0;
      v16 = -1;
    }
    v14->_movieRestriction = v16;
    if (v13)
    {
      v14->_hasTvRestriction = 1;
      v17 = objc_msgSend(v13, "intValue");
    }
    else
    {
      v14->_hasTvRestriction = 0;
      v17 = -1;
    }
    v14->_tvRestriction = v17;
  }

  return v14;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRequestContextContentRestriction appRestriction](self, "appRestriction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextContentRestriction countryCode](self, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRequestContextContentRestriction movieRestriction](self, "movieRestriction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRequestContextContentRestriction tvRestriction](self, "tvRestriction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriRequestContextContentRestriction with appRestriction: %@, countryCode: %@, movieRestriction: %@, tvRestriction: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRequestContextContentRestriction *v5;
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
  uint64_t v27;
  NSString *countryCode;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  BMSiriRequestContextContentRestriction *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMSiriRequestContextContentRestriction;
  v5 = -[BMEventBase init](&v44, sel_init);
  if (!v5)
    goto LABEL_60;
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
      switch((v12 >> 3))
      {
        case 1u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasAppRestriction = 1;
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
              goto LABEL_45;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_47:
          v41 = 24;
          goto LABEL_56;
        case 2u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          countryCode = v5->_countryCode;
          v5->_countryCode = (NSString *)v27;

          continue;
        case 3u:
          v29 = 0;
          v30 = 0;
          v22 = 0;
          v5->_hasMovieRestriction = 1;
          while (2)
          {
            v31 = *v6;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
              *(_QWORD *)&v4[v31] = v33;
              v22 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_51:
          v41 = 28;
          goto LABEL_56;
        case 4u:
          v35 = 0;
          v36 = 0;
          v22 = 0;
          v5->_hasTvRestriction = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_59;
          continue;
      }
      while (1)
      {
        v37 = *v6;
        v38 = *(_QWORD *)&v4[v37];
        v39 = v38 + 1;
        if (v38 == -1 || v39 > *(_QWORD *)&v4[*v7])
          break;
        v40 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
        *(_QWORD *)&v4[v37] = v39;
        v22 |= (unint64_t)(v40 & 0x7F) << v35;
        if ((v40 & 0x80) == 0)
          goto LABEL_53;
        v35 += 7;
        v17 = v36++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_55;
        }
      }
      v4[*v8] = 1;
LABEL_53:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_55:
      v41 = 32;
LABEL_56:
      *(_DWORD *)((char *)&v5->super.super.isa + v41) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_59:
    v42 = 0;
  else
LABEL_60:
    v42 = v5;

  return v42;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasAppRestriction)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasMovieRestriction)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasTvRestriction)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriRequestContextContentRestriction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRequestContextContentRestriction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMSiriRequestContextContentRestriction *v11;
  id v12;
  void *v13;
  id v14;
  BMSiriRequestContextContentRestriction *v15;
  id v16;
  uint64_t v17;
  id *v18;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  id v30;
  id *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appRestriction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = a4;
        v21 = *MEMORY[0x1E0D025B8];
        v37 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("countryCode"));
        v38 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2, v10);
        v15 = 0;
        a4 = 0;
        *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("movieRestriction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v35 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("movieRestriction"));
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v23, 2, v13);
        v15 = 0;
        v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      v12 = v10;
    }
    else
    {
      v11 = self;
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tvRestriction"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = -[BMSiriRequestContextContentRestriction initWithAppRestriction:countryCode:movieRestriction:tvRestriction:](v11, "initWithAppRestriction:countryCode:movieRestriction:tvRestriction:", v8, v31, v12, v14);
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v33 = *MEMORY[0x1E0CB2D50];
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tvRestriction"));
      v34 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v26);

    }
    v14 = 0;
    v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
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
    goto LABEL_36;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v39 = *MEMORY[0x1E0CB2D50];
  v18 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("appRestriction"));
  v40[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v9);
  a4 = v18;
LABEL_35:

LABEL_36:
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
  if (-[BMSiriRequestContextContentRestriction hasAppRestriction](self, "hasAppRestriction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRequestContextContentRestriction appRestriction](self, "appRestriction"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMSiriRequestContextContentRestriction countryCode](self, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriRequestContextContentRestriction hasMovieRestriction](self, "hasMovieRestriction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRequestContextContentRestriction movieRestriction](self, "movieRestriction"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMSiriRequestContextContentRestriction hasTvRestriction](self, "hasTvRestriction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRequestContextContentRestriction tvRestriction](self, "tvRestriction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v13[0] = CFSTR("appRestriction");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("countryCode");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("movieRestriction");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("tvRestriction");
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
      goto LABEL_20;
  }
  else
  {

    if (v5)
    {
LABEL_20:
      if (v4)
        goto LABEL_21;
LABEL_25:

      if (v3)
        goto LABEL_22;
LABEL_26:

      goto LABEL_22;
    }
  }

  if (!v4)
    goto LABEL_25;
LABEL_21:
  if (!v3)
    goto LABEL_26;
LABEL_22:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriRequestContextContentRestriction hasAppRestriction](self, "hasAppRestriction")
      || objc_msgSend(v5, "hasAppRestriction"))
    {
      if (!-[BMSiriRequestContextContentRestriction hasAppRestriction](self, "hasAppRestriction"))
        goto LABEL_22;
      if (!objc_msgSend(v5, "hasAppRestriction"))
        goto LABEL_22;
      v6 = -[BMSiriRequestContextContentRestriction appRestriction](self, "appRestriction");
      if (v6 != objc_msgSend(v5, "appRestriction"))
        goto LABEL_22;
    }
    -[BMSiriRequestContextContentRestriction countryCode](self, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMSiriRequestContextContentRestriction countryCode](self, "countryCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "countryCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_22;
    }
    if (!-[BMSiriRequestContextContentRestriction hasMovieRestriction](self, "hasMovieRestriction")
      && !objc_msgSend(v5, "hasMovieRestriction")
      || -[BMSiriRequestContextContentRestriction hasMovieRestriction](self, "hasMovieRestriction")
      && objc_msgSend(v5, "hasMovieRestriction")
      && (v14 = -[BMSiriRequestContextContentRestriction movieRestriction](self, "movieRestriction"),
          v14 == objc_msgSend(v5, "movieRestriction")))
    {
      if (!-[BMSiriRequestContextContentRestriction hasTvRestriction](self, "hasTvRestriction")
        && !objc_msgSend(v5, "hasTvRestriction"))
      {
        v13 = 1;
        goto LABEL_23;
      }
      if (-[BMSiriRequestContextContentRestriction hasTvRestriction](self, "hasTvRestriction")
        && objc_msgSend(v5, "hasTvRestriction"))
      {
        v15 = -[BMSiriRequestContextContentRestriction tvRestriction](self, "tvRestriction");
        v13 = v15 == objc_msgSend(v5, "tvRestriction");
LABEL_23:

        goto LABEL_24;
      }
    }
LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  v13 = 0;
LABEL_24:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)appRestriction
{
  return self->_appRestriction;
}

- (BOOL)hasAppRestriction
{
  return self->_hasAppRestriction;
}

- (void)setHasAppRestriction:(BOOL)a3
{
  self->_hasAppRestriction = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int)movieRestriction
{
  return self->_movieRestriction;
}

- (BOOL)hasMovieRestriction
{
  return self->_hasMovieRestriction;
}

- (void)setHasMovieRestriction:(BOOL)a3
{
  self->_hasMovieRestriction = a3;
}

- (int)tvRestriction
{
  return self->_tvRestriction;
}

- (BOOL)hasTvRestriction
{
  return self->_hasTvRestriction;
}

- (void)setHasTvRestriction:(BOOL)a3
{
  self->_hasTvRestriction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
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

    v4 = -[BMSiriRequestContextContentRestriction initByReadFrom:]([BMSiriRequestContextContentRestriction alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appRestriction"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countryCode"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("movieRestriction"), 0, 0, 3, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tvRestriction"), 0, 0, 4, 2, 0);
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
  return &unk_1E5F1CD08;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appRestriction"), 1, 2, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countryCode"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("movieRestriction"), 3, 2, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tvRestriction"), 4, 2, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
