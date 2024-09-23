@implementation MPMediaPlaylistCreationMetadata

- (MPMediaPlaylistCreationMetadata)init
{

  return 0;
}

- (MPMediaPlaylistCreationMetadata)initWithName:(NSString *)name
{
  NSString *v4;
  MPMediaPlaylistCreationMetadata *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *defaultAuthorDisplayName;
  void *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  NSString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *v21;
  NSObject *v22;
  NSString *v23;
  NSString *descriptionText;
  MPMediaPlaylistCreationMetadata *v25;
  NSObject *v26;
  objc_super v28;
  uint8_t buf[16];

  v4 = name;
  if (-[NSString length](v4, "length"))
  {
    v28.receiver = self;
    v28.super_class = (Class)MPMediaPlaylistCreationMetadata;
    v5 = -[MPMediaPlaylistCreationMetadata init](&v28, sel_init);
    if (v5)
    {
      v6 = -[NSString copy](v4, "copy");
      v7 = v5->_name;
      v5->_name = (NSString *)v6;

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedInfoDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("CFBundleDisplayName"));
      v10 = objc_claimAutoreleasedReturnValue();
      defaultAuthorDisplayName = v5->_defaultAuthorDisplayName;
      v5->_defaultAuthorDisplayName = (NSString *)v10;

      if (!-[NSString length](v5->_defaultAuthorDisplayName, "length"))
      {
        objc_msgSend(v8, "localizedInfoDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("CFBundleExecutable"));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v5->_defaultAuthorDisplayName;
        v5->_defaultAuthorDisplayName = (NSString *)v13;

      }
      if (!-[NSString length](v5->_defaultAuthorDisplayName, "length"))
      {
        objc_msgSend(v8, "infoDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("CFBundleDisplayName"));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v5->_defaultAuthorDisplayName;
        v5->_defaultAuthorDisplayName = (NSString *)v16;

      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "infoDictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", CFSTR("CFBundleExecutable"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v5->_defaultAuthorDisplayName;
      v5->_defaultAuthorDisplayName = (NSString *)v20;

      if (!-[NSString length](v5->_defaultAuthorDisplayName, "length"))
      {
        v22 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_193B9B000, v22, OS_LOG_TYPE_ERROR, "Could not resolve default author display name", buf, 2u);
        }

        v23 = v5->_defaultAuthorDisplayName;
        v5->_defaultAuthorDisplayName = (NSString *)&stru_1E3163D10;

      }
      descriptionText = v5->_descriptionText;
      v5->_descriptionText = (NSString *)&stru_1E3163D10;

    }
    self = v5;
    v25 = self;
  }
  else
  {
    v26 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_ERROR, "Cannot create playlist with an empty name", buf, 2u);
    }

    v25 = 0;
  }

  return v25;
}

- (NSString)authorDisplayName
{
  void *v3;
  uint64_t v4;

  v3 = (void *)-[NSString copy](self->_authorDisplayName, "copy");
  if (!objc_msgSend(v3, "length"))
  {
    v4 = -[NSString copy](self->_defaultAuthorDisplayName, "copy");

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setAuthorDisplayName:(NSString *)authorDisplayName
{
  objc_setProperty_nonatomic_copy(self, a2, authorDisplayName, 24);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(NSString *)descriptionText
{
  objc_setProperty_nonatomic_copy(self, a2, descriptionText, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_authorDisplayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultAuthorDisplayName, 0);
}

@end
