@implementation _SFBrowserWindowStateData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
}

- (_SFBrowserWindowStateData)initWithUUIDString:(id)a3 sceneID:(id)a4
{
  id v7;
  id v8;
  _SFBrowserWindowStateData *v9;
  _SFBrowserWindowStateData *v10;
  uint64_t v11;
  NSString *sceneID;
  _SFBrowserWindowStateData *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFBrowserWindowStateData;
  v9 = -[_SFBrowserWindowStateData init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_UUIDString, a3);
    v11 = objc_msgSend(v8, "copy");
    sceneID = v10->_sceneID;
    v10->_sceneID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_activeProfileIdentifier, (id)*MEMORY[0x1E0D89E20]);
    v13 = v10;
  }

  return v10;
}

- (_SFBrowserWindowStateData)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _SFBrowserWindowStateData *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *UUIDString;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *sceneID;
  uint64_t v16;
  void *v17;
  void *v18;
  _SFBrowserWindowStateData *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFBrowserWindowStateData;
  v5 = -[_SFBrowserWindowStateData init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SafariStateBrowserWindowDatabaseID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "integerValue");
    else
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_databaseID = v8;
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateBrowserWindowUUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v9;

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SafariStateActiveDocumentIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activeDocumentIndex = objc_msgSend(v11, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SafariStatePrivateActiveDocumentIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activePrivateDocumentIndex = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SafariStateFileVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_legacyPlistFileVersion = objc_msgSend(v13, "integerValue");

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateBrowserSceneIDKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    sceneID = v5->_sceneID;
    v5->_sceneID = (NSString *)v14;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateBrowserWindowActiveProfileUUID"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = (void *)*MEMORY[0x1E0D89E20];
    objc_storeStrong((id *)&v5->_activeProfileIdentifier, v18);

    v19 = v5;
  }

  return v5;
}

- (_SFBrowserWindowStateData)initWithSQLiteRow:(id)a3
{
  id v4;
  _SFBrowserWindowStateData *v5;
  uint64_t v6;
  NSString *UUIDString;
  uint64_t v8;
  NSString *sceneID;
  uint64_t v10;
  void *v11;
  void *v12;
  _SFBrowserWindowStateData *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFBrowserWindowStateData;
  v5 = -[_SFBrowserWindowStateData init](&v15, sel_init);
  if (v5)
  {
    v5->_databaseID = (int)objc_msgSend(v4, "intAtIndex:", 0);
    objc_msgSend(v4, "stringAtIndex:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v6;

    objc_msgSend(v4, "stringAtIndex:", 8);
    v8 = objc_claimAutoreleasedReturnValue();
    sceneID = v5->_sceneID;
    v5->_sceneID = (NSString *)v8;

    v5->_type = (int)objc_msgSend(v4, "intAtIndex:", 2);
    v5->_activeDocumentIndex = (int)objc_msgSend(v4, "intAtIndex:", 3);
    v5->_activePrivateDocumentIndex = (int)objc_msgSend(v4, "intAtIndex:", 4);
    v5->_isActiveDocumentValid = objc_msgSend(v4, "BOOLAtIndex:", 5);
    v5->_isTabStateSuccessfullyLoaded = objc_msgSend(v4, "BOOLAtIndex:", 6);
    v5->_legacyPlistFileVersion = (int)objc_msgSend(v4, "intAtIndex:", 7);
    objc_msgSend(v4, "stringAtIndex:", 9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = (void *)*MEMORY[0x1E0D89E20];
    objc_storeStrong((id *)&v5->_activeProfileIdentifier, v12);

    v13 = v5;
  }

  return v5;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p; UUID = %@; sceneID = %@>"),
               objc_opt_class(),
               self,
               self->_UUIDString,
               self->_sceneID);
}

- (BOOL)isEqual:(id)a3
{
  _SFBrowserWindowStateData *v4;
  _SFBrowserWindowStateData *v5;
  BOOL v6;

  v4 = (_SFBrowserWindowStateData *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_databaseID == v5->_databaseID
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && self->_type == v5->_type
        && self->_activeDocumentIndex == v5->_activeDocumentIndex
        && self->_activePrivateDocumentIndex == v5->_activePrivateDocumentIndex
        && self->_isActiveDocumentValid == v5->_isActiveDocumentValid
        && self->_isTabStateSuccessfullyLoaded == v5->_isTabStateSuccessfullyLoaded
        && self->_legacyPlistFileVersion == v5->_legacyPlistFileVersion
        && self->_needsQuickUpdate == v5->_needsQuickUpdate;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSUUID)UUID
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_UUIDString);
}

- (void)setUUID:(id)a3
{
  NSString *v4;
  NSString *UUIDString;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "UUIDString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  UUIDString = self->_UUIDString;
  self->_UUIDString = v4;

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_UUIDString, CFSTR("SafariStateBrowserWindowUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_activeDocumentIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SafariStateActiveDocumentIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_activePrivateDocumentIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SafariStatePrivateActiveDocumentIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_legacyPlistFileVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("SafariStateFileVersion"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sceneID, CFSTR("SafariStateBrowserSceneIDKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_activeProfileIdentifier, CFSTR("SafariStateBrowserWindowActiveProfileUUID"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)isInDatabase
{
  return self->_databaseID != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_UUIDString, a3);
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
  objc_storeStrong((id *)&self->_sceneID, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)activeDocumentIndex
{
  return self->_activeDocumentIndex;
}

- (void)setActiveDocumentIndex:(int64_t)a3
{
  self->_activeDocumentIndex = a3;
}

- (int64_t)activePrivateDocumentIndex
{
  return self->_activePrivateDocumentIndex;
}

- (void)setActivePrivateDocumentIndex:(int64_t)a3
{
  self->_activePrivateDocumentIndex = a3;
}

- (BOOL)isActiveDocumentValid
{
  return self->_isActiveDocumentValid;
}

- (void)setIsActiveDocumentValid:(BOOL)a3
{
  self->_isActiveDocumentValid = a3;
}

- (BOOL)isTabStateSuccessfullyLoaded
{
  return self->_isTabStateSuccessfullyLoaded;
}

- (void)setIsTabStateSuccessfullyLoaded:(BOOL)a3
{
  self->_isTabStateSuccessfullyLoaded = a3;
}

- (int64_t)legacyPlistFileVersion
{
  return self->_legacyPlistFileVersion;
}

- (void)setLegacyPlistFileVersion:(int64_t)a3
{
  self->_legacyPlistFileVersion = a3;
}

- (BOOL)needsQuickUpdate
{
  return self->_needsQuickUpdate;
}

- (void)setNeedsQuickUpdate:(BOOL)a3
{
  self->_needsQuickUpdate = a3;
}

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

- (void)setActiveProfileIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
