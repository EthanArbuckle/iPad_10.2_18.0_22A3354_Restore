@implementation CLLocationInternalClient

- (unsigned)getPrecisionPermission:(char *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  void *v8;
  const char *v9;
  uint64_t *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  unsigned __int8 v16;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t buf;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = sub_18F5CD82C;
  v23 = sub_18F5CD7A4;
  v24 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18F5CD87C;
  v18[3] = &unk_1E2992828;
  v18[5] = &v19;
  v18[6] = a3;
  v18[4] = &v25;
  objc_msgSend_getPrecisionPermissionForBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, (uint64_t)a5, v18);
  v10 = v20;
  if (v20[5])
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v11 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      v12 = v20[5];
      buf = 68289282;
      v30 = 2082;
      v31 = "";
      v32 = 2114;
      v33 = v12;
      _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, CLInternalGetPrecisionPermission failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    }
    v13 = qword_1ECD8E750;
    v14 = os_signpost_enabled((os_log_t)qword_1ECD8E750);
    v10 = v20;
    if (v14)
    {
      v15 = v20[5];
      buf = 68289282;
      v30 = 2082;
      v31 = "";
      v32 = 2114;
      v33 = v15;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, CLInternalGetPrecisionPermission failed", "{\"msg%{public}.0s\":\"#Spi, CLInternalGetPrecisionPermission failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      v10 = v20;
    }
  }

  v16 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

- (__CFDictionary)copyMonitoredRegionsForBundleIdentifier:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  void *v6;
  const char *v7;
  __CFDictionary *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F5CD084;
  v10[3] = &unk_1E2992668;
  v10[4] = &v11;
  objc_msgSend_getMonitoredRegionsForBundleID_orBundlePath_replyBlock_(v6, v7, (uint64_t)a3, (uint64_t)a4, v10);
  v8 = (__CFDictionary *)v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (__CFArray)copyGnssBandsInUse
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFArray *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F5CD0AC;
  v9[3] = &unk_1E2992690;
  v9[4] = &v10;
  objc_msgSend_getGnssBandsInUseWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = (__CFArray *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

+ (id)sharedServiceClient
{
  if (qword_1ECD8F8A0 != -1)
    dispatch_once(&qword_1ECD8F8A0, &unk_1E29908D0);
  return (id)qword_1ECD8F8A8;
}

- (__CFArray)copyTechnologiesInUse
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFArray *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F5B4C28;
  v9[3] = &unk_1E2992690;
  v9[4] = &v10;
  objc_msgSend_getTechnologiesInUseWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = (__CFArray *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)synchronousRemoteObject
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  objc_sync_enter(self);
  v6 = (void *)objc_msgSend_sharedInstance(MEMORY[0x1E0D44540], v3, v4, v5);
  objc_msgSend_intendToSyncServiceWithName_(v6, v7, (uint64_t)CFSTR("CLInternalService"), v8);
  v12 = (void *)objc_msgSend_connection(self, v9, v10, v11);
  v15 = (void *)objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)&unk_1E29925A0, v14);
  objc_sync_exit(self);
  return v15;
}

- (id)connection
{
  NSXPCConnection *connection;
  id v4;
  const char *v5;
  NSXPCConnection *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[5];

  objc_sync_enter(self);
  connection = self->_connection;
  if (!connection)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.locationd.synchronous"), 4096);
    self->_connection = v6;
    v9 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v7, (uint64_t)&unk_1EE190C78, v8);
    objc_msgSend_setRemoteObjectInterface_(v6, v10, v9, v11);
    objc_msgSend_setInterruptionHandler_(self->_connection, v12, (uint64_t)&unk_1E2992580, v13);
    v14 = self->_connection;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_18F6D7D50;
    v21[3] = &unk_1E2990DE0;
    v21[4] = self;
    objc_msgSend_setInvalidationHandler_(v14, v15, (uint64_t)v21, v16);
    objc_msgSend_resume(self->_connection, v17, v18, v19);
    connection = self->_connection;
  }
  objc_sync_exit(self);
  return connection;
}

- (unsigned)getAuthorizationStatus:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  void *v8;
  const char *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F5CCF88;
  v11[3] = &unk_1E29925F0;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend_getAuthorizationStatusForBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, (uint64_t)a5, v11);
  LOBYTE(a5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)getLocationServicesEnabled:(char *)a3
{
  uint64_t v3;
  char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  if (a3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_18F5CD8C8;
    v9[3] = &unk_1E29925F0;
    v9[4] = &v10;
    v9[5] = v4;
    objc_msgSend_getLocationServicesEnabledWithReplyBlock_(v5, v6, (uint64_t)v9, v7);
    LOBYTE(v4) = *((_BYTE *)v11 + 24);
    _Block_object_dispose(&v10, 8);
  }
  return v4;
}

- (unsigned)setAuthorizationStatus:(unsigned __int8)a3 withCorrectiveCompensation:(int)a4 forBundleID:(__CFString *)a5 orBundlePath:(__CFString *)a6
{
  uint64_t v8;
  int v9;
  void *v10;
  const char *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, *(uint64_t *)&a4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F6D81A4;
  v13[3] = &unk_1E29925C8;
  v13[4] = &v14;
  objc_msgSend_setAuthorizationStatus_withCorrectiveCompensation_forBundleID_orBundlePath_replyBlock_(v10, v11, v9 != 0, v8, a5, a6, v13);
  LOBYTE(a6) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return a6;
}

- (unsigned)getIncidentalUseMode:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  void *v8;
  const char *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6D827C;
  v11[3] = &unk_1E29925F0;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend_getIncidentalUseModeForBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, (uint64_t)a5, v11);
  LOBYTE(a5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)reportLocationUtilityEvent:(int)a3 atDate:(__CFDate *)a4
{
  __CFDate *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, (uint64_t)a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D835C;
  v9[3] = &unk_1E29925C8;
  v9[4] = &v10;
  objc_msgSend_reportLocationUtilityEvent_atDate_withReplyBlock_(v6, v7, v5, (uint64_t)v4, v9);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)clearLocationAuthorizationForBundleId:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  void *v6;
  const char *v7;
  _QWORD v8[5];
  _QWORD v9[3];
  char v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F6D8424;
  v8[3] = &unk_1E29925C8;
  v8[4] = v9;
  objc_msgSend_resetClientForBundleId_orBundlePath_withReplyBlock_(v6, v7, (uint64_t)a3, (uint64_t)a4, v8);
  _Block_object_dispose(v9, 8);
}

