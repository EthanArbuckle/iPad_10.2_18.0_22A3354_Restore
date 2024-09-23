@implementation NSBinaryObjectStore

+ (uint64_t)_classesForPropertyValues
{
  void *v0;

  objc_opt_self();
  if (!_classesForPropertyValues_expectedClasses)
  {
    v0 = (void *)objc_msgSend((id)+[_PFRoutines attributeClassesForSecureCoding](), "mutableCopy");
    objc_msgSend(v0, "addObject:", objc_opt_class());
    while (!__ldaxr((unint64_t *)&_classesForPropertyValues_expectedClasses))
    {
      if (!__stlxr((unint64_t)v0, (unint64_t *)&_classesForPropertyValues_expectedClasses))
        return _classesForPropertyValues_expectedClasses;
    }
    __clrex();

  }
  return _classesForPropertyValues_expectedClasses;
}

- (NSBinaryObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSBinaryObjectStore *v18;
  NSBinaryObjectStore *v19;
  id v20;
  void *v21;
  NSDictionaryStoreMap *v22;
  NSDictionaryStoreMap *v23;
  id v24;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  objc_super v41;
  __int16 v42;
  id v43;
  stat v44;

  objc_opt_self();
  if (!a5)
  {

    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    v28 = CFSTR("Cannot create a binary store with a nil URL.");
    goto LABEL_29;
  }
  if ((objc_msgSend(a5, "isFileURL") & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v28 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData binary stores only support file URLs (got %@)."), a5);
    v26 = v29;
    v27 = v30;
LABEL_29:
    objc_exception_throw((id)objc_msgSend(v26, "exceptionWithName:reason:userInfo:", v27, v28, 0));
  }
  v43 = 0;
  v42 = 0;
  if (!+[NSPersistentStore doURLStuff:createdStubFile:readOnly:error:options:](NSPersistentStore, "doURLStuff:createdStubFile:readOnly:error:options:", a5, (char *)&v42 + 1, &v42, &v43, a6))
  {

    v31 = *MEMORY[0x1E0C99778];
    v32 = objc_msgSend(v43, "code");
    v33 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v43, CFSTR("NSUnderlyingException"), 0);
    v34 = CFSTR("Error validating url for store");
    v35 = v31;
    v36 = v32;
    goto LABEL_36;
  }
  if ((_BYTE)v42
    && (objc_msgSend((id)objc_msgSend(a6, "valueForKey:", CFSTR("NSReadOnlyPersistentStoreOption")), "BOOLValue") & 1) == 0)
  {
    if (objc_msgSend(a6, "valueForKey:", CFSTR("NSReadOnlyPersistentStoreOption")))
      v11 = BYTE5(z9dsptsiQ80etb9782fsrs98bfdle88) == 0;
    else
      v11 = 1;
    if (!v11)
    {
      v39 = *MEMORY[0x1E0C99778];
      if (v43)
        v33 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v43, *MEMORY[0x1E0CB3388]);
      else
        v33 = 0;
      v34 = CFSTR("Attempt to add read-only store read-write");
      v35 = v39;
      v36 = 513;
LABEL_36:
      v40 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v35, v36, (uint64_t)v34, v33);
      objc_exception_throw(v40);
    }
    if (a6)
    {
      a6 = (id)objc_msgSend(a6, "mutableCopy");
      objc_msgSend(a6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSReadOnlyPersistentStoreOption"));
    }
    else
    {
      a6 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSReadOnlyPersistentStoreOption"));
    }
    _NSCoreDataLog(2, (uint64_t)CFSTR("Attempt to add read-only file at path %@ read/write. Adding it read-only instead. This will be a hard error in the future; you must specify the NSReadOnlyPersistentStoreOption."),
      v12,
      v13,
      v14,
      v15,
      v16,
      v17,
      (uint64_t)a5);
  }
  v41.receiver = self;
  v41.super_class = (Class)NSBinaryObjectStore;
  v18 = -[NSMappedObjectStore initWithPersistentStoreCoordinator:configurationName:URL:options:](&v41, sel_initWithPersistentStoreCoordinator_configurationName_URL_options_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    if (HIBYTE(v42))
    {
      -[NSPersistentStore _setMetadataDirty:](v18, "_setMetadataDirty:", 1);
      -[NSPersistentStore doFilesystemCleanupOnRemove:](v19, "doFilesystemCleanupOnRemove:", 1);
    }
    v20 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if ((objc_msgSend(a5, "isFileURL") & 1) == 0)
    {
      v37 = (void *)MEMORY[0x1E0C99DA0];
      v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSBinaryObjectStore only supports file URLs right now."));
      objc_exception_throw((id)objc_msgSend(v37, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v38, 0));
    }
    v21 = (void *)objc_msgSend(a5, "path");
    memset(&v44, 0, sizeof(v44));
    if (stat((const char *)objc_msgSend(v21, "fileSystemRepresentation"), &v44) || v44.st_size < 1)
      v22 = -[NSDictionaryStoreMap initWithStore:]([NSDictionaryStoreMap alloc], "initWithStore:", v19);
    else
      v22 = -[NSDictionaryStoreMap initWithStore:fromPath:]([NSDictionaryStoreMap alloc], "initWithStore:fromPath:", v19, objc_msgSend(a5, "path"));
    v23 = v22;
    if (v22)
      -[NSMappedObjectStore _setMap:](v19, v22);
    objc_msgSend(v20, "drain");

    v24 = 0;
  }
  return v19;
}

