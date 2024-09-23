@implementation NSFileWrapper

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (void *)objc_msgSend(self->_contents, "objectEnumerator");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "_removeParent:", self);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      }
      while (v5);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)NSFileWrapper;
  -[NSFileWrapper dealloc](&v8, sel_dealloc);
}

- (void)_removeParent:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&NSFileWrapperLock);
  -[NSHashTable removeObject:](self->_parents, "removeObject:", a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&NSFileWrapperLock);
}

- (NSData)regularFileContents
{
  id contents;
  NSURL *contentsURL;
  NSObject *v6;
  NSString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[NSFileWrapper isRegularFile](self, "isRegularFile"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** this method is only for regular file type NSFileWrappers"), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v10);
  }
  contents = self->_contents;
  if (!contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      v11 = 0;
      if (!-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:](self, "_readContentsFromURL:path:itemKind:options:error:", contentsURL, 0, CFSTR("NSFileTypeRegular"), 2 * self->_contentsMustBeReadWithoutMapping, &v11))
      {

        self->_contentsLazyReadingError = (NSError *)v11;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSFileWrapperLogsLess")) & 1) == 0&& (regularFileContents_alreadyWarned & 1) == 0)
        {
          regularFileContents_alreadyWarned = 1;
          v6 = _NSOSLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v8 = _NSFullMethodName((objc_class *)self, a2);
            v9 = objc_msgSend(v11, "localizedDescription");
            *(_DWORD *)buf = 138412546;
            v13 = v8;
            v14 = 2112;
            v15 = v9;
            _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "%@ tried to read the file wrapper's contents lazily but an error occurred: %@", buf, 0x16u);
          }
        }
      }
      contents = self->_contents;
    }
    else
    {
      contents = 0;
    }
  }
  return (NSData *)contents;
}

- (BOOL)_readContentsFromURL:(id)a3 path:(id)a4 itemKind:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  int v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  BOOL v27;
  int v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = objc_msgSend(a3, "startAccessingSecurityScopedResource");
  if (!a4)
  {
    a4 = (id)objc_msgSend((id)objc_opt_class(), "_pathForURL:reading:error:", a3, 1, a7);
    if (!a4)
    {
      v27 = 0;
      if (!v13)
        return v27;
      goto LABEL_30;
    }
  }
  if (-[NSFileWrapper isDirectory](self, "isDirectory"))
    v14 = (void *)objc_msgSend(self->_contents, "mutableCopy");
  else
    v14 = 0;
  v15 = objc_msgSend((id)objc_opt_class(), "_newContentsAtURL:path:itemKind:oldChildrenByUniqueFileName:options:error:", a3, a4, a5, v14, a6, a7);
  v16 = a6 & 0x100 | v15;
  v17 = v16 == 0;
  if (v16)
  {
    v18 = (void *)v15;
    v29 = v13;
    if (a7 && !v15)
      *a7 = 0;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v14);
          -[NSFileWrapper _removeChild:forUniqueFileName:](self, "_removeChild:forUniqueFileName:", objc_msgSend(v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        }
        v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
      }
      while (v20);
    }
    if (objc_msgSend(a5, "isEqualToString:", CFSTR("NSFileTypeDirectory")))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v23 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v32 != v25)
              objc_enumerationMutation(v18);
            -[NSFileWrapper _addChild:forUniqueFileName:](self, "_addChild:forUniqueFileName:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), 0);
          }
          v24 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
        }
        while (v24);
      }

      v13 = v29;
      if (v18 && !self->_contents)
        -[NSFileWrapper _initDirectoryContents](self, "_initDirectoryContents");
    }
    else
    {

      self->_contents = v18;
      v13 = v29;
    }
  }
  v27 = !v17;

  if (v13)
LABEL_30:
    objc_msgSend(a3, "stopAccessingSecurityScopedResource");
  return v27;
}

- (NSDictionary)fileWrappers
{
  NSDictionary *result;
  NSURL *contentsURL;
  NSObject *v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** this method is only for directory type NSFileWrappers"), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  if (!self->_contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      v10 = 0;
      if (!-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:](self, "_readContentsFromURL:path:itemKind:options:error:", contentsURL, 0, CFSTR("NSFileTypeDirectory"), 2 * self->_contentsMustBeReadWithoutMapping, &v10))
      {

        self->_contentsLazyReadingError = (NSError *)v10;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSFileWrapperLogsLess")) & 1) == 0&& (fileWrappers_alreadyWarned & 1) == 0)
        {
          fileWrappers_alreadyWarned = 1;
          v6 = _NSOSLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v7 = _NSFullMethodName((objc_class *)self, a2);
            v8 = objc_msgSend(v10, "localizedDescription");
            *(_DWORD *)buf = 138412546;
            v12 = v7;
            v13 = 2112;
            v14 = v8;
            _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "%@ tried to read the file wrapper's contents lazily but an error occurred: %@", buf, 0x16u);
          }
        }
      }
    }
  }
  result = self->_cachedDirectoryChildrenAsDictionary;
  if (!result)
  {
    result = (NSDictionary *)objc_msgSend(self->_contents, "copy");
    self->_cachedDirectoryChildrenAsDictionary = result;
  }
  return result;
}

- (NSFileWrapper)initWithURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError
{
  NSFileWrapper *v8;
  NSFileWrapper *v9;
  NSURL *v10;
  NSURL *v11;
  uint64_t v12;
  NSURL *v13;
  int v14;
  NSFileWrapperReadingOptions v15;
  NSFileManager *v16;
  uint64_t v17;
  NSString *v18;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NSFileWrapper;
  v8 = -[NSFileWrapper init](&v20, sel_init);
  if (v8)
  {
    v9 = v8;
    v10 = (NSURL *)objc_msgSend((id)objc_opt_class(), "_pathForURL:reading:error:", url, 1, outError);
    if (v10)
    {
      v11 = v10;
      if ((-[NSURL isEqualToString:](v10, "isEqualToString:", CFSTR("/")) & 1) == 0)
      {
        if ((options & 0x202) == 0)
        {
          v14 = objc_msgSend((id)objc_opt_class(), "_canSafelyMapFilesAtPath:", v11);
          v15 = options | 2;
          if (v14)
            v15 = options;
          options = v15 | 0x200;
        }
        v16 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
        v17 = objc_msgSend(-[NSFileManager _attributesOfItemAtURL:filterResourceFork:error:](v16, "_attributesOfItemAtURL:filterResourceFork:error:", url, 0, outError), "copy");
        v9->_fileAttributes = (NSDictionary *)v17;
        if (!v17)
          goto LABEL_24;
        v18 = (NSString *)-[NSString copy](-[NSURL lastPathComponent](v11, "lastPathComponent"), "copy");
        v9->_preferredFileName = v18;
        v9->_fileName = v18;
        if ((options & 1) != 0)
        {
          if (-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:](v9, "_readContentsFromURL:path:itemKind:options:error:", url, v11, -[NSDictionary fileType](v9->_fileAttributes, "fileType"), options, outError))
          {
            return v9;
          }
          goto LABEL_24;
        }
        if (url)
        {
          if (-[NSFileManager isReadableFileAtPath:](v16, "isReadableFileAtPath:", v11) || (options & 0x100) != 0)
          {
            v9->_contentsURL = url;
            v9->_contentsMustBeReadWithoutMapping = (options & 2) != 0;
            return v9;
          }
          if (!outError)
            goto LABEL_24;
          v12 = 13;
          v13 = url;
        }
        else
        {
          if (!outError)
            goto LABEL_24;
          v12 = 2;
          v13 = 0;
        }
        goto LABEL_6;
      }
      if (outError)
      {
        v12 = 27;
        v13 = v11;
LABEL_6:
        *outError = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v12, (uint64_t)v13, 1, 0, 0);
      }
    }
LABEL_24:

    return 0;
  }
  if (!outError)
    return 0;
  v9 = 0;
  *outError = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(12, (uint64_t)url, 1, 0, 0);
  return v9;
}

