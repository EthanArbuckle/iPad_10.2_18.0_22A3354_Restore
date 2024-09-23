@implementation ISBundleResourceProvider

- (ISBundleResourceProvider)initWithBundleURL:(id)a3 iconDictionary:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  ISBundleResourceProvider *v10;
  uint64_t v11;
  NSURL *bundleURL;
  NSDictionary *iconDictionary;
  void *v14;
  void *v15;
  unint64_t v16;
  objc_super v18;
  objc_super v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ISBundleResourceProvider;
  v10 = -[ISResourceProvider init](&v19, sel_init);
  if (v10)
  {
    if (objc_msgSend(v8, "isFileReferenceURL"))
      objc_msgSend(v8, "filePathURL");
    else
      objc_msgSend(v8, "absoluteURL");
    v11 = objc_claimAutoreleasedReturnValue();
    bundleURL = v10->_bundleURL;
    v10->_bundleURL = (NSURL *)v11;

    objc_storeStrong((id *)&v10->_iconDictionary, a4);
    iconDictionary = v10->_iconDictionary;
    v20[0] = CFSTR("UTTypeIconBadgeName");
    v20[1] = CFSTR("UTTypeIconText");
    v20[2] = CFSTR("UTTypeIconBackgroundName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary _IF_stringForKeys:](iconDictionary, "_IF_stringForKeys:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = a5 | 2;
    else
      v16 = a5;
    v18.receiver = v10;
    v18.super_class = (Class)ISBundleResourceProvider;
    -[ISResourceProvider setOptions:](&v18, sel_setOptions_, v16);
  }

  return v10;
}

- (ISBundleResourceProvider)initWithBundle:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  ISBundleResourceProvider *v9;

  v6 = a3;
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ISBundleResourceProvider initWithBundleURL:iconDictionary:options:](self, "initWithBundleURL:iconDictionary:options:", v7, v8, a4);

  if (v9 && objc_msgSend(v6, "platform"))
    -[ISResourceProvider setPlatform:](v9, "setPlatform:", objc_msgSend(v6, "platform"));

  return v9;
}

- (void)resolveResources
{
  void *v3;
  NSDictionary *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  NSURL *v9;

  if (!-[ISResourceProvider resolved](self, "resolved"))
  {
    -[ISResourceProvider setResolved:](self, "setResolved:", 1);
    v9 = self->_bundleURL;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v9);
    v4 = self->_iconDictionary;
    +[ISResourceProvider resourceWithBundleURL:iconDictionary:options:](ISResourceProvider, "resourceWithBundleURL:iconDictionary:options:", v9, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "setObject:forKeyedSubscript:", v5, CFSTR("kISPrimaryResourceKey"));

    -[ISResourceProvider _findTextResourceWithIconDictionary:](self, "_findTextResourceWithIconDictionary:", v4);
    -[ISResourceProvider setPlatformWithBundle:](self, "setPlatformWithBundle:", v3);
    LOBYTE(v6) = -[ISResourceProvider _findBadgeResourceWithIconDictionary:bundle:record:](self, "_findBadgeResourceWithIconDictionary:bundle:record:", v4, v3, 0);
    v7 = -[ISResourceProvider _findBackgroundResourceWithIconDictionary:bundle:](self, "_findBackgroundResourceWithIconDictionary:bundle:", v4, v3);
    if ((v6 & 1) == 0 && !v7)
    {
      if (v5)
      {
        -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("kISBadgeResourceKey"));

      }
    }
    -[ISResourceProvider _findCustomRecipeWithIconDictionary:bundle:](self, "_findCustomRecipeWithIconDictionary:bundle:", v4, v3);

  }
}

- (id)iconResource
{
  void *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISBundleResourceProvider;
  -[ISResourceProvider iconResource](&v6, sel_iconResource);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ISBundleResourceProvider resolveResources](self, "resolveResources");
    v5.receiver = self;
    v5.super_class = (Class)ISBundleResourceProvider;
    -[ISResourceProvider iconResource](&v5, sel_iconResource);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)resourceNamed:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ISBundleResourceProvider;
  -[ISResourceProvider resourceNamed:](&v8, sel_resourceNamed_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[ISBundleResourceProvider resolveResources](self, "resolveResources");
    v7.receiver = self;
    v7.super_class = (Class)ISBundleResourceProvider;
    -[ISResourceProvider resourceNamed:](&v7, sel_resourceNamed_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)symbol
{
  void *v3;
  void *v4;
  char v5;
  NSURL *v6;
  NSDictionary *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D3A798], "coreTypesBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", self->_bundleURL);

  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = self->_bundleURL;
  v7 = self->_iconDictionary;
  v15[0] = CFSTR("CFBundleSymbolName");
  v15[1] = CFSTR("UTTypeSymbolName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary _IF_stringForKeys:](v7, "_IF_stringForKeys:", v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[NSURL lastPathComponent](v6, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("mydocuments.cannedsearch"));

    if (!v12)
    {
      v9 = 0;
      v13 = 0;
      goto LABEL_8;
    }
    v9 = CFSTR("clock");
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7E8]), "initWithSymbolName:bundleURL:", v9, v6);
LABEL_8:

  return v13;
}

- (BOOL)_isAppleResource
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", self->_bundleURL);
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple"));

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ISBundleResourceProvider;
  -[ISBundleResourceProvider description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBundleResourceProvider bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBundleResourceProvider iconDictionary](self, "iconDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)templateType
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTemplateType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSURL)bundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBundleURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIconDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDictionary, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_templateType, 0);
}

@end
