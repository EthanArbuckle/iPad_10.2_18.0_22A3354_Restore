@implementation CWFInterface

- (int64_t)RSSI
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;

  objc_msgSend_perAntennaRSSI(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v5, v6, v7, v8, v9) == 52)
  {
    v10 = objc_retainAutorelease(v5);
    v15 = objc_msgSend_bytes(v10, v11, v12, v13, v14);
    v16 = 28;
    if (*(_DWORD *)(v15 + 4) == 1)
      v16 = 12;
    v17 = *(int *)(v15 + v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (double)rxRate
{
  uint64_t v2;
  uint64_t v3;
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
  double v16;
  _QWORD v18[5];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 187, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132940, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B063F098;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryRxRateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (double)txRate
{
  uint64_t v2;
  uint64_t v3;
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
  double v16;
  _QWORD v18[5];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 20, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132920, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B063F060;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryTxRateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdlServiceManager, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_XPCClient, 0);
}

- (id)countryCode
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 22, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131B80, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B063EF64;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryCountryCodeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unint64_t)MCSIndex
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 26, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132640, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B063EFF0;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryMCSIndexWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int)bluetoothCoexistenceMode
{
  uint64_t v2;
  uint64_t v3;
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
  int v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 155, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134D70, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B063EDD4;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)perAntennaRSSI
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 18, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131B60, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B063EED4;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryRSSIWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int)PHYMode
{
  uint64_t v2;
  uint64_t v3;
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
  int v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 29, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134AC0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B063F028;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryPHYModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (void)setEventHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v5, 0, 0, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_eventID_(self, v7, (uint64_t)v4, (uint64_t)v9, v8);

}

- (void)setEventHandler:(id)a3 eventID:(id)a4
{
  uint64_t v4;

  objc_msgSend_setEventHandler_eventID_(self->_XPCClient, a2, (uint64_t)a3, (uint64_t)a4, v4);
}

- (id)channel
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 16, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132620, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B0622AA0;
    v18[3] = &unk_1E6134B08;
    v18[4] = &v19;
    objc_msgSend_queryChannelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unint64_t)numberOfSpatialStreams
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 27, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132580, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B063EE0C;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryNumberOfSpatialStreamsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)guardInterval
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 25, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134B48, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B063EF2C;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryGuardIntervalWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)startMonitoringEventType:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, a2, a3, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend_startMonitoringEvent_error_(self, v8, (uint64_t)v7, (uint64_t)a4, v9);

  return (char)a4;
}

- (BOOL)startMonitoringEvent:(id)a3 error:(id *)a4
{
  CWFXPCClient *XPCClient;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;

  XPCClient = self->_XPCClient;
  v7 = a3;
  objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend_startMonitoringEvent_requestParameters_error_(XPCClient, v13, (uint64_t)v7, (uint64_t)v12, (uint64_t)a4);

  return (char)a4;
}

- (BOOL)powerOn
{
  uint64_t v2;
  uint64_t v3;
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
  char v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 5, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61349F8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06226A8;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryPowerWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)serviceType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_serviceType(self->_XPCClient, a2, v2, v3, v4);
}

- (CWFInterface)initWithServiceType:(int64_t)a3
{
  CWFXPCClient *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  CWFInterface *v12;

  v5 = [CWFXPCClient alloc];
  v9 = (void *)objc_msgSend_initWithServiceType_(v5, v6, a3, v7, v8);
  v12 = (CWFInterface *)objc_msgSend_initWithXPCClient_requestParameters_(self, v10, (uint64_t)v9, 0, v11);

  return v12;
}

- (CWFInterface)initWithXPCClient:(id)a3 requestParameters:(id)a4
{
  id v7;
  id v8;
  CWFInterface *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CWFInterface *v14;
  CWFRequestParameters *v15;
  CWFRequestParameters *requestParameters;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CWFInterface;
  v9 = -[CWFInterface init](&v18, sel_init);
  v14 = v9;
  if (!v7
    || !v9
    || ((objc_storeStrong((id *)&v9->_XPCClient, a3), !v8)
      ? (v15 = objc_alloc_init(CWFRequestParameters))
      : (v15 = (CWFRequestParameters *)v8),
        requestParameters = v14->_requestParameters,
        v14->_requestParameters = v15,
        requestParameters,
        !v14->_requestParameters))
  {
    objc_msgSend_invalidate(v14, v10, v11, v12, v13);

    v14 = 0;
  }

  return v14;
}

- (id)__adjustedRequestParameters
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

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copy(v5, v6, v7, v8, v9);

  return v10;
}

- (CWFRequestParameters)requestParameters
{
  return self->_requestParameters;
}

+ (BOOL)logRedactionDisabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_logRedactionSetting(a1, a2, v2, v3, v4) == 1;
}

- (void)activate
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CWFInterface *obj;

  obj = self;
  objc_sync_enter(obj);
  if ((objc_msgSend_isActivated(obj, v2, v3, v4, v5) & 1) == 0)
  {
    objc_msgSend_setActivated_(obj, v6, 1, v7, v8);
    objc_msgSend_resume(obj->_XPCClient, v9, v10, v11, v12);
  }
  objc_sync_exit(obj);

}

- (void)resume
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_resume(self->_XPCClient, a2, v2, v3, v4);
}

- (CWFInterface)init
{
  uint64_t v2;
  uint64_t v3;

  return (CWFInterface *)objc_msgSend_initWithServiceType_(self, a2, 2, v2, v3);
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_invalidate(self->_XPCClient, a2, v2, v3, v4);
}

+ (unsigned)logRedactionSetting
{
  id v2;
  unsigned __int8 v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = byte_1EEEB8188;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setLogRedactionSetting:(unsigned __int8)a3
{
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  byte_1EEEB8188 = a3;
  objc_sync_exit(obj);

}

+ (void)setLogRedactionDisabled:(BOOL)a3
{
  _BOOL4 v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  v3 = a3;
  obj = a1;
  objc_sync_enter(obj);
  if (v3)
    objc_msgSend_setLogRedactionSetting_(obj, v4, 1, v5, v6);
  else
    objc_msgSend_setLogRedactionSetting_(obj, v4, 2, v5, v6);
  objc_sync_exit(obj);

}

- (CWFInterface)initWithServiceType:(int64_t)a3 endpoint:(id)a4
{
  id v6;
  CWFXPCClient *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  CWFInterface *v13;

  v6 = a4;
  v7 = [CWFXPCClient alloc];
  v10 = (void *)objc_msgSend_initWithServiceType_endpoint_(v7, v8, a3, (uint64_t)v6, v9);

  v13 = (CWFInterface *)objc_msgSend_initWithXPCClient_requestParameters_(self, v11, (uint64_t)v10, 0, v12);
  return v13;
}

- (id)auxiliaryInterface
{
  CWFInterface *v3;
  const char *v4;
  uint64_t v5;
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
  void *v16;

  v3 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v3, v14, (uint64_t)v8, (uint64_t)v13, v15);

  return v16;
}

- (id)AWDL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CWFInterface *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setInterfaceName_(v11, v12, 0, v13, v14);
  objc_msgSend_setVirtualInterfaceRole_(v11, v15, 6, v16, v17);
  v18 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v18, v24, (uint64_t)v23, (uint64_t)v11, v25);

  return v26;
}

- (id)NANData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CWFInterface *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setInterfaceName_(v11, v12, 0, v13, v14);
  objc_msgSend_setVirtualInterfaceRole_(v11, v15, 10, v16, v17);
  v18 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v18, v24, (uint64_t)v23, (uint64_t)v11, v25);

  return v26;
}