+ (id)_pathForURL:(id)a3 reading:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSError *v12;

  v6 = a4;
  if (!objc_msgSend(a3, "isFileURL"))
  {
    if (!a5)
      return 0;
    if (a3)
      v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, CFSTR("NSURL"));
    else
      v10 = 0;
    if (v6)
      v11 = 262;
    else
      v11 = 518;
    goto LABEL_16;
  }
  result = (id)objc_msgSend(a3, "path");
  if (a5 && !result)
  {
    if (v6)
      v9 = 260;
    else
      v9 = 4;
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, CFSTR("NSURL"));
    v11 = v9;
LABEL_16:
    v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v11, v10);
    result = 0;
    *a5 = v12;
  }
  return result;
}

+ (BOOL)_canSafelyMapFilesAtPath:(id)a3
{
  int IsSafeForMapping;
  int v4;
  BOOL v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11[1026];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  IsSafeForMapping = objc_msgSend(a3, "getFileSystemRepresentation:maxLength:", v11, 1024);
  if (IsSafeForMapping)
  {
    v10 = 0;
    v7 = 0;
    v8 = 5;
    v9 = 2147500032;
    v4 = getattrlist(v11, &v8, &v7, 8uLL, 0);
    LOBYTE(IsSafeForMapping) = 0;
    if (!v4 && (WORD2(v7) & 0x1200) == 0x1000)
    {
      IsSafeForMapping = _NSFileCompressionTypeIsSafeForMapping((uint64_t)v11);
      if (IsSafeForMapping)
      {
        v7 = 0;
        v9 = 0;
        v10 = 0;
        v8 = 0x4000000000000005;
        if (getattrlist(v11, &v8, &v7, 8uLL, 1u))
          v5 = 0;
        else
          v5 = HIDWORD(v7) == 1;
        LOBYTE(IsSafeForMapping) = !v5;
      }
    }
  }
  return IsSafeForMapping;
}

- (id)_addChild:(id)a3 forUniqueFileName:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  BOOL v12;
  id contents;

  v4 = a4;
  if (!a4)
  {
    v4 = (id)objc_msgSend(a3, "preferredFilename");
    v7 = objc_msgSend(self->_contents, "objectForKey:", v4);
    if (!v4 || v7)
    {
      v8 = 1;
      do
      {
        v9 = v8 + 1;
        v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu%@%@"), v8, CFSTR("__#$!@%!#__"), v4);
        v11 = objc_msgSend(self->_contents, "objectForKey:", v10);
        if (v10)
          v12 = v11 == 0;
        else
          v12 = 0;
        v8 = v9;
      }
      while (!v12);
      v4 = v10;
    }
  }
  contents = self->_contents;
  if (!contents)
  {
    -[NSFileWrapper _initDirectoryContents](self, "_initDirectoryContents");
    contents = self->_contents;
  }
  objc_msgSend(contents, "setObject:forKey:", a3, v4);
  objc_msgSend(a3, "_addParent:", self);
  return v4;
}

- (NSString)preferredFilename
{
  return self->_preferredFileName;
}

- (void)_addParent:(id)a3
{
  NSHashTable *parents;

  os_unfair_lock_lock((os_unfair_lock_t)&NSFileWrapperLock);
  parents = self->_parents;
  if (!parents)
  {
    parents = +[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable");
    self->_parents = parents;
  }
  -[NSHashTable addObject:](parents, "addObject:", a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&NSFileWrapperLock);
}

+ (id)_newContentsAtURL:(id)a3 path:(id)a4 itemKind:(id)a5 oldChildrenByUniqueFileName:(id)a6 options:(unint64_t)a7 error:(id *)a8
{
  NSFileManager *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t i;
  void *v22;
  NSAutoreleasePool *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id *v38;
  id v39;
  unint64_t v41;
  uint64_t v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v14 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("NSFileTypeDirectory")))
  {
    v15 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](v14, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a3, 0, 0, a8);
    if (v15)
    {
      v16 = (void *)v15;
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v41 = a7 | 0x100;
        v42 = *(_QWORD *)v50;
        v37 = v17;
        v38 = a8;
        v39 = a6;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v50 != v42)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            v23 = objc_alloc_init(NSAutoreleasePool);
            v24 = (void *)objc_msgSend(v22, "lastPathComponent");
            if (!objc_msgSend((id)objc_msgSend(v24, "pathExtension"), "isEqualToString:", CFSTR("tiff")))
              goto LABEL_47;
            if (!v20)
            {
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v16, "count"));
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v45;
                do
                {
                  for (j = 0; j != v26; ++j)
                  {
                    if (*(_QWORD *)v45 != v27)
                      objc_enumerationMutation(v16);
                    v29 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "lastPathComponent", v37, v38);
                    if (v29)
                      objc_msgSend(v20, "addObject:", v29);
                  }
                  v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
                }
                while (v26);
                v17 = v37;
                a8 = v38;
              }
              a6 = v39;
            }
            if ((objc_msgSend(v20, "containsObject:", objc_msgSend(v24, "stringByDeletingPathExtension", v37, v38)) & 1) == 0)
            {
LABEL_47:
              if (v24 && (v30 = (void *)objc_msgSend(a6, "objectForKey:", v24)) != 0)
              {
                if (!objc_msgSend(v30, "readFromURL:options:error:", v22, v41, a8))
                  goto LABEL_36;
                objc_msgSend(a6, "removeObjectForKey:", v24);
              }
              else
              {
                v31 = objc_msgSend(objc_alloc((Class)a1), "initWithURL:options:error:", v22, v41, a8);
                if (!v31)
                {
LABEL_36:
                  if (a8)
                  {
                    v35 = *a8;
                    -[NSAutoreleasePool drain](v23, "drain");
                    v36 = *a8;
                  }
                  else
                  {
                    -[NSAutoreleasePool drain](v23, "drain");
                  }

                  return 0;
                }
                v32 = (void *)v31;
                objc_msgSend(v17, "addObject:", v31);

              }
            }
            -[NSAutoreleasePool drain](v23, "drain", v37, v38);
          }
          v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
          if (v19)
            continue;
          break;
        }

      }
      return v17;
    }
    return 0;
  }
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("NSFileTypeRegular")))
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", a3, ~(a7 >> 1) & 1, a8);
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("NSFileTypeSymbolicLink")))
  {
    v34 = -[NSFileManager destinationOfSymbolicLinkAtPath:error:](v14, "destinationOfSymbolicLinkAtPath:error:", a4, a8);
    if (v34)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v34);
    return 0;
  }
  if (!a8)
    return 0;
  v17 = 0;
  *a8 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(5, (uint64_t)a3, 1, 0, 0);
  return v17;
}

- (BOOL)isRegularFile
{
  return objc_msgSend(-[NSDictionary fileType](-[NSFileWrapper fileAttributes](self, "fileAttributes"), "fileType"), "isEqualToString:", CFSTR("NSFileTypeRegular"));
}

- (BOOL)isDirectory
{
  return objc_msgSend(-[NSDictionary fileType](-[NSFileWrapper fileAttributes](self, "fileAttributes"), "fileType"), "isEqualToString:", CFSTR("NSFileTypeDirectory"));
}

- (NSDictionary)fileAttributes
{
  os_unfair_lock_s *p_propertyLock;
  NSDictionary *v4;
  id v5;
  id v6;

  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  if (_CFAppVersionCheckLessThan() || _CFAppVersionCheckLessThan())
  {
    v4 = (NSDictionary *)-[NSDictionary mutableCopy](self->_fileAttributes, "mutableCopy");
    v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSFileHFSCreatorCode"));
    if (v5 && !objc_msgSend(v5, "unsignedIntValue"))
      -[NSDictionary removeObjectForKey:](v4, "removeObjectForKey:", CFSTR("NSFileHFSCreatorCode"));
    v6 = -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSFileHFSTypeCode"));
    if (v6 && !objc_msgSend(v6, "unsignedIntValue"))
      -[NSDictionary removeObjectForKey:](v4, "removeObjectForKey:", CFSTR("NSFileHFSTypeCode"));
  }
  else
  {
    v4 = self->_fileAttributes;
  }
  os_unfair_lock_unlock(p_propertyLock);
  return v4;
}

