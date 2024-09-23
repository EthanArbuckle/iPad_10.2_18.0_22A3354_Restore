@implementation BDSClientSideListener

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)handleServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v6 = a3;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleServiceNotificationNames_latestChangeToken_(v13, v11, (uint64_t)v6, a4, v12);

}

- (BDSClientSideProtocol)delegate
{
  return (BDSClientSideProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
