@implementation CLIndoorMaintenance

- (id)remoteObjectProtocol
{
  return &unk_254E42790;
}

- (id)endpointName
{
  return CFSTR("com.apple.pipelined.maintenance");
}

- (id)withinQueuePermanentShutdownReason
{
  return 0;
}

- (BOOL)withinQueueCanReinitializeRemoteState
{
  return 0;
}

- (void)withinQueueReinitializeRemoteState
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB8], (uint64_t)CFSTR("Cannot re-initialize remote state"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)retrieveLocationRelevancyDurationWithCompletionHandler:(id)a3
{
  NSObject *frameworkQueue;
  CLIndoorMaintenance *v5;
  void *v6;
  CLIndoorMaintenance *v7;
  _QWORD v8[4];
  CLIndoorMaintenance *v9;
  id v10;

  frameworkQueue = self->super._frameworkQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3321888768;
  v8[2] = sub_21649C3F4;
  v8[3] = &unk_24D56FB10;
  v5 = self;
  v6 = (void *)MEMORY[0x2199F9374](a3);
  v9 = v5;
  v7 = v5;
  v10 = (id)MEMORY[0x2199F9374](v6);
  dispatch_async(frameworkQueue, v8);

}

- (void)prefetch:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CLIndoorMaintenance *v10;
  id v11;
  CLIndoorMaintenance *v12;
  const char *v13;
  NSObject *v14;
  _QWORD v15[4];
  CLIndoorMaintenance *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
  v5 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v19 = objc_msgSend_count(v4, v6, v7, v8, v9);
    _os_log_impl(&dword_216456000, v5, OS_LOG_TYPE_DEBUG, "Sending request to prefetch %{public}zu venues", buf, 0xCu);
  }

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3321888768;
  v15[2] = sub_21649C6FC;
  v15[3] = &unk_24D56FB40;
  v10 = self;
  v11 = v4;
  v12 = v10;
  v16 = v12;
  v17 = v11;
  objc_msgSend_doSynchronousXPC_description_waitForever_(v12, v13, (uint64_t)v15, (uint64_t)"prefetch:", 0);

  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
    v14 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    goto LABEL_7;
  }
  v14 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216456000, v14, OS_LOG_TYPE_DEBUG, "Prefetch request finished", buf, 2u);
  }
LABEL_8:

}

- (void)onQueuePrefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  id v10;
  const __CFString *v11;
  NSXPCConnection *connection;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v5 = a5;
  v19 = a3;
  v10 = a4;
  if ((_DWORD)v5 == 1)
    v11 = CFSTR("prefetchSynchronous:");
  else
    v11 = CFSTR("prefetch:");
  connection = self->super._connection;
  objc_msgSend__defaultErrHandler_forCaller_(self, v8, (uint64_t)v10, (uint64_t)v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v14, (uint64_t)v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prefetch_callback_when_(v17, v18, (uint64_t)v19, (uint64_t)v10, v5);

}

- (void)prefetchSynchronous:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CLIndoorMaintenance *v10;
  id v11;
  CLIndoorMaintenance *v12;
  const char *v13;
  NSObject *v14;
  _QWORD v15[4];
  CLIndoorMaintenance *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (qword_253E5C3A8 != -1)
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
  v5 = (id)qword_253E5C3A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v19 = objc_msgSend_count(v4, v6, v7, v8, v9);
    _os_log_impl(&dword_216456000, v5, OS_LOG_TYPE_DEBUG, "Sending request to prefetch %zu venues synchronously", buf, 0xCu);
  }

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3321888768;
  v15[2] = sub_21649CA70;
  v15[3] = &unk_24D56FB70;
  v10 = self;
  v11 = v4;
  v12 = v10;
  v16 = v12;
  v17 = v11;
  objc_msgSend_doSynchronousXPC_description_waitForever_(v12, v13, (uint64_t)v15, (uint64_t)"prefetch:", 1);

  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
    v14 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    goto LABEL_7;
  }
  v14 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216456000, v14, OS_LOG_TYPE_DEBUG, "Synchronous prefetch request finished", buf, 2u);
  }
LABEL_8:

}

