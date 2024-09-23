@implementation CNContactChangeRequest

+ (id)contactChangeRequestWithKind:(int64_t)a3 contacts:(id)a4 linkIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKind:contacts:linkIdentifier:", a3, v9, v8);

  return v10;
}

- (CNContactChangeRequest)initWithKind:(int64_t)a3 contacts:(id)a4 linkIdentifier:(id)a5
{
  id v8;
  id v9;
  CNContactChangeRequest *v10;
  uint64_t v11;
  NSArray *contacts;
  uint64_t v13;
  NSString *linkIdentifier;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNContactChangeRequest;
  v10 = -[CNContactChangeRequest init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    contacts = v10->_contacts;
    v10->_contacts = (NSArray *)v11;

    v10->_kind = a3;
    v13 = objc_msgSend(v9, "copy");
    linkIdentifier = v10->_linkIdentifier;
    v10->_linkIdentifier = (NSString *)v13;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactChangeRequest)initWithCoder:(id)a3
{
  id v4;
  CNContactChangeRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *contacts;
  void *v11;
  NSString *v12;
  NSString *linkIdentifier;
  CNContactChangeRequest *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNContactChangeRequest;
  v5 = -[CNContactChangeRequest init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_contacts"));
    v9 = objc_claimAutoreleasedReturnValue();
    contacts = v5->_contacts;
    v5->_contacts = (NSArray *)v9;

    v5->_kind = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_kind"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_linkIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSString *)objc_msgSend(v11, "copy");
    linkIdentifier = v5->_linkIdentifier;
    v5->_linkIdentifier = v12;

    objc_storeStrong((id *)&v5->_linkIdentifier, v12);
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *contacts;
  id v5;

  contacts = self->_contacts;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contacts, CFSTR("_contacts"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_kind, CFSTR("_kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linkIdentifier, CFSTR("_linkIdentifier"));

}

- (NSArray)contactIdentifiers
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_contacts, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_contacts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v9, "isUnified"))
        {
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          objc_msgSend(v9, "linkedContactsFromStoreWithIdentifier:", 0, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "identifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v15);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v12);
          }
        }
        else
        {
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)linkIdentifier
{
  return self->_linkIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkIdentifier, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
