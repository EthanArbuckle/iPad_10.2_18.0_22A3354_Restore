@implementation CMCaptureUserNotificationManager

- (CMCaptureUserNotificationManager)init
{
  CMCaptureUserNotificationManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMCaptureUserNotificationManager;
  v2 = -[CMCaptureUserNotificationManager init](&v4, sel_init);
  if (v2)
  {
    v2->_notificationDictionary = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("CMCaptureUserNotificationManager", 0);
    v2->_responseGroup = (OS_dispatch_group *)dispatch_group_create();
  }
  return v2;
}

- (void)dealloc
{
  CMCaptureUserNotification *notification;
  objc_super v4;

  notification = self->_notification;
  if (notification)
  {
    -[CMCaptureUserNotification cancel](notification, "cancel");
    -[CMCaptureUserNotificationManager _endNotification](self, "_endNotification");
  }

  v4.receiver = self;
  v4.super_class = (Class)CMCaptureUserNotificationManager;
  -[CMCaptureUserNotificationManager dealloc](&v4, sel_dealloc);
}

- (unint64_t)flags
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__CMCaptureUserNotificationManager_flags__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__CMCaptureUserNotificationManager_flags__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (NSDictionary)notificationDictionary
{
  NSObject *queue;
  NSDictionary *v3;
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
  v9 = __Block_byref_object_copy__20;
  v10 = __Block_byref_object_dispose__20;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CMCaptureUserNotificationManager_notificationDictionary__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSDictionary *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __58__CMCaptureUserNotificationManager_notificationDictionary__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setNotificationFlags:(unint64_t)a3 andDictionary:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CMCaptureUserNotificationManager_setNotificationFlags_andDictionary___block_invoke;
  block[3] = &unk_1E491EC68;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
}

void *__71__CMCaptureUserNotificationManager_setNotificationFlags_andDictionary___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  void *result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 48);
  v2 = *(id *)(a1 + 40);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD **)(a1 + 32);
  result = (void *)v3[6];
  if (result)
    return (void *)objc_msgSend(result, "updateWithTimeout:flags:dictionary:", v3[1], v3[2], 0.0);
  return result;
}

- (NSNumber)response
{
  NSObject *queue;
  NSNumber *v3;
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
  v9 = __Block_byref_object_copy__20;
  v10 = __Block_byref_object_dispose__20;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CMCaptureUserNotificationManager_response__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (NSNumber *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__CMCaptureUserNotificationManager_response__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (void)setResponse:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__CMCaptureUserNotificationManager_setResponse___block_invoke;
  v4[3] = &unk_1E491E748;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(queue, v4);
}

void __48__CMCaptureUserNotificationManager_setResponse___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = *(id *)(a1 + 32);

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v3 + 24))
  {
    v4 = *(void **)(v3 + 48);
    if (v4)
    {
      objc_msgSend(v4, "cancel");
      objc_msgSend(*(id *)(a1 + 40), "_endNotification");
    }
  }
}

- (BOOL)hasResponse
{
  return -[CMCaptureUserNotificationManager response](self, "response") != 0;
}

- (BOOL)responseWasDefault
{
  NSNumber *v2;

  v2 = -[CMCaptureUserNotificationManager response](self, "response");
  if (v2)
    LOBYTE(v2) = (-[NSNumber unsignedLongValue](v2, "unsignedLongValue") & 3) == 0;
  return (char)v2;
}

- (BOOL)responseWasAlternate
{
  NSNumber *v2;

  v2 = -[CMCaptureUserNotificationManager response](self, "response");
  if (v2)
    LOBYTE(v2) = (-[NSNumber unsignedLongValue](v2, "unsignedLongValue") & 3) == 1;
  return (char)v2;
}

- (BOOL)responseWasOther
{
  NSNumber *v2;

  v2 = -[CMCaptureUserNotificationManager response](self, "response");
  if (v2)
    LOBYTE(v2) = (-[NSNumber unsignedLongValue](v2, "unsignedLongValue") & 3) == 2;
  return (char)v2;
}

- (BOOL)responseWasCancelled
{
  NSNumber *v2;

  v2 = -[CMCaptureUserNotificationManager response](self, "response");
  if (v2)
    LOBYTE(v2) = (~-[NSNumber unsignedLongValue](v2, "unsignedLongValue") & 3) == 0;
  return (char)v2;
}

- (id)showNotification
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__20;
  v13 = __Block_byref_object_dispose__20;
  v14 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__CMCaptureUserNotificationManager_showNotification__block_invoke;
  v6[3] = &unk_1E4922228;
  v6[4] = self;
  v6[5] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(queue, v6);
  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);
  return v4;
}

