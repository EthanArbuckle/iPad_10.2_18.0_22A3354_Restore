@implementation NSFileVersion

+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  return (id)objc_msgSend(a1, "_otherVersionsOfItemAtURL:temporaryStorageIdentifier:withoutOptions:", a3, a4, 0);
}

+ (NSArray)otherVersionsOfItemAtURL:(NSURL *)url
{
  return (NSArray *)objc_msgSend(a1, "_otherVersionsOfItemAtURL:temporaryStorageIdentifier:", url, 0);
}

+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 withoutOptions:(unint64_t)a5
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  __int128 v21;
  void *v23;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v23 = (void *)objc_msgSend(a1, "_existingLibraryForURL:temporaryStorageIdentifier:", a3, a4);
  if (!v23)
    return (id)MEMORY[0x1E0C9AA60];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = objc_msgSend(&unk_1E0FCEBF0, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v36;
    *(_QWORD *)&v8 = 138412546;
    v21 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(&unk_1E0FCEBF0);
        v12 = (void *)objc_msgSend(v23, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v11), 0, a5, 0, v21);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v31 != v15)
                objc_enumerationMutation(v12);
              v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAddition:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
              objc_msgSend(v6, "addObject:", v17);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
          }
          while (v14);
        }
        if (objc_msgSend(v12, "error"))
        {
          v18 = _NSOSLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = objc_msgSend(v12, "error");
            *(_DWORD *)buf = v21;
            v26 = a3;
            v27 = 2112;
            v28 = v19;
            _os_log_error_impl(&dword_1817D9000, v18, OS_LOG_TYPE_ERROR, "Enumeration of versions for %@ failed. Here's the error:\n%@", buf, 0x16u);
          }
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(&unk_1E0FCEBF0, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v9);
  }
  return v6;
}

+ (id)_existingLibraryForURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  void *v5;

  if (!a4)
    return (id)objc_msgSend((id)gsDefaultStorageManager(), "permanentStorageForItemAtURL:allocateIfNone:error:", a3, 0, 0);
  v5 = (void *)objc_msgSend(a1, "_temporaryStorageLocationForIdentifier:", a4);
  if (objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0))
    return (id)objc_msgSend((id)gsDefaultStorageManager(), "temporaryStorageForItemAtURL:locatedAtURL:error:", a3, v5, 0);
  else
    return 0;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("hasThumbnail")))
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("_nonLocalVersion.hasThumbnail"));
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NSFileVersion;
  return objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingValueForKey_, a3);
}

- (NSFileVersion)init
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[NSFileVersion init]: You have to use one of the factory methods to instantiate NSFileVersion."), 0));
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileVersion;
  -[NSFileVersion dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[NSFileVersion persistentIdentifier](self, "persistentIdentifier"), "isEqual:", objc_msgSend(a3, "persistentIdentifier"));
  return 0;
}

- (unint64_t)hash
{
  return objc_msgSend(-[NSFileVersion persistentIdentifier](self, "persistentIdentifier"), "hash");
}

- (id)description
{
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_nonLocalVersion)
  {
    v8.receiver = self;
    v8.super_class = (Class)NSFileVersion;
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ type:NonLocal forURL:'%@', %@"), -[NSFileVersion description](&v8, sel_description), -[NSURL path](self->_fileURL, "path"), self->_nonLocalVersion, v5, v6);
  }
  else
  {
    if (self->_isBackup)
    {
      v4 = CFSTR("Backup");
    }
    else if (self->_deadVersionIdentifier)
    {
      v4 = CFSTR("Dead");
    }
    else if (-[NSFileVersion isConflict](self, "isConflict"))
    {
      v4 = CFSTR("Conflict");
    }
    else
    {
      v4 = CFSTR("Local");
    }
    v7.receiver = self;
    v7.super_class = (Class)NSFileVersion;
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ type:%@ forURL:'%@' contentsURL:'%@' name:'%@'"), -[NSFileVersion description](&v7, sel_description), v4, -[NSURL path](self->_fileURL, "path"), -[NSURL path](self->_contentsURL, "path"), self->_localizedName);
  }
}

+ (NSFileVersion)currentVersionOfItemAtURL:(NSURL *)url
{
  if (-[NSURL checkResourceIsReachableAndReturnError:](url, "checkResourceIsReachableAndReturnError:", 0))
    return (NSFileVersion *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithFileURL:library:clientID:name:contentsURL:isBackup:revision:", url, 0, 0, 0, url, 0, 0);
  else
    return 0;
}

+ (void)getNonlocalVersionsOfItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  objc_msgSend(a1, "getNonlocalVersionsOfItemAtURL:options:completionHandler:", url, 0, completionHandler);
}

+ (NSFileVersion)versionOfItemAtURL:(NSURL *)url forPersistentIdentifier:(id)persistentIdentifier
{
  return (NSFileVersion *)objc_msgSend(a1, "_versionOfItemAtURL:forPersistentIdentifier:temporaryStorageIdentifier:", url, persistentIdentifier, 0);
}

+ (NSFileVersion)addVersionOfItemAtURL:(NSURL *)url withContentsOfURL:(NSURL *)contentsURL options:(NSFileVersionAddingOptions)options error:(NSError *)outError
{
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NSFileVersion;
  objc_msgSendSuper2(&v7, sel_doesNotRecognizeSelector_, a2, contentsURL, options, outError);
  return 0;
}

