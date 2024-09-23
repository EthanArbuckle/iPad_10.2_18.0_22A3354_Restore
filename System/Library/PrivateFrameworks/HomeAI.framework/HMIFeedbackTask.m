@implementation HMIFeedbackTask

- (HMIFeedbackTask)initWithTaskID:(int)a3 cameraProfileUUID:(id)a4 clipUUID:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  HMIFeedbackTask *v10;
  HMIFeedbackSession *v11;
  HMIFeedbackSubmitClipOperation *v12;
  HMFOperation *operation;
  objc_super v15;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMIFeedbackTask;
  v10 = -[HMITask initWithTaskID:](&v15, sel_initWithTaskID_, v6);
  if (v10)
  {
    v11 = objc_alloc_init(HMIFeedbackSession);
    v12 = -[HMIFeedbackSubmitClipOperation initWithFeedbackSession:cameraProfileUUID:clipUUID:]([HMIFeedbackSubmitClipOperation alloc], "initWithFeedbackSession:cameraProfileUUID:clipUUID:", v11, v8, v9);
    operation = v10->_operation;
    v10->_operation = &v12->super;

  }
  return v10;
}

- (void)mainInsideAutoreleasePool
{
  HMFOperation *v3;
  _QWORD v4[5];
  id v5;
  id location;

  v3 = self->_operation;
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__HMIFeedbackTask_mainInsideAutoreleasePool__block_invoke;
  v4[3] = &unk_24DBEA030;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  -[HMFOperation setCompletionBlock:](v3, "setCompletionBlock:", v4);
  -[HMFOperation setQualityOfService:](v3, "setQualityOfService:", 9);
  -[HMFOperation start](v3, "start");
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __44__HMIFeedbackTask_mainInsideAutoreleasePool__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(WeakRetained, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelWithError:", v4);

  }
  else
  {
    objc_msgSend(v3, "finish");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
}

@end