- (void)_initDirectoryContents
{
  __int128 v2;
  CFDictionaryKeyCallBacks v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)(MEMORY[0x1E0C9B390] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x1E0C9B390];
  *(_OWORD *)&v3.release = v2;
  v3.equal = (CFDictionaryEqualCallBack)NSFileWrapperChildNameIsEqual_CFDictionary;
  v3.hash = (CFDictionaryHashCallBack)NSFileWrapperChildNameHash_CFDictionary;
  self->_contents = CFDictionaryCreateMutable(0, 0, &v3, MEMORY[0x1E0C9B3A0]);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 46);
}

- (NSFileWrapper)init
{
  return -[NSFileWrapper initRegularFileWithContents:](self, "initRegularFileWithContents:", 0);
}

- (NSFileWrapper)initDirectoryWithFileWrappers:(NSDictionary *)childrenByPreferredName
{
  NSFileWrapper *v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  objc_super v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSFileWrapper;
  v4 = -[NSFileWrapper init](&v12, sel_init);
  if (v4)
  {
    v4->_fileAttributes = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("NSFileTypeDirectory"), CFSTR("NSFileType"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 511), CFSTR("NSFilePosixPermissions"), 0);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](childrenByPreferredName, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(childrenByPreferredName);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v10 = -[NSDictionary objectForKey:](childrenByPreferredName, "objectForKey:", v9);
          if (!objc_msgSend(v10, "preferredFilename"))
            objc_msgSend(v10, "setPreferredFilename:", v9);
          -[NSFileWrapper _addChild:forUniqueFileName:](v4, "_addChild:forUniqueFileName:", v10, 0);
        }
        v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](childrenByPreferredName, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v6);
    }
    if (!v4->_contents)
      -[NSFileWrapper _initDirectoryContents](v4, "_initDirectoryContents");
  }
  return v4;
}

- (NSFileWrapper)initRegularFileWithContents:(NSData *)contents
{
  NSFileWrapper *v4;
  id v5;
  NSNumber *v6;
  id v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSFileWrapper;
  v4 = -[NSFileWrapper init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 438);
    v4->_fileAttributes = (NSDictionary *)objc_msgSend(v5, "initWithObjectsAndKeys:", CFSTR("NSFileTypeRegular"), CFSTR("NSFileType"), v6, CFSTR("NSFilePosixPermissions"), objc_msgSend(MEMORY[0x1E0C99D68], "date"), CFSTR("NSFileModificationDate"), 0);
    if (contents)
      v7 = (id)-[NSData copy](contents, "copy");
    else
      v7 = objc_alloc_init(MEMORY[0x1E0C99D50]);
    v4->_contents = v7;
  }
  return v4;
}

- (NSFileWrapper)initSymbolicLinkWithDestinationURL:(NSURL *)url
{
  NSFileWrapper *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFileWrapper;
  v4 = -[NSFileWrapper init](&v6, sel_init);
  if (v4)
  {
    v4->_fileAttributes = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("NSFileTypeSymbolicLink"), CFSTR("NSFileType"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 438), CFSTR("NSFilePosixPermissions"), 0);
    v4->_contents = (id)-[NSURL copy](url, "copy");
  }
  return v4;
}

- (NSFileWrapper)initWithSerializedRepresentation:(NSData *)serializeRepresentation
{
  NSRTFD *v4;
  NSRTFD *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  NSFileWrapper *v12;
  NSRTFD *v13;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSFileWrapper *v19;
  NSObject *v20;
  int v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = -[NSRTFD initWithDataRepresentation:]([NSRTFD alloc], "initWithDataRepresentation:", serializeRepresentation);
  if (!v4)
  {
LABEL_15:

    return 0;
  }
  v5 = v4;
  v6 = -[NSRTFD objectForKey:](v4, "objectForKey:", CFSTR("__@UTF8PreferredName@__"));
  if (v6)
  {
    v7 = v6;
    v8 = [NSString alloc];
    v9 = (NSString *)v7;
    v10 = 4;
  }
  else
  {
    v11 = -[NSRTFD objectForKey:](v5, "objectForKey:", CFSTR("__@PreferredName@__"));
    if (!v11)
      goto LABEL_8;
    v8 = [NSString alloc];
    v9 = v11;
    v10 = 2;
  }
  v11 = -[NSString initWithData:encoding:](v8, "initWithData:encoding:", v9, v10);
  if (v11)
  {
    -[NSRTFD removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("__@UTF8PreferredName@__"));
    -[NSRTFD removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("__@PreferredName@__"));
    if ((_validateFilename(v11) & 1) == 0)
    {
      v20 = _NSOSLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = 138477827;
        v23 = v11;
        _os_log_error_impl(&dword_1817D9000, v20, OS_LOG_TYPE_ERROR, "-[NSFileWrapper initWithSerializedRepresentation:] encountered an invalid preferredFileName: %{private}@", (uint8_t *)&v22, 0xCu);
      }

      goto LABEL_15;
    }
  }
LABEL_8:
  if (-[NSRTFD isPackage](v5, "isPackage"))
  {
    v12 = self;
    v13 = v5;
    v14 = v11;
    v15 = 0;
    v16 = 0;
  }
  else
  {
    v17 = -[NSRTFD objectForKey:](v5, "objectForKey:", 0x1E0F67F30);
    v18 = -[NSRTFD _getDocInfoForKey:](v5, "_getDocInfoForKey:", 0x1E0F67F30);
    v16 = -[NSRTFD objectForKey:](v5, "objectForKey:", objc_msgSend(CFSTR(".."), "stringByAppendingPathExtension:", CFSTR("tiff")));
    v12 = self;
    v13 = (NSRTFD *)v17;
    v14 = v11;
    v15 = v18;
  }
  v19 = -[NSFileWrapper _initWithImpl:preferredFileName:uniqueFileName:docInfo:iconData:](v12, "_initWithImpl:preferredFileName:uniqueFileName:docInfo:iconData:", v13, v14, 0, v15, v16);

  return v19;
}

- (BOOL)isSymbolicLink
{
  return objc_msgSend(-[NSDictionary fileType](-[NSFileWrapper fileAttributes](self, "fileAttributes"), "fileType"), "isEqualToString:", CFSTR("NSFileTypeSymbolicLink"));
}

- (void)_observePreferredFileNameOfChild:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v4 = a3;
  v5 = -[NSArray count](-[NSDictionary allKeysForObject:](-[NSFileWrapper fileWrappers](self, "fileWrappers"), "allKeysForObject:", a3), "count");
  if (v5)
  {
    v6 = v5;
    v7 = v5;
    do
    {
      -[NSFileWrapper removeFileWrapper:](self, "removeFileWrapper:", a3);
      --v7;
    }
    while (v7);
    do
    {
      -[NSFileWrapper addFileWrapper:](self, "addFileWrapper:", a3);
      --v6;
    }
    while (v6);
  }

}

- (void)setPreferredFilename:(NSString *)preferredFilename
{
  NSString *v6;
  NSHashTable *parents;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](preferredFilename, "length"))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** preferredFilename cannot be empty."), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v12);
  }
  v6 = self->_preferredFileName;
  if (v6 != preferredFilename)
  {

    self->_preferredFileName = (NSString *)-[NSString copy](preferredFilename, "copy");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    parents = self->_parents;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](parents, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(parents);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_observePreferredFileNameOfChild:", self);
        }
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](parents, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v9);
    }
  }
}

- (void)setFilename:(NSString *)filename
{
  NSString *v3;

  v3 = self->_fileName;
  if (v3 != filename)
  {

    self->_fileName = (NSString *)-[NSString copy](filename, "copy");
  }
}

- (NSString)filename
{
  return self->_fileName;
}

