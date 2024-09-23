@implementation NSFileManager

- (NSURL)URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appropriateForURL:(NSURL *)url create:(BOOL)shouldCreate error:(NSError *)error
{
  return (NSURL *)-[_NSFileManagerBridge urlFor:in:appropriateFor:create:error:](self->swiftBridge, "urlFor:in:appropriateFor:create:error:", directory, domain, url, shouldCreate, error);
}

- (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error
{
  return -[_NSFileManagerBridge createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self->swiftBridge, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", path, createIntermediates, attributes, error);
}

- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  const char *v11;
  char *v12;
  size_t v13;
  DIR *v14;
  DIR *v15;
  void *v16;
  void *v17;
  int v18;
  size_t v19;
  char *d_name;
  int d_namlen;
  const __CFString *v22;
  CFStringRef v23;
  char *v24;
  size_t v25;
  int64_t v26;
  char *v27;
  void *v28;
  const __CFString *v29;
  CFIndex Length;
  CFComparisonResult v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  int *v35;
  NSString *v36;
  int v37;
  void *v39;
  dirent *v40;
  char __s[1026];
  dirent v42;
  uint64_t v43;
  CFRange v44;

  v8 = a6;
  v43 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    strcpy(__s, ".");
    if (!-[NSFileManager getFileSystemRepresentation:maxLength:withPath:](self, "getFileSystemRepresentation:maxLength:withPath:", &__s[1], 1023, a4))return 0;
    v11 = (const char *)objc_msgSend(a3, "fileSystemRepresentation");
    v12 = __s;
    v13 = strlen(__s);
  }
  else
  {
    v11 = (const char *)objc_msgSend(a3, "fileSystemRepresentation");
    v12 = 0;
    v13 = 0;
  }
  memset(&v42, 0, 512);
  v40 = 0;
  if (!v11)
  {
    if (a7)
    {
      v35 = __error();
      v36 = 0;
      v37 = *v35;
LABEL_37:
      v16 = 0;
      *a7 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v37, (uint64_t)v36, 1, (uint64_t)CFSTR("Folder"), 0);
      return v16;
    }
    return 0;
  }
  v14 = opendir(v11);
  if (!v14)
  {
    if (a7)
    {
      v37 = *__error();
      v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11);
      goto LABEL_37;
    }
    return 0;
  }
  v15 = v14;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_msgSend(objc_allocWithZone((Class)NSCheapMutableString), "init");
  if ((_DWORD)v13)
    v18 = v8;
  else
    v18 = 1;
  if (v18)
    v19 = 0;
  else
    v19 = v13;
  if (!readdir_r(v15, &v42, &v40) && v40)
  {
    d_name = v42.d_name;
    v39 = v16;
    do
    {
      if (v42.d_ino)
      {
        d_namlen = v42.d_namlen;
        if (v42.d_name[0] != 46 || v42.d_namlen != 1 && (v42.d_namlen != 2 || v42.d_name[1] != 46))
        {
          if ((int)v13 < 1)
            goto LABEL_28;
          if (v42.d_namlen > v13)
          {
            if ((a5 & 1) != 0)
            {
              v22 = CFStringCreateWithFileSystemRepresentation(0, d_name);
              v23 = CFStringCreateWithFileSystemRepresentation(0, v12);
              v24 = d_name;
              v25 = v19;
              v26 = a5;
              v27 = v12;
              v28 = v17;
              v29 = v23;
              Length = CFStringGetLength(v22);
              v44.length = CFStringGetLength(v29);
              v44.location = Length - v44.length;
              v31 = CFStringCompareWithOptions(v22, v29, v44, 0x21uLL);
              v32 = v29;
              v17 = v28;
              v12 = v27;
              a5 = v26;
              v19 = v25;
              d_name = v24;
              v16 = v39;
              CFRelease(v32);
              CFRelease(v22);
              if (v31)
              {
                d_namlen = v42.d_namlen;
LABEL_28:
                v33 = objc_msgSend(objc_allocWithZone((Class)NSString), "initWithBytes:length:encoding:", d_name, d_namlen - (int)v19, 4);
                if (v33)
                {
                  v34 = (void *)v33;
                  objc_msgSend(v16, "addObject:", v33);

                }
              }
            }
            else if (!strcmp(&v42.d_name[v42.d_namlen - v13], v12))
            {
              goto LABEL_28;
            }
          }
        }
      }
    }
    while (!readdir_r(v15, &v42, &v40) && v40);
  }

  closedir(v15);
  return v16;
}

- (BOOL)setAttributes:(NSDictionary *)attributes ofItemAtPath:(NSString *)path error:(NSError *)error
{
  return -[_NSFileManagerBridge setAttributes:ofItemAtPath:error:](self->swiftBridge, "setAttributes:ofItemAtPath:error:", attributes, path, error);
}

- (const)fileSystemRepresentationWithPath:(NSString *)path
{
  return (const char *)_NSFileSystemRepresentationWithPath((__CFString *)path);
}

- (NSString)stringWithFileSystemRepresentation:(const char *)str length:(NSUInteger)len
{
  return (NSString *)_NSFileSystemRepresentationString((uint64_t)str, len);
}

- (NSArray)subpathsAtPath:(NSString *)path
{
  return (NSArray *)-[NSDirectoryEnumerator allObjects](-[NSFileManager enumeratorAtPath:](self, "enumeratorAtPath:", path), "allObjects");
}

- (NSDirectoryEnumerator)enumeratorAtPath:(NSString *)path
{
  NSDirectoryEnumerator *result;

  result = +[NSFileAttributes attributesAtPath:traverseLink:](NSFileAttributes, "attributesAtPath:traverseLink:", path, 1);
  if (result)
    return (NSDirectoryEnumerator *)+[NSAllDescendantPathsEnumerator newWithPath:prepend:attributes:cross:depth:](NSAllDescendantPathsEnumerator, "newWithPath:prepend:attributes:cross:depth:", path, 0, result, 1, 1);
  return result;
}

- (NSArray)contentsOfDirectoryAtPath:(NSString *)path error:(NSError *)error
{
  if (path)
    return (NSArray *)-[_NSFileManagerBridge contentsOfDirectoryAtPath:error:](self->swiftBridge, "contentsOfDirectoryAtPath:error:", path, error);
  if (error)
    *error = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(14, 0, 1, (uint64_t)CFSTR("Folder"), 0);
  return 0;
}

- (NSString)destinationOfSymbolicLinkAtPath:(NSString *)path error:(NSError *)error
{
  return (NSString *)-[_NSFileManagerBridge destinationOfSymbolicLinkAtPath:error:](self->swiftBridge, "destinationOfSymbolicLinkAtPath:error:", path, error);
}

- (BOOL)fileExistsAtPath:(NSString *)path isDirectory:(BOOL *)isDirectory
{
  return path
      && -[_NSFileManagerBridge fileExistsAtPath:isDirectory:](self->swiftBridge, "fileExistsAtPath:isDirectory:", path, isDirectory);
}

+ (NSFileManager)defaultManager
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__NSFileManager_defaultManager__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD09798 != -1)
    dispatch_once(&qword_1ECD09798, v3);
  return (NSFileManager *)qword_1ECD097A0;
}

- (BOOL)getFileSystemRepresentation:(char *)a3 maxLength:(unint64_t)a4 withPath:(id)a5
{
  return _NSGetFileSystemRepresentation(a3, a4, a5);
}

- (BOOL)removeItemAtPath:(NSString *)path error:(NSError *)error
{
  return !path
      || -[_NSFileManagerBridge removeItemAtPath:error:](self->swiftBridge, "removeItemAtPath:error:", path, error);
}

- (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error
{
  NSString *v11;

  if (!srcPath && _CFExecutableLinkedOnOrAfter())
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: source path is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_7:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
  }
  if (!dstPath)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: destination path is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_7;
  }
  return -[_NSFileManagerBridge moveItemAtPath:toPath:options:error:](self->swiftBridge, "moveItemAtPath:toPath:options:error:", srcPath, dstPath, 0, error);
}

- (NSString)displayNameAtPath:(NSString *)path
{
  if (path)
    return (NSString *)-[_NSFileManagerBridge displayNameAtPath:](self->swiftBridge, "displayNameAtPath:");
  else
    return (NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(0, "lastPathComponent"), "componentsSeparatedByString:", CFSTR(":")), "componentsJoinedByString:", CFSTR("/"));
}

- (BOOL)_processCanAccessUbiquityIdentityToken
{
  if (_processCanAccessUbiquityIdentityToken_once != -1)
    dispatch_once(&_processCanAccessUbiquityIdentityToken_once, &__block_literal_global_293);
  return _processCanAccessUbiquityIdentityToken_result;
}

- (NSDictionary)attributesOfFileSystemForPath:(NSString *)path error:(NSError *)error
{
  return (NSDictionary *)-[_NSFileManagerBridge attributesOfFileSystemForPath:error:](self->swiftBridge, "attributesOfFileSystemForPath:error:", path, error);
}

- (id)_safeDelegate
{
  __objc2_class *v3;
  objc_method *InstanceMethod;

  if (dyld_program_sdk_at_least()
    && ((v3 = (__objc2_class *)objc_opt_class(), v3 == NSFileManager)
     || (InstanceMethod = class_getInstanceMethod((Class)v3, sel_delegate),
         InstanceMethod == class_getInstanceMethod((Class)NSFileManager, sel_delegate))))
  {
    return -[NSValue weakObjectValue](self->_weakDelegateValue, "weakObjectValue");
  }
  else
  {
    return -[NSFileManager delegate](self, "delegate");
  }
}

