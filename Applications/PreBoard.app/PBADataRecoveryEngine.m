@implementation PBADataRecoveryEngine

- (PBADataRecoveryEngine)initWithMobileKeyBag:(id)a3
{
  id v5;
  PBADataRecoveryEngine *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_queue_t v9;
  OS_dispatch_queue *calloutQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PBADataRecoveryEngine;
  v6 = -[PBADataRecoveryEngine init](&v12, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.preboard.datarecovery", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.preboard.datarecovery.callout", 0);
    calloutQueue = v6->_calloutQueue;
    v6->_calloutQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_queue_mobileKeyBag, a3);
  }

  return v6;
}

- (PBADataRecoveryEngine)init
{
  void *v3;
  PBADataRecoveryEngine *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SBFMobileKeyBag sharedInstance](SBFMobileKeyBag, "sharedInstance"));
  v4 = -[PBADataRecoveryEngine initWithMobileKeyBag:](self, "initWithMobileKeyBag:", v3);

  return v4;
}

- (BOOL)requiresDataRecovery
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006228;
  v5[3] = &unk_100018950;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)dataRecoveryPossible
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006304;
  v5[3] = &unk_100018950;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)performDataRecoveryWithPasscode:(id)a3 progressHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006418;
  v15[3] = &unk_100018978;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)_queue_performDataRecoveryWithPasscode:(id)a3 progressHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBFMobileKeyBag *queue_mobileKeyBag;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *calloutQueue;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue_mobileKeyBag = self->_queue_mobileKeyBag;
  v34 = 0;
  v12 = -[SBFMobileKeyBag beginRecovery:error:](queue_mobileKeyBag, "beginRecovery:error:", v8, &v34);
  v13 = v34;
  v14 = v13;
  if (!v12)
  {
    v23 = v13;
    if (!v10)
      goto LABEL_19;
    goto LABEL_18;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SBFMobileKeyBag state](self->_queue_mobileKeyBag, "state"));
  v16 = objc_msgSend(v15, "escrowCount");
  if ((unint64_t)v16 <= 1)
    v18 = 1;
  else
    v18 = (uint64_t)v16;
  if (v18 >= 1)
  {
    while (1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SBFMobileKeyBag state](self->_queue_mobileKeyBag, "state"));
      v20 = objc_msgSend(v19, "escrowCount");
      v21 = (uint64_t)v20;
      if (v9)
      {
        calloutQueue = self->_calloutQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000066CC;
        block[3] = &unk_1000189A0;
        v32 = v18;
        v33 = v20;
        v31 = v9;
        dispatch_async(calloutQueue, block);

      }
      if (v21 <= 0)
        break;
      usleep(0x411Au);

    }
  }
  LODWORD(v17) = 10.0;
  -[SBFMobileKeyBag waitForUnlockWithTimeout:](self->_queue_mobileKeyBag, "waitForUnlockWithTimeout:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SBFMobileKeyBag state](self->_queue_mobileKeyBag, "state"));
  if (objc_msgSend(v24, "lockState") && objc_msgSend(v24, "recoveryRequired"))
  {
    v35 = NSLocalizedDescriptionKey;
    v36 = CFSTR("Data recovery failed");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.preboard.dr"), 1, v25));

  }
  else
  {
    v23 = 0;
  }

  if (v10)
  {
LABEL_18:
    v26 = self->_calloutQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000066EC;
    v27[3] = &unk_1000189C8;
    v29 = v10;
    v28 = v23;
    dispatch_async(v26, v27);

  }
LABEL_19:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_mobileKeyBag, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