- (void)setFileAttributes:(NSDictionary *)fileAttributes
{
  NSDictionary *v6;
  void *v7;

  if (!-[NSDictionary objectForKey:](fileAttributes, "objectForKey:", CFSTR("NSFileType"))
    || !-[NSDictionary objectForKey:](fileAttributes, "objectForKey:", CFSTR("NSFilePosixPermissions")))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** file attributes cannot be nil and must contain at least NSFileType and NSFilePosixPermissions."), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v7);
  }
  os_unfair_lock_lock_with_options();
  v6 = self->_fileAttributes;
  if (v6 != fileAttributes)
  {

    self->_fileAttributes = (NSDictionary *)-[NSDictionary copy](fileAttributes, "copy");
    self->_attributesMustBeWrittenSoNoHardLinking = 1;
  }
  os_unfair_lock_unlock(&self->_propertyLock);
}

+ (BOOL)_forPath:(id)a3 getItemKind:(id *)a4 modificationDate:(id *)a5
{
  int v7;
  uint64_t v8;
  id *v9;
  stat v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&v11.st_mtimespec, 0, 96);
  v7 = lstat((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v11);
  if (!v7)
  {
    if (a4)
    {
      if ((v11.st_mode & 0x1000) != 0 || (v8 = (v11.st_mode >> 13) - 1, v8 > 5))
        v9 = (id *)&NSFileTypeUnknown;
      else
        v9 = (id *)off_1E0F52510[v8];
      *a4 = *v9;
    }
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v11.st_mtimespec.tv_sec);
  }
  return v7 == 0;
}

- (BOOL)_matchesItemKind:(id)a3 modificationDate:(id)a4
{
  id v7;
  BOOL result;
  double v9;
  double v10;
  double v11;

  v7 = -[NSDictionary fileModificationDate](-[NSFileWrapper fileAttributes](self, "fileAttributes"), "fileModificationDate");
  result = 0;
  if (a4 && v7)
  {
    objc_msgSend(a4, "timeIntervalSinceReferenceDate");
    v10 = v9;
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    return vabdd_f64(v10, v11) < 1.0
        && (objc_msgSend(a3, "isEqualToString:", CFSTR("NSFileTypeDirectory"))
         && -[NSFileWrapper isDirectory](self, "isDirectory")
         || objc_msgSend(a3, "isEqualToString:", CFSTR("NSFileTypeRegular"))
         && -[NSFileWrapper isRegularFile](self, "isRegularFile")
         || objc_msgSend(a3, "isEqualToString:", CFSTR("NSFileTypeSymbolicLink"))
         && -[NSFileWrapper isSymbolicLink](self, "isSymbolicLink"));
  }
  return result;
}

- (BOOL)matchesContentsOfURL:(NSURL *)url
{
  uint64_t v4;
  void *v5;
  id contents;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSAutoreleasePool *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_opt_class(), "_pathForURL:reading:error:", url, 1, 0);
  if (v4)
  {
    v5 = (void *)v4;
    v16 = 0;
    v17 = 0;
    LODWORD(v4) = objc_msgSend((id)objc_opt_class(), "_forPath:getItemKind:modificationDate:", v4, &v17, &v16);
    if ((_DWORD)v4)
    {
      LODWORD(v4) = -[NSFileWrapper _matchesItemKind:modificationDate:](self, "_matchesItemKind:modificationDate:", v17, v16);
      if ((_DWORD)v4)
      {
        if (-[NSFileWrapper isDirectory](self, "isDirectory")
          && (contents = self->_contents,
              v19 = 0u,
              v20 = 0u,
              v21 = 0u,
              v22 = 0u,
              (v7 = objc_msgSend(contents, "countByEnumeratingWithState:objects:count:", &v19, v18, 16)) != 0))
        {
          v8 = v7;
          v9 = *(_QWORD *)v20;
          while (2)
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v20 != v9)
                objc_enumerationMutation(contents);
              v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
              v12 = objc_alloc_init(NSAutoreleasePool);
              v13 = (void *)objc_msgSend(contents, "objectForKey:", v11);
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", objc_msgSend(v5, "stringByAppendingPathComponent:", v11));
              LODWORD(v13) = objc_msgSend(v13, "matchesContentsOfURL:", v14);

              -[NSAutoreleasePool drain](v12, "drain");
              if (!(_DWORD)v13)
              {
                LOBYTE(v4) = 0;
                return v4;
              }
            }
            v8 = objc_msgSend(contents, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
            LOBYTE(v4) = 1;
            if (v8)
              continue;
            break;
          }
        }
        else
        {
          LOBYTE(v4) = 1;
        }
      }
    }
  }
  return v4;
}

- (BOOL)readFromURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError
{
  id v9;
  id v10;
  int v11;
  NSFileWrapperReadingOptions v12;
  NSFileManager *v13;
  void *v14;
  id contents;
  uint64_t v16;
  NSURL *v17;
  NSError *v18;

  v9 = (id)objc_msgSend((id)objc_opt_class(), "_pathForURL:reading:error:", url, 1, outError);
  if (v9)
  {
    v10 = v9;
    if ((options & 0x202) == 0)
    {
      v11 = objc_msgSend((id)objc_opt_class(), "_canSafelyMapFilesAtPath:", v9);
      v12 = options | 2;
      if (v11)
        v12 = options;
      options = v12 | 0x200;
    }
    v13 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v9 = -[NSFileManager _attributesOfItemAtURL:filterResourceFork:error:](v13, "_attributesOfItemAtURL:filterResourceFork:error:", url, 0, outError);
    if (v9)
    {
      v14 = v9;
      contents = self->_contents;
      if (contents)
      {
        if (!-[NSFileWrapper _matchesItemKind:modificationDate:](self, "_matchesItemKind:modificationDate:", objc_msgSend(v9, "fileType"), objc_msgSend(v9, "fileModificationDate"))|| -[NSFileWrapper isDirectory](self, "isDirectory"))
        {
LABEL_13:
          LODWORD(v9) = -[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:](self, "_readContentsFromURL:path:itemKind:options:error:", url, v10, objc_msgSend(v14, "fileType"), options, outError);
          if (!(_DWORD)v9)
            return (char)v9;
LABEL_19:
          -[NSFileWrapper setFileAttributes:](self, "setFileAttributes:", v14);
          self->_attributesMustBeWrittenSoNoHardLinking = 0;

          self->_cachedDirectoryChildrenAsDictionary = 0;
          LOBYTE(v9) = 1;
          return (char)v9;
        }
        LOBYTE(contents) = self->_contents != 0;
      }
      if ((contents & 1) == 0 && (options & 1) != 0)
        goto LABEL_13;
      if ((options & 1) != 0)
        goto LABEL_19;
      if (url)
      {
        if (-[NSFileManager isReadableFileAtPath:](v13, "isReadableFileAtPath:", v10))
        {

          self->_contentsURL = url;
          self->_contentsMustBeReadWithoutMapping = (options & 2) != 0;
          goto LABEL_19;
        }
        if (outError)
        {
          v16 = 13;
          v17 = url;
          goto LABEL_25;
        }
      }
      else if (outError)
      {
        v16 = 2;
        v17 = 0;
LABEL_25:
        v18 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v16, (uint64_t)v17, 1, 0, 0);
        LOBYTE(v9) = 0;
        *outError = v18;
        return (char)v9;
      }
      LOBYTE(v9) = 0;
    }
  }
  return (char)v9;
}

- (BOOL)_forWritingToURL:(id)a3 returnContentsLazyReadingError:(id *)a4
{
  NSError *contentsLazyReadingError;
  NSError *v7;

  if (a4)
  {
    contentsLazyReadingError = self->_contentsLazyReadingError;
    if (contentsLazyReadingError)
      v7 = contentsLazyReadingError;
    else
      v7 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(9, (uint64_t)a3, 0, 0, 0);
    *a4 = v7;
  }

  self->_contentsLazyReadingError = 0;
  return 0;
}