- (id)veryLowPriority
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFInterface *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, -8, v13, v14);
  v15 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)lowPriority
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFInterface *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, -4, v13, v14);
  v15 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)highPriority
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFInterface *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, 4, v13, v14);
  v15 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)veryHighPriority
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFInterface *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, 8, v13, v14);
  v15 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)background
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFInterface *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 9, v13, v14);
  v15 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)utility
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFInterface *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 17, v13, v14);
  v15 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)userInitiated
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFInterface *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 25, v13, v14);
  v15 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)userInteractive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFInterface *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 33, v13, v14);
  v15 = [CWFInterface alloc];
  objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (void)suspend
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_suspend(self->_XPCClient, a2, v2, v3, v4);
}

- (id)targetQueue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_targetQueue(self->_XPCClient, a2, v2, v3, v4);
}

- (void)setTargetQueue:(id)a3
{
  ((void (*)(CWFXPCClient *, char *, id))MEMORY[0x1E0DE7D20])(self->_XPCClient, sel_setTargetQueue_, a3);
}

- (id)invalidationHandler
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_invalidationHandler(self->_XPCClient, a2, v2, v3, v4);
}

- (void)setInvalidationHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_setInvalidationHandler_(self->_XPCClient, a2, (uint64_t)a3, v3, v4);
}

- (id)interruptionHandler
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_interruptionHandler(self->_XPCClient, a2, v2, v3, v4);
}

- (void)setInterruptionHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_setInterruptionHandler_(self->_XPCClient, a2, (uint64_t)a3, v3, v4);
}

- (id)eventHandler
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, a2, 0, 0, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_eventHandlerWithEventID_(self, v5, (uint64_t)v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)cancelRequestsWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1B063EAC0;
  v28 = sub_1B063EA28;
  v29 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 168, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1B06CBE8C;
    v23[3] = &unk_1E61347F0;
    v23[4] = &v24;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v23, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = sub_1B06CBE9C;
    v22[3] = &unk_1E61347F0;
    v22[4] = &v24;
    objc_msgSend_cancelRequestsWithUUID_reply_(v15, v16, (uint64_t)v6, (uint64_t)v22, v17);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v25[5];
    v25[5] = v21;
  }

  v18 = (void *)v25[5];
  if (a4 && v18)
  {
    *a4 = objc_retainAutorelease(v18);
    v18 = (void *)v25[5];
  }
  v19 = v18 == 0;
  _Block_object_dispose(&v24, 8);

  return v19;
}

- (int64_t)thermalIndex
{
  uint64_t v2;
  uint64_t v3;
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
  int64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 35, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132800, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CBFA0;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryThermalIndexWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)countryBandSupport
{
  uint64_t v2;
  uint64_t v3;
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
  int64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 197, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134858, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CC0CC;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryCountryBandSupport_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setThermalIndex:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CWFXPCClient *XPCClient;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  BOOL v21;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1B063EAC0;
  v30 = sub_1B063EA28;
  v31 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 36, (uint64_t)a4, v4) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1B06CC2A0;
    v25[3] = &unk_1E61347F0;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = sub_1B06CC2B0;
    v24[3] = &unk_1E61347F0;
    v24[4] = &v26;
    objc_msgSend_setThermalIndex_requestParams_reply_(v13, v19, a3, (uint64_t)v18, (uint64_t)v24);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v8, *MEMORY[0x1E0CB2FE0], 45, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v27[5];
    v27[5] = v23;
  }

  v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = objc_retainAutorelease(v20);
    v20 = (void *)v27[5];
  }
  v21 = v20 == 0;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (id)deviceUUID
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 145, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131BE0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CC3D8;
    v18[3] = &unk_1E6134880;
    v18[4] = &v19;
    objc_msgSend_queryDeviceUUIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)interfaceName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v6, v7, v8, v9, v10);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  if (!v29[5] && (objc_msgSend_allowRequestType_(self->_XPCClient, v11, 3, v12, v13) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v14, (uint64_t)&unk_1E6131C00, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06CC56C;
    v27[3] = &unk_1E61348A8;
    v27[4] = &v28;
    objc_msgSend_queryInterfaceNameWithRequestParams_reply_(v17, v23, (uint64_t)v22, (uint64_t)v27, v24);

  }
  v25 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v25;
}

- (id)interfaceNames
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 1, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61348C8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CC6DC;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryInterfaceNamesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)virtualInterfaceNames
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 2, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61320A0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CC84C;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryVirtualInterfaceNamesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setPower:(BOOL)a3 error:(id *)a4
{
  uint64_t v4;
  _BOOL8 v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CWFXPCClient *XPCClient;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  BOOL v21;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1B063EAC0;
  v30 = sub_1B063EA28;
  v31 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 6, (uint64_t)a4, v4) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1B06CCA40;
    v25[3] = &unk_1E61347F0;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = sub_1B06CCA50;
    v24[3] = &unk_1E61347F0;
    v24[4] = &v26;
    objc_msgSend_setPower_requestParams_reply_(v13, v19, v6, (uint64_t)v18, (uint64_t)v24);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v8, *MEMORY[0x1E0CB2FE0], 45, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v27[5];
    v27[5] = v23;
  }

  v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = objc_retainAutorelease(v20);
    v20 = (void *)v27[5];
  }
  v21 = v20 == 0;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (BOOL)setChannel:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 17, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06CCC04;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06CCC14;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v28;
    objc_msgSend_setChannel_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v29[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (id)performScanWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1B063EAC0;
  v38 = sub_1B063EA28;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 64, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06CCE08;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06CCE18;
    v26[3] = &unk_1E6134918;
    v26[4] = &v28;
    v26[5] = &v34;
    objc_msgSend_performScanWithParameters_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  if (a4)
  {
    v22 = (void *)v29[5];
    if (v22)
      *a4 = objc_retainAutorelease(v22);
  }
  v23 = (id)v35[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (void)performScanWithParameters:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  CWFXPCClient *XPCClient;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 64, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1B06CCFEC;
    v28[3] = &unk_1E6134940;
    v14 = v7;
    v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v15, (uint64_t)v28, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = sub_1B06CD004;
    v26[3] = &unk_1E6134968;
    v27 = v14;
    objc_msgSend_performScanWithParameters_requestParams_reply_(v18, v24, (uint64_t)v6, (uint64_t)v23, (uint64_t)v26);

  }
  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v25, 0);

  }
}

- (id)performANQPWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1B063EAC0;
  v38 = sub_1B063EA28;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 65, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06CD1FC;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06CD20C;
    v26[3] = &unk_1E6134918;
    v26[4] = &v28;
    v26[5] = &v34;
    objc_msgSend_performANQPWithParameters_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  if (a4)
  {
    v22 = (void *)v29[5];
    if (v22)
      *a4 = objc_retainAutorelease(v22);
  }
  v23 = (id)v35[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

- (void)performANQPWithParameters:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  CWFXPCClient *XPCClient;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 65, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1B06CD3E0;
    v28[3] = &unk_1E6134940;
    v14 = v7;
    v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v15, (uint64_t)v28, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = sub_1B06CD3F8;
    v26[3] = &unk_1E6134968;
    v27 = v14;
    objc_msgSend_performANQPWithParameters_requestParams_reply_(v18, v24, (uint64_t)v6, (uint64_t)v23, (uint64_t)v26);

  }
  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v25, 0);

  }
}

- (BOOL)associateWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 62, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06CD5B0;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06CD5C0;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v28;
    objc_msgSend_associateWithParameters_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v29[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (void)associateWithParameters:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  CWFXPCClient *XPCClient;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 62, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1B06CD72C;
    v28[3] = &unk_1E6134940;
    v14 = v7;
    v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v15, (uint64_t)v28, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = sub_1B06CD740;
    v26[3] = &unk_1E6134940;
    v27 = v14;
    objc_msgSend_associateWithParameters_requestParams_reply_(v18, v24, (uint64_t)v6, (uint64_t)v23, (uint64_t)v26);

  }
  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v25);

  }
}