+ (NSURL)temporaryDirectoryURLForNewVersionOfItemAtURL:(NSURL *)url
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSFileVersion;
  objc_msgSendSuper2(&v4, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

+ (NSArray)unresolvedConflictVersionsOfItemAtURL:(NSURL *)url
{
  uint64_t v5;
  _BOOL4 v6;
  NSArray *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v5 = *MEMORY[0x1E0C99B10];
  -[NSURL removeCachedResourceValueForKey:](url, "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99B10]);
  v6 = -[NSURL getResourceValue:forKey:error:](url, "getResourceValue:forKey:error:", &v17, v5, 0);
  v7 = 0;
  if (v6)
  {
    if (objc_msgSend(v17, "BOOLValue"))
    {
      v8 = (void *)objc_msgSend((id)gsDefaultStorageManager(), "permanentStorageForItemAtURL:allocateIfNone:error:", url, 0, 0);
      v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", CFSTR("com.apple.ubiquity"), 0, 0, 0), "allObjects");
      v10 = (void *)objc_msgSend((id)objc_msgSend(v8, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", CFSTR("com.apple.FileProvider.conflict"), 0, 0, 0), "allObjects");
      if (v9)
        v10 = (void *)objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
      if (v10)
      {
        v7 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAddition:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
              -[NSArray addObject:](v7, "addObject:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
          }
          while (v12);
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return (NSArray *)MEMORY[0x1E0C9AA60];
    }
  }
  return v7;
}

- (NSURL)URL
{
  _BOOL4 v3;
  NSURL *contentsURL;

  v3 = -[NSURL isFileReferenceURL](self->_contentsURL, "isFileReferenceURL");
  contentsURL = self->_contentsURL;
  if (v3)
    return -[NSURL filePathURL](contentsURL, "filePathURL");
  else
    return contentsURL;
}

- (NSString)originalPOSIXName
{
  if (self->_addition)
    return (NSString *)-[GSAddition originalPOSIXName](self->_addition, "originalPOSIXName");
  if (self->_nonLocalVersion || self->_isBackup || self->_deadVersionIdentifier)
    return 0;
  return -[NSURL lastPathComponent](self->_contentsURL, "lastPathComponent");
}

- (NSString)localizedName
{
  NSString *result;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  result = self->_localizedName;
  v4[0] = result;
  if (!result)
  {
    -[NSURL getResourceValue:forKey:error:](self->_contentsURL, "getResourceValue:forKey:error:", v4, *MEMORY[0x1E0C99A70], 0);
    return (NSString *)v4[0];
  }
  return result;
}

- (NSString)localizedNameOfSavingComputer
{
  id nonLocalVersion;
  NSString *result;

  nonLocalVersion = self->_nonLocalVersion;
  if (nonLocalVersion)
    return (NSString *)objc_msgSend(nonLocalVersion, "lastEditorDeviceName");
  if (!-[NSFileVersion isConflict](self, "isConflict")
    && !-[NSFileManager isUbiquitousItemAtURL:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isUbiquitousItemAtURL:", self->_contentsURL))
  {
    return 0;
  }
  if (qword_1ECD0A818 != -1)
    dispatch_once(&qword_1ECD0A818, &__block_literal_global_235);
  result = (NSString *)-[GSAddition fp_lastEditorDeviceName](self->_addition, "fp_lastEditorDeviceName");
  if (!result)
    return (NSString *)-[NSURL fp_lastEditorDeviceName](self->_contentsURL, "fp_lastEditorDeviceName");
  return result;
}

- (NSString)originatorName
{
  return (NSString *)objc_msgSend(self->_nonLocalVersion, "lastEditorFormattedName");
}

- (NSPersonNameComponents)originatorNameComponents
{
  id nonLocalVersion;
  NSPersonNameComponents *result;

  nonLocalVersion = self->_nonLocalVersion;
  if (nonLocalVersion)
    return (NSPersonNameComponents *)objc_msgSend(nonLocalVersion, "lastEditorNameComponents");
  if (!-[NSFileVersion isConflict](self, "isConflict")
    && !-[NSFileManager isUbiquitousItemAtURL:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isUbiquitousItemAtURL:", self->_contentsURL))
  {
    return 0;
  }
  if (qword_1ECD0A818 != -1)
    dispatch_once(&qword_1ECD0A818, &__block_literal_global_235);
  result = (NSPersonNameComponents *)-[GSAddition fp_lastEditorNameComponents](self->_addition, "fp_lastEditorNameComponents");
  if (!result)
    return (NSPersonNameComponents *)-[NSURL fp_lastEditorNameComponents](self->_contentsURL, "fp_lastEditorNameComponents");
  return result;
}

- (NSDate)modificationDate
{
  NSDate *result;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  result = self->_modificationDate;
  v4[0] = result;
  if (!result)
  {
    -[NSURL getResourceValue:forKey:error:](self->_contentsURL, "getResourceValue:forKey:error:", v4, *MEMORY[0x1E0C998D8], 0);
    return (NSDate *)v4[0];
  }
  return result;
}

- (unint64_t)size
{
  id nonLocalVersion;

  nonLocalVersion = self->_nonLocalVersion;
  if (nonLocalVersion)
    return objc_msgSend(nonLocalVersion, "size");
  if (self->_addition && (objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend((id)-[GSAddition performSelector:](self->_addition, "performSelector:", sel_size), "unsignedLongLongValue");
  return 0;
}

- (id)persistentIdentifier
{
  void *addition;
  id v4;

  if (self->_addition)
  {
    addition = self->_addition;
    return (id)objc_msgSend(addition, "persistentIdentifier");
  }
  if (self->_deadVersionIdentifier)
    return self->_deadVersionIdentifier;
  if (self->_isBackup)
  {
    v4 = -[NSURL path](self->_contentsURL, "path");
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v4, CFSTR("path"), 0);
  }
  else
  {
    addition = self->_nonLocalVersion;
    if (addition)
      return (id)objc_msgSend(addition, "persistentIdentifier");
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  }
}

- (BOOL)isConflict
{
  if ((objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", CFSTR("com.apple.ubiquity")) & 1) != 0|| (objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", CFSTR("com.apple.FileProvider.conflict")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[GSAddition isSavedConflict](self->_addition, "isSavedConflict");
  }
}

- (BOOL)isUbiquitous
{
  return self->_nonLocalVersion != 0;
}

- (BOOL)hasLocalContents
{
  return self->_nonLocalVersion == 0;
}

- (BOOL)hasThumbnail
{
  return objc_msgSend(self->_nonLocalVersion, "hasThumbnail");
}

- (NSString)etag
{
  return (NSString *)objc_msgSend(self->_nonLocalVersion, "etag");
}

- (void)setResolved:(BOOL)resolved
{
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!resolved)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("-[NSFileVersion setResolved:]: You can't make a conflict version unresolved once it's been resolved."), 0));
  if ((objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", CFSTR("com.apple.ubiquity")) & 1) != 0|| objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", CFSTR("com.apple.FileProvider.conflict")))
  {
    if (qword_1ECD0A818 != -1)
      dispatch_once(&qword_1ECD0A818, &__block_literal_global_235);
    v5 = 0;
    if ((-[GSAddition fp_markResolvedWithError:](self->_addition, "fp_markResolvedWithError:", &v5) & 1) == 0)
    {
      v4 = _NSOSLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v7 = v5;
        _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "-[NSFileVersion setResolved:] tried but failed. The error is:\n%@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)isResolved
{
  return -[GSAddition isSavedConflict](self->_addition, "isSavedConflict");
}

- (NSURL)replaceItemAtURL:(NSURL *)url options:(NSFileVersionReplacingOptions)options error:(NSError *)error
{
  NSURL *v7;
  GSAddition *addition;
  NSURL *v10;
  Class v11;
  NSObject *v12;
  void *v13;
  NSFileWrapper *v14;
  BOOL v15;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = url;
  v22 = *MEMORY[0x1E0C80C00];
  addition = self->_addition;
  if (addition)
  {
    v10 = (NSURL *)-[GSAddition replaceItemAtURL:error:](addition, "replaceItemAtURL:error:", url, error);
    if (v10)
    {
      if (replaceItemAtURL_options_error__onceToken != -1)
        dispatch_once(&replaceItemAtURL_options_error__onceToken, &__block_literal_global_81);
      v11 = objc_lookUpClass("QLThumbnailAddition");
      if (v11)
        -[objc_class associateThumbnailsForDocumentAtURL:withDocumentAtURL:error:](v11, "associateThumbnailsForDocumentAtURL:withDocumentAtURL:error:", -[NSFileVersion URL](self, "URL", 0, v22), v10, &v21);
      if ((options & 1) != 0 && !-[NSFileVersion removeAndReturnError:](self, "removeAndReturnError:", 0))
      {
        v12 = _NSOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21) = 0;
          _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "-[NSFileVersion replaceItemAtURL:options:error:] failed to remove the version that it replaced a file with.", (uint8_t *)&v21, 2u);
        }
      }
      goto LABEL_19;
    }
    return v10;
  }
  if (!self->_nonLocalVersion)
  {
    if (self->_isBackup)
    {
      if ((options & 1) == 0)
      {
        v14 = -[NSFileWrapper initWithURL:options:error:]([NSFileWrapper alloc], "initWithURL:options:error:", self->_contentsURL, 0, error);
        v10 = (NSURL *)v14;
        if (!v14)
          return v10;
        v15 = -[NSFileWrapper writeToURL:options:originalContentsURL:error:](v14, "writeToURL:options:originalContentsURL:error:", v7, 1, 0, error);

        v10 = 0;
        if (!v15)
          return v10;
        goto LABEL_18;
      }
      v18 = (void *)MEMORY[0x1E0C99DA0];
      v19 = *MEMORY[0x1E0C99750];
      v20 = CFSTR("-[NSFileVersion replaceItemAtURL:options:error:]: NSFileVersionReplacingByMoving with this kind of version isn't supported.");
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0C99DA0];
      v19 = *MEMORY[0x1E0C99750];
      v20 = CFSTR("-[NSFileVersion replaceItemAtURL:options:error:]: You can't use it with current versions.");
    }
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0));
  }
  v13 = (void *)objc_msgSend((id)objc_opt_class(), "versionOfItemAtURL:forPersistentIdentifier:", self->_fileURL, objc_msgSend(self->_nonLocalVersion, "persistentIdentifier"));
  if (!v13)
  {
    v17 = _NSOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_1817D9000, v17, OS_LOG_TYPE_ERROR, "-[NSFileVersion replaceItemAtURL:optionsError:] for a non-local NSFileVersion failed. Did you forget a coordinated read?", (uint8_t *)&v21, 2u);
      if (error)
        goto LABEL_23;
    }
    else if (error)
    {
LABEL_23:
      v10 = 0;
      *error = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4, 0);
      return v10;
    }
    return 0;
  }
  v7 = (NSURL *)objc_msgSend(v13, "replaceItemAtURL:options:error:", v7, options, error);
LABEL_18:
  v10 = v7;
  if (v7)
LABEL_19:
    CFURLClearResourcePropertyCache((CFURLRef)v10);
  return v10;
}

void *__48__NSFileVersion_replaceItemAtURL_options_error___block_invoke()
{
  return dlopen("/System/Library/PrivateFrameworks/QuickLookThumbnailing.framework/QuickLookThumbnailing", 256);
}

- (BOOL)removeAndReturnError:(NSError *)outError
{
  GSAddition *addition;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  id nonLocalVersion;
  _BOOL4 v14;
  _QWORD v16[6];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  addition = self->_addition;
  if (!addition)
  {
    if (self->_isBackup)
    {
      v11 = _NSOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v12 = "-[NSFileVersion removeAndReturnError:]: You can't use it with a backup version.";
        goto LABEL_23;
      }
LABEL_20:
      if (!outError)
        return 0;
LABEL_21:
      v10 = 0;
      *outError = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 512, 0);
      return v10;
    }
    nonLocalVersion = self->_nonLocalVersion;
    v11 = _NSOSLog();
    v14 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (nonLocalVersion)
    {
      if (!v14)
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v12 = "-[NSFileVersion removeAndReturnError:]: You can't use it with a non-local version.";
    }
    else
    {
      if (!v14)
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v12 = "-[NSFileVersion removeAndReturnError:]: You can't use it with a current version.";
    }
LABEL_23:
    _os_log_error_impl(&dword_1817D9000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    if (!outError)
      return 0;
    goto LABEL_21;
  }
  if ((objc_msgSend((id)-[GSAddition nameSpace](addition, "nameSpace"), "isEqualToString:", CFSTR("com.apple.ubiquity")) & 1) != 0|| objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", CFSTR("com.apple.FileProvider.conflict")))
  {
    if (qword_1ECD0A818 != -1)
      dispatch_once(&qword_1ECD0A818, &__block_literal_global_235);
    if (!-[GSAddition fp_markResolvedWithError:](self->_addition, "fp_markResolvedWithError:", outError))
      return 0;
  }
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__30;
  v21 = __Block_byref_object_dispose__30;
  v22 = 0;
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)-[GSAddition storage](self->_addition, "storage");
  v23[0] = self->_addition;
  v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __38__NSFileVersion_removeAndReturnError___block_invoke;
  v16[3] = &unk_1E0F55068;
  v16[4] = v6;
  v16[5] = buf;
  objc_msgSend(v7, "removeAdditions:completionHandler:", v8, v16);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v6);
  v9 = (void *)*((_QWORD *)v18 + 5);
  v10 = v9 == 0;
  if (v9)
  {
    if (outError)
      *outError = (NSError *)v9;
    else

  }
  else
  {
    +[NSFileCoordinator __itemAtURL:didLoseVersionWithClientID:name:purposeID:](NSFileCoordinator, "__itemAtURL:didLoseVersionWithClientID:name:purposeID:", self->_fileURL, -[GSAddition nameSpace](self->_addition, "nameSpace"), -[GSAddition name](self->_addition, "name"), 0);
  }
  _Block_object_dispose(buf, 8);
  return v10;
}