- (BOOL)_writeContentsToURL:(id)a3 path:(id)a4 originalContentsURL:(id)a5 tryHardLinking:(BOOL)a6 didHardLinking:(BOOL *)a7 error:(id *)a8
{
  _BOOL4 v10;
  void *v14;
  void *v15;
  void *v16;
  NSFileManager *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSAutoreleasePool *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  BOOL result;
  _BOOL4 v37;
  int v38;
  NSURL *v39;
  NSError *v40;
  NSData *v41;
  void *v42;
  uint64_t v43;
  id *v44;
  NSError *v45;
  uint64_t v46;
  NSError *v47;
  id v48;
  id v49;
  uint64_t v50;
  NSFileManager *v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[128];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v10 = a6;
  v61 = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_opt_class();
  v15 = v14;
  if (a5)
  {
    v16 = (void *)objc_msgSend(v14, "_pathForURL:reading:error:", a5, 1, 0);
    if (!a7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v16 = 0;
  if (a7)
LABEL_3:
    *a7 = 0;
LABEL_4:
  v17 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (!-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    if (-[NSFileWrapper isRegularFile](self, "isRegularFile"))
    {
      v37 = 0;
      if (v16 && v10)
      {
        if (!self->_attributesMustBeWrittenSoNoHardLinking
          && (v54 = 0,
              v55 = 0,
              objc_msgSend(v15, "_forPath:getItemKind:modificationDate:", v16, &v55, &v54))
          && -[NSFileWrapper _matchesItemKind:modificationDate:](self, "_matchesItemKind:modificationDate:", v55, v54))
        {
          v38 = link((const char *)objc_msgSend(v16, "fileSystemRepresentation"), (const char *)objc_msgSend(a4, "fileSystemRepresentation"));
          if (a7 && !v38)
          {
            result = 1;
            *a7 = 1;
            return result;
          }
          v37 = v38 == 0;
          if (!v38)
            return 1;
        }
        else
        {
          v37 = 0;
        }
      }

      self->_contentsLazyReadingError = 0;
      v41 = -[NSFileWrapper regularFileContents](self, "regularFileContents");
      if (v41)
        return -[NSData writeToURL:options:error:](v41, "writeToURL:options:error:", a3, 0, a8);
      else
        -[NSFileWrapper _forWritingToURL:returnContentsLazyReadingError:](self, "_forWritingToURL:returnContentsLazyReadingError:", a3, a8);
      return v37;
    }
    if (-[NSFileWrapper isSymbolicLink](self, "isSymbolicLink"))
    {

      self->_contentsLazyReadingError = 0;
      v39 = -[NSFileWrapper symbolicLinkDestinationURL](self, "symbolicLinkDestinationURL");
      if (v39)
        return -[NSFileManager createSymbolicLinkAtPath:withDestinationPath:error:](v17, "createSymbolicLinkAtPath:withDestinationPath:error:", a4, -[NSURL relativePath](v39, "relativePath"), a8);
      -[NSFileWrapper _forWritingToURL:returnContentsLazyReadingError:](self, "_forWritingToURL:returnContentsLazyReadingError:", a3, a8);
    }
    else if (a8)
    {
      v40 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(5, (uint64_t)a3, 1, 0, 0);
      result = 0;
      *a8 = v40;
      return result;
    }
    return 0;
  }
  v51 = v17;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a4, 0, 0, a8))
  {
LABEL_51:
    -[NSFileManager removeItemAtPath:error:](v51, "removeItemAtPath:error:", a4, 0);
    return 0;
  }

  self->_contentsLazyReadingError = 0;
  v18 = -[NSFileWrapper fileWrappers](self, "fileWrappers");
  if (!v18)
  {
    -[NSFileWrapper _forWritingToURL:returnContentsLazyReadingError:](self, "_forWritingToURL:returnContentsLazyReadingError:", a3, a8);
    goto LABEL_51;
  }
  v19 = v18;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v52 = -[NSDictionary countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
  if (!v52)
    return 1;
  v20 = *(_QWORD *)v58;
  v50 = *(_QWORD *)v58;
  while (2)
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v58 != v20)
        objc_enumerationMutation(v19);
      v22 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v21);
      v23 = objc_alloc_init(NSAutoreleasePool);
      v24 = -[NSDictionary objectForKey:](v19, "objectForKey:", v22);
      v25 = objc_msgSend(v24, "isDirectory");
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", objc_msgSend(a4, "stringByAppendingPathComponent:", v22), v25);
      if (v16 && (v27 = objc_msgSend(v24, "filename")) != 0)
      {
        v28 = v27;
        v29 = a8;
        v30 = objc_alloc(MEMORY[0x1E0C99E98]);
        v31 = objc_msgSend(v16, "stringByAppendingPathComponent:", v28);
        v32 = v30;
        a8 = v29;
        v20 = v50;
        v33 = (void *)objc_msgSend(v32, "initFileURLWithPath:isDirectory:", v31, v25);
      }
      else
      {
        v33 = 0;
      }
      v34 = objc_msgSend(v24, "writeToURL:options:originalContentsURL:error:", v26, 256, v33, a8);

      if (a8 && (v34 & 1) == 0)
      {
        if (*a8)
        {
          v42 = (void *)objc_msgSend(*a8, "domain");
          v43 = objc_msgSend(*a8, "code");
          if (objc_msgSend(v42, "isEqualToString:", CFSTR("NSCocoaErrorDomain")) && v43 == 640)
          {
            v44 = a8;
            v45 = [NSError alloc];
            v46 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, CFSTR("NSFilePath"), *v44, CFSTR("NSUnderlyingError"), 0);
            v47 = v45;
            a8 = v44;
            *v44 = -[NSError initWithDomain:code:userInfo:](v47, "initWithDomain:code:userInfo:", v42, 640, v46);
          }
          else
          {
            v48 = *a8;
          }
        }
        -[NSAutoreleasePool drain](v23, "drain");
        v49 = *a8;
        goto LABEL_51;
      }
      -[NSAutoreleasePool drain](v23, "drain");
      if (!v34)
        goto LABEL_51;
      ++v21;
    }
    while (v52 != v21);
    v35 = -[NSDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
    result = 1;
    v52 = v35;
    if (v35)
      continue;
    return result;
  }
}

- (id)_attributesToWrite
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = -[NSFileWrapper fileAttributes](self, "fileAttributes");
  if ((objc_msgSend(-[NSDictionary fileType](v4, "fileType"), "isEqualToString:", CFSTR("NSFileTypeSymbolicLink")) & 1) == 0)
  {
    v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSFileCreationDate"));
    if (v5)
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("NSFileCreationDate"));
    v6 = -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSFileModificationDate"));
    if (v6)
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("NSFileModificationDate"));
    v7 = -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSFileExtensionHidden"));
    if (v7)
      objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("NSFileExtensionHidden"));
    v8 = -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSFilePosixPermissions"));
    if (v8)
      objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v8, "unsignedLongValue") & ~+[NSPageData _umask](NSPageData, "_umask")), CFSTR("NSFilePosixPermissions"));
    v9 = -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSFileExtendedAttributes"));
    if (v9)
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("NSFileExtendedAttributes"));
  }
  if (objc_msgSend(-[NSDictionary fileType](v4, "fileType"), "isEqualToString:", CFSTR("NSFileTypeRegular")))
  {
    v10 = -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSFileHFSCreatorCode"));
    if (objc_msgSend(v10, "unsignedIntValue"))
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("NSFileHFSCreatorCode"));
    v11 = -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSFileHFSTypeCode"));
    if (objc_msgSend(v11, "unsignedIntValue"))
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("NSFileHFSTypeCode"));
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__NSFileWrapper__attributesToWrite__block_invoke;
  v13[3] = &unk_1E0F51480;
  v13[4] = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", v13);
  return v3;
}

uint64_t __35__NSFileWrapper__attributesToWrite__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasPrefix:", CFSTR("NSFile"));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
  return result;
}

- (void)_updateDescendantFileNames
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    v3 = -[NSFileWrapper fileWrappers](self, "fileWrappers");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          v9 = -[NSDictionary objectForKey:](v3, "objectForKey:", v8);
          objc_msgSend(v9, "setFilename:", v8);
          objc_msgSend(v9, "_updateDescendantFileNames");
        }
        v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v5);
    }
  }
}