- (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary *)attr
{
  _BOOL4 v9;

  if (path)
  {
    if (_NSIsNSString())
    {
      v9 = -[NSData writeToFile:atomically:](data, "writeToFile:atomically:", path, 1);
      if (attr && v9)
      {
        -[NSFileManager setAttributes:ofItemAtPath:error:](self, "setAttributes:ofItemAtPath:error:", attr, path, 0);
        LOBYTE(v9) = 1;
      }
    }
    else
    {
      LOBYTE(v9) = -[_NSFileManagerBridge createFileAtPath:contents:attributes:](self->swiftBridge, "createFileAtPath:contents:attributes:", path, data, attr);
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (NSData)contentsAtPath:(NSString *)path
{
  return (NSData *)(id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", path);
}

- (BOOL)_web_createDirectoryAtPathWithIntermediateDirectories:(id)a3 attributes:(id)a4
{
  return -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3, 1, a4, 0);
}

- (NSDictionary)attributesOfItemAtPath:(NSString *)path error:(NSError *)error
{
  return (NSDictionary *)-[_NSFileManagerBridge attributesOfItemAtPath:error:](self->swiftBridge, "attributesOfItemAtPath:error:", path, error);
}

- (BOOL)isReadableFileAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge isReadableFileAtPath:](self->swiftBridge, "isReadableFileAtPath:");
}

- (id)_attributesOfItemAtURL:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5
{
  return +[NSFileAttributes _attributesAtURL:partialReturn:filterResourceFork:error:](NSFileAttributes, "_attributesAtURL:partialReturn:filterResourceFork:error:", a3, 1, a4, a5);
}

- (NSArray)contentsOfDirectoryAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask error:(NSError *)error
{
  NSArray *v11;
  NSDirectoryEnumerationOptions v12;
  uint64_t v13;
  const void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSArray *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  int v28;
  BOOL v29;
  NSError *v31;
  void *v32;
  NSError **v33;
  NSError *v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  stat v40;
  id v41[132];

  v41[129] = *(id *)MEMORY[0x1E0C80C00];
  if (!url)
  {
    v32 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v32);
  }
  v11 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  if (!keys && !mask)
    keys = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C9B520]);
  v12 = mask & 4;
  v13 = MEMORY[0x186DA7394](*MEMORY[0x1E0C9AE30], url, mask & 0x80000000 | (v12 >> 1) & 0xFFFFFFFFFFFFFFBFLL | (((mask >> 4) & 1) << 6), keys);
  if (v13)
  {
    v14 = (const void *)v13;
    v41[0] = 0;
    *(_QWORD *)&v40.st_dev = 0;
    do
    {
      while (1)
      {
        v15 = MEMORY[0x186DA73AC](v14, &v40, v41);
        if (v15 != 1)
          break;
        -[NSArray addObject:](v11, "addObject:", *(_QWORD *)&v40.st_dev);
      }
    }
    while (v15 != 2);
    v16 = v41[0];
    if (v41[0])
    {
      if (error)
      {
        *error = (NSError *)v41[0];
        v17 = v16;
      }
      else
      {
        CFRelease(v41[0]);
      }
      v11 = 0;
    }
    CFRelease(v14);
    return v11;
  }
  v34 = 0;
  v18 = -[NSURL path](url, "path");
  if (!v18)
  {
    v31 = _NSErrorWithFilePath(4, (uint64_t)url);
    if (!v31)
      return v11;
    goto LABEL_44;
  }
  v19 = v18;
  v33 = error;
  v20 = -[NSFileManager contentsOfDirectoryAtPath:error:](self, "contentsOfDirectoryAtPath:error:", v18, &v34);
  memset(&v40, 0, sizeof(v40));
  if (-[NSFileManager getFileSystemRepresentation:maxLength:withPath:](self, "getFileSystemRepresentation:maxLength:withPath:", v41, 1024, v19))
  {
    v21 = lstat((const char *)v41, &v40);
    if (v20)
    {
      if (!v21)
      {
        if ((v40.st_mode & 0xF000) == 0x4000)
        {
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v37 != v24)
                  objc_enumerationMutation(v20);
                v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                v27 = objc_msgSend(v19, "stringByAppendingPathComponent:", v26);
                if (-[NSFileManager getFileSystemRepresentation:maxLength:withPath:](self, "getFileSystemRepresentation:maxLength:withPath:", v41, 1024, v27)&& !lstat((const char *)v41, &v40))
                {
                  v28 = objc_msgSend(v26, "characterAtIndex:", 0);
                  if (!v12 || (v28 != 46 ? (v29 = (v40.st_flags & 0x8000) == 0) : (v29 = 0), v29))
                    -[NSArray addObject:](v11, "addObject:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v27, (v40.st_mode & 0xF000) == 0x4000));
                }
              }
              v23 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
            }
            while (v23);
          }
        }
        else
        {
          v34 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(20, (uint64_t)url, 1, 0, 0);
        }
      }
    }
  }
  error = v33;
  v31 = v34;
  if (v34)
  {
LABEL_44:
    v11 = 0;
    if (error)
      *error = v31;
  }
  return v11;
}

- (NSURL)containerURLForSecurityApplicationGroupIdentifier:(NSString *)groupIdentifier
{
  NSURL *result;
  NSURL *v4;
  NSURL *v5;

  -[NSString UTF8String](groupIdentifier, "UTF8String");
  result = (NSURL *)container_create_or_lookup_app_group_path_by_app_group_identifier();
  if (result)
  {
    v4 = result;
    v5 = (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", result, 1, 0);
    free(v4);
    return v5;
  }
  return result;
}

- (id)_URLForReplacingItemAtURL:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  const char *v12;
  char *v13;
  uint64_t v14;
  NSError *v15;
  _BOOL4 v16;
  int v17;
  char v18;
  __CFBundle *MainBundle;
  NSString *ValueForInfoDictionaryKey;
  NSString *v21;
  NSString *v22;
  int v23;
  char v24;
  NSString *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  void *v35;
  int *v37;
  NSError *v38;
  NSError *v39;
  _QWORD v40[2];
  uint64_t (*v41)(uint64_t, uint64_t);
  void *v42;
  uint64_t *v43;
  id *v44;
  char v45;
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  uint64_t v52;
  const __CFString *v53;
  NSString *v54;
  char __s[8];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__3;
  v51 = __Block_byref_object_dispose__3;
  v52 = 0;
  if (!objc_msgSend(a3, "fileSystemRepresentation")
    || !_dirhelper_relative()
    && (!objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "fileSystemRepresentation")
     || !_dirhelper_relative())
    || (v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", __s, 1, 0), (v7 = v6) != 0)&& ((*(_QWORD *)__s = 0, v46 = 0, v8 = *MEMORY[0x1E0C99BC8], v9 = objc_msgSend(v6, "getResourceValue:forKey:error:", __s, *MEMORY[0x1E0C99BC8], 0), (objc_msgSend(a3, "getResourceValue:forKey:error:", &v46, v8, 0) & 1) == 0)? (v10 = objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "getResourceValue:forKey:error:", &v46, v8, 0)): (v10 = 1), (v9 & v10) != 1 || (objc_msgSend(*(id *)__s, "isEqual:", v46) & 1) == 0))
  {
    v7 = 0;
  }
  getpid();
  v11 = sandbox_check();
  if (!v7 && v11)
  {
    v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation");
    v13 = (char *)_amkrtemp();
    if (v13
      || (v17 = _NSOpenFileDescriptor(v12, 512, 448), (v17 & 0x80000000) == 0)
      && (close(v17), (v13 = (char *)_amkrtemp()) != 0))
    {
      if (mkdir(v13, 0x1C0u))
      {
        if (a4)
        {
          v14 = *__error();
          v15 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo((int)v14, (uint64_t)a3, 0, 0, 0);
          *a4 = v15;
          if (!-[NSError localizedFailureReason](v15, "localizedFailureReason"))
            NSLog((NSString *)CFSTR("Foundation called mkdir(\"%s\"), it didn't return 0, and errno was set to %i."), v13, v14);
        }
      }
      else
      {
        v34 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13), 1);
        v48[5] = v34;
      }
      free(v13);
      goto LABEL_64;
    }
    goto LABEL_24;
  }
  if (!v7)
  {
LABEL_24:
    v7 = (void *)objc_msgSend(a3, "URLByDeletingLastPathComponent");
    v16 = objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("(A Document Being Saved By %@)"), &stru_1E0F56070, CFSTR("Document")) != 0;
    goto LABEL_25;
  }
  v16 = 0;