- (unsigned)clearLocationAuthorizations
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unsigned __int8 v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D84E0;
  v9[3] = &unk_1E29925C8;
  v9[4] = &v10;
  objc_msgSend_resetAllClientsWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)getArchivedAuthorizationDecisionsWithError:(id *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = sub_18F5CD82C;
  v25 = sub_18F5CD7A4;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = sub_18F5CD82C;
  v19 = sub_18F5CD7A4;
  v20 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18F6D864C;
  v14[3] = &unk_1E2992618;
  v14[4] = &v15;
  v14[5] = &v21;
  objc_msgSend_getArchivedAuthorizationDecisionsWithReplyBlock_(v5, v6, (uint64_t)v14, v7);
  v8 = (id)v22[5];
  v9 = (id)v16[5];
  if (!v22[5] && !v16[5])
  {
    v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, (uint64_t)CFSTR("com.apple.locationd.internalservice.errorDomain"), 1, 0);
    v16[5] = v11;
  }
  if (a3)
    *a3 = (id)v16[5];
  v12 = (void *)v22[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

- (id)applyArchivedAuthorizationDecisions:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  id v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;

  v9 = objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, v3);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = sub_18F5CD82C;
  v28 = sub_18F5CD7A4;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v10 = 3;
  v11 = MEMORY[0x1E0C809B0];
  do
  {
    v12 = (void *)objc_msgSend_synchronousRemoteObject(self, v6, v7, v8);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = sub_18F6D881C;
    v19[3] = &unk_1E2992640;
    v19[4] = &v24;
    v19[5] = &v20;
    objc_msgSend_applyArchivedAuthorizationDecisions_withConfirmationToken_replyBlock_(v12, v13, (uint64_t)a3, v9, v19);
    if (*((_BYTE *)v21 + 24))
    {
      v14 = (void *)v25[5];
      goto LABEL_7;
    }
    --v10;
  }
  while (v10);
  v14 = (void *)v25[5];
  if (!v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v15, v16, (uint64_t)CFSTR("com.apple.locationd.internalservice.errorDomain"), 1, 0);
    v25[5] = (uint64_t)v14;
  }
LABEL_7:
  v17 = v14;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v17;
}

- (__CFDictionary)copyAppsUsingLocation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFDictionary *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_18F5CD82C;
  v14 = sub_18F5CD7A4;
  v15 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D8910;
  v9[3] = &unk_1E2992668;
  v9[4] = &v10;
  objc_msgSend_getAppsUsingLocationWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = (__CFDictionary *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (__CFDictionary)copyActiveClientsUsingLocation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFDictionary *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_18F5CD82C;
  v14 = sub_18F5CD7A4;
  v15 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D89EC;
  v9[3] = &unk_1E2992668;
  v9[4] = &v10;
  objc_msgSend_getActiveClientsUsingLocationWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = (__CFDictionary *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (__CFDictionary)copyInternalState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFDictionary *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_18F5CD82C;
  v14 = sub_18F5CD7A4;
  v15 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D8AC8;
  v9[3] = &unk_1E2992668;
  v9[4] = &v10;
  objc_msgSend_getClientManagerInternalStateWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = (__CFDictionary *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (__CFString)copyMicroLocationInternalVersion
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFString *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D8B94;
  v9[3] = &unk_1E29926B8;
  v9[4] = &v10;
  objc_msgSend_getMicroLocationInternalVersionWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = (__CFString *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (__CFDictionary)copyZaxisStats
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFDictionary *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D8C60;
  v9[3] = &unk_1E2992668;
  v9[4] = &v10;
  objc_msgSend_getZaxisStatsWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = (__CFDictionary *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)setLocationDefaultForKey:(__CFString *)a3 value:(void *)a4
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      v6 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], a2, (uint64_t)a4, 200, 0, 0);
    else
      v6 = 0;
    v8 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
    MEMORY[0x1E0DE7D20](v8, sel_setLocationDefaultForKey_andValue_replyBlock_, a3, v6);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "#Spi, Key is NULL!", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationInternalClient setLocationDefaultForKey:value:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
  }
}

- (void)getLocationDefaultForKey:(__CFString *)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v4 = a3;
  if (a3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3052000000;
    v14 = sub_18F5CD82C;
    v15 = sub_18F5CD7A4;
    v16 = 0;
    v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_18F6D910C;
    v10[3] = &unk_1E2992700;
    v10[4] = &v11;
    objc_msgSend_getLocationDefaultForKey_replyBlock_(v5, v6, (uint64_t)v4, (uint64_t)v10);
    v8 = v12[5];
    if (v8)
    {
      v4 = (void *)objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v7, v8, 0, 0, 0);

    }
    else
    {
      v4 = 0;
    }
    _Block_object_dispose(&v11, 8);
  }
  return v4;
}

- (id)timeZoneAtLocation:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  _QWORD v17[5];
  _OWORD v18[10];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  if (!a3)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    v15 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v13, (uint64_t)"-[CLLocationInternalClient timeZoneAtLocation:]", v14);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v12, v16, v15, (uint64_t)CFSTR("LocationInternal.m"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != location"));
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = sub_18F5CD82C;
  v23 = sub_18F5CD7A4;
  v24 = 0;
  v9 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
  if (a3)
    objc_msgSend_clientLocation(a3, v6, v7, v8);
  else
    memset(v18, 0, 156);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18F6D9380;
  v17[3] = &unk_1E29926B8;
  v17[4] = &v19;
  objc_msgSend_timeZoneForLocation_replyBlock_(v9, v6, (uint64_t)v18, (uint64_t)v17);
  v10 = (id)v20[5];
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)setPrivateMode:(unsigned __int8)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend_synchronousRemoteObject(self, a2, a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setPrivateMode_replyBlock_, v4 != 0, &unk_1E2992720);
}

