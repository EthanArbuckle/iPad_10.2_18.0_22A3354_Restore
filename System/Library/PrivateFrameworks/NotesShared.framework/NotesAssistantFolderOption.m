@implementation NotesAssistantFolderOption

+ (void)disambiguateFolderOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

        }
        objc_msgSend(v13, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "allValues", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        if ((unint64_t)objc_msgSend(v20, "count") >= 2)
          objc_msgSend(a1, "disambiguateSameTitleFolderOptions:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("fullTitle"), 1, sel_localizedCaseInsensitiveCompare_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortUsingDescriptors:", v22);

}

- (NotesAssistantFolderOption)initWithLegacyFolder:(id)a3
{
  id v4;
  NotesAssistantFolderOption *v5;
  uint64_t v6;
  NSManagedObjectID *managedObjectID;
  uint64_t v8;
  NSString *title;
  void *v10;
  uint64_t v11;
  NSString *parentTitle;
  void *v13;
  uint64_t v14;
  NSString *accountTitle;
  uint64_t v16;
  NSString *identifierURIPathComponent;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NotesAssistantFolderOption;
  v5 = -[NotesAssistantFolderOption init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectID");
    v6 = objc_claimAutoreleasedReturnValue();
    managedObjectID = v5->_managedObjectID;
    v5->_managedObjectID = (NSManagedObjectID *)v6;

    objc_msgSend(v4, "localizedTitle");
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_storeStrong((id *)&v5->_fullTitle, v5->_title);
    objc_msgSend(v4, "parentFolder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedTitle");
    v11 = objc_claimAutoreleasedReturnValue();
    parentTitle = v5->_parentTitle;
    v5->_parentTitle = (NSString *)v11;

    objc_msgSend(v4, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = objc_claimAutoreleasedReturnValue();
    accountTitle = v5->_accountTitle;
    v5->_accountTitle = (NSString *)v14;

    objc_msgSend(v4, "identifierURIPathComponent");
    v16 = objc_claimAutoreleasedReturnValue();
    identifierURIPathComponent = v5->_identifierURIPathComponent;
    v5->_identifierURIPathComponent = (NSString *)v16;

  }
  return v5;
}

- (NotesAssistantFolderOption)initWithModernFolder:(id)a3
{
  id v4;
  NotesAssistantFolderOption *v5;
  uint64_t v6;
  NSManagedObjectID *managedObjectID;
  uint64_t v8;
  NSString *title;
  void *v10;
  uint64_t v11;
  NSString *parentTitle;
  uint64_t v13;
  NSString *accountTitle;
  uint64_t v15;
  NSString *identifierURIPathComponent;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  NSString *accountIdentifier;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NotesAssistantFolderOption;
  v5 = -[NotesAssistantFolderOption init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectID");
    v6 = objc_claimAutoreleasedReturnValue();
    managedObjectID = v5->_managedObjectID;
    v5->_managedObjectID = (NSManagedObjectID *)v6;

    objc_msgSend(v4, "localizedTitle");
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_storeStrong((id *)&v5->_fullTitle, v5->_title);
    objc_msgSend(v4, "parent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedTitle");
    v11 = objc_claimAutoreleasedReturnValue();
    parentTitle = v5->_parentTitle;
    v5->_parentTitle = (NSString *)v11;

    objc_msgSend(v4, "accountName");
    v13 = objc_claimAutoreleasedReturnValue();
    accountTitle = v5->_accountTitle;
    v5->_accountTitle = (NSString *)v13;

    objc_msgSend(v4, "identifierURIPathComponent");
    v15 = objc_claimAutoreleasedReturnValue();
    identifierURIPathComponent = v5->_identifierURIPathComponent;
    v5->_identifierURIPathComponent = (NSString *)v15;

    objc_msgSend(v4, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "accountType");

    if (v18 == 1)
    {
      objc_msgSend(v4, "account");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = objc_claimAutoreleasedReturnValue();
      accountIdentifier = v5->_accountIdentifier;
      v5->_accountIdentifier = (NSString *)v20;

    }
    else
    {
      v19 = v5->_accountIdentifier;
      v5->_accountIdentifier = 0;
    }

  }
  return v5;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NotesAssistantFolderOption title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(title: \"%@\")"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)disambiguateSameTitleFolderOptions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "parentTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "parentTitle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@/%@"), v12, v9);
        }
        else
        {
          objc_msgSend(v8, "accountTitle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(" [%@]"), v12);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setFullTitle:", v13);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (NSString)accountTitle
{
  return self->_accountTitle;
}

- (void)setAccountTitle:(id)a3
{
  objc_storeStrong((id *)&self->_accountTitle, a3);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSString)fullTitle
{
  return self->_fullTitle;
}

- (void)setFullTitle:(id)a3
{
  objc_storeStrong((id *)&self->_fullTitle, a3);
}

- (NSManagedObjectID)managedObjectID
{
  return self->_managedObjectID;
}

- (void)setManagedObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectID, a3);
}

- (NSString)identifierURIPathComponent
{
  return self->_identifierURIPathComponent;
}

- (void)setIdentifierURIPathComponent:(id)a3
{
  objc_storeStrong((id *)&self->_identifierURIPathComponent, a3);
}

- (NSString)parentTitle
{
  return self->_parentTitle;
}

- (void)setParentTitle:(id)a3
{
  objc_storeStrong((id *)&self->_parentTitle, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_parentTitle, 0);
  objc_storeStrong((id *)&self->_identifierURIPathComponent, 0);
  objc_storeStrong((id *)&self->_managedObjectID, 0);
  objc_storeStrong((id *)&self->_fullTitle, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountTitle, 0);
}

@end