LABEL_25:
  v46 = 0;
  if (objc_msgSend(v7, "getResourceValue:forKey:error:", &v46, *MEMORY[0x1E0C99C00], 0))
    v18 = objc_msgSend(v46, "BOOLValue");
  else
    v18 = 0;
  MainBundle = CFBundleGetMainBundle();
  ValueForInfoDictionaryKey = (NSString *)CFBundleGetValueForInfoDictionaryKey(MainBundle, CFSTR("CFBundleName"));
  if (!ValueForInfoDictionaryKey)
    ValueForInfoDictionaryKey = -[NSProcessInfo processName](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "processName");
  v21 = -[NSString stringByReplacingOccurrencesOfString:withString:](ValueForInfoDictionaryKey, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
  v22 = v21;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v41 = __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke;
  v42 = &unk_1E0F4DE30;
  v45 = v18;
  v43 = &v47;
  v44 = a4;
  if (!v16)
  {
    if (-[NSString length](v21, "length") >= 0x41)
      v22 = -[NSString substringToIndex:](v22, "substringToIndex:", 64);
    v30 = (void *)objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSIRD_%@_"), v22), 0);
    bzero(__s, 0x402uLL);
    objc_msgSend(v30, "getFileSystemRepresentation:maxLength:", __s, 1018);
    if (v48[5])
      goto LABEL_64;
    v31 = &__s[strlen(__s)];
    while (1)
    {
      strcpy(v31, "XXXXXX");
      if (!mktemp(__s))
        break;
      v32 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", __s, 1, 0);
      v33 = v41((uint64_t)v40, v32);
      if (v33)
      {
        if (v33 != 17)
        {
          if (!a4)
            goto LABEL_64;
          v38 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v33, (uint64_t)a3, 0, 0, 0);
          goto LABEL_73;
        }
        if (v48[5])
          goto LABEL_64;
      }
      else
      {
        v48[5] = v32;
        if (v32)
          goto LABEL_64;
      }
    }
    if (!a4)
      goto LABEL_64;
    v37 = __error();
    v38 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v37, (uint64_t)a3, 0, 0, 0);
LABEL_73:
    *a4 = v38;
    goto LABEL_64;
  }
  if (v48[5])
    goto LABEL_64;
  v23 = 1;
  v24 = 1;
  while (1)
  {
    if ((v24 & 1) != 0)
    {
      if (v23 < 2)
        v25 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("(A Document Being Saved By %@)"), &stru_1E0F56070, CFSTR("Document")), v22);
      else
        v25 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("(A Document Being Saved By %@ %ld)"), &stru_1E0F56070, CFSTR("Document")), v22, v23);
    }
    else if (v23 < 2)
    {
      v25 = -[NSString initWithString:]([NSString alloc], "initWithString:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("(A Document Being Saved)"), &stru_1E0F56070, CFSTR("Document")));
    }
    else
    {
      v25 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("(A Document Being Saved %ld)"), &stru_1E0F56070, CFSTR("Document")), v23);
    }
    v26 = v25;
    v27 = (void *)objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v25, 1);

    v28 = v41((uint64_t)v40, (uint64_t)v27);
    v29 = v28;
    if ((int)v28 <= 62)
    {
      if ((_DWORD)v28)
      {
        if ((_DWORD)v28 != 17)
          goto LABEL_68;
        if (v23 >= 1000)
        {
          if (a4)
          {
            v53 = CFSTR("NSDebugDescription");
            v54 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Too many temporary directories for %@ in %@"), v22, v7);
            *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 512, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          }
          goto LABEL_64;
        }
        ++v23;
      }
      else
      {
        v48[5] = (uint64_t)v27;
      }
      goto LABEL_49;
    }
    if ((_DWORD)v28 != 63)
      break;
    if ((v24 & 1) == 0)
      goto LABEL_68;
    v24 = 0;
    v23 = 1;
LABEL_49:
    if (v48[5])
      goto LABEL_64;
  }
  if ((_DWORD)v28 == 1000000)
    goto LABEL_64;
LABEL_68:
  if (a4)
  {
    v39 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo((int)v28, (uint64_t)a3, 0, 0, 0);
    *a4 = v39;
    if (!-[NSError localizedFailureReason](v39, "localizedFailureReason"))
      NSLog((NSString *)CFSTR("Foundation called mkdir(\"%@\"), it didn't return 0, and errno was set to %i."), objc_msgSend(v27, "path"), v29);
  }
LABEL_64:
  v35 = (void *)v48[5];
  _Block_object_dispose(&v47, 8);
  return v35;
}

uint64_t __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  NSFileCoordinator *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1000000;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_2;
  v8[3] = &unk_1E0F4DDE8;
  v8[4] = a2;
  v8[5] = &v9;
  if (qword_1ECD09790 != -1)
    dispatch_once(&qword_1ECD09790, &__block_literal_global_223);
  if (*(_BYTE *)(a1 + 48) || !_MergedGlobals_25_0)
  {
    __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_2((uint64_t)v8);
  }
  else
  {
    v4 = objc_alloc_init(NSFileCoordinator);
    -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v4, "coordinateWritingItemAtURL:options:error:byAccessor:", a2, 0, *(_QWORD *)(a1 + 40), v8);

  }
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

int *__49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_2(uint64_t a1)
{
  int *result;
  int v3;

  result = (int *)mkdir((const char *)objc_msgSend(*(id *)(a1 + 32), "fileSystemRepresentation"), 0x1C0u);
  if ((_DWORD)result)
  {
    result = __error();
    v3 = *result;
  }
  else
  {
    v3 = 0;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((NSFileManager *)qword_1ECD097A0 == self)
  {
    qword_1EDC47C18 = (uint64_t)"You cannot deallocate the default file manager singleton";
    __break(1u);
  }

  v3.receiver = self;
  v3.super_class = (Class)NSFileManager;
  -[NSFileManager dealloc](&v3, sel_dealloc);
}

- (BOOL)createDirectoryAtURL:(NSURL *)url withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error
{
  void *v7;

  if (!url)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v7);
  }
  return -[_NSFileManagerBridge createDirectoryAt:withIntermediateDirectories:attributes:error:](self->swiftBridge, "createDirectoryAt:withIntermediateDirectories:attributes:error:", url, createIntermediates, attributes, error);
}

- (BOOL)fileExistsAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge fileExistsAtPath:](self->swiftBridge, "fileExistsAtPath:");
}

- (NSURL)temporaryDirectory
{
  return -[_NSFileManagerBridge temporaryDirectory](self->swiftBridge, "temporaryDirectory");
}

- (NSArray)URLsForDirectory:(NSSearchPathDirectory)directory inDomains:(NSSearchPathDomainMask)domainMask
{
  return (NSArray *)-[_NSFileManagerBridge urlsFor:in:](self->swiftBridge, "urlsFor:in:", directory, domainMask);
}

uint64_t __31__NSFileManager_defaultManager__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_allocWithZone(*(Class *)(a1 + 32)), "init");
  qword_1ECD097A0 = result;
  return result;
}

- (NSDirectoryEnumerator)enumeratorAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask errorHandler:(void *)handler
{
  void *v7;

  if (!url)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v7);
  }
  return (NSDirectoryEnumerator *)-[NSURLDirectoryEnumerator initWithURL:includingPropertiesForKeys:options:errorHandler:]([NSURLDirectoryEnumerator alloc], "initWithURL:includingPropertiesForKeys:options:errorHandler:", url, keys, mask, handler);
}

- (BOOL)moveItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error
{
  return -[NSFileManager moveItemAtURL:toURL:options:error:](self, "moveItemAtURL:toURL:options:error:", srcURL, dstURL, 0, error);
}

- (BOOL)copyItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error
{
  return -[NSFileManager copyItemAtURL:toURL:options:error:](self, "copyItemAtURL:toURL:options:error:", srcURL, dstURL, 0, error);
}

- (BOOL)isDeletableFileAtPath:(NSString *)path
{
  if (!path)
    path = -[NSFileManager currentDirectoryPath](self, "currentDirectoryPath");
  return -[_NSFileManagerBridge isDeletableFileAtPath:](self->swiftBridge, "isDeletableFileAtPath:", path);
}

- (BOOL)isWritableFileAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge isWritableFileAtPath:](self->swiftBridge, "isWritableFileAtPath:");
}

- (BOOL)removeItemAtURL:(NSURL *)URL error:(NSError *)error
{
  return !URL || -[_NSFileManagerBridge removeItemAt:error:](self->swiftBridge, "removeItemAt:error:", URL, error);
}

uint64_t __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_3()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  _MergedGlobals_25_0 = (_DWORD)result == 0;
  return result;
}

- (NSArray)subpathsOfDirectoryAtPath:(NSString *)path error:(NSError *)error
{
  void *v9;

  if (!path && _CFExecutableLinkedOnOrAfter())
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: path is nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  return (NSArray *)-[_NSFileManagerBridge subpathsOfDirectoryAtPath:error:](self->swiftBridge, "subpathsOfDirectoryAtPath:error:", path, error);
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  int v8;
  NSString *v9;

  if (!a3)
  {
    v8 = _CFExecutableLinkedOnOrAfter();
    if (!v8)
      return v8;
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: source path is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v9, 0));
  }
  if (!a4)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: destination path is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }
  LOBYTE(v8) = -[_NSFileManagerBridge copyItemAtPath:toPath:options:error:](self->swiftBridge, "copyItemAtPath:toPath:options:error:");
  return v8;
}

- (BOOL)changeCurrentDirectoryPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge changeCurrentDirectoryPath:](self->swiftBridge, "changeCurrentDirectoryPath:");
}

uint64_t __55__NSFileManager__processCanAccessUbiquityIdentityToken__block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  _processCanAccessUbiquityIdentityToken_result = (_DWORD)result == 0;
  return result;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  int v8;
  NSString *v9;

  if (!a3)
  {
    v8 = _CFExecutableLinkedOnOrAfter();
    if (!v8)
      return v8;
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: source URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v9, 0));
  }
  if (!a4)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: destination URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }
  LOBYTE(v8) = -[_NSFileManagerBridge copyItemAt:to:options:error:](self->swiftBridge, "copyItemAt:to:options:error:");
  return v8;
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  int v8;
  NSString *v9;

  if (!a3)
  {
    v8 = _CFExecutableLinkedOnOrAfter();
    if (!v8)
      return v8;
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: source URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v9, 0));
  }
  if (!a4)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: destination URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }
  LOBYTE(v8) = -[_NSFileManagerBridge moveItemAt:to:options:error:](self->swiftBridge, "moveItemAt:to:options:error:");
  return v8;
}

