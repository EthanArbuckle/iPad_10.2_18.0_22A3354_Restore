@implementation HMDDataStreamBulkSendPendingSessionContext

- (HMDDataStreamBulkSendPendingSessionContext)initWithSessionStartCallback:(id)a3 handleOpenRequestResponseTimer:(id)a4 sendCloseEventTimer:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDDataStreamBulkSendPendingSessionContext *v11;
  void *v12;
  id sessionStartCallback;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDDataStreamBulkSendPendingSessionContext;
  v11 = -[HMDDataStreamBulkSendPendingSessionContext init](&v15, sel_init);
  if (v11)
  {
    v12 = _Block_copy(v8);
    sessionStartCallback = v11->_sessionStartCallback;
    v11->_sessionStartCallback = v12;

    objc_storeStrong((id *)&v11->_handleOpenRequestResponseTimer, a4);
    objc_storeStrong((id *)&v11->_sendCloseEventTimer, a5);
  }

  return v11;
}

- (BOOL)shouldCloseSessionWithTimeoutReason
{
  void *v3;
  BOOL v4;
  void *v5;

  -[HMDDataStreamBulkSendPendingSessionContext handleOpenRequestResponseTimer](self, "handleOpenRequestResponseTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[HMDDataStreamBulkSendPendingSessionContext sendCloseEventTimer](self, "sendCloseEventTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)sessionStartCallback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (HMFTimer)handleOpenRequestResponseTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHandleOpenRequestResponseTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMFTimer)sendCloseEventTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSendCloseEventTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendCloseEventTimer, 0);
  objc_storeStrong((id *)&self->_handleOpenRequestResponseTimer, 0);
  objc_storeStrong(&self->_sessionStartCallback, 0);
}

@end
