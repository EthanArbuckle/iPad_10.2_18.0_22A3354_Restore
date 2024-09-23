@implementation MSASAssetCollection

- (NSString)fullName
{
  NSString *fullName;
  NSString **p_fullName;
  void *v5;
  void *v6;
  void *v7;

  p_fullName = &self->_fullName;
  fullName = self->_fullName;
  if (!fullName)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "fullNameForPersonID:", self->_personID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_fullName, v7);

    }
    fullName = *p_fullName;
  }
  return fullName;
}

- (NSString)firstName
{
  NSString *firstName;
  NSString **p_firstName;
  void *v5;
  void *v6;
  void *v7;

  p_firstName = &self->_firstName;
  firstName = self->_firstName;
  if (!firstName)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "firstNameForPersonID:", self->_personID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_firstName, v7);

    }
    firstName = *p_firstName;
  }
  return firstName;
}

- (NSString)lastName
{
  NSString *lastName;
  NSString **p_lastName;
  void *v5;
  void *v6;
  void *v7;

  p_lastName = &self->_lastName;
  lastName = self->_lastName;
  if (!lastName)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "lastNameForPersonID:", self->_personID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_lastName, v7);

    }
    lastName = *p_lastName;
  }
  return lastName;
}

- (NSString)email
{
  NSString *email;
  NSString **p_email;
  void *v5;
  void *v6;
  void *v7;

  p_email = &self->_email;
  email = self->_email;
  if (!email)
  {
    +[MSASPersonInfoManager sharedManager](MSASPersonInfoManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "emailForPersonID:", self->_personID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_storeStrong((id *)p_email, v7);

    }
    email = *p_email;
  }
  return email;
}

- (MSASAssetCollection)initWithFileName:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  MSASAssetCollection *v9;
  MSASAssetCollection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSASAssetCollection;
  v9 = -[MSASAssetCollection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileName, a3);
    objc_storeStrong((id *)&v10->_path, a4);
    v10->_photoNumber = -1;
  }

  return v10;
}

- (void)setAssets:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *assets;
  id v7;

  v4 = a3;
  -[MSASAssetCollection GUID](self, "GUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  _copyAssetsIntoAssetCollection(v4, self, v7);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  assets = self->_assets;
  self->_assets = v5;

}

