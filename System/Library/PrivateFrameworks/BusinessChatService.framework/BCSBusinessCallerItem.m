@implementation BCSBusinessCallerItem

- (BCSBusinessCallerItem)initWithParquetMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BCSBusinessCallerItem *v22;
  void *v23;
  uint64_t v24;
  BCSBusinessCallerItem *j;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BCSBusinessCallerItem *v33;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "names");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v7 = v3;
  v8 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "intents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v3, "names");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v17, "isDefault"))
        {
          objc_msgSend(v17, "text");
          v18 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v18;
        }
        objc_msgSend(v17, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "locale");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v20);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v7, "names");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (BCSBusinessCallerItem *)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (!v22)
  {
    v23 = 0;
    v33 = self;
    goto LABEL_25;
  }
  v38 = v7;
  v23 = 0;
  v24 = *(_QWORD *)v41;
  do
  {
    for (j = 0; j != v22; j = (BCSBusinessCallerItem *)((char *)j + 1))
    {
      if (*(_QWORD *)v41 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
      if (objc_msgSend(v26, "isDefault"))
      {
        objc_msgSend(v26, "text");
        v27 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v27;
      }
      objc_msgSend(v26, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "locale");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, v29);

    }
    v22 = (BCSBusinessCallerItem *)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  }
  while (v22);

  if (!v14)
  {
    v7 = v38;
    goto LABEL_27;
  }
  v7 = v38;
  if (!v23)
  {
LABEL_27:
    v33 = self;
    goto LABEL_28;
  }
  objc_msgSend(v38, "phoneNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v38, "phoneHash");
  objc_msgSend(v38, "names");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "intents");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "logo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "logoFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = objc_msgSend(v38, "isVerified");
  v22 = -[BCSBusinessCallerItem initWithPhoneNumber:phoneHash:localizedNames:localizedDepartments:logoURL:logo:logoFormat:verified:](self, "initWithPhoneNumber:phoneHash:localizedNames:localizedDepartments:logoURL:logo:logoFormat:verified:", v21, v37, v36, v30, 0, v31, v32, v35);

  v33 = v22;
LABEL_25:

LABEL_28:
  return v22;
}

+ (id)itemsFromRecords:(id)a3
{
  return 0;
}