void __56__NSFileManager__processHasUbiquityContainerEntitlement__block_invoke(uint64_t a1)
{
  char v1;
  void *v2;
  void *v3;
  const char *string;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_processUsesCloudServices") & 1) != 0)
    goto LABEL_2;
  *(_OWORD *)task_info_out = 0u;
  v7 = 0u;
  task_info_outCnt = 8;
  task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt);
  v2 = (void *)xpc_copy_entitlement_for_token();
  if (v2)
  {
    v3 = v2;
    if (object_getClass(v2) != (Class)MEMORY[0x1E0C812C8] || !xpc_array_get_count(v3))
    {
      xpc_release(v3);
      return;
    }
    string = xpc_array_get_string(v3, 0);
    xpc_release(v3);
    if (string)
    {
LABEL_2:
      if (qword_1ECD09828 != -1)
        dispatch_once(&qword_1ECD09828, &__block_literal_global_555);
      if (off_1ECD097E8)
        v1 = off_1ECD097E8();
      else
        v1 = 0;
      byte_1ECD09779 = v1;
    }
  }
}

- (BOOL)_processUsesCloudServices
{
  if (qword_1ECD097F0 != -1)
    dispatch_once(&qword_1ECD097F0, &__block_literal_global_290);
  return byte_1ECD0977A;
}

- (BOOL)_processHasUbiquityContainerEntitlement
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__NSFileManager__processHasUbiquityContainerEntitlement__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = self;
  if (qword_1ECD097E0 != -1)
    dispatch_once(&qword_1ECD097E0, v3);
  return byte_1ECD09779;
}

void __51__NSFileManager_URLForUbiquityContainerIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;

  if (a3)
    v4 = 0;
  else
    v4 = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)destPath error:(NSError *)error
{
  return -[_NSFileManagerBridge createSymbolicLinkAtPath:withDestinationPath:error:](self->swiftBridge, "createSymbolicLinkAtPath:withDestinationPath:error:", path, destPath, error);
}

- (NSString)currentDirectoryPath
{
  return -[_NSFileManagerBridge currentDirectoryPath](self->swiftBridge, "currentDirectoryPath");
}

void __42__NSFileManager__processUsesCloudServices__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)task_info_out = 0u;
  v6 = 0u;
  task_info_outCnt = 8;
  task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt);
  v0 = (void *)xpc_copy_entitlement_for_token();
  if (v0)
  {
    v1 = v0;
    if (object_getClass(v0) == (Class)MEMORY[0x1E0C812C8] && xpc_array_get_count(v1) && xpc_array_get_string(v1, 0))
      byte_1ECD0977A = 1;
    xpc_release(v1);
  }
  if (!byte_1ECD0977A)
  {
    v2 = (void *)xpc_copy_entitlement_for_token();
    if (v2)
    {
      v3 = v2;
      byte_1ECD0977A = object_getClass(v2) == (Class)MEMORY[0x1E0C81390];
      xpc_release(v3);
    }
  }
}

- (id)ubiquityIdentityToken
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09828 != -1)
    dispatch_once(&qword_1ECD09828, &__block_literal_global_555);
  v4[0] = 0;
  if (off_1ECD097F8)
  {
    off_1ECD097F8(v4, 0);
    v2 = (void *)v4[0];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)contentsEqualAtPath:(NSString *)path1 andPath:(NSString *)path2
{
  return -[_NSFileManagerBridge contentsEqualAtPath:andPath:](self->swiftBridge, "contentsEqualAtPath:andPath:", path1, path2);
}

- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectoryAtURL:(NSURL *)directoryURL toItemAtURL:(NSURL *)otherURL error:(NSError *)error
{
  return directoryURL
      && otherURL
      && -[_NSFileManagerBridge getRelationship:ofDirectoryAt:toItemAt:error:](self->swiftBridge, "getRelationship:ofDirectoryAt:toItemAt:error:", outRelationship);
}

- (NSURL)URLForUbiquityContainerIdentifier:(NSString *)containerIdentifier
{
  qos_class_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSURL *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09828 != -1)
    dispatch_once(&qword_1ECD09828, &__block_literal_global_555);
  if (!off_1ECD097D0)
    return 0;
  v4 = qos_class_main();
  v5 = dispatch_queue_attr_make_with_qos_class(0, v4, 0);
  v6 = dispatch_queue_create("com.apple.NSFileManager.URLForUbiquityContainerIdentifier:", v5);
  v7 = dispatch_semaphore_create(0);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  dispatch_retain(v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__NSFileManager_URLForUbiquityContainerIdentifier___block_invoke;
  v10[3] = &unk_1E0F4DED0;
  v10[4] = v7;
  v10[5] = &v11;
  off_1ECD097D0(containerIdentifier, v6, v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v6);
  dispatch_release(v7);
  v8 = (NSURL *)(id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (NSFileManager)init
{
  NSFileManager *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSFileManager;
  v2 = -[NSFileManager init](&v4, sel_init);
  if (v2)
    v2->swiftBridge = -[_NSFileManagerBridge initWithFileManager:]([_NSFileManagerBridge alloc], "initWithFileManager:", v2);
  return v2;
}

- (NSArray)mountedVolumeURLsIncludingResourceValuesForKeys:(NSArray *)propertyKeys options:(NSVolumeEnumerationOptions)options
{
  return 0;
}

- (id)_URLForTrashingItemAtURL:(id)a3 create:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint64_t v9;
  void *v10;

  v6 = a4;
  if (qword_1ECD09820 != -1)
    dispatch_once(&qword_1ECD09820, &__block_literal_global_545);
  v9 = -[NSFileManager fp_trashURLForItemAtURL:error:](self, "fp_trashURLForItemAtURL:error:", a3, 0);
  v10 = (void *)v9;
  if (!a5 || v9)
  {
    if (v9
      && v6
      && !-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](self, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, a5))
    {
      return 0;
    }
  }
  else
  {
    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, 0);
  }
  return v10;
}

- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domainMask toItemAtURL:(NSURL *)url error:(NSError *)error
{
  return -[_NSFileManagerBridge getRelationship:of:in:toItemAt:error:](self->swiftBridge, "getRelationship:of:in:toItemAt:error:", outRelationship, directory, domainMask, url, error);
}

- (id)_displayPathForPath:(id)a3
{
  NSMutableString *v4;
  void *v5;

  v4 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 512);
  v5 = (void *)objc_msgSend(a3, "stringByStandardizingPath");
  if ((objc_msgSend(v5, "isEqualToString:", &stru_1E0F56070) & 1) == 0)
  {
    do
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("/")) & 1) != 0)
        break;
      -[NSMutableString insertString:atIndex:](v4, "insertString:atIndex:", -[NSFileManager displayNameAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "displayNameAtPath:", v5), 0);
      v5 = (void *)objc_msgSend(v5, "stringByDeletingLastPathComponent");
      if ((objc_msgSend(v5, "isEqualToString:", &stru_1E0F56070) & 1) == 0)
        -[NSMutableString insertString:atIndex:](v4, "insertString:atIndex:", CFSTR("/"), 0);
    }
    while (!objc_msgSend(v5, "isEqualToString:", &stru_1E0F56070));
  }
  if (-[NSString isAbsolutePath](v4, "isAbsolutePath"))
  {
    if (-[NSString hasPrefix:](v4, "hasPrefix:", CFSTR("/Volumes")))
    {
      -[NSMutableString deleteCharactersInRange:](v4, "deleteCharactersInRange:", 0, 8);
    }
    else if (!-[NSString hasPrefix:](v4, "hasPrefix:", CFSTR("/Network")))
    {
      -[NSMutableString insertString:atIndex:](v4, "insertString:atIndex:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@"), -[NSFileManager displayNameAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "displayNameAtPath:", CFSTR("/"))), 0);
    }
  }
  return v4;
}

- (BOOL)directoryCanBeCreatedAtPath:(id)a3
{
  const char *v4;
  char v6[1026];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = (const char *)objc_msgSend(a3, "fileSystemRepresentation");
  if ((objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "getFileSystemRepresentation:maxLength:", v6, 1024) & 1) == 0|| access(v6, 3))
  {
    return 0;
  }
  if (!mkdir(v4, 0x1FFu))
  {
    rmdir(v4);
    return 1;
  }
  return *__error() == 17;
}

- (NSDictionary)fileAttributesAtPath:(NSString *)path traverseLink:(BOOL)yorn
{
  return (NSDictionary *)+[NSFileAttributes attributesAtPath:traverseLink:](NSFileAttributes, "attributesAtPath:traverseLink:", path, yorn);
}

- (BOOL)changeFileAttributes:(NSDictionary *)attributes atPath:(NSString *)path
{
  return -[NSFileManager setAttributes:ofItemAtPath:error:](self, "setAttributes:ofItemAtPath:error:", attributes, path, 0);
}

- (BOOL)isExecutableFileAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge isExecutableFileAtPath:](self->swiftBridge, "isExecutableFileAtPath:");
}

- (BOOL)removeFileAtPath:(NSString *)path handler:(id)handler
{
  return -[NSFileManager removeItemAtPath:error:](self, "removeItemAtPath:error:", path, 0);
}

- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6
{
  return -[NSFileManager directoryContentsAtPath:matchingExtension:options:keepExtension:error:](self, "directoryContentsAtPath:matchingExtension:options:keepExtension:error:", a3, a4, a5, a6, 0);
}