- (id)description
{
  void *v3;
  void *v4;
  NSString *lastName;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)MSASAssetCollection;
  -[MSASAssetCollection description](&v21, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_GUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" GUID: %@"), self->_GUID);
  if (self->_albumGUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" album GUID: %@"), self->_albumGUID);
  if (self->_firstName)
  {
    lastName = self->_lastName;
    if (lastName)
      objc_msgSend(v4, "appendFormat:", CFSTR(" first,last name: %@,%@"), self->_firstName, lastName);
  }
  if (self->_fullName)
    objc_msgSend(v4, "appendFormat:", CFSTR(" full name = %@"), self->_fullName);
  if (self->_personID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" personID = %@"), self->_personID);
  if (self->_email)
    objc_msgSend(v4, "appendFormat:", CFSTR(" email = %@"), self->_email);
  v6 = CFSTR("YES");
  if (self->_isMine)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (!self->_isDeletable)
    v6 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR(" isMine=%@ isDeletable=%@"), v7, v6);
  objc_msgSend(v4, "appendFormat:", CFSTR(" photo number: %lld"), self->_photoNumber);
  if (self->_timestamp)
    objc_msgSend(v4, "appendFormat:", CFSTR(" Time: %@"), self->_timestamp);
  MSASPlatform();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldLogAtLevel:", 7);

  if (v9)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" Has comments: %d"), -[MSASAssetCollection hasComments](self, "hasComments"));
    if (-[NSDictionary count](self->_metadata, "count"))
      objc_msgSend(v4, "appendFormat:", CFSTR(" collection metadata: %@"), self->_metadata);
    if (-[NSArray count](self->_assets, "count"))
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(" Assets:\n"));
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = self->_assets;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "description");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v12);
      }

    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  -[MSASAssetCollection GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSASAssetCollection GUID](self, "GUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v5, CFSTR("GUID"));

  }
  -[MSASAssetCollection ctag](self, "ctag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSASAssetCollection ctag](self, "ctag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v7, CFSTR("ctag"));

  }
  -[MSASAssetCollection albumGUID](self, "albumGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MSASAssetCollection albumGUID](self, "albumGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v9, CFSTR("albumGUID"));

  }
  -[MSASAssetCollection assets](self, "assets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MSASAssetCollection assets](self, "assets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v11, CFSTR("assets"));

  }
  -[MSASAssetCollection fileName](self, "fileName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MSASAssetCollection fileName](self, "fileName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v13, CFSTR("fileName"));

  }
  -[MSASAssetCollection path](self, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MSASAssetCollection path](self, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v15, CFSTR("path"));

  }
  -[MSASAssetCollection timestamp](self, "timestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MSASAssetCollection timestamp](self, "timestamp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v17, CFSTR("timestamp"));

  }
  -[MSASAssetCollection personID](self, "personID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MSASAssetCollection personID](self, "personID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v19, CFSTR("personID"));

  }
  -[MSASAssetCollection fullName](self, "fullName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[MSASAssetCollection fullName](self, "fullName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v21, CFSTR("fullName"));

  }
  -[MSASAssetCollection firstName](self, "firstName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[MSASAssetCollection firstName](self, "firstName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v23, CFSTR("firstName"));

  }
  -[MSASAssetCollection lastName](self, "lastName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[MSASAssetCollection lastName](self, "lastName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v25, CFSTR("lastName"));

  }
  -[MSASAssetCollection email](self, "email");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[MSASAssetCollection email](self, "email");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v27, CFSTR("email"));

  }
  objc_msgSend(v32, "encodeBool:forKey:", -[MSASAssetCollection isDeletable](self, "isDeletable"), CFSTR("isDeletable"));
  objc_msgSend(v32, "encodeBool:forKey:", -[MSASAssetCollection isMine](self, "isMine"), CFSTR("isMine"));
  -[MSASAssetCollection userInfo](self, "userInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[MSASAssetCollection userInfo](self, "userInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v29, CFSTR("userInfo"));

  }
  -[MSASAssetCollection metadata](self, "metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[MSASAssetCollection metadata](self, "metadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "encodeObject:forKey:", v31, CFSTR("metadata"));

  }
  objc_msgSend(v32, "encodeInt64:forKey:", -[MSASAssetCollection photoNumber](self, "photoNumber"), CFSTR("photoNumber"));

}