- (BOOL)writeToURL:(NSURL *)url options:(NSFileWrapperWritingOptions)options originalContentsURL:(NSURL *)originalContentsURL error:(NSError *)outError
{
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend((id)objc_opt_class(), "_pathForURL:reading:error:", url, 0, outError);
  if (!v11)
    return (char)v11;
  v12 = v11;
  v13 = (void *)objc_opt_class();
  if ((options & 1) != 0)
  {
    v15 = -[NSURL isEqual:](originalContentsURL, "isEqual:", url);
    v11 = (void *)objc_msgSend(v13, "_temporaryDirectoryURLForWritingToURL:error:", url, outError);
    if (!v11)
      return (char)v11;
    v16 = v11;
    v17 = (void *)objc_msgSend(v11, "URLByAppendingPathComponent:", -[NSURL lastPathComponent](url, "lastPathComponent"));
    v22 = 0;
    if (!-[NSFileWrapper _writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:](self, "_writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:", v17, objc_msgSend(v17, "path"), originalContentsURL, (options >> 8) & 1, &v22, outError))
    {
LABEL_22:
      objc_msgSend(v13, "_removeTemporaryDirectoryAtURL:", v16);
      LOBYTE(v11) = 0;
      return (char)v11;
    }
    if (v22)
      v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    else
      v18 = -[NSFileWrapper _attributesToWrite](self, "_attributesToWrite");
    if (v15)
    {
      if ((objc_msgSend(v13, "_finishWritingToURL:byTakingContentsFromItemAtURL:addingAttributes:usingTemporaryDirectoryAtURL:backupFileName:error:", url, v17, v18, v16, 0, outError) & 1) == 0)
      {
LABEL_19:
        if (!-[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager", 0), "removeItemAtURL:error:", v17, &v21))
        {
          v19 = _NSOSLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v24 = v17;
            v25 = 2112;
            v26 = v21;
            _os_log_error_impl(&dword_1817D9000, v19, OS_LOG_TYPE_ERROR, "NSFileWrapper could not delete the temporary item at %@. Here's the error:\n%@", buf, 0x16u);
          }
        }
        goto LABEL_22;
      }
    }
    else if ((objc_msgSend(v13, "_finishWritingToURL:byMovingItemAtURL:addingAttributes:error:", url, v17, v18, outError) & 1) == 0)
    {
      goto LABEL_19;
    }
    objc_msgSend(v13, "_removeTemporaryDirectoryAtURL:", v16);
    if (!originalContentsURL)
      goto LABEL_13;
    goto LABEL_12;
  }
  buf[0] = 0;
  LODWORD(v11) = -[NSFileWrapper _writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:](self, "_writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:", url, v12, originalContentsURL, (options >> 8) & 1, buf, outError);
  if (!(_DWORD)v11)
    return (char)v11;
  if (buf[0])
    v14 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  else
    v14 = -[NSFileWrapper _attributesToWrite](self, "_attributesToWrite");
  objc_msgSend(v13, "_writeAttributes:toURL:", v14, url);
  if (!originalContentsURL)
    goto LABEL_13;
LABEL_12:
  self->_attributesMustBeWrittenSoNoHardLinking = 0;
LABEL_13:
  if ((options & 2) != 0)
    -[NSFileWrapper _updateDescendantFileNames](self, "_updateDescendantFileNames");
  LOBYTE(v11) = 1;
  return (char)v11;
}

- (id)_initWithImpl:(id)a3 preferredFileName:(id)a4 uniqueFileName:(id)a5 docInfo:(id)a6 iconData:(id)a7
{
  NSFileWrapper *v11;
  id v12;
  NSNumber *v13;
  __int16 v14;
  BOOL v15;
  const NSFileAttributeType *v16;
  char isKindOfClass;
  id v18;
  const __CFString *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSString *v38;
  NSObject *v39;
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)NSFileWrapper;
  v11 = -[NSFileWrapper init](&v41, sel_init, a3, a4, a5, a6, a7);
  if (!v11)
    return v11;
  if (a6)
  {
    v12 = objc_alloc(MEMORY[0x1E0C99D80]);
    v13 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *((unsigned __int16 *)a6 + 8));
    v14 = *((_WORD *)a6 + 9);
    if ((v14 & 4) != 0)
    {
      v16 = &NSFileTypeSymbolicLink;
    }
    else
    {
      v15 = (v14 & 1) == 0;
      v16 = &NSFileTypeDirectory;
      if (v15)
        v16 = &NSFileTypeRegular;
    }
    v11->_fileAttributes = (NSDictionary *)objc_msgSend(v12, "initWithObjectsAndKeys:", v13, CFSTR("NSFilePosixPermissions"), *v16, CFSTR("NSFileType"), objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)*((uint64_t *)a6 + 1)), CFSTR("NSFileModificationDate"), 0);
    if (a4)
      goto LABEL_11;
LABEL_14:
    v22 = objc_msgSend(a5, "rangeOfString:", CFSTR("__#$!@%!#__"));
    if (v23)
      v21 = (id)objc_msgSend(a5, "substringFromIndex:", v22 + v23);
    else
      v21 = a5;
    goto LABEL_17;
  }
  isKindOfClass = objc_opt_isKindOfClass();
  v18 = objc_alloc(MEMORY[0x1E0C99D80]);
  if ((isKindOfClass & 1) != 0)
  {
    v19 = CFSTR("NSFileTypeDirectory");
    v20 = 511;
  }
  else
  {
    v19 = CFSTR("NSFileTypeRegular");
    v20 = 438;
  }
  v11->_fileAttributes = (NSDictionary *)objc_msgSend(v18, "initWithObjectsAndKeys:", v19, CFSTR("NSFileType"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20), CFSTR("NSFilePosixPermissions"), 0);
  if (!a4)
    goto LABEL_14;
LABEL_11:
  v21 = a4;
LABEL_17:
  v11->_preferredFileName = (NSString *)objc_msgSend(v21, "copy");
  v11->_fileName = (NSString *)objc_msgSend(a5, "copy");
  v24 = -[NSDictionary fileType](v11->_fileAttributes, "fileType");
  if (!objc_msgSend(v24, "isEqualToString:", CFSTR("NSFileTypeDirectory")))
  {
    if (objc_msgSend(v24, "isEqualToString:", CFSTR("NSFileTypeRegular")))
    {
      v11->_contents = (id)objc_msgSend(a3, "data");
    }
    else if (objc_msgSend(v24, "isEqualToString:", CFSTR("NSFileTypeSymbolicLink")))
    {
      v38 = -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", a3, 4);
      v11->_contents = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v38);

    }
    return v11;
  }
  v25 = (void *)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "mutableCopy");
  if (!objc_msgSend(v25, "count"))
  {
LABEL_31:

    if (!v11->_contents)
      -[NSFileWrapper _initDirectoryContents](v11, "_initDirectoryContents");
    return v11;
  }
  while (1)
  {
    v26 = (void *)objc_msgSend(v25, "objectAtIndex:", 0);
    if ((objc_msgSend(v26, "isEqualToString:", 0x1E0F5A930) & 1) != 0)
      goto LABEL_30;
    if ((_validateFilename(v26) & 1) == 0)
      break;
    if (objc_msgSend((id)objc_msgSend(v26, "pathExtension"), "isEqualToString:", CFSTR("tiff"))
      && (v27 = objc_msgSend(v26, "stringByDeletingPathExtension"),
          v28 = objc_msgSend(v25, "indexOfObject:", v27),
          v28 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v35 = v28;
      v36 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithImpl:preferredFileName:uniqueFileName:docInfo:iconData:", objc_msgSend(a3, "objectForKey:", v27), 0, v27, objc_msgSend(a3, "_getDocInfoForKey:", v27), objc_msgSend(a3, "objectForKey:", v26));
      if (!v36)
        goto LABEL_39;
      v37 = (void *)v36;
      -[NSFileWrapper _addChild:forUniqueFileName:](v11, "_addChild:forUniqueFileName:", v36, v27);

      objc_msgSend(v25, "removeObjectAtIndex:", v35);
    }
    else
    {
      v29 = objc_msgSend(v26, "stringByAppendingPathExtension:", CFSTR("tiff"));
      v30 = objc_msgSend(v25, "indexOfObject:", v29);
      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v31 = 0;
      }
      else
      {
        v32 = v30;
        v31 = objc_msgSend(a3, "objectForKey:", v29);
        objc_msgSend(v25, "removeObjectAtIndex:", v32);
      }
      v33 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithImpl:preferredFileName:uniqueFileName:docInfo:iconData:", objc_msgSend(a3, "objectForKey:", v26), 0, v26, objc_msgSend(a3, "_getDocInfoForKey:", v26), v31);
      if (!v33)
        goto LABEL_39;
      v34 = (void *)v33;
      -[NSFileWrapper _addChild:forUniqueFileName:](v11, "_addChild:forUniqueFileName:", v33, v26);

    }
LABEL_30:
    objc_msgSend(v25, "removeObjectAtIndex:", 0);
    if (!objc_msgSend(v25, "count"))
      goto LABEL_31;
  }
  v39 = _NSOSLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    v43 = v26;
    _os_log_error_impl(&dword_1817D9000, v39, OS_LOG_TYPE_ERROR, "-[NSFileWrapper initWithSerializedRepresentation:] encountered an invalid preferredFileName: %{private}@", buf, 0xCu);
  }
