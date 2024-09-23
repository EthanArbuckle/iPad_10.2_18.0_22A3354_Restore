@implementation NTKFaceSupportUnlockAttemptEventRecorder

- (void)_queue_beginRecordingForIdentifier:(id)a3 method:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NTKFaceSupportPartialUnlockAttemptEvent *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  -[NTKFaceSupportUnlockAttemptEventRecorder queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = v8;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Argon: Trying to unlock %@ via %lu…", (uint8_t *)&v17, 0x16u);
  }

  -[NTKFaceSupportUnlockAttemptEventRecorder _validateIdentifier:](self, "_validateIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v9[2](v9, v12);
  }
  else
  {
    -[NTKFaceSupportUnlockAttemptEventRecorder lookup](self, "lookup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportUnlockAttemptEventRecorderErrorDomain"), 300, 0);
      v15 = (NTKFaceSupportPartialUnlockAttemptEvent *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v15);
    }
    else
    {
      v15 = -[NTKFaceSupportPartialUnlockAttemptEvent initWithIdentifier:method:]([NTKFaceSupportPartialUnlockAttemptEvent alloc], "initWithIdentifier:method:", v8, a4);
      if (v15)
      {
        objc_msgSend(v13, "setObject:forKey:", v15, v8);
        v9[2](v9, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportUnlockAttemptEventRecorderErrorDomain"), 400, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v16);

      }
    }

  }
}

- (NSMapTable)lookup
{
  return self->_lookup;
}

- (void)beginRecordingForIdentifier:(id)a3 method:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = (void *)objc_msgSend(v8, "copy");

    -[NTKFaceSupportUnlockAttemptEventRecorder queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __90__NTKFaceSupportUnlockAttemptEventRecorder_beginRecordingForIdentifier_method_completion___block_invoke;
    v12[3] = &unk_1E6BD0060;
    v12[4] = self;
    v8 = v10;
    v13 = v8;
    v15 = a4;
    v14 = v9;
    dispatch_async(v11, v12);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_validateIdentifier:(id)a3
{
  if (objc_msgSend(a3, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportUnlockAttemptEventRecorderErrorDomain"), 100, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedRecorder
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NTKFaceSupportUnlockAttemptEventRecorder_sharedRecorder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRecorder_onceToken != -1)
    dispatch_once(&sharedRecorder_onceToken, block);
  return (id)sharedRecorder_recorder;
}

uint64_t __90__NTKFaceSupportUnlockAttemptEventRecorder_beginRecordingForIdentifier_method_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_beginRecordingForIdentifier:method:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __58__NTKFaceSupportUnlockAttemptEventRecorder_sharedRecorder__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "eventRecorder");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedRecorder_recorder;
  sharedRecorder_recorder = v1;

}

- (void)endRecordingForIdentifier:(id)a3 status:(unint64_t)a4 errorCode:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  unint64_t v17;
  int64_t v18;

  v10 = a3;
  v11 = a6;
  if (v11)
  {
    v12 = (void *)objc_msgSend(v10, "copy");

    -[NTKFaceSupportUnlockAttemptEventRecorder queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__NTKFaceSupportUnlockAttemptEventRecorder_endRecordingForIdentifier_status_errorCode_completion___block_invoke;
    block[3] = &unk_1E6BD5EA0;
    block[4] = self;
    v10 = v12;
    v15 = v10;
    v17 = a4;
    v18 = a5;
    v16 = v11;
    dispatch_async(v13, block);

  }
}

uint64_t __98__NTKFaceSupportUnlockAttemptEventRecorder_endRecordingForIdentifier_status_errorCode_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endRecordingForIdentifier:status:errorCode:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

+ (id)eventRecorder
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_init");
}

- (id)_init
{
  NTKFaceSupportUnlockAttemptEventRecorder *v2;
  uint64_t v3;
  NSMapTable *lookup;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKFaceSupportUnlockAttemptEventRecorder;
  v2 = -[NTKFaceSupportUnlockAttemptEventRecorder init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    lookup = v2->_lookup;
    v2->_lookup = (NSMapTable *)v3;

    v5 = dispatch_queue_create("com.apple.nanotimekit.facesupport.recorders.unlock", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)_queue_endRecordingForIdentifier:(id)a3 status:(unint64_t)a4 errorCode:(int64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD, void *))a6;
  -[NTKFaceSupportUnlockAttemptEventRecorder queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412802;
    v21 = v10;
    v22 = 2048;
    v23 = a4;
    v24 = 2048;
    v25 = a5;
    _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "Argon: Finalized unlock of %@. Result %lu… (%ld)", (uint8_t *)&v20, 0x20u);
  }

  -[NTKFaceSupportUnlockAttemptEventRecorder _validateIdentifier:](self, "_validateIdentifier:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v11[2](v11, 0, v14);
  }
  else
  {
    -[NTKFaceSupportUnlockAttemptEventRecorder lookup](self, "lookup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "unlockAttemptWithStatus:errorCode:", a4, a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v15, "removeObjectForKey:", v10);
        ((void (**)(id, void *, void *))v11)[2](v11, v18, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportUnlockAttemptEventRecorderErrorDomain"), 500, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, 0, v19);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportUnlockAttemptEventRecorderErrorDomain"), 200, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, v18);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
