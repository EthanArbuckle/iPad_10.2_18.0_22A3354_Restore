@implementation IDSReportiMessageSpamDaemonResponseListener

- (IDSReportiMessageSpamDaemonResponseListener)initWithRequestTimer:(id)a3
{
  id v5;
  NSObject *v6;
  IDSReportiMessageSpamDaemonResponseListener *v7;
  IDSReportiMessageSpamDaemonResponseListener *v8;
  IDSReportiMessageSpamDaemonResponseListener *v9;
  objc_super v11;

  v5 = a3;
  if (_IDSRunningInDaemon())
  {
    +[IDSTransportLog IDSReportSpam](IDSTransportLog, "IDSReportSpam");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907E7DEC((uint64_t)self, v6);

    v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSReportiMessageSpamDaemonResponseListener;
    v8 = -[IDSReportiMessageSpamDaemonResponseListener init](&v11, sel_init);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_requestTimer, a3);
    self = v9;
    v7 = self;
  }

  return v7;
}

- (void)iMessageReportSpamCheckUnknownResponseForRequestID:(id)a3 status:(int64_t)a4 abusive:(BOOL)a5 delay:(double)a6 withError:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  _QWORD v17[4];
  id v18;
  id v19;
  double v20;
  BOOL v21;

  v11 = a7;
  -[IDSDaemonRequestTimer invalidateTimeoutAndReturnHandlerForRequestID:](self->_requestTimer, "invalidateTimeoutAndReturnHandlerForRequestID:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "block");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (!v16)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_19076886C;
    v17[3] = &unk_1E2C631A8;
    v18 = v11;
    v19 = v13;
    v21 = a5;
    v20 = a6;
    dispatch_async(v15, v17);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTimer, 0);
}

@end