- (void)disassociateWithReason:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 63, v3, v4))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v7, (uint64_t)&unk_1E6131500, v8, v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_disassociateWithReason_requestParams_reply_(v16, v15, a3, (uint64_t)v14, (uint64_t)&unk_1E6131940);

  }
}

- (void)updateSoftAPBand:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v5 = *(_QWORD *)&a3;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 219, v3, v4))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v7, (uint64_t)&unk_1E6131540, v8, v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateSoftAPBand_requestParams_reply_(v16, v15, v5, (uint64_t)v14, (uint64_t)&unk_1E6134988);

  }
}

- (id)currentScanResult
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 57, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131A40, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CD99C;
    v18[3] = &unk_1E61349B0;
    v18[4] = &v19;
    objc_msgSend_queryCurrentScanResultWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)currentKnownNetworkProfile
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 58, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131AA0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CDB0C;
    v18[3] = &unk_1E61349D8;
    v18[4] = &v19;
    objc_msgSend_queryCurrentKnownNetworkProfileWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)capabilities
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 4, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131B20, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CDC7C;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryInterfaceCapabilitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)powerState
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 147, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61328A0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CDDF0;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryPowerStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)SSID
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 7, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61328C0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CDF60;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_querySSIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)networkName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_SSID(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = (void *)objc_msgSend_initWithData_encoding_(v6, v7, (uint64_t)v5, 4, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)SSIDForVendor
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 8, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61328E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CE124;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_querySSIDForVendorWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)BSSID
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 9, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132160, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CE294;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryBSSIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)BSSIDForVendor
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 10, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132900, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CE404;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryBSSIDForVendorWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int64_t)noise
{
  uint64_t v2;
  uint64_t v3;
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
  int64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 19, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61316A0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CE554;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryNoiseWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)CCA
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 178, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134A40, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CE680;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryCCAWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (double)txPower
{
  uint64_t v2;
  uint64_t v3;
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
  double v16;
  _QWORD v18[5];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 21, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134A60, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CE7B8;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryTxPowerWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)authType
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 11, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134A80, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CE90C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAuthTypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unint64_t)securityType
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 12, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132960, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CEA58;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_querySecurityWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)WEPSubtype
{
  uint64_t v2;
  uint64_t v3;
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
  int64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 13, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134AA0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CEB84;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryWEPSubtypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)WAPISubtype
{
  uint64_t v2;
  uint64_t v3;
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
  int64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 14, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132180, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CECB0;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryWAPISubtypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setCompanionCountryCode:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 23, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06CEE90;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06CEEA0;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v28;
    objc_msgSend_setCompanionCountryCode_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v29[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (int)opMode
{
  uint64_t v2;
  uint64_t v3;
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
  int v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 30, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61321A0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CEFA4;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryOpModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)maxPHYModeDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend_PHYMode(self, a2, v2, v3, v4);
  if ((_DWORD)v5)
  {
    if ((v5 & 0x200) != 0)
      return CFSTR("11BE");
    if ((v5 & 0x100) != 0)
      return CFSTR("11AX");
    if ((v5 & 0x80) != 0)
      return CFSTR("11AC");
    if ((v5 & 0x10) != 0)
      return CFSTR("11N");
    if ((v5 & 8) != 0)
      return CFSTR("11G");
    if ((v5 & 0x40) != 0)
      return CFSTR("TURBO_G");
    if ((v5 & 2) != 0)
      return CFSTR("11A");
    if ((v5 & 0x20) != 0)
      return CFSTR("TURBO_A");
    if ((v5 & 4) != 0)
      return CFSTR("11B");
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("(%X)"), v7, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (int)supportedPHYModes
{
  uint64_t v2;
  uint64_t v3;
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
  int v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 28, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134AE0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CF1AC;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_querySupportedPHYModesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)supportedChannelsWithCountryCode:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1B063EAC0;
  v25 = sub_1B063EA28;
  v26 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v5, 15, v6, v7) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1E6131BC0, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B06CF318;
    v20[3] = &unk_1E61348F0;
    v20[4] = &v21;
    objc_msgSend_querySupportedChannelsWithCountryCode_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);

  }
  v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)hardwareSupportedChannels
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 210, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134B28, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CF488;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryHardwareSupportedChannelsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unsigned)__flagsForChannelBand:(unsigned int)a3 width:(int)a4
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  if (a3 - 1 > 2)
    v4 = 0;
  else
    v4 = dword_1B0711C00[a3 - 1];
  v5 = v4 | 0x400;
  v6 = v4 | 0x800;
  if (a4 != 160)
    v6 = v4;
  if (a4 != 80)
    v5 = v6;
  v7 = v4 | 2;
  if (a4 == 40)
    v4 |= 4u;
  if (a4 == 20)
    v4 = v7;
  if (a4 <= 79)
    return v4;
  else
    return v5;
}

- (id)supportedChannel:(unint64_t)a3 band:(unsigned int)a4 width:(int)a5 countryCode:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v13 = objc_msgSend___flagsForChannelBand_width_(self, v11, v7, v6, v12);
  objc_msgSend_supportedChannelsWithCountryCode_(self, v14, (uint64_t)v10, v15, v16);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v19)
  {
    v24 = v19;
    v25 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v17);
        v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend_channel(v27, v20, v21, v22, v23, (_QWORD)v30) == a3
          && (objc_msgSend_flags(v27, v20, v21, v22, v23) & v13) != 0)
        {
          v28 = v27;
          goto LABEL_12;
        }
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v24)
        continue;
      break;
    }
  }
  v28 = 0;
LABEL_12:

  return v28;
}

- (unint64_t)DTIMInterval
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 24, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134B68, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CF7A4;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryDTIMIntervalWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)parentInterfaceName
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 32, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132660, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CF8F4;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryParentInterfaceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int)virtualInterfaceRole
{
  uint64_t v2;
  uint64_t v3;
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
  int v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 31, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134B88, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CFA40;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryVirtualInterfaceRoleWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)MACAddress
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 33, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61325A0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CFB90;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryMACAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)hardwareMACAddress
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 173, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134BA8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CFD00;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryHardwareMACAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IO80211ControllerInfo
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 114, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134BC8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CFE70;
    v18[3] = &unk_1E6134BF0;
    v18[4] = &v19;
    objc_msgSend_queryIO80211ControllerInfoWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IO80211InterfaceInfo
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 115, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131E00, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06CFFE0;
    v18[3] = &unk_1E6134BF0;
    v18[4] = &v19;
    objc_msgSend_queryIO80211InterfaceInfoWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedRoamStatus
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 142, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134C10, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D0150;
    v18[3] = &unk_1E6134C38;
    v18[4] = &v19;
    objc_msgSend_queryRoamStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedJoinStatus
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 143, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134C58, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D02C0;
    v18[3] = &unk_1E6134C80;
    v18[4] = &v19;
    objc_msgSend_queryJoinStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedAutoJoinStatus
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 144, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131E20, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D0430;
    v18[3] = &unk_1E6134CA8;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)wakeOnWirelessEnabled
{
  uint64_t v2;
  uint64_t v3;
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
  char v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 38, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134CC8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D057C;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryWoWEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)cachedLinkDownStatus
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 37, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131FE0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D06CC;
    v18[3] = &unk_1E6134CF0;
    v18[4] = &v19;
    objc_msgSend_queryLinkDownStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)chainAck
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 148, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131E40, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D083C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryChainAckWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)txChainPower
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 149, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134D10, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D09AC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryTxChainPowerWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)desense
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 150, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132000, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D0B1C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryDesenseWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)desenseLevel
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 151, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134D30, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D0C8C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryDesenseLevelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)bluetoothCoexistenceConfig
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 152, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131E60, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D0DFC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexConfigWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)bluetoothCoexistenceProfiles2GHz
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 153, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134D50, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D0F6C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexProfiles2GHzWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)bluetoothCoexistenceProfiles5GHz
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 154, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132020, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D10DC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexProfiles5GHzWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)leakyAPStats
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 156, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131E80, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D1250;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryLeakyAPStatsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)LQMSummary
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 175, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134D90, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D13C0;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryLQMSummaryWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedLinkQualityMetric
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 167, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132040, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D1530;
    v18[3] = &unk_1E6134DB8;
    v18[4] = &v19;
    objc_msgSend_queryLinkQualityMetricWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)powerDebugInfo
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 176, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131CA0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D16A0;
    v18[3] = &unk_1E6134BF0;
    v18[4] = &v19;
    objc_msgSend_queryPowerDebugInfoWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (void)performAutoJoinWithParameters:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  CWFXPCClient *XPCClient;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 177, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1B06D1854;
    v28[3] = &unk_1E6134940;
    v14 = v7;
    v29 = v14;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v15, (uint64_t)v28, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = sub_1B06D1868;
    v26[3] = &unk_1E6134940;
    v27 = v14;
    objc_msgSend_performAutoJoinWithParameters_requestParams_reply_(v18, v24, (uint64_t)v6, (uint64_t)v23, (uint64_t)v26);

  }
  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v25);

  }
}