+ (id)itemFromStatement:(sqlite3_stmt *)a3
{
  const unsigned __int8 *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BCSCallerIdParquetMessage *v9;
  BCSBusinessCallerItem *v10;
  BCSBusinessCallerItem *v11;
  BCSBusinessCallerItem *v12;

  sqlite3_column_int64(a3, 0);
  v4 = sqlite3_column_text(a3, 1);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)sqlite3_column_blob(a3, 2);
  v7 = sqlite3_column_bytes(a3, 2);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", sqlite3_column_double(a3, 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = -[BCSCallerIdParquetMessage initWithData:]([BCSCallerIdParquetMessage alloc], "initWithData:", v6);
    if (v9)
    {
      v10 = -[BCSBusinessCallerItem initWithParquetMessage:]([BCSBusinessCallerItem alloc], "initWithParquetMessage:", v9);
      v11 = v10;
      if (v10)
      {
        -[BCSItem setExpirationDate:](v10, "setExpirationDate:", v8);
        v12 = v11;
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

- (void)updateStatementValues:(sqlite3_stmt *)a3 withItemIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  sqlite3_bind_int64(a3, 1, objc_msgSend(a4, "truncatedHash"));
  -[BCSBusinessCallerItem message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phoneNumber");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(a3, 2, (const char *)objc_msgSend(v7, "UTF8String"), -1, 0);

  -[BCSBusinessCallerItem message](self, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v9);
  sqlite3_bind_blob(a3, 3, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), 0);
  -[BCSItem expirationDate](self, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  sqlite3_bind_double(a3, 4, v11);

}

- (BCSBusinessCallerItem)initWithPhoneNumber:(id)a3 name:(id)a4 department:(id)a5 logoURL:(id)a6 logo:(id)a7 logoFormat:(id)a8 verified:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  BCSBusinessCallerItemIdentifier *v17;
  void *v18;
  void *v19;
  BCSCallerIdLocalizedString *v20;
  BCSCallerIdLocalizedString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BCSBusinessCallerItem *v25;
  uint64_t v27;
  id v28;
  BCSCallerIdLocalizedString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v28 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[BCSBusinessCallerItemIdentifier initWithPhoneNumber:]([BCSBusinessCallerItemIdentifier alloc], "initWithPhoneNumber:", v16);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "languageCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc_init(BCSCallerIdLocalizedString);
  -[BCSCallerIdLocalizedString setLocale:](v20, "setLocale:", v19);
  -[BCSCallerIdLocalizedString setText:](v20, "setText:", v15);

  -[BCSCallerIdLocalizedString setIsDefault:](v20, "setIsDefault:", 1);
  v21 = objc_alloc_init(BCSCallerIdLocalizedString);
  -[BCSCallerIdLocalizedString setLocale:](v21, "setLocale:", v19);
  -[BCSCallerIdLocalizedString setText:](v21, "setText:", v14);

  -[BCSCallerIdLocalizedString setIsDefault:](v21, "setIsDefault:", 1);
  v22 = -[BCSBusinessCallerItemIdentifier truncatedHash](v17, "truncatedHash");
  v31[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = a9;
  v25 = -[BCSBusinessCallerItem initWithPhoneNumber:phoneHash:localizedNames:localizedDepartments:logoURL:logo:logoFormat:verified:](self, "initWithPhoneNumber:phoneHash:localizedNames:localizedDepartments:logoURL:logo:logoFormat:verified:", v16, v22, v23, v24, v13, v28, CFSTR("heic"), v27);

  return v25;
}

- (BCSBusinessCallerItem)initWithPhoneNumber:(id)a3 phoneHash:(int64_t)a4 localizedNames:(id)a5 localizedDepartments:(id)a6 logoURL:(id)a7 logo:(id)a8 logoFormat:(id)a9 verified:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  __CFString *v21;
  BCSBusinessCallerItem *v22;
  BCSCallerIdParquetMessage *v23;
  BCSCallerIdParquetMessage *message;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  NSURL *logoURL;
  const __CFString *v37;
  BCSBusinessCallerItemIdentifier *v38;
  BCSBusinessCallerItemIdentifier *identifier;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = (__CFString *)a9;
  v51.receiver = self;
  v51.super_class = (Class)BCSBusinessCallerItem;
  v22 = -[BCSItem init](&v51, sel_init);
  if (v22)
  {
    v23 = objc_alloc_init(BCSCallerIdParquetMessage);
    message = v22->_message;
    v22->_message = v23;

    -[BCSCallerIdParquetMessage setPhoneHash:](v22->_message, "setPhoneHash:", a4);
    v42 = v16;
    -[BCSCallerIdParquetMessage setPhoneNumber:](v22->_message, "setPhoneNumber:", v16);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v41 = v17;
    v25 = v17;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v48 != v28)
            objc_enumerationMutation(v25);
          -[BCSCallerIdParquetMessage addName:](v22->_message, "addName:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v27);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = v18;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(v30);
          -[BCSCallerIdParquetMessage addIntent:](v22->_message, "addIntent:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v32);
    }

    -[BCSCallerIdParquetMessage setLogo:](v22->_message, "setLogo:", v20);
    -[BCSCallerIdParquetMessage setIsVerified:](v22->_message, "setIsVerified:", a10);
    if (v19)
    {
      v35 = objc_msgSend(v19, "copy");
      logoURL = v22->_logoURL;
      v22->_logoURL = (NSURL *)v35;

    }
    if (v21)
      v37 = v21;
    else
      v37 = CFSTR("heic");
    -[BCSCallerIdParquetMessage setLogoFormat:](v22->_message, "setLogoFormat:", v37);
    v38 = -[BCSBusinessCallerItemIdentifier initWithTruncatedHash:]([BCSBusinessCallerItemIdentifier alloc], "initWithTruncatedHash:", a4);
    identifier = v22->_identifier;
    v22->_identifier = v38;

    v17 = v41;
    v16 = v42;
  }

  return v22;
}

- (NSString)phoneNumber
{
  return -[BCSCallerIdParquetMessage phoneNumber](self->_message, "phoneNumber");
}

- (void)setPhoneNumber:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[BCSCallerIdParquetMessage setPhoneNumber:](self->_message, "setPhoneNumber:", v4);

}