intptr_t __38__NSFileVersion_removeAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!a3)
    a3 = (void *)objc_msgSend((id)objc_msgSend(a2, "objectEnumerator"), "nextObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)removeOtherVersionsOfItemAtURL:(NSURL *)url error:(NSError *)outError
{
  return objc_msgSend(a1, "_removeOtherVersionsOfItemAtURL:temporaryStorageIdentifier:error:", url, 0, outError);
}

- (BOOL)isDiscardable
{
  return self->_discardable;
}

- (void)setDiscardable:(BOOL)discardable
{
  self->_discardable = discardable;
}

- (id)_initWithFileURL:(id)a3 library:(id)a4 clientID:(id)a5 name:(id)a6 contentsURL:(id)a7 isBackup:(BOOL)a8 revision:(id)a9
{
  NSFileVersion *v15;
  void *v16;
  id v17;
  id v19;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NSFileVersion;
  v15 = -[NSFileVersion init](&v20, sel_init);
  if (v15)
  {
    v15->_fileURL = (NSURL *)objc_msgSend(a3, "copy");
    v15->_contentsURL = (NSURL *)objc_msgSend(a7, "copy");
    v15->_isBackup = a8;
    v15->_name = (NSString *)objc_msgSend(a6, "copy");
    if (a4)
    {
      v16 = (void *)objc_msgSend((id)gsDefaultStorageManager(), "persistentIdentifierInStorage:forAdditionNamed:inNameSpace:", a4, a6, a5);
      v15->_deadVersionIdentifier = v16;
      v17 = v16;
    }
    if (v15->_isBackup)
    {
      v19 = 0;
      if (-[NSURL getResourceValue:forKey:error:](v15->_contentsURL, "getResourceValue:forKey:error:", &v19, *MEMORY[0x1E0C99A70], 0))
      {
        v15->_localizedName = (NSString *)objc_msgSend(v19, "copy");
      }
      if (v15->_isBackup)
      {
        v19 = 0;
        if (-[NSURL getResourceValue:forKey:error:](v15->_contentsURL, "getResourceValue:forKey:error:", &v19, *MEMORY[0x1E0C998D8], 0))
        {
          v15->_modificationDate = (NSDate *)objc_msgSend(v19, "copy");
        }
      }
    }
  }
  return v15;
}

- (id)_initWithAddition:(id)a3
{
  NSFileVersion *v4;
  GSAddition *v5;
  NSString *v6;
  NSDate *v7;
  id v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSFileVersion;
  v4 = -[NSFileVersion init](&v10, sel_init);
  if (v4)
  {
    v5 = (GSAddition *)a3;
    v4->_addition = v5;
    v4->_fileURL = (NSURL *)objc_msgSend((id)objc_msgSend((id)-[GSAddition storage](v5, "storage"), "documentURL"), "copy");
    v4->_contentsURL = (NSURL *)(id)-[GSAddition url](v4->_addition, "url");
    v4->_isBackup = 0;
    v6 = (NSString *)(id)-[GSAddition displayName](v4->_addition, "displayName");
    v4->_localizedName = v6;
    if (!v6)
    {
      v9 = 0;
      if (-[NSURL getResourceValue:forKey:error:](v4->_fileURL, "getResourceValue:forKey:error:", &v9, *MEMORY[0x1E0C99A70], 0))
      {
        v4->_localizedName = (NSString *)objc_msgSend(v9, "copy");
      }
    }
    v7 = (NSDate *)(id)objc_msgSend(-[NSFileVersion _documentInfo](v4, "_documentInfo"), "objectForKey:", CFSTR("modificationDate"));
    v4->_modificationDate = v7;
    if (!v7)
    {
      v9 = 0;
      if (-[NSURL getResourceValue:forKey:error:](v4->_contentsURL, "getResourceValue:forKey:error:", &v9, *MEMORY[0x1E0C998D8], 0))
      {
        v4->_modificationDate = (NSDate *)objc_msgSend(v9, "copy");
      }
    }
  }
  return v4;
}

- (id)_initWithFileURL:(id)a3 nonLocalVersion:(id)a4
{
  NSFileVersion *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSFileVersion;
  v6 = -[NSFileVersion init](&v8, sel_init);
  if (v6)
  {
    v6->_nonLocalVersion = a4;
    v6->_fileURL = (NSURL *)objc_msgSend(a3, "copy");
    v6->_contentsURL = (NSURL *)objc_msgSend((id)objc_msgSend(a4, "url"), "copy");
    v6->_localizedName = (NSString *)objc_msgSend((id)objc_msgSend(a4, "displayName"), "copy");
    v6->_modificationDate = (NSDate *)objc_msgSend((id)objc_msgSend(a4, "modificationDate"), "copy");
    v6->_isBackup = 0;
  }
  return v6;
}

- (id)_initWithFileURL:(id)a3 fileVersion:(id)a4
{
  NSFileVersion *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSFileVersion;
  v6 = -[NSFileVersion init](&v8, sel_init);
  if (v6)
  {
    v6->_nonLocalVersion = a4;
    v6->_fileURL = (NSURL *)objc_msgSend(a3, "copy");
    v6->_contentsURL = (NSURL *)objc_msgSend((id)objc_msgSend(a4, "url"), "copy");
    v6->_localizedName = (NSString *)objc_msgSend((id)objc_msgSend(a4, "displayName"), "copy");
    v6->_modificationDate = (NSDate *)objc_msgSend((id)objc_msgSend(a4, "modificationDate"), "copy");
    v6->_isBackup = 0;
  }
  return v6;
}

+ (void)getNonlocalVersionsOfItemFromBRAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  char v6;
  objc_class *v8;
  void *v9;
  void *v10;
  NSOperationQueue *v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[7];

  v6 = a4;
  v14[6] = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A820 != -1)
    dispatch_once(&qword_1ECD0A820, &__block_literal_global_244);
  v8 = objc_lookUpClass("BRListNonLocalVersionsOperation");
  if (v8)
  {
    v9 = (void *)objc_msgSend([v8 alloc], "initWithDocumentURL:", a3);
    v10 = v9;
    if ((v6 & 1) != 0)
      objc_msgSend(v9, "setIncludeCachedVersions:", 1);
    v11 = objc_alloc_init(NSOperationQueue);
    -[NSOperationQueue setName:](v11, "setName:", CFSTR("NSFileVersion Non-Local Version Fetching Queue"));
    v12 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromBRAtURL_options_completionHandler___block_invoke;
    v14[3] = &unk_1E0F55090;
    v14[4] = a3;
    v14[5] = a5;
    objc_msgSend(v10, "setFetchingVersionsDoneBlock:", v14);
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromBRAtURL_options_completionHandler___block_invoke_140;
    v13[3] = &unk_1E0F4D2D8;
    v13[4] = v11;
    objc_msgSend(v10, "setCompletionBlock:", v13);
    -[NSOperationQueue addOperation:](v11, "addOperation:", v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, NSError *))a5 + 2))(a5, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, 0));
  }
}

