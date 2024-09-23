@implementation _NSHTTPConnectionInfo

- (void)sendPingWithReceiveHandler:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___NSHTTPConnectionInfo_sendPingWithReceiveHandler___block_invoke;
  v7[3] = &unk_1E14FDF00;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (BOOL)isValid
{
  return self->_httpConnectionInfo != 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (id)initWithHTTPConnectionInfo:(void *)a3 queue:
{
  id v6;
  id *v7;
  objc_super v9;

  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_NSHTTPConnectionInfo;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

@end
