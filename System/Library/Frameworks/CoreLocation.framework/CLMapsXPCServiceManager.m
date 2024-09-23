@implementation CLMapsXPCServiceManager

+ (id)sharedInstance
{
  NSObject *v2;
  char *v4;
  _QWORD block[5];
  uint8_t buf[1640];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECD8F730)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F66BE44;
    block[3] = &unk_1E2990DE0;
    block[4] = a1;
    if (qword_1ECD8F738 != -1)
      dispatch_once(&qword_1ECD8F738, block);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
    v2 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,XPCManager allocate", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLMapsXPCServiceManager sharedInstance]", "CoreLocation: %s\n", v4);
      if (v4 != (char *)buf)
        free(v4);
    }
  }
  return (id)qword_1ECD8F730;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v3;

  return (id)objc_msgSend_sharedInstance(a1, a2, (uint64_t)a3, v3);
}

- (void)createConnection
{
  NSXPCConnection *connection;
  id v4;
  const char *v5;
  uint64_t v6;
  NSXPCConnection *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  char *v35;
  uint8_t buf[1640];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (connection)
  {

    self->_connection = 0;
  }
  v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v7 = (NSXPCConnection *)objc_msgSend_initWithServiceName_(v4, v5, (uint64_t)CFSTR("com.apple.corelocation.maphelperservice"), v6);
  self->_connection = v7;
  if (v7)
  {
    self->fInactivityTimer = 0;
    self->fTimerUpdateMachContTime = -1.0;
    v10 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v8, (uint64_t)&unk_1EE190068, v9);
    objc_msgSend_setRemoteObjectInterface_(self->_connection, v11, v10, v12);
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v20 = objc_msgSend_setWithObjects_(v13, v18, v14, v19, v15, v16, v17, 0);
    v24 = (void *)objc_msgSend_remoteObjectInterface(self->_connection, v21, v22, v23);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v24, v25, v20, (uint64_t)sel_fetchGEORoadDataAroundCoordinate_inRadius_allowNetwork_isPedestrianOrCycling_clearTiles_withReply_, 0, 1);
    v29 = (void *)objc_msgSend_remoteObjectInterface(self->_connection, v26, v27, v28);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v29, v30, v20, (uint64_t)sel_fetchGEOBuildingDataAroundCoordinate_inRadius_tileSetStyle_allowNetwork_clearTiles_withReply_, 0, 1);
    objc_msgSend_resume(self->_connection, v31, v32, v33);
  }
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
  v34 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v34, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,createConnection", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
    v35 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager createConnection]", "CoreLocation: %s\n", v35);
    if (v35 != (char *)buf)
      free(v35);
  }
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  char *v19;
  objc_super v20;
  __int16 v21;
  uint8_t buf[1640];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
  v3 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,dealloc", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
    v21 = 0;
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager dealloc]", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf)
      free(v19);
  }
  objc_msgSend_releaseMapHelperServiceOSTransaction(self, v4, v5, v6);
  v10 = (void *)objc_msgSend_connection(self, v7, v8, v9);
  objc_msgSend_invalidate(v10, v11, v12, v13);

  objc_msgSend_setConnection_(self, v17, 0, v18);
  v20.receiver = self;
  v20.super_class = (Class)CLMapsXPCServiceManager;
  -[CLMapsXPCServiceManager dealloc](&v20, sel_dealloc);
}

- (void)collectMapDataOfType:(int64_t)a3 aroundCoordinate:(CLLocationCoordinate2D)a4 inRadius:(double)a5 allowNetwork:(BOOL)a6 isPedestrianOrCycling:(BOOL)a7 clearTiles:(BOOL)a8 callSynchronously:(BOOL)a9 WithReply:(id)a10
{
  _BOOL4 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  double longitude;
  double latitude;
  const char *v20;
  uint64_t v21;
  NSXPCConnection *connection;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, void *);
  double *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[9];
  BOOL v33;
  _QWORD v34[3];
  double v35;
  _QWORD v36[5];
  _QWORD v37[5];

  v11 = a9;
  v12 = a8;
  v13 = a7;
  v14 = a6;
  longitude = a4.longitude;
  latitude = a4.latitude;
  objc_msgSend_updateTimer(self, a2, a3, a6);
  connection = self->_connection;
  if (v11)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = sub_18F66C550;
    v37[3] = &unk_1E2991670;
    v37[4] = a10;
    v23 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(connection, v20, (uint64_t)v37, v21);
  }
  else
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_18F66C788;
    v36[3] = &unk_1E2991670;
    v36[4] = a10;
    v23 = objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v20, (uint64_t)v36, v21);
  }
  v24 = (void *)v23;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0.0;
  v25 = mach_continuous_time();
  v35 = sub_18F6BDF00(v25);
  if (a3 == 2)
  {
    v30 = MEMORY[0x1E0C809B0];
    v27 = 1;
    v28 = sub_18F66CF48;
    v29 = (double *)&v30;
LABEL_10:
    *((_QWORD *)v29 + 1) = 3221225472;
    *((_QWORD *)v29 + 2) = v28;
    *((_QWORD *)v29 + 4) = a10;
    *((_QWORD *)v29 + 5) = v34;
    v29[6] = latitude;
    v29[7] = longitude;
    v29[8] = a5;
    *((_BYTE *)v29 + 72) = v11;
    *((_QWORD *)v29 + 3) = &unk_1E2991D78;
    objc_msgSend_fetchGEOBuildingDataAroundCoordinate_inRadius_tileSetStyle_allowNetwork_clearTiles_withReply_(v24, v26, v27, v14, v12, latitude, longitude, a5, v30);
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    v27 = 0;
    v31 = MEMORY[0x1E0C809B0];
    v28 = sub_18F66CC84;
    v29 = (double *)&v31;
    goto LABEL_10;
  }
  if (a3)
  {
    (*((void (**)(id, _QWORD))a10 + 2))(a10, 0);
  }
  else
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_18F66C9C0;
    v32[3] = &unk_1E2991D78;
    *(double *)&v32[6] = latitude;
    *(double *)&v32[7] = longitude;
    *(double *)&v32[8] = a5;
    v33 = v11;
    v32[4] = a10;
    v32[5] = v34;
    objc_msgSend_fetchGEORoadDataAroundCoordinate_inRadius_allowNetwork_isPedestrianOrCycling_clearTiles_withReply_(v24, v26, v14, v13, v12, v32, latitude, longitude, a5);
  }
