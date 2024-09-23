@implementation GSAddition

- (NSData)sandboxExtension
{
  GSAdditionStoring *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = self->_storage;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSURL pathComponents](self->_url, "pathComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v4, "count") - 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PerUID"));

    if (v6)
      -[GSAdditionStoring privExtension](v3, "privExtension");
    else
      -[GSAdditionStoring pubExtension](v3, "pubExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (NSData *)v7;
}

- (BOOL)isSavedConflict
{
  return (self->_options & 4) != 0
      && -[NSString isEqualToString:](self->_namespace, "isEqualToString:", CFSTR("com.apple.documentVersions"));
}

- (BOOL)isSavedConflictResolved
{
  _BOOL4 v3;

  v3 = -[NSString isEqualToString:](self->_namespace, "isEqualToString:", CFSTR("com.apple.ubiquity"));
  if (v3)
    LOBYTE(v3) = self->_savedConflictResolved;
  return v3;
}

- (NSNumber)size
{
  uint64_t v3;
  NSNumber *v4;
  NSNumber *size;

  if (!self->_size)
  {
    v3 = GSComputeTreeSize((char *)-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), 0);
    if ((v3 & 0x8000000000000000) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
      v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      size = self->_size;
      self->_size = v4;

    }
  }
  return self->_size;
}

- (NSString)name
{
  return -[NSURL lastPathComponent](self->_url, "lastPathComponent");
}

- (NSCopying)persistentIdentifier
{
  NSString *p_isa;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  p_isa = self->_namespace;
  if (-[NSString isEqualToString:](self->_namespace, "isEqualToString:", CFSTR("com.apple.ubiquity"))
    || -[NSString isEqualToString:](self->_namespace, "isEqualToString:", CFSTR("com.apple.FileProvider.conflict")))
  {
    v4 = CFSTR("com.apple.documentVersions");

    p_isa = &v4->isa;
  }
  -[GSAdditionStoring persistentIdentifier](self->_storage, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GSAddition name](self, "name", v5, p_isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCopying *)v7;
}

