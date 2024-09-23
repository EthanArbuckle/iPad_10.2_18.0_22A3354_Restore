@implementation HMDRemoteDeviceConfirmationHandler

- (HMDRemoteDeviceConfirmationHandler)initWithTimeoutTimer:(id)a3 workQueue:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDRemoteDeviceConfirmationHandler *v13;
  HMDRemoteDeviceConfirmationHandler *v14;
  void *v15;
  id handler;
  HMDRemoteDeviceConfirmationHandler *result;
  HMDRemoteDeviceConfirmationHandler *v18;
  SEL v19;
  id v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v18 = (HMDRemoteDeviceConfirmationHandler *)_HMFPreconditionFailure();
    -[HMDRemoteDeviceConfirmationHandler timerDidFire:](v18, v19, v20);
    return result;
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDRemoteDeviceConfirmationHandler;
  v13 = -[HMDRemoteDeviceConfirmationHandler init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_timeoutTimer, a3);
    objc_storeStrong((id *)&v14->_workQueue, a4);
    v15 = _Block_copy(v12);
    handler = v14->_handler;
    v14->_handler = v15;

  }
  return v14;
}

- (void)timerDidFire:(id)a3
{
  NSObject *v4;
  id v5;

  -[HMDRemoteDeviceConfirmationHandler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 13);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteDeviceConfirmationHandler finishWithError:](self, v5);

}

- (HMFTimer)timeoutTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 8, 1);
}

- (id)handler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

- (void)finishWithError:(void *)a1
{
  NSObject *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a2;
  if (a1)
  {
    objc_msgSend(a1, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    objc_msgSend(a1, "handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "handler");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setHandler:", 0);
      ((void (**)(_QWORD, id))v5)[2](v5, v6);

    }
  }

}

@end
