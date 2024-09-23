@implementation IDSRegistrationControlDaemonResponseListener

- (IDSRegistrationControlDaemonResponseListener)initWithRequestTimer:(id)a3
{
  id v5;
  NSObject *v6;
  IDSRegistrationControlDaemonResponseListener *v7;
  IDSRegistrationControlDaemonResponseListener *v8;
  IDSRegistrationControlDaemonResponseListener *v9;
  objc_super v11;

  v5 = a3;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging general](IDSLogging, "general");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907E7DEC((uint64_t)self, v6);

    v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSRegistrationControlDaemonResponseListener;
    v8 = -[IDSRegistrationControlDaemonResponseListener init](&v11, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_requestTimer, a3);
    self = v9;
    v7 = self;
  }

  return v7;
}

- (void)registrationControlResponseForRequestID:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  -[IDSDaemonRequestTimer invalidateTimeoutAndReturnHandlerForRequestID:](self->_requestTimer, "invalidateTimeoutAndReturnHandlerForRequestID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "block");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_190733E1C;
    v12[3] = &unk_1E2C60820;
    v13 = v6;
    v14 = v8;
    dispatch_async(v10, v12);

  }
}

- (void)registrationControlStatusResponseForRequestID:(int64_t)a3 requestID:(id)a4 withError:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  int v13;
  void (**v14)(_QWORD);
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int64_t v19;

  v8 = a5;
  -[IDSDaemonRequestTimer invalidateTimeoutAndReturnHandlerForRequestID:](self->_requestTimer, "invalidateTimeoutAndReturnHandlerForRequestID:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "block");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isSync");
  if (v10)
  {
    v13 = v12;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_190733F4C;
    v16[3] = &unk_1E2C61830;
    v17 = v8;
    v18 = v10;
    v19 = a3;
    v14 = (void (**)(_QWORD))MEMORY[0x19400FE1C](v16);
    v15 = v14;
    if (v13)
    {
      v14[2](v14);
    }
    else if (v11)
    {
      dispatch_async(v11, v14);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTimer, 0);
}

@end