- (id)displayNameWithError:(id *)a3
{
  NSString *displayName;
  NSString **p_displayName;
  void *v6;
  uint64_t v7;
  NSString *v8;

  p_displayName = &self->_displayName;
  displayName = self->_displayName;
  if (displayName)
  {
    v6 = 0;
  }
  else
  {
    GSGetOriginalDisplayName((char *)-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "rangeOfString:", CFSTR(":")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("/"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    objc_storeStrong((id *)p_displayName, v6);
    displayName = *p_displayName;
  }
  v8 = displayName;

  return v8;
}

- (NSString)displayName
{
  return (NSString *)-[GSAddition displayNameWithError:](self, "displayNameWithError:", 0);
}

- (id)originalPOSIXNameWithError:(id *)a3
{
  NSString *originalName;
  NSString **p_originalName;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;

  p_originalName = &self->_originalName;
  originalName = self->_originalName;
  if (!originalName)
  {
    GSGetOriginalPOSIXName((char *)-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), a3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v6 = (id)v8;
    }
    else
    {
      -[GSAddition displayName](self, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v9)
      {
        objc_msgSend(v9, "pathExtension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[GSAddition name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "caseInsensitiveCompare:", v12))
        {
          objc_msgSend(v6, "stringByAppendingPathExtension:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v13;
        }
        if (objc_msgSend(v6, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
          v14 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v14;
        }
        v6 = v6;

        v7 = v6;
        goto LABEL_12;
      }
    }
    v7 = 0;
LABEL_12:
    objc_storeStrong((id *)p_originalName, v6);
    originalName = *p_originalName;
    goto LABEL_13;
  }
  v6 = 0;
  v7 = 0;
LABEL_13:
  v15 = originalName;

  return v15;
}

- (NSString)originalPOSIXName
{
  return (NSString *)-[GSAddition originalPOSIXNameWithError:](self, "originalPOSIXNameWithError:", 0);
}

- (id)userInfoWithError:(id *)a3
{
  NSDictionary *userInfo;
  NSDictionary *v5;
  NSDictionary *v6;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    GSMutableInfoDictionary(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), a3);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_userInfo;
    self->_userInfo = v5;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)-[GSAddition userInfoWithError:](self, "userInfoWithError:", 0);
}

- (BOOL)refreshWithError:(id *)a3
{
  void *v4;

  -[GSAdditionStoring getAdditionDictionary:error:](self->_storage, "getAdditionDictionary:error:", self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[GSAddition _refreshWithDictionary:](self, "_refreshWithDictionary:", v4);

  return v4 != 0;
}

- (BOOL)isEqual:(id)a3
{
  GSAddition *v4;
  GSAddition *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (GSAddition *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[GSAdditionStoring isEqual:](self->_storage, "isEqual:", v5->_storage)
        && -[NSString isEqualToString:](self->_namespace, "isEqualToString:", v5->_namespace))
      {
        -[GSAddition name](self, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[GSAddition name](v5, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "isEqual:", v7);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;

  v3 = -[GSAdditionStoring hash](self->_storage, "hash");
  v4 = -[NSString hash](self->_namespace, "hash") ^ v3;
  -[GSAddition name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (id)description
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = self->_namespace;
  -[NSURL lastPathComponent](self->_url, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<GSAddition %p ns:\"%@\" n:\"%@\" o:%llx, cr:%hhd>"), self, v4, v5, self->_options, self->_savedConflictResolved);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GSAddition)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  _NSMethodExceptionProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@: cannot use -init for initialization"), v5);

  return 0;
}

- (void)_refreshWithDictionary:(id)a3
{
  NSDictionary *userInfo;
  id v5;
  NSString *displayName;
  NSString *originalName;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSURL *v11;
  NSURL *url;
  NSNumber *v13;
  NSNumber *size;
  id v15;

  userInfo = self->_userInfo;
  self->_userInfo = 0;
  v5 = a3;

  displayName = self->_displayName;
  self->_displayName = 0;

  originalName = self->_originalName;
  self->_originalName = 0;

  objc_msgSend(v5, "objectForKey:", CFSTR("o"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_options = objc_msgSend(v8, "longLongValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("ns"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = self->_namespace;
  self->_namespace = v9;

  objc_msgSend(v5, "objectForKey:", CFSTR("u"));
  v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v11;

  objc_msgSend(v5, "objectForKey:", CFSTR("sz"));
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  size = self->_size;
  self->_size = v13;

  objc_msgSend(v5, "objectForKey:", CFSTR("cr"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  self->_savedConflictResolved = objc_msgSend(v15, "BOOLValue");
}

- (id)_initWithStorage:(id)a3 andDictionary:(id)a4
{
  id v7;
  id v8;
  GSAddition *v9;
  GSAddition *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GSAddition;
  v9 = -[GSAddition init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    -[GSAddition _refreshWithDictionary:](v10, "_refreshWithDictionary:", v8);
  }

  return v10;
}

- (BOOL)setOptions:(unint64_t)a3 error:(id *)a4
{
  int v6;

  v6 = -[GSAdditionStoring setAdditionOptions:value:error:](self->_storage, "setAdditionOptions:value:error:", self, a3, a4);
  if (v6)
    self->_options = a3;
  return v6;
}

- (BOOL)setDisplayName:(id)a3 error:(id *)a4
{
  id v7;
  int v8;

  v7 = a3;
  v8 = -[GSAdditionStoring setAdditionDisplayName:value:error:](self->_storage, "setAdditionDisplayName:value:error:", self, v7, a4);
  if (v8)
    objc_storeStrong((id *)&self->_displayName, a3);

  return v8;
}

- (BOOL)setNameSpace:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_namespace, "isEqualToString:", v6))
  {
    -[GSAdditionStoring setAdditionNameSpace:value:error:](self->_storage, "setAdditionNameSpace:value:error:", self, v6, a4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v8 = (void *)v7;
    -[GSAddition _refreshWithDictionary:](self, "_refreshWithDictionary:", v7);

  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)mergeUserInfo:(id)a3 error:(id *)a4
{
  int v5;
  NSDictionary *userInfo;

  v5 = -[GSAdditionStoring mergeAdditionUserInfo:value:error:](self->_storage, "mergeAdditionUserInfo:value:error:", self, a3, a4);
  if (v5)
  {
    userInfo = self->_userInfo;
    self->_userInfo = 0;

  }
  return v5;
}

- (BOOL)internalStat:(stat *)a3
{
  return GSAdditionStatInternal(-[NSURL fileSystemRepresentation](self->_url, "fileSystemRepresentation"), a3) == 0;
}

- (BOOL)copyAdditionContentToURL:(id)a3 error:(id *)a4
{
  NSURL *url;
  id v6;
  const char *v7;
  id v8;
  char *v9;

  url = self->_url;
  v6 = a3;
  v7 = -[NSURL fileSystemRepresentation](url, "fileSystemRepresentation");
  v8 = objc_retainAutorelease(v6);
  v9 = (char *)objc_msgSend(v8, "fileSystemRepresentation");

  return GSCopyOutGeneration(v7, v9, a4);
}

- (id)replaceItemAtURL:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v6 = a3;
  GSRestoreAdditionInternal(v6, self, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7 && (id)v7 != v6)
  {
    -[GSAddition storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);

    if (v11)
      objc_msgSend(v9, "setDocumentURL:", v8);

  }
  return v8;
}

+ (id)makeNameForUser:(unsigned int)a3 name:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%d:%@"), *(_QWORD *)&a3, a4);
}

- (BOOL)markSavedConflictAsResolved:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  int v7;

  v5 = a3;
  v7 = -[NSString isEqualToString:](self->_namespace, "isEqualToString:", CFSTR("com.apple.ubiquity"));
  if (v7)
  {
    v7 = -[GSAdditionStoring setAdditionConflictResolved:value:error:](self->_storage, "setAdditionConflictResolved:value:error:", self, v5, a4);
    if (v7)
    {
      self->_savedConflictResolved = v5;
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)nameSpace
{
  return self->_namespace;
}

- (GSAdditionStoring)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
