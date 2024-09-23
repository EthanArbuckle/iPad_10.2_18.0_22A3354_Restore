@implementation FSNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

+ (id)pathForBookmarkData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  char __s[1024];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (!a4)
    {
LABEL_11:
      v6 = 0;
      return v6;
    }
    v10 = *MEMORY[0x1E0CB2938];
    v11 = CFSTR("bookmark");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[FSNode(BookmarkData) pathForBookmarkData:error:]", 3850, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    *a4 = v8;

    goto LABEL_11;
  }
  if (objc_msgSend(a1, "getFileSystemRepresentation:forBookmarkData:", __s, a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFileSystemRepresentation:length:", __s, strlen(__s));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      return v6;
  }
  else
  {
    v6 = 0;
    if (!a4)
      return v6;
  }
  if (!v6)
  {
    v12 = *MEMORY[0x1E0CB2938];
    v13 = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[FSNode(BookmarkData) pathForBookmarkData:error:]", 3847, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  return v6;
}

- (id)initByResolvingBookmarkData:(id)a3 relativeToNode:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6
{
  return -[FSNode initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:](self, "initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:", a3, 17152, a4, a5, a6);
}

- (id)initByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToNode:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7
{
  size_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  char __s[1024];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (a7)
    {
      v14 = *MEMORY[0x1E0CB2938];
      v15 = CFSTR("bookmark");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, a6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode(BookmarkData) initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:]", 3807, v11);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  if (!+[FSNode getFileSystemRepresentation:forBookmarkData:](FSNode, "getFileSystemRepresentation:forBookmarkData:", __s, a3, a5, a6))
  {
    if (a7)
    {
      v16 = *MEMORY[0x1E0CB2938];
      v17 = CFSTR("bookmark");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode(BookmarkData) initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:]", 3801, v12);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  v9 = strlen(__s);
  if (v9)
    v10 = 8 * (__s[v9 - 1] == 47);
  else
    v10 = 0;
  return -[FSNode initWithFileSystemRepresentation:flags:error:](self, "initWithFileSystemRepresentation:flags:error:", __s, v10, a7);
}

- (FSNode)initWithFileSystemRepresentation:(const char *)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  FSNode *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = *(_QWORD *)&a4;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a3, (a4 >> 3) & 1, 0);
    v9 = -[FSNode initWithURL:flags:error:](self, "initWithURL:flags:error:", v8, v7, a5);

  }
  else
  {
    if (a5)
    {
      v12 = *MEMORY[0x1E0CB2938];
      v13[0] = CFSTR("path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode initWithFileSystemRepresentation:flags:error:]", 538, v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  return v9;
}

- (FSNode)initWithURL:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  FSNode *v9;
  FSNode *v10;
  NSURL *url;
  void **p_url;
  void *v13;
  int v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  FSNode *v20;
  void *v21;
  FSNode *v22;
  FSNode *v23;
  uint64_t v24;
  void *v26;
  id v27;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)FSNode;
  v9 = -[FSNode init](&v28, sel_init);
  v10 = v9;
  if (!v9)
  {
    if (a5)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10810, (uint64_t)"-[FSNode initWithURL:flags:error:]", 248, 0);
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return v20;
    }
    return 0;
  }
  if ((*((_BYTE *)v9 + 24) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("FSUtils.mm"), 174, CFSTR("Attempted to initialize FSNode %p that was already initialized"), v10);

  }
  p_url = (void **)&v10->_url;
  url = v10->_url;
  v10->_url = 0;

  v10->_cacheExpiration = -1;
  *((_BYTE *)v10 + 24) = (a4 >> 3) & 8 | *((_BYTE *)v10 + 24) & 0xE0 | 0x10;
  if (!a3 || !objc_msgSend(a3, "isFileURL"))
  {
    if (a5)
    {
      v29 = *MEMORY[0x1E0CB2938];
      v30[0] = CFSTR("aURL");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode initWithURL:flags:error:]", 243, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  v13 = *p_url;
  if (*p_url)
  {
    *p_url = 0;

  }
  if ((a4 & 0x20) != 0)
  {
    v27 = 0;
    v14 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v27, *MEMORY[0x1E0C998C8], 0);
    v15 = v27;
    if (v15)
      v16 = v14;
    else
      v16 = 0;
    if (v16 == 1)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v15, objc_msgSend(a3, "hasDirectoryPath"));
      v18 = v17;
      if (v17 && (objc_msgSend(v17, "isEqual:", a3) & 1) == 0)
        objc_storeStrong((id *)&v10->_url, v18);

    }
  }
  if (!*p_url)
    objc_storeStrong((id *)&v10->_url, a3);
  LODWORD(v19) = (a4 >> 2) & 0x10 | a4;
  if ((a4 & 8) != 0)
    *((_BYTE *)v10 + 24) = *((_BYTE *)v10 + 24) & 0xFC | 2;
  if ((a4 & 2) == 0)
  {
    v20 = v10;
    goto LABEL_35;
  }
  v19 = v19 | 1;
  -[FSNode resolvedNodeWithFlags:error:](v10, "resolvedNodeWithFlags:error:", v19, a5);
  v22 = (FSNode *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
  {

    return 0;
  }
  if (v10 == v22)
  {
    v20 = v10;
  }
  else
  {
    v20 = v22;

  }
LABEL_35:
  if ((v19 & 1) != 0
    && !-[FSNode checkResourceIsReachableAndReturnError:](v20, "checkResourceIsReachableAndReturnError:", a5))
  {

    return 0;
  }
  if ((v19 & 0x10) == 0)
  {
    v24 = mach_absolute_time();
    if (_FSNodeInfoLifetimeAbsolute(void)::once != -1)
      dispatch_once(&_FSNodeInfoLifetimeAbsolute(void)::once, &__block_literal_global_374);
    v20->_cacheExpiration = _FSNodeInfoLifetimeAbsolute(void)::nodeInfoLifetimeAbsolute + v24;
  }
  return v20;
}

+ (BOOL)getFileSystemRepresentation:(char)a3[1024] forBookmarkData:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  unint64_t v8;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    bzero(a3, 0x400uLL);
    v8 = objc_msgSend(v6, "length");
    if (v8 > 0x3FF)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v6, "getBytes:length:", a3, v8);
      v7 = 1;
    }
  }

  return v7;
}

