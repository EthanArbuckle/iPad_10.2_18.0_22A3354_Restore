@implementation MTRDeviceControllerOverXPC

+ (id)sharedControllerWithID:(id)a3 xpcConnectBlock:(id)a4
{
  id v5;
  id v6;
  MTRDeviceControllerOverXPC *v7;
  const char *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (qword_256159238 != -1)
    dispatch_once(&qword_256159238, &unk_250501A30);
  v7 = [MTRDeviceControllerOverXPC alloc];
  v9 = (void *)objc_msgSend_initWithControllerID_workQueue_connectBlock_(v7, v8, (uint64_t)v5, qword_256159230, v6);

  return v9;
}

- (BOOL)setupCommissioningSessionWithPayload:(id)a3 newNodeID:(id)a4 error:(id *)a5
{
  NSObject *v6;
  const char *v7;
  uint8_t v9[16];

  sub_234117B80(0, "NotSpecified");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "MTRDeviceController doesn't support setupCommissioningSessionWithPayload over XPC", v9, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)pairDevice:(unint64_t)a3 discriminator:(unsigned __int16)a4 setupPINCode:(unsigned int)a5 error:(id *)a6
{
  NSObject *v7;
  const char *v8;
  uint8_t v10[16];

  sub_234117B80(0, "NotSpecified");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support pairDevice over XPC", v10, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a6)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v8, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)pairDevice:(unint64_t)a3 address:(id)a4 port:(unsigned __int16)a5 discriminator:(unsigned __int16)a6 setupPINCode:(unsigned int)a7 error:(id *)a8
{
  NSObject *v9;
  const char *v10;
  uint8_t v12[16];

  sub_234117B80(0, "NotSpecified");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support pairDevice over XPC", v12, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v10, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)pairDevice:(unint64_t)a3 onboardingPayload:(id)a4 error:(id *)a5
{
  NSObject *v6;
  const char *v7;
  uint8_t v9[16];

  sub_234117B80(0, "NotSpecified");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support pairDevice over XPC", v9, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)commissionDevice:(unint64_t)a3 commissioningParams:(id)a4 error:(id *)a5
{
  NSObject *v6;
  const char *v7;
  uint8_t v9[16];

  sub_234117B80(0, "NotSpecified");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support commissionDevice over XPC", v9, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)stopDevicePairing:(unint64_t)a3 error:(id *)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t v8[16];

  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support stopDevicePairing over XPC", v8, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v6, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)getDeviceBeingCommissioned:(unint64_t)a3 error:(id *)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t v8[16];

  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support getDeviceBeingCommissioned over XPC", v8, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v6, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)commissionNodeWithID:(id)a3 commissioningParams:(id)a4 error:(id *)a5
{
  NSObject *v6;
  const char *v7;
  uint8_t v9[16];

  sub_234117B80(0, "NotSpecified");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "MTRDeviceController doesn't support commissionNodeWithID over XPC", v9, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)cancelCommissioningForNodeID:(id)a3 error:(id *)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t v8[16];

  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_ERROR, "MTRDeviceController doesn't support cancelCommissioningForNodeID over XPC", v8, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v6, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)deviceBeingCommissionedWithNodeID:(id)a3 error:(id *)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t v8[16];

  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_ERROR, "MTRDeviceController doesn't support deviceBeingCommissionedWithNodeID over XPC", v8, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v6, (uint64_t)CFSTR("MTRErrorDomain"), 6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)getBaseDevice:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;

  v8 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_234034C18;
  v12[3] = &unk_250501970;
  v12[4] = self;
  v13 = v8;
  v14 = a3;
  v9 = v8;
  objc_msgSend_fetchControllerIdWithQueue_completion_(self, v10, (uint64_t)a4, v12);

  return 1;
}

- (void)fetchControllerIdWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_234034DD8;
  v15[4] = sub_234034DE8;
  v16 = 0;
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_234034DF0;
  v11[3] = &unk_250501A10;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v14 = v15;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, v11);

  _Block_object_dispose(v15, 8);
}

- (id)baseDeviceForNodeID:(id)a3
{
  id v4;
  MTRDeviceOverXPC *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = a3;
  v5 = [MTRDeviceOverXPC alloc];
  objc_msgSend_xpcConnection(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithControllerOverXPC_deviceID_xpcConnection_(v5, v9, (uint64_t)self, v4, v8);

  return v10;
}

- (BOOL)openPairingWindow:(unint64_t)a3 duration:(unint64_t)a4 error:(id *)a5
{
  NSObject *v5;
  uint8_t v7[16];

  sub_234117B80(0, "NotSpecified");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_233BF3000, v5, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support openPairingWindow over XPC", v7, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  return 0;
}

- (id)openPairingWindowWithPIN:(unint64_t)a3 duration:(unint64_t)a4 discriminator:(unint64_t)a5 setupPIN:(unint64_t)a6 error:(id *)a7
{
  NSObject *v7;
  uint8_t v9[16];

  sub_234117B80(0, "NotSpecified");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "MTRDevice doesn't support openPairingWindow over XPC", v9, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(0, 1);
  return 0;
}

- (MTRDeviceControllerOverXPC)initWithControllerID:(id)a3 workQueue:(id)a4 xpcConnection:(id)a5
{
  NSCopying *v8;
  OS_dispatch_queue *v9;
  MTRDeviceControllerXPCConnection *v10;
  NSCopying *controllerXPCID;
  NSCopying *v12;
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v14;
  MTRDeviceControllerXPCConnection *xpcConnection;

  v8 = (NSCopying *)a3;
  v9 = (OS_dispatch_queue *)a4;
  v10 = (MTRDeviceControllerXPCConnection *)a5;
  controllerXPCID = self->_controllerXPCID;
  self->_controllerXPCID = v8;
  v12 = v8;

  workQueue = self->_workQueue;
  self->_workQueue = v9;
  v14 = v9;

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v10;

  return self;
}

- (MTRDeviceControllerOverXPC)initWithControllerID:(id)a3 workQueue:(id)a4 connectBlock:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  MTRDeviceControllerOverXPC *v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend_connectionWithWorkQueue_connectBlock_(MTRDeviceControllerXPCConnection, v10, (uint64_t)v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (MTRDeviceControllerOverXPC *)objc_msgSend_initWithControllerID_workQueue_xpcConnection_(self, v12, (uint64_t)v8, v9, v11);

  return v13;
}

- (NSCopying)controllerXPCID
{
  return self->_controllerXPCID;
}

- (void)setControllerXPCID:(id)a3
{
  objc_storeStrong((id *)&self->_controllerXPCID, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (MTRDeviceControllerXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_controllerXPCID, 0);
}

@end
