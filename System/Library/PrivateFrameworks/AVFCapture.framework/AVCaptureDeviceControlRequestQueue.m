@implementation AVCaptureDeviceControlRequestQueue

- (AVCaptureDeviceControlRequestQueue)init
{
  AVCaptureDeviceControlRequestQueue *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureDeviceControlRequestQueue;
  v2 = -[AVCaptureDeviceControlRequestQueue init](&v4, sel_init);
  if (v2)
  {
    v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.capturedevice.controlrequestqueue", 0);
    v2->_mutableArray = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
  }
  return v2;
}

id __42__AVCaptureDeviceControlRequestQueue_head__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstObject");
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

uint64_t __53__AVCaptureDeviceControlRequestQueue_enqueueRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)enqueueRequest:(id)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AVCaptureDeviceControlRequestQueue_enqueueRequest___block_invoke;
  v4[3] = &unk_1E4216408;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (id)head
{
  NSObject *serialQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVCaptureDeviceControlRequestQueue_head__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceControlRequestQueue;
  -[AVCaptureDeviceControlRequestQueue dealloc](&v3, sel_dealloc);
}

- (id)dequeue
{
  NSObject *serialQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVCaptureDeviceControlRequestQueue_dequeue__block_invoke;
  v5[3] = &unk_1E4217A60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVCaptureDeviceControlRequestQueue_dequeue__block_invoke(uint64_t a1)
{
  id v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstObject");
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

@end