uint64_t __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromBRAtURL_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t (*v8)(void);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  if (a3)
  {
    v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = a3;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "Fetch error occurred: %@", buf, 0xCu);
    }
    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v9 = (void *)v6;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(a2);
          v14 = -[NSFileVersion _initWithFileURL:nonLocalVersion:]([NSFileVersion alloc], "_initWithFileURL:nonLocalVersion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (v14)
          {
            v15 = v14;
            objc_msgSend(v9, "addObject:", v14);

          }
        }
        v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      }
      while (v11);
    }
    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v8();
}

void __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromBRAtURL_options_completionHandler___block_invoke_140(uint64_t a1)
{

}

+ (void)getNonlocalVersionsOfItemFromFPAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  char v6;
  objc_class *v8;
  void *v9;
  void *v10;
  NSOperationQueue *v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[7];

  v6 = a4;
  v14[6] = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A818 != -1)
    dispatch_once(&qword_1ECD0A818, &__block_literal_global_235);
  if (qword_1ECD0A810 && (v8 = objc_lookUpClass("FPListRemoteVersionsOperation")) != 0)
  {
    v9 = (void *)objc_msgSend([v8 alloc], "initWithDocumentURL:", a3);
    v10 = v9;
    if ((v6 & 1) != 0)
      objc_msgSend(v9, "setIncludeCachedVersions:", 1);
    v11 = objc_alloc_init(NSOperationQueue);
    -[NSOperationQueue setName:](v11, "setName:", CFSTR("NSFileVersion Non-Local Version Fetching Queue"));
    v12 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromFPAtURL_options_completionHandler___block_invoke;
    v14[3] = &unk_1E0F55090;
    v14[4] = a3;
    v14[5] = a5;
    objc_msgSend(v10, "setFinishedBlock:", v14);
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromFPAtURL_options_completionHandler___block_invoke_142;
    v13[3] = &unk_1E0F4D2D8;
    v13[4] = v11;
    objc_msgSend(v10, "setCompletionBlock:", v13);
    -[NSOperationQueue addOperation:](v11, "addOperation:", v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, NSError *))a5 + 2))(a5, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, 0));
  }
}