- (unsigned)getPrivateMode
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unsigned __int8 v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D9624;
  v9[3] = &unk_1E2992748;
  v9[4] = &v10;
  objc_msgSend_getPrivateMode_(v4, v5, (uint64_t)v9, v6);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)pingDaemon
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unsigned __int8 v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D96E0;
  v9[3] = &unk_1E29925C8;
  v9[4] = &v10;
  objc_msgSend_pingDaemonWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)setLocationServicesEnabled:(unsigned __int8)a3
{
  uint64_t v3;
  int v4;
  void *v5;
  const char *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, v3);
  objc_msgSend_setLocationServicesEnabled_replyBlock_(v5, v6, v4 != 0, (uint64_t)&unk_1E2992768);
  CFPreferencesSynchronize(CFSTR("com.apple.locationd"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (id)setAuthorizationPromptMapDisplayEnabled:(unsigned __int8)a3
{
  uint64_t v3;
  int v4;
  void *v5;
  const char *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_18F5CD82C;
  v14 = sub_18F5CD7A4;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6D99A0;
  v9[3] = &unk_1E29925C8;
  v9[4] = &v10;
  objc_msgSend_setAuthorizationPromptMapDisplayEnabled_replyBlock_(v5, v6, v4 != 0, (uint64_t)v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)getAuthorizationPromptMapDisplayEnabled:(char *)a3
{
  uint64_t v3;
  char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  if (a3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_18F6D9BF4;
    v9[3] = &unk_1E2992790;
    v9[4] = &v10;
    v9[5] = v4;
    objc_msgSend_getAuthorizationPromptMapDisplayEnabledWithReplyBlock_(v5, v6, (uint64_t)v9, v7);
    LOBYTE(v4) = *((_BYTE *)v11 + 24);
    _Block_object_dispose(&v10, 8);
  }
  return v4;
}

- (id)setTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 statusData:(id)a5
{
  void *v9;
  const char *v10;
  id v11;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = sub_18F5CD82C;
  v23 = sub_18F5CD7A4;
  v24 = 0;
  if (!a5)
  {
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    v16 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v14, (uint64_t)"-[CLLocationInternalClient setTemporaryAuthorizationStatusForBundleId:orBundlePath:statusData:]", v15);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v13, v17, v16, (uint64_t)CFSTR("LocationInternal.m"), 765, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));
  }
  v9 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18F6D9D64;
  v18[3] = &unk_1E29925C8;
  v18[4] = &v19;
  objc_msgSend_setTemporaryAuthorizationStatusForBundleId_orBundlePath_statusData_replyBlock_(v9, v10, (uint64_t)a3, (uint64_t)a4, a5, v18);
  v11 = (id)v20[5];
  _Block_object_dispose(&v19, 8);
  return v11;
}

- (id)getTemporaryAuthorizationStatusForBundleId:(id)a3 orBundlePath:(id)a4 error:(id *)a5
{
  void *v8;
  const char *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = sub_18F5CD82C;
  v17 = sub_18F5CD7A4;
  v18 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F6D9FE8;
  v12[3] = &unk_1E29927B8;
  v12[4] = &v13;
  v12[5] = a5;
  objc_msgSend_getTemporaryAuthorizationStatusForBundleId_orBundlePath_replyBlock_(v8, v9, (uint64_t)a3, (uint64_t)a4, v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (double)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5
{
  void *v8;
  const char *v9;
  double v10;
  _QWORD v12[5];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  unint64_t v16;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0xBFF0000000000000;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a4, (uint64_t)a5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F6DA27C;
  v12[3] = &unk_1E29927E0;
  v12[4] = &v13;
  objc_msgSend_modifyOrSetAuthorizationTime_forBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, (uint64_t)a5, v12, a3);
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)triggerExpiredAuthorizationPurgeOnClientManager
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_18F5CD82C;
  v14 = sub_18F5CD7A4;
  v15 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DA4E0;
  v9[3] = &unk_1E29925C8;
  v9[4] = &v10;
  objc_msgSend_triggerExpiredAuthorizationPurgeWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)setGestureServiceEnabled:(unsigned __int8)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend_synchronousRemoteObject(self, a2, a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_setGestureServiceEnabled_replyBlock_, v4 != 0, &unk_1E2992800);
}

- (unsigned)getGestureServiceEnabled:(char *)a3
{
  uint64_t v3;
  char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  if (a3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_18F6DA8E8;
    v9[3] = &unk_1E2992790;
    v9[4] = &v10;
    v9[5] = v4;
    objc_msgSend_getGestureServiceEnabledWithReplyBlock_(v5, v6, (uint64_t)v9, v7);
    LOBYTE(v4) = *((_BYTE *)v11 + 24);
    _Block_object_dispose(&v10, 8);
  }
  return v4;
}

