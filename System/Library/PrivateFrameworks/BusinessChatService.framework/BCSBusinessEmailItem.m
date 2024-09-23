@implementation BCSBusinessEmailItem

- (BCSBusinessEmailItem)initWithEmail:(id)a3 localizedNames:(id)a4
{
  id v6;
  id v7;
  BCSBusinessEmailItem *v8;
  BCSEmailMetadataParquetMessage *v9;
  BCSEmailMetadataParquetMessage *message;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BCSBusinessEmailItemIdentifier *v16;
  void *v17;
  BCSBusinessEmailItemIdentifier *v18;
  BCSBusinessEmailItemIdentifier *identifier;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)BCSBusinessEmailItem;
  v8 = -[BCSItem init](&v25, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(BCSEmailMetadataParquetMessage);
    message = v8->_message;
    v8->_message = v9;

    -[BCSEmailMetadataParquetMessage setKey:](v8->_message, "setKey:", v6);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          -[BCSEmailMetadataParquetMessage addName:](v8->_message, "addName:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15++), (_QWORD)v21);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v13);
    }

    v16 = [BCSBusinessEmailItemIdentifier alloc];
    -[BCSEmailMetadataParquetMessage key](v8->_message, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (BCSBusinessEmailItemIdentifier *)-[BCSBusinessEmailItemIdentifier initWithEmail:](v16, v17);
    identifier = v8->_identifier;
    v8->_identifier = v18;

  }
  return v8;
}

- (BCSBusinessEmailItem)initWithEmail:(id)a3 localizedNames:(id)a4 localizedDisplayNames:(id)a5 businessId:(id)a6 companyId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BCSBusinessEmailItem *v17;
  BCSEmailMetadataParquetMessage *v18;
  BCSEmailMetadataParquetMessage *message;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BCSBusinessEmailItemIdentifier *v30;
  void *v31;
  BCSBusinessEmailItemIdentifier *v32;
  BCSBusinessEmailItemIdentifier *identifier;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)BCSBusinessEmailItem;
  v17 = -[BCSItem init](&v44, sel_init);
  if (v17)
  {
    v18 = objc_alloc_init(BCSEmailMetadataParquetMessage);
    message = v17->_message;
    v17->_message = v18;

    v35 = v12;
    -[BCSEmailMetadataParquetMessage setKey:](v17->_message, "setKey:", v12);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v20 = v13;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v41;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(v20);
          -[BCSEmailMetadataParquetMessage addName:](v17->_message, "addName:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v24++));
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v22);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v25 = v14;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          -[BCSEmailMetadataParquetMessage addDisplayName:](v17->_message, "addDisplayName:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v29++));
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v27);
    }

    -[BCSEmailMetadataParquetMessage setBusinessId:](v17->_message, "setBusinessId:", v15);
    -[BCSEmailMetadataParquetMessage setCompanyId:](v17->_message, "setCompanyId:", v16);
    v30 = [BCSBusinessEmailItemIdentifier alloc];
    -[BCSEmailMetadataParquetMessage key](v17->_message, "key");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (BCSBusinessEmailItemIdentifier *)-[BCSBusinessEmailItemIdentifier initWithEmail:](v30, v31);
    identifier = v17->_identifier;
    v17->_identifier = v32;

    v12 = v35;
  }

  return v17;
}