- (BOOL)performAutoJoinWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 177, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06D1A20;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06D1A30;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v28;
    objc_msgSend_performAutoJoinWithParameters_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v29[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (BOOL)userAutoJoinDisabled
{
  uint64_t v2;
  uint64_t v3;
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
  char v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 179, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134DD8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D1B34;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryUserAutoJoinStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setUserAutoJoinDisabled:(BOOL)a3 error:(id *)a4
{
  uint64_t v4;
  _BOOL4 v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CWFXPCClient *XPCClient;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  BOOL v21;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1B063EAC0;
  v30 = sub_1B063EA28;
  v31 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 180, (uint64_t)a4, v4) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1B06D1D08;
    v25[3] = &unk_1E61347F0;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = sub_1B06D1D18;
    v24[3] = &unk_1E61347F0;
    v24[4] = &v26;
    objc_msgSend_setUserAutoJoinState_requestParams_reply_(v13, v19, !v6, (uint64_t)v18, (uint64_t)v24);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v8, *MEMORY[0x1E0CB2FE0], 45, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v27[5];
    v27[5] = v23;
  }

  v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = objc_retainAutorelease(v20);
    v20 = (void *)v27[5];
  }
  v21 = v20 == 0;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (int64_t)autoHotspotMode
{
  uint64_t v2;
  uint64_t v3;
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
  int64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 182, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131EC0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D1E1C;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryAutoHotspotModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setAutoHotspotMode:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CWFXPCClient *XPCClient;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  BOOL v21;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1B063EAC0;
  v30 = sub_1B063EA28;
  v31 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 183, (uint64_t)a4, v4) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1B06D1FF0;
    v25[3] = &unk_1E61347F0;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = sub_1B06D2000;
    v24[3] = &unk_1E61347F0;
    v24[4] = &v26;
    objc_msgSend_setAutoHotspotMode_requestParams_reply_(v13, v19, a3, (uint64_t)v18, (uint64_t)v24);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v8, *MEMORY[0x1E0CB2FE0], 45, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v27[5];
    v27[5] = v23;
  }

  v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = objc_retainAutorelease(v20);
    v20 = (void *)v27[5];
  }
  v21 = v20 == 0;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (unint64_t)wifiUIStateFlags
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 185, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134DF8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D2104;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryWiFiUIStateFlagsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)maxLinkSpeed
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 211, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61323C0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D2230;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryMaxLinkSpeedWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int)state
{
  uint64_t v2;
  uint64_t v3;
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
  int v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 212, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134E18, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D235C;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int)powersave
{
  uint64_t v2;
  uint64_t v3;
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
  int v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 213, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61325C0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D2488;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryPowersaveWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)maxNSSForAP
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 214, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134E38, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D25B4;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryMaxNSSForAPWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)txNSS
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 215, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131CC0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D26E0;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryTxNSSWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)beaconCache
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 216, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131760, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D2830;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryBeaconCacheWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)backgroundScanCache
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 241, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131EE0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D29A0;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryBackgroundScanCacheWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setBackgroundScanConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  _QWORD v25[5];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1B063EAC0;
  v31 = sub_1B063EA28;
  v32 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 244, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B06D2B68;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v27;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = sub_1B06D2B78;
    v25[3] = &unk_1E61347F0;
    v25[4] = &v27;
    objc_msgSend_setBackgroundScanConfiguration_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v25);

  }
  v22 = (void *)v28[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v28[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v27, 8);

  return v23;
}

- (id)backgroundScanConfiguration
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 241, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131780, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D2CA0;
    v18[3] = &unk_1E6134E60;
    v18[4] = &v19;
    objc_msgSend_queryBackgroundScanConfigurationWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)blockedBands
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1B063EAC0;
  v24 = sub_1B063EA28;
  v25 = 0;
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v3, 217, v4, v5) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v6, (uint64_t)&unk_1E61317A0, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B06D2E28;
    v19[3] = &unk_1E61348F0;
    v19[4] = &v20;
    objc_msgSend_queryBlockedBandsWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);

  }
  v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (BOOL)setBlockedBands:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CWFXPCClient *XPCClient;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1B063EAC0;
  v31 = sub_1B063EA28;
  v32 = 0;
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 218, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B06D303C;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v27;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v7, (uint64_t)v26, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = sub_1B06D304C;
    v25[3] = &unk_1E61347F0;
    v25[4] = &v27;
    objc_msgSend_setBlockedBands_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v7, *MEMORY[0x1E0CB2FE0], 45, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v28[5];
    v28[5] = v24;
  }

  v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = objc_retainAutorelease(v21);
    v21 = (void *)v28[5];
  }
  v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (id)linkQualityMetricConfiguration
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 234, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131CE0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D3174;
    v18[3] = &unk_1E6134BF0;
    v18[4] = &v19;
    objc_msgSend_queryLQMConfigurationWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setLinkQualityMetricConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 235, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06D3370;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06D3380;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v28;
    objc_msgSend_setLQMConfiguration_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v29[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (id)wifiAssistOverrideReasons
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 236, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61317C0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D34A8;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryWiFiAssistOverrideReasonsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)beginActivity:(id)a3 error:(id *)a4
{
  CWFXPCClient *XPCClient;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;

  XPCClient = self->_XPCClient;
  v7 = a3;
  objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend_beginActivity_requestParameters_error_(XPCClient, v13, (uint64_t)v7, (uint64_t)v12, (uint64_t)a4);

  return (char)a4;
}

- (void)endActivity:(id)a3
{
  CWFXPCClient *XPCClient;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;

  XPCClient = self->_XPCClient;
  v5 = a3;
  objc_msgSend___adjustedRequestParameters(self, v6, v7, v8, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endActivity_requestParameters_(XPCClient, v10, (uint64_t)v5, (uint64_t)v12, v11);

}

- (void)endAllActivities
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CWFXPCClient *XPCClient;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endAllActivities_(XPCClient, v6, (uint64_t)v9, v7, v8);

}

- (void)performActivity:(id)a3 usingBlock:(id)a4
{
  void (**v6)(_QWORD);
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (a3)
  {
    if (a4)
    {
      v6 = (void (**)(_QWORD))a4;
      v12 = a3;
      objc_msgSend_beginActivity_error_(self, v7, (uint64_t)v12, 0, v8);
      v6[2](v6);

      objc_msgSend_endActivity_(self, v9, (uint64_t)v12, v10, v11);
    }
  }
}

