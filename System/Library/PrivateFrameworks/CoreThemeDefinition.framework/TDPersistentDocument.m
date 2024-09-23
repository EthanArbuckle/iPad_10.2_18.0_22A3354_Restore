@implementation TDPersistentDocument

- (id)displayName
{
  return CFSTR("BOGUS BOGUS");
}

- (id)undoManager
{
  return 0;
}

- (TDPersistentDocument)initWithContentsOfURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  TDPersistentDocument *v8;
  NSURL *v9;

  v8 = -[TDPersistentDocument init](self, "init");
  if (v8)
  {
    v9 = (NSURL *)a3;
    v8->_fileURL = v9;
    if (!-[TDPersistentDocument readFromURL:ofType:error:](v8, "readFromURL:ofType:error:", v9, a4, a5))
    {

      return 0;
    }
  }
  return v8;
}

- (TDPersistentDocument)initWithType:(id)a3 error:(id *)a4
{
  TDPersistentDocument *v6;
  int v7;
  uint64_t v8;
  BOOL v9;
  char v11[1024];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = -[TDPersistentDocument init](self, "init");
  if (v6)
  {
    v6->_fileType = (NSString *)objc_msgSend(a3, "copy");
    -[NSString getFileSystemRepresentation:maxLength:](NSTemporaryDirectory(), "getFileSystemRepresentation:maxLength:", v11, 1024);
    __strcat_chk();
    v7 = mkstemps(v11, 10);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v11, 0, 0);
    v6->_temporaryFileURL = (NSURL *)v8;
    v9 = -[TDPersistentDocument configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:](v6, "configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:", v8, a3, 0, 0, a4);
    close(v7);
    if (!v9)
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_fileURL = 0;
  -[TDPersistentDocument setManagedObjectContext:](self, "setManagedObjectContext:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TDPersistentDocument;
  -[TDPersistentDocument dealloc](&v3, sel_dealloc);
}

- (BOOL)readFromURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  BOOL result;
  void *v10;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")) & 1) != 0)
  {
    return objc_msgSend(-[TDPersistentDocument _persistentStoreCoordinator](self, "_persistentStoreCoordinator"), "persistentStoreForURL:", a3)|| -[TDPersistentDocument configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:](self, "configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:", a3, a4, 0, 0, a5);
  }
  else if (a5)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 260, 0);
    result = 0;
    *a5 = v10;
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)saveDocument:(id)a3
{
  uint64_t v3;

  v3 = 0;
  -[NSManagedObjectContext save:](self->_managedObjectContext, "save:", &v3);
}

- (id)managedObjectModel
{
  id result;

  result = self->_managedObjectModel;
  if (!result)
  {
    result = (id)objc_msgSend(MEMORY[0x24BDBB6B0], "mergedModelFromBundles:", 0);
    self->_managedObjectModel = (NSManagedObjectModel *)result;
  }
  return result;
}

- (void)setManagedObjectContext:(id)a3
{
  NSManagedObjectContext *managedObjectContext;

  managedObjectContext = self->_managedObjectContext;
  if (managedObjectContext != a3)
  {

    self->_managedObjectContext = (NSManagedObjectContext *)a3;
  }
}

- (id)managedObjectContext
{
  id result;
  void *v4;
  void *v5;

  result = self->_managedObjectContext;
  if (!result)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB738]), "initWithManagedObjectModel:", -[TDPersistentDocument managedObjectModel](self, "managedObjectModel"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6A0]), "initWithConcurrencyType:", 2);
    objc_msgSend(v5, "setPersistentStoreCoordinator:", v4);
    -[TDPersistentDocument setManagedObjectContext:](self, "setManagedObjectContext:", v5);

    return self->_managedObjectContext;
  }
  return result;
}

- (id)_persistentStoreCoordinator
{
  id v2;
  id result;
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  v2 = -[TDPersistentDocument managedObjectContext](self, "managedObjectContext");
  if (!v2)
  {
    v4 = (void *)MEMORY[0x24BDBCE88];
    v5 = *MEMORY[0x24BDBCAB0];
    v6 = CFSTR("Couldn't create managed object context");
    goto LABEL_6;
  }
  result = (id)objc_msgSend(v2, "persistentStoreCoordinator");
  if (!result)
  {
    v4 = (void *)MEMORY[0x24BDBCE88];
    v5 = *MEMORY[0x24BDBCAB0];
    v6 = CFSTR("Couldn't access persistent store coordinator");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0));
  }
  return result;
}