- (NSString)name
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BCSCallerIdParquetMessage names](self->_message, "names", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isDefault") & 1) != 0)
        {
          objc_msgSend(v8, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[BCSCallerIdParquetMessage names](self->_message, "names");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return (NSString *)v10;
}

- (NSString)department
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BCSCallerIdParquetMessage intents](self->_message, "intents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isDefault") & 1) != 0)
        {
          objc_msgSend(v8, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[BCSCallerIdParquetMessage intents](self->_message, "intents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return (NSString *)v10;
}

- (NSDictionary)localizedNames
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[BCSCallerIdParquetMessage names](self->_message, "names");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BCSCallerIdParquetMessage names](self->_message, "names", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "locale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return (NSDictionary *)v5;
}

- (NSDictionary)localizedDepartments
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[BCSCallerIdParquetMessage intents](self->_message, "intents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BCSCallerIdParquetMessage intents](self->_message, "intents", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "locale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return (NSDictionary *)v5;
}

- (NSData)logo
{
  return -[BCSCallerIdParquetMessage logo](self->_message, "logo");
}

- (BOOL)isVerified
{
  return -[BCSCallerIdParquetMessage isVerified](self->_message, "isVerified");
}

- (id)description
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
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessCallerItem;
  -[BCSBusinessCallerItem description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessCallerItem phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessCallerItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessCallerItem department](self, "department");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessCallerItem logoURL](self, "logoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessCallerItem identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - phone:%@ name:%@ department:%@ logoURL:%@ (%@)"), v4, v5, v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)logoFormat
{
  return -[BCSCallerIdParquetMessage logoFormat](self->_message, "logoFormat");
}

- (id)itemIdentifier
{
  void *v2;
  void *v3;

  -[BCSBusinessCallerItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)truncatedHash
{
  void *v2;
  int64_t v3;

  -[BCSBusinessCallerItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "truncatedHash");

  return v3;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[BCSBusinessCallerItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BCSBusinessCallerItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "matchesItemIdentifying:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[BCSBusinessCallerItem message](self, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[4];
    v5[4] = v7;

    -[BCSBusinessCallerItem logoURL](self, "logoURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

    -[BCSBusinessCallerItem identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = (void *)v5[3];
    v5[3] = v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[BCSBusinessCallerItem message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Message"));

  -[BCSBusinessCallerItem logoURL](self, "logoURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("LogoURL"));

}

- (BCSBusinessCallerItem)initWithCoder:(id)a3
{
  id v4;
  BCSBusinessCallerItem *v5;
  void *v6;
  BCSCallerIdParquetMessage *v7;
  BCSCallerIdParquetMessage *v8;
  uint64_t v9;
  NSURL *logoURL;
  BCSBusinessCallerItem *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessCallerItem;
  v5 = -[BCSItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Message"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BCSCallerIdParquetMessage initWithData:]([BCSCallerIdParquetMessage alloc], "initWithData:", v6);
    if (!v7)
    {

      v11 = 0;
      goto LABEL_6;
    }
    v8 = v7;
    v5 = -[BCSBusinessCallerItem initWithParquetMessage:](v5, "initWithParquetMessage:", v7);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LogoURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    logoURL = v5->_logoURL;
    v5->_logoURL = (NSURL *)v9;

  }
  v5 = v5;
  v11 = v5;
LABEL_6:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BCSBusinessCallerItemIdentifier)identifier
{
  return self->_identifier;
}

- (BCSCallerIdParquetMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logoURL, 0);
}

@end
