@implementation CCWalletPassEventContent

- (CCWalletPassEventContent)initWithArtistIDs:(id)a3 awayTeamAbbreviation:(id)a4 awayTeamName:(id)a5 eventName:(id)a6 eventType:(id)a7 genre:(id)a8 homeTeamAbbreviation:(id)a9 homeTeamName:(id)a10 performerNames:(id)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  int IsInstanceOfExpectedClass;
  id v31;
  int v32;
  void *v33;
  void *v34;
  CCWalletPassEventContent *v35;
  CCWalletPassEventContent *v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  id v41;
  int v42;
  int v43;
  int v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  CCWalletPassEventContent *v50;
  void *v52;
  CCWalletPassEventContent *v53;
  id *v54;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v56 = a7;
  v60 = a8;
  v59 = a9;
  v58 = a10;
  v57 = a11;
  v21 = (void *)objc_opt_new();
  if (!v17)
  {
    v54 = a12;
    v23 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  v77 = 0;
  v22 = CCValidateArrayValues();
  v23 = 0;
  if (v22)
  {
    v54 = a12;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v24 = v17;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v74 != v27)
            objc_enumerationMutation(v24);
          CCPBDataWriterWriteStringField();
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      }
      while (v26);
    }

LABEL_12:
    v29 = v56;
    if (v18)
    {
      objc_opt_class();
      v72 = v23;
      IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      v31 = v23;

      if (!IsInstanceOfExpectedClass)
        goto LABEL_39;
      CCPBDataWriterWriteStringField();
      if (!v19)
      {
LABEL_15:
        v23 = v31;
        if (v20)
          goto LABEL_16;
        goto LABEL_24;
      }
    }
    else
    {
      v31 = v23;
      if (!v19)
        goto LABEL_15;
    }
    objc_opt_class();
    v71 = v31;
    v38 = CCValidateIsInstanceOfExpectedClass();
    v23 = v31;

    if (!v38)
      goto LABEL_51;
    CCPBDataWriterWriteStringField();
    if (v20)
    {
LABEL_16:
      objc_opt_class();
      v70 = v23;
      v32 = CCValidateIsInstanceOfExpectedClass();
      v31 = v23;

      if (!v32)
        goto LABEL_39;
      CCPBDataWriterWriteStringField();
      if (!v56)
        goto LABEL_18;
      goto LABEL_25;
    }
LABEL_24:
    v31 = v23;
    if (!v56)
    {
LABEL_18:
      v23 = v31;
LABEL_27:
      if (v60)
      {
        v33 = v19;
        v34 = v20;
        objc_opt_class();
        v68 = v23;
        v40 = CCValidateIsInstanceOfExpectedClass();
        v37 = v60;
        v41 = v23;

        if (!v40)
        {
          CCSetError();
          v35 = 0;
          v23 = v41;
LABEL_53:
          v36 = self;
          goto LABEL_54;
        }
        CCPBDataWriterWriteStringField();
        v20 = v34;
        v19 = v33;
      }
      else
      {
        v41 = v23;
      }
      if (!v59)
      {
        v23 = v41;
        goto LABEL_36;
      }
      objc_opt_class();
      v67 = v41;
      v42 = CCValidateIsInstanceOfExpectedClass();
      v23 = v41;

      if (v42)
      {
        CCPBDataWriterWriteStringField();
LABEL_36:
        if (!v58)
        {
          v31 = v23;
          goto LABEL_41;
        }
        objc_opt_class();
        v66 = v23;
        v43 = CCValidateIsInstanceOfExpectedClass();
        v31 = v23;

        if (v43)
        {
          CCPBDataWriterWriteStringField();
LABEL_41:
          if (!v57)
          {
            v33 = v19;
            v34 = v20;
            v23 = v31;
            v50 = self;
LABEL_56:
            objc_msgSend(v21, "immutableData");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = -[CCItemMessage initWithData:error:](v50, "initWithData:error:", v52, v54);

            v36 = v53;
            v35 = v53;
            goto LABEL_20;
          }
          objc_opt_class();
          v65 = v31;
          v44 = CCValidateArrayValues();
          v23 = v31;

          if (v44)
          {
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v45 = v57;
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
            if (v46)
            {
              v47 = v46;
              v48 = *(_QWORD *)v62;
              do
              {
                for (j = 0; j != v47; ++j)
                {
                  if (*(_QWORD *)v62 != v48)
                    objc_enumerationMutation(v45);
                  CCPBDataWriterWriteStringField();
                }
                v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
              }
              while (v47);
            }
            v33 = v19;
            v34 = v20;

            v50 = self;
            v29 = v56;
            goto LABEL_56;
          }
          goto LABEL_51;
        }
LABEL_39:
        v33 = v19;
        v34 = v20;
        CCSetError();
        v35 = 0;
        v23 = v31;
LABEL_52:
        v37 = v60;
        goto LABEL_53;
      }
LABEL_51:
      v33 = v19;
      v34 = v20;
      CCSetError();
      v35 = 0;
      goto LABEL_52;
    }
