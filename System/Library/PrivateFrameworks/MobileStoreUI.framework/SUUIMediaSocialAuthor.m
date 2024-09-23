@implementation SUUIMediaSocialAuthor

- (SUUIMediaSocialAuthor)initWithAuthorDictionary:(id)a3
{
  id v4;
  SUUIMediaSocialAuthor *v5;
  void *v6;
  uint64_t v7;
  NSString *dsid;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSString *authorType;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *permissions;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUUIMediaSocialAuthor;
  v5 = -[SUUIMediaSocialAuthor init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("dsId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      dsid = v5->_dsid;
      v5->_dsid = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("entityId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("entityType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      authorType = v5->_authorType;
      v5->_authorType = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("permissions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v12;
      v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v16, "addObject:", v22);
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v19);
      }

      if (objc_msgSend(v16, "count"))
      {
        v23 = objc_msgSend(v16, "copy");
        permissions = v5->_permissions;
        v5->_permissions = (NSArray *)v23;

      }
      v12 = v26;
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAuthorType:", self->_authorType);
  objc_msgSend(v4, "setDsid:", self->_dsid);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setName:", self->_name);
  objc_msgSend(v4, "setPermissions:", self->_permissions);
  objc_msgSend(v4, "setStorePlatformData:", self->_storePlatformData);
  objc_msgSend(v4, "setThumbnailImageURL:", self->_thumbnailImageURL);
  return v4;
}

- (unint64_t)hash
{
  NSString *identifier;
  unint64_t v4;
  NSString *authorType;
  objc_super v7;

  identifier = self->_identifier;
  if (identifier)
    v4 = -[NSString hash](identifier, "hash");
  else
    v4 = 0;
  authorType = self->_authorType;
  if (authorType)
    v4 ^= -[NSString hash](authorType, "hash");
  if (!v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIMediaSocialAuthor;
    return -[SUUIMediaSocialAuthor hash](&v7, sel_hash);
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[SUUIMediaSocialAuthor identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[SUUIMediaSocialAuthor authorType](self, "authorType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "authorType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isEqualToString:", v10);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)authorType
{
  return self->_authorType;
}

- (void)setAuthorType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)storePlatformData
{
  return self->_storePlatformData;
}

- (void)setStorePlatformData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (void)setThumbnailImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_storePlatformData, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_authorType, 0);
}

@end