- (unsigned)getAuthorizationStatusForApp:(int *)a3 withAuditToken:(id *)a4
{
  $115C4C562B26FF47E01F9F4EA65B5887 *v4;
  void *v6;
  __int128 v7;
  const char *v8;
  _OWORD v10[2];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DA9CC;
  v11[3] = &unk_1E29925F0;
  v11[4] = &v12;
  v11[5] = a3;
  v7 = *(_OWORD *)&v4->var0[4];
  v10[0] = *(_OWORD *)v4->var0;
  v10[1] = v7;
  objc_msgSend_getAuthorizationStatusForAppWithAuditToken_replyBlock_(v6, v8, (uint64_t)v10, (uint64_t)v11);
  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (unsigned)performMigration
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned __int8 v8;
  char *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DAC08;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_performMigrationWithReplyBlock_(v4, v5, (uint64_t)v11, v6);
  if (!*((_BYTE *)v13 + 24))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "#Spi, _CLInternalPerformMigration failed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationInternalClient performMigration]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf)
        free(v10);
    }
  }
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (unsigned)shutdownDaemon
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned __int8 v8;
  char *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DAE38;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_shutdownDaemonWithReplyBlock_(v4, v5, (uint64_t)v11, v6);
  if (!*((_BYTE *)v13 + 24))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "#Spi, _CLShutdownDaemon failed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationInternalClient shutdownDaemon]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf)
        free(v10);
    }
  }
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (unsigned)displayStatistics
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned __int8 v8;
  char *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DB064;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_displayStatisticsWithReplyBlock_(v4, v5, (uint64_t)v11, v6);
  if (!*((_BYTE *)v13 + 24))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "#Spi, _CLDisplayStatistics failed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationInternalClient displayStatistics]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf)
        free(v10);
    }
  }
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (unsigned)dumpLogs:(__CFString *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  NSObject *v7;
  unsigned __int8 v8;
  char *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DB29C;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_dumpLogsWithDescription_replyBlock_(v5, v6, (uint64_t)a3, (uint64_t)v11);
  if (!*((_BYTE *)v13 + 24))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "#Spi, _CLDumpLogs failed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationInternalClient dumpLogs:]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf)
        free(v10);
    }
  }
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (BOOL)checkAndExerciseAuthorizationForBundleID:(id)a3 orBundlePath:(id)a4 services:(unint64_t)a5 error:(id *)a6
{
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  char v15;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = sub_18F5CD82C;
  v26 = sub_18F5CD7A4;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v10 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18F6DB44C;
  v17[3] = &unk_1E2992850;
  v17[4] = &v22;
  v17[5] = &v28;
  v17[6] = &v18;
  objc_msgSend_checkAndExerciseAuthorizationForBundleID_orBundlePath_services_replyBlock_(v10, v11, (uint64_t)a3, (uint64_t)a4, a5, v17);
  v12 = (id)v23[5];
  if (!*((_BYTE *)v19 + 24))
  {
    v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB28A8], 4097, 0);
    v23[5] = v14;
  }
  if (a6)
    *a6 = (id)v23[5];
  v15 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v15;
}

- (BOOL)registerCircularInterestZoneWithId:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 forBundleId:(id)a9 orBundlePath:(id)a10 error:(id *)a11
{
  uint64_t v14;
  uint64_t v15;
  void *v20;
  const char *v21;
  id v22;
  BOOL v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v14 = *(_QWORD *)&a8;
  v15 = *(_QWORD *)&a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = sub_18F5CD82C;
  v30 = sub_18F5CD7A4;
  v31 = 0;
  v20 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, *(uint64_t *)&a7);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_18F6DB610;
  v25[3] = &unk_1E2992640;
  v25[4] = &v26;
  v25[5] = &v32;
  objc_msgSend_registerCircularInterestZoneWithId_latitude_longitude_radius_serviceMaskOperator_provenanceType_forBundleId_orBundlePath_replyBlock_(v20, v21, (uint64_t)a3, v15, v14, a9, a10, v25, a4, a5, a6);
  v22 = (id)v27[5];
  if (a11)
    *a11 = (id)v27[5];
  v23 = *((_BYTE *)v33 + 24) != 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v23;
}

- (BOOL)registerPhenolicInterestZoneWithId:(id)a3 phenolicLocation:(int)a4 serviceMaskOperator:(int)a5 provenanceType:(int)a6 forBundleId:(id)a7 orBundlePath:(id)a8 error:(id *)a9
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  const char *v16;
  id v17;
  BOOL v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = sub_18F5CD82C;
  v25 = sub_18F5CD7A4;
  v26 = 0;
  v15 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, *(uint64_t *)&a4);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18F6DB7B0;
  v20[3] = &unk_1E2992640;
  v20[4] = &v21;
  v20[5] = &v27;
  objc_msgSend_registerPhenolicInterestZoneWithId_phenolicLocation_serviceMaskOperator_provenanceType_forBundleId_orBundlePath_replyBlock_(v15, v16, (uint64_t)a3, v13, v12, v11, a7, a8, v20);
  v17 = (id)v22[5];
  if (a9)
    *a9 = (id)v22[5];
  v18 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v18;
}

- (BOOL)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForBundleId:(id)a5 orBundlePath:(id)a6 error:(id *)a7
{
  _BOOL8 v11;
  void *v12;
  const char *v13;
  id v14;
  BOOL v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v11 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_18F5CD82C;
  v22 = sub_18F5CD7A4;
  v23 = 0;
  v12 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, (uint64_t)a4);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18F6DB93C;
  v17[3] = &unk_1E2992640;
  v17[4] = &v18;
  v17[5] = &v24;
  objc_msgSend_setRelevance_forInterestZoneWithId_registeredForBundleId_orBundlePath_replyBlock_(v12, v13, v11, (uint64_t)a4, a5, a6, v17);
  v14 = (id)v19[5];
  if (a7)
    *a7 = (id)v19[5];
  v15 = *((_BYTE *)v25 + 24) != 0;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v15;
}