uint64_t __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromFPAtURL_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t (*v8)(void);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  if (a3)
  {
    v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = a3;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "Fetch error occurred: %@", buf, 0xCu);
    }
    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v9 = (void *)v6;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(a2);
          v14 = -[NSFileVersion _initWithFileURL:fileVersion:]([NSFileVersion alloc], "_initWithFileURL:fileVersion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (v14)
          {
            v15 = v14;
            objc_msgSend(v9, "addObject:", v14);

          }
        }
        v11 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      }
      while (v11);
    }
    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v8();
}

void __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromFPAtURL_options_completionHandler___block_invoke_142(uint64_t a1)
{

}

+ (void)getNonlocalVersionsOfItemAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  +[NSFileVersion getNonlocalVersionsOfItemFromFPAtURL:options:completionHandler:](NSFileVersion, "getNonlocalVersionsOfItemFromFPAtURL:options:completionHandler:", a3, a4, a5);
}

+ (id)_autosaveDirectoryURLCreateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  NSURL *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v4 = -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 11, 1, 0, a3, &v8);
  if (v4)
    v5 = 1;
  else
    v5 = !v3;
  if (!v5)
  {
    v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "NSFileVersions's invocation of -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:] returned nil for NSAutosavedInformationDirectory. Here's the error:\n%@", buf, 0xCu);
    }
  }
  return v4;
}

+ (id)_temporaryStorageLocationForIdentifier:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_autosaveDirectoryURLCreateIfNecessary:", 1), "URLByAppendingPathComponent:", objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("genstore.noindex")));
}

+ (id)_supportedGenerationalStorageClientIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.documentVersions"), CFSTR("com.apple.ubiquity"), CFSTR("com.apple.FileProvider.conflict"), 0);
}

+ (BOOL)_isTemporaryStorageRequiredForGSError:(id)a3 andURL:(id)a4
{
  void *v6;

  if (a3
    && (v6 = (void *)objc_msgSend(a3, "domain"), objc_msgSend(v6, "isEqualToString:", _MergedGlobals_150))
    && objc_msgSend(a3, "code") != 5
    && objc_msgSend(a3, "code") == 2)
  {
    return objc_msgSend(a4, "checkResourceIsReachableAndReturnError:", 0);
  }
  else
  {
    return 1;
  }
}

+ (id)_makePermanentStorageLibraryForURL:(id)a3 temporaryStorageRequired:(BOOL *)a4 error:(id *)a5
{
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v9 = objc_msgSend((id)gsDefaultStorageManager(), "permanentStorageForItemAtURL:allocateIfNone:error:", a3, 1, v12);
  v10 = (void *)v9;
  if (a4)
  {
    if (!v9)
    {
      *a4 = objc_msgSend(a1, "_isTemporaryStorageRequiredForGSError:andURL:", v12[0], a3);
      if (a5)
        *a5 = (id)v12[0];
    }
  }
  return v10;
}

+ (id)_makeTemporaryStorageIdentifier
{
  const __CFUUID *v2;
  const __CFString *v3;

  v2 = CFUUIDCreate(0);
  v3 = (id)CFUUIDCreateString(0, v2);
  CFRelease(v2);
  return (id)v3;
}

