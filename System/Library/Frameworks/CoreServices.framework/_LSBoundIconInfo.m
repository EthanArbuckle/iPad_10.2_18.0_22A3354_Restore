@implementation _LSBoundIconInfo

- (void)setResourcesDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_resourcesDirectoryURL, a3);
}

- (uint64_t)setPrerendered:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2;
  return result;
}

- (void)setIconsDictionary:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
}

- (void)setFileNames:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 64);
}

- (void)setDataContainerURL:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setContainerURL:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setCacheKey:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 56);
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileNames, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_iconsDictionary, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_resourcesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (_LSBoundIconInfo)initWithCoder:(id)a3
{
  id v4;
  _LSBoundIconInfo *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSURL *containerURL;
  uint64_t v10;
  NSURL *dataContainerURL;
  uint64_t v12;
  NSURL *resourcesDirectoryURL;
  uint64_t v14;
  _LSLazyPropertyList *iconsDictionary;
  uint64_t v16;
  NSString *cacheKey;
  uint64_t v18;
  NSArray *fileNames;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_LSBoundIconInfo;
  v5 = -[_LSBoundIconInfo init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    containerURL = v5->_containerURL;
    v5->_containerURL = (NSURL *)v8;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataContainerURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    dataContainerURL = v5->_dataContainerURL;
    v5->_dataContainerURL = (NSURL *)v10;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourcesDirectoryURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    resourcesDirectoryURL = v5->_resourcesDirectoryURL;
    v5->_resourcesDirectoryURL = (NSURL *)v12;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconsDictionary"));
    v14 = objc_claimAutoreleasedReturnValue();
    iconsDictionary = v5->_iconsDictionary;
    v5->_iconsDictionary = (_LSLazyPropertyList *)v14;

    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    cacheKey = v5->_cacheKey;
    v5->_cacheKey = (NSString *)v16;

    objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), CFSTR("fileNames"));
    v18 = objc_claimAutoreleasedReturnValue();
    fileNames = v5->_fileNames;
    v5->_fileNames = (NSArray *)v18;

    v5->_prerendered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prerendered"));
    v5->_badge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("badge"));
    v5->_documentAllowOverride = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("documentAllowOverride"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationIdentifier;
  id v5;

  applicationIdentifier = self->_applicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerURL, CFSTR("containerURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataContainerURL, CFSTR("dataContainerURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourcesDirectoryURL, CFSTR("resourcesDirectoryURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconsDictionary, CFSTR("iconsDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cacheKey, CFSTR("cacheKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileNames, CFSTR("fileNames"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_prerendered, CFSTR("prerendered"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_badge, CFSTR("badge"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_documentAllowOverride, CFSTR("documentAllowOverride"));

}

- (NSDictionary)bundleIconsDictionary
{
  _LSBoundIconInfo *v2;
  void *v3;
  _LSLazyPropertyList *iconsDictionary;
  _LSLazyPropertyList *v5;
  void *v6;
  BOOL v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  char v11;
  void *v12;
  NSArray *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v17;
  NSArray *fileNames;
  const __CFString *v19;
  _QWORD v20[2];

  v2 = self;
  v20[1] = *MEMORY[0x1E0C80C00];
  if (self)
    self = (_LSBoundIconInfo *)self->_iconsDictionary;
  -[_LSLazyPropertyList propertyList](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    iconsDictionary = v2->_iconsDictionary;
  else
    iconsDictionary = 0;
  v5 = iconsDictionary;
  -[_LSLazyPropertyList objectForKey:ofClass:](v5, "objectForKey:ofClass:", CFSTR("CFBundlePrimaryIcon"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 1;
  else
    v7 = v2 == 0;
  if (!v7)
  {
    v8 = v2->_fileNames;
    if (v8)
    {
      v9 = v8;
      if (-[NSArray count](v8, "count") >= 2)
      {

LABEL_13:
        v17 = CFSTR("CFBundleIconFiles");
        fileNames = v2->_fileNames;
        v19 = CFSTR("CFBundlePrimaryIcon");
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = fileNames;
        objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", &fileNames, &v17, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v15 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v15;
        return (NSDictionary *)v3;
      }
      -[NSArray firstObject](v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", CFSTR("-"));

      if ((v11 & 1) == 0)
        goto LABEL_13;
    }
  }
  return (NSDictionary *)v3;
}

- (uint64_t)iconsDictionary
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)fileNames
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSURL)resourcesDirectoryURL
{
  return self->_resourcesDirectoryURL;
}

- (BOOL)isBadge
{
  if (result)
    return *(_BYTE *)(result + 9) != 0;
  return result;
}

- (uint64_t)setBadge:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 9) = a2;
  return result;
}

- (BOOL)documentAllowOverride
{
  if (result)
    return *(_BYTE *)(result + 10) != 0;
  return result;
}

- (uint64_t)setDocumentAllowOverride:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 10) = a2;
  return result;
}

@end