- (BOOL)deleteInterestZoneWithId:(id)a3 registeredForBundleId:(id)a4 orBundlePath:(id)a5 error:(id *)a6
{
  void *v10;
  const char *v11;
  id v12;
  BOOL v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = sub_18F5CD82C;
  v20 = sub_18F5CD7A4;
  v21 = 0;
  v10 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18F6DBAB8;
  v15[3] = &unk_1E2992640;
  v15[4] = &v16;
  v15[5] = &v22;
  objc_msgSend_deleteInterestZoneWithId_registeredForBundleId_orBundlePath_replyBlock_(v10, v11, (uint64_t)a3, (uint64_t)a4, a5, v15);
  v12 = (id)v17[5];
  if (a6)
    *a6 = (id)v17[5];
  v13 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

- (unsigned)getLocationForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 dynamicAccuracyReductionEnabled:(unsigned __int8)a5 allowsAlteredAccessoryLocations:(unsigned __int8)a6 location:(id *)a7
{
  int v8;
  int v9;
  void *v12;
  const char *v13;
  unsigned __int8 v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  if (!a7)
    return 0;
  v8 = a6;
  v9 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18F6DBBE8;
  v16[3] = &unk_1E29927B8;
  v16[4] = &v17;
  v16[5] = a7;
  objc_msgSend_getLocationForBundleID_orBundlePath_dynamicAccuracyReductionEnabled_allowsAlteredAccessoryLocations_replyBlock_(v12, v13, (uint64_t)a3, (uint64_t)a4, v9 != 0, v8 != 0, v16);
  v14 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v14;
}

- (unsigned)getGroundAltitudeForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 location:(id)a5 groundAltitude:(id *)a6
{
  unsigned __int8 v6;
  void *v11;
  const char *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = 0;
  if (a5 && a6)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v11 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_18F6DBD0C;
    v14[3] = &unk_1E2992878;
    v14[4] = &v15;
    v14[5] = a6;
    objc_msgSend_getGroundAltitudeForBundleID_orBundlePath_location_replyBlock_(v11, v12, (uint64_t)a3, (uint64_t)a4, a5, v14);
    v6 = *((_BYTE *)v16 + 24);
    _Block_object_dispose(&v15, 8);
  }
  return v6;
}

- (void)setMapMatchingRouteHint:(id *)a3 count:(int)a4 routingType:(int)a5 stepType:(int)a6
{
  NSObject *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char *v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a4 < 501)
  {
    v9 = *(_QWORD *)&a6;
    v10 = *(_QWORD *)&a5;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v13 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240704;
      v23 = a4;
      v24 = 1026;
      v25 = v10;
      v26 = 1026;
      v27 = v9;
      _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEBUG, "#Spi,RouteHint,LocationInternal,Received route hint road segments,%{public}d,routeType,%{public}d,stepType,%{public}d", buf, 0x14u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationInternalClient setMapMatchingRouteHint:count:routingType:stepType:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf)
        free(v21);
    }
    v15 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v14, (uint64_t)a3, 40 * a4);
    v19 = (void *)objc_msgSend_synchronousRemoteObject(self, v16, v17, v18);
    objc_msgSend_setMapMatchingRouteHint_routingType_stepType_replyBlock_(v19, v20, v15, v10, v9, &unk_1E298DA70);
  }
  else
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240448;
      v23 = a4;
      v24 = 1026;
      v25 = 500;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_ERROR, "#Spi,RouteHintError, Exceeded max number of route hint road segments (%{public}d > %{public}d)", buf, 0xEu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationInternalClient setMapMatchingRouteHint:count:routingType:stepType:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
    }
  }
}

- (void)setTrackRunHint:(id *)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char *v13;
  uint8_t buf[1640];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_INFO, "#Spi,CLTR,CLTrackRunHint received,framework side", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationInternalClient setTrackRunHint:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)a3, 16);
  v11 = (void *)objc_msgSend_synchronousRemoteObject(self, v8, v9, v10);
  objc_msgSend_setTrackRunHint_replyBlock_(v11, v12, v7, (uint64_t)&unk_1E298D990);
}

- (int)getAccessoryTypeBitSet
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  int v11;
  char *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F6DC7D0;
  v13[3] = &unk_1E29928A0;
  v13[4] = &v14;
  objc_msgSend_getAccessoryTypeBitSetWithReplyBlock_(v4, v5, (uint64_t)v13, v6);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
  {
    v8 = *((_DWORD *)v15 + 6);
    *(_DWORD *)buf = 67109120;
    v21 = v8;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "#Spi,getAccessoryTypeBitSet,%d", buf, 8u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v11 = *((_DWORD *)v15 + 6);
    v18 = 67109120;
    v19 = v11;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationInternalClient getAccessoryTypeBitSet]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf)
      free(v12);
  }
  v9 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (int)getAccessoryPASCDTransmissionState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  int v11;
  char *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 4;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F6DCBAC;
  v13[3] = &unk_1E29928A0;
  v13[4] = &v14;
  objc_msgSend_getAccessoryPASCDTransmissionStateWithReplyBlock_(v4, v5, (uint64_t)v13, v6);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
  v7 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
  {
    v8 = *((_DWORD *)v15 + 6);
    *(_DWORD *)buf = 67109120;
    v21 = v8;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "#Spi,getAccessoryPASCDTransmissionState,%d", buf, 8u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v11 = *((_DWORD *)v15 + 6);
    v18 = 67109120;
    v19 = v11;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationInternalClient getAccessoryPASCDTransmissionState]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf)
      free(v12);
  }
  v9 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)getOdometryBatchedLocations
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = sub_18F5CD82C;
  v24 = sub_18F5CD7A4;
  v25 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18F6DCFB8;
  v19[3] = &unk_1E2992668;
  v19[4] = &v20;
  objc_msgSend_getOdometryBatchedLocationsWithReplyBlock_(v4, v5, (uint64_t)v19, v6);
  if (v21[5])
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend_count((void *)v21[5], v8, v9, v10);
      *(_DWORD *)buf = 134349056;
      v29 = v11;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEBUG, "#Spi,getOdometryBatchedLocations,returned with count,%{public}lu", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v17 = objc_msgSend_count((void *)v21[5], v14, v15, v16);
      v26 = 134349056;
      v27 = v17;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationInternalClient getOdometryBatchedLocations]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
  }
  v12 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v12;
}