- (id)resolvedNodeWithFlags:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  FSNode *v7;
  FSNode *v8;
  BOOL v9;
  char v10;

  v5 = *(_QWORD *)&a3;
  if (!-[FSNode isDirectory](self, "isDirectory")
    && -[FSNode checkResourceIsReachableAndReturnError:](self, "checkResourceIsReachableAndReturnError:", 0)
    && -[FSNode isResolvable](self, "isResolvable"))
  {
    objc_msgSend((id)objc_opt_class(), "_resolvedNodeFromAliasFile:flags:error:", self, v5, a4);
    v7 = (FSNode *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7 == self;
    else
      v9 = 1;
    v10 = v9;
    if ((v5 & 8) != 0 && (v10 & 1) == 0)
    {
      *((_BYTE *)v7 + 24) = *((_BYTE *)v7 + 24) & 0xFC | 2;
LABEL_16:
      -[FSNode setReferringAliasNode:](v7, "setReferringAliasNode:", self);
      return v8;
    }
    if ((v10 & 1) == 0)
      goto LABEL_16;
  }
  else
  {
    v8 = self;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  id v6;

  -[FSNode URL](self, "URL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:");

  objc_msgSend(a3, "encodeInt64:forKey:", *((_BYTE *)self + 24) & 3, CFSTR("isDirectory"));
  -[FSNode referringAliasNode](self, "referringAliasNode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:");

}

- (id)referringAliasNode
{
  if ((*((_BYTE *)self + 24) & 4) == 0)
    return 0;
  objc_getAssociatedObject(self, &_kFSNodeReferringAliasNodeKey);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)canonical:(BOOL)a3 pathWithError:(id *)a4
{
  _BOOL4 v5;
  uint64_t v7;
  id v8;
  id *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v19;
  id v20;

  v5 = a3;
  v20 = 0;
  if (a3
    || !self
    || (*((_BYTE *)self + 24) & 8) == 0
    || (v7 = __CFURLResourceInfoPtr(), v19 = 0, !v7)
    || !MEMORY[0x186DAD924](v7, *MEMORY[0x1E0C9B5B0], &v19)
    || (v8 = v19, (v20 = v8) == 0))
  {
    v9 = (id *)MEMORY[0x1E0C998C8];
    if (!v5)
      v9 = (id *)MEMORY[0x1E0C99AA8];
    v10 = *v9;
    if (!-[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v20, v10, 1, a4))
    {
      -[FSNode URL](self, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isFileReferenceURL");

      if ((v12 & 1) == 0)
      {
        -[FSNode URL](self, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "absoluteURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v20;
          v20 = v15;

        }
      }
    }

    v8 = v20;
  }
  v17 = v8;

  return v17;
}

- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  const __CFURL *v15;
  const __CFURL *v16;
  CFErrorRef *v17;
  int v18;
  id v19;
  char v20;
  BOOL v21;
  id v23;
  id propertyValueTypeRefPtr;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  propertyValueTypeRefPtr = 0;
  if (!a4)
  {
    if (a6)
    {
      v25 = *MEMORY[0x1E0CB2938];
      v26[0] = CFSTR("key");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode getResourceValue:forKey:options:error:]", 781, v14);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_32;
  }
  if ((*((_BYTE *)self + 24) & 3) != 0 && objc_msgSend(a4, "isEqual:", *MEMORY[0x1E0C999D0]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((_BYTE *)self + 24) & 3) == 2);
    propertyValueTypeRefPtr = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  -[FSNode clearURLPropertyCacheIfStale](self, "clearURLPropertyCacheIfStale");
  if ((a5 & 1) != 0)
  {
    v23 = 0;
    -[FSNode URL](self, "URL");
    v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a6)
      v17 = (CFErrorRef *)&v23;
    else
      v17 = 0;
    v18 = CFURLCopyResourcePropertyForKey(v15, (CFStringRef)a4, &propertyValueTypeRefPtr, v17);

    if (a6 != 0 && v18 == 0)
    {
      *a6 = objc_retainAutorelease(v23);

      goto LABEL_32;
    }

    if (!v18)
    {
LABEL_32:
      v21 = 0;
      goto LABEL_33;
    }
  }
  else
  {
    -[FSNode URL](self, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _CFURLCopyResourcePropertyForKeyFromCache() == 0;

    if (v12)
    {
      if (a6)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10655, (uint64_t)"-[FSNode getResourceValue:forKey:options:error:]", 812, 0);
        v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
        v21 = 0;
        *a6 = v13;
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  v19 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr
    && (*((_BYTE *)self + 24) & 3) == 0
    && objc_msgSend(a4, "isEqual:", *MEMORY[0x1E0C999D0]))
  {
    if (objc_msgSend(v19, "BOOLValue"))
      v20 = 2;
    else
      v20 = 1;
    *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFC | v20;
  }
LABEL_23:
  if ((a5 & 2) == 0 && !propertyValueTypeRefPtr)
  {
    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10813, (uint64_t)"-[FSNode getResourceValue:forKey:options:error:]", 825, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_32;
  }
  if (a3)
    objc_storeStrong(a3, propertyValueTypeRefPtr);
  v21 = 1;
LABEL_33:

  return v21;
}

- (void)clearURLPropertyCacheIfStale
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (self->_cacheExpiration != -1)
  {
    v3 = mach_absolute_time();
    if (self->_cacheExpiration < v3)
    {
      v4 = v3;
      -[FSNode URL](self, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeAllCachedResourceValues");

      if (_FSNodeInfoLifetimeAbsolute(void)::once != -1)
        dispatch_once(&_FSNodeInfoLifetimeAbsolute(void)::once, &__block_literal_global_374);
      self->_cacheExpiration = _FSNodeInfoLifetimeAbsolute(void)::nodeInfoLifetimeAbsolute + v4;
    }
  }
}

- (id)URL
{
  void *v5;

  if ((*((_BYTE *)self + 24) & 0x10) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FSUtils.mm"), 484, CFSTR("Attempted to use uninitialized FSNode %p."), self);

  }
  return self->_url;
}

- (FSNode)initWithCoder:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  FSNode *v9;
  id v10;
  void *v11;
  id v13;

  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isFileURL") & 1) != 0)
  {
    v7 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("isDirectory"));
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referringAliasNode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = -[FSNode initWithURL:flags:error:](self, "initWithURL:flags:error:", v6, 0, &v13);
    v10 = v13;
    if (v9)
    {
      *((_BYTE *)v9 + 24) = *((_BYTE *)v9 + 24) & 0xFC | v7 & 3;
      if (v8)
        -[FSNode setReferringAliasNode:](v9, "setReferringAliasNode:", v8);
    }
    else
    {
      objc_msgSend(a3, "failWithError:", v10);
    }

  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4864, (uint64_t)"-[FSNode initWithCoder:]", 450, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "failWithError:", v11);

    v9 = 0;
  }

  return v9;
}

- (BOOL)isSideFault
{
  void *v3;
  void *v4;
  BOOL v5;

  -[FSNode nameWithError:](self, "nameWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && _CFURLIsPromiseName())
  {
    -[FSNode URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _CFURLIsItemPromiseAtURL() != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isVolume
{
  _BOOL4 v3;

  v3 = -[FSNode isDirectory](self, "isDirectory");
  if (v3)
    LOBYTE(v3) = (_FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C99A48], 8, 0) & 1) != 0
              || -[FSNode isMountTrigger](self, "isMountTrigger");
  return v3;
}

- (BOOL)isDirectory
{
  if ((*((_BYTE *)self + 24) & 3) != 0)
    return (*((_BYTE *)self + 24) & 3) == 2;
  else
    return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C999D0], 2, 0);
}

- (BOOL)isMountTrigger
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C999F8], 0x10000, 0);
}

- (BOOL)hasPackageBit
{
  _BOOL4 v3;
  BOOL v4;
  _BYTE v6[8];
  __int16 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[FSNode isDirectory](self, "isDirectory");
  if (v3)
  {
    v4 = -[FSNode getFinderInfo:error:](self, "getFinderInfo:error:", v6, 0);
    return *(_DWORD *)&v4 & ((unsigned __int16)(v7 & 0x2000) >> 13);
  }
  return v3;
}

- (BOOL)getFinderInfo:(id *)a3 error:(id *)a4
{
  _OWORD *v7;
  __int128 v8;
  BOOL v9;
  _OWORD *v10;
  __int128 v11;
  id v13;

  if (!self || (*((_BYTE *)self + 24) & 8) == 0 || !__CFURLResourceInfoPtr())
  {
LABEL_9:
    v13 = 0;
    if (!-[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v13, *MEMORY[0x1E0C9AC60], 1, a4))goto LABEL_17;
    v10 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
    if (v10 && (unint64_t)objc_msgSend(v13, "length") >= 0x20)
    {
      if (a3)
      {
        v11 = v10[1];
        *(_OWORD *)a3->var0 = *v10;
        *(_OWORD *)a3->var2.var1 = v11;
      }
      v9 = 1;
      goto LABEL_18;
    }
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10817, (uint64_t)"-[FSNode(FinderInfo) getFinderInfo:error:]", 2590, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_17:
      v9 = 0;
    }
LABEL_18:

    return v9;
  }
  v7 = (_OWORD *)MEMORY[0x186DAD900]();
  if (!a3 || !v7)
  {
    if (v7)
      return 1;
    goto LABEL_9;
  }
  v8 = v7[1];
  *(_OWORD *)a3->var0 = *v7;
  *(_OWORD *)a3->var2.var1 = v8;
  return 1;
}

