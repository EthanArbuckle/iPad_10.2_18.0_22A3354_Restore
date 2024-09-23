@implementation _PFRequestExecutor

- (_PFRequestExecutor)init
{
  _PFRequestExecutor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PFRequestExecutor;
  v2 = -[_PFRequestExecutor init](&v4, sel_init);
  if (v2)
    v2->_requestGroup = (OS_dispatch_group *)dispatch_group_create();
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_requestGroup);
  v3.receiver = self;
  v3.super_class = (Class)_PFRequestExecutor;
  -[_PFRequestExecutor dealloc](&v3, sel_dealloc);
}

- (BOOL)executeRequest:(id)a3 inContext:(id)a4 error:(id *)a5
{
  char v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__20;
  v22 = __Block_byref_object_dispose__20;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53___PFRequestExecutor_executeRequest_inContext_error___block_invoke;
  v17[3] = &unk_1E1EDD6B8;
  v17[4] = a4;
  v17[5] = self;
  v17[6] = a3;
  v17[7] = &v18;
  v17[8] = &v24;
  objc_msgSend(a4, "performBlockAndWait:", v17);
  if (!*((_BYTE *)v25 + 24))
  {
    v8 = (id)v19[5];
    if (v8)
    {
      if (a5)
        *a5 = v8;
    }
    else
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        v30 = 1024;
        v31 = 1851;
        _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v19[5] = 0;
  v6 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v6;
}

- (BOOL)executeRequest:(id)a3 onMirroringDelegate:(id)a4 error:(id *)a5
{
  _PFRequestExecutor *v8;
  NSPersistentStoreResult *v9;
  NSObject *requestGroup;

  v8 = self;
  if (self)
    self = (_PFRequestExecutor *)self->_requestGroup;
  dispatch_group_enter(&self->super);
  v9 = -[NSCloudKitMirroringDelegate executeMirroringRequest:error:]((NSPersistentStoreResult *)a4, a3, (uint64_t *)a5);
  if (!v9)
  {
    if (v8)
      requestGroup = v8->_requestGroup;
    else
      requestGroup = 0;
    dispatch_group_leave(requestGroup);
  }
  return v9 != 0;
}

- (BOOL)wait
{
  NSObject *requestGroup;
  dispatch_time_t v3;

  requestGroup = self->_requestGroup;
  v3 = dispatch_time(0, 600000000000);
  return dispatch_group_wait(requestGroup, v3) == 0;
}

- (void)requestFinished
{
  if (self)
    self = (_PFRequestExecutor *)self->_requestGroup;
  dispatch_group_leave(&self->super);
}

@end