- (unsigned)copyLastLog
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned __int8 v8;
  char *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DD4CC;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_copyLastLogWithReplyBlock_(v4, v5, (uint64_t)v11, v6);
  if (!*((_BYTE *)v13 + 24))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v7 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_FAULT, "#Spi, _CLCopyLastLog failed", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLLocationInternalClient copyLastLog]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf)
        free(v10);
    }
  }
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (unsigned)setStatusBarIconEnabled:(BOOL)a3 forEntityClass:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  unsigned __int8 v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, *(uint64_t *)&a4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F6DD710;
  v12[3] = &unk_1E29925C8;
  v12[4] = &v13;
  objc_msgSend_setStatusBarIconEnabledForEntityClass_enabled_replyBlock_(v6, v7, v4, v5, v12);
  if (!*((_BYTE *)v14 + 24))
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    v8 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2050;
      v22 = (int)v4;
      _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, Setting status bar enabled for entity class failed\", \"entityClass\":%{public, location:CLLocationDictionaryUtilitiesEntityClass}lld}", buf, 0x1Cu);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
    }
    v9 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289282;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2050;
      v22 = (int)v4;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, Setting status bar enabled for entity class failed", "{\"msg%{public}.0s\":\"#Spi, Setting status bar enabled for entity class failed\", \"entityClass\":%{public, location:CLLocationDictionaryUtilitiesEntityClass}lld}", buf, 0x1Cu);
    }
  }
  v10 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (unsigned)getStatusBarIconEnabled:(BOOL *)a3 forEntityClass:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  _QWORD v9[6];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = *(_QWORD *)&a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, *(uint64_t *)&a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DD7E4;
  v9[3] = &unk_1E29928C8;
  v9[4] = &v11;
  v9[5] = a3;
  v10 = v4;
  objc_msgSend_getStatusBarIconEnabledForEntityClass_replyBlock_(v6, v7, v4, (uint64_t)v9);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (int)getStatusBarIconState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DDA34;
  v9[3] = &unk_1E29928A0;
  v9[4] = &v10;
  objc_msgSend_getStatusBarIconState_(v4, v5, (uint64_t)v9, v6);
  v7 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)getPipelinedCache
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v5 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = sub_18F5CD82C;
  v19 = sub_18F5CD7A4;
  v20 = 0;
  v6 = MEMORY[0x1E0C809B0];
  do
  {
    v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = sub_18F6DDB44;
    v14[3] = &unk_1E2992690;
    v14[4] = &v15;
    objc_msgSend_getPipelinedCacheWithReply_(v7, v8, (uint64_t)v14, v9);
    v10 = (void *)v16[5];
    if (v10)
      v11 = 1;
    else
      v11 = v5 >= 9;
    ++v5;
  }
  while (!v11);
  v12 = v10;
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (unsigned)getGyroCalibrationDatabaseBiasFit:(id *)a3 atTemperature:(float)a4
{
  uint64_t v4;
  $F7A6A145155A76E4ABCC957096C443C4 *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DDC3C;
  v11[3] = &unk_1E29927B8;
  v11[4] = &v12;
  v11[5] = v6;
  objc_msgSend_getGyroCalibrationDatabaseBiasFitAtTemperature_withReply_(v7, v8, (uint64_t)v11, v9, COERCE_DOUBLE((unint64_t)LODWORD(a4)));
  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v6;
}

- (BOOL)startStopAdvertisingBeacon:(id)a3 power:(id)a4
{
  uint64_t v6;
  void *v7;
  const char *v8;
  BOOL v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  if (a4)
    v6 = objc_msgSend_intValue(a4, a2, (uint64_t)a3, (uint64_t)a4);
  else
    v6 = 0xFFFFFFFFLL;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DDD64;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_startStopAdvertisingBeacon_atPower_replyBlock_(v7, v8, (uint64_t)a3, v6, v11);
  v9 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unsigned)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6
{
  uint64_t v6;
  uint64_t v7;
  float var2;
  float var1;
  float var0;
  float v13;
  float v14;
  float v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  unsigned __int8 v25;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  var2 = a5.var2;
  var1 = a5.var1;
  var0 = a5.var0;
  v13 = a3.var2;
  v14 = a3.var1;
  v15 = a3.var0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v16 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v6, v7);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_18F6DDE80;
  v27[3] = &unk_1E29925C8;
  v27[4] = &v28;
  *(float *)&v17 = v14;
  *(float *)&v18 = v13;
  *(float *)&v19 = a4;
  *(float *)&v20 = var0;
  *(float *)&v21 = var1;
  *(float *)&v22 = var2;
  objc_msgSend_insertGyroCalibrationDatabaseBiasEstimateIfValid_temperature_variance_timestamp_replyBlock_(v16, v23, (uint64_t)v27, v24, COERCE_DOUBLE((unint64_t)LODWORD(v15)), v17, v18, v19, v20, v21, v22, a6);
  v25 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v28, 8);
  return v25;
}

- (unsigned)gyroCalibrationDatabaseWipe
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unsigned __int8 v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DDF3C;
  v9[3] = &unk_1E29925C8;
  v9[4] = &v10;
  objc_msgSend_gyroCalibrationDatabaseWipeWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)getGyroCalibrationDatabaseNumTemperatures:(int *)a3
{
  uint64_t v3;
  int *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DDFFC;
  v9[3] = &unk_1E29925F0;
  v9[4] = &v10;
  v9[5] = v4;
  objc_msgSend_gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock_(v5, v6, (uint64_t)v9, v7);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (unsigned)configure:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)&a3.var7;
  v4 = *(_QWORD *)&a3.var0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3.var0, *(uint64_t *)&a3.var7);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F6DE0DC;
  v8[3] = &unk_1E29925C8;
  v8[4] = &v9;
  objc_msgSend_configure_replyBlock_(v5, v6, v4, v3, v8);
  LOBYTE(v3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v3;
}

