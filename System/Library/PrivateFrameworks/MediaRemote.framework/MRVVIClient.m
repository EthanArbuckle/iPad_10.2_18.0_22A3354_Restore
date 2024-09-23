@implementation MRVVIClient

+ (id)sharedClient
{
  if (sharedClient___once != -1)
    dispatch_once(&sharedClient___once, &__block_literal_global_96);
  return (id)sharedClient___sharedClient;
}

void __27__MRVVIClient_sharedClient__block_invoke()
{
  MRVVIClient *v0;
  void *v1;

  v0 = objc_alloc_init(MRVVIClient);
  v1 = (void *)sharedClient___sharedClient;
  sharedClient___sharedClient = (uint64_t)v0;

}

- (MRVVIClient)init
{
  MRVVIClient *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *deviceIDToCallbackMap;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRVVIClient;
  v2 = -[MRVVIClient init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceIDToCallbackMap = v2->_deviceIDToCallbackMap;
    v2->_deviceIDToCallbackMap = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.MRVVIClient", v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__recordingStateChangedNotification_, CFSTR("kMRVirtualVoiceInputRecordingStateDidChangeNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRVVIClient;
  -[MRVVIClient dealloc](&v4, sel_dealloc);
}

- (void)setRecordingStateCallback:(id)a3 forDeviceID:(unsigned int)a4
{
  void *v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = (void *)objc_msgSend(a3, "copy");
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MRVVIClient_setRecordingStateCallback_forDeviceID___block_invoke;
  block[3] = &unk_1E30C7638;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(serialQueue, block);

}

void __53__MRVVIClient_setRecordingStateCallback_forDeviceID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (id)MEMORY[0x194036C44]();
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, v3);

  }
  else
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:");
  }

}

- (void)_recordingStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *serialQueue;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__42;
  v18 = __Block_byref_object_dispose__42;
  v19 = 0;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kMRVirtualVoiceInputDeviceIDUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MRVVIClient__recordingStateChangedNotification___block_invoke;
    block[3] = &unk_1E30C74D0;
    v13 = &v14;
    block[4] = self;
    v12 = v6;
    dispatch_sync(serialQueue, block);

  }
  if (v15[5])
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("kMRVirtualVoiceInputRecordingStateUserInfoKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntValue");

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15[5] + 16))(v15[5], objc_msgSend(v6, "unsignedIntValue"), v10);
  }

  _Block_object_dispose(&v14, 8);
}

void __50__MRVVIClient__recordingStateChangedNotification___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_deviceIDToCallbackMap, 0);
}

@end