LABEL_12:
  _Block_object_dispose(v34, 8);
}

- (void)clearMemoryAndExitHelperProcessCleanly
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8F730)
  {
    v3 = objc_msgSend_remoteObjectProxyWithErrorHandler_(self->_connection, a2, (uint64_t)&unk_1E29904D0, v2);
    MEMORY[0x1E0DE7D20](v3, sel_clearMemoryAndExitCleanly, v6, v7);
  }
  else
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
    v4 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager clearMemoryAndExitHelperProcessCleanly]", "CoreLocation: %s\n", v5);
      if (v5 != (char *)buf)
        free(v5);
    }
  }
}

- (void)updateTimer
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSTimer *fInactivityTimer;
  NSObject *v9;
  double fTimerUpdateMachContTime;
  double v11;
  char *v12;
  _QWORD block[5];
  int v14;
  double v15;
  uint8_t buf[4];
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->fTimerUpdateMachContTime <= 0.0
    || (v3 = mach_continuous_time(), vabdd_f64(sub_18F6BDF00(v3), self->fTimerUpdateMachContTime) >= 60.0))
  {
    v4 = mach_continuous_time();
    self->fTimerUpdateMachContTime = sub_18F6BDF00(v4);
    fInactivityTimer = self->fInactivityTimer;
    if (fInactivityTimer)
    {
      objc_msgSend_invalidate(fInactivityTimer, v5, v6, v7);
      self->fInactivityTimer = 0;
    }
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
    v9 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
    {
      fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
      *(_DWORD *)buf = 134349056;
      v17 = fTimerUpdateMachContTime;
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,Inactivity timer updated in XPC manager,updateTime,%{public}.2lf", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
      v11 = self->fTimerUpdateMachContTime;
      v14 = 134349056;
      v15 = v11;
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager updateTimer]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F66D834;
    block[3] = &unk_1E2990DE0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)onTimerFire:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint8_t buf[1640];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
  v4 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,onTimerFire", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager onTimerFire:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf)
      free(v8);
  }
  objc_msgSend_releaseMapHelperServiceOSTransaction(self, v5, v6, v7);
}

- (void)releaseMapHelperServiceOSTransaction
{
  NSObject *v3;
  double fTimerUpdateMachContTime;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSTimer *fInactivityTimer;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  char *v14;
  char *v15;
  uint8_t buf[4];
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172168 != -1)
    dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
  v3 = qword_1EE172170;
  if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
  {
    fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
    *(_DWORD *)buf = 134349056;
    v17 = fTimerUpdateMachContTime;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,releaseMapHelperServiceOSTransaction,lastTimerUpdateTime,%{public}.2lf", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
  fInactivityTimer = self->fInactivityTimer;
  if (fInactivityTimer)
  {
    objc_msgSend_invalidate(fInactivityTimer, v5, v6, v7);
    self->fInactivityTimer = 0;
    self->fTimerUpdateMachContTime = -1.0;
  }
  if (qword_1ECD8F730)
  {
    v9 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(self->_connection, v5, (uint64_t)&unk_1E2991D98, v7);
    objc_msgSend_releaseOSTransaction(v9, v10, v11, v12);
  }
  else
  {
    if (qword_1EE172168 != -1)
      dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
    v13 = qword_1EE172170;
    if (os_log_type_enabled((os_log_t)qword_1EE172170, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172168 != -1)
        dispatch_once(&qword_1EE172168, &unk_1E2991DB8);
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf)
        free(v15);
    }
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
