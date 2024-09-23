@implementation LSResourceProxy

- (id)_initWithLocalizedName:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _LSBoundIconInfo *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSResourceProxy;
  v5 = -[_LSQueryResult _init](&v11, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

    if (IconServicesLibrary_frameworkLibrary_3
      || (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
    {
      v8 = objc_alloc_init(_LSBoundIconInfo);
      v9 = (void *)v5[2];
      v5[2] = v8;

    }
  }

  return v5;
}

- (_LSBoundIconInfo)_boundIconInfo
{
  return self->__boundIconInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__iconsDictionary, 0);
  objc_storeStrong((id *)&self->__boundIconInfo, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (void)encodeWithCoder:(id)a3
{
  const __CFString *v4;
  int *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedName, CFSTR("localizedName"));
  v4 = CFSTR("boundIconInfo");
  v5 = &OBJC_IVAR___LSResourceProxy___boundIconInfo;
  if (!IconServicesLibrary_frameworkLibrary_3)
  {
    IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2);
    if (!IconServicesLibrary_frameworkLibrary_3)
    {
      v5 = &OBJC_IVAR___LSResourceProxy___iconsDictionary;
      v4 = CFSTR("iconsDictionary");
    }
  }
  objc_msgSend(v6, "encodeObject:forKey:", *(Class *)((char *)&self->super.super.isa + *v5), v4);

}

- (LSResourceProxy)initWithCoder:(id)a3
{
  id v4;
  LSResourceProxy *v5;
  uint64_t v6;
  NSString *localizedName;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LSResourceProxy;
  v5 = -[_LSQueryResult initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    if (IconServicesLibrary_frameworkLibrary_3
      || (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
    {
      objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boundIconInfo"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = 16;
    }
    else
    {
      objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconsDictionary"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = 24;
    }
    v10 = *(Class *)((char *)&v5->super.super.isa + v9);
    *(Class *)((char *)&v5->super.super.isa + v9) = (Class)v8;

  }
  return v5;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)_setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)boundIconIsBadge
{
  void *v3;
  void *v4;
  BOOL v5;

  if (IconServicesLibrary_frameworkLibrary_3
    || (v3 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)v3) != 0))
  {
    -[LSResourceProxy _boundIconInfo](self, "_boundIconInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_LSBoundIconInfo isBadge]((_BOOL8)v4);

    LOBYTE(v3) = v5;
  }
  return (char)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)uniqueIdentifier
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Unimplemented exception"), CFSTR("Subclasses must implement -uniqueIdentifier"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (LSIconResourceLocator)iconResourceLocator
{
  void *v3;

  if (IconServicesLibrary_frameworkLibrary_3
    || (v3 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)v3) != 0))
  {
    -[LSResourceProxy _boundIconInfo](self, "_boundIconInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (LSIconResourceLocator *)v3;
}

- (NSDictionary)iconsDictionary
{
  void *v3;
  void *v4;
  void *v5;

  if (IconServicesLibrary_frameworkLibrary_3
    || (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    -[LSResourceProxy _boundIconInfo](self, "_boundIconInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSBoundIconInfo iconsDictionary]((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSLazyPropertyList propertyList](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LSResourceProxy _iconsDictionary](self, "_iconsDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSLazyPropertyList propertyList](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDictionary *)v5;
}

- (NSString)primaryIconName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;

  if (IconServicesLibrary_frameworkLibrary_3
    || (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    -[LSResourceProxy _boundIconInfo](self, "_boundIconInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSBoundIconInfo iconsDictionary]((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      goto LABEL_4;
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  -[LSResourceProxy _iconsDictionary](self, "_iconsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_16;
LABEL_4:
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("CFBundlePrimaryIcon"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("CFBundleIconName"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!_NSIsNSString())
      goto LABEL_13;
    v6 = v5;
  }
  v7 = v6;
  if (!v6 || (_NSIsNSString() & 1) != 0)
    goto LABEL_14;
  _LSDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[LSResourceProxy primaryIconName].cold.1((uint64_t)v7, v8);

LABEL_13:
  v7 = 0;
LABEL_14:

LABEL_17:
  return (NSString *)v7;
}

- (id)iconDataForStyle:(id)a3 width:(int64_t)a4 height:(int64_t)a5 options:(unint64_t)a6
{
  return 0;
}

- (id)iconDataForVariant:(int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (IconServicesLibrary_frameworkLibrary_3
    || (v5 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)v5) != 0))
  {
    -[LSResourceProxy iconDataForVariant:withOptions:](self, "iconDataForVariant:withOptions:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_privateDocumentFileNamesAsCacheKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[LSResourceProxy _boundIconInfo](self, "_boundIconInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSBoundIconInfo fileNames]((uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[_LSBoundIconInfo fileNames]((uint64_t)v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_LSBoundIconInfo fileNames]((uint64_t)v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"), (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("_"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = CFSTR("defaultIcon");
  }

  return v13;
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (IconServicesLibrary_frameworkLibrary_3
    || (v7 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)v7) != 0))
  {
    softLink_ISIconDataForResourceProxy_1(self, v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (unint64_t)propertyListCachingStrategy
{
  return 0;
}

- (void)_setBoundIconInfo:(id)a3
{
  objc_storeStrong((id *)&self->__boundIconInfo, a3);
}

- (_LSLazyPropertyList)_iconsDictionary
{
  return self->__iconsDictionary;
}

- (void)_setIconsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)primaryIconName
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = objc_opt_class();
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Expected icon name to be a string, but it was a %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