- (id)extensionWithError:(id *)a3
{
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  int v10;
  const __CFString *v12;

  v12 = 0;
  if (!self || (*((_BYTE *)self + 24) & 8) == 0)
  {
    v5 = 0;
LABEL_4:
    v6 = 0;
    goto LABEL_5;
  }
  v8 = __CFURLResourceInfoPtr();
  v5 = v8;
  if (!v8)
    goto LABEL_4;
  MEMORY[0x186DAD924](v8, CFSTR("com.apple.LSExtensionKey"), &v12);
  v9 = (__CFString *)v12;
  if (v12)
    return v9;
  v6 = 1;
LABEL_5:
  -[FSNode nameWithError:](self, "nameWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    _CFGetPathExtensionRangesFromPathComponent();
    v12 = &stru_1E10473A0;
  }

  v9 = (__CFString *)v12;
  if (v12)
    v10 = v6;
  else
    v10 = 0;
  if (v10 == 1)
  {
    MEMORY[0x186DAD930](v5, CFSTR("com.apple.LSExtensionKey"));
    v9 = (__CFString *)v12;
  }
  return v9;
}

- (id)nameWithError:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  v12 = 0;
  if (!self
    || (*((_BYTE *)self + 24) & 8) == 0
    || !__CFURLResourceInfoPtr()
    || (MEMORY[0x186DAD918](), (v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!-[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v12, *MEMORY[0x1E0C99A90], 1, a3))
    {
      -[FSNode URL](self, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isFileReferenceURL");

      if ((v6 & 1) == 0)
      {
        -[FSNode URL](self, "URL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v12;
        v12 = v8;

      }
    }
  }
  v10 = v12;

  return v10;
}

- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
  char v6;
  id v8;

  v8 = 0;
  v5 = -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v8, *MEMORY[0x1E0C9AD78], 1, a4);
  v6 = !v5;
  if (!a3)
    v6 = 1;
  if ((v6 & 1) == 0)
    *a3 = objc_msgSend(v8, "unsignedLongLongValue");

  return v5;
}

- (BOOL)isResolvable
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C999B8], 0x8000, 0);
}

- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  return -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", a3, a4, 0, a5);
}

- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  const __CFNumber *v17;
  _BOOL4 v18;
  const __CFNumber *v19;
  const __CFNumber *v21[5];

  v21[4] = *(const __CFNumber **)MEMORY[0x1E0C80C00];
  if (-[FSNode isDirectory](self, "isDirectory"))
  {
    if (-[FSNode getHFSType:creator:error:]::once != -1)
      dispatch_once(&-[FSNode getHFSType:creator:error:]::once, &__block_literal_global_88);
    v21[0] = 0;
    if (-[FSNode getTemporaryResourceValue:forKey:](self, "getTemporaryResourceValue:forKey:", v21, CFSTR("com.apple.LSPkgInfoKey")))
    {
LABEL_17:
      if (v21[0] == (const __CFNumber *)-[FSNode getHFSType:creator:error:]::noHFSCodes)
      {
        if (a5)
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10813, (uint64_t)"-[FSNode getHFSType:creator:error:]", 2513, 0);
          LOBYTE(v18) = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
      }
      else if (v21[0])
      {
        XCFNumberGetHFSTypeAndCreatorCodes(v21[0], (int *)a3, (int *)a4);
        LOBYTE(v18) = 1;
LABEL_23:

        return v18;
      }
      LOBYTE(v18) = 0;
      goto LABEL_23;
    }
    -[FSNode URL](self, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents/PkgInfo"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:maxLength:error:", v10, 0, 8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && (unint64_t)objc_msgSend(v11, "length") >= 8)
      {
        v13 = objc_retainAutorelease(v12);
        v14 = (unsigned int *)objc_msgSend(v13, "bytes");
        v16 = *v14;
        v15 = v14[1];

        v17 = XCFNumberCreateWithHFSTypeAndCreatorCodes(bswap32(v16), bswap32(v15));
LABEL_16:
        v19 = v21[0];
        v21[0] = v17;

        -[FSNode setTemporaryResourceValue:forKey:](self, "setTemporaryResourceValue:forKey:", v21[0], CFSTR("com.apple.LSPkgInfoKey"));
        goto LABEL_17;
      }

    }
    v17 = (const __CFNumber *)(id)-[FSNode getHFSType:creator:error:]::noHFSCodes;
    goto LABEL_16;
  }
  v18 = -[FSNode getFinderInfo:error:](self, "getFinderInfo:error:", v21, a5);
  if (v18)
  {
    if (a3)
      *a3 = v21[0];
    if (a4)
      *a4 = HIDWORD(v21[0]);
  }
  return v18;
}

- (BOOL)hasHiddenExtension
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C999B0], 256, 0);
}

- (BOOL)isSymbolicLink
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C99A28], 4, 0);
}

- (BOOL)isRegularFile
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C99A18], 1, 0);
}

- (BOOL)isAliasFile
{
  _BOOL4 v3;

  v3 = -[FSNode isResolvable](self, "isResolvable");
  if (v3)
    LOBYTE(v3) = !-[FSNode isSymbolicLink](self, "isSymbolicLink");
  return v3;
}

- (BOOL)isAVCHDCollection
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  BOOL v11;

  if (-[FSNode isDirectory](self, "isDirectory"))
  {
    -[FSNode nameWithError:](self, "nameWithError:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "length");
      if (v5 == 4)
      {
        v6 = CFSTR("BDMV");
        v7 = CFSTR("INDEX.BDMV");
        v8 = CFSTR("INDEX.BDM");
        v9 = CFSTR("index.bdmv");
        v10 = CFSTR("index.bdm");
      }
      else
      {
        if (v5 != 5)
          goto LABEL_9;
        v6 = CFSTR("AVCHD");
        v7 = CFSTR("BDMV/INDEX.BDMV");
        v8 = CFSTR("BDMV/INDEX.BDM");
        v9 = CFSTR("BDMV/index.bdmv");
        v10 = CFSTR("BDMV/index.bdm");
      }
      if (!objc_msgSend(v4, "caseInsensitiveCompare:", v6))
      {
        v11 = -[FSNode childNodeWithRelativePathExists:](self, "childNodeWithRelativePathExists:", v10)
           || -[FSNode childNodeWithRelativePathExists:](self, "childNodeWithRelativePathExists:", v8)
           || -[FSNode childNodeWithRelativePathExists:](self, "childNodeWithRelativePathExists:", v9)
           || -[FSNode childNodeWithRelativePathExists:](self, "childNodeWithRelativePathExists:", v7);
        goto LABEL_10;
      }
    }
LABEL_9:
    v11 = 0;
LABEL_10:

    return v11;
  }
  return 0;
}

- (BOOL)getTemporaryResourceValue:(id *)a3 forKey:(id)a4
{
  return -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", a3, a4, 0, 0);
}

- (void)setTemporaryResourceValue:(id)a3 forKey:(id)a4
{
  const __CFURL *v6;

  if (a4)
  {
    -[FSNode URL](self, "URL");
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFURLSetTemporaryResourcePropertyForKey(v6, (CFStringRef)a4, a3);

  }
}

