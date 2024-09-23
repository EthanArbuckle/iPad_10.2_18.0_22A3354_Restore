@implementation IDSVMDaemonResponseListener

- (IDSVMDaemonResponseListener)initWithRequestTimer:(id)a3
{
  id v5;
  NSObject *v6;
  IDSVMDaemonResponseListener *v7;
  IDSVMDaemonResponseListener *v8;
  IDSVMDaemonResponseListener *v9;
  objc_super v11;

  v5 = a3;
  if (_IDSRunningInDaemon())
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "vm");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907E9998((uint64_t)self, v6);

    v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSVMDaemonResponseListener;
    v8 = -[IDSVMDaemonResponseListener init](&v11, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_requestTimer, a3);
    self = v9;
    v7 = self;
  }

  return v7;
}

- (void)vmDataResponse:(id)a3 forRequestID:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IDSDaemonRequestTimer invalidateTimeoutAndReturnHandlerForRequestID:](self->_requestTimer, "invalidateTimeoutAndReturnHandlerForRequestID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "block");
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D36AA8], "vm");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412802;
      v17 = v9;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Calling out to completion block for vm request %@ data %@ error %@", (uint8_t *)&v16, 0x20u);
    }

    ((void (**)(_QWORD, id, id))v12)[2](v12, v8, v10);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907E9A28((uint64_t)v9, v14, v15);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTimer, 0);
}

@end