- (unsigned)getControlPlaneStatusReportClear:(int)a3 startTime:(double *)a4 endTime:(double *)a5 latitude:(double *)a6 longitude:(double *)a7 altitude:(double *)a8 accuracy:(double *)a9 status:(unsigned int *)a10
{
  unsigned __int8 v10;
  uint64_t v16;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  char *v30;
  _QWORD v32[12];
  __int16 v33;
  _QWORD v34[12];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint8_t buf[1632];
  uint64_t v42;

  v10 = 0;
  v42 = *MEMORY[0x1E0C80C00];
  if (a7 && a6 && a4 && a5 && a10)
  {
    v16 = *(_QWORD *)&a3;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3052000000;
    v38 = sub_18F5CD82C;
    v39 = sub_18F5CD7A4;
    v40 = 0;
    v18 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, (uint64_t)a4);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = sub_18F6DE40C;
    v34[3] = &unk_1E29928F0;
    v34[6] = a5;
    v34[7] = a6;
    v34[8] = a7;
    v34[9] = a8;
    v34[10] = a9;
    v34[11] = a10;
    v34[4] = &v35;
    v34[5] = a4;
    objc_msgSend_getControlPlaneStatusReportClear_replyBlock_(v18, v19, v16, (uint64_t)v34);
    while (1)
    {
      v23 = (void *)v36[5];
      if (!v23)
      {
        v10 = 1;
        goto LABEL_21;
      }
      if (objc_msgSend_code(v23, v20, v21, v22) != 1)
        break;
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
      v24 = qword_1ECD8E750;
      if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_DEBUG, "#Spi, Blocking Mig routine deferred on Daemon side... waiting and retrying", buf, 2u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E298DAB0);
        v33 = 0;
        v30 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationInternalClient getControlPlaneStatusReportClear:startTime:endTime:latitude:longitude:altitude:accuracy:status:]", "CoreLocation: %s\n", v30);
        if (v30 != (char *)buf)
          free(v30);
      }
      sleep(1u);
      v28 = (void *)objc_msgSend_synchronousRemoteObject(self, v25, v26, v27);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = sub_18F6DE448;
      v32[3] = &unk_1E29928F0;
      v32[6] = a5;
      v32[7] = a6;
      v32[8] = a7;
      v32[9] = a8;
      v32[10] = a9;
      v32[11] = a10;
      v32[4] = &v35;
      v32[5] = a4;
      objc_msgSend_getControlPlaneStatusReportClear_replyBlock_(v28, v29, v16, (uint64_t)v32);
    }
    v10 = v36[5] == 0;
LABEL_21:
    _Block_object_dispose(&v35, 8);
  }
  return v10;
}

- (unsigned)getEmergencyLocationSettingsCompatibilityVersion:(int *)a3 andContentVersion:(int *)a4
{
  unsigned __int8 v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = 0;
  if (a3 && a4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18F6DE548;
    v11[3] = &unk_1E2992918;
    v11[5] = a3;
    v11[6] = a4;
    v11[4] = &v12;
    objc_msgSend_getEmergencyLocationSettingsVersion_(v7, v8, (uint64_t)v11, v9);
    v4 = *((_BYTE *)v13 + 24);
    _Block_object_dispose(&v12, 8);
  }
  return v4;
}

- (unsigned)deleteCurrentEmergencyLocationAsset
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unsigned __int8 v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DE610;
  v9[3] = &unk_1E29925C8;
  v9[4] = &v10;
  objc_msgSend_deleteCurrentEmergencyLocationAsset_(v4, v5, (uint64_t)v9, v6);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (__CFDictionary)copyNearbyAssetSettings
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFDictionary *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_18F5CD82C;
  v14 = sub_18F5CD7A4;
  v15 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DE6E0;
  v9[3] = &unk_1E2992940;
  v9[4] = &v10;
  objc_msgSend_copyNearbyAssetSettings_(v4, v5, (uint64_t)v9, v6);
  v7 = (__CFDictionary *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (__CFDictionary)copyNearbyAssetSettingsOfAccessoryFile:(__CFString *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  __CFDictionary *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_18F5CD82C;
  v14 = sub_18F5CD7A4;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DE7D0;
  v9[3] = &unk_1E2992940;
  v9[4] = &v10;
  objc_msgSend_copyNearbyAssetSettingsOfAccessoryFile_withReply_(v5, v6, (uint64_t)a3, (uint64_t)v9);
  v7 = (__CFDictionary *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (__CFDictionary)copyRoutineAssetSettingsWithCompatibilityVersion:(int *)a3 contentVersion:(int *)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  __CFDictionary *v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F5CD82C;
  v16 = sub_18F5CD7A4;
  v17 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DE8CC;
  v11[3] = &unk_1E2992968;
  v11[4] = &v12;
  v11[5] = a3;
  v11[6] = a4;
  objc_msgSend_copyRoutineAssetSettings_(v6, v7, (uint64_t)v11, v8);
  v9 = (__CFDictionary *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unsigned)shouldDisplayEEDUI
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unsigned __int8 v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DE9C8;
  v9[3] = &unk_1E2992990;
  v9[4] = &v10;
  objc_msgSend_shouldDisplayEEDUI_(v4, v5, (uint64_t)v9, v6);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)getEEDCloakingKey:(id *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F5CD82C;
  v16 = sub_18F5CD7A4;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DEAA4;
  v11[3] = &unk_1E29927B8;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend_getEEDCloakingKeyWithReply_(v5, v6, (uint64_t)v11, v7);
  v8 = *a3;
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)getEEDEmergencyContactNames:(id *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F5CD82C;
  v16 = sub_18F5CD7A4;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DEBB0;
  v11[3] = &unk_1E29929B8;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend_getEEDEmergencyContactNamesWithReply_(v5, v6, (uint64_t)v11, v7);
  v8 = *a3;
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)getMotionSensorLogs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = sub_18F5CD82C;
  v17 = sub_18F5CD7A4;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v6 = (void *)v14[5];
    if (v6)
      break;
    v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = sub_18F6DECDC;
    v12[3] = &unk_1E29929E0;
    v12[4] = &v13;
    objc_msgSend_getMotionSensorLogsWithReply_(v7, v8, (uint64_t)v12, v9);
  }
  v10 = v6;
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)getAccessoryMotionSensorLogs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = sub_18F5CD82C;
  v17 = sub_18F5CD7A4;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v6 = (void *)v14[5];
    if (v6)
      break;
    v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = sub_18F6DEDF4;
    v12[3] = &unk_1E29929E0;
    v12[4] = &v13;
    objc_msgSend_getAccessoryMotionSensorLogsWithReply_(v7, v8, (uint64_t)v12, v9);
  }
  v10 = v6;
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (unsigned)setTemporaryAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5 orAuditToken:(id *)a6 byLocationButton:(unsigned __int8)a7 voiceInteractionEnabled:(unsigned __int8)a8
{
  int v8;
  int v9;
  int v13;
  void *v14;
  __int128 v15;
  const char *v16;
  _OWORD v18[2];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a8;
  v9 = a7;
  v13 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, (uint64_t)a4);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18F6DEF24;
  v19[3] = &unk_1E29925C8;
  v19[4] = &v20;
  v15 = *(_OWORD *)&a6->var0[4];
  v18[0] = *(_OWORD *)a6->var0;
  v18[1] = v15;
  objc_msgSend_setTemporaryAuthorizationGranted_forBundleID_orBundlePath_orAuditToken_byLocationButton_voiceInteractionEnabled_replyBlock_(v14, v16, v13 != 0, (uint64_t)a4, a5, v18, v9 != 0, v8 != 0, v19);
  LOBYTE(a5) = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return a5;
}