- (id)canonicalPathWithError:(id *)a3
{
  return -[FSNode canonical:pathWithError:](self, "canonical:pathWithError:", 1, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isSecuredSystemContent
{
  uint64_t NonFictionalDeviceNumber;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  NSObject *v10;
  const char *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  FSNode *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __32__FSNode_isSecuredSystemContent__block_invoke;
  v13[3] = &unk_1E103FAD8;
  v13[4] = self;
  v13[5] = a2;
  if (-[FSNode isSecuredSystemContent]::once != -1)
    dispatch_once(&-[FSNode isSecuredSystemContent]::once, v13);
  NonFictionalDeviceNumber = _FSNodeGetNonFictionalDeviceNumber(self);
  v4 = NonFictionalDeviceNumber;
  if (NonFictionalDeviceNumber)
  {
    v5 = -[FSNode isSecuredSystemContent]::securedDeviceNumber;
    do
    {
      v7 = *v5++;
      v6 = v7;
      v8 = v7 != 0;
      if (v7)
        v9 = NonFictionalDeviceNumber == v6;
      else
        v9 = 1;
    }
    while (!v9);
  }
  else
  {
    v8 = 0;
  }
  _LSDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = "NO";
    *(_DWORD *)buf = 136315650;
    if (v8)
      v12 = "YES";
    v15 = v12;
    v16 = 2048;
    v17 = v4;
    v18 = 2112;
    v19 = self;
    _os_log_debug_impl(&dword_182882000, v10, OS_LOG_TYPE_DEBUG, "FSNode.isSecuredSystemContent=%s: device number %llu for %@", buf, 0x20u);
  }

  return v8;
}

- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4
{
  BOOL v5;
  char v6;
  id v8;

  v8 = 0;
  v5 = -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v8, *MEMORY[0x1E0C9AD70], 1, a4);
  v6 = !v5;
  if (!a3)
    v6 = 1;
  if ((v6 & 1) == 0)
    *a3 = objc_msgSend(v8, "unsignedLongLongValue");

  return v5;
}

- (void)prepareForReuse
{
  NSURL *url;
  void *v5;

  if ((*((_BYTE *)self + 24) & 0x10) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FSUtils.mm"), 280, CFSTR("Attempted to prepare FSNode %p for reuse, but it was already prepared."), self);

  }
  url = self->_url;
  self->_url = 0;

  -[FSNode setReferringAliasNode:](self, "setReferringAliasNode:", 0);
  *((_BYTE *)self + 24) &= ~0x10u;
}

- (void)setReferringAliasNode:(id)a3
{
  char v4;

  if (a3)
  {
    v4 = 4;
  }
  else
  {
    if ((*((_BYTE *)self + 24) & 4) == 0)
      return;
    v4 = 0;
  }
  objc_setAssociatedObject(self, &_kFSNodeReferringAliasNodeKey, a3, (void *)1);
  *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFB | v4;
}

- (BOOL)canIssueIO
{
  return 1;
}

- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4
{
  return _FSNodeGetTimestampValue(self, *MEMORY[0x1E0C998D8], a3, a4);
}

- (id)volumeNodeWithFlags:(unsigned int)a3 error:(id *)a4
{
  FSNode *v6;
  FSNode *v7;
  id v9;

  v9 = 0;
  if (-[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v9, *MEMORY[0x1E0C99D08], 1, a4))
  {
    v6 = [FSNode alloc];
    v7 = -[FSNode initWithURL:flags:error:](v6, "initWithURL:flags:error:", v9, a3 | 8, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
  char v6;
  id v8;

  v8 = 0;
  v5 = -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v8, *MEMORY[0x1E0C9AC80], 1, a4);
  v6 = !v5;
  if (!a3)
    v6 = 1;
  if ((v6 & 1) == 0)
    *a3 = objc_msgSend(v8, "unsignedLongLongValue");

  return v5;
}

- (BOOL)checkResourceIsReachableAndReturnError:(id *)a3
{
  uint64_t v4;

  v4 = 0;
  return -[FSNode getFileIdentifier:error:](self, "getFileIdentifier:error:", &v4, a3);
}

- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
  char v6;
  id v8;

  v8 = 0;
  v5 = -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v8, *MEMORY[0x1E0C9AC50], 1, a4);
  v6 = !v5;
  if (!a3)
    v6 = 1;
  if ((v6 & 1) == 0)
    *a3 = objc_msgSend(v8, "unsignedLongLongValue");

  return v5;
}

- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4
{
  void *v6;
  void *v7;
  BOOL v8;

  -[FSNode pathWithError:](self, "pathWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  if ((objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", a3, 1024) & 1) == 0)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -2110, (uint64_t)"-[FSNode getFileSystemRepresentation:error:]", 1374, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (id)pathWithError:(id *)a3
{
  return -[FSNode canonical:pathWithError:](self, "canonical:pathWithError:", 0, a3);
}

- (BOOL)isBusyDirectory
{
  return 0;
}

void __35__FSNode_getHFSType_creator_error___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DE7910]);
  v1 = (void *)-[FSNode getHFSType:creator:error:]::noHFSCodes;
  -[FSNode getHFSType:creator:error:]::noHFSCodes = (uint64_t)v0;

}

