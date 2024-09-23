@implementation MSVSystemDialogManager

- (MSVSystemDialogManager)init
{
  MSVSystemDialogManager *v2;
  const char *ClassName;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSVSystemDialogManager;
  v2 = -[MSVSystemDialogManager init](&v7, sel_init);
  if (v2)
  {
    v2->_registeredSystemDialogs = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    ClassName = object_getClassName(v2);
    v4 = dispatch_queue_create(ClassName, 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_registeredSystemDialogs);
  v3.receiver = self;
  v3.super_class = (Class)MSVSystemDialogManager;
  -[MSVSystemDialogManager dealloc](&v3, sel_dealloc);
}

- (void)registerSystemDialog:(id)a3 forUserNotification:(__CFUserNotification *)a4
{
  id v6;
  NSObject *serialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  __CFUserNotification *v11;

  v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MSVSystemDialogManager_registerSystemDialog_forUserNotification___block_invoke;
  block[3] = &unk_1E43E9698;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_sync(serialQueue, block);

}

- (id)systemDialogForUserNotification:(__CFUserNotification *)a3
{
  NSObject *serialQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3749;
  v11 = __Block_byref_object_dispose__3750;
  v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MSVSystemDialogManager_systemDialogForUserNotification___block_invoke;
  block[3] = &unk_1E43E9E18;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)unregisterSystemDialogWithUserNotification:(__CFUserNotification *)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__MSVSystemDialogManager_unregisterSystemDialogWithUserNotification___block_invoke;
  v4[3] = &unk_1E43E96C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __69__MSVSystemDialogManager_unregisterSystemDialogWithUserNotification___block_invoke(uint64_t a1)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
}

void __58__MSVSystemDialogManager_systemDialogForUserNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __67__MSVSystemDialogManager_registerSystemDialog_forUserNotification___block_invoke(uint64_t a1)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 48), *(const void **)(a1 + 40));
}

+ (id)sharedManager
{
  if (sharedManager___once != -1)
    dispatch_once(&sharedManager___once, &__block_literal_global_3752);
  return (id)sharedManager___sharedManager;
}

void __39__MSVSystemDialogManager_sharedManager__block_invoke()
{
  MSVSystemDialogManager *v0;
  void *v1;

  v0 = objc_alloc_init(MSVSystemDialogManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

}

@end