- (void)doSynchronousXPC:(id)a3 description:(const char *)a4 waitForever:(BOOL)a5
{
  id v8;
  dispatch_semaphore_t v9;
  NSObject *frameworkQueue;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = dispatch_semaphore_create(0);
  frameworkQueue = self->super._frameworkQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21649CCA0;
  v15[3] = &unk_24D56FBD8;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v16 = v12;
  dispatch_async(frameworkQueue, v15);
  if (a5)
  {
    if (!dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL))
      goto LABEL_8;
  }
  else
  {
    v13 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(v12, v13))
      goto LABEL_8;
  }
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
    v14 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    goto LABEL_7;
  }
  v14 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
  {
LABEL_7:
    *(_DWORD *)buf = 136315138;
    v19 = a4;
    _os_log_impl(&dword_216456000, v14, OS_LOG_TYPE_ERROR, "Timeout trying to do XPC %{publci}s", buf, 0xCu);
  }
LABEL_8:

}

- (void)eraseEverything
{
  NSObject *v3;
  CLIndoorMaintenance *v4;
  const char *v5;
  NSObject *v6;
  _QWORD v7[4];
  CLIndoorMaintenance *v8;
  uint8_t buf[16];

  if (qword_253E5C3A8 == -1)
  {
    v3 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
  v3 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216456000, v3, OS_LOG_TYPE_INFO, "Erasing all indoor tiles", buf, 2u);
  }
LABEL_4:
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3321888768;
  v7[2] = sub_21649CF00;
  v7[3] = &unk_24D56FBF8;
  v4 = self;
  v8 = v4;
  objc_msgSend_doSynchronousXPC_description_waitForever_(v4, v5, (uint64_t)v7, (uint64_t)"eraseEverything", 0);

  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
    v6 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    goto LABEL_6;
  }
  v6 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216456000, v6, OS_LOG_TYPE_INFO, "Erase all indoor tile request finished", buf, 2u);
  }
LABEL_7:

}

- (void)onQueueEraseEverything:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];

  v4 = a3;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
    v5 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_216456000, v5, OS_LOG_TYPE_DEBUG, "Sending request to erase all indoor tiles", v18, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  objc_msgSend__defaultErrHandlerForCaller_(self, v6, (uint64_t)CFSTR("eraseAllData"), v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v11, (uint64_t)v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_eraseAllData_(v14, v15, (uint64_t)v4, v16, v17);

}

- (void)shutdown
{
  NSObject *v3;
  NSObject *frameworkQueue;
  CLIndoorMaintenance *v5;
  _QWORD block[4];
  CLIndoorMaintenance *v7;
  uint8_t buf[16];

  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
    v3 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216456000, v3, OS_LOG_TYPE_INFO, "Requesting shutdown of daemon", buf, 2u);
  }
LABEL_4:
  frameworkQueue = self->super._frameworkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = sub_21649D17C;
  block[3] = &unk_24D56FC28;
  v7 = self;
  v5 = v7;
  dispatch_sync(frameworkQueue, block);

}

- (void)onQueueShutdown
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
    v3 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_216456000, v3, OS_LOG_TYPE_DEBUG, "Sending shutdown request to daemon", v17, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  objc_msgSend__defaultErrHandlerForCaller_(self, v4, (uint64_t)CFSTR("shutdown"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v9, (uint64_t)v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shutdown(v12, v13, v14, v15, v16);

}

- (void)numFloors:(id)a3
{
  id v4;
  NSObject *v5;
  CLIndoorMaintenance *v6;
  void *v7;
  CLIndoorMaintenance *v8;
  const char *v9;
  _QWORD v10[4];
  CLIndoorMaintenance *v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
    v5 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216456000, v5, OS_LOG_TYPE_INFO, "Requesting number of floors from daemon", buf, 2u);
  }
LABEL_4:
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3321888768;
  v10[2] = sub_21649D434;
  v10[3] = &unk_24D56FC58;
  v6 = self;
  v7 = (void *)MEMORY[0x2199F9374](v4);
  v8 = v6;
  v11 = v8;
  v12 = (id)MEMORY[0x2199F9374](v7);
  objc_msgSend_doSynchronousXPC_description_waitForever_(v8, v9, (uint64_t)v10, (uint64_t)"numFloors", 0);

}

- (void)onQueueNumFloors:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSXPCConnection *connection;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];

  v4 = a3;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D56FCA8);
    v5 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_216456000, v5, OS_LOG_TYPE_DEBUG, "Sending request to find the number of floors in the Db", v18, 2u);
  }
LABEL_4:
  connection = self->super._connection;
  objc_msgSend__defaultErrHandlerForCaller_(self, v6, (uint64_t)CFSTR("numFloors"), v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v11, (uint64_t)v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numFloors_(v14, v15, (uint64_t)v4, v16, v17);

}

@end