- (BOOL)isEqual:(id)a3
{
  FSNode *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  id v13;
  id v14;

  if (self == a3)
    return 1;
  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = self;
  v6 = a3;
  -[FSNode URL](v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8 && (objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v14 = 0;
    v11 = *MEMORY[0x1E0C99948];
    if (-[FSNode getResourceValue:forKey:options:error:](v5, "getResourceValue:forKey:options:error:", &v14, *MEMORY[0x1E0C99948], 1, 0))
    {
      v13 = 0;
      if (objc_msgSend(v6, "getResourceValue:forKey:options:error:", &v13, v11, 1, 0))
        v10 = objc_msgSend(v14, "isEqual:", v13);
      else
        v10 = 0;

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (unint64_t)hash
{
  unint64_t v2;
  id v4;

  v4 = 0;
  if (-[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v4, *MEMORY[0x1E0C9AC50], 1, 0))
  {
    v2 = objc_msgSend(v4, "hash");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (NSString)description
{
  char v3;
  unsigned int v4;
  uint64_t v5;
  _WORD v7[512];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *((_BYTE *)self + 24);
  bzero(v7, 0x400uLL);
  if (!-[FSNode getFileSystemRepresentation:error:](self, "getFileSystemRepresentation:error:", v7, 0))
    v7[0] = 63;
  if ((v3 & 3) == 2)
    v4 = 121;
  else
    v4 = 63;
  if ((v3 & 3) == 1)
    v5 = 110;
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<FSNode %p> { isDir = %c, path = '%s' }"), self, v5, v7);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)redactedDescription
{
  int v2;
  uint64_t v3;

  v2 = *((_BYTE *)self + 24) & 3;
  if (v2 == 2)
    LODWORD(v3) = 121;
  else
    LODWORD(v3) = 63;
  if (v2 == 1)
    v3 = 110;
  else
    v3 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<FSNode %p> { isDir = %c, path = <private> }"), self, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[FSNode URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer"))
      {
        v6 = v5;
        v7 = *(void **)(v4 + 8);
        *(_QWORD *)(v4 + 8) = v6;
      }
      else
      {
        v8 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v5, "relativeString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "baseURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "initWithString:relativeToURL:", v7, v9);
        v11 = *(void **)(v4 + 8);
        *(_QWORD *)(v4 + 8) = v10;

      }
    }

    *(_QWORD *)(v4 + 16) = self->_cacheExpiration;
    *(_BYTE *)(v4 + 24) = *(_BYTE *)(v4 + 24) & 0xFC | *((_BYTE *)self + 24) & 3;
    -[FSNode referringAliasNode](self, "referringAliasNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend((id)v4, "setReferringAliasNode:", v12);
    *(_BYTE *)(v4 + 24) &= ~8u;
    v13 = mach_absolute_time();
    if (_FSNodeInfoLifetimeAbsolute(void)::once != -1)
      dispatch_once(&_FSNodeInfoLifetimeAbsolute(void)::once, &__block_literal_global_374);
    *(_QWORD *)(v4 + 16) = _FSNodeInfoLifetimeAbsolute(void)::nodeInfoLifetimeAbsolute + v13;
    *(_BYTE *)(v4 + 24) = *(_BYTE *)(v4 + 24) & 0xEF | *((_BYTE *)self + 24) & 0x10;

  }
  return (id)v4;
}

- (FSNode)initWithPath:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  FSNode *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = *(_QWORD *)&a4;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", a3, (a4 >> 3) & 1);
    v9 = -[FSNode initWithURL:flags:error:](self, "initWithURL:flags:error:", v8, v7, a5);

  }
  else
  {
    if (a5)
    {
      v12 = *MEMORY[0x1E0CB2938];
      v13[0] = CFSTR("path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode initWithPath:flags:error:]", 525, v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  return v9;
}

- (FSNode)initWithDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 lastPathComponent:(id)a5 createIntermediateDirectories:(BOOL)a6 flags:(unsigned int)a7 error:(id *)a8
{
  uint64_t v9;
  _BOOL4 v10;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;

  v9 = *(_QWORD *)&a7;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLsForDirectory:inDomains:", a3, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16
    && objc_msgSend(v16, "count")
    && ((objc_msgSend(v16, "objectAtIndexedSubscript:", 0), v17 = (void *)objc_claimAutoreleasedReturnValue(), !a5)
     || !objc_msgSend(a5, "length")
      ? (v18 = v17)
      : (objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", a5, (v9 >> 3) & 1),
         v18 = (id)objc_claimAutoreleasedReturnValue()),
        v19 = v18,
        v17,
        v19))
  {

    if (self && v10)
    {
      v20 = v19;
      v21 = v20;
      v22 = v20;
      if ((v9 & 8) == 0)
      {
        objc_msgSend(v20, "URLByDeletingLastPathComponent");
        v23 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v23;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v22, 1, 0, a8);

      if ((v25 & 1) == 0)
      {

        self = 0;
      }

    }
    if (self)
      self = -[FSNode initWithURL:flags:error:](self, "initWithURL:flags:error:", v19, v9, a8);
  }
  else
  {
    if (a8)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -120, (uint64_t)"-[FSNode initWithDirectory:inDomain:lastPathComponent:createIntermediateDirectories:flags:error:]", 570, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

    v19 = 0;
    self = 0;
  }

  return self;
}

- (FSNode)initWithConfigurationString:(int)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  int *v9;
  char v10[1024];
  uint64_t v11;

  v6 = *(_QWORD *)&a4;
  v11 = *MEMORY[0x1E0C80C00];
  if (confstr(a3, v10, 0x400uLL))
    return -[FSNode initWithFileSystemRepresentation:flags:error:](self, "initWithFileSystemRepresentation:flags:error:", v10, v6, a5);
  if (a5)
  {
    v9 = __error();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], *v9, (uint64_t)"-[FSNode initWithConfigurationString:flags:error:]", 607, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)setResourceValue:(id)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  BOOL v8;
  char v9;
  const __CFURL *v11;
  const __CFURL *v12;
  CFErrorRef *v13;
  BOOL v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a4 && ((a5 & 2) == 0 ? (v8 = a3 == 0) : (v8 = 0), !v8 ? (v9 = 0) : (v9 = 1), (a5 & 1) != 0 && (v9 & 1) == 0))
  {
    v17 = 0;
    -[FSNode URL](self, "URL");
    v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a6)
      v13 = (CFErrorRef *)&v17;
    else
      v13 = 0;
    v14 = CFURLSetResourcePropertyForKey(v11, (CFStringRef)a4, a3, v13) != 0;

    if (a6 != 0 && !v14)
      *a6 = objc_retainAutorelease(v17);

  }
  else
  {
    if (a6)
    {
      v18 = *MEMORY[0x1E0CB2938];
      v19[0] = CFSTR("invalid input parameters");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode setResourceValue:forKey:options:error:]", 851, v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  return v14;
}

- (void)removeCachedResourceValueForKey:(id)a3
{
  const __CFURL *v4;

  if (a3)
  {
    -[FSNode URL](self, "URL");
    v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFURLClearResourcePropertyCacheForKey(v4, (CFStringRef)a3);

  }
}

- (id)sideFaultResourceValuesWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[FSNode nameWithError:](self, "nameWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_9;
  if (!_CFURLIsPromiseName())
  {
    if (a3)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10817, (uint64_t)"-[FSNode sideFaultResourceValuesWithError:]", 897, 0);
      v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  -[FSNode URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_CFURLCopyPropertiesOfPromiseAtURL();

  if (a3 && !v7)
    *a3 = objc_retainAutorelease(0);

LABEL_10:
  return v7;
}

- (BOOL)childNodeWithRelativePathExists:(id)a3
{
  void *v3;
  BOOL v4;

  -[FSNode childNodeWithRelativePath:flags:error:](self, "childNodeWithRelativePath:flags:error:", a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)childNodeWithRelativePath:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FSNode *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = *(_QWORD *)&a4;
    if (objc_msgSend(a3, "length"))
    {
      if ((v6 & 8) != 0)
        v9 = 1;
      else
        v9 = objc_msgSend(a3, "hasSuffix:", CFSTR("/"));
      -[FSNode URL](self, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingPathComponent:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v14, v9);

        if (v15)
        {
          v16 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v15, v6, a5);

          return v16;
        }
        return 0;
      }
      if (a5)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -2110, (uint64_t)"-[FSNode childNodeWithRelativePath:flags:error:]", 954, 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else if (a5)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -37, (uint64_t)"-[FSNode childNodeWithRelativePath:flags:error:]", 962, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      *a5 = v11;
      return 0;
    }
  }
  else if (a5)
  {
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = CFSTR("childPath");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode childNodeWithRelativePath:flags:error:]", 966, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)diskImageURLWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v4;
  id v6;

  v6 = 0;
  -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v6, *MEMORY[0x1E0C9AC18], 1, a4);
  v4 = v6;

  return v4;
}

+ (id)_resolvedURLFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  id *v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v5 = a5;
  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 0x80) != 0)
      v8 = ~(a4 << 6) & 0x100;
    else
      v8 = ~(a4 << 6) & 0x100 | 0x200;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingAliasFileAtURL:options:error:", v7, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    if (a5)
    {
      v12 = *MEMORY[0x1E0CB2938];
      v13[0] = CFSTR("node");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[FSNode _resolvedURLFromAliasFile:flags:error:]", 1040, v11);
      *v5 = (id)objc_claimAutoreleasedReturnValue();

      v5 = 0;
    }
    return v5;
  }
}

+ (id)_resolvedNodeFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  _BYTE *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a1, "_resolvedURLFromAliasFile:flags:error:", a3, *(_QWORD *)&a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "isFileURL"))
      {
        v11 = (_BYTE *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:flags:error:", v10, a4 & 0xFFFFFFFD, a5);
        if (v11)
        {
          if (_CFURLGetResourcePropertyFlags())
            v11[24] = v11[24] & 0xFC | 1;
        }
      }
      else
      {
        v11 = a3;
      }
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_11;
  }
  if (a5)
  {
    v13 = *MEMORY[0x1E0CB2938];
    v14[0] = CFSTR("node");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[FSNode _resolvedNodeFromAliasFile:flags:error:]", 1078, v10);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    return v11;
  }
  return 0;
}