LABEL_39:

  return 0;
}

- (id)_newImpl
{
  NSRTFD *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  NSDocInfo *v12;
  NSURL *v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    v3 = objc_alloc_init(NSRTFD);
    v4 = -[NSFileWrapper fileWrappers](self, "fileWrappers");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = -[NSDictionary objectForKey:](v4, "objectForKey:", v9);
          v11 = (void *)objc_msgSend(v10, "_newImpl");
          v12 = _NSDocInfoFromFileAttributes((NSDocInfo *)objc_msgSend(v10, "fileAttributes"), 1);
          -[NSRTFD setObject:forKey:](v3, "setObject:forKey:", v11, v9);
          if (v12)
            objc_msgSend(-[NSRTFD getDirInfo:](v3, "getDirInfo:", 1), "setObject:forKey:", v12, v9);

        }
        v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      }
      while (v6);
    }
  }
  else if (-[NSFileWrapper isRegularFile](self, "isRegularFile"))
  {
    v3 = -[NSFileWrapper regularFileContents](self, "regularFileContents");
    if (v3)
      return -[NSPageData initWithDataNoCopy:]([NSPageData alloc], "initWithDataNoCopy:", v3);
  }
  else
  {
    if (-[NSFileWrapper isSymbolicLink](self, "isSymbolicLink"))
    {
      v14 = -[NSFileWrapper symbolicLinkDestinationURL](self, "symbolicLinkDestinationURL");
      if (v14)
        return -[NSPageData initWithData:]([NSPageData alloc], "initWithData:", objc_msgSend(-[NSURL relativePath](v14, "relativePath"), "dataUsingEncoding:allowLossyConversion:", 4, 1));
    }
    return 0;
  }
  return v3;
}

- (NSData)serializedRepresentation
{
  NSRTFD *v3;
  BOOL v4;
  NSRTFD *v5;
  uint64_t v6;
  NSDocInfo *v7;
  NSPageData *v8;
  NSPageData *v9;
  NSData *v10;

  v3 = -[NSFileWrapper _newImpl](self, "_newImpl");
  v4 = -[NSFileWrapper isDirectory](self, "isDirectory");
  v5 = v3;
  if (!v4)
  {
    v6 = -[NSFileWrapper zone](self, "zone");
    v7 = _NSDocInfoFromFileAttributes((NSDocInfo *)self->_fileAttributes, 0);
    v5 = -[NSRTFD init](+[NSRTFD allocWithZone:](NSRTFD, "allocWithZone:", v6), "init");
    -[NSRTFD setObject:forKey:](v5, "setObject:forKey:", v3, 0x1E0F67F30);
    if (v7)
    {
      *(&v7->mode + 1) |= 2u;
      objc_msgSend(-[NSRTFD getDirInfo:](v5, "getDirInfo:", 1), "setObject:forKey:", v7, 0x1E0F67F30);
    }
  }
  if (self->_preferredFileName)
  {
    v8 = -[NSPageData initWithData:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", -[NSFileWrapper zone](self, "zone")), "initWithData:", -[NSString dataUsingEncoding:allowLossyConversion:](self->_preferredFileName, "dataUsingEncoding:allowLossyConversion:", 2, 1));
    -[NSRTFD setObject:forKey:](v5, "setObject:forKey:", v8, CFSTR("__@PreferredName@__"));

    v9 = -[NSPageData initWithData:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", -[NSFileWrapper zone](self, "zone")), "initWithData:", -[NSString dataUsingEncoding:allowLossyConversion:](self->_preferredFileName, "dataUsingEncoding:allowLossyConversion:", 4, 1));
    -[NSRTFD setObject:forKey:](v5, "setObject:forKey:", v9, CFSTR("__@UTF8PreferredName@__"));

  }
  v10 = -[NSRTFD dataRepresentation](v5, "dataRepresentation");
  if (self->_preferredFileName)
  {
    -[NSRTFD removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("__@PreferredName@__"));
    -[NSRTFD removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("__@UTF8PreferredName@__"));
  }
  if (!v4)

  return v10;
}

- (void)_resetFileModificationDate
{
  NSDictionary *v3;
  id v4;

  v3 = -[NSFileWrapper fileAttributes](self, "fileAttributes");
  if (-[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("NSFileModificationDate")))
  {
    v4 = (id)-[NSDictionary mutableCopy](v3, "mutableCopy");
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("NSFileModificationDate"));
    -[NSFileWrapper setFileAttributes:](self, "setFileAttributes:", v4);

  }
}

- (NSString)addFileWrapper:(NSFileWrapper *)child
{
  NSString *v6;
  NSString *v7;
  NSURL *contentsURL;
  NSObject *v10;
  NSString *v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = -[NSFileWrapper preferredFilename](child, "preferredFilename");
  if (!-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** this method is only for directory type NSFileWrappers."), _NSFullMethodName((objc_class *)self, a2));
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (_QWORD *)MEMORY[0x1E0C99768];
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", *v15, v13, 0));
  }
  if (!v6 || -[NSString isEqualToString:](v6, "isEqualToString:", &stru_1E0F56070))
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** a document must have a preferredFilename before it can be added as the subdocument of another document."), _NSFullMethodName((objc_class *)self, a2));
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_16;
  }
  if (!self->_contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      v16 = 0;
      if (!-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:](self, "_readContentsFromURL:path:itemKind:options:error:", contentsURL, 0, CFSTR("NSFileTypeDirectory"), 2 * self->_contentsMustBeReadWithoutMapping, &v16)&& (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSFileWrapperLogsLess")) & 1) == 0&& (addFileWrapper__alreadyWarned & 1) == 0)
      {
        addFileWrapper__alreadyWarned = 1;
        v10 = _NSOSLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = _NSFullMethodName((objc_class *)self, a2);
          v12 = objc_msgSend(v16, "localizedDescription");
          *(_DWORD *)buf = 138412546;
          v18 = v11;
          v19 = 2112;
          v20 = v12;
          _os_log_error_impl(&dword_1817D9000, v10, OS_LOG_TYPE_ERROR, "%@ tried to read the file wrapper's contents lazily but an error occurred: %@", buf, 0x16u);
        }
      }
    }
  }
  v7 = -[NSFileWrapper keyForFileWrapper:](self, "keyForFileWrapper:", child);
  if (!v7)
  {
    v7 = -[NSFileWrapper _addChild:forUniqueFileName:](self, "_addChild:forUniqueFileName:", child, 0);
    -[NSFileWrapper _resetFileModificationDate](self, "_resetFileModificationDate");
  }

  self->_cachedDirectoryChildrenAsDictionary = 0;
  return v7;
}

