@implementation MSASPersonInfoManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MSASPersonInfoManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_manager;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "sharedManager", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __38__MSASPersonInfoManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___MSASPersonInfoManager;
  v1 = objc_msgSend(objc_msgSendSuper2(&v6, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedManager_manager;
  sharedManager_manager = v1;

  v3 = (void *)sharedManager_manager;
  MSPathAlbumSharingDir();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("personID.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initWithPath:", v5);

}

- (MSASPersonInfoManager)initWithPath:(id)a3
{
  void *v5;
  int v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *personIDToPersonInfoDictionary;
  MSASPersonInfoManager *result;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_pathForPersonInfoDictionary, a3);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v10);

  if (v6)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", self->_pathForPersonInfoDictionary);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  personIDToPersonInfoDictionary = self->_personIDToPersonInfoDictionary;
  self->_personIDToPersonInfoDictionary = v7;

  return result;
}

- (BOOL)updateWithSharingRelationship:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *personIDToPersonInfoDictionary;
  NSString *pathForPersonInfoDictionary;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  MSASPersonInfoManager *v29;
  __int16 v30;
  NSMutableDictionary *v31;
  __int16 v32;
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v27 = v5;
    -[NSMutableDictionary objectForKey:](self->_personIDToPersonInfoDictionary, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "objectForKey:", kMSASPersonInfoFirstNameKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstName");
    v9 = objc_claimAutoreleasedReturnValue();
    v26 = v8;
    if (v9 && (objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
    {
      objc_msgSend(v7, "setObject:forKey:", v9, kMSASPersonInfoFirstNameKey);
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v7, "objectForKey:", kMSASPersonInfoLastNameKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_msgSend(v12, "isEqualToString:", v13) & 1) == 0)
    {
      objc_msgSend(v7, "setObject:forKey:", v13, kMSASPersonInfoLastNameKey);
      v10 = 1;
    }
    v14 = v10;
    objc_msgSend(v7, "objectForKey:", kMSASPersonInfoFullNameKey);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v9;
    v24 = v15;
    if (v16 && (objc_msgSend(v15, "isEqualToString:", v16) & 1) == 0)
    {
      objc_msgSend(v7, "setObject:forKey:", v16, kMSASPersonInfoFullNameKey);
      v14 = 1;
    }
    objc_msgSend(v7, "objectForKey:", kMSASPersonInfoEmailKey);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "email");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v17;
    if (v18 && (objc_msgSend(v17, "isEqualToString:", v18, v17) & 1) == 0)
    {
      objc_msgSend(v7, "setObject:forKey:", v18, kMSASPersonInfoEmailKey);
    }
    else if (!v14)
    {
      v11 = 0;
      v19 = v24;
LABEL_23:

      v5 = v27;
      goto LABEL_24;
    }
    -[NSMutableDictionary setObject:forKey:](self->_personIDToPersonInfoDictionary, "setObject:forKey:", v7, v27, v23);
    v11 = 1;
    v19 = v24;
    if ((-[NSMutableDictionary writeToFile:atomically:](self->_personIDToPersonInfoDictionary, "writeToFile:atomically:", self->_pathForPersonInfoDictionary, 1) & 1) == 0&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      personIDToPersonInfoDictionary = self->_personIDToPersonInfoDictionary;
      pathForPersonInfoDictionary = self->_pathForPersonInfoDictionary;
      *(_DWORD *)buf = 138543874;
      v29 = self;
      v30 = 2114;
      v31 = personIDToPersonInfoDictionary;
      v32 = 2112;
      v33 = pathForPersonInfoDictionary;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Failed to save personIDToPersonInfo dictionary %{public}@ to %@.", buf, 0x20u);
    }
    goto LABEL_23;
  }
  v11 = 0;
LABEL_24:

  return v11;
}

- (id)firstNameForPersonID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->_personIDToPersonInfoDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", kMSASPersonInfoFirstNameKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)lastNameForPersonID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->_personIDToPersonInfoDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", kMSASPersonInfoLastNameKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fullNameForPersonID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->_personIDToPersonInfoDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", kMSASPersonInfoFullNameKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)emailForPersonID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->_personIDToPersonInfoDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", kMSASPersonInfoEmailKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)personIDToPersonInfoDictionary
{
  return self->_personIDToPersonInfoDictionary;
}

- (void)setPersonIDToPersonInfoDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_personIDToPersonInfoDictionary, a3);
}

- (NSString)pathForPersonInfoDictionary
{
  return self->_pathForPersonInfoDictionary;
}

- (void)setPathForPersonInfoDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_pathForPersonInfoDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathForPersonInfoDictionary, 0);
  objc_storeStrong((id *)&self->_personIDToPersonInfoDictionary, 0);
}

@end