+ (BOOL)_permanentVersionStorageSupportedForURL:(id)a3 temporaryStorageIdentifier:(id *)a4 error:(id *)a5
{
  char v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v9 = objc_msgSend((id)gsDefaultStorageManager(), "isPermanentStorageSupportedAtURL:error:", a3, v11);
  if ((v9 & 1) == 0)
  {
    if (a4 && objc_msgSend(a1, "_isTemporaryStorageRequiredForGSError:andURL:", v11[0], a3))
      *a4 = (id)objc_msgSend(a1, "_makeTemporaryStorageIdentifier");
    if (a5)
      *a5 = (id)v11[0];
  }
  return v9;
}

+ (id)_libraryForURL:(id)a3 temporaryStorageIdentifier:(id *)a4
{
  _BOOL4 v7;
  id result;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v12 = 0;
  if (a4 && objc_msgSend(*a4, "isEqualToString:", CFSTR("com.apple.NSFileVersionTestTempID")))
  {
    v7 = 1;
    v13 = 1;
  }
  else
  {
    result = (id)objc_msgSend(a1, "_makePermanentStorageLibraryForURL:temporaryStorageRequired:error:", a3, &v13, 0, v12);
    if (result)
      return result;
    v7 = v13 != 0;
  }
  result = 0;
  if (a4 && v7)
  {
    v9 = *a4;
    if (!*a4)
      v9 = (id)objc_msgSend(a1, "_makeTemporaryStorageIdentifier");
    result = (id)objc_msgSend(a1, "_temporaryStorageLocationForIdentifier:", v9, v12);
    if (result)
    {
      v10 = result;
      -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(result, "path"), 0, 0, 0);
      result = (id)objc_msgSend((id)gsDefaultStorageManager(), "temporaryStorageForItemAtURL:locatedAtURL:error:", a3, v10, &v12);
      if (result)
      {
        *a4 = v9;
      }
      else
      {
        v11 = _NSOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v15 = v10;
          v16 = 2112;
          v17 = v12;
          _os_log_error_impl(&dword_1817D9000, v11, OS_LOG_TYPE_ERROR, "NSDocument could not create temporary version storage at %@. Here's the error:\n%@", buf, 0x16u);
        }
        return 0;
      }
    }
  }
  return result;
}

+ (id)_otherNonpurgeableVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  return (id)objc_msgSend(a1, "_otherVersionsOfItemAtURL:temporaryStorageIdentifier:withoutOptions:", a3, a4, 8);
}

+ (id)_versionOfItemAtURL:(id)a3 forPersistentIdentifier:(id)a4 temporaryStorageIdentifier:(id)a5
{
  uint64_t v9;
  void *v10;
  id v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v9 = objc_msgSend((id)gsDefaultStorageManager(), "additionForItemAtURL:forPersistentIdentifier:error:", a3, a4, &v21);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAddition:", v9);
    return v10;
  }
  if (v21)
  {
    v13 = _NSOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = a4;
      v24 = 2112;
      v25 = v21;
      _os_log_error_impl(&dword_1817D9000, v13, OS_LOG_TYPE_ERROR, "Failed to get a GSAddition with persistent identifier: %@. Here's the error: %@", buf, 0x16u);
    }
    return 0;
  }
  v15 = objc_msgSend(a4, "objectForKey:", CFSTR("clientID"));
  v16 = objc_msgSend(a4, "objectForKey:", CFSTR("name"));
  v17 = objc_msgSend(a4, "objectForKey:", CFSTR("path"));
  if (v15)
  {
    if (v16)
    {
      v18 = objc_msgSend(a1, "_existingLibraryForURL:temporaryStorageIdentifier:", a3, a5);
      if (v18)
      {
        v19 = objc_msgSend((id)gsDefaultStorageManager(), "persistentIdentifierInStorage:forAdditionNamed:inNameSpace:", v18, v16, v15);
        if (v19)
          return (id)objc_msgSend(a1, "_versionOfItemAtURL:forPersistentIdentifier:temporaryStorageIdentifier:", a3, v19, v19);
      }
    }
    return 0;
  }
  if (!v17)
  {
    v12 = 0;
    if (!objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", 0))
      return v12;
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithFileURL:library:clientID:name:contentsURL:isBackup:revision:", a3, 0, 0, 0, a3, 0, 0);
    return v10;
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v17);
  v12 = 0;
  if (objc_msgSend(v20, "checkResourceIsReachableAndReturnError:", 0))
    v12 = (id)objc_msgSend(objc_alloc((Class)a1), "_initWithFileURL:library:clientID:name:contentsURL:isBackup:revision:", a3, 0, 0, 0, v20, 1, 0);

  return v12;
}

+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 temporaryStorageIdentifier:(id *)a7 error:(id *)a8
{
  char v10;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSError *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[11];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint8_t v41[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int128 buf;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  const __CFString *v52;
  _QWORD v53[4];

  v10 = a5;
  v53[1] = *MEMORY[0x1E0C80C00];
  v14 = objc_msgSend(a1, "_libraryForURL:temporaryStorageIdentifier:", a3, a7);
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (void *)objc_msgSend(a4, "path");
    v17 = (void *)objc_msgSend(v16, "pathExtension");
    if (objc_msgSend(v17, "hasPrefix:", CFSTR("sb-")))
      v17 = (void *)objc_msgSend((id)objc_msgSend(v16, "stringByDeletingPathExtension"), "pathExtension");
    v18 = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
    if (objc_msgSend(v17, "length"))
      v18 = -[NSString stringByAppendingPathExtension:](v18, "stringByAppendingPathExtension:", v17);
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v19, "setObject:forKey:", CFSTR("com.apple.documentVersions"), qword_1ECD0A7F0);
    objc_msgSend(v19, "setObject:forKey:", v18, qword_1ECD0A7F8);
    if (a6)
    {
      v52 = CFSTR("NSDocumentInfo");
      v53[0] = a6;
      v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      objc_msgSend(v19, "setObject:forKey:", v20, qword_1ECD0A800);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x3052000000;
    v49 = __Block_byref_object_copy__30;
    v50 = __Block_byref_object_dispose__30;
    v51 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3052000000;
    v38 = __Block_byref_object_copy__30;
    v39 = __Block_byref_object_dispose__30;
    v40 = 0;
    v21 = objc_msgSend(v15, "prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:", a4, v10 & 1, v19, &v51);
    if (v21)
    {
      v22 = dispatch_semaphore_create(0);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __119__NSFileVersion_NSPrivate___addVersionOfItemAtURL_withContentsOfURL_options_userInfo_temporaryStorageIdentifier_error___block_invoke;
      v34[3] = &unk_1E0F550B8;
      v34[4] = a3;
      v34[5] = a1;
      v34[9] = &v35;
      v34[10] = &buf;
      v34[6] = v15;
      v34[7] = v21;
      v34[8] = v22;
      objc_msgSend(v15, "createAdditionStagedAtURL:creationInfo:completionHandler:", v21, v19, v34);
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v22);
      v23 = (void *)v36[5];
      if (v23)
      {
        v24 = v23;
LABEL_24:
        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&buf, 8);
        return v24;
      }
      v29 = _NSOSLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v33 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v41 = 138412802;
        v42 = a3;
        v43 = 2112;
        v44 = a4;
        v45 = 2112;
        v46 = v33;
        _os_log_error_impl(&dword_1817D9000, v29, OS_LOG_TYPE_ERROR, "NSFileVersion tried to tried to add a new generation and failed. Versioned file URL: %@, contents URL: %@, error: %@", v41, 0x20u);
      }
      v30 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (a8)
      {
        v28 = v30;
        goto LABEL_21;
      }