- (NSArray)directoryContentsAtPath:(NSString *)path
{
  return (NSArray *)-[NSFileManager directoryContentsAtPath:matchingExtension:options:keepExtension:](self, "directoryContentsAtPath:matchingExtension:options:keepExtension:", path, 0, 0, 1);
}

- (BOOL)createDirectoryAtPath:(NSString *)path attributes:(NSDictionary *)attributes
{
  int v7;
  BOOL result;
  char v9[1026];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!-[NSString getFileSystemRepresentation:maxLength:](path, "getFileSystemRepresentation:maxLength:", v9, 1024))
    return 0;
  v7 = mkdir(v9, 0x1FFu);
  result = v7 == 0;
  if (attributes)
  {
    if (!v7)
    {
      -[NSFileManager changeFileAttributes:atPath:](self, "changeFileAttributes:atPath:", attributes, path);
      return 1;
    }
  }
  return result;
}

- (NSString)pathContentOfSymbolicLinkAtPath:(NSString *)path
{
  return -[NSFileManager destinationOfSymbolicLinkAtPath:error:](self, "destinationOfSymbolicLinkAtPath:error:", path, 0);
}

- (BOOL)createSymbolicLinkAtPath:(NSString *)path pathContent:(NSString *)otherpath
{
  return -[NSFileManager createSymbolicLinkAtPath:withDestinationPath:error:](self, "createSymbolicLinkAtPath:withDestinationPath:error:", path, otherpath, 0);
}

- (NSDictionary)fileSystemAttributesAtPath:(NSString *)path
{
  return -[NSFileManager attributesOfFileSystemForPath:error:](self, "attributesOfFileSystemForPath:error:", path, 0);
}

- (NSArray)componentsToDisplayForPath:(NSString *)path
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSArray *v13;
  uint64_t v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!path)
    return 0;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[NSString stringByResolvingSymlinksInPath](path, "stringByResolvingSymlinksInPath")), "fileReferenceURL"))return 0;
  v3 = _CFURLCreateDisplayPathComponentsArray();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = *MEMORY[0x1E0C99A70];
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v15 = 0;
        if (objc_msgSend(v11, "getResourceValue:forKey:error:", &v15, v9, 0))
          v12 = v15 == 0;
        else
          v12 = 1;
        if (v12)
        {

          goto LABEL_19;
        }
        objc_msgSend(v5, "insertObject:atIndex:");
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  if (v5)
  {
    v13 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);

  }
  else
  {
LABEL_19:
    v13 = 0;
  }
  CFRelease(v4);
  return v13;
}

- (NSFileManager)retain
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if ((NSFileManager *)qword_1ECD097A0 != self)
  {
    v2.receiver = self;
    v2.super_class = (Class)NSFileManager;
    return -[NSFileManager retain](&v2, sel_retain);
  }
  return self;
}

- (void)release
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if ((NSFileManager *)qword_1ECD097A0 != self)
  {
    v2.receiver = self;
    v2.super_class = (Class)NSFileManager;
    -[NSFileManager release](&v2, sel_release);
  }
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  NSValue *v5;

  self->_delegate = delegate;

  if (delegate)
    v5 = +[NSValue valueWithWeakObject:](NSValue, "valueWithWeakObject:", delegate);
  else
    v5 = 0;
  self->_weakDelegateValue = v5;
}

- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error
{
  return -[NSFileManager copyItemAtPath:toPath:options:error:](self, "copyItemAtPath:toPath:options:error:", srcPath, dstPath, 0, error);
}

- (BOOL)_handleFaultedOutCloudDocFromSource:(id)a3 toDestination:(id)a4 handled:(BOOL *)a5 error:(id *)a6
{
  id v10;
  const void *v11;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  if (a5)
    *a5 = 0;
  v10 = (id)_CFURLPromiseCopyPhysicalURL();
  v11 = v10;
  if (!v10 || v10 == a3)
  {
    if (!v10)
      return 1;
LABEL_13:
    CFRelease(v11);
    return 1;
  }
  if ((objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
    goto LABEL_13;
  if (qword_1ECD09788 != -1)
    dispatch_once(&qword_1ECD09788, &__block_literal_global_10);
  +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_13;
  v15 = 0;
  if ((-[NSFileManager br_movePromisedItemAtURL:toURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "br_movePromisedItemAtURL:toURL:error:", a3, a4, &v15) & 1) != 0)
  {
    if (a5)
      *a5 = 1;
    goto LABEL_13;
  }
  if (objc_msgSend(v15, "code") == 4)
  {
    if (objc_msgSend((id)objc_msgSend(v15, "domain"), "isEqualToString:", CFSTR("NSCocoaErrorDomain")))
      v13 = 4;
    else
      v13 = 512;
  }
  else
  {
    v13 = 512;
  }
  v16[0] = CFSTR("NSFilePath");
  v17[0] = objc_msgSend(a3, "path");
  v16[1] = CFSTR("NSDestinationFilePath");
  v17[1] = objc_msgSend(a4, "path");
  v17[2] = CFSTR("Move");
  v16[2] = CFSTR("NSUserStringVariant");
  v16[3] = CFSTR("NSUnderlyingError");
  v17[3] = v15;
  v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  if (a6)
    *a6 = -[NSError initWithDomain:code:userInfo:]([NSError alloc], "initWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v13, v14);
  CFRelease(v11);
  return 0;
}

- (BOOL)linkItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error
{
  NSString *v11;

  if (!srcPath && _CFExecutableLinkedOnOrAfter())
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: source path is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_7:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
  }
  if (!dstPath)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: destination path is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_7;
  }
  return -[_NSFileManagerBridge linkItemAtPath:toPath:error:](self->swiftBridge, "linkItemAtPath:toPath:error:", srcPath, dstPath, error);
}

- (BOOL)linkItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error
{
  NSString *v11;

  if (!srcURL && _CFExecutableLinkedOnOrAfter())
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: source URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_7:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
  }
  if (!dstURL)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: destination URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_7;
  }
  return -[_NSFileManagerBridge linkItemAt:to:error:](self->swiftBridge, "linkItemAt:to:error:", srcURL, dstURL, error);
}

- (BOOL)trashItemAtURL:(NSURL *)url resultingItemURL:(NSURL *)outResultingURL error:(NSError *)error
{
  char v9;
  BOOL v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSError *v14;
  void *v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!url)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: source URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v16);
  }
  if (-[NSURL isFileURL](url, "isFileURL"))
  {
    if (qword_1ECD09820 != -1)
      dispatch_once(&qword_1ECD09820, &__block_literal_global_545);
    v17[0] = 0;
    v9 = -[NSFileManager fp_trashItemAtURL:resultingItemURL:error:](self, "fp_trashItemAtURL:resultingItemURL:error:", url, outResultingURL, v17);
    v10 = v9;
    if (error && (v9 & 1) == 0)
    {
      v11 = v17[0];
      if (objc_msgSend((id)objc_msgSend(v17[0], "domain"), "isEqualToString:", CFSTR("NSCocoaErrorDomain")))
      {
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v11, "userInfo"));
        v13 = objc_msgSend(v11, "code");
      }
      else
      {
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v11, CFSTR("NSUnderlyingError"));
        v13 = 512;
      }
      objc_msgSend(v12, "setObject:forKey:", url, CFSTR("NSURL"));
      objc_msgSend(v12, "setObject:forKey:", CFSTR("Trash"), CFSTR("NSUserStringVariant"));
      v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v13, v12);
      goto LABEL_14;
    }
  }
  else
  {
    if (error)
    {
      v14 = _NSErrorWithFilePath(262, (uint64_t)url);
      v10 = 0;
LABEL_14:
      *error = v14;
      return v10;
    }
    return 0;
  }
  return v10;
}

- (id)_attributesOfItemAtPath:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5
{
  return +[NSFileAttributes _attributesAtPath:partialReturn:filterResourceFork:error:](NSFileAttributes, "_attributesAtPath:partialReturn:filterResourceFork:error:", a3, 1, a4, a5);
}

- (BOOL)createSymbolicLinkAtURL:(NSURL *)url withDestinationURL:(NSURL *)destURL error:(NSError *)error
{
  NSString *v6;

  if (!url)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_6;
  }
  if (!destURL)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: destURL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_6:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
  }
  return -[_NSFileManagerBridge createSymbolicLinkAt:withDestinationURL:error:](self->swiftBridge, "createSymbolicLinkAt:withDestinationURL:error:");
}

- (BOOL)replaceItemAtURL:(NSURL *)originalItemURL withItemAtURL:(NSURL *)newItemURL backupItemName:(NSString *)backupItemName options:(NSFileManagerItemReplacementOptions)options resultingItemURL:(NSURL *)resultingURL error:(NSError *)error
{
  int v10;
  id v11;
  NSString *v13;
  id v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!originalItemURL)
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: original item URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_12;
  }
  if (!newItemURL)
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: new item URL is nil"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_12:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0));
  }
  v14 = 0;
  v15[0] = 0;
  v10 = MEMORY[0x186DA7E50](0, originalItemURL, newItemURL, 0, backupItemName, (8 * (int)options) & 0x10 | (2 * (options & 1)), v15, &v14);
  if (!v10)
  {
    v11 = v14;
    if (error)
    {
      *error = (NSError *)v14;
      return v10 != 0;
    }
LABEL_8:
    CFRelease(v11);
    return v10 != 0;
  }
  v11 = v15[0];
  if (!resultingURL)
    goto LABEL_8;
  *resultingURL = (NSURL *)v15[0];
  return v10 != 0;
}