LABEL_25:
    objc_opt_class();
    v69 = v31;
    v39 = CCValidateIsInstanceOfExpectedClass();
    v23 = v31;

    if (!v39)
      goto LABEL_51;
    CCPBDataWriterWriteStringField();
    goto LABEL_27;
  }
  v33 = v19;
  v34 = v20;
  CCSetError();
  v35 = 0;
  v36 = self;
  v29 = v56;
LABEL_20:
  v37 = v60;
LABEL_54:

  return v35;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  void *v9;
  int *v10;
  int *v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  objc_class *v24;
  NSArray *v25;
  NSArray *artistIDs;
  NSArray *v27;
  NSArray *performerNames;
  objc_class *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v34;
  void *v35;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
  {
    v34 = 0;
    v35 = 0;
    goto LABEL_44;
  }
  v34 = 0;
  v35 = 0;
  v9 = 0;
  v10 = (int *)MEMORY[0x24BE15718];
  v11 = (int *)MEMORY[0x24BE15710];
LABEL_3:
  if (*(_QWORD *)&v6[*v10])
    v12 = 0;
  else
    v12 = v9 == 0;
  if (v12)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v7;
      v17 = *(_QWORD *)&v6[v16];
      if (v17 == -1 || v17 >= *(_QWORD *)&v6[*v8])
        break;
      v18 = *(_BYTE *)(*(_QWORD *)&v6[*v11] + v17);
      *(_QWORD *)&v6[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0)
        goto LABEL_17;
      v13 += 7;
      if (v14++ >= 9)
      {
        v15 = 0;
        if (*(_QWORD *)&v6[*v10])
          goto LABEL_44;
LABEL_18:
        switch((v15 >> 3))
        {
          case 1u:
            CCPBReaderReadStringNoCopy();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v35)
              v35 = (void *)objc_opt_new();
            if (!v20)
              goto LABEL_38;
            v21 = v35;
            goto LABEL_37;
          case 2u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            v23 = 24;
            goto LABEL_32;
          case 3u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            v23 = 32;
            goto LABEL_32;
          case 4u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            v23 = 40;
            goto LABEL_32;
          case 5u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            v23 = 48;
            goto LABEL_32;
          case 6u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            v23 = 56;
            goto LABEL_32;
          case 7u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            v23 = 64;
            goto LABEL_32;
          case 8u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            v23 = 72;
LABEL_32:
            v20 = *(Class *)((char *)&self->super.super.isa + v23);
            *(Class *)((char *)&self->super.super.isa + v23) = v22;
            goto LABEL_40;
          case 9u:
            CCPBReaderReadStringNoCopy();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v34)
              v34 = (void *)objc_opt_new();
            if (v20)
            {
              v21 = v34;
LABEL_37:
              objc_msgSend(v21, "addObject:", v20);
            }
LABEL_38:
            v9 = 0;
            goto LABEL_40;
          default:
            if ((CCPBReaderSkipValueWithTag() & 1) != 0)
            {
              v9 = 0;
            }
            else
            {
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              CCSkipFieldErrorForMessage();
              v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

            }
            if (*(_QWORD *)&v6[*v7] >= *(_QWORD *)&v6[*v8])
              goto LABEL_45;
            goto LABEL_3;
        }
      }
    }
    *(_QWORD *)&v6[*v10] = 1;
LABEL_17:
    if (!*(_QWORD *)&v6[*v10])
      goto LABEL_18;
LABEL_44:
    v9 = 0;
  }
LABEL_45:
  v25 = (NSArray *)objc_msgSend(v35, "copy");
  artistIDs = self->_artistIDs;
  self->_artistIDs = v25;

  v27 = (NSArray *)objc_msgSend(v34, "copy");
  performerNames = self->_performerNames;
  self->_performerNames = v27;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v6[*MEMORY[0x24BE15718]])
    {
      v32 = 1;
      goto LABEL_50;
    }
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v32 = 0;
LABEL_50:

  return v32;
}

- (NSArray)artistIDs
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_artistIDs, 1);
}

