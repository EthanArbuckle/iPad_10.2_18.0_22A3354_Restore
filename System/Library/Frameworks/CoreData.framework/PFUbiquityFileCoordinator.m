@implementation PFUbiquityFileCoordinator

- (PFUbiquityFileCoordinator)initWithFilePresenter:(id)a3
{
  PFUbiquityFileCoordinator *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityFileCoordinator;
  v4 = -[PFUbiquityFileCoordinator initWithFilePresenter:](&v7, sel_initWithFilePresenter_);
  if (v4)
  {
    if (a3)
      v5 = (void *)*((_QWORD *)a3 + 2);
    else
      v5 = 0;
    v4->_localPeerID = (NSString *)v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityFileCoordinator;
  -[PFUbiquityFileCoordinator dealloc](&v3, sel_dealloc);
}

- (uint64_t)coordinateReadingItemAtLocation:(uint64_t)a3 options:(int)a4 retryOnError:(_QWORD *)a5 error:(uint64_t)a6 byAccessor:
{
  uint64_t v10;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10 = a2;
  v12 = (void *)-[PFUbiquityLocation createFullURL](a2);
  v50 = 0;
  objc_msgSend(a1, "coordinateReadingItemAtURL:options:error:byAccessor:", v12, a3, &v50, a6);
  if (!v50)
  {
LABEL_31:
    v25 = 1;
    goto LABEL_50;
  }
  v46 = a5;
  if (a4)
    v13 = 0;
  else
    v13 = 2;
  v47 = *MEMORY[0x1E0CB28A8];
  v45 = *MEMORY[0x1E0CB3388];
  while (1)
  {
    v49 = 0;
    if (!v10 || !*(_BYTE *)(v10 + 88))
    {
LABEL_17:
      v22 = v50;
      goto LABEL_22;
    }
    v14 = +[_PFRoutines isUbiquitousURLUploaded:error:]((uint64_t)_PFRoutines, v12, (uint64_t)&v49);
    if (v49
      && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error checking the uploaded status for: %@\nError: %@"), "-[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:]", 84, v12, v49);
      if ((v14 & 1) != 0)
        goto LABEL_17;
    }
    else if (v14)
    {
      goto LABEL_17;
    }
    v15 = objc_msgSend(*(id *)(v10 + 32), "isEqualToString:", a1[8]);
    v16 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1);
    if (v15)
    {
      if (v16)
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unlinking orphaned file: %@"), "-[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:]", 92, a1);
      unlink((const char *)objc_msgSend((id)objc_msgSend(v12, "path"), "fileSystemRepresentation"));
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v10, CFSTR("NSAffectedObjectsErrorKey"));
      v19 = v17;
      v20 = v47;
      v21 = 134320;
    }
    else
    {
      if (v16)
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nReplacing error with file upload error: %@\n"), "-[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:]", 99, a1, v50);
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v10, CFSTR("NSAffectedObjectsErrorKey"));
      v21 = 134323;
      v19 = v23;
      v20 = v47;
    }
    v22 = (id)objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v18);
    v50 = v22;
LABEL_22:
    v48 = 0;
    if (!a4)
      goto LABEL_33;
    if ((objc_msgSend(a1, "shouldRetryForError:ignoreFile:", v22, &v48) & 1) == 0)
      break;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCoordinated read returned an error: %@\nuserInfo: %@\n Retrying (%u)."), "-[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:]", 108, a1, v50, objc_msgSend(v50, "userInfo"), v13);
    if (v13 >= 2)
    {
      if (v50)
      {
        if (v46)
          *v46 = v50;
      }
      else
      {
        v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityFileCoordinator.m");
        v43 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityFileCoordinator.m";
          v55 = 1024;
          v56 = 114;
          _os_log_fault_impl(&dword_18A253000, v43, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      goto LABEL_49;
    }
    if ((_DWORD)v13)
    {
      sleep(0xFu);
      v13 = 2;
      v24 = 30;
    }
    else
    {
      v13 = 1;
      v24 = 5;
    }
    sleep(v24);
    objc_msgSend(a1, "coordinateReadingItemAtURL:options:error:byAccessor:", v12, a3, &v50, a6);
    if (!v50)
      goto LABEL_31;
  }
  v22 = v50;
LABEL_33:
  if (v22)
  {
    if (v46)
      *v46 = v22;
  }
  else
  {
    v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityFileCoordinator.m");
    v33 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/PFUbiquityFileCoordinator.m";
      v55 = 1024;
      v56 = 132;
      _os_log_fault_impl(&dword_18A253000, v33, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  if (v48)
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v51[0] = CFSTR("NSAffectedObjectsErrorKey");
    if (!v10)
      v10 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51[1] = v45;
    v52[0] = v10;
    v35 = (uint64_t)v50;
    if (!v50)
      v35 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v52[1] = v35;
    v50 = (id)objc_msgSend(v34, "errorWithDomain:code:userInfo:", v47, 134324, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2));
  }
LABEL_49:
  v25 = 0;
LABEL_50:

  return v25;
}