- (BOOL)beginActivityType:(int64_t)a3 reason:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  CWFXPCClient *XPCClient;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;

  v8 = a4;
  objc_msgSend_requestParameters(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activityWithType_reason_UUID_(CWFActivity, v19, a3, (uint64_t)v8, (uint64_t)v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend_beginActivity_requestParameters_error_(XPCClient, v27, (uint64_t)v20, (uint64_t)v26, (uint64_t)a5);

  return (char)a5;
}

- (void)endActivityType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  CWFXPCClient *XPCClient;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;

  objc_msgSend_requestParameters(self, a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activityWithType_reason_UUID_(CWFActivity, v13, a3, 0, (uint64_t)v12);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endActivity_requestParameters_(XPCClient, v20, (uint64_t)v22, (uint64_t)v19, v21);

}

- (id)activities
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 112, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61317E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D390C;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryActivitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)systemActivities
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 113, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61321E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D3A7C;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_querySystemActivitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)eventIDs
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 98, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131800, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D3BEC;
    v18[3] = &unk_1E6134E88;
    v18[4] = &v19;
    objc_msgSend_queryEventIDsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)systemEventIDs
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 99, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131820, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D3D5C;
    v18[3] = &unk_1E6134E88;
    v18[4] = &v19;
    objc_msgSend_querySystemEventIDsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (void)stopMonitoringEventType:(int64_t)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, a2, a3, 0, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringEvent_(self, v5, (uint64_t)v8, v6, v7);

}

- (void)stopMonitoringEvent:(id)a3
{
  CWFXPCClient *XPCClient;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;

  XPCClient = self->_XPCClient;
  v5 = a3;
  objc_msgSend___adjustedRequestParameters(self, v6, v7, v8, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringEvent_requestParameters_(XPCClient, v10, (uint64_t)v5, (uint64_t)v12, v11);

}

- (void)stopMonitoringAllEvents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CWFXPCClient *XPCClient;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringAllEvents_(XPCClient, v6, (uint64_t)v9, v7, v8);

}

- (id)eventHandlerWithEventID:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_eventHandlerWithEventID_(self->_XPCClient, a2, (uint64_t)a3, v3, v4);
}

- (void)clearAllEventHandlers
{
  ((void (*)(CWFXPCClient *, char *))MEMORY[0x1E0DE7D20])(self->_XPCClient, sel_clearAllEventHandlers);
}

- (id)knownNetworkProfilesWithProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1B063EAC0;
  v25 = sub_1B063EA28;
  v26 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v5, 54, v6, v7) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1E6131D00, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B06D3FE0;
    v20[3] = &unk_1E61348F0;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkProfilesWithProperties_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);

  }
  v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)knownNetworkProfileMatchingScanResult:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1B063EAC0;
  v25 = sub_1B063EA28;
  v26 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v5, 56, v6, v7) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1E6131840, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B06D4168;
    v20[3] = &unk_1E61349D8;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkProfileMatchingScanResult_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);

  }
  v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)knownNetworkProfileMatchingNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1B063EAC0;
  v25 = sub_1B063EA28;
  v26 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v5, 55, v6, v7) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1E6131F00, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B06D42F0;
    v20[3] = &unk_1E61349D8;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkProfileMatchingNetworkProfile_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);

  }
  v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CWFXPCClient *XPCClient;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  BOOL v29;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1B063EAC0;
  v38 = sub_1B063EA28;
  v39 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v13, 61, v14, v15) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v20 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_1B06D451C;
    v33[3] = &unk_1E61347F0;
    v33[4] = &v34;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v16, (uint64_t)v33, v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v20;
    v32[1] = 3221225472;
    v32[2] = sub_1B06D452C;
    v32[3] = &unk_1E61347F0;
    v32[4] = &v34;
    objc_msgSend_updateKnownNetworkProfile_properties_OSSpecificKeys_requestParams_reply_(v21, v27, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v26, v32);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v16, *MEMORY[0x1E0CB2FE0], 45, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v35[5];
    v35[5] = v31;
  }

  v28 = (void *)v35[5];
  if (a6 && v28)
  {
    *a6 = objc_retainAutorelease(v28);
    v28 = (void *)v35[5];
  }
  v29 = v28 == 0;
  _Block_object_dispose(&v34, 8);

  return v29;
}

- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 error:(id *)a5
{
  return MEMORY[0x1E0DE7D20](self, sel_updateKnownNetworkProfile_properties_OSSpecificKeys_error_, a3, a4, 0);
}

- (BOOL)addKnownNetworkProfile:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 59, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06D46EC;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06D46FC;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v28;
    objc_msgSend_addKnownNetworkProfile_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v29[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (BOOL)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFXPCClient *XPCClient;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  BOOL v25;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B063EAC0;
  v34 = sub_1B063EA28;
  v35 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v9, 60, v10, v11) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B06D48C0;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = sub_1B06D48D0;
    v28[3] = &unk_1E61347F0;
    v28[4] = &v30;
    objc_msgSend_removeKnownNetworkProfile_reason_requestParams_reply_(v17, v23, (uint64_t)v8, a4, (uint64_t)v22, v28);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, *MEMORY[0x1E0CB2FE0], 45, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v31[5];
    v31[5] = v27;
  }

  v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = objc_retainAutorelease(v24);
    v24 = (void *)v31[5];
  }
  v25 = v24 == 0;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CWFXPCClient *XPCClient;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  BOOL v32;
  uint64_t v34;
  _QWORD v35[5];
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1B063EAC0;
  v41 = sub_1B063EA28;
  v42 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v16, 200, v17, v18) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v23 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1B06D4AD0;
    v36[3] = &unk_1E61347F0;
    v36[4] = &v37;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v19, (uint64_t)v36, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v23;
    v35[1] = 3221225472;
    v35[2] = sub_1B06D4AE0;
    v35[3] = &unk_1E61347F0;
    v35[4] = &v37;
    objc_msgSend_updateKnownBSS_knownNetworkProfile_properties_OSSpecificKeys_requestParams_reply_(v24, v30, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, v15, v29, v35);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, *MEMORY[0x1E0CB2FE0], 45, 0);
    v34 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v38[5];
    v38[5] = v34;
  }

  v31 = (void *)v38[5];
  if (a7 && v31)
  {
    *a7 = objc_retainAutorelease(v31);
    v31 = (void *)v38[5];
  }
  v32 = v31 == 0;
  _Block_object_dispose(&v37, 8);

  return v32;
}

- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 error:(id *)a6
{
  return MEMORY[0x1E0DE7D20](self, sel_updateKnownBSS_knownNetworkProfile_properties_OSSpecificKeys_error_, a3, a4, a5);
}

- (BOOL)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CWFXPCClient *XPCClient;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  BOOL v26;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B063EAC0;
  v35 = sub_1B063EA28;
  v36 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v10, 198, v11, v12) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v17 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B06D4CBC;
    v30[3] = &unk_1E61347F0;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v30, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = sub_1B06D4CCC;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v31;
    objc_msgSend_addKnownBSS_knownNetworkProfile_requestParams_reply_(v18, v24, (uint64_t)v8, (uint64_t)v9, (uint64_t)v23, v29);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 45, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v32[5];
    v32[5] = v28;
  }

  v25 = (void *)v32[5];
  if (a5 && v25)
  {
    *a5 = objc_retainAutorelease(v25);
    v25 = (void *)v32[5];
  }
  v26 = v25 == 0;
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (BOOL)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CWFXPCClient *XPCClient;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  BOOL v26;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B063EAC0;
  v35 = sub_1B063EA28;
  v36 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v10, 199, v11, v12) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v17 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B06D4E9C;
    v30[3] = &unk_1E61347F0;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v30, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = sub_1B06D4EAC;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v31;
    objc_msgSend_removeKnownBSS_knownNetworkProfile_requestParams_reply_(v18, v24, (uint64_t)v8, (uint64_t)v9, (uint64_t)v23, v29);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 45, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v32[5];
    v32[5] = v28;
  }

  v25 = (void *)v32[5];
  if (a5 && v25)
  {
    *a5 = objc_retainAutorelease(v25);
    v25 = (void *)v32[5];
  }
  v26 = v25 == 0;
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (id)passwordForKnownNetworkProfile:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1B063EAC0;
  v38 = sub_1B063EA28;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 201, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06D5080;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v34;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06D5090;
    v26[3] = &unk_1E6134EB0;
    v26[4] = &v34;
    v26[5] = &v28;
    objc_msgSend_queryPasswordForKnownNetworkProfile_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  v22 = (void *)v35[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v35[5];
  }
  if (v22)
    v23 = 0;
  else
    v23 = (void *)v29[5];
  v24 = v23;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v24;
}

