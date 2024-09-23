@implementation MTRDeviceControllerXPCConnection

- (MTRDeviceControllerXPCConnection)initWithWorkQueue:(id)a3 connectBlock:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  MTRDeviceControllerXPCConnection *v11;
  uint64_t v12;
  NSXPCInterface *remoteDeviceServerProtocol;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSXPCInterface *remoteDeviceClientProtocol;
  uint64_t v18;
  id connectBlock;
  NSMutableDictionary *v20;
  NSMutableDictionary *reportRegistry;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MTRDeviceControllerXPCConnection;
  v11 = -[MTRDeviceControllerXPCConnection init](&v23, sel_init);
  if (v11)
  {
    objc_msgSend_xpcInterfaceForServerProtocol(MTRDeviceController, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    remoteDeviceServerProtocol = v11->_remoteDeviceServerProtocol;
    v11->_remoteDeviceServerProtocol = (NSXPCInterface *)v12;

    objc_msgSend_xpcInterfaceForClientProtocol(MTRDeviceController, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    remoteDeviceClientProtocol = v11->_remoteDeviceClientProtocol;
    v11->_remoteDeviceClientProtocol = (NSXPCInterface *)v16;

    v18 = MEMORY[0x23493EEA8](v8);
    connectBlock = v11->_connectBlock;
    v11->_connectBlock = (id)v18;

    objc_storeStrong((id *)&v11->_workQueue, a3);
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    reportRegistry = v11->_reportRegistry;
    v11->_reportRegistry = v20;

  }
  return v11;
}

+ (id)connectionWithWorkQueue:(id)a3 connectBlock:(id)a4
{
  id v5;
  id v6;
  MTRDeviceControllerXPCConnection *v7;
  const char *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = [MTRDeviceControllerXPCConnection alloc];
  v9 = (void *)objc_msgSend_initWithWorkQueue_connectBlock_(v7, v8, (uint64_t)v5, v6);

  return v9;
}

- (void)getProxyHandleWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_234008A1C;
  v7[3] = &unk_2504F04A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)registerReportHandlerWithController:(id)a3 nodeID:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_234008F64;
  v15[3] = &unk_2504F4878;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

- (void)deregisterReportHandlersWithController:(id)a3 nodeID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_2340091C4;
  v15[3] = &unk_250500828;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

- (void)handleReportWithController:(id)a3 nodeId:(unint64_t)a4 values:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *workQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2340096F0;
  block[3] = &unk_2505008A0;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a4;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(workQueue, block);

}

- (void)callSubscriptionEstablishedHandler:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_workQueue, a3);
}

- (NSXPCInterface)remoteDeviceServerProtocol
{
  return self->_remoteDeviceServerProtocol;
}

- (NSXPCInterface)remoteDeviceClientProtocol
{
  return self->_remoteDeviceClientProtocol;
}

- (id)connectBlock
{
  return self->_connectBlock;
}

- (MTRDeviceControllerXPCProxyHandle)proxyHandle
{
  return (MTRDeviceControllerXPCProxyHandle *)objc_loadWeakRetained((id *)&self->_proxyHandle);
}

- (void)setProxyHandle:(id)a3
{
  objc_storeWeak((id *)&self->_proxyHandle, a3);
}

- (MTRDeviceControllerXPCProxyHandle)proxyRetainerForReports
{
  return self->_proxyRetainerForReports;
}

- (void)setProxyRetainerForReports:(id)a3
{
  objc_storeStrong((id *)&self->_proxyRetainerForReports, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)reportRegistry
{
  return self->_reportRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportRegistry, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_proxyRetainerForReports, 0);
  objc_destroyWeak((id *)&self->_proxyHandle);
  objc_storeStrong(&self->_connectBlock, 0);
  objc_storeStrong((id *)&self->_remoteDeviceClientProtocol, 0);
  objc_storeStrong((id *)&self->_remoteDeviceServerProtocol, 0);
}

@end
