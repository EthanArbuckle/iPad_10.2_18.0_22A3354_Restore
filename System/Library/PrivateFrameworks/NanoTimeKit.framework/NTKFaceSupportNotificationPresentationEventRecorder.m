@implementation NTKFaceSupportNotificationPresentationEventRecorder

+ (id)sharedRecorder
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__NTKFaceSupportNotificationPresentationEventRecorder_sharedRecorder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRecorder_onceToken_0 != -1)
    dispatch_once(&sharedRecorder_onceToken_0, block);
  return (id)sharedRecorder_recorder_0;
}

void __69__NTKFaceSupportNotificationPresentationEventRecorder_sharedRecorder__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "eventRecorder");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedRecorder_recorder_0;
  sharedRecorder_recorder_0 = v1;

}

- (void)beginPresentationForIdentifier:(id)a3 pushDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (void *)objc_msgSend(v8, "copy");

    -[NTKFaceSupportNotificationPresentationEventRecorder queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __106__NTKFaceSupportNotificationPresentationEventRecorder_beginPresentationForIdentifier_pushDate_completion___block_invoke;
    v13[3] = &unk_1E6BD1840;
    v13[4] = self;
    v8 = v11;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_async(v12, v13);

  }
}

uint64_t __106__NTKFaceSupportNotificationPresentationEventRecorder_beginPresentationForIdentifier_pushDate_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_beginPresentationForIdentifier:pushDate:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)endPresentationForIdentifier:(id)a3 status:(int64_t)a4 artworkUsed:(int64_t)a5 errorCode:(int64_t)a6 optOutStatus:(int64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  id v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;

  v14 = a3;
  v15 = a8;
  if (v15)
  {
    v16 = (void *)objc_msgSend(v14, "copy");

    -[NTKFaceSupportNotificationPresentationEventRecorder queue](self, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __137__NTKFaceSupportNotificationPresentationEventRecorder_endPresentationForIdentifier_status_artworkUsed_errorCode_optOutStatus_completion___block_invoke;
    block[3] = &unk_1E6BD92C8;
    block[4] = self;
    v14 = v16;
    v19 = v14;
    v21 = a4;
    v22 = a5;
    v23 = a6;
    v24 = a7;
    v20 = v15;
    dispatch_async(v17, block);

  }
}

uint64_t __137__NTKFaceSupportNotificationPresentationEventRecorder_endPresentationForIdentifier_status_artworkUsed_errorCode_optOutStatus_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endPresentationForIdentifier:status:artworkUsed:errorCode:optOutStatus:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48));
}

+ (id)eventRecorder
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_init");
}

- (id)_init
{
  NTKFaceSupportNotificationPresentationEventRecorder *v2;
  uint64_t v3;
  NSMapTable *lookup;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKFaceSupportNotificationPresentationEventRecorder;
  v2 = -[NTKFaceSupportNotificationPresentationEventRecorder init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    lookup = v2->_lookup;
    v2->_lookup = (NSMapTable *)v3;

    v5 = dispatch_queue_create("com.apple.nanotimekit.facesupport.recorders.presentation", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)_queue_beginPresentationForIdentifier:(id)a3 pushDate:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  NTKFaceSupportPartialNotificationPresentationEvent *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[NTKFaceSupportNotificationPresentationEventRecorder queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);
  -[NTKFaceSupportNotificationPresentationEventRecorder _validateIdentifier:](self, "_validateIdentifier:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v9[2](v9, v11);
  }
  else
  {
    objc_msgSend(v8, "timeIntervalSinceNow");
    if (v12 <= 0.0)
    {
      -[NTKFaceSupportNotificationPresentationEventRecorder lookup](self, "lookup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportNotificationPresentationEventRecorderErrorDomain"), 300, 0);
        v15 = (NTKFaceSupportPartialNotificationPresentationEvent *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v15);
      }
      else
      {
        v15 = -[NTKFaceSupportPartialNotificationPresentationEvent initWithIdentifier:pushDate:]([NTKFaceSupportPartialNotificationPresentationEvent alloc], "initWithIdentifier:pushDate:", v17, v8);
        if (v15)
        {
          objc_msgSend(v13, "setObject:forKey:", v15, v17);
          v9[2](v9, 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportNotificationPresentationEventRecorderErrorDomain"), 400, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, v16);

        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportNotificationPresentationEventRecorderErrorDomain"), 600, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13);
    }

  }
}

- (void)_queue_endPresentationForIdentifier:(id)a3 status:(int64_t)a4 artworkUsed:(int64_t)a5 errorCode:(int64_t)a6 optOutStatus:(int64_t)a7 completion:(id)a8
{
  void (**v14)(id, _QWORD, void *);
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v14 = (void (**)(id, _QWORD, void *))a8;
  -[NTKFaceSupportNotificationPresentationEventRecorder queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);
  -[NTKFaceSupportNotificationPresentationEventRecorder _validateIdentifier:](self, "_validateIdentifier:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v14[2](v14, 0, v16);
  }
  else
  {
    -[NTKFaceSupportNotificationPresentationEventRecorder lookup](self, "lookup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "presentationEventWithStatus:artworkUsed:errorCode:optOutStatus:", a4, a5, a6, a7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v17, "removeObjectForKey:", v22);
        ((void (**)(id, void *, void *))v14)[2](v14, v20, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportNotificationPresentationEventRecorderErrorDomain"), 500, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, 0, v21);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportNotificationPresentationEventRecorderErrorDomain"), 200, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, 0, v20);
    }

  }
}

- (id)_validateIdentifier:(id)a3
{
  if (objc_msgSend(a3, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportNotificationPresentationEventRecorderErrorDomain"), 100, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)lookup
{
  return self->_lookup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