- (BOOL)setPassword:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CWFXPCClient *XPCClient;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  BOOL v26;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B063EAC0;
  v35 = sub_1B063EA28;
  v36 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v10, 202, v11, v12) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v17 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B06D52C4;
    v30[3] = &unk_1E61347F0;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v30, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = sub_1B06D52D4;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v31;
    objc_msgSend_setPassword_knownNetworkProfile_requestParams_reply_(v18, v24, (uint64_t)v8, (uint64_t)v9, (uint64_t)v23, v29);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 45, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v32[5];
    v32[5] = v28;
  }

  v25 = (void *)v32[5];
  if (a5 && v25)
  {
    *a5 = objc_retainAutorelease(v25);
    v25 = (void *)v32[5];
  }
  v26 = v25 == 0;
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (id)knownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1B063EAC0;
  v25 = sub_1B063EA28;
  v26 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v5, 248, v6, v7) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1E6131860, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B06D5414;
    v20[3] = &unk_1E6134BF0;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkInfoForLocalNetworkPromptWithOptions_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);

  }
  v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)networkServiceID
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 120, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131D20, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D5584;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryNetworkServiceIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)networkServiceName
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 121, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131880, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D56F4;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryNetworkServiceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)isNetworkServiceEnabled
{
  uint64_t v2;
  uint64_t v3;
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
  char v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 122, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131F20, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D5840;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryIsNetworkServiceEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)IPv4RouterAddress
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 117, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134ED0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D5990;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryIPv4RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4Addresses
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 116, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61323E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D5B00;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryIPv4AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4SubnetMasks
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 203, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134EF0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D5C70;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryIPv4SubnetMasksWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4ARPResolvedHardwareAddress
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 204, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61325E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D5DE0;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryIPv4ARPResolvedHardwareAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4ARPResolvedIPAddress
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 205, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134F10, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D5F50;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryIPv4ARPResolvedIPAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv6RouterAddress
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 119, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131D40, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D60C0;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryIPv6RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv6Addresses
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 118, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61318A0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D6230;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryIPv6AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DNSServerAddresses
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 125, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134F30, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D63A0;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryDNSServerAddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPLeaseStartedAt
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 123, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134F50, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D6510;
    v18[3] = &unk_1E6134F78;
    v18[4] = &v19;
    objc_msgSend_queryDHCPLeaseStartTimeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPLeaseExpiresAt
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 124, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134F98, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D6680;
    v18[3] = &unk_1E6134F78;
    v18[4] = &v19;
    objc_msgSend_queryDHCPLeaseExpirationTimeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPServerID
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 206, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131640, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D67F0;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryDHCPServerIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPv6ServerID
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 207, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61318E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D6960;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryDHCPv6ServerIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4NetworkSignature
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 208, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131C20, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D6AD0;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryIPv4NetworkSignatureWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv6NetworkSignature
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 209, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131900, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D6C40;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryIPv6NetworkSignatureWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4InterfaceName
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 130, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131D80, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D6DB0;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4InterfaceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4NetworkServiceID
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 128, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134FB8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D6F20;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4NetworkServiceIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4NetworkServiceName
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 129, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132600, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D7090;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4NetworkServiceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4RouterAddress
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 127, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134FD8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D7200;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4Addresses
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 126, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132400, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D7370;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6InterfaceName
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 135, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6134FF8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D74E0;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6InterfaceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6NetworkServiceID
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 133, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61322C0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D7650;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6NetworkServiceIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6NetworkServiceName
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 134, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6135018, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D77C0;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6NetworkServiceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6RouterAddress
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 132, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132420, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D7930;
    v18[3] = &unk_1E61348A8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6Addresses
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 131, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6135038, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D7AA0;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalDNSServerAddresses
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 136, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131980, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D7C10;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalDNSServerAddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unsigned)reachabilityFlags
{
  uint64_t v2;
  uint64_t v3;
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
  unsigned int v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 137, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131F60, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D7D5C;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryNetworkReachabilityWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unsigned)EAP8021XSupplicantState
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unsigned int v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1B063EAC0;
  v24 = sub_1B063EA28;
  v25 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 138, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132440, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B06D7EAC;
    v19[3] = &unk_1E6134838;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XSupplicantStateWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);

  }
  v17 = objc_msgSend_unsignedIntValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (unsigned)EAP8021XControlMode
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unsigned int v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1B063EAC0;
  v24 = sub_1B063EA28;
  v25 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 139, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6135058, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B06D801C;
    v19[3] = &unk_1E6134838;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XControlModeWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);

  }
  v17 = objc_msgSend_unsignedIntValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (unsigned)EAP8021XControlState
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unsigned int v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1B063EAC0;
  v24 = sub_1B063EA28;
  v25 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 140, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61319C0, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B06D818C;
    v19[3] = &unk_1E6134838;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XControlStateWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);

  }
  v17 = objc_msgSend_unsignedIntValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (int)EAP8021XClientStatus
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1B063EAC0;
  v24 = sub_1B063EA28;
  v25 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 141, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131FC0, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1B06D82FC;
    v19[3] = &unk_1E6134838;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XClientStatusWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);

  }
  v17 = objc_msgSend_intValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (BOOL)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 66, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06D84F8;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06D8508;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v28;
    objc_msgSend_startAWDLPeerAssistedDiscoveryWithParameters_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v29[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (void)stopAWDLPeerAssistedDiscovery
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 67, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61319E0, v6, v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopAWDLPeerAssistedDiscoveryWithRequestParams_reply_(v15, v13, (uint64_t)v12, (uint64_t)&unk_1E61320E0, v14);

  }
}

