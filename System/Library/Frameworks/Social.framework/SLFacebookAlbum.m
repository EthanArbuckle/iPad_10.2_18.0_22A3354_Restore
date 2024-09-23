@implementation SLFacebookAlbum

- (SLFacebookAlbum)initWithCoder:(id)a3
{
  id v4;
  SLFacebookAlbum *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SLFacebookAlbum;
  v5 = -[SLFacebookAlbum init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLFacebookAlbum setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLFacebookAlbum setName:](v5, "setName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coverPhotoIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLFacebookAlbum setCoverPhotoIdentifier:](v5, "setCoverPhotoIdentifier:", v8);

    -[SLFacebookAlbum setCount:](v5, "setCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count")));
    -[SLFacebookAlbum setCanUpload:](v5, "setCanUpload:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canUpload")));
    -[SLFacebookAlbum setIsDefaultAlbum:](v5, "setIsDefaultAlbum:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefaultAlbum")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SLFacebookAlbum identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[SLFacebookAlbum name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("name"));

  -[SLFacebookAlbum coverPhotoIdentifier](self, "coverPhotoIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("coverPhotoIdentifier"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[SLFacebookAlbum count](self, "count"), CFSTR("count"));
  objc_msgSend(v7, "encodeBool:forKey:", -[SLFacebookAlbum canUpload](self, "canUpload"), CFSTR("canUpload"));
  objc_msgSend(v7, "encodeBool:forKey:", -[SLFacebookAlbum isDefaultAlbum](self, "isDefaultAlbum"), CFSTR("isDefaultAlbum"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)albumWithDataDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  SLFacebookAlbum *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (SLFacebookAlbum *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      _SLLog(v3, 6, CFSTR("Creating album with dict %@"));
      v6 = objc_alloc_init(SLFacebookAlbum);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLFacebookAlbum setIdentifier:](v6, "setIdentifier:", v7);

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLFacebookAlbum setName:](v6, "setName:", v8);

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photo_count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLFacebookAlbum setCount:](v6, "setCount:", (int)objc_msgSend(v9, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cover_photo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLFacebookAlbum setCoverPhotoIdentifier:](v6, "setCoverPhotoIdentifier:", v10);

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("can_upload"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("can_upload"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLFacebookAlbum setCanUpload:](v6, "setCanUpload:", objc_msgSend(v12, "BOOLValue"));

        -[SLFacebookAlbum canUpload](v6, "canUpload");
        _SLLog(v3, 6, CFSTR("Setting canUpload=%s"));
      }
      else
      {
        _SLLog(v3, 6, CFSTR("Assuming can_upload"));
        -[SLFacebookAlbum setCanUpload:](v6, "setCanUpload:", 1);
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)albumsWithAlbumDataDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_opt_class(), "albumWithDataDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLFacebookAlbum identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLFacebookAlbum name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SLFacebookAlbum isDefaultAlbum](self, "isDefaultAlbum");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SLFacebookAlbum: identifier=%@ name=%@ isDefaultAlbum=%@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)coverPhotoIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCoverPhotoIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (BOOL)canUpload
{
  return self->_canUpload;
}

- (void)setCanUpload:(BOOL)a3
{
  self->_canUpload = a3;
}

- (BOOL)isDefaultAlbum
{
  return self->_isDefaultAlbum;
}

- (void)setIsDefaultAlbum:(BOOL)a3
{
  self->_isDefaultAlbum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverPhotoIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
