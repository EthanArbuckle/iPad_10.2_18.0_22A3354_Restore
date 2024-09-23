@implementation PFCloudKitHistoryAnalyzer

- (PFCloudKitHistoryAnalyzer)initWithOptions:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  PFCloudKitHistoryAnalyzer *v16;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Attempt to init PFCloudKitHistoryAnalyzer with the wrong options class: %@");
    v8 = objc_opt_class();
    _NSCoreDataLog(17, v7, v9, v10, v11, v12, v13, v14, v8);
    v15 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = objc_opt_class();
      _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Attempt to init PFCloudKitHistoryAnalyzer with the wrong options class: %@", buf, 0xCu);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PFCloudKitHistoryAnalyzer;
  v16 = -[PFHistoryAnalyzer initWithOptions:](&v18, sel_initWithOptions_, a3);
  if (v16)
    v16->_managedObjectContext = (NSManagedObjectContext *)a4;
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  self->_lastProcessedToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitHistoryAnalyzer;
  -[PFHistoryAnalyzer dealloc](&v3, sel_dealloc);
}

- (id)instantiateNewAnalyzerContextForChangesInStore:(id)a3
{
  PFCloudKitHistoryAnalyzerContext *v5;
  PFHistoryAnalyzerOptions *options;

  v5 = [PFCloudKitHistoryAnalyzerContext alloc];
  if (self)
    options = self->super._options;
  else
    options = 0;
  return -[PFCloudKitHistoryAnalyzerContext initWithOptions:managedObjectContext:store:](v5, "initWithOptions:managedObjectContext:store:", options, self->_managedObjectContext, a3);
}

- (BOOL)processTransaction:(id)a3 withContext:(id)a4 error:(id *)a5
{
  PFHistoryAnalyzerOptions *options;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  NSPersistentHistoryToken *lastProcessedToken;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  objc_super v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v33 = 0;
  if (!+[PFCloudKitHistoryAnalyzer isPrivateTransaction:](PFCloudKitHistoryAnalyzer, "isPrivateTransaction:")|| (objc_msgSend((id)objc_msgSend(a3, "author"), "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.import")) & 1) != 0|| (objc_msgSend((id)objc_msgSend(a3, "contextName"), "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.import")) & 1) != 0|| objc_msgSend((id)objc_msgSend(a3, "author"), "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.reset")))
  {
    if (self)
    {
      options = self->super._options;
      if (options)
      {
        v10 = *(_QWORD *)&options[1]._automaticallyPruneTransientRecords;
        if (v10)
        {
          if ((objc_msgSend(*(id *)(v10 + 64), "shouldDefer") & 1) != 0 || *(_BYTE *)(v10 + 40))
          {
            v11 = *MEMORY[0x1E0CB28A8];
            v38 = *MEMORY[0x1E0CB2D68];
            v39[0] = CFSTR("History analysis was aborted because the activity was deferred by the system.");
            v12 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, 134419, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1));
            v33 = v12;
            if (v12)
              goto LABEL_11;
            goto LABEL_17;
          }
        }
      }
    }
    v32.receiver = self;
    v32.super_class = (Class)PFCloudKitHistoryAnalyzer;
    if (!-[PFHistoryAnalyzer processTransaction:withContext:error:](&v32, sel_processTransaction_withContext_error_, a3, a4, &v33))
    {
      v12 = v33;
      if (v33)
      {
LABEL_11:
        if (a5)
        {
          LOBYTE(v13) = 0;
          *a5 = v12;
          return v13;
        }
LABEL_19:
        LOBYTE(v13) = 0;
        return v13;
      }
LABEL_17:
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzer.m");
      v22 = __pflogFaultLog;
      v13 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v13)
        return v13;
      *(_DWORD *)buf = 136315394;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitHistoryAnalyzer.m";
      v36 = 1024;
      v37 = 101;
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      goto LABEL_19;
    }
  }
  lastProcessedToken = self->_lastProcessedToken;
  if (lastProcessedToken == (NSPersistentHistoryToken *)objc_msgSend(a3, "token"))
  {
    if (objc_msgSend(a3, "token"))
    {
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Transaction appears to have been processed twice: %@");
      _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)a3);
      v30 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = (const char *)a3;
        _os_log_fault_impl(&dword_18A253000, v30, OS_LOG_TYPE_FAULT, "CoreData: Transaction appears to have been processed twice: %@", buf, 0xCu);
      }
    }
  }
  else
  {

    self->_lastProcessedToken = (NSPersistentHistoryToken *)(id)objc_msgSend(a3, "token");
  }
  LOBYTE(v13) = 1;
  return v13;
}

+ (BOOL)isPrivateTransaction:(id)a3
{
  return +[PFCloudKitHistoryAnalyzer isPrivateTransactionAuthor:](PFCloudKitHistoryAnalyzer, "isPrivateTransactionAuthor:", objc_msgSend(a3, "author"))|| +[PFCloudKitHistoryAnalyzer isPrivateContextName:](PFCloudKitHistoryAnalyzer, "isPrivateContextName:", objc_msgSend(a3, "contextName"));
}

+ (BOOL)isPrivateTransactionAuthor:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.export")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.import")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.reset")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.migration")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.setup")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.event"));
  }
}

+ (BOOL)isPrivateContextName:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.export")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.import"));
}

@end
