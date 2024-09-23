@implementation BMKeyboardTokenFrequency

- (BMKeyboardTokenFrequency)initWithTokenFrequencies:(id)a3 locale:(id)a4 tokenType:(int)a5
{
  id v9;
  id v10;
  BMKeyboardTokenFrequency *v11;
  objc_super v13;

  v9 = a3;
  v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMKeyboardTokenFrequency;
  v11 = -[BMEventBase init](&v13, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v11->_tokenFrequencies, a3);
    objc_storeStrong((id *)&v11->_locale, a4);
    v11->_tokenType = a5;
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
  -[BMKeyboardTokenFrequency tokenFrequencies](self, "tokenFrequencies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMKeyboardTokenFrequency locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMKeyboardTokenFrequencyTokenTypeAsString(-[BMKeyboardTokenFrequency tokenType](self, "tokenType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMKeyboardTokenFrequency with tokenFrequencies: %@, locale: %@, tokenType: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMKeyboardTokenFrequency *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  unint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSString *locale;
  uint64_t v31;
  NSArray *tokenFrequencies;
  int v33;
  BMKeyboardTokenFrequency *v34;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMKeyboardTokenFrequency;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_44;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        if (v15 == -1 || v15 >= *(_QWORD *)&v4[*v8])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v17 = v12++ >= 9;
        if (v17)
        {
          v13 = 0;
          v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v18 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v18 || (v13 & 7) == 4)
        break;
      v20 = v13 >> 3;
      if ((v13 >> 3) == 1)
      {
        v37 = 0;
        v38 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (v27 = -[BMKeyboardTokenFrequencyTokenFrequency initByReadFrom:]([BMKeyboardTokenFrequencyTokenFrequency alloc], "initByReadFrom:", v4)) == 0)
        {
LABEL_46:

          goto LABEL_43;
        }
        v28 = v27;
        objc_msgSend(v6, "addObject:", v27);
        PBReaderRecallMark();

      }
      else if ((_DWORD)v20 == 2)
      {
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        locale = v5->_locale;
        v5->_locale = (NSString *)v29;

      }
      else if ((_DWORD)v20 == 3)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (1)
        {
          v24 = *v7;
          v25 = *(_QWORD *)&v4[v24];
          if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v8])
            break;
          v26 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v25);
          *(_QWORD *)&v4[v24] = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0)
            goto LABEL_36;
          v21 += 7;
          v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_38;
          }
        }
        v4[*v9] = 1;
LABEL_36:
        if (v4[*v9])
          LODWORD(v23) = 0;
LABEL_38:
        if (v23 >= 5)
          LODWORD(v23) = 0;
        v5->_tokenType = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_46;
      }
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v31 = objc_msgSend(v6, "copy");
  tokenFrequencies = v5->_tokenFrequencies;
  v5->_tokenFrequencies = (NSArray *)v31;

  v33 = v4[*v9];
  if (v33)
LABEL_43:
    v34 = 0;
  else
LABEL_44:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_tokenFrequencies;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_locale)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMKeyboardTokenFrequency writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMKeyboardTokenFrequency)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  BMKeyboardTokenFrequencyTokenFrequency *v16;
  BMKeyboardTokenFrequencyTokenFrequency *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  BMKeyboardTokenFrequency *v22;
  id *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id *v27;
  uint64_t *v28;
  id v29;
  id v31;
  uint64_t v32;
  id *v33;
  void *v34;
  uint64_t v35;
  id v36;
  BMKeyboardTokenFrequency *v37;
  void *v38;
  _BYTE *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id *v44;
  BMKeyboardTokenFrequency *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  _BYTE v63[128];
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tokenFrequencies"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v44 = a4;
    v45 = self;
    v47 = v6;

    v7 = 0;
  }
  else
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v32 = *MEMORY[0x1E0D025B8];
          v64 = *MEMORY[0x1E0CB2D50];
          v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("tokenFrequencies"));
          v65[0] = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
          v33 = a4;
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          *v33 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 2, v19);
          goto LABEL_35;
        }
        v22 = 0;
        goto LABEL_36;
      }
    }
    v44 = a4;
    v45 = self;
    v47 = v6;
  }
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v7 = v7;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (!v10)
    goto LABEL_16;
  v11 = v10;
  v12 = *(_QWORD *)v52;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v52 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v44;
        if (v44)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v25 = *MEMORY[0x1E0D025B8];
          v61 = *MEMORY[0x1E0CB2D50];
          v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("tokenFrequencies"));
          v62 = v15;
          v26 = (void *)MEMORY[0x1E0C99D80];
          v27 = &v62;
          v28 = &v61;
LABEL_28:
          objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v29 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v21);
          v22 = 0;
          *v23 = v29;