- (NSString)addRegularFileWithContents:(NSData *)data preferredFilename:(NSString *)fileName
{
  NSString *result;
  NSString *v9;
  NSString *v10;
  void *v11;

  if (!-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** this method is only for directory type NSFileWrappers"), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v11);
  }
  result = (NSString *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initRegularFileWithContents:", data);
  if (result)
  {
    v9 = result;
    -[NSString setPreferredFilename:](result, "setPreferredFilename:", fileName);
    v10 = -[NSFileWrapper addFileWrapper:](self, "addFileWrapper:", v9);

    return v10;
  }
  return result;
}

- (id)_uniqueFileNameOfChild:(id)a3
{
  id contents;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  contents = self->_contents;
  v6 = objc_msgSend(contents, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v14;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v8)
      objc_enumerationMutation(contents);
    v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
    if ((id)objc_msgSend(self->_contents, "objectForKey:", v10) == a3)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(contents, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)_removeChild:(id)a3 forUniqueFileName:(id)a4
{
  objc_msgSend(a3, "_removeParent:", self);
  objc_msgSend(self->_contents, "removeObjectForKey:", a4);
}

- (void)removeFileWrapper:(NSFileWrapper *)child
{
  id v6;
  void *v7;

  if (!-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** this method is only for directory type NSFileWrappers"), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v7);
  }
  v6 = -[NSFileWrapper _uniqueFileNameOfChild:](self, "_uniqueFileNameOfChild:", child);
  if (v6)
  {
    -[NSFileWrapper _removeChild:forUniqueFileName:](self, "_removeChild:forUniqueFileName:", child, v6);
    -[NSFileWrapper _resetFileModificationDate](self, "_resetFileModificationDate");
  }

  self->_cachedDirectoryChildrenAsDictionary = 0;
}

- (NSString)keyForFileWrapper:(NSFileWrapper *)child
{
  void *v7;

  if (!-[NSFileWrapper isDirectory](self, "isDirectory"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** this method is only for directory type NSFileWrappers"), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v7);
  }
  return (NSString *)-[NSFileWrapper _uniqueFileNameOfChild:](self, "_uniqueFileNameOfChild:", child);
}

- (NSURL)symbolicLinkDestinationURL
{
  id contents;
  NSURL *contentsURL;
  NSObject *v6;
  NSString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  NSString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[NSFileWrapper isSymbolicLink](self, "isSymbolicLink"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ *** this method is only for symbolic link type NSFileWrappers"), _NSFullMethodName((objc_class *)self, a2)), 0);
    objc_exception_throw(v10);
  }
  contents = self->_contents;
  if (!contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      v11 = 0;
      if (!-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:](self, "_readContentsFromURL:path:itemKind:options:error:", contentsURL, 0, CFSTR("NSFileTypeSymbolicLink"), 2 * self->_contentsMustBeReadWithoutMapping, &v11))
      {

        self->_contentsLazyReadingError = (NSError *)v11;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSFileWrapperLogsLess")) & 1) == 0&& (symbolicLinkDestinationURL_alreadyWarned & 1) == 0)
        {
          symbolicLinkDestinationURL_alreadyWarned = 1;
          v6 = _NSOSLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v8 = _NSFullMethodName((objc_class *)self, a2);
            v9 = objc_msgSend(v11, "localizedDescription");
            *(_DWORD *)buf = 138412546;
            v13 = v8;
            v14 = 2112;
            v15 = v9;
            _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "%@ tried to read the file wrapper's contents lazily but an error occurred: %@", buf, 0x16u);
          }
        }
      }
      contents = self->_contents;
    }
    else
    {
      contents = 0;
    }
  }
  return (NSURL *)contents;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *v4;

  v4 = -[NSFileWrapper serializedRepresentation](self, "serializedRepresentation");
  if (objc_msgSend(a3, "allowsKeyedCoding"))
    objc_msgSend(a3, "encodeObject:forKey:", v4, CFSTR("NSFileWrapperData"));
  else
    objc_msgSend(a3, "encodeObject:", v4);
}

- (NSFileWrapper)initWithCoder:(NSCoder *)inCoder
{
  id v5;

  if (-[NSCoder allowsKeyedCoding](inCoder, "allowsKeyedCoding"))
    v5 = -[NSCoder decodeObjectOfClass:forKey:](inCoder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSFileWrapperData"));
  else
    v5 = -[NSCoder decodeObject](inCoder, "decodeObject");
  if (v5)
    return -[NSFileWrapper initWithSerializedRepresentation:](self, "initWithSerializedRepresentation:", v5);

  return 0;
}

+ (id)_temporaryDirectoryURLForWritingToURL:(id)a3 error:(id *)a4
{
  return -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, a3, 1, a4);
}

+ (void)_writeAttributes:(id)a3 toURL:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__NSFileWrapper_NSInternalForAppKit___writeAttributes_toURL___block_invoke;
  v10[3] = &unk_1E0F524F0;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("NSFileExtensionHidden"));
  if (objc_msgSend(v6, "count") != (v8 != 0) || objc_msgSend(v8, "BOOLValue"))
  {
    v9 = objc_msgSend(a4, "path");
    if (v9)
      -[NSFileManager setAttributes:ofItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "setAttributes:ofItemAtPath:error:", v6, v9, 0);
  }
  objc_msgSend(a4, "setResourceValues:error:", v7, 0);
}

uint64_t __61__NSFileWrapper_NSInternalForAppKit___writeAttributes_toURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;

  result = _NSIsNSString();
  if ((_DWORD)result)
  {
    v7 = objc_msgSend(a2, "hasPrefix:", CFSTR("NSFile"));
    v8 = 40;
    if (v7)
      v8 = 32;
    return objc_msgSend(*(id *)(a1 + v8), "setObject:forKey:", a3, a2);
  }
  return result;
}

+ (BOOL)_finishWritingToURL:(id)a3 byMovingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6
{
  NSFileManager *v11;
  uint64_t v12;
  _BOOL4 v13;

  v11 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v12 = objc_msgSend(a3, "path");
  if (!-[NSFileManager fileExistsAtPath:](v11, "fileExistsAtPath:", v12)
    || (v13 = -[NSFileManager removeItemAtPath:error:](v11, "removeItemAtPath:error:", v12, a6)))
  {
    objc_msgSend(a1, "_writeAttributes:toURL:", a5, a4);
    LOBYTE(v13) = -[NSFileManager moveItemAtPath:toPath:error:](v11, "moveItemAtPath:toPath:error:", objc_msgSend(a4, "path"), v12, a6);
  }
  return v13;
}

+ (BOOL)_finishWritingToURL:(id)a3 byTakingContentsFromItemAtURL:(id)a4 addingAttributes:(id)a5 usingTemporaryDirectoryAtURL:(id)a6 backupFileName:(id)a7 error:(id *)a8
{
  _BOOL4 v11;

  v11 = -[NSFileManager replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager", a3, a4, a5, a6), "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", a3, a4, a7, 2 * (a7 != 0), 0, a8);
  if (v11)
    objc_msgSend(a1, "_writeAttributes:toURL:", a5, a3);
  return v11;
}

+ (void)_removeTemporaryDirectoryAtURL:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "path");
  if (v4)
  {
    v5 = v4;
    if (!rmdir((const char *)objc_msgSend(v4, "fileSystemRepresentation")))
      return;
    v6 = *__error();
    v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 1024;
      v11 = v6;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "AppKit called rmdir(\"%@\"), it didn't return 0, and errno was set to %i.", (uint8_t *)&v8, 0x12u);
    }
  }
  -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", a3, 0);
}

- (id)_fullDescription:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableString *v5;

  v3 = a3;
  v5 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 50);
  _NSDescribeFileContentsInstance(v5, (id *)&self->super.isa, 0, 0, v3);
  return v5;
}

@end