+ (id)_fileModificationDateForURL:(id)a3
{
  void *v4;

  v4 = 0;
  objc_msgSend(a3, "getResourceValue:forKey:error:", &v4, *MEMORY[0x24BDBCBE0], 0);
  return v4;
}

- (void)setFileURL:(id)a3
{
  NSURL *fileURL;
  NSURL *v7;
  NSURL *temporaryFileURL;
  NSURL *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  fileURL = self->_fileURL;
  if (fileURL != a3)
  {

    v7 = (NSURL *)objc_msgSend(a3, "copy");
    self->_fileURL = v7;
    temporaryFileURL = self->_temporaryFileURL;
    if (temporaryFileURL && v7 != 0)
    {
      v14 = 0;
      v10 = temporaryFileURL;
      -[TDPersistentDocument saveDocument:](self, "saveDocument:", 0);
      v11 = (void *)objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator");
      v12 = (void *)objc_msgSend(v11, "persistentStores");
      if (objc_msgSend(v12, "count") != 1)
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDPersistentDocument.m"), 174, CFSTR("-[TDPersistentDocument setFileURL:] expects exactly one persistent store."));
      v13 = objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", 0), "options");
      if ((objc_msgSend(v11, "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", self->_fileURL, v13, v10, v13, *MEMORY[0x24BDBB580], &v14) & 1) == 0)NSLog(CFSTR("-[TDPersistentDocument setFileURL:] failed to move store from '%@' to '%@' error %@"), v10, self->_fileURL, v14);

    }
  }
}

- (void)close
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSURL *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator"), "persistentStores"), "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend((id)objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator"), "removePersistentStore:error:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = -[TDPersistentDocument temporaryFileURL](self, "temporaryFileURL");
  if (v8)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", v8, 0);
    -[TDPersistentDocument setTemporaryFileURL:](self, "setTemporaryFileURL:", 0);
  }
}

- (BOOL)configurePersistentStoreCoordinatorForURL:(id)a3 ofType:(id)a4 modelConfiguration:(id)a5 storeOptions:(id)a6 error:(id *)a7
{
  NSURL *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  int v21;
  id v22;

  v22 = -[TDPersistentDocument _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v10 = -[TDPersistentDocument fileURL](self, "fileURL");
  v21 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", *MEMORY[0x24BDBB488]), "BOOLValue");
  v11 = 0;
  v12 = 0;
  v13 = 0;
  if (a3 && v10)
  {
    v14 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", -[NSURL path](v10, "path"));
    v15 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", objc_msgSend(a3, "path"));
    v11 = objc_msgSend((id)objc_opt_class(), "_fileModificationDateForURL:", a3);
    v12 = v14;
    v13 = v15;
  }
  if (a6)
    v16 = (id)objc_msgSend(a6, "mutableCopy");
  else
    v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = v16;
  objc_msgSend(v16, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), CFSTR("NSPersistentStoreRemoveStoreOnCleanup"));
  objc_msgSend(v17, "setObject:forKey:", &unk_24EF40A70, *MEMORY[0x24BDBB578]);
  v18 = objc_msgSend(v22, "addPersistentStoreWithType:configuration:URL:options:error:", -[TDPersistentDocument persistentStoreTypeForFileType:](self, "persistentStoreTypeForFileType:", a4), a5, a3, v17, a7) != 0;

  if (v11)
    v19 = v18;
  else
    v19 = 0;
  if (v19
    && (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fileModificationDateForURL:", v13), "isEqualToDate:", v11) & 1) == 0
    && ((v21 ^ 1) & 1) == 0)
  {
    -[TDPersistentDocument setFileURL:](self, "setFileURL:", v12);
  }
  return v18;
}

- (id)persistentStoreTypeForFileType:(id)a3
{
  return (id)*MEMORY[0x24BDBB580];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)temporaryFileURL
{
  return self->_temporaryFileURL;
}

- (void)setTemporaryFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