- (BOOL)setAWDLPeerTrafficRegistration:(id)a3 error:(id *)a4
{
  id v6;
  AWDLServiceDiscoveryManager *v7;
  AWDLServiceDiscoveryManager *awdlServiceManager;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *isActive;
  AWDLServiceDiscoveryManager *v20;
  char v21;
  BOOL v22;
  char v24;

  v6 = a3;
  if (!self->_awdlServiceManager)
  {
    v7 = (AWDLServiceDiscoveryManager *)objc_alloc_init(MEMORY[0x1E0DD99C0]);
    awdlServiceManager = self->_awdlServiceManager;
    self->_awdlServiceManager = v7;

  }
  v24 = 0;
  v9 = objc_alloc(MEMORY[0x1E0DD99D0]);
  v14 = objc_msgSend_serializedRegistrationInfo(v6, v10, v11, v12, v13);
  isActive = (void *)objc_msgSend_initWithDictionary_isActive_(v9, v15, v14, (uint64_t)&v24, v16);
  if (isActive)
  {
    v20 = self->_awdlServiceManager;
    if (v24)
      v21 = objc_msgSend_setTrafficRegistration_error_(v20, v17, (uint64_t)isActive, (uint64_t)a4, v18);
    else
      v21 = objc_msgSend_clearTrafficRegistration_error_(v20, v17, (uint64_t)isActive, (uint64_t)a4, v18);
    v22 = v21;
  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v17, *MEMORY[0x1E0CB2FE0], 22, 0);
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)AWDLPreferredChannels
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 40, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131A00, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D87BC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPreferredChannelsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncEnabled
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 39, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131DA0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D892C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncState
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 41, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131A20, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D8A9C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncChannelSequence
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 42, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131C40, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D8C0C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncChannelSequenceWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLStrategy
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 44, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131560, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D8D7C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLStrategyWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionParameters
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 45, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132460, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D8EEC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionParametersWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLPeerDatabase
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 48, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6135078, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D905C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPeerDatabaseWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSocialTimeSlots
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 49, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61322E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D91CC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSocialTimeSlotsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionID
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 46, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6135098, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D933C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionRSSIThresholds
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 47, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61324A0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D94AC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionRSSIThresholdsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLMasterChannel
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 50, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61315A0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D961C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLMasterChannelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSecondaryMasterChannel
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 51, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132320, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D978C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSecondaryMasterChannelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLOpMode
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 52, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61350B8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D98FC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLOpModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncParameters
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 43, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61324C0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D9A6C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncParametersWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLStatistics
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 53, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61350D8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D9BDC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLStatisticsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSidecarDiagnostics
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 146, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132340, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D9D4C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSidecarDiagnosticsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLExtensionStateMachineParameters
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 157, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61350F8, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06D9EBC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLExtensionStateMachineParamsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionMetric
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 158, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61324E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DA02C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionMetricWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLPresenceMode
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 159, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6135118, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DA19C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPresenceModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLGuardTime
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 160, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132360, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DA30C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLGuardTimeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLAvailabilityWindowAPAlignment
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 161, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6135138, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DA47C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLAvailabilityWindowAPAlignmentWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLContinuousElectionAlgorithmEnabled
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 162, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132500, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DA5EC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLContinuousElectionAlgorithmEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLAFTxMode
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 163, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61315C0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DA75C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLAFTxModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLPeerTrafficRegistration
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 164, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132380, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DA8CC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPeerTrafficRegistrationWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLEncryptionType
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 165, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61315E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DAA3C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLEncryptionTypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLBTLEStateParameters
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 166, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132200, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DABAC;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryAWDLBTLEStateParamsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)rangingCapabilities
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 34, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6135158, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DAD1C;
    v18[3] = &unk_1E6134A20;
    v18[4] = &v19;
    objc_msgSend_queryRangingCapabilitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setRangeable:(BOOL)a3 peerList:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFXPCClient *XPCClient;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  BOOL v25;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v8 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B063EAC0;
  v34 = sub_1B063EA28;
  v35 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v9, 68, v10, v11) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B06DAF28;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = sub_1B06DAF38;
    v28[3] = &unk_1E61347F0;
    v28[4] = &v30;
    objc_msgSend_setRangeable_peerList_requestParams_reply_(v17, v23, v6, (uint64_t)v8, (uint64_t)v22, v28);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, *MEMORY[0x1E0CB2FE0], 45, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v31[5];
    v31[5] = v27;
  }

  v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = objc_retainAutorelease(v24);
    v24 = (void *)v31[5];
  }
  v25 = v24 == 0;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  CWFXPCClient *XPCClient;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 69, v11, v12))
  {
    XPCClient = self->_XPCClient;
    v15 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B06DB0B8;
    v30[3] = &unk_1E6134940;
    v16 = v9;
    v31 = v16;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v17, (uint64_t)v30, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = sub_1B06DB0D0;
    v28[3] = &unk_1E6134968;
    v29 = v16;
    objc_msgSend_performRangingWithPeerList_timeout_requestParams_reply_(v20, v26, (uint64_t)v8, a4, (uint64_t)v25, v28);

  }
  else if (v9)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 45, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v27, 0);

  }
}

- (id)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFXPCClient *XPCClient;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  id v25;
  uint64_t v27;
  _QWORD v28[6];
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v8 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_1B063EAC0;
  v40 = sub_1B063EA28;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B063EAC0;
  v34 = sub_1B063EA28;
  v35 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v9, 69, v10, v11) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B06DB2D8;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = sub_1B06DB2E8;
    v28[3] = &unk_1E6134918;
    v28[4] = &v30;
    v28[5] = &v36;
    objc_msgSend_performRangingWithPeerList_timeout_requestParams_reply_(v17, v23, (uint64_t)v8, a4, (uint64_t)v22, v28);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, *MEMORY[0x1E0CB2FE0], 45, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v31[5];
    v31[5] = v27;
  }

  if (a5)
  {
    v24 = (void *)v31[5];
    if (v24)
      *a5 = objc_retainAutorelease(v24);
  }
  v25 = (id)v37[5];
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v25;
}

- (BOOL)setRangingIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 174, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06DB500;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06DB510;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v28;
    objc_msgSend_setRangingIdentifier_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v29[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (id)performSensingWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CWFXPCClient *XPCClient;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1B063EAC0;
  v37 = sub_1B063EA28;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1B063EAC0;
  v31 = sub_1B063EA28;
  v32 = 0;
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 188, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B06DB71C;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v27;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v7, (uint64_t)v26, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = sub_1B06DB72C;
    v25[3] = &unk_1E6135180;
    v25[4] = &v27;
    v25[5] = &v33;
    objc_msgSend_performSensingWithParameters_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v7, *MEMORY[0x1E0CB2FE0], 45, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v28[5];
    v28[5] = v24;
  }

  if (a4)
  {
    v21 = (void *)v28[5];
    if (v21)
      *a4 = objc_retainAutorelease(v21);
  }
  v22 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

- (void)performSensingWithParameters:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CWFXPCClient *XPCClient;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl()
    && objc_msgSend_allowRequestType_(self->_XPCClient, v8, 188, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v12 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06DB918;
    v27[3] = &unk_1E6134940;
    v13 = v7;
    v28 = v13;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v14, (uint64_t)v27, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = sub_1B06DB930;
    v25[3] = &unk_1E61351A8;
    v26 = v13;
    objc_msgSend_performSensingWithParameters_requestParams_reply_(v17, v23, (uint64_t)v6, (uint64_t)v22, (uint64_t)v25);

  }
  else if (v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v8, *MEMORY[0x1E0CB2FE0], 45, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v24, 0);

  }
}

- (id)performNearbyDeviceDiscovery:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CWFXPCClient *XPCClient;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1B063EAC0;
  v30 = sub_1B063EA28;
  v5 = *MEMORY[0x1E0CB2FE0];
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v6, *MEMORY[0x1E0CB2FE0], 61, 0);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 238, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v13 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1B06DBB00;
    v25[3] = &unk_1E61347F0;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v7, (uint64_t)v25, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = sub_1B06DBB10;
    v24[3] = &unk_1E61347F0;
    v24[4] = &v26;
    objc_msgSend_performNearbyDeviceDiscovery_requestParams_reply_(v14, v20, (uint64_t)v4, (uint64_t)v19, (uint64_t)v24);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v7, v5, 45, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v27[5];
    v27[5] = v23;
  }

  v21 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (id)cachedAutoJoinMetric
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 193, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132520, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DBC38;
    v18[3] = &unk_1E61351D0;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinMetricWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)autoJoinStatistics
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 194, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132120, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DBDA8;
    v18[3] = &unk_1E61351F8;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinStatisticsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (void)resetAutoJoinStatistics
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 195, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6135218, v6, v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resetAutoJoinStatisticsWithRequestParams_reply_(v15, v13, (uint64_t)v12, (uint64_t)&unk_1E61323A0, v14);

  }
}