LABEL_23:
      v24 = 0;
      goto LABEL_24;
    }
    v27 = _NSOSLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v32 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v41 = 138412802;
      v42 = a3;
      v43 = 2112;
      v44 = a4;
      v45 = 2112;
      v46 = v32;
      _os_log_error_impl(&dword_1817D9000, v27, OS_LOG_TYPE_ERROR, "NSFileVersion tried to tried to add a new generation and failed. Versioned file URL: %@, contents URL: %@, error: %@", v41, 0x20u);
      if (!a8)
        goto LABEL_23;
    }
    else if (!a8)
    {
      goto LABEL_23;
    }
    v28 = *(id *)(*((_QWORD *)&buf + 1) + 40);
LABEL_21:
    v24 = 0;
    *a8 = v28;
    goto LABEL_24;
  }
  v25 = _NSOSLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = a3;
    _os_log_error_impl(&dword_1817D9000, v25, OS_LOG_TYPE_ERROR, "NSFileVersion couldn't find the library for a file. URL: %@", (uint8_t *)&buf, 0xCu);
    if (a8)
      goto LABEL_13;
    return 0;
  }
  if (!a8)
    return 0;
LABEL_13:
  v26 = _NSErrorWithFilePath(512, (uint64_t)a3);
  v24 = 0;
  *a8 = v26;
  return v24;
}

intptr_t __119__NSFileVersion_NSPrivate___addVersionOfItemAtURL_withContentsOfURL_options_userInfo_temporaryStorageIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    +[NSFileCoordinator __itemAtURL:didGainVersionWithClientID:name:purposeID:](NSFileCoordinator, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", *(_QWORD *)(a1 + 32), objc_msgSend(a2, "nameSpace"), objc_msgSend(a2, "name"), 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "_initWithAddition:", a2);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = a3;
    objc_msgSend(*(id *)(a1 + 48), "cleanupStagingURL:", *(_QWORD *)(a1 + 56));
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 temporaryStorageIdentifier:(id *)a6 error:(id *)a7
{
  return (id)objc_msgSend(a1, "_addVersionOfItemAtURL:withContentsOfURL:options:userInfo:temporaryStorageIdentifier:error:", a3, a4, a5, 0, a6, a7);
}

+ (id)_temporaryDirectoryURLForNewVersionOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  NSObject *v5;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a4)
    a3 = (id)objc_msgSend(a1, "_temporaryStorageLocationForIdentifier:", a4);
  if (a3)
  {
    v7 = 0;
    a3 = -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, a3, 1, &v7);
    if (!a3)
    {
      v5 = _NSOSLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v7;
        _os_log_error_impl(&dword_1817D9000, v5, OS_LOG_TYPE_ERROR, "NSFileVersion invoked -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:] and that failed. Here's the error:\n%@", buf, 0xCu);
      }
    }
  }
  return a3;
}

+ (BOOL)_removeOtherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  BOOL v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "_existingLibraryForURL:temporaryStorageIdentifier:", a3, a4);
  if (v6)
  {
    v7 = (void *)v6;
    v44 = 0;
    v45 = &v44;
    v46 = 0x3052000000;
    v47 = __Block_byref_object_copy__30;
    v48 = __Block_byref_object_dispose__30;
    v49 = 0;
    if (qword_1ECD0A818 != -1)
      dispatch_once(&qword_1ECD0A818, &__block_literal_global_235);
    v8 = (void *)objc_msgSend(v7, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", CFSTR("com.apple.ubiquity"), 0, 0, 0);
    v42 = v7;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v68 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          if ((objc_msgSend(v12, "fp_markResolvedWithError:", v45 + 5) & 1) == 0)
          {
            v13 = _NSOSLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v14 = objc_msgSend(v12, "name");
              v15 = v45[5];
              *(_DWORD *)buf = 138412802;
              v61 = a3;
              v62 = 2112;
              v63 = v14;
              v64 = 2112;
              v65 = v15;
              _os_log_error_impl(&dword_1817D9000, v13, OS_LOG_TYPE_ERROR, "marking version %@ for %@ as resolved failed. The error is:\n%@", buf, 0x20u);
            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
      }
      while (v9);
    }
    if (objc_msgSend(v8, "error"))
    {
      v16 = _NSOSLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v37 = objc_msgSend(v8, "error");
        *(_DWORD *)buf = 138412546;
        v61 = a3;
        v62 = 2112;
        v63 = v37;
        _os_log_error_impl(&dword_1817D9000, v16, OS_LOG_TYPE_ERROR, "Enumeration of versions for %@ failed. Here's the error:\n%@", buf, 0x16u);
      }
    }
    v17 = (void *)objc_msgSend(v42, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", CFSTR("com.apple.FileProvider.conflict"), 0, 0, 0);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          if ((objc_msgSend(v21, "fp_markResolvedWithError:", v45 + 5) & 1) == 0)
          {
            v22 = _NSOSLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = objc_msgSend(v21, "name");
              v24 = v45[5];
              *(_DWORD *)buf = 138412802;
              v61 = a3;
              v62 = 2112;
              v63 = v23;
              v64 = 2112;
              v65 = v24;
              _os_log_error_impl(&dword_1817D9000, v22, OS_LOG_TYPE_ERROR, "marking version %@ for %@ as resolved failed. The error is:\n%@", buf, 0x20u);
            }
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
      }
      while (v18);
    }
    if (objc_msgSend(v17, "error"))
    {
      v25 = _NSOSLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v38 = objc_msgSend(v17, "error");
        *(_DWORD *)buf = 138412546;
        v61 = a3;
        v62 = 2112;
        v63 = v38;
        _os_log_error_impl(&dword_1817D9000, v25, OS_LOG_TYPE_ERROR, "Enumeration of versions for %@ failed. Here's the error:\n%@", buf, 0x16u);
      }
    }
    v26 = (void *)objc_msgSend(v42, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", CFSTR("com.apple.documentVersions"), 0, 0, 0);
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(v26, "allObjects"));
    if (objc_msgSend(v26, "error"))
    {
      v28 = _NSOSLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v39 = objc_msgSend(v26, "error");
        *(_DWORD *)buf = 138412546;
        v61 = a3;
        v62 = 2112;
        v63 = v39;
        _os_log_error_impl(&dword_1817D9000, v28, OS_LOG_TYPE_ERROR, "Enumeration of versions for %@ failed. Here's the error:\n%@", buf, 0x16u);
      }
    }
    objc_lookUpClass("GSTemporaryStorage");
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend((id)gsDefaultStorageManager(), "removeTemporaryStorage:error:", v42, v45 + 5))
      {
LABEL_35:
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v52;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v52 != v30)
                objc_enumerationMutation(v27);
              +[NSFileCoordinator __itemAtURL:didLoseVersionWithClientID:name:purposeID:](NSFileCoordinator, "__itemAtURL:didLoseVersionWithClientID:name:purposeID:", a3, objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "nameSpace"), objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "name"), 0);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
          }
          while (v29);
        }
        v32 = 1;
