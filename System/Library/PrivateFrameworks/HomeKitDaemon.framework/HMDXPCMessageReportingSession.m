@implementation HMDXPCMessageReportingSession

- (HMDXPCMessageReportingSession)initWithUUID:(id)a3 reportContext:(id)a4 xpcClientConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDXPCMessageReportingSession *v12;
  uint64_t v13;
  NSUUID *UUID;
  uint64_t v15;
  HMReportContext *reportContext;
  uint64_t v17;
  NSMutableArray *responseMessagePayloads;
  HMDXPCMessageReportingSession *v20;
  SEL v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v20 = (HMDXPCMessageReportingSession *)_HMFPreconditionFailure();
    return (HMDXPCMessageReportingSession *)-[HMDXPCMessageReportingSession UUID](v20, v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDXPCMessageReportingSession;
  v12 = -[HMDXPCMessageReportingSession init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    v15 = objc_msgSend(v9, "copy");
    reportContext = v12->_reportContext;
    v12->_reportContext = (HMReportContext *)v15;

    objc_storeWeak((id *)&v12->_xpcClientConnection, v11);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    responseMessagePayloads = v12->_responseMessagePayloads;
    v12->_responseMessagePayloads = (NSMutableArray *)v17;

  }
  return v12;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMReportContext)reportContext
{
  return (HMReportContext *)objc_getProperty(self, a2, 16, 1);
}

- (HMDXPCClientConnection)xpcClientConnection
{
  return (HMDXPCClientConnection *)objc_loadWeakRetained((id *)&self->_xpcClientConnection);
}

- (void)setXpcClientConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcClientConnection, a3);
}

- (NSMutableArray)responseMessagePayloads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (HMFTimer)endSessionTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEndSessionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMFTimer)consumeSessionResultsTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConsumeSessionResultsTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumeSessionResultsTimer, 0);
  objc_storeStrong((id *)&self->_endSessionTimer, 0);
  objc_storeStrong((id *)&self->_responseMessagePayloads, 0);
  objc_destroyWeak((id *)&self->_xpcClientConnection);
  objc_storeStrong((id *)&self->_reportContext, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