- (unsigned)setTemporaryPreciseAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  int v7;
  void *v8;
  const char *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v7 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, (uint64_t)a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DF004;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_setTemporaryPreciseAuthorizationGranted_forBundleID_orBundlePath_replyBlock_(v8, v9, v7 != 0, (uint64_t)a4, a5, v11);
  LOBYTE(a5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)tearDownLocationAuthPromptForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  __CFString *v4;
  void *v6;
  const char *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DF0D8;
  v9[3] = &unk_1E29925C8;
  v9[4] = &v10;
  objc_msgSend_tearDownLocationAuthPromptForBundleID_orBundlePath_replyBlock_(v6, v7, (uint64_t)a3, (uint64_t)v4, v9);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (__CFArray)copyActivityAlarms
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFArray *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DF194;
  v9[3] = &unk_1E2992690;
  v9[4] = &v10;
  objc_msgSend_getActivitiesWithReplyBlock_(v4, v5, (uint64_t)v9, v6);
  v7 = (__CFArray *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)setAuthorizationStatusByType:(int)a3 withCorrectiveCompensation:(int)a4 andZoneIdentifier:(__CFString *)a5 andSubIdentityIdentifier:(__CFString *)a6 forBundleID:(__CFString *)a7 orBundlePath:(__CFString *)a8
{
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v12 = *(_QWORD *)&a4;
  v13 = *(_QWORD *)&a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4);
  v17[1] = 3221225472;
  v17[2] = sub_18F6DF2A4;
  v17[3] = &unk_1E29925C8;
  v17[4] = &v18;
  v17[0] = MEMORY[0x1E0C809B0];
  objc_msgSend_setAuthorizationStatusByType_withCorrectiveCompensation_andZoneIdentifier_andSubIdentityIdentifier_forBundleID_orBundlePath_replyBlock_(v14, v15, v13, v12, a5, a6, a7, a8, v17);
  LOBYTE(a8) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return a8;
}

- (unsigned)updatePillButtonChoiceForOutstandingPrompt:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = *(_QWORD *)&a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F6DF368;
  v8[3] = &unk_1E29925C8;
  v8[4] = &v9;
  objc_msgSend_updatePillButtonChoiceForOutstandingPrompt_replyBlock_(v5, v6, v4, (uint64_t)v8);
  LOBYTE(v4) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v4;
}

- (unsigned)updatePromptedLatitude:(double)a3 longitude:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  unsigned __int8 v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v4, v5);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F6DF43C;
  v13[3] = &unk_1E29925C8;
  v13[4] = &v14;
  objc_msgSend_updatePromptedLatitude_longitude_replyBlock_(v8, v9, (uint64_t)v13, v10, a3, a4);
  v11 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (unsigned)setIncidentalUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v7;
  void *v8;
  const char *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v7 = *(_QWORD *)&a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, (uint64_t)a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DF518;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_setIncidentalUseMode_forBundleID_orBundlePath_replyBlock_(v8, v9, v7, (uint64_t)a4, a5, v11);
  LOBYTE(a5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)setLocationButtonUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  uint64_t v7;
  void *v8;
  const char *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v7 = *(_QWORD *)&a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, (uint64_t)a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DF5F4;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_setLocationButtonUseMode_forBundleID_orBundlePath_replyBlock_(v8, v9, v7, (uint64_t)a4, a5, v11);
  LOBYTE(a5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return a5;
}

- (unsigned)setBackgroundIndicatorForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4 enabled:(unsigned __int8)a5
{
  int v5;
  __CFString *v6;
  void *v8;
  const char *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a5;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F6DF6D4;
  v11[3] = &unk_1E29925C8;
  v11[4] = &v12;
  objc_msgSend_setBackgroundIndicatorEnabled_forBundleID_orBundlePath_replyBlock_(v8, v9, v5 != 0, (uint64_t)a3, v6, v11);
  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v6;
}

- (unsigned)gyroCalibrationDatabaseSupportsMiniCalibration:(int *)a3
{
  uint64_t v3;
  int *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F6DF794;
  v9[3] = &unk_1E29925F0;
  v9[4] = &v10;
  v9[5] = v4;
  objc_msgSend_gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock_(v5, v6, (uint64_t)v9, v7);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (unsigned)timeSyncMachTimeStamp:(unint64_t *)a3 oscarTimeStamp:(unint64_t *)a4
{
  unint64_t *v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F6DF870;
  v10[3] = &unk_1E2992A08;
  v10[5] = a3;
  v10[6] = v4;
  v10[4] = &v11;
  objc_msgSend_getOscarTimeSyncWithReplyBlock_(v6, v7, (uint64_t)v10, v8);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
  void *v8;
  const char *v9;

  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_notifyPassKitPayment_transaction_info_(v8, v9, (uint64_t)a3, (uint64_t)a4, a5);
}

- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8
{
  void *v14;
  const char *v15;

  v14 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_notifyWeatherForecast_airQualityConditions_hourlyForecasts_dailyForecasts_latitude_longitude_(v14, v15, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
}

@end
