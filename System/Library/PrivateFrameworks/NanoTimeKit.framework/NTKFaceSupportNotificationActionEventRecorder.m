@implementation NTKFaceSupportNotificationActionEventRecorder

- (NTKFaceSupportNotificationActionEventRecorder)initWithFilePath:(id)a3
{
  id v4;
  NTKFaceSupportDateDatabase *v5;
  NTKFaceSupportNotificationActionEventRecorder *v6;
  NTKFaceSupportNotificationActionEventRecorder *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NTKFaceSupportNotificationActionEventRecorder *v10;
  objc_super v12;

  v4 = a3;
  v5 = -[NTKFaceSupportDateDatabase initWithFileAtPath:]([NTKFaceSupportDateDatabase alloc], "initWithFileAtPath:", v4);

  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)NTKFaceSupportNotificationActionEventRecorder;
    v6 = -[NTKFaceSupportNotificationActionEventRecorder init](&v12, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_database, v5);
      v8 = dispatch_queue_create("com.apple.nanotimekit.facesupport.recorders.action", 0);
      queue = v7->_queue;
      v7->_queue = (OS_dispatch_queue *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)filePath
{
  void *v2;
  void *v3;

  -[NTKFaceSupportNotificationActionEventRecorder database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)beginPresentationForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_msgSend(v6, "copy");

    -[NTKFaceSupportNotificationActionEventRecorder queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__NTKFaceSupportNotificationActionEventRecorder_beginPresentationForIdentifier_completion___block_invoke;
    block[3] = &unk_1E6BCD820;
    block[4] = self;
    v6 = v8;
    v11 = v6;
    v12 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __91__NTKFaceSupportNotificationActionEventRecorder_beginPresentationForIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_beginPresentationForIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)endPresentationForIdentifier:(id)a3 withAction:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = (void *)objc_msgSend(v8, "copy");

    -[NTKFaceSupportNotificationActionEventRecorder queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__NTKFaceSupportNotificationActionEventRecorder_endPresentationForIdentifier_withAction_completion___block_invoke;
    v12[3] = &unk_1E6BD0060;
    v12[4] = self;
    v8 = v10;
    v13 = v8;
    v15 = a4;
    v14 = v9;
    dispatch_async(v11, v12);

  }
}

uint64_t __100__NTKFaceSupportNotificationActionEventRecorder_endPresentationForIdentifier_withAction_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_endPresentationForIdentifier:withAction:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_queue_beginPresentationForIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *))a4;
  -[NTKFaceSupportNotificationActionEventRecorder queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);
  -[NTKFaceSupportNotificationActionEventRecorder _validateIdentifier:](self, "_validateIdentifier:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v6[2](v6, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSupportNotificationActionEventRecorder database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordDate:bundleIdentifier:completion:", v9, v11, v6);

  }
}

- (void)_queue_endPresentationForIdentifier:(id)a3 withAction:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  void (**v17)(id, _QWORD, void *);
  int64_t v18;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[NTKFaceSupportNotificationActionEventRecorder queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);
  -[NTKFaceSupportNotificationActionEventRecorder _validateIdentifier:](self, "_validateIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v9[2](v9, 0, v11);
  }
  else
  {
    -[NTKFaceSupportNotificationActionEventRecorder database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __107__NTKFaceSupportNotificationActionEventRecorder__queue_endPresentationForIdentifier_withAction_completion___block_invoke;
    v14[3] = &unk_1E6BDB1F0;
    v17 = v9;
    v18 = a4;
    v15 = v8;
    v16 = v12;
    v13 = v12;
    objc_msgSend(v13, "retreiveDateForBundleIdentifier:completion:", v15, v14);

  }
}

void __107__NTKFaceSupportNotificationActionEventRecorder__queue_endPresentationForIdentifier_withAction_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  NTKFaceSupportNotificationActionEvent *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  NTKFaceSupportNotificationActionEvent *v13;
  id v14;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = -[NTKFaceSupportNotificationActionEvent initWithBundleIdentifier:action:delayFromPresentation:]([NTKFaceSupportNotificationActionEvent alloc], "initWithBundleIdentifier:action:delayFromPresentation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v7);
    if (v8)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __107__NTKFaceSupportNotificationActionEventRecorder__queue_endPresentationForIdentifier_withAction_completion___block_invoke_2;
      v12[3] = &unk_1E6BDB1C8;
      v14 = *(id *)(a1 + 48);
      v13 = v8;
      objc_msgSend(v9, "deleteDateForBundleIdentifier:completion:", v10, v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportNotificationActionEventRecorderErrorDomain"), 500, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }

}

uint64_t __107__NTKFaceSupportNotificationActionEventRecorder__queue_endPresentationForIdentifier_withAction_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

- (id)_validateIdentifier:(id)a3
{
  if (objc_msgSend(a3, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportNotificationActionEventRecorderErrorDomain"), 100, 0);
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

- (NTKFaceSupportDateDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
