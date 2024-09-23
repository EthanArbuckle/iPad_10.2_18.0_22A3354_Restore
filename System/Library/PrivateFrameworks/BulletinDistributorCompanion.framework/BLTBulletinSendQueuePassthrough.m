@implementation BLTBulletinSendQueuePassthrough

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5 didQueue:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[BLTBulletinSendQueuePassthrough delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendRequest:type:withTimeout:didSend:didQueue:", v12, v7, 0, v11, v10);

}

- (void)sendRequest:(id)a3 withTimeout:(id)a4 isTrafficRestricted:(BOOL)a5 didSend:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  -[BLTBulletinSendQueuePassthrough delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendRequest:type:withTimeout:didSend:didQueue:", v11, 1, v10, v9, 0);

}

- (void)sendRequest:(id)a3 withTimeout:(id)a4 didSend:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BLTBulletinSendQueuePassthrough delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendRequest:type:withTimeout:didSend:didQueue:", v10, 27, v9, v8, 0);

}

- (BOOL)handleFileURL:(id)a3
{
  return 0;
}

- (BLTBulletinSendQueueDelegate)delegate
{
  return (BLTBulletinSendQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