LABEL_32:
          v19 = v7;
          self = v45;
          v6 = v47;
          goto LABEL_33;
        }
LABEL_39:
        v22 = 0;
        v19 = v7;
        self = v45;
        v6 = v47;
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = v44;
        if (v44)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v25 = *MEMORY[0x1E0D025B8];
          v59 = *MEMORY[0x1E0CB2D50];
          v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("tokenFrequencies"));
          v60 = v15;
          v26 = (void *)MEMORY[0x1E0C99D80];
          v27 = &v60;
          v28 = &v59;
          goto LABEL_28;
        }
        goto LABEL_39;
      }
      v15 = v14;
      v16 = [BMKeyboardTokenFrequencyTokenFrequency alloc];
      v50 = 0;
      v17 = -[BMKeyboardTokenFrequencyTokenFrequency initWithJSONDictionary:error:](v16, "initWithJSONDictionary:error:", v15, &v50);
      v18 = v50;
      if (v18)
      {
        v21 = v18;
        if (v44)
          *v44 = objc_retainAutorelease(v18);

        v22 = 0;
        goto LABEL_32;
      }
      objc_msgSend(v49, "addObject:", v17);

    }
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v11)
      continue;
    break;
  }
LABEL_16:

  v6 = v47;
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("locale"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = v47;
      objc_opt_class();
      self = v45;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v15;
        goto LABEL_19;
      }
      if (!v44)
      {
        v19 = 0;
        v22 = 0;
        goto LABEL_34;
      }
      v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = *MEMORY[0x1E0D025B8];
      v57 = *MEMORY[0x1E0CB2D50];
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("locale"));
      v58 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v35, 2, v20);
      v19 = 0;
      v22 = 0;
      *v44 = v36;
LABEL_52:
      v6 = v34;
      goto LABEL_23;
    }
  }
  v19 = 0;
  self = v45;
LABEL_19:
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("tokenType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v21 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v20;
    goto LABEL_22;
  }
  v34 = v47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v44)
    {
      v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v46 = *MEMORY[0x1E0D025B8];
      v55 = *MEMORY[0x1E0CB2D50];
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("tokenType"));
      v56 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *v44 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v46, 2, v42);

    }
    v21 = 0;
    v22 = 0;
    goto LABEL_52;
  }
  v37 = self;
  v38 = (void *)MEMORY[0x1E0CB37E8];
  v39 = BMKeyboardTokenFrequencyTokenTypeFromString(v20);
  v40 = v38;
  self = v37;
  objc_msgSend(v40, "numberWithInt:", v39);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v47;
LABEL_22:
  self = -[BMKeyboardTokenFrequency initWithTokenFrequencies:locale:tokenType:](self, "initWithTokenFrequencies:locale:tokenType:", v49, v19, objc_msgSend(v21, "intValue"));
  v22 = self;
LABEL_23:

LABEL_33:
LABEL_34:

LABEL_35:
LABEL_36:

  return v22;
}

- (id)_tokenFrequenciesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMKeyboardTokenFrequency tokenFrequencies](self, "tokenFrequencies", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
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
  -[BMKeyboardTokenFrequency _tokenFrequenciesJSONArray](self, "_tokenFrequenciesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMKeyboardTokenFrequency locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMKeyboardTokenFrequency tokenType](self, "tokenType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("tokenFrequencies");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("locale");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("tokenType");
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
      goto LABEL_9;
LABEL_12:

    if (v3)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v4)
    goto LABEL_12;
LABEL_9:
  if (!v3)
    goto LABEL_13;
LABEL_10:

  return v9;
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMKeyboardTokenFrequency tokenFrequencies](self, "tokenFrequencies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tokenFrequencies");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMKeyboardTokenFrequency tokenFrequencies](self, "tokenFrequencies");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tokenFrequencies");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMKeyboardTokenFrequency locale](self, "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMKeyboardTokenFrequency locale](self, "locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    v19 = -[BMKeyboardTokenFrequency tokenType](self, "tokenType");
    v12 = v19 == objc_msgSend(v5, "tokenType");
    goto LABEL_12;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)tokenFrequencies
{
  return self->_tokenFrequencies;
}

- (NSString)locale
{
  return self->_locale;
}

- (int)tokenType
{
  return self->_tokenType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_tokenFrequencies, 0);
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

    v4 = -[BMKeyboardTokenFrequency initByReadFrom:]([BMKeyboardTokenFrequency alloc], "initByReadFrom:", v7);
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
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("tokenFrequencies_json"), 5, 1, &__block_literal_global_148);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("locale"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tokenType"), 0, 0, 3, 4, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1EBB0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tokenFrequencies"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locale"), 2, 13, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tokenType"), 3, 4, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __35__BMKeyboardTokenFrequency_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tokenFrequenciesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