- (id)temporaryDirectoryNodeWithFlags:(unsigned int)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  FSNode *v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "temporaryDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v7, a3 | 8, a4);
  }
  else if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -120, (uint64_t)"-[FSNode temporaryDirectoryNodeWithFlags:error:]", 1154, 0);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)getIsDirectory_NoIO:(BOOL *)a3
{
  BOOL v4;
  char v5;
  id v7;

  v7 = 0;
  v4 = -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v7, *MEMORY[0x1E0C999D0], 0, 0);
  v5 = !v4;
  if (!a3)
    v5 = 1;
  if ((v5 & 1) == 0)
    *a3 = objc_msgSend(v7, "BOOLValue");

  return v4;
}

- (BOOL)isExecutableModeFile
{
  BOOL v3;
  id v5;

  if (!-[FSNode isRegularFile](self, "isRegularFile"))
    return 0;
  v5 = 0;
  if (-[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v5, *MEMORY[0x1E0C9AD50], 1, 0))
  {
    v3 = (objc_msgSend(v5, "unsignedLongLongValue") & 0x49) != 0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isExecutable
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  int v8;

  if (!-[FSNode isRegularFile](self, "isRegularFile"))
    return 0;
  -[FSNode extensionWithError:](self, "extensionWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length")
    || !-[FSNode isExecutableModeFile](self, "isExecutableModeFile")
    || (v8 = 1061109567, !-[FSNode getHFSType:creator:error:](self, "getHFSType:creator:error:", &v8, 0, 0)))
  {
    v6 = 0;
  }
  else
  {
    if (v8)
      v5 = v8 == 1061109567;
    else
      v5 = 1;
    v6 = v5;
  }

  return v6;
}

- (BOOL)isHidden
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C999F0], 128, 0);
}

+ (id)rootVolumeNode
{
  if (+[FSNode rootVolumeNode]::once != -1)
    dispatch_once(&+[FSNode rootVolumeNode]::once, &__block_literal_global_0);
  return (id)+[FSNode rootVolumeNode]::result;
}

void __24__FSNode_rootVolumeNode__block_invoke()
{
  FSNode *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [FSNode alloc];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/"), 1);
  v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  v2 = (void *)+[FSNode rootVolumeNode]::result;
  +[FSNode rootVolumeNode]::result = v1;

}

+ (id)prebootVolumeNode
{
  if (+[FSNode prebootVolumeNode]::onceToken != -1)
    dispatch_once(&+[FSNode prebootVolumeNode]::onceToken, &__block_literal_global_53);
  return (id)+[FSNode prebootVolumeNode]::result;
}

void __27__FSNode_prebootVolumeNode__block_invoke()
{
  FSNode *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [FSNode alloc];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/private/preboot"), 1);
  v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  v2 = (void *)+[FSNode prebootVolumeNode]::result;
  +[FSNode prebootVolumeNode]::result = v1;

}

+ (id)systemDataVolumeNode
{
  if (+[FSNode systemDataVolumeNode]::once != -1)
    dispatch_once(&+[FSNode systemDataVolumeNode]::once, &__block_literal_global_56);
  return (id)+[FSNode systemDataVolumeNode]::result;
}

void __30__FSNode_systemDataVolumeNode__block_invoke()
{
  FSNode *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [FSNode alloc];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/private/var"), 1);
  v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  v2 = (void *)+[FSNode systemDataVolumeNode]::result;
  +[FSNode systemDataVolumeNode]::result = v1;

}

+ (id)userDataVolumeNode
{
  if (+[FSNode userDataVolumeNode]::once != -1)
    dispatch_once(&+[FSNode userDataVolumeNode]::once, &__block_literal_global_59);
  return (id)+[FSNode userDataVolumeNode]::result;
}

void __28__FSNode_userDataVolumeNode__block_invoke()
{
  FSNode *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [FSNode alloc];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/private/var/mobile"), 1);
  v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  v2 = (void *)+[FSNode userDataVolumeNode]::result;
  +[FSNode userDataVolumeNode]::result = v1;

}

void __32__FSNode_isSecuredSystemContent__block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  FSNode *v3;
  uint64_t NonFictionalDeviceNumber;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t i;
  void *v9;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  FSNode *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  +[FSNode rootVolumeNode](FSNode, "rootVolumeNode");
  v15[0] = objc_claimAutoreleasedReturnValue();
  +[FSNode prebootVolumeNode](FSNode, "prebootVolumeNode");
  v1 = 0;
  v2 = 0;
  v15[1] = objc_claimAutoreleasedReturnValue();
  do
  {
    v3 = (FSNode *)(id)v15[v1];
    NonFictionalDeviceNumber = _FSNodeGetNonFictionalDeviceNumber(v3);
    -[FSNode isSecuredSystemContent]::securedDeviceNumber[v2] = NonFictionalDeviceNumber;
    if (NonFictionalDeviceNumber)
    {
      _LSDefaultLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = -[FSNode isSecuredSystemContent]::securedDeviceNumber[v2];
        *(_DWORD *)buf = 134218242;
        v12 = v6;
        v13 = 2112;
        v14 = v3;
        _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "Found secured device number %llu for %@", buf, 0x16u);
      }

      ++v2;
    }
    else
    {
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = (uint64_t)v3;
        _os_log_error_impl(&dword_182882000, v7, OS_LOG_TYPE_ERROR, "Secured device number is zero for %@", buf, 0xCu);
      }

    }
    ++v1;
  }
  while (v1 != 2);
  if (v2 > 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("FSUtils.mm"), 1819, CFSTR("Too many secure device numbers"));

  }
  for (i = 1; i != -1; --i)

}

- (BOOL)isOnDiskImage
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C9AD98], 0, 512);
}

- (BOOL)isOnLocalVolume
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x1E0C99C00], 0, 1);
}

- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4
{
  BOOL v5;
  char v6;
  id v8;

  v8 = 0;
  v5 = -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v8, *MEMORY[0x1E0C9AD28], 1, a4);
  v6 = !v5;
  if (!a3)
    v6 = 1;
  if ((v6 & 1) == 0)
    *a3 = objc_msgSend(v8, "unsignedLongLongValue");

  return v5;
}

- (__CFBundle)copyCFBundleWithError:(id *)a3
{
  void *v5;
  __CFBundle *Unique;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (!-[FSNode canReadFromSandboxWithAuditToken:](self, "canReadFromSandboxWithAuditToken:", 0))
  {
    if (a3)
    {
      v8 = (void *)*MEMORY[0x1E0CB2F90];
      v9 = -10659;
      v10 = 2329;
LABEL_10:
      _LSMakeNSErrorImpl(v8, v9, (uint64_t)"-[FSNode copyCFBundleWithError:]", v10, 0);
      Unique = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return Unique;
    }
    return 0;
  }
  -[FSNode URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Unique = (__CFBundle *)_CFBundleCreateUnique();

  if (!Unique)
  {
    if (a3)
    {
      v8 = (void *)*MEMORY[0x1E0CB2F90];
      v9 = -10813;
      v10 = 2326;
      goto LABEL_10;
    }
    return 0;
  }
  CFBundleGetIdentifier(Unique);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[FSNode setTemporaryResourceValue:forKey:](self, "setTemporaryResourceValue:forKey:", v7, CFSTR("com.apple.LSBundleIdentifierKey"));

  return Unique;
}

- (id)bundleInfoDictionaryWithError:(id *)a3
{
  const __CFURL *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  uint64_t v9;
  CFDictionaryRef v10;
  const __CFDictionary *v11;
  CFDictionaryRef v13;

  v13 = 0;
  if (!-[FSNode getTemporaryResourceValue:forKey:](self, "getTemporaryResourceValue:forKey:", &v13, CFSTR("com.apple.LSBundleInfoDictionaryKey")))
  {
    -[FSNode URL](self, "URL");
    v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v6 = CFBundleCopyInfoDictionaryForURL(v5);
    v7 = v13;
    v13 = v6;

    if (v13)
      v8 = v13;
    else
      v8 = (CFDictionaryRef)MEMORY[0x1E0C9AA70];
    -[FSNode setTemporaryResourceValue:forKey:](self, "setTemporaryResourceValue:forKey:", v8, CFSTR("com.apple.LSBundleInfoDictionaryKey"));
  }
  if (!v13)
  {
    v10 = 0;
    if (!a3)
      goto LABEL_14;
    goto LABEL_12;
  }
  v9 = -[__CFDictionary count](v13, "count");
  v10 = v13;
  if (!v9)
  {
    v13 = 0;

    v10 = v13;
  }
  if (a3)
  {
LABEL_12:
    if (!v10)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10813, (uint64_t)"-[FSNode bundleInfoDictionaryWithError:]", 2357, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v13;
    }
  }
LABEL_14:
  v11 = v10;

  return v11;
}