- (BOOL)startDownloadingUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error
{
  char v6;
  BOOL v7;
  char v8;
  NSError *v9;
  qos_class_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09820 != -1)
    dispatch_once(&qword_1ECD09820, &__block_literal_global_545);
  if (off_1ECD097A8)
  {
    v18 = 0;
    v6 = off_1ECD097A8(url, &v18);
    v7 = v6;
    if (error)
      v8 = v6;
    else
      v8 = 1;
    if ((v8 & 1) == 0)
    {
      v9 = _cocoaDomainErrorForLibrarianError((uint64_t)url, v18, 0);
LABEL_19:
      *error = v9;
    }
  }
  else
  {
    if (qword_1ECD09828 != -1)
      dispatch_once(&qword_1ECD09828, &__block_literal_global_555);
    if (!off_1ECD097B0)
    {
      if (!error)
        return 0;
      v9 = _librarianMissingError(0);
      v7 = 0;
      goto LABEL_19;
    }
    v10 = qos_class_main();
    v11 = dispatch_queue_attr_make_with_qos_class(0, v10, 0);
    v12 = dispatch_queue_create("com.apple.NSFileManager.startDownloadingUbiquitousItemAtURL:error:", v11);
    v13 = dispatch_semaphore_create(0);
    v18 = 0;
    v19 = &v18;
    v20 = 0x3052000000;
    v21 = __Block_byref_object_copy__3;
    v22 = __Block_byref_object_dispose__3;
    v23 = 0;
    dispatch_retain(v13);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__NSFileManager_startDownloadingUbiquitousItemAtURL_error___block_invoke;
    v17[3] = &unk_1E0F4DE58;
    v17[4] = v13;
    v17[5] = &v18;
    off_1ECD097B0(url, v12, v17);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v12);
    dispatch_release(v13);
    v14 = v19[5];
    v7 = v14 == 0;
    if (v14)
    {
      if (error)
      {
        *error = _cocoaDomainErrorForLibrarianError((uint64_t)url, v14, 0);
        v14 = v19[5];
      }
      v15 = v14;
    }
    _Block_object_dispose(&v18, 8);
  }
  return v7;
}

void __59__NSFileManager_startDownloadingUbiquitousItemAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (BOOL)setUbiquitous:(BOOL)flag itemAtURL:(NSURL *)url destinationURL:(NSURL *)destinationURL error:(NSError *)error
{
  uint64_t v10;
  BOOL v11;
  NSFileCoordinator *v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[5];
  BOOL v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09828 != -1)
    dispatch_once(&qword_1ECD09828, &__block_literal_global_555);
  if (off_1ECD097B8)
  {
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke;
    v19[3] = &unk_1E0F4DE80;
    v20 = flag;
    v19[4] = url;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    if (+[NSFileCoordinator _currentFileCoordinator](NSFileCoordinator, "_currentFileCoordinator"))
    {
      v11 = __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke((uint64_t)v19, (uint64_t)url, (uint64_t)destinationURL, error);
      *((_BYTE *)v16 + 24) = v11;
    }
    else
    {
      v12 = -[NSFileCoordinator initWithFilePresenter:]([NSFileCoordinator alloc], "initWithFilePresenter:", 0);
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke_3;
      v14[3] = &unk_1E0F4DEA8;
      v14[6] = &v15;
      v14[7] = error;
      v14[4] = v12;
      v14[5] = v19;
      -[NSFileCoordinator coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:](v12, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", url, 2, destinationURL, 0, error, v14);

      v11 = *((_BYTE *)v16 + 24) != 0;
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v11 = 0;
    if (error)
      *error = _librarianMissingError(0);
  }
  return v11;
}

BOOL __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, NSError **a4)
{
  qos_class_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _BOOL8 v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v8 = qos_class_main();
  v9 = dispatch_queue_attr_make_with_qos_class(0, v8, 0);
  v10 = dispatch_queue_create("com.apple.NSFileManager.setUbiquitous:itemAtURL:destinationURL:error:", v9);
  v11 = dispatch_semaphore_create(0);
  dispatch_retain(v11);
  v12 = *(unsigned __int8 *)(a1 + 40);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke_2;
  v17[3] = &unk_1E0F4DE58;
  v17[4] = v11;
  v17[5] = &v18;
  off_1ECD097B8(a2, v12, a3, v10, v17);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v10);
  dispatch_release(v11);
  v13 = (void *)v19[5];
  if (a4 && v13)
  {
    *a4 = _cocoaDomainErrorForLibrarianError(*(_QWORD *)(a1 + 32), v13, 0);
    v13 = (void *)v19[5];
  }
  v14 = v13;
  v15 = v19[5] == 0;
  _Block_object_dispose(&v18, 8);
  return v15;
}

void __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "itemAtURL:didMoveToURL:", a2, a3);
  return result;
}

- (BOOL)isUbiquitousItemAtURL:(NSURL *)url
{
  BOOL v4;
  CFBooleanRef BOOLean[2];

  BOOLean[1] = *(CFBooleanRef *)MEMORY[0x1E0C80C00];
  if (!url)
    return 0;
  BOOLean[0] = 0;
  if (!CFURLCopyResourcePropertyForKey((CFURLRef)url, (CFStringRef)*MEMORY[0x1E0C9B540], BOOLean, 0)
    || BOOLean[0] == 0)
  {
    return 0;
  }
  v4 = CFBooleanGetValue(BOOLean[0]) != 0;
  CFRelease(BOOLean[0]);
  return v4;
}

- (BOOL)evictUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error
{
  char v6;
  BOOL v7;
  char v8;
  NSError *v9;
  NSString *v10;
  NSError *v11;
  qos_class_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSError *v16;
  NSError *v17;
  _QWORD v19[6];
  NSError *v20;
  NSError *v21;
  NSError **v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09820 != -1)
    dispatch_once(&qword_1ECD09820, &__block_literal_global_545);
  if (off_1ECD097C0)
  {
    v20 = 0;
    v6 = off_1ECD097C0(url, &v20);
    v7 = v6;
    if (error)
      v8 = v6;
    else
      v8 = 1;
    if ((v8 & 1) == 0)
    {
      v9 = v20;
      v10 = -[NSError domain](v20, "domain");
      if (!-[NSString isEqual:](v10, "isEqual:", CFSTR("NSCocoaErrorDomain")))
      {
        if (-[NSString isEqual:](v10, "isEqual:", CFSTR("NSPOSIXErrorDomain")) && -[NSError code](v9, "code") == 45)
        {
          v27[0] = CFSTR("NSUnderlyingError");
          v21 = v9;
          v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, v27, 1));
        }
        else
        {
          v27[0] = CFSTR("NSUnderlyingError");
          v21 = v9;
          v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 512, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, v27, 1));
        }
        v9 = v11;
      }
      *error = v9;
    }
  }
  else
  {
    if (qword_1ECD09828 != -1)
      dispatch_once(&qword_1ECD09828, &__block_literal_global_555);
    if (off_1ECD097C8)
    {
      v12 = qos_class_main();
      v13 = dispatch_queue_attr_make_with_qos_class(0, v12, 0);
      v14 = dispatch_queue_create("com.apple.NSFileManager.evictUbiquitousItemAtURL:error:", v13);
      v15 = dispatch_semaphore_create(0);
      v21 = 0;
      v22 = &v21;
      v23 = 0x3052000000;
      v24 = __Block_byref_object_copy__3;
      v25 = __Block_byref_object_dispose__3;
      v26 = 0;
      dispatch_retain(v15);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __48__NSFileManager_evictUbiquitousItemAtURL_error___block_invoke;
      v19[3] = &unk_1E0F4DE58;
      v19[4] = v15;
      v19[5] = &v21;
      off_1ECD097C8(url, v14, v19);
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v14);
      dispatch_release(v15);
      v16 = v22[5];
      v7 = v16 == 0;
      if (v16)
      {
        if (error)
        {
          *error = _cocoaDomainErrorForLibrarianError((uint64_t)url, v16, 0);
          v16 = v22[5];
        }
        v17 = v16;
      }
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      v7 = 0;
      if (error)
        *error = _librarianMissingError(0);
    }
  }
  return v7;
}

void __48__NSFileManager_evictUbiquitousItemAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (NSURL)URLForPublishingUbiquitousItemAtURL:(NSURL *)url expirationDate:(NSDate *)outDate error:(NSError *)error
{
  qos_class_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  NSURL *v15;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09828 != -1)
    dispatch_once(&qword_1ECD09828, &__block_literal_global_555);
  if (off_1ECD097D8)
  {
    v8 = qos_class_main();
    v9 = dispatch_queue_attr_make_with_qos_class(0, v8, 0);
    v10 = dispatch_queue_create("com.apple.NSFileManager.URLForPublishingUbiquitousItemAtURL:expirationDate:error:", v9);
    v11 = dispatch_semaphore_create(0);
    v30 = 0;
    v31 = &v30;
    v32 = 0x3052000000;
    v33 = __Block_byref_object_copy__3;
    v34 = __Block_byref_object_dispose__3;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3052000000;
    v27 = __Block_byref_object_copy__3;
    v28 = __Block_byref_object_dispose__3;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3052000000;
    v21 = __Block_byref_object_copy__3;
    v22 = __Block_byref_object_dispose__3;
    v23 = 0;
    dispatch_retain(v11);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__NSFileManager_URLForPublishingUbiquitousItemAtURL_expirationDate_error___block_invoke;
    v17[3] = &unk_1E0F4DEF8;
    v17[6] = &v24;
    v17[7] = &v18;
    v17[4] = v11;
    v17[5] = &v30;
    off_1ECD097D8(url, v10, v17);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v10);
    dispatch_release(v11);
    v12 = (id)v25[5];
    v13 = (id)v19[5];
    v14 = (void *)v19[5];
    if (v14)
    {
      if (error)
        *error = _cocoaDomainErrorForLibrarianError((uint64_t)url, v14, 1);
    }
    else if (outDate)
    {
      *outDate = (NSDate *)v25[5];
    }
    v15 = (NSURL *)(id)v31[5];
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v15 = 0;
    if (error)
      *error = _librarianMissingError(1);
  }
  return v15;
}

