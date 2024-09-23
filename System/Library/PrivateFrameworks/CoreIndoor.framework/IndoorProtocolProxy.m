@implementation IndoorProtocolProxy

- (void)indoorGivesUpWithLocation:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend_delegate(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_indoorGivesUpWithLocation_(v8, v9, (uint64_t)v12, v10, v11);

}

- (IndoorProtocolProxy)initWithDelegate:(id)a3
{
  id v4;
  IndoorProtocolProxy *v5;
  const char *v6;
  IndoorProtocolProxy *v7;
  IndoorProtocolProxy *v8;
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IndoorProtocolProxy;
  v5 = -[IndoorProtocolProxy init](&v11, sel_init);
  v7 = v5;
  if (v5)
  {
    if (!v4)
    {
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v6, *MEMORY[0x24BDBCAB8], (uint64_t)CFSTR("no delegate"), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    objc_storeWeak((id *)&v5->_delegate, v4);
    v8 = v7;
  }

  return v7;
}

- (CLIndoorDelegateProtocol)delegate
{
  return (CLIndoorDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownReason, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)indoorDidUpdateToLocation:(id)a3 fromLocation:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend_delegate(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indoorDidUpdateToLocation_fromLocation_(v11, v12, (uint64_t)v14, (uint64_t)v6, v13);

}

- (void)indoorIsUncertainWithLocation:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend_delegate(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_indoorIsUncertainWithLocation_(v8, v9, (uint64_t)v12, v10, v11);

}

- (void)indoorAssetDownloadProgress:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  id v12;

  objc_msgSend_delegate(self, a2, v3, v4, v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v11 = a3;
    objc_msgSend_indoorAssetDownloadProgress_(v12, v7, v8, v9, v10, v11);
  }

}

- (void)indoorDidFailWithError:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend_delegate(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_indoorDidFailWithError_(v8, v9, (uint64_t)v12, v10, v11);

}

- (void)indoorDidShutdown:(id)a3
{
  NSError *v4;
  NSError *shutdownReason;
  id v6;
  const char *v7;

  v4 = (NSError *)a3;
  if (!v4)
  {
    NSLog(CFSTR("ERROR - didn't get a reason for shutting down"));
    v6 = objc_alloc(MEMORY[0x24BDD1540]);
    v4 = (NSError *)objc_msgSend_initWithDomain_code_userInfo_(v6, v7, (uint64_t)CFSTR("com.apple.pipelined"), -1, (uint64_t)&unk_24D575690);
  }
  shutdownReason = self->_shutdownReason;
  self->_shutdownReason = v4;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)shutdownReason
{
  return self->_shutdownReason;
}

@end
