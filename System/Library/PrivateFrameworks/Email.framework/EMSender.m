@implementation EMSender

- (EMSender)initWithDatabaseID:(int64_t)a3 addresses:(id)a4 contactIdentifier:(id)a5 bucket:(int64_t)a6
{
  id v10;
  id v11;
  EMSender *v12;
  EMSender *v13;
  id v14;
  void *v15;
  uint64_t v16;
  EFLocked *addresses;
  uint64_t v18;
  NSString *contactIdentifier;
  objc_super v21;

  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)EMSender;
  v12 = -[EMSender init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_databaseID = a3;
    v14 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v15 = (void *)objc_msgSend(v10, "mutableCopy");
    v16 = objc_msgSend(v14, "initWithObject:", v15);
    addresses = v13->_addresses;
    v13->_addresses = (EFLocked *)v16;

    v18 = objc_msgSend(v11, "copy");
    contactIdentifier = v13->_contactIdentifier;
    v13->_contactIdentifier = (NSString *)v18;

    v13->_bucket = a6;
  }

  return v13;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = (id)EFAtomicObjectRelease();
  v4.receiver = self;
  v4.super_class = (Class)EMSender;
  -[EMSender dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  EMSender *v4;
  EMSender *v5;
  int64_t v6;
  BOOL v7;

  v4 = (EMSender *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else if ((-[EMSender isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    v6 = -[EMSender databaseID](self, "databaseID");
    v7 = v6 == -[EMSender databaseID](v5, "databaseID");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[EMSender displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);

  if (!v7)
  {
    -[EMSender addresses](self, "addresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
    if (v10 >= objc_msgSend(v9, "count"))
    {
      v11 = objc_msgSend(v8, "count");
      if (v11 <= objc_msgSend(v9, "count"))
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v13, "localizedStandardCompare:", v15);

      }
      else
      {
        v7 = 1;
      }
    }
    else
    {
      v7 = -1;
    }

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[EMSender databaseID](self, "databaseID");
  -[EMSender addresses](self, "addresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSender contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithDatabaseID:addresses:contactIdentifier:bucket:", v5, v6, v7, -[EMSender bucket](self, "bucket"));

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMSender)initWithCoder:(id)a3
{
  id v4;
  EMSender *v5;
  uint64_t v6;
  NSString *contactIdentifier;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  EFLocked *addresses;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EMSender;
  v5 = -[EMSender init](&v18, sel_init);
  if (v5)
  {
    v5->_databaseID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("EFPropertyKey_databaseID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_contactIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    v5->_bucket = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_bucket"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("EFPropertyKey_addresses"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v14 = (void *)objc_msgSend(v12, "mutableCopy");
    v15 = objc_msgSend(v13, "initWithObject:", v14);
    addresses = v5->_addresses;
    v5->_addresses = (EFLocked *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", -[EMSender databaseID](self, "databaseID"), CFSTR("EFPropertyKey_databaseID"));
  -[EMSender addresses](self, "addresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_addresses"));

  -[EMSender contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_contactIdentifier"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[EMSender bucket](self, "bucket"), CFSTR("EFPropertyKey_bucket"));
}

- (void)addAddress:(id)a3
{
  id v4;
  EFLocked *addresses;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  addresses = self->_addresses;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __23__EMSender_addAddress___block_invoke;
  v7[3] = &unk_1E70F60D0;
  v8 = v4;
  v6 = v4;
  -[EFLocked performWhileLocked:](addresses, "performWhileLocked:", v7);

}

uint64_t __23__EMSender_addAddress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeAddress:(id)a3
{
  id v4;
  EFLocked *addresses;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  addresses = self->_addresses;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__EMSender_removeAddress___block_invoke;
  v7[3] = &unk_1E70F60D0;
  v8 = v4;
  v6 = v4;
  -[EFLocked performWhileLocked:](addresses, "performWhileLocked:", v7);

}

uint64_t __26__EMSender_removeAddress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (NSArray)addresses
{
  return (NSArray *)-[EFLocked getObject](self->_addresses, "getObject");
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  EFAtomicObjectLoad();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EMSender addresses](self, "addresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithArray:", v16);
    objc_msgSend(v5, "ef_mostCommonObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      if (v7 == 1)
        objc_msgSend(v6, "firstObject");
      else
        -[EMSender _bestDisplayNameFromDisplayNames:](self, "_bestDisplayNameFromDisplayNames:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
LABEL_17:
        v3 = 0;
LABEL_20:

        return (NSString *)v3;
      }
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "emailAddressValue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "simpleAddress");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {

              goto LABEL_19;
            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v9)
            continue;
          break;
        }
      }

      objc_msgSend(v8, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_17;
    }
LABEL_19:
    EFAtomicObjectSetIfNil();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  return (NSString *)v3;
}

id __23__EMSender_displayName__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_bestDisplayNameFromDisplayNames:(id)a3
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  BOOL v26;
  unint64_t v27;
  id obj;
  _BOOL4 v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v24;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v3)
  {
    v33 = 0;
    v30 = 0;
    v27 = 0;
    v31 = *(_QWORD *)v35;
    do
    {
      v32 = v3;
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v35 != v31)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D13AD8], "componentsFromString:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "givenName");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        v9 = v7 != 0;
        if (!v33 || v7)
        {
          objc_msgSend(v6, "familyName");
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          v29 = v10 != 0;
          if (!v30 || v10)
          {
            v26 = v9;
            objc_msgSend(v6, "namePrefix");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "middleName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "nameSuffix");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "nickname");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            v17 = v12 != 0;
            v18 = 1;
            if (v12)
              v18 = 2;
            if (v13)
              v17 = v18;
            if (v14)
              v19 = v17 + 1;
            else
              v19 = v17;

            if (v16)
              ++v19;
            if (v27 <= v19)
            {
              if (v8 != 0 && !v33 || v11 != 0 && !v30 || v19 > v27)
              {
                objc_msgSend(v25, "removeAllObjects");
                v33 = v26;
                v30 = v29;
                v27 = v19;
              }
              objc_msgSend(v25, "addObject:", v5);
            }
          }

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v3);
  }

  if (objc_msgSend(v25, "count") == 1)
  {
    objc_msgSend(v25, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("length"), 0);
    v38 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sortUsingDescriptors:", v22);

    objc_msgSend(v25, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (void)setBucket:(int64_t)a3
{
  self->_bucket = a3;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end