- (id)bundleIdentifierWithError:(id *)a3
{
  return -[FSNode bundleIdentifierWithContext:error:](self, "bundleIdentifierWithContext:error:", 0, a3);
}

- (id)bundleIdentifierWithContext:(LSContext *)a3 error:(id *)a4
{
  BOOL v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  __CFBundle *v11;
  __CFBundle *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v7 = -[FSNode getTemporaryResourceValue:forKey:](self, "getTemporaryResourceValue:forKey:", &v20, CFSTR("com.apple.LSBundleIdentifierKey"));
  if (v20)
    v8 = v7;
  else
    v8 = 0;
  if (!v8)
  {
    if (a3)
    {
      v21[0] = 0;
      if (!_LSBundleFindWithNode((uint64_t)a3, self, 0, v21) && v21[0])
      {
        v9 = _CSStringCopyCFString();
        v10 = v20;
        v20 = v9;

      }
    }
    else
    {
      v11 = -[FSNode copyCFBundleWithError:](self, "copyCFBundleWithError:", a4);
      v12 = v11;
      if (v11)
      {
        CFBundleGetIdentifier(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v13;
            v15 = v20;
            v20 = v14;
          }
          else
          {
            _LSDefaultLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              -[FSNode URL](self, "URL");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "absoluteString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[FSNode bundleIdentifierWithContext:error:].cold.1(v17, (uint64_t)v21, v15, v16);
            }
          }

        }
        CFRelease(v12);
      }
    }
    if (v20)
    {
      -[FSNode setTemporaryResourceValue:forKey:](self, "setTemporaryResourceValue:forKey:", v20, CFSTR("com.apple.LSBundleIdentifierKey"));
    }
    else if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10813, (uint64_t)"-[FSNode bundleIdentifierWithContext:error:]", 2406, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v18 = v20;

  return v18;
}

- (BOOL)getCreationDate:(double *)a3 error:(id *)a4
{
  return _FSNodeGetTimestampValue(self, *MEMORY[0x1E0C998E8], a3, a4);
}

- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4
{
  BOOL v5;
  char v6;
  id v8;

  v8 = 0;
  v5 = -[FSNode getResourceValue:forKey:options:error:](self, "getResourceValue:forKey:options:error:", &v8, *MEMORY[0x1E0C99998], 1, a4);
  v6 = !v5;
  if (!a3)
    v6 = 1;
  if ((v6 & 1) == 0)
    *a3 = objc_msgSend(v8, "unsignedLongLongValue");

  return v5;
}

- (BOOL)getWriterBundleIdentifier:(id *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[FSNode getWriterBundleIdentifier:error:]", 2550, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)setFinderInfo:(id *)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, 32, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[FSNode setResourceValue:forKey:options:error:](self, "setResourceValue:forKey:options:error:", v6, *MEMORY[0x1E0C9AC60], 3, a4);
    }
    else if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -41, (uint64_t)"-[FSNode(FinderInfo) setFinderInfo:error:]", 2613, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    if (a4)
    {
      v10 = *MEMORY[0x1E0CB2938];
      v11[0] = CFSTR("finderInfo");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode(FinderInfo) setFinderInfo:error:]", 2617, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  return v7;
}

+ (BOOL)canAccessURL:(id)a3 withAuditToken:(id *)a4 operation:(const char *)a5
{
  int v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  id v12;

  if (a3 && (a4 || _LSGetAuditTokenForSelf()))
  {
    v12 = 0;
    v6 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v12, *MEMORY[0x1E0C998C8], 0);
    v7 = v12;
    v8 = v7;
    if (!v6 || !objc_msgSend(v7, "length"))
      goto LABEL_11;
    fileSystemRealPath(v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = 0;
      v8 = 0;
      goto LABEL_12;
    }
    if (!objc_msgSend(v9, "length"))
    {
      v10 = 0;
      v8 = v9;
      goto LABEL_12;
    }
    v8 = objc_retainAutorelease(v9);
    if (objc_msgSend(v8, "fileSystemRepresentation"))
      v10 = sandbox_check_by_audit_token() == 0;
    else
LABEL_11:
      v10 = 0;
LABEL_12:

    return v10;
  }
  return 0;
}

+ (BOOL)canAccessURL:(id)a3 fromSandboxWithAuditToken:(id *)a4 operation:(const char *)a5
{
  uint64_t v6;

  if (a3 && ((v6 = (uint64_t)a4) != 0 || (v6 = _LSGetAuditTokenForSelf()) != 0))
    return objc_msgSend((id)objc_opt_class(), "canAccessURL:withAuditToken:operation:", a3, v6, a5);
  else
    return 0;
}

- (BOOL)canReadWithAuditToken:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "canReadURL:withAuditToken:", v6, a3);

  return (char)a3;
}

- (BOOL)canWriteWithAuditToken:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "canWriteURL:withAuditToken:", v6, a3);

  return (char)a3;
}

- (BOOL)canReadMetadataWithAuditToken:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "canReadMetadataOfURL:withAuditToken:", v6, a3);

  return (char)a3;
}

+ (BOOL)canReadURL:(id)a3 withAuditToken:(id *)a4
{
  return objc_msgSend(a1, "canAccessURL:withAuditToken:operation:", a3, a4, "file-read-data");
}

+ (BOOL)canWriteURL:(id)a3 withAuditToken:(id *)a4
{
  return objc_msgSend(a1, "canAccessURL:withAuditToken:operation:", a3, a4, "file-write-data");
}

+ (BOOL)canReadMetadataOfURL:(id)a3 withAuditToken:(id *)a4
{
  char v7;
  void *v8;

  if ((objc_msgSend(a1, "canAccessURL:withAuditToken:operation:", a3, a4, "file-read-metadata") & 1) != 0)
    return 1;
  objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v7 = objc_msgSend(a1, "canReadURL:withAuditToken:", v8, a4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)canReadFromSandboxWithAuditToken:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "canReadURL:fromSandboxWithAuditToken:", v6, a3);

  return (char)a3;
}

- (BOOL)canWriteFromSandboxWithAuditToken:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "canWriteURL:fromSandboxWithAuditToken:", v6, a3);

  return (char)a3;
}

- (BOOL)canReadMetadataFromSandboxWithAuditToken:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "canReadMetadataOfURL:fromSandboxWithAuditToken:", v6, a3);

  return (char)a3;
}

