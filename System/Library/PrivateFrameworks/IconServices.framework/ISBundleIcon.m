@implementation ISBundleIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISBundleIcon)initWithBundleURL:(id)a3 type:(id)a4 tag:(id)a5 tagClass:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  ISBundleIcon *v31;
  ISBundleIcon *v32;
  uint64_t v33;
  NSString *tag;
  uint64_t v35;
  NSString *type;
  id obj;
  id obja;
  id v40;
  void *v42;
  void *v43;
  objc_super v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  obj = a3;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v40 = a6;
  v12 = a6;
  objc_msgSend(v9, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    objc_msgSend(v13, "stringByAppendingString:", v10, obj, a6);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  if (v11)
  {
    objc_msgSend(v14, "stringByAppendingString:", v11);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  v43 = v10;
  if (v12)
  {
    objc_msgSend(v14, "stringByAppendingString:", v12);
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithURL:allowPlaceholder:error:", v9, 1, 0);
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v19, "URL"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "isEqual:", v9),
          v20,
          v21))
    {
      v18 = v19;
    }
    else
    {
      v18 = 0;
    }

  }
  objc_msgSend(v18, "alternateIconName", obj);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v12;
  if (v22)
  {
    objc_msgSend(v14, "stringByAppendingString:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v23;
  }
  objc_msgSend(v9, "__is__contentModifiedDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v24, "timeIntervalSinceReferenceDate");
  objc_msgSend(v26, "_IF_UUIDWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB3A28];
  v45[0] = v25;
  v45[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_IF_UUIDByXORingUUIDs:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v44.receiver = self;
  v44.super_class = (Class)ISBundleIcon;
  v31 = -[ISConcreteIcon initWithDigest:](&v44, sel_initWithDigest_, v30);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_url, obja);
    v33 = objc_msgSend(v11, "copy");
    tag = v32->_tag;
    v32->_tag = (NSString *)v33;

    objc_storeStrong((id *)&v32->_tagClass, v40);
    v35 = objc_msgSend(v43, "copy");
    type = v32->_type;
    v32->_type = (NSString *)v35;

  }
  return v32;
}

- (ISBundleIcon)initWithBundleURL:(id)a3
{
  return -[ISBundleIcon initWithBundleURL:type:tag:tagClass:](self, "initWithBundleURL:type:tag:tagClass:", a3, 0, 0, 0);
}

- (ISBundleIcon)initWithBundleURL:(id)a3 type:(id)a4
{
  return -[ISBundleIcon initWithBundleURL:type:tag:tagClass:](self, "initWithBundleURL:type:tag:tagClass:", a3, a4, 0, 0);
}

- (ISBundleIcon)initWithBundleURL:(id)a3 fileExtension:(id)a4
{
  return -[ISBundleIcon initWithBundleURL:type:tag:tagClass:](self, "initWithBundleURL:type:tag:tagClass:", a3, 0, a4, *MEMORY[0x1E0CA5A88]);
}

- (ISBundleIcon)initWithCoder:(id)a3
{
  id v4;
  ISBundleIcon *v5;
  NSURL *v6;
  NSURL *url;
  NSURL *v8;
  uint64_t v9;
  NSString *tag;
  uint64_t v11;
  NSString *tagClass;
  uint64_t v13;
  NSString *type;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ISBundleIcon;
  v5 = -[ISConcreteIcon initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURLString"));
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = v6;
    v8 = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tag"));
    v9 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tagClass"));
    v11 = objc_claimAutoreleasedReturnValue();
    tagClass = v5->_tagClass;
    v5->_tagClass = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v13 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISBundleIcon;
  v4 = a3;
  -[ISConcreteIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("bundleURLString"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tag, CFSTR("tag"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tagClass, CFSTR("tagClass"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("type"));

}

- (id)_makeDocumentResourceProvider
{
  id v3;
  id *p_url;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  ISBundleResourceProvider *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v29;
  id v30;
  _QWORD v31[2];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (id)*MEMORY[0x1E0CA5B20];
  p_url = (id *)&self->_url;
  if (-[NSURL __is_isApplication](self->_url, "__is_isApplication"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CA5870]);
    v6 = *p_url;
    v30 = 0;
    v7 = objc_msgSend(v5, "initWithURL:allowPlaceholder:error:", v6, 1, &v30);
    v8 = v30;
    if (v7)
    {
LABEL_16:
      v9 = v7;
      goto LABEL_17;
    }
    _ISDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *p_url;
      *(_DWORD *)buf = 138412546;
      v33 = v10;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_1AA928000, v9, OS_LOG_TYPE_DEFAULT, "Application record not found for URL %@ with error: %@", buf, 0x16u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!objc_msgSend(*p_url, "__is_isAppExtension"))
  {
    _ISDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ISBundleIcon _makeDocumentResourceProvider].cold.2((uint64_t)&self->_url, v13, v14, v15, v16, v17, v18, v19);
    v9 = 0;
    v20 = 0;
    goto LABEL_22;
  }
  v11 = objc_alloc(MEMORY[0x1E0CA5848]);
  v12 = *p_url;
  v29 = 0;
  v9 = objc_msgSend(v11, "initWithURL:error:", v12, &v29);
  v8 = v29;
  if (!v9)
  {
    _ISDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *p_url;
      *(_DWORD *)buf = 138412546;
      v33 = v21;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_1AA928000, v9, OS_LOG_TYPE_DEFAULT, "ApplicationExtension record not found for URL %@ with error: %@", buf, 0x16u);
    }
    v7 = 0;
    goto LABEL_15;
  }
  if ((-[NSObject _is_canProvideIconResources](v9, "_is_canProvideIconResources") & 1) == 0)
  {
    -[NSObject containingBundleRecord](v9, "containingBundleRecord");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_17:

  if (!v9)
    goto LABEL_26;
  if (self->_type)
  {
    -[NSObject _IS_iconDictionaryForType:](v9, "_IS_iconDictionaryForType:");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_tag || !self->_tagClass)
      goto LABEL_26;
    -[NSObject _IS_iconDictionaryForTag:tagClass:](v9, "_IS_iconDictionaryForTag:tagClass:");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v13 = v22;
  if (!v22)
  {
LABEL_26:
    v20 = 0;
    goto LABEL_27;
  }
  v31[0] = 0x1E5801BF8;
  v31[1] = 0x1E5802AD8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject _IF_stringForKeys:](v13, "_IF_stringForKeys:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[ISBundleResourceProvider initWithBundleURL:iconDictionary:options:]([ISBundleResourceProvider alloc], "initWithBundleURL:iconDictionary:options:", *p_url, v13, v24 != 0);
LABEL_22:

LABEL_27:
  if (!-[ISResourceProvider options](v20, "options"))
  {
    -[ISBundleResourceProvider iconResource](v20, "iconResource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      _ISDefaultLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[ISBundleIcon _makeDocumentResourceProvider].cold.1(p_url);

      +[ISResourceProvider defaultAppIconResourceProvider](ISResourceProvider, "defaultAppIconResourceProvider");
      v27 = objc_claimAutoreleasedReturnValue();

      v20 = (ISBundleResourceProvider *)v27;
    }
  }
  -[ISResourceProvider setResourceType:](v20, "setResourceType:", 2);

  return v20;
}

- (id)_makeAppResourceProvider
{
  NSURL **p_url;
  id v3;
  NSURL *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  ISBundleResourceProvider *v12;
  id v13;
  NSURL *v14;
  NSObject *v15;
  NSURL *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  ISBundleResourceProvider *v31;
  NSURL *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  NSURL *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  p_url = &self->_url;
  if (-[NSURL __is_isApplication](self->_url, "__is_isApplication"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CA5870]);
    v4 = *p_url;
    v35 = 0;
    v5 = objc_msgSend(v3, "initWithURL:allowPlaceholder:error:", v4, 1, &v35);
    v6 = v35;
    if (!v5)
    {
      _ISDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *p_url;
        *(_DWORD *)buf = 138412546;
        v37 = v16;
        v38 = 2112;
        v39 = v6;
        _os_log_impl(&dword_1AA928000, v15, OS_LOG_TYPE_DEFAULT, "Application record not found for URL %@ with error: %@", buf, 0x16u);
      }

      goto LABEL_17;
    }
    +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject enableAppIconOverides](v7, "enableAppIconOverides"))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_16:
        v17 = v5;
