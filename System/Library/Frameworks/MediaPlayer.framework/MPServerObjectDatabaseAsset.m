@implementation MPServerObjectDatabaseAsset

- (MPServerObjectDatabaseAsset)initWithIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5 url:(id)a6 miniSINF:(id)a7
{
  return (MPServerObjectDatabaseAsset *)-[MPServerObjectDatabaseAsset _initWithIdentifier:hashedPersonID:flavor:url:miniSINF:sinfs:](self, "_initWithIdentifier:hashedPersonID:flavor:url:miniSINF:sinfs:", a3, a4, a5, a6, a7, 0);
}

- (MPServerObjectDatabaseAsset)initWithIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5 url:(id)a6 sinfs:(id)a7
{
  return (MPServerObjectDatabaseAsset *)-[MPServerObjectDatabaseAsset _initWithIdentifier:hashedPersonID:flavor:url:miniSINF:sinfs:](self, "_initWithIdentifier:hashedPersonID:flavor:url:miniSINF:sinfs:", a3, a4, a5, a6, 0, a7);
}

- (id)_initWithIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5 url:(id)a6 miniSINF:(id)a7 sinfs:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MPServerObjectDatabaseAsset *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  NSString *hashedPersonID;
  uint64_t v24;
  NSURL *url;
  uint64_t v26;
  NSArray *sinfs;
  uint64_t v28;
  NSData *miniSINF;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)MPServerObjectDatabaseAsset;
  v19 = -[MPServerObjectDatabaseAsset init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    hashedPersonID = v19->_hashedPersonID;
    v19->_hashedPersonID = (NSString *)v22;

    v19->_flavor = a5;
    v24 = objc_msgSend(v16, "copy");
    url = v19->_url;
    v19->_url = (NSURL *)v24;

    v26 = objc_msgSend(v18, "copy");
    sinfs = v19->_sinfs;
    v19->_sinfs = (NSArray *)v26;

    v28 = objc_msgSend(v17, "copy");
    miniSINF = v19->_miniSINF;
    v19->_miniSINF = (NSData *)v28;

  }
  return v19;
}

- (MPServerObjectDatabaseAsset)initWithSQLRowResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MPServerObjectDatabaseAsset *v13;

  v4 = a3;
  objc_msgSend(v4, "stringValueAtColumnIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1;
  objc_msgSend(v4, "stringValueAtColumnIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValueAtColumnIndex:", 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(&unk_1E31E61F0, "containsObject:", v8) & 1) == 0)
  {
    if ((objc_msgSend(&unk_1E31E6208, "containsObject:", v8) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(&unk_1E31E6220, "containsObject:", v8) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(&unk_1E31E6238, "containsObject:", v8))
    {
      v6 = 4;
    }
    else
    {
      v6 = 0;
    }
  }

  objc_msgSend(v4, "stringValueAtColumnIndex:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataValueAtColumnIndex:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length") == 1)
  {

    v11 = 0;
  }
  objc_msgSend(v4, "jsonValueAtColumnIndex:error:", 5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPServerObjectDatabaseAsset _initWithIdentifier:hashedPersonID:flavor:url:miniSINF:sinfs:](self, "_initWithIdentifier:hashedPersonID:flavor:url:miniSINF:sinfs:", v5, v7, v6, v10, v11, v12);

  return v13;
}

- (id)description
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *hashedPersonID;
  NSString *identifier;
  unint64_t v14;
  const __CFString *v15;
  NSUInteger v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_sinfs;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7), "objectForKeyedSubscript:", CFSTR("sinf2"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
        {
          v9 = objc_msgSend(v8, "length");

          goto LABEL_11;
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_opt_class();
  identifier = self->_identifier;
  hashedPersonID = self->_hashedPersonID;
  v14 = self->_flavor - 1;
  if (v14 > 3)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E315C710[v14];
  v16 = -[NSData length](self->_miniSINF, "length");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p hashedPersonID=%@ identifier=%@ flavor=%@ miniSinf=%lld bytes sinf2=%lld bytes url=%@"), v11, self, hashedPersonID, identifier, v15, v16, v9, self->_url, (_QWORD)v18);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)hashedPersonID
{
  return self->_hashedPersonID;
}

- (int64_t)flavor
{
  return self->_flavor;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)miniSINF
{
  return self->_miniSINF;
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sinfs, 0);
  objc_storeStrong((id *)&self->_miniSINF, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_hashedPersonID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
