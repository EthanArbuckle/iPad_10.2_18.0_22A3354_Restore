@implementation _BRCFrameworkOperation

- (id)descriptionAdditionalStringWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("remote:%p"), self->_remoteClientProxy);
}

- (void)setRemoteClientProxy:(id)a3
{
  id v4;
  _BRCFrameworkOperation *v5;
  uint64_t v6;
  BROperationClient *remoteClientProxy;
  _QWORD v8[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___BRCFrameworkOperation_setRemoteClientProxy___block_invoke;
  v8[3] = &unk_1E875D850;
  v8[4] = v5;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = objc_claimAutoreleasedReturnValue();
  remoteClientProxy = v5->_remoteClientProxy;
  v5->_remoteClientProxy = (BROperationClient *)v6;

  -[BROperationClient setRemoteOperationProxy:userInfo:](v5->_remoteClientProxy, "setRemoteOperationProxy:userInfo:", v5, 0);
  objc_sync_exit(v5);

}

- (void)invalidate
{
  if (!self->_startedFinish)
    -[_BRCOperation cancel](self, "cancel");
  -[_BRCFrameworkOperation setRemoteClientProxy:](self, "setRemoteClientProxy:", 0);
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _remoteClientProxy || _ignoreMissingRemoteClientProxy%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  objc_super v5;

  self->_startedFinish = 1;
  v5.receiver = self;
  v5.super_class = (Class)_BRCFrameworkOperation;
  -[_BRCOperation finishWithResult:error:](&v5, sel_finishWithResult_error_, a3, a4);
  -[_BRCFrameworkOperation setRemoteClientProxy:](self, "setRemoteClientProxy:", 0);
}

- (BROperationClient)remoteClientProxy
{
  return self->_remoteClientProxy;
}

- (BOOL)ignoreMissingRemoteClientProxy
{
  return self->_ignoreMissingRemoteClientProxy;
}

- (void)setIgnoreMissingRemoteClientProxy:(BOOL)a3
{
  self->_ignoreMissingRemoteClientProxy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteClientProxy, 0);
}

@end