- (NSString)awayTeamAbbreviation
{
  return (NSString *)(id)-[NSString copy](self->_awayTeamAbbreviation, "copy");
}

- (NSString)awayTeamName
{
  return (NSString *)(id)-[NSString copy](self->_awayTeamName, "copy");
}

- (NSString)eventName
{
  return (NSString *)(id)-[NSString copy](self->_eventName, "copy");
}

- (NSString)eventType
{
  return (NSString *)(id)-[NSString copy](self->_eventType, "copy");
}

- (NSString)genre
{
  return (NSString *)(id)-[NSString copy](self->_genre, "copy");
}

- (NSString)homeTeamAbbreviation
{
  return (NSString *)(id)-[NSString copy](self->_homeTeamAbbreviation, "copy");
}

- (NSString)homeTeamName
{
  return (NSString *)(id)-[NSString copy](self->_homeTeamName, "copy");
}

- (NSArray)performerNames
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_performerNames, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a3;
  if (self->_artistIDs)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedStringValue:", 46124, self->_artistIDs);
    v14[2](v14, v5);

  }
  if (self->_awayTeamAbbreviation)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 46125, self->_awayTeamAbbreviation);
    v14[2](v14, v6);

  }
  if (self->_awayTeamName)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 46126, self->_awayTeamName);
    v14[2](v14, v7);

  }
  if (self->_eventName)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 46127, self->_eventName);
    v14[2](v14, v8);

  }
  if (self->_eventType)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 46128, self->_eventType);
    v14[2](v14, v9);

  }
  if (self->_genre)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 46129, self->_genre);
    v14[2](v14, v10);

  }
  if (self->_homeTeamAbbreviation)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 46130, self->_homeTeamAbbreviation);
    v14[2](v14, v11);

  }
  if (self->_homeTeamName)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 46131, self->_homeTeamName);
    v14[2](v14, v12);

  }
  if (self->_performerNames)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedStringValue:", 46132, self->_performerNames);
    v14[2](v14, v13);

  }
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
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  if (self->_artistIDs)
  {
    -[CCWalletPassEventContent artistIDs](self, "artistIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("artistIDs"));

  }
  if (self->_awayTeamAbbreviation)
  {
    -[CCWalletPassEventContent awayTeamAbbreviation](self, "awayTeamAbbreviation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("awayTeamAbbreviation"));

  }
  if (self->_awayTeamName)
  {
    -[CCWalletPassEventContent awayTeamName](self, "awayTeamName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("awayTeamName"));

  }
  if (self->_eventName)
  {
    -[CCWalletPassEventContent eventName](self, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eventName"));

  }
  if (self->_eventType)
  {
    -[CCWalletPassEventContent eventType](self, "eventType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("eventType"));

  }
  if (self->_genre)
  {
    -[CCWalletPassEventContent genre](self, "genre");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("genre"));

  }
  if (self->_homeTeamAbbreviation)
  {
    -[CCWalletPassEventContent homeTeamAbbreviation](self, "homeTeamAbbreviation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("homeTeamAbbreviation"));

  }
  if (self->_homeTeamName)
  {
    -[CCWalletPassEventContent homeTeamName](self, "homeTeamName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("homeTeamName"));

  }
  if (self->_performerNames)
  {
    -[CCWalletPassEventContent performerNames](self, "performerNames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("performerNames"));

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (CCWalletPassEventContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CCWalletPassEventContent *v15;
  void *v17;
  void *v18;
  void *v19;
  CCWalletPassEventContent *v20;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("artistIDs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("awayTeamAbbreviation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("awayTeamName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("genre"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeTeamAbbreviation"));
    v20 = self;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeTeamName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("performerNames"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CCWalletPassEventContent initWithArtistIDs:awayTeamAbbreviation:awayTeamName:eventName:eventType:genre:homeTeamAbbreviation:homeTeamName:performerNames:error:]([CCWalletPassEventContent alloc], "initWithArtistIDs:awayTeamAbbreviation:awayTeamName:eventName:eventType:genre:homeTeamAbbreviation:homeTeamName:performerNames:error:", v18, v9, v19, v10, v11, v12, v17, v13, v14, a4);

    self = v20;
  }
  else
  {
    CCSetError();
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerNames, 0);
  objc_storeStrong((id *)&self->_homeTeamName, 0);
  objc_storeStrong((id *)&self->_homeTeamAbbreviation, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_awayTeamName, 0);
  objc_storeStrong((id *)&self->_awayTeamAbbreviation, 0);
  objc_storeStrong((id *)&self->_artistIDs, 0);
}

+ (unsigned)itemType
{
  return -19416;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