+ (BOOL)canReadURL:(id)a3 fromSandboxWithAuditToken:(id *)a4
{
  return objc_msgSend(a1, "canAccessURL:fromSandboxWithAuditToken:operation:", a3, a4, "file-read-data");
}

+ (BOOL)canWriteURL:(id)a3 fromSandboxWithAuditToken:(id *)a4
{
  return objc_msgSend(a1, "canAccessURL:fromSandboxWithAuditToken:operation:", a3, a4, "file-write-data");
}

+ (BOOL)canReadMetadataOfURL:(id)a3 fromSandboxWithAuditToken:(id *)a4
{
  char v7;
  void *v8;

  if ((objc_msgSend(a1, "canAccessURL:fromSandboxWithAuditToken:operation:", a3, a4, "file-read-metadata") & 1) != 0)
    return 1;
  objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v7 = objc_msgSend(a1, "canReadURL:fromSandboxWithAuditToken:", v8, a4);
  else
    v7 = 0;

  return v7;
}

- (id)extendedAttributeWithName:(id)a3 options:(int)a4 error:(id *)a5
{
  ssize_t v9;
  ssize_t v10;
  void *v11;
  void *v12;
  id v13;
  ssize_t v14;
  id v15;
  void *v16;
  void *v18;
  int *v19;
  id v20;
  int *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  char name[128];
  char path[1024];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a3, "length"))
  {
    if (-[FSNode getFileSystemRepresentation:error:](self, "getFileSystemRepresentation:error:", path, a5))
    {
      if ((objc_msgSend(a3, "getCString:maxLength:encoding:", name, 128, 4) & 1) != 0)
      {
        v9 = getxattr(path, name, 0, 0, 0, a4);
        v10 = v9;
        if (v9 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = objc_retainAutorelease(v11);
            v14 = getxattr(path, name, (void *)objc_msgSend(v13, "mutableBytes"), objc_msgSend(v13, "length"), 0, a4);
            if ((v14 & 0x8000000000000000) == 0)
            {
              if (v14 == v10)
              {
                v15 = v13;
LABEL_30:

                return v15;
              }
              if (a5)
              {
                _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -1304, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3475, 0);
                v20 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_28;
              }
LABEL_29:
              v15 = 0;
              goto LABEL_30;
            }
            if (!a5)
              goto LABEL_29;
            v21 = __error();
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], *v21, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3471, 0);
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!a5)
              goto LABEL_29;
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -41, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3482, 0);
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_28:
          v15 = 0;
          *a5 = v20;
          goto LABEL_30;
        }
        if (v9)
        {
          if (a5)
          {
            v19 = __error();
            _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], *v19, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3490, 0);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            return 0;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (v15)
            return v15;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("FSUtils.mm"), 3487, CFSTR("Failed to allocate empty NSData."));

        }
      }
      else if (a5)
      {
        v26 = *MEMORY[0x1E0CB2938];
        v27 = CFSTR("Extended attribute name too long or invalid.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3460, v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else if (a5)
  {
    v24 = *MEMORY[0x1E0CB2938];
    v25 = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]", 3495, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = 0;
  return v15;
}

- (BOOL)setExtendedAttribute:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6
{
  _BOOL4 v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  int *v16;
  id v17;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  char name[128];
  char path[1024];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a4 || !objc_msgSend(a4, "length"))
  {
    if (a6)
    {
      v19 = *MEMORY[0x1E0CB2938];
      v20 = CFSTR("name");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode(ExtendedAttributes) setExtendedAttribute:name:options:error:]", 3537, v14);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  v11 = -[FSNode getFileSystemRepresentation:error:](self, "getFileSystemRepresentation:error:", path, a6);
  if (!v11)
    return v11;
  if ((objc_msgSend(a4, "getCString:maxLength:encoding:", name, 128, 4) & 1) == 0)
  {
    if (a6)
    {
      v21 = *MEMORY[0x1E0CB2938];
      v22 = CFSTR("Extended attribute name too long or invalid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[FSNode(ExtendedAttributes) setExtendedAttribute:name:options:error:]", 3513, v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_9:
    LOBYTE(v11) = 0;
    return v11;
  }
  if (a3)
  {
    v12 = objc_retainAutorelease(a3);
    v13 = setxattr(path, name, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), 0, a5) == 0;
  }
  else
  {
    if (!removexattr(path, name, a5))
    {
      LOBYTE(v11) = 1;
      return v11;
    }
    v13 = *__error() == 93;
  }
  LOBYTE(v11) = v13;
  if (a6 && !v11)
  {
    v16 = __error();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], *v16, (uint64_t)"-[FSNode(ExtendedAttributes) setExtendedAttribute:name:options:error:]", 3532, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 0;
    *a6 = v17;
  }
  return v11;
}

- (id)bookmarkDataRelativeToNode:(id)a3 error:(id *)a4
{
  return -[FSNode bookmarkDataWithOptions:relativeToNode:error:](self, "bookmarkDataWithOptions:relativeToNode:error:", 0x20000000, a3, a4);
}

- (id)bookmarkDataWithOptions:(unint64_t)a3 relativeToNode:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[FSNode canonicalPathWithError:](self, "canonicalPathWithError:", a5, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_14;
  v8 = (void *)MEMORY[0x186DAE7A0]();
  if (-[FSNode isDirectory](self, "isDirectory"))
  {
    if ((objc_msgSend(v7, "hasSuffix:", CFSTR("/")) & 1) == 0)
    {
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("/"));
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v9;
    }
  }
  else
  {
    while (objc_msgSend(v7, "hasSuffix:", CFSTR("/")))
    {
      objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v7, "length") - 1, 1, &stru_1E10473A0);
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v15;
    }
  }
  objc_autoreleasePoolPop(v8);
  v7 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  if (!v10)
  {
    if (a5)
    {
      v13 = 3722;
      v14 = -2110;
      goto LABEL_13;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v10, strlen(v10));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (a5 && !v11)
  {
    v13 = 3718;
    v14 = -41;
LABEL_13:
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v14, (uint64_t)"-[FSNode(BookmarkData) bookmarkDataWithOptions:relativeToNode:error:]", v13, 0);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v12;
}

+ (unsigned)compareBookmarkData:(id)a3 toBookmarkData:(id)a4
{
  return objc_msgSend(a3, "isEqual:", a4) ^ 1;
}

+ (id)nameForBookmarkData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a1, "pathForBookmarkData:error:", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "lastPathComponent");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (a4)
      {
        if (!v7)
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -37, (uint64_t)"+[FSNode(BookmarkData) nameForBookmarkData:error:]", 3868, 0);
          v8 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    else
    {
      v8 = 0;
    }

    return v8;
  }
  else
  {
    if (a4)
    {
      v11 = *MEMORY[0x1E0CB2938];
      v12[0] = CFSTR("bookmark");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[FSNode(BookmarkData) nameForBookmarkData:error:]", 3872, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

+ (BOOL)getVolumeIdentifier:(unint64_t *)a3 forBookmarkData:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  char v9;

  v7 = -[FSNode initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:]([FSNode alloc], "initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:", a4, 0, 0, a5);
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "getVolumeIdentifier:error:", a3, a5);
  else
    v9 = 0;

  return v9;
}

+ (BOOL)isBookmarkDataFull:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "length");
  if (v4)
    LOBYTE(v4) = *(_BYTE *)objc_msgSend(objc_retainAutorelease(a3), "bytes") != 47;
  return v4;
}

- (void)bundleIdentifierWithContext:(NSObject *)a3 error:(void *)a4 .cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a3, (uint64_t)a3, "*** Malformed bundle %{public}@; CFBundleIdentifier is not a string ",
    (uint8_t *)a2);

}

@end