LABEL_49:
        _Block_object_dispose(&v44, 8);
        return v32;
      }
    }
    else
    {
      v33 = dispatch_semaphore_create(0);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __93__NSFileVersion_NSPrivate___removeOtherVersionsOfItemAtURL_temporaryStorageIdentifier_error___block_invoke;
      v43[3] = &unk_1E0F550E0;
      v43[4] = v33;
      v43[5] = &v44;
      objc_msgSend(v42, "removeAllAdditionsForNamespaces:completionHandler:", &unk_1E0FCEC08, v43);
      dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v33);
      v34 = (id)v45[5];
      if (!v45[5])
        goto LABEL_35;
    }
    v35 = _NSOSLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v40 = v45[5];
      *(_DWORD *)buf = 138412546;
      v61 = a3;
      v62 = 2112;
      v63 = v40;
      _os_log_error_impl(&dword_1817D9000, v35, OS_LOG_TYPE_ERROR, "NSFileVersion tried to tried to delete temporary version storage and failed. Versioned file URL: %@, error: %@", buf, 0x16u);
    }
    v32 = 0;
    if (a5)
      *a5 = (id)v45[5];
    goto LABEL_49;
  }
  return 1;
}

id __93__NSFileVersion_NSPrivate___removeOtherVersionsOfItemAtURL_temporaryStorageIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id result;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)_versionOfItemAtURL:(id)a3 forClientID:(id)a4 name:(id)a5 temporaryStorageIdentifier:(id)a6 evenIfDeleted:(BOOL)a7
{
  _BOOL4 v7;
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a7;
  v12 = (void *)objc_msgSend(a1, "_existingLibraryForURL:temporaryStorageIdentifier:", a3, a6);
  v13 = objc_msgSend(v12, "additionWithName:inNameSpace:error:", a5, a4, 0);
  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAddition:", v13);
  }
  else if (v7)
  {
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithFileURL:library:clientID:name:contentsURL:isBackup:revision:", a3, v12, a4, a5, 0, 0, 0);
  }
  else
  {
    v14 = 0;
  }
  return v14;
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
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "NSDocument called rmdir(\"%@\"), it didn't return 0, and errno was set to %{errno}d.", (uint8_t *)&v8, 0x12u);
    }
  }
  -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", a3, 0);
}

- (id)_documentInfo
{
  id result;

  result = (id)objc_msgSend((id)-[GSAddition userInfo](self->_addition, "userInfo"), "objectForKey:", CFSTR("NSDocumentInfo"));
  if (!result)
    return (id)MEMORY[0x1E0C9AA70];
  return result;
}

- (BOOL)_setDocumentInfo:(id)a3
{
  GSAddition *addition;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  addition = self->_addition;
  v5 = CFSTR("NSDocumentInfo");
  v6[0] = a3;
  return -[GSAddition mergeUserInfo:error:](addition, "mergeUserInfo:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1), 0);
}

- (void)_overrideModificationDateWithDate:(id)a3
{
  id v5;
  id v6;

  if (self->_modificationDate != a3)
  {
    if (self->_addition)
    {
      v5 = -[NSFileVersion _documentInfo](self, "_documentInfo");
      if (v5)
      {
        v6 = (id)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v6, "setObject:forKey:", a3, CFSTR("modificationDate"));
        if (-[NSFileVersion _setDocumentInfo:](self, "_setDocumentInfo:", v6))
        {

          self->_modificationDate = (NSDate *)objc_msgSend(a3, "copy");
        }

      }
    }
  }
}

- (BOOL)_isBackup
{
  return self->_isBackup;
}

- (BOOL)_preserveConflictVersionLocally
{
  if (!-[NSFileVersion isConflict](self, "isConflict"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[NSFileVersion _preserveConflictVersionLocally]: You can only use it with conflict versions."), 0));
  -[NSFileVersion setResolved:](self, "setResolved:", 1);
  return 1;
}

- (id)restoreOverItemAtURL:(id)a3 error:(id *)a4
{
  return -[NSFileVersion replaceItemAtURL:options:error:](self, "replaceItemAtURL:options:error:", a3, 0, a4);
}

+ (BOOL)unresolvedConflictsExistForItemAtURL:(id)a3
{
  int v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v3 = objc_msgSend(a3, "getResourceValue:forKey:error:", v5, *MEMORY[0x1E0C99B10], 0);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v5[0], "BOOLValue");
  return v3;
}

+ (void)_markConflicts:(id)a3 asHandledForItemAtURL:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: URL parameter may not be nil"), NSStringFromSelector(a2)), 0);
    objc_exception_throw(v9);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "setResolved:", 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

+ (void)_addConflictObserverForItemAtURL:(id)a3 statusChangedHandler:(id)a4
{
  return 0;
}

@end