id *__52__CMCaptureUserNotificationManager_showNotification__block_invoke(id *result)
{
  id *v1;
  id *v2;
  CMCaptureUserNotification *v3;
  _QWORD *v4;
  CMCaptureUserNotification *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9[2];

  v1 = (id *)result[4];
  if (!v1[6])
  {
    v2 = result;

    *((_QWORD *)v2[4] + 3) = 0;
    v3 = +[CMCaptureUserNotification notificationWithTimeout:flags:dictionary:error:](CMCaptureUserNotification, "notificationWithTimeout:flags:dictionary:error:", *((_QWORD *)v2[4] + 1), *((_QWORD *)v2[4] + 2), *((_QWORD *)v2[5] + 1) + 40, 0.0);
    v4 = v2[5];
    if (v3)
    {
      if (!*(_QWORD *)(v4[1] + 40))
      {
        v5 = v3;
        v6 = (void *)objc_msgSend(v2[4], "_beginNotification:", v3);
        v7 = *((_QWORD *)v2[4] + 4);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __52__CMCaptureUserNotificationManager_showNotification__block_invoke_2;
        v8[3] = &unk_1E4922200;
        objc_copyWeak(v9, v2 + 6);
        v9[1] = v6;
        -[CMCaptureUserNotification asyncResponse:block:](v5, "asyncResponse:block:", v7, v8);
        objc_destroyWeak(v9);
        v4 = v2[5];
      }
    }
    return (id *)*(id *)(v4[1] + 40);
  }
  return result;
}

id __52__CMCaptureUserNotificationManager_showNotification__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id result;
  _QWORD *v5;

  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    v5 = result;
    if (*(_QWORD *)(a1 + 40) == *((_QWORD *)result + 7))
    {

      v5[3] = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a2);
      return (id)objc_msgSend(v5, "_endNotification");
    }
  }
  return result;
}

- (id)cancelNotification
{
  NSObject *queue;
  id v3;
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
  v9 = __Block_byref_object_copy__20;
  v10 = __Block_byref_object_dispose__20;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__CMCaptureUserNotificationManager_cancelNotification__block_invoke;
  v5[3] = &unk_1E491F1A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __54__CMCaptureUserNotificationManager_cancelNotification__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(result, "cancel");
    objc_msgSend(*(id *)(a1 + 32), "_endNotification");
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return result;
}

- (unint64_t)_beginNotification:(id)a3
{
  if (a3 && !self->_notification)
  {
    self->_notification = (CMCaptureUserNotification *)a3;
    dispatch_group_enter((dispatch_group_t)self->_responseGroup);
  }
  return self->_notificationCount;
}

- (void)_endNotification
{
  CMCaptureUserNotification *notification;
  unint64_t v4;

  notification = self->_notification;
  if (notification)
  {

    v4 = self->_notificationCount + 1;
    self->_notification = 0;
    self->_notificationCount = v4;
    dispatch_group_leave((dispatch_group_t)self->_responseGroup);
  }
}

- (id)waitForResponse
{
  return -[CMCaptureUserNotificationManager waitForResponseUntilTimeout:](self, "waitForResponseUntilTimeout:", 0.0);
}

- (id)waitForResponseUntilTimeout:(double)a3
{
  dispatch_time_t v4;

  if (a3 == 0.0)
    v4 = -1;
  else
    v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_group_wait((dispatch_group_t)self->_responseGroup, v4);
  return -[CMCaptureUserNotificationManager response](self, "response");
}

- (void)asyncResponse:(id)a3 block:(id)a4
{
  NSObject *queue;
  NSObject *responseGroup;
  _QWORD block[7];

  queue = self->_queue;
  responseGroup = self->_responseGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CMCaptureUserNotificationManager_asyncResponse_block___block_invoke;
  block[3] = &unk_1E4922250;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_group_notify(responseGroup, queue, block);
}

void __56__CMCaptureUserNotificationManager_asyncResponse_block___block_invoke(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[6];

  v2 = *(id *)(a1[4] + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CMCaptureUserNotificationManager_asyncResponse_block___block_invoke_2;
  v5[3] = &unk_1E491F480;
  v3 = a1[5];
  v4 = a1[6];
  v5[4] = v2;
  v5[5] = v4;
  dispatch_async(v3, v5);
}

void __56__CMCaptureUserNotificationManager_asyncResponse_block___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
