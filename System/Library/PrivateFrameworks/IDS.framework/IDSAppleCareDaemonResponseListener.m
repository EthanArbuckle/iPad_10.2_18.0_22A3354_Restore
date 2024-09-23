@implementation IDSAppleCareDaemonResponseListener

- (IDSAppleCareDaemonResponseListener)initWithRequestTimer:(id)a3
{
  id v5;
  IDSAppleCareDaemonResponseListener *v6;
  IDSAppleCareDaemonResponseListener *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSAppleCareDaemonResponseListener;
  v6 = -[IDSAppleCareDaemonResponseListener init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestTimer, a3);

  return v7;
}

- (IDSAppleCareDaemonResponseListener)initWithDisconnectedBlockAndNoTimeout:(id)a3
{
  id v4;
  IDSAppleCareDaemonResponseListener *v5;
  uint64_t v6;
  id disconnectedBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSAppleCareDaemonResponseListener;
  v5 = -[IDSAppleCareDaemonResponseListener init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    disconnectedBlock = v5->_disconnectedBlock;
    v5->_disconnectedBlock = (id)v6;

  }
  return v5;
}

- (void)applecareResponseForRequestID:(id)a3 withError:(id)a4
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
    v12[2] = sub_19072241C;
    v12[3] = &unk_1E2C60820;
    v13 = v6;
    v14 = v8;
    dispatch_async(v10, v12);

  }
}

- (void)daemonDisconnected
{
  void (**disconnectedBlock)(void);

  disconnectedBlock = (void (**)(void))self->_disconnectedBlock;
  if (disconnectedBlock)
    disconnectedBlock[2]();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectedBlock, 0);
  objc_storeStrong((id *)&self->_requestTimer, 0);
}

@end