- (void)saveDocumentToPath:(id)a3
{
  NSPersistentStoreMap *theMap;

  if (-[NSPersistentStore isReadOnly](self, "isReadOnly"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't save store to %@ (read-only store)"), a3), 0));
  if (self)
    theMap = self->super._theMap;
  else
    theMap = 0;
  -[NSDictionaryStoreMap saveToPath:]((uint64_t)theMap, a3);
  -[NSPersistentStore doFilesystemCleanupOnRemove:](self, "doFilesystemCleanupOnRemove:", 0);
}

- (id)type
{
  return CFSTR("Binary");
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "metadataForPersistentStoreWithURL:options:error:", a3, 0, a4);
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "setMetadata:forPersistentStoreWithURL:options:error:", a3, a4, 0, a5);
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  NSBinaryObjectStoreFile *v8;
  void *v9;
  int v10;
  id v11;
  NSDictionary *fullMetadata;
  id v13;
  void *v14;
  void *v16;

  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
  {
    if (!a5)
      return 0;
    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    v8 = (NSBinaryObjectStoreFile *)objc_msgSend(v11, "initWithObjectsAndKeys:", a3, *MEMORY[0x1E0CB3308], 0);
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 262, v8);
LABEL_20:

    return 0;
  }
  v16 = 0;
  v8 = objc_alloc_init(NSBinaryObjectStoreFile);
  if (byte_1ECD8DE1C)
  {
    v9 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("_NSBinaryStoreInsecureDecodingCompatibilityOption"));
    if (v9)
      v10 = objc_msgSend(v9, "BOOLValue") ^ 1;
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  if ((-[NSBinaryObjectStoreFile readMetadataFromFile:securely:error:]((uint64_t)v8, objc_msgSend(a3, "path"), v10, &v16) & 1) == 0)
  {
    if (a5)
      *a5 = v16;
    goto LABEL_20;
  }
  if (v8)
    fullMetadata = v8->_fullMetadata;
  else
    fullMetadata = 0;
  v13 = (id)-[NSDictionary copy](fullMetadata, "copy");

  v14 = (void *)objc_msgSend(v13, "objectForKey:", CFSTR("NSStoreType"));
  if (v14 && !objc_msgSend(v14, "isEqualToString:", CFSTR("Binary")))
    v13 = 0;
  if (v13)
    return v13;
  else
    return (id)NSDictionary_EmptyDictionary;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v10;
  int v11;
  BOOL v12;
  NSBinaryObjectStoreFile *v13;
  NSDictionary *v14;
  NSDictionary *v15;
  NSDictionary *fullMetadata;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___NSBinaryObjectStore;
  if (!objc_msgSendSuper2(&v26, sel_setMetadata_forPersistentStoreWithURL_error_, a3, a4, a6))
    return 0;
  if (byte_1ECD8DE1C)
  {
    v10 = (void *)objc_msgSend(a5, "objectForKey:", CFSTR("_NSBinaryStoreInsecureDecodingCompatibilityOption"));
    if (v10)
      v11 = objc_msgSend(v10, "BOOLValue") ^ 1;
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  v13 = objc_alloc_init(NSBinaryObjectStoreFile);
  if (!-[NSBinaryObjectStoreFile readMetadataFromFile:securely:error:]((uint64_t)v13, objc_msgSend(a4, "path"), v11, a6))
  {
    v12 = 0;
    if (!v13)
      return v12;
LABEL_40:

    return v12;
  }
  v14 = (NSDictionary *)objc_msgSend(a3, "mutableCopy");
  v15 = v14;
  if (v13)
    fullMetadata = v13->_fullMetadata;
  else
    fullMetadata = 0;
  if (!-[NSDictionary objectForKey:](v14, "objectForKey:", 0x1E1EF1490))
  {
    v17 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", 0x1E1EF1490);
    if (v17)
      -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v17, 0x1E1EF1490);
  }
  if (!-[NSDictionary objectForKey:](v15, "objectForKey:", CFSTR("NSStoreModelVersionHashes")))
  {
    v18 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", CFSTR("NSStoreModelVersionHashes"));
    if (v18)
      -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v18, CFSTR("NSStoreModelVersionHashes"));
  }
  if (!-[NSDictionary objectForKey:](v15, "objectForKey:", CFSTR("NSStoreModelVersionIdentifiers")))
  {
    v19 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", CFSTR("NSStoreModelVersionIdentifiers"));
    if (v19)
      -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v19, CFSTR("NSStoreModelVersionIdentifiers"));
  }
  if (!-[NSDictionary objectForKey:](v15, "objectForKey:", 0x1E1EF0E90))
  {
    v20 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", 0x1E1EF0E90);
    if (v20)
      -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v20, 0x1E1EF0E90);
  }
  if (!-[NSDictionary objectForKey:](v15, "objectForKey:", CFSTR("NSStoreModelVersionChecksumKey")))
  {
    v21 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", CFSTR("NSStoreModelVersionChecksumKey"));
    if (v21)
      -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v21, CFSTR("NSStoreModelVersionChecksumKey"));
  }
  if (!-[NSDictionary objectForKey:](v15, "objectForKey:", CFSTR("NSStoreType")))
  {
    v22 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", CFSTR("NSStoreType"));
    if (v22)
      -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v22, CFSTR("NSStoreType"));
  }
  if (!-[NSDictionary objectForKey:](v15, "objectForKey:", CFSTR("NSStoreUUID")))
  {
    v23 = -[NSDictionary objectForKey:](fullMetadata, "objectForKey:", CFSTR("NSStoreUUID"));
    if (v23)
      -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", v23, CFSTR("NSStoreUUID"));
  }
  if (!-[NSDictionary objectForKey:](v15, "objectForKey:", 0x1E1EF14B0))
    -[NSDictionary setObject:forKey:](v15, "setObject:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), 0x1E1EF14B0);
  if (v13 && v13->_fullMetadata != v15)
  {
    v24 = -[NSDictionary copy](v15, "copy");

    v13->_fullMetadata = (NSDictionary *)v24;
  }

  v12 = -[NSBinaryObjectStoreFile writeMetadataToFile:error:](v13, objc_msgSend(a4, "path"), a6);
  if (v13)
    goto LABEL_40;
  return v12;
}

@end