void __74__NSFileManager_URLForPublishingUbiquitousItemAtURL_expirationDate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    v5 = objc_msgSend(a4, "copy");
    v6 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
    v5 = objc_msgSend(a3, "copy");
    v6 = *(_QWORD *)(a1 + 48);
  }
  *(_QWORD *)(*(_QWORD *)(v6 + 8) + 40) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (void)getFileProviderMessageInterfacesForItemAtURL:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: completionHandler is NULL"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v6);
  }
  if (qword_1ECD09820 != -1)
    dispatch_once(&qword_1ECD09820, &__block_literal_global_545);
  if (off_1ECD09800)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__NSFileManager_getFileProviderMessageInterfacesForItemAtURL_completionHandler___block_invoke;
    v7[3] = &unk_1E0F4DF98;
    v7[4] = a4;
    off_1ECD09800(a3, v7);
  }
  else
  {
    (*((void (**)(id, _QWORD, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, 0));
  }
}

void __80__NSFileManager_getFileProviderMessageInterfacesForItemAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  qos_class_t v6;
  NSObject *global_queue;
  uint64_t v8;
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  v6 = qos_class_self();
  global_queue = dispatch_get_global_queue(v6, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__NSFileManager_getFileProviderMessageInterfacesForItemAtURL_completionHandler___block_invoke_2;
  v9[3] = &unk_1E0F4DF70;
  v8 = *(_QWORD *)(a1 + 32);
  v9[5] = a3;
  v9[6] = v8;
  v9[4] = a2;
  dispatch_async(global_queue, v9);
}

uint64_t __80__NSFileManager_getFileProviderMessageInterfacesForItemAtURL_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getFileProviderServicesForItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (!completionHandler)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: completionHandler is NULL"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v6);
  }
  if (qword_1ECD09820 != -1)
    dispatch_once(&qword_1ECD09820, &__block_literal_global_545);
  if (off_1ECD09808)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__NSFileManager_getFileProviderServicesForItemAtURL_completionHandler___block_invoke;
    v7[3] = &unk_1E0F4DFE8;
    v7[4] = completionHandler;
    off_1ECD09808(url, 0, v7);
  }
  else
  {
    (*((void (**)(void *, _QWORD, NSError *))completionHandler + 2))(completionHandler, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, 0));
  }
}

void __71__NSFileManager_getFileProviderServicesForItemAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  qos_class_t v10;
  NSObject *global_queue;
  uint64_t v12;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v10 = qos_class_self();
  global_queue = dispatch_get_global_queue(v10, 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__NSFileManager_getFileProviderServicesForItemAtURL_completionHandler___block_invoke_2;
  v13[3] = &unk_1E0F4DFC0;
  v12 = *(_QWORD *)(a1 + 32);
  v13[4] = a5;
  v13[5] = a3;
  v13[6] = a2;
  v13[7] = v12;
  v13[8] = a4;
  dispatch_async(global_queue, v13);
}

void __71__NSFileManager_getFileProviderServicesForItemAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSFileProviderService *v10;
  void *v11;
  NSObject *global_queue;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  }
  else
  {
    v2 = dispatch_group_create();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = *(void **)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v10 = -[NSFileProviderService initWithName:endpointCreatingProxy:requestFinishedGroup:]([NSFileProviderService alloc], "initWithName:endpointCreatingProxy:requestFinishedGroup:", v9, *(_QWORD *)(a1 + 48), v2);
          objc_msgSend(v3, "setObject:forKey:", v10, v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v6);
    }
    v11 = (void *)objc_msgSend(v3, "copy");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    global_queue = dispatch_get_global_queue(17, 2uLL);
    dispatch_group_notify(v2, global_queue, *(dispatch_block_t *)(a1 + 64));
    dispatch_release(v2);
  }
}

- (void)synchronouslyGetFileProviderServicesForItemAtURL:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSFileProviderService *v14;
  NSFileProviderService *v15;
  void *v16;
  NSObject *global_queue;
  void *v18;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: completionHandler is NULL"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v18);
  }
  if (qword_1ECD09820 != -1)
    dispatch_once(&qword_1ECD09820, &__block_literal_global_545);
  if (off_1ECD09808)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3052000000;
    v41 = __Block_byref_object_copy__3;
    v42 = __Block_byref_object_dispose__3;
    v43 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3052000000;
    v35 = __Block_byref_object_copy__3;
    v36 = __Block_byref_object_dispose__3;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3052000000;
    v29 = __Block_byref_object_copy__301;
    v30 = __Block_byref_object_dispose__302;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3052000000;
    v23 = __Block_byref_object_copy__3;
    v24 = __Block_byref_object_dispose__3;
    v25 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__NSFileManager_synchronouslyGetFileProviderServicesForItemAtURL_completionHandler___block_invoke;
    v19[3] = &unk_1E0F4E010;
    v19[4] = &v20;
    v19[5] = &v38;
    v19[6] = &v32;
    v19[7] = &v26;
    off_1ECD09808(a3, 1, v19);
    if (v21[5])
    {
      (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);

    }
    else
    {
      v6 = dispatch_group_create();
      v7 = objc_alloc(MEMORY[0x1E0C99E08]);
      v8 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend((id)v33[5], "count"));
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v9 = (void *)v33[5];
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v46 != v11)
              objc_enumerationMutation(v9);
            v13 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            v14 = [NSFileProviderService alloc];
            v15 = -[NSFileProviderService initWithName:endpointCreatingProxy:requestFinishedGroup:](v14, "initWithName:endpointCreatingProxy:requestFinishedGroup:", v13, v39[5], v6);
            objc_msgSend(v8, "setObject:forKey:", v15, v13);

          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
        }
        while (v10);
      }
      v16 = (void *)objc_msgSend(v8, "copy");
      (*((void (**)(id, void *, _QWORD))a4 + 2))(a4, v16, 0);

      global_queue = dispatch_get_global_queue(17, 2uLL);
      dispatch_group_notify(v6, global_queue, (dispatch_block_t)v27[5]);
      dispatch_release(v6);

    }
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, 0));
  }
}

id __84__NSFileManager_synchronouslyGetFileProviderServicesForItemAtURL_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id result;
  uint64_t v7;

  if (a5)
  {
    result = a5;
    v7 = a1[4];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = a2;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = a3;
    result = (id)objc_msgSend(a4, "copy");
    v7 = a1[7];
  }
  *(_QWORD *)(*(_QWORD *)(v7 + 8) + 40) = result;
  return result;
}

- (void)synchronouslyGetFileProviderServiceWithName:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5
{
  NSObject *v8;
  NSFileProviderService *v9;
  NSFileProviderService *v10;
  NSObject *global_queue;
  void *v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: completionHandler is NULL"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v12);
  }
  if (qword_1ECD09820 != -1)
    dispatch_once(&qword_1ECD09820, &__block_literal_global_545);
  if (off_1ECD09810)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3052000000;
    v29 = __Block_byref_object_copy__3;
    v30 = __Block_byref_object_dispose__3;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3052000000;
    v23 = __Block_byref_object_copy__301;
    v24 = __Block_byref_object_dispose__302;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3052000000;
    v17 = __Block_byref_object_copy__3;
    v18 = __Block_byref_object_dispose__3;
    v19 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __92__NSFileManager_synchronouslyGetFileProviderServiceWithName_forItemAtURL_completionHandler___block_invoke;
    v13[3] = &unk_1E0F4E038;
    v13[4] = &v14;
    v13[5] = &v26;
    v13[6] = &v20;
    off_1ECD09810(a4, a3, 1, v13);
    if (v15[5])
    {
      (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);

    }
    else
    {
      v8 = dispatch_group_create();
      v9 = [NSFileProviderService alloc];
      v10 = -[NSFileProviderService initWithName:endpointCreatingProxy:requestFinishedGroup:](v9, "initWithName:endpointCreatingProxy:requestFinishedGroup:", a3, v27[5], v8);
      (*((void (**)(id, NSFileProviderService *, _QWORD))a5 + 2))(a5, v10, 0);

      global_queue = dispatch_get_global_queue(17, 2uLL);
      dispatch_group_notify(v8, global_queue, (dispatch_block_t)v21[5]);
      dispatch_release(v8);

    }
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, NSError *))a5 + 2))(a5, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, 0));
  }
}

id __92__NSFileManager_synchronouslyGetFileProviderServiceWithName_forItemAtURL_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id result;
  uint64_t v6;

  if (a4)
  {
    result = a4;
    v6 = a1[4];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = a2;
    result = (id)objc_msgSend(a3, "copy");
    v6 = a1[6];
  }
  *(_QWORD *)(*(_QWORD *)(v6 + 8) + 40) = result;
  return result;
}

- (BOOL)_web_createFileAtPathWithIntermediateDirectories:(id)a3 contents:(id)a4 attributes:(id)a5 directoryAttributes:(id)a6
{
  _BOOL4 v11;

  if (-[NSFileManager createFileAtPath:contents:attributes:](self, "createFileAtPath:contents:attributes:"))
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v11 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(a3, "stringByDeletingLastPathComponent"), 1, a6, 0);
    if (v11)
      LOBYTE(v11) = -[NSFileManager createFileAtPath:contents:attributes:](self, "createFileAtPath:contents:attributes:", a3, a4, a5);
  }
  return v11;
}

