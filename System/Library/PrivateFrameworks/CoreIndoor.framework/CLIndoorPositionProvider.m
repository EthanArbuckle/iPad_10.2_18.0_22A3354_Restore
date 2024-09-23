@implementation CLIndoorPositionProvider

- (void)stopUpdatingLocation
{
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v3;
  _QWORD block[4];
  CLIndoorPositionProvider *v5;

  frameworkQueue = self->super._frameworkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = sub_216459EDC;
  block[3] = &unk_24D56FEF8;
  v5 = self;
  v3 = v5;
  dispatch_async(frameworkQueue, block);

}

- (CLIndoorPositionProvider)initWithApiKey:(id)a3 onServer:(id)a4
{
  CLIndoorPositionProvider *v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLIndoorPositionProvider;
  v4 = -[CLIndoorXPCProvider init](&v8, sel_init, a3, a4);
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570018);
    v5 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      return v4;
    goto LABEL_3;
  }
  v5 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_216456000, v5, OS_LOG_TYPE_INFO, "Deprecated API.  Please call regular -init instead", v7, 2u);
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_216468DDC;
  v7[3] = &unk_24D56FE78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(frameworkQueue, v7);

}

- (CLIndoorPositionProvider)initWithConnection:(id)a3
{
  id v4;
  CLIndoorPositionProvider *v5;
  ServiceState *v6;
  ServiceState *state;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLIndoorPositionProvider;
  v5 = -[CLIndoorXPCProvider initWithConnection:](&v9, sel_initWithConnection_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(ServiceState);
    state = v5->_state;
    v5->_state = v6;

  }
  return v5;
}

- (void)clVisionNotificationAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  CLIndoorPositionProvider *v7;
  id v8;
  _QWORD block[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = sub_216458268;
  block[3] = &unk_24D56FFB8;
  v6 = self;
  v8 = v4;
  v10 = v6;
  v11 = v8;
  v7 = v6;
  dispatch_sync(frameworkQueue, block);

}

- (void)startUpdatingLocationAtLocation:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  id v7;
  CLIndoorPositionProvider *v8;
  _QWORD v9[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3321888768;
  v9[2] = sub_21646080C;
  v9[3] = &unk_24D56FEC8;
  v6 = self;
  v7 = v4;
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async(frameworkQueue, v9);

}

- (void)withinQueueInvalidateState
{
  ((void (*)(CLIndoorPositionProvider *, char *, _QWORD))MEMORY[0x24BEDD108])(self, sel_setState_, 0);
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (id)endpointName
{
  return CFSTR("com.apple.pipelined");
}

- (void)clpOutdoorEstimatorLogEntryNotificationAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  CLIndoorPositionProvider *v7;
  id v8;
  _QWORD block[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = sub_21646027C;
  block[3] = &unk_24D56FFE8;
  v6 = self;
  v8 = v4;
  v10 = v6;
  v11 = v8;
  v7 = v6;
  dispatch_sync(frameworkQueue, block);

}

- (void)withinQueueSetDelegate:(id)a3
{
  IndoorProtocolProxy *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  v37 = a3;
  v4 = [IndoorProtocolProxy alloc];
  v8 = (void *)objc_msgSend_initWithDelegate_(v4, v5, (uint64_t)v37, v6, v7);
  objc_msgSend_state(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegateProxy_(v13, v14, (uint64_t)v8, v15, v16);

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v17, (uint64_t)&unk_254E3F778, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExportedInterface_(self->super._connection, v21, (uint64_t)v20, v22, v23);

  objc_msgSend_state(self, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_delegateProxy(v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExportedObject_(self->super._connection, v34, (uint64_t)v33, v35, v36);

}

- (void)outdoorLocationAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  id v7;
  CLIndoorPositionProvider *v8;
  _QWORD v9[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3321888768;
  v9[2] = sub_216460398;
  v9[3] = &unk_24D56FF28;
  v6 = self;
  v7 = v4;
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async(frameworkQueue, v9);

}

- (ServiceState)state
{
  return self->_state;
}

- (id)remoteObjectProtocol
{
  return &unk_254E427F0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

- (CLIndoorPositionProvider)initWithApiKey:(id)a3
{
  CLIndoorPositionProvider *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLIndoorPositionProvider;
  v3 = -[CLIndoorXPCProvider init](&v7, sel_init, a3);
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570018);
    v4 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
      return v3;
    goto LABEL_3;
  }
  v4 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_216456000, v4, OS_LOG_TYPE_INFO, "Deprecated API.  Please call regular -init instead", v6, 2u);
  }
  return v3;
}

- (id)withinQueuePermanentShutdownReason
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_delegateProxy(self->_state, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shutdownReason(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)withinQueueCanReinitializeRemoteState
{
  return self->_state != 0;
}

- (void)withinQueueReinitializeRemoteState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;

  objc_msgSend_state(self, a2, v2, v3, v4);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_delegateProxy(v46, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_delegate(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_withinQueueSetDelegate_(self, v16, (uint64_t)v15, v17, v18);

  objc_msgSend_state(self, v19, v20, v21, v22);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend_updateLocation(v47, v23, v24, v25, v26);

  if ((_DWORD)v10)
  {
    objc_msgSend_state(self, v27, v28, v29, v30);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUpdateLocation_(v48, v31, 0, v32, v33);

    objc_msgSend_state(self, v34, v35, v36, v37);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastLocation(v49, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startUpdatingLocationAtLocation_(self, v43, (uint64_t)v42, v44, v45);

  }
}

- (void)setApiKey:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570018);
    v4 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_216456000, v4, OS_LOG_TYPE_ERROR, "This API is deprecated. Please stop using", v5, 2u);
  }
LABEL_4:

}

- (void)setApiKey:(id)a3 onServer:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (qword_253E5C3A8 != -1)
  {
    dispatch_once(&qword_253E5C3A8, &unk_24D570018);
    v7 = qword_253E5C3A0;
    if (!os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = qword_253E5C3A0;
  if (os_log_type_enabled((os_log_t)qword_253E5C3A0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_216456000, v7, OS_LOG_TYPE_ERROR, "This API is deprecated. Please stop using", v8, 2u);
  }
LABEL_4:

}

- (void)playbackDatarun:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  id v7;
  CLIndoorPositionProvider *v8;
  _QWORD v9[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3321888768;
  v9[2] = sub_21649F640;
  v9[3] = &unk_24D56FE98;
  v6 = self;
  v7 = v4;
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async(frameworkQueue, v9);

}

- (void)gpsEstimateAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  CLIndoorPositionProvider *v7;
  id v8;
  _QWORD block[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = sub_21649F8A8;
  block[3] = &unk_24D56FF58;
  v6 = self;
  v8 = v4;
  v10 = v6;
  v11 = v8;
  v7 = v6;
  dispatch_sync(frameworkQueue, block);

}

- (void)gpsSignalQualityAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  CLIndoorPositionProvider *v7;
  id v8;
  _QWORD block[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = sub_21649FAD4;
  block[3] = &unk_24D56FF88;
  v6 = self;
  v8 = v4;
  v10 = v6;
  v11 = v8;
  v7 = v6;
  dispatch_sync(frameworkQueue, block);

}

@end