- (BOOL)shouldRetryForError:(id)a3 ignoreFile:(BOOL *)a4
{
  void *v7;
  BOOL v8;
  unint64_t v9;
  _BOOL4 v10;
  unint64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;

  v7 = (void *)objc_msgSend(a3, "domain");
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    objc_msgSend(a3, "code");
LABEL_3:
    v8 = 0;
    goto LABEL_20;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("LibrarianErrorDomain")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("UBErrorDomain")))
    {
      v11 = objc_msgSend(a3, "code");
      if (v11 < 0xA)
      {
        v8 = (v11 & 0x3FF) == 0;
        goto LABEL_20;
      }
      v13 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0);
      v8 = 0;
      if (!v13)
        goto LABEL_20;
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nEncountered unknown ubiquity error: %@\nuserInfo: %@"), "-[PFUbiquityFileCoordinator shouldRetryForError:ignoreFile:]", 248, self, a3, objc_msgSend(a3, "userInfo"));
    }
    else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v12 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0);
      v8 = 0;
      if (!v12)
        goto LABEL_20;
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nEncountered unrecoverable error: %@\nuserInfo: %@"), "-[PFUbiquityFileCoordinator shouldRetryForError:ignoreFile:]", 254, self, a3, objc_msgSend(a3, "userInfo"));
    }
    goto LABEL_3;
  }
  v9 = objc_msgSend(a3, "code");
  v8 = 0;
  if ((v9 > 7 || ((1 << v9) & 0xFA) == 0) && v9 != 134320 && v9 != 134323)
  {
    v10 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0);
    v8 = 0;
    if (v10)
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nEncountered unknown librarian error: %@\nuserInfo: %@"), "-[PFUbiquityFileCoordinator shouldRetryForError:ignoreFile:]", 214, self, a3, objc_msgSend(a3, "userInfo"));
      goto LABEL_3;
    }
  }
LABEL_20:
  *a4 = v8;
  return 0;
}

+ (PFUbiquityFileCoordinator)newFileCoordinatorForUbiquityRootLocation:(uint64_t)a1
{
  objc_opt_self();
  return +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a2, 0);
}

+ (PFUbiquityFileCoordinator)newFileCoordinatorForUbiquityRootLocation:(uint64_t)a3 andLocalPeerID:
{
  uint64_t v5;

  objc_opt_self();
  if (!a2)
    return 0;
  if (*(_DWORD *)(a2 + 24) != 1)
    a2 = *(_QWORD *)(a2 + 8);
  objc_opt_self();
  v5 = -[PFUbiquitySwitchboard filePresenterForUbiquityRootLocation:andLocalPeerID:]((id *)_sharedSwitchboard, a2, a3);
  if (v5)
    return -[PFUbiquityFileCoordinator initWithFilePresenter:]([PFUbiquityFileCoordinator alloc], "initWithFilePresenter:", v5);
  else
    return 0;
}

+ (PFUbiquityFileCoordinator)newFileCoordinatorForUbiquitousExternalDataReferenceLocation:(uint64_t)a1
{
  objc_opt_self();
  objc_opt_self();
  return +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, a2, 0);
}

@end