LABEL_17:
        v7 = 0;
        v18 = (uint64_t)v5;
        goto LABEL_18;
      }
      v7 = v5;
      +[ISCustomIconManager sharedInstance](ISCustomIconManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject bundleIdentifier](v7, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "overrideResourceForBundleIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = -[ISResourceProvider initWithResource:templateResource:]([ISResourceProvider alloc], "initWithResource:templateResource:", v11, 0);

        goto LABEL_34;
      }
    }

    goto LABEL_16;
  }
  if (!-[NSURL __is_isAppExtension](*p_url, "__is_isAppExtension"))
  {
    v7 = 0;
    v6 = 0;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0D3A798], "bundleWithURL:", *p_url);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v12 = -[ISBundleResourceProvider initWithBundle:options:]([ISBundleResourceProvider alloc], "initWithBundle:options:", v20, 0);
    }
    else
    {
      _ISDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[ISBundleIcon _makeAppResourceProvider].cold.2((uint64_t)p_url, v21, v22, v23, v24, v25, v26, v27);

      v12 = 0;
    }

    goto LABEL_27;
  }
  v13 = objc_alloc(MEMORY[0x1E0CA5848]);
  v14 = *p_url;
  v34 = 0;
  v5 = objc_msgSend(v13, "initWithURL:error:", v14, &v34);
  v6 = v34;
  if (v5)
  {
    if (-[NSObject _IS_isMessagesExtension](v5, "_IS_isMessagesExtension"))
      v7 = objc_opt_new();
    else
      v7 = 0;
    if ((-[NSObject _is_canProvideIconResources](v5, "_is_canProvideIconResources") & 1) != 0)
    {
      v19 = v6;
      v6 = v5;
      goto LABEL_19;
    }
    -[NSObject containingBundleRecord](v5, "containingBundleRecord");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ISDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *p_url;
      *(_DWORD *)buf = 138412546;
      v37 = v33;
      v38 = 2112;
      v39 = v6;
      _os_log_impl(&dword_1AA928000, v5, OS_LOG_TYPE_DEFAULT, "ApplicationExtension record not found for URL %@ with error: %@", buf, 0x16u);
    }
    v7 = 0;
    v18 = 0;
  }