- (BOOL)_web_changeFinderAttributes:(id)a3 forFileAtPath:(id)a4
{
  return 0;
}

- (BOOL)_web_createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5
{
  _BOOL4 v8;

  v8 = -[NSFileManager createFileAtPath:contents:attributes:](self, "createFileAtPath:contents:attributes:", a3, a4);
  if (v8)
    -[NSFileManager _web_changeFinderAttributes:forFileAtPath:](self, "_web_changeFinderAttributes:forFileAtPath:", a5, a3);
  return v8;
}

- (void)_performRemoveFileAtPath:(id)a3
{
  _CFAutoreleasePoolPush();
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", a3, 0);
  _CFAutoreleasePoolPop();
}

- (void)_web_backgroundRemoveFileAtPath:(id)a3
{
  std::__fs::filesystem::path *v5;
  const std::__fs::filesystem::path *v6;
  std::error_code *v7;
  int v8;
  int v9;
  void *v10;
  NSString *v11[2];

  v11[1] = *(NSString **)MEMORY[0x1E0C80C00];
  v10 = 0;
  v11[0] = 0;
  v9 = 0;
  if (_NSCreateTemporaryFile(a3, v11, &v9, &v10, 0))
  {
    v5 = (std::__fs::filesystem::path *)strdup(-[NSString fileSystemRepresentation](v11[0], "fileSystemRepresentation"));
    v6 = (const std::__fs::filesystem::path *)objc_msgSend(a3, "fileSystemRepresentation");
    close(v9);
    rename(v6, v5, v7);
    if (!v8)
    {
      v11[0] = -[NSFileManager stringWithFileSystemRepresentation:length:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "stringWithFileSystemRepresentation:length:", v5, strlen((const char *)v5));
      +[NSThread detachNewThreadSelector:toTarget:withObject:](NSThread, "detachNewThreadSelector:toTarget:withObject:", sel__performRemoveFileAtPath_, self, v11[0]);
    }
    free(v5);
    _NSCleanupTemporaryDirectory(v10);
  }
}

- (BOOL)_web_removeFileOnlyAtPath:(id)a3
{
  int v4;
  void *v5;
  statfs v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = unlink((const char *)objc_msgSend(a3, "fileSystemRepresentation"));
  memset(&v7.f_mntonname[392], 0, 32);
  if (!statfs((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0),
          &v7)
    && (v7.f_flags & 0x8000) == 0)
  {
    v5 = (void *)objc_msgSend(a3, "lastPathComponent");
    if (objc_msgSend(v5, "length"))
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("/")) & 1) == 0)
        v4 |= unlink((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingString:", objc_msgSend(CFSTR("._"), "stringByAppendingString:", v5)), "fileSystemRepresentation"));
    }
  }
  return v4 == 0;
}

- (void)_web_backgroundRemoveLeftoverFiles:(id)a3
{
  NSFileManager *v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v8;

  v5 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v6 = objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/.tmp%ld"), v6, 0);
  if (-[NSFileManager fileExistsAtPath:](v5, "fileExistsAtPath:", v7))
  {
    v8 = 1;
    do
    {
      +[NSThread detachNewThreadSelector:toTarget:withObject:](NSThread, "detachNewThreadSelector:toTarget:withObject:", sel__performRemoveFileAtPath_, self, v7);
      v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/.tmp%ld"), v6, v8++);
    }
    while (-[NSFileManager fileExistsAtPath:](v5, "fileExistsAtPath:", v7));
  }
}

- (id)_web_visibleItemsInDirectoryAtPath:(id)a3
{
  return -[NSFileManager contentsOfDirectoryAtPath:error:](self, "contentsOfDirectoryAtPath:error:", a3, 0);
}

- (id)_web_pathWithUniqueFilenameForPath:(id)a3
{
  void *v3;
  NSFileManager *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "_web_filenameByFixingIllegalCharacters"));
  v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (!-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", v3))
    return v3;
  v5 = (void *)objc_msgSend(v3, "lastPathComponent");
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("."));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v9 = v6;
    v7 = (void *)objc_msgSend(v5, "substringFromIndex:", v6 + 1);
    v3 = (void *)objc_msgSend((id)objc_msgSend(v3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend(v5, "substringToIndex:", v9));
  }
  v10 = 1;
  do
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%ld"), v3, v10);
    if (objc_msgSend(v7, "length"))
      v8 = -[NSString stringByAppendingPathExtension:](v8, "stringByAppendingPathExtension:", v7);
    ++v10;
  }
  while (-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", v8));
  return v8;
}

- (BOOL)_web_fileExistsAtPath_nowarn:(id)a3 isDirectory:(BOOL *)a4 traverseLink:(BOOL)a5
{
  NSString *v8;
  uint64_t v9;
  id v10;
  NSDictionary *v11;
  int v12;

  if (a5)
  {
    if (a4)
      *a4 = 0;
    v8 = -[NSFileManager destinationOfSymbolicLinkAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "destinationOfSymbolicLinkAtPath:error:", a3, 0);
    v9 = (uint64_t)v8;
    if (v8 && !-[NSString isAbsolutePath](v8, "isAbsolutePath"))
      v9 = objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", v9);
    if (v9)
      v10 = (id)v9;
    else
      v10 = a3;
    v11 = -[NSFileManager attributesOfItemAtPath:error:](self, "attributesOfItemAtPath:error:", v10, 0);
    if (v11)
    {
      v12 = objc_msgSend(-[NSDictionary objectForKey:](v11, "objectForKey:", CFSTR("NSFileType")), "isEqualToString:", CFSTR("NSFileTypeDirectory"));
      LOBYTE(v11) = 1;
      if (a4)
      {
        if (v12)
          *a4 = 1;
      }
    }
  }
  else
  {
    LOBYTE(v11) = -[NSFileManager fileExistsAtPath:isDirectory:](self, "fileExistsAtPath:isDirectory:", a3, a4);
  }
  return (char)v11;
}

- (id)_web_carbonPathForPath_nowarn:(id)a3
{
  return 0;
}

- (id)_web_startupVolumeName_nowarn
{
  id v2;

  v2 = -[NSFileManager _web_carbonPathForPath_nowarn:](self, "_web_carbonPathForPath_nowarn:", CFSTR("/"));
  return (id)objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);
}

- (BOOL)_web_createIntermediateDirectoriesForPath_nowarn:(id)a3 attributes:(id)a4
{
  BOOL v7;
  id v8;
  NSMutableString *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a3, "length") && objc_msgSend(a3, "isAbsolutePath"))
  {
    v15 = 0;
    if (-[NSFileManager _web_fileExistsAtPath_nowarn:isDirectory:traverseLink:](self, "_web_fileExistsAtPath_nowarn:isDirectory:traverseLink:", objc_msgSend(a3, "stringByDeletingLastPathComponent"), &v15, 1))
    {
      return v15 != 0;
    }
    else
    {
      v8 = a3;
      while ((objc_msgSend(v8, "isEqualToString:", CFSTR("/")) & 1) == 0)
      {
        v8 = (id)objc_msgSend(v8, "stringByDeletingLastPathComponent");
        if (-[NSFileManager _web_fileExistsAtPath_nowarn:isDirectory:traverseLink:](self, "_web_fileExistsAtPath_nowarn:isDirectory:traverseLink:", v8, &v15, 1))
        {
          if (!v15)
            return 0;
          break;
        }
      }
      v9 = -[NSMutableString initWithCapacity:]([NSMutableString alloc], "initWithCapacity:", objc_msgSend(a3, "length"));
      v10 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
      v11 = objc_msgSend(v10, "count");
      v12 = 0;
      v13 = v11 - 1;
      if (v11 != 1)
      {
        while (!-[NSString isEqualToString:](v9, "isEqualToString:", v8))
        {
          if (v12)
            -[NSMutableString appendString:](v9, "appendString:", CFSTR("/"));
          -[NSMutableString appendString:](v9, "appendString:", objc_msgSend(v10, "objectAtIndex:", v12++));
          if (v13 == v12)
            goto LABEL_29;
        }
      }
      if (v12 >= v13)
      {
LABEL_29:
        v7 = 1;
      }
      else
      {
        v7 = 0;
        do
        {
          while (!objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v12), "length"))
            ;
          if (v12)
            -[NSMutableString appendString:](v9, "appendString:", CFSTR("/"));
          -[NSMutableString appendString:](v9, "appendString:", objc_msgSend(v10, "objectAtIndex:", v12));
          if (-[NSFileManager _web_fileExistsAtPath_nowarn:isDirectory:traverseLink:](self, "_web_fileExistsAtPath_nowarn:isDirectory:traverseLink:", v9, &v15, 1))
          {
            if (!v15)
              break;
          }
          else if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 0, a4, 0))
          {
            break;
          }
          v7 = ++v12 >= v13;
        }
        while (v12 != v13);
      }

    }
  }
  else
  {
    return 0;
  }
  return v7;
}

- (BOOL)_web_changeFileAttributes_nowarn:(id)a3 atPath:(id)a4
{
  BOOL v7;

  v7 = -[NSFileManager setAttributes:ofItemAtPath:error:](self, "setAttributes:ofItemAtPath:error:", a3, a4, 0);
  return -[NSFileManager _web_changeFinderAttributes:forFileAtPath:](self, "_web_changeFinderAttributes:forFileAtPath:", a3, a4)&& v7;
}

@end