- (BCSBusinessEmailItem)initWithEmailMessage:(id)a3
{
  id v4;
  BCSBusinessEmailItem *v5;
  uint64_t v6;
  BCSEmailMetadataParquetMessage *message;
  BCSBusinessEmailItemIdentifier *v8;
  void *v9;
  BCSBusinessEmailItemIdentifier *v10;
  BCSBusinessEmailItemIdentifier *identifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessEmailItem;
  v5 = -[BCSItem init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    message = v5->_message;
    v5->_message = (BCSEmailMetadataParquetMessage *)v6;

    v8 = [BCSBusinessEmailItemIdentifier alloc];
    -[BCSEmailMetadataParquetMessage key](v5->_message, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (BCSBusinessEmailItemIdentifier *)-[BCSBusinessEmailItemIdentifier initWithEmail:](v8, v9);
    identifier = v5->_identifier;
    v5->_identifier = v10;

  }
  return v5;
}

- (NSString)email
{
  return -[BCSEmailMetadataParquetMessage key](self->_message, "key");
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
  -[BCSEmailMetadataParquetMessage names](self->_message, "names", 0);
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

  -[BCSEmailMetadataParquetMessage names](self->_message, "names");
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
  -[BCSEmailMetadataParquetMessage names](self->_message, "names");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BCSEmailMetadataParquetMessage names](self->_message, "names", 0);
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

- (NSString)businessId
{
  return -[BCSEmailMetadataParquetMessage businessId](self->_message, "businessId");
}

- (NSString)companyId
{
  return -[BCSEmailMetadataParquetMessage companyId](self->_message, "companyId");
}

- (NSDictionary)localizedDisplayNames
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
  -[BCSEmailMetadataParquetMessage displayNames](self->_message, "displayNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BCSEmailMetadataParquetMessage displayNames](self->_message, "displayNames", 0);
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

- (NSURL)logoURL
{
  return 0;
}

- (id)itemIdentifier
{
  void *v2;
  void *v3;

  -[BCSBusinessEmailItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)truncatedHash
{
  void *v2;
  int64_t v3;

  -[BCSBusinessEmailItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "truncatedHash");

  return v3;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[BCSBusinessEmailItem identifier](self, "identifier");
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
  -[BCSBusinessEmailItem identifier](self, "identifier");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[BCSBusinessEmailItem message](self, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[3];
    v5[3] = v7;

    -[BCSBusinessEmailItem identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BCSBusinessEmailItem message](self, "message");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Message"));

}

- (BCSBusinessEmailItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BCSEmailMetadataParquetMessage *v6;
  BCSBusinessEmailItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[BCSEmailMetadataParquetMessage initWithData:]([BCSEmailMetadataParquetMessage alloc], "initWithData:", v5);
  if (v6)
  {
    self = -[BCSBusinessEmailItem initWithEmailMessage:](self, "initWithEmailMessage:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BCSBusinessEmailItemIdentifier)identifier
{
  return self->_identifier;
}

- (BCSEmailMetadataParquetMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)itemFromStatement:(sqlite3_stmt *)a3
{
  void *v4;
  sqlite3_int64 v5;
  void *v6;
  BCSBusinessEmailItem *v7;
  BCSEmailMetadataParquetMessage *v8;
  BCSBusinessEmailItem *v9;
  BCSBusinessEmailItem *v10;

  sqlite3_column_int64(a3, 0);
  BCSEmailStoreDataFromStatement(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = sqlite3_column_int64(a3, 2);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", sqlite3_column_double(a3, 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (v4 && v5 == 1)
  {
    v8 = -[BCSEmailMetadataParquetMessage initWithData:]([BCSEmailMetadataParquetMessage alloc], "initWithData:", v4);
    if (v8)
    {
      v9 = -[BCSBusinessEmailItem initWithEmailMessage:]([BCSBusinessEmailItem alloc], "initWithEmailMessage:", v8);
      v7 = v9;
      if (v9)
      {
        -[BCSItem setExpirationDate:](v9, "setExpirationDate:", v6);
        v10 = v7;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)updateStatementValues:(sqlite3_stmt *)a3 withItemIdentifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  sqlite3_bind_int64(a3, 1, objc_msgSend(a4, "truncatedHash"));
  -[BCSBusinessEmailItem message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v7);
  sqlite3_bind_blob(a3, 2, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0);
  sqlite3_bind_int64(a3, 3, 2);
  -[BCSItem expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  sqlite3_bind_double(a3, 4, v9);

}

@end