LABEL_18:

  v19 = v6;
  v6 = (id)v18;
LABEL_19:

  if (!v6)
    goto LABEL_21;
  v12 = -[ISRecordResourceProvider initWithRecord:options:]([ISRecordResourceProvider alloc], "initWithRecord:options:", v6, 0);
  if (!v12)
    goto LABEL_21;
LABEL_27:
  -[ISBundleResourceProvider iconResource](v12, "iconResource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {

  }
  else
  {
    -[ISResourceProvider customRecipe](v12, "customRecipe");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      _ISDefaultLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[ISBundleIcon _makeAppResourceProvider].cold.1((id *)p_url);

      +[ISResourceProvider defaultAppIconResourceProvider](ISResourceProvider, "defaultAppIconResourceProvider");
      v31 = (ISBundleResourceProvider *)objc_claimAutoreleasedReturnValue();

      -[ISResourceProvider setPlaceholder:](v31, "setPlaceholder:", 1);
      v12 = v31;
    }
  }
  -[ISResourceProvider setSuggestedRecipe:](v12, "setSuggestedRecipe:", v7);
  -[ISResourceProvider setResourceType:](v12, "setResourceType:", 1);
LABEL_34:

  return v12;
}

- (id)makeResourceProvider
{
  void *v2;

  if (self->_tag && self->_tagClass || self->_type)
  {
    -[ISBundleIcon _makeDocumentResourceProvider](self, "_makeDocumentResourceProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ISBundleIcon _makeAppResourceProvider](self, "_makeAppResourceProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  NSURL *url;
  NSString *type;
  NSString *tag;
  NSString *tagClass;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)ISBundleIcon;
  -[ISBundleIcon description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  type = self->_type;
  tag = self->_tag;
  tagClass = self->_tagClass;
  -[ISConcreteIcon digest](self, "digest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Bundle URL: %@ type: %@ tag: %@ tag class: %@ digest:%@"), v4, url, type, tag, tagClass, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)_aspectRatio
{
  return 1.0;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)tagClass
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagClass, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)_makeDocumentResourceProvider
{
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, a2, a3, "Bundle at URL: %@ does not provide document icon resources.", a5, a6, a7, a8, 2u);
}

- (void)_makeAppResourceProvider
{
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, a2, a3, "Failed to load bundle: %@", a5, a6, a7, a8, 2u);
}

@end