- (id)userSettings
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 189, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6132140, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DBFA8;
    v18[3] = &unk_1E6135240;
    v18[4] = &v19;
    objc_msgSend_queryUserSettingsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)applyUserSettings:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CWFXPCClient *XPCClient;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  BOOL v26;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B063EAC0;
  v35 = sub_1B063EA28;
  v36 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v10, 190, v11, v12) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v17 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B06DC1C0;
    v30[3] = &unk_1E61347F0;
    v30[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v30, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = sub_1B06DC1D0;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v31;
    objc_msgSend_setUserSettings_properties_requestParams_reply_(v18, v24, (uint64_t)v8, (uint64_t)v9, (uint64_t)v23, v29);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 45, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v32[5];
    v32[5] = v28;
  }

  v25 = (void *)v32[5];
  if (a5 && v25)
  {
    *a5 = objc_retainAutorelease(v25);
    v25 = (void *)v32[5];
  }
  v26 = v25 == 0;
  _Block_object_dispose(&v31, 8);

  return v26;
}

- (BOOL)startHostAPModeWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CWFXPCClient *XPCClient;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1B063EAC0;
  v32 = sub_1B063EA28;
  v33 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 220, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v14 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B06DC384;
    v27[3] = &unk_1E61347F0;
    v27[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v27, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = sub_1B06DC394;
    v26[3] = &unk_1E61347F0;
    v26[4] = &v28;
    objc_msgSend_startHostAPModeWithConfiguration_requestParams_reply_(v15, v21, (uint64_t)v6, (uint64_t)v20, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 45, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v29[5];
    v29[5] = v25;
  }

  v22 = (void *)v29[5];
  if (a4 && v22)
  {
    *a4 = objc_retainAutorelease(v22);
    v22 = (void *)v29[5];
  }
  v23 = v22 == 0;
  _Block_object_dispose(&v28, 8);

  return v23;
}

- (void)stopHostAPMode
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 221, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61316C0, v6, v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopHostAPModeWithRequestParams_reply_(v15, v13, (uint64_t)v12, (uint64_t)&unk_1E6131C60, v14);

  }
}

- (id)hostAPStationList
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 233, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131AE0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DC54C;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryHostAPStationListWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)privateMACAddressForNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1B063EAC0;
  v25 = sub_1B063EA28;
  v26 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v5, 222, v6, v7) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1E6131DC0, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B06DC6D4;
    v20[3] = &unk_1E61348A8;
    v20[4] = &v21;
    objc_msgSend_queryPrivateMACAddressForNetworkProfile_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);

  }
  v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  int64_t v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v5, 223, v6, v7) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1E6131B00, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B06DC838;
    v20[3] = &unk_1E6134838;
    v20[4] = &v21;
    objc_msgSend_queryPrivateMACAddressModeForNetworkProfile_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);

  }
  v18 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BOOL)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFXPCClient *XPCClient;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  BOOL v25;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B063EAC0;
  v34 = sub_1B063EA28;
  v35 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v9, 224, v10, v11) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B06DCA24;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = sub_1B06DCA34;
    v28[3] = &unk_1E61347F0;
    v28[4] = &v30;
    objc_msgSend_setPrivateMACAddressMode_networkProfile_requestParams_reply_(v17, v23, a3, (uint64_t)v8, (uint64_t)v22, v28);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, *MEMORY[0x1E0CB2FE0], 45, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v31[5];
    v31[5] = v27;
  }

  v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = objc_retainAutorelease(v24);
    v24 = (void *)v31[5];
  }
  v25 = v24 == 0;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (int64_t)privateMACAddressModeSystemSetting
{
  uint64_t v2;
  uint64_t v3;
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
  int64_t v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 225, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E6131600, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DCB38;
    v18[3] = &unk_1E6134838;
    v18[4] = &v19;
    objc_msgSend_queryPrivateMACAddressModeSystemSettingWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setPrivateMACAddressModeSystemSetting:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CWFXPCClient *XPCClient;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  BOOL v21;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1B063EAC0;
  v30 = sub_1B063EA28;
  v31 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 226, (uint64_t)a4, v4) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1B06DCD0C;
    v25[3] = &unk_1E61347F0;
    v25[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v25, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = sub_1B06DCD1C;
    v24[3] = &unk_1E61347F0;
    v24[4] = &v26;
    objc_msgSend_setPrivateMACAddressModeSystemSetting_requestParams_reply_(v13, v19, a3, (uint64_t)v18, (uint64_t)v24);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v8, *MEMORY[0x1E0CB2FE0], 45, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v27[5];
    v27[5] = v23;
  }

  v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = objc_retainAutorelease(v20);
    v20 = (void *)v27[5];
  }
  v21 = v20 == 0;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4
{
  _BOOL8 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v4 = a3;
  v19 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v6, 227, v7, v8))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v9, (uint64_t)&unk_1E61321C0, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPrivateMACAddressUserJoinFailureUIState_networkProfile_requestParams_reply_(v12, v18, v4, (uint64_t)v19, (uint64_t)v17, &unk_1E6132540);

  }
}

- (BOOL)isQuickProbeRequiredForNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  char v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v5, 228, v6, v7) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1E6131660, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B06DCED8;
    v20[3] = &unk_1E6134838;
    v20[4] = &v21;
    objc_msgSend_queryIsQuickProbeRequiredForNetworkProfile_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);

  }
  v18 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BOOL)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFXPCClient *XPCClient;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  BOOL v25;
  uint64_t v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v8 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B063EAC0;
  v34 = sub_1B063EA28;
  v35 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v9, 229, v10, v11) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B06DD0C4;
    v29[3] = &unk_1E61347F0;
    v29[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v29, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = sub_1B06DD0D4;
    v28[3] = &unk_1E61347F0;
    v28[4] = &v30;
    objc_msgSend_reportQuickProbeResult_networkProfile_requestParams_reply_(v17, v23, v6, (uint64_t)v8, (uint64_t)v22, v28);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, *MEMORY[0x1E0CB2FE0], 45, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v31[5];
    v31[5] = v27;
  }

  v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = objc_retainAutorelease(v24);
    v24 = (void *)v31[5];
  }
  v25 = v24 == 0;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (id)getAutoJoinDenyList
{
  uint64_t v2;
  uint64_t v3;
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
  id v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1B063EAC0;
  v23 = sub_1B063EA28;
  v24 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, a2, 245, v2, v3) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1E61316E0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B06DD1FC;
    v18[3] = &unk_1E61348F0;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinDenyListWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);

  }
  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1B063EAC0;
  v27 = sub_1B063EA28;
  v28 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 246, v8, v9) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v10, (uint64_t)&unk_1E6132220, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B06DD3A8;
    v22[3] = &unk_1E61348F0;
    v22[4] = &v23;
    objc_msgSend_setAutoJoinDenyListForNetwork_reason_requestParams_reply_(v13, v19, (uint64_t)v6, a4, (uint64_t)v18, v22);

  }
  v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1B063EAC0;
  v27 = sub_1B063EA28;
  v28 = 0;
  if ((objc_msgSend_allowRequestType_(self->_XPCClient, v7, 247, v8, v9) & 1) != 0)
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v10, (uint64_t)&unk_1E6131700, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B06DD554;
    v22[3] = &unk_1E61348F0;
    v22[4] = &v23;
    objc_msgSend_clearAutoJoinDenyListForNetwork_reason_requestParams_reply_(v13, v19, (uint64_t)v6, a4, (uint64_t)v18, v22);

  }
  v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (CWFXPCClient)XPCClient
{
  return self->_XPCClient;
}

- (AWDLServiceDiscoveryManager)awdlServiceManager
{
  return self->_awdlServiceManager;
}

- (void)setAwdlServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_awdlServiceManager, a3);
}

@end
