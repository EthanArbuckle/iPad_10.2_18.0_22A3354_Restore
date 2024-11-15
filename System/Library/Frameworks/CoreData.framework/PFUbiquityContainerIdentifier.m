@implementation PFUbiquityContainerIdentifier

- (PFUbiquityContainerIdentifier)init
{
  PFUbiquityContainerIdentifier *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerIdentifier;
  result = -[PFUbiquityContainerIdentifier init](&v3, sel_init);
  if (result)
  {
    result->_usedExistingUUIDFile = 0;
    *(_OWORD *)&result->_uuidFileLocation = 0u;
    *(_OWORD *)&result->_ubiquityRootLocation = 0u;
    *(_OWORD *)&result->_storeName = 0u;
  }
  return result;
}

- (PFUbiquityContainerIdentifier)initWithLocalPeerID:(id)a3 storeName:(id)a4 andUbiquityRootLocation:(id)a5
{
  PFUbiquityContainerIdentifier *v8;

  v8 = -[PFUbiquityContainerIdentifier init](self, "init");
  if (v8)
  {
    v8->_localPeerID = (NSString *)a3;
    v8->_storeName = (NSString *)a4;
    v8->_ubiquityRootLocation = (PFUbiquityLocation *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_localPeerID = 0;
  self->_storeName = 0;

  self->_ubiquityRootLocation = 0;
  self->_uuidString = 0;

  self->_uuidFileLocation = 0;
  self->_presentedItemURL = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerIdentifier;
  -[PFUbiquityContainerIdentifier dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerIdentifier;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), -[PFUbiquityContainerIdentifier description](&v3, sel_description), self->_uuidFileLocation);
}

- (uint64_t)writeToDisk:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(a1 + 40));
  v5 = (void *)objc_msgSend(v4, "URLByDeletingLastPathComponent");
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v5, "path")) & 1) != 0|| objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, a2))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "writeToURL:atomically:encoding:error:", v4, 0, 4, a2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)identifyContainer:(uint64_t)a1
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v3 = 0;
    return v3 & 1;
  }
  v31 = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = 1;
    return v3 & 1;
  }
  v4 = *(void **)(a1 + 24);
  if (!v4)
  {
    v5 = 0;
    v7 = 0;
LABEL_22:
    v16 = 1;
    v15 = 1;
    goto LABEL_24;
  }
  v5 = +[PFUbiquityLocation createMetadataPeerStoreLocationForLocalPeerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 8), v4);
  v6 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v5, (uint64_t)&v31);
  v7 = v6;
  if (!v6)
  {
    v16 = 0;
    v15 = 0;
    v32 = 0;
    goto LABEL_24;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (v11 && *(_DWORD *)(v11 + 24) == 33)
        {

          *(_QWORD *)(a1 + 32) = 0;
          if (*(_DWORD *)(v11 + 24) == 33)
          {
            v12 = (void *)objc_msgSend(*(id *)(v11 + 56), "componentsSeparatedByString:", CFSTR("."));
            if (objc_msgSend(v12, "count") == 2)
              *(_QWORD *)(a1 + 32) = objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", 0), "copy");
          }
          *(_QWORD *)(a1 + 40) = (id)v11;
          *(_BYTE *)(a1 + 56) = 1;
          *(_QWORD *)(a1 + 48) = -[PFUbiquityLocation createFullURL](v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v8);
  }
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_22;
  v13 = -[__CFString copy](+[_PFRoutines _getUUID](), "copy");
  *(_QWORD *)(a1 + 32) = v13;
  v14 = +[PFUbiquityLocation createMetadataUUIDLocationForLocalPeerID:storeName:UUID:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 8), v13, *(void **)(a1 + 24));
  *(_QWORD *)(a1 + 40) = v14;
  *(_QWORD *)(a1 + 48) = -[PFUbiquityLocation createFullURL]((uint64_t)v14);
  v15 = -[PFUbiquityContainerIdentifier writeToDisk:](a1, (uint64_t)&v31);
  v16 = 1;
LABEL_24:

  if ((v15 & 1) == 0)
  {
    if (v31)
    {
      if (a2)
        *a2 = v31;
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityContainerIdentifier.m");
      v24 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityContainerIdentifier.m";
        v35 = 1024;
        v36 = 157;
        _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  v3 = v32;
  if (v16)
    v3 = v15;
  return v3 & 1;
}

- (uint64_t)replaceIdentifierWithUUID:(_QWORD *)a3 error:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v5 = result;
  v19 = 0;
  v6 = *(_QWORD *)(result + 40);
  if (!v6)
    goto LABEL_7;
  v7 = -[PFUbiquityLocation createFullPath](v6);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if ((objc_msgSend(v8, "fileExistsAtPath:", v7) & 1) == 0)
  {

LABEL_7:
    *(_QWORD *)(v5 + 40) = 0;

    v10 = a2;
    *(_QWORD *)(v5 + 32) = v10;
    *(_QWORD *)(v5 + 40) = +[PFUbiquityLocation createMetadataUUIDLocationForLocalPeerID:storeName:UUID:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 8), (uint64_t)v10, *(void **)(v5 + 24));
    if ((-[PFUbiquityContainerIdentifier writeToDisk:](v5, (uint64_t)&v19) & 1) != 0)
      return 1;
    goto LABEL_9;
  }
  v9 = objc_msgSend(v8, "removeItemAtPath:error:", v7, &v19);

  if (v9)
    goto LABEL_7;
LABEL_9:
  if (v19)
  {
    if (a3)
    {
      result = 0;
      *a3 = v19;
      return result;
    }
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityContainerIdentifier.m");
    v18 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136315394;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityContainerIdentifier.m";
    v22 = 1024;
    v23 = 190;
    _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  dispatch_time_t v6;
  NSObject *global_queue;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__66;
  v13 = __Block_byref_object_dispose__66;
  v14 = 0;
  objc_opt_self();
  v14 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PFUbiquityContainerIdentifier_accommodatePresentedItemDeletionWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E1EDD0E0;
  v8[4] = self;
  v8[5] = &v9;
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  v5 = v10[5];
  if (v5)
  {
    -[PFUbiquitySwitchboardEntry afterDelay:executeBlockOnPrivateQueue:](v5, (uint64_t)v8, 30.0);
  }
  else
  {
    v6 = dispatch_time(0, 30000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_after(v6, global_queue, v8);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __87__PFUbiquityContainerIdentifier_accommodatePresentedItemDeletionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37C0]), "initWithName:object:userInfo:", CFSTR("PFUbiquityContainerIdentifierDeleteNotificaton"), *(_QWORD *)(a1 + 32), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v3);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  return objc_msgSend(v2, "drain");
}

- (NSOperationQueue)presentedItemOperationQueue
{
  objc_opt_self();
  return (NSOperationQueue *)_privateQueue;
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

@end