- (MSASAssetCollection)initWithCoder:(id)a3
{
  id v4;
  MSASAssetCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MSASAssetCollection;
  v5 = -[MSASAssetCollection init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setGUID:](v5, "setGUID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ctag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setCtag:](v5, "setCtag:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("albumGUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setAlbumGUID:](v5, "setAlbumGUID:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setFileName:](v5, "setFileName:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setPath:](v5, "setPath:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setTimestamp:](v5, "setTimestamp:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setPersonID:](v5, "setPersonID:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setFullName:](v5, "setFullName:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setFirstName:](v5, "setFirstName:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setLastName:](v5, "setLastName:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("email"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setEmail:](v5, "setEmail:", v16);

    -[MSASAssetCollection setIsDeletable:](v5, "setIsDeletable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeletable")));
    -[MSASAssetCollection setIsMine:](v5, "setIsMine:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMine")));
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setUserInfo:](v5, "setUserInfo:", v17);

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("metadata"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setMetadata:](v5, "setMetadata:", v18);

    -[MSASAssetCollection setPhotoNumber:](v5, "setPhotoNumber:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("photoNumber")));
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("assets"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection GUID](v5, "GUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _copyAssetsIntoAssetCollection(v22, v5, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setAssets:](v5, "setAssets:", v24);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *GUID;
  void *v6;
  BOOL v7;
  BOOL v9;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    GUID = self->_GUID;
    objc_msgSend(v4, "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[NSString isEqualToString:](GUID, "isEqualToString:", v6);
    return v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSASAssetCollection;
    v9 = -[MSASAssetCollection isEqual:](&v10, sel_isEqual_, v4);

    return v9;
  }
}

- (unint64_t)hash
{
  return -[NSString hash](self->_GUID, "hash");
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6;
  NSDictionary *metadata;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  metadata = self->_metadata;
  if (metadata)
  {
    v8 = (void *)-[NSDictionary mutableCopy](metadata, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (v10)
    objc_msgSend(v8, "setObject:forKey:", v10, v6);
  else
    objc_msgSend(v8, "removeObjectForKey:", v6);
  -[MSASAssetCollection setMetadata:](self, "setMetadata:", v9);

}

- (void)setMetadata:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  v5 = a3;
  objc_storeStrong((id *)&self->_metadata, a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MSASAssetCollection assets](self, "assets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(v5, "objectForKey:", CFSTR("batchDateCreated"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBatchCreationDate:", v12);

        objc_msgSend(v5, "objectForKey:", CFSTR("dateCreated"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPhotoCreationDate:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (BOOL)hasVideoAsset
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_assets;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isVideo", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isVideo
{
  return !-[MSASAssetCollection isPhotoIris](self, "isPhotoIris")
      && -[MSASAssetCollection hasVideoAsset](self, "hasVideoAsset");
}

- (BOOL)isPhotoIris
{
  void *v2;
  BOOL v3;

  -[NSDictionary objectForKey:](self->_metadata, "objectForKey:", CFSTR("mediaGroupUUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isAutoloopVideo
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_metadata, "objectForKey:", CFSTR("playback-style-identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("autoloop"));

  return v3;
}

- (id)mediaAssetType
{
  if (-[MSASAssetCollection isVideo](self, "isVideo"))
    return CFSTR("video");
  else
    return CFSTR("unknown");
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[MSASAssetCollection assetCollectionWithAssetCollection:](MSASAssetCollection, "assetCollectionWithAssetCollection:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_storeStrong((id *)&self->_GUID, a3);
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setCtag:(id)a3
{
  objc_storeStrong((id *)&self->_ctag, a3);
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_albumGUID, a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (int64_t)photoNumber
{
  return self->_photoNumber;
}

- (void)setPhotoNumber:(int64_t)a3
{
  self->_photoNumber = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (BOOL)hasComments
{
  return self->_hasComments;
}

- (void)setHasComments:(BOOL)a3
{
  self->_hasComments = a3;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_personID, a3);
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (void)setIsDeletable:(BOOL)a3
{
  self->_isDeletable = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

+ (id)assetCollectionWithAssetCollection:(id)a3
{
  id v3;
  MSASAssetCollection *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = objc_alloc_init(MSASAssetCollection);
  objc_msgSend(v3, "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setGUID:](v4, "setGUID:", v5);

  objc_msgSend(v3, "albumGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setAlbumGUID:](v4, "setAlbumGUID:", v6);

  objc_msgSend(v3, "ctag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setCtag:](v4, "setCtag:", v7);

  objc_msgSend(v3, "fileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setFileName:](v4, "setFileName:", v8);

  objc_msgSend(v3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setPath:](v4, "setPath:", v9);

  objc_msgSend(v3, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setTimestamp:](v4, "setTimestamp:", v10);

  objc_msgSend(v3, "personID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setPersonID:](v4, "setPersonID:", v11);

  objc_msgSend(v3, "fullName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setFullName:](v4, "setFullName:", v12);

  objc_msgSend(v3, "firstName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setFirstName:](v4, "setFirstName:", v13);

  objc_msgSend(v3, "lastName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setLastName:](v4, "setLastName:", v14);

  objc_msgSend(v3, "email");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setEmail:](v4, "setEmail:", v15);

  -[MSASAssetCollection setIsDeletable:](v4, "setIsDeletable:", objc_msgSend(v3, "isDeletable"));
  -[MSASAssetCollection setIsMine:](v4, "setIsMine:", objc_msgSend(v3, "isMine"));
  objc_msgSend(v3, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setUserInfo:](v4, "setUserInfo:", v16);

  objc_msgSend(v3, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setMetadata:](v4, "setMetadata:", v17);

  objc_msgSend(v3, "assets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSASAssetCollection GUID](v4, "GUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _copyAssetsIntoAssetCollection(v18, v4, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection setAssets:](v4, "setAssets:", v20);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)MSASPProtocolDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSASAssetCollection GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("assetguid"));

  -[MSASAssetCollection fileName](self, "fileName");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    if (!-[MSASAssetCollection isVideo](self, "isVideo"))
      goto LABEL_7;
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("mp4"));

    if ((v8 & 1) != 0
      || (objc_msgSend(v6, "stringByDeletingPathExtension"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("mp4")),
          v10 = objc_claimAutoreleasedReturnValue(),
          v6,
          v9,
          (v6 = (void *)v10) != 0))
    {
LABEL_7:
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("filename"));

    }
  }
  -[MSASAssetCollection metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("collectionmetadata"));

  -[MSASAssetCollection mediaAssetType](self, "mediaAssetType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("unknown"));
  if (v12 && (v13 & 1) == 0)
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("mediaAssetType"));
  -[MSASAssetCollection assets](self, "assets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0C99DE8];
    -[MSASAssetCollection assets](self, "assets");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[MSASAssetCollection assets](self, "assets", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23), "MSASPProtocolDictionary");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v21);
    }

    if (v18)
      objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("files"));

  }
  return v3;
}

+ (id)MSASPAssetCollectionFromProtocolDictionary:(id)a3
{
  id v3;
  void *v4;
  MSASAssetCollection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  uint64_t v60;
  void *v61;
  void *v63;
  void *v64;
  MSASAssetCollection *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  int v88;
  __int16 v89;
  int v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_alloc_init(MSASAssetCollection);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("derivatives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("derivatives"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("derivatives"));
  objc_msgSend(v4, "objectForKey:", CFSTR("files"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("files"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v77 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("files"));
  objc_msgSend(v4, "objectForKey:", CFSTR("mediaAssetType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("mediaAssetType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v76 = (void *)v8;

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("mediaAssetType"));
  if (v11)
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("video"));
  else
    v12 = 0;
  v75 = v11;
  objc_msgSend(v4, "objectForKey:", CFSTR("assetguid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("assetguid"));
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("assetguid"));
  if (v14)
    -[MSASAssetCollection setGUID:](v5, "setGUID:", v14);
  v74 = (void *)v14;
  objc_msgSend(v4, "objectForKey:", CFSTR("filename"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("filename"));
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("filename"));
  if (v16)
    -[MSASAssetCollection setFileName:](v5, "setFileName:", v16);
  v73 = (void *)v16;
  objc_msgSend(v4, "objectForKey:", CFSTR("servertimestamp"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("servertimestamp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("servertimestamp"));
  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSASAssetCollection setTimestamp:](v5, "setTimestamp:", v20);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("personid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("personid"));
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("personid"));
  if (v22)
    -[MSASAssetCollection setPersonID:](v5, "setPersonID:", v22);
  v71 = (void *)v22;
  objc_msgSend(v4, "objectForKey:", CFSTR("firstname"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("firstname"));
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  v25 = v3;

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("firstname"));
  if (v24)
    -[MSASAssetCollection setFirstName:](v5, "setFirstName:", v24);
  v70 = (void *)v24;
  objc_msgSend(v4, "objectForKey:", CFSTR("lastname"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("lastname"));
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("lastname"));
  if (v27)
    -[MSASAssetCollection setLastName:](v5, "setLastName:", v27);
  objc_msgSend(v4, "objectForKey:", CFSTR("fullname"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("fullname"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("fullname"));
  if (v29)
    -[MSASAssetCollection setFullName:](v5, "setFullName:", v29);
  v30 = v25;
  objc_msgSend(v4, "objectForKey:", CFSTR("email"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("email"));
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("email"));
  if (v32)
    -[MSASAssetCollection setEmail:](v5, "setEmail:", v32);
  v68 = (void *)v32;
  v72 = v18;
  v33 = v30;
  objc_msgSend(v30, "objectForKey:", CFSTR("createdbyme"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v69 = (void *)v27;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v30, "objectForKey:", CFSTR("createdbyme"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("1"));

  }
  else
  {
    v36 = objc_msgSend(0, "isEqualToString:", CFSTR("1"));
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("createdbyme"));
  -[MSASAssetCollection setIsMine:](v5, "setIsMine:", v36);
  objc_msgSend(v30, "objectForKey:", CFSTR("candelete"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v30, "objectForKey:", CFSTR("candelete"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("1"));

  }
  else
  {
    v39 = objc_msgSend(0, "isEqualToString:", CFSTR("1"));
  }
  v40 = v77;

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("candelete"));
  -[MSASAssetCollection setIsDeletable:](v5, "setIsDeletable:", v39);
  objc_msgSend(v4, "objectForKey:", CFSTR("collectionmetadata"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("collectionmetadata"));
    v42 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("collectionmetadata"));
  if (v42)
    -[MSASAssetCollection setMetadata:](v5, "setMetadata:", v42);
  objc_msgSend(v4, "objectForKey:", CFSTR("assetnumber"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("assetnumber"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("assetnumber"));
  if (v44)
    -[MSASAssetCollection setPhotoNumber:](v5, "setPhotoNumber:", objc_msgSend(v44, "longLongValue"));
  v67 = (void *)v42;
  if (v77)
  {
    v66 = v4;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v45 = v77;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    if (!v46)
    {
LABEL_101:

      v4 = v66;
      v54 = v76;
      goto LABEL_102;
    }
    v47 = v46;
    v64 = v44;
    v65 = v5;
    v63 = v33;
    v48 = *(_QWORD *)v83;
    v49 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v83 != v48)
          objc_enumerationMutation(v45);
        v51 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[MSAsset MSASPAssetFromProtocolDictionary:](MSAsset, "MSASPAssetFromProtocolDictionary:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
            objc_msgSend(v6, "addObject:", v52);
          if (v12 != objc_msgSend(v52, "isVideo", v63) && os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v53 = objc_msgSend(v52, "isVideo");
            *(_DWORD *)buf = 67109376;
            v88 = v53;
            v89 = 1024;
            v90 = v12;
            _os_log_error_impl(&dword_1D3E94000, v49, OS_LOG_TYPE_ERROR, "Found inconsistency of media asset type between asset (%d) and asset collection (%d)", buf, 0xEu);
          }

        }
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    }
    while (v47);
    v33 = v63;
LABEL_100:
    v44 = v64;
    v5 = v65;
    v40 = v77;
    goto LABEL_101;
  }
  v54 = v76;
  if (v76)
  {
    v64 = v44;
    v65 = v5;
    v66 = v4;
    +[MSAsset MSASPAssetFromProtocolDictionary:](MSAsset, "MSASPAssetFromProtocolDictionary:", v4);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    if (v45)
      objc_msgSend(v6, "addObject:", v45);
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v55 = v76;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v57; ++j)
        {
          if (*(_QWORD *)v79 != v58)
            objc_enumerationMutation(v55);
          v60 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[MSAsset MSASPAssetFromProtocolDictionary:](MSAsset, "MSASPAssetFromProtocolDictionary:", v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (v61)
              objc_msgSend(v6, "addObject:", v61);

          }
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
      }
      while (v57);
    }

    goto LABEL_100;
  }
LABEL_102:
  -[MSASAssetCollection setAssets:](v5, "setAssets:", v6, v63);

  return v5;
}

@end
