@implementation CLLocationInternalClient_CoreMotion

- (id)connection
{
  NSXPCConnection *connection;
  id v4;
  const char *v5;
  uint64_t v6;
  NSXPCConnection *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSXPCConnection *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[5];

  objc_sync_enter(self);
  connection = self->_connection;
  if (!connection)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v7 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v4, v5, (uint64_t)CFSTR("com.apple.locationd.synchronous"), 4096, v6);
    self->_connection = v7;
    v11 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v8, (uint64_t)&unk_1EE187658, v9, v10);
    objc_msgSend_setRemoteObjectInterface_(v7, v12, v11, v13, v14);
    objc_msgSend_setInterruptionHandler_(self->_connection, v15, (uint64_t)&unk_1E2958258, v16, v17);
    v18 = self->_connection;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_18F45083C;
    v27[3] = &unk_1E2955938;
    v27[4] = self;
    objc_msgSend_setInvalidationHandler_(v18, v19, (uint64_t)v27, v20, v21);
    objc_msgSend_resume(self->_connection, v22, v23, v24, v25);
    connection = self->_connection;
  }
  objc_sync_exit(self);
  return connection;
}

- (id)synchronousRemoteObject
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  objc_sync_enter(self);
  v7 = (void *)objc_msgSend_sharedInstance(MEMORY[0x1E0D44540], v3, v4, v5, v6);
  objc_msgSend_intendToSyncServiceWithName_(v7, v8, (uint64_t)CFSTR("CLInternalService"), v9, v10);
  v15 = (void *)objc_msgSend_connection(self, v11, v12, v13, v14);
  v19 = (void *)objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v15, v16, (uint64_t)&unk_1E2958298, v17, v18);
  objc_sync_exit(self);
  return v19;
}

+ (id)sharedServiceClient
{
  if (qword_1ECEDFB60 != -1)
    dispatch_once(&qword_1ECEDFB60, &unk_1E2953B68);
  return (id)qword_1ECEDFB68;
}

- (unsigned)timeSyncMachTimeStamp:(unint64_t *)a3 oscarTimeStamp:(unint64_t *)a4
{
  uint64_t v4;
  unint64_t *v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F209164;
  v12[3] = &unk_1E2958700;
  v12[5] = a3;
  v12[6] = v5;
  v12[4] = &v13;
  objc_msgSend_getOscarTimeSyncWithReplyBlock_(v7, v8, (uint64_t)v12, v9, v10);
  LOBYTE(v5) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v5;
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
  v10 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, *(uint64_t *)&a4, (uint64_t)a5);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F450C90;
  v13[3] = &unk_1E29582C0;
  v13[4] = &v14;
  objc_msgSend_setAuthorizationStatus_withCorrectiveCompensation_forBundleID_orBundlePath_replyBlock_(v10, v11, v9 != 0, v8, (uint64_t)a5, a6, v13);
  LOBYTE(a6) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return a6;
}

- (unsigned)getIncidentalUseMode:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  __CFString *v5;
  void *v8;
  const char *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a5;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F450D68;
  v11[3] = &unk_1E29582E8;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend_getIncidentalUseModeForBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, (uint64_t)v5, (uint64_t)v11);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (unsigned)reportLocationUtilityEvent:(int)a3 atDate:(__CFDate *)a4
{
  uint64_t v4;
  __CFDate *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, (uint64_t)a4, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F450E48;
  v10[3] = &unk_1E29582C0;
  v10[4] = &v11;
  objc_msgSend_reportLocationUtilityEvent_atDate_withReplyBlock_(v7, v8, v6, (uint64_t)v5, (uint64_t)v10);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

- (void)clearLocationAuthorizationForBundleId:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  _QWORD v9[5];
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F450F10;
  v9[3] = &unk_1E29582C0;
  v9[4] = v10;
  objc_msgSend_resetClientForBundleId_orBundlePath_withReplyBlock_(v7, v8, (uint64_t)a3, (uint64_t)a4, (uint64_t)v9);
  _Block_object_dispose(v10, 8);
}

- (unsigned)clearLocationAuthorizations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F450FCC;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_resetAllClientsWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)getArchivedAuthorizationDecisionsWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = sub_18F206C64;
  v27 = sub_18F206BB8;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = sub_18F206C64;
  v21 = sub_18F206BB8;
  v22 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18F451138;
  v16[3] = &unk_1E2958310;
  v16[4] = &v17;
  v16[5] = &v23;
  objc_msgSend_getArchivedAuthorizationDecisionsWithReplyBlock_(v6, v7, (uint64_t)v16, v8, v9);
  v10 = (id)v24[5];
  v11 = (id)v18[5];
  if (!v24[5] && !v18[5])
  {
    v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, (uint64_t)CFSTR("com.apple.locationd.internalservice.errorDomain"), 1, 0);
    v18[5] = v13;
  }
  if (a3)
    *a3 = (id)v18[5];
  v14 = (void *)v24[5];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

- (id)applyArchivedAuthorizationDecisions:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  id v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;

  v11 = objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, v3, v4);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = sub_18F206C64;
  v30 = sub_18F206BB8;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v12 = 3;
  v13 = MEMORY[0x1E0C809B0];
  do
  {
    v14 = (void *)objc_msgSend_synchronousRemoteObject(self, v7, v8, v9, v10);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = sub_18F451308;
    v21[3] = &unk_1E2958338;
    v21[4] = &v26;
    v21[5] = &v22;
    objc_msgSend_applyArchivedAuthorizationDecisions_withConfirmationToken_replyBlock_(v14, v15, (uint64_t)a3, v11, (uint64_t)v21);
    if (*((_BYTE *)v23 + 24))
    {
      v16 = (void *)v27[5];
      goto LABEL_7;
    }
    --v12;
  }
  while (v12);
  v16 = (void *)v27[5];
  if (!v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v17, v18, (uint64_t)CFSTR("com.apple.locationd.internalservice.errorDomain"), 1, 0);
    v27[5] = (uint64_t)v16;
  }
LABEL_7:
  v19 = v16;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v19;
}

- (__CFDictionary)copyAppsUsingLocation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F206C64;
  v16 = sub_18F206BB8;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4513FC;
  v11[3] = &unk_1E2958360;
  v11[4] = &v12;
  objc_msgSend_getAppsUsingLocationWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (__CFDictionary *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (__CFDictionary)copyActiveClientsUsingLocation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F206C64;
  v16 = sub_18F206BB8;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4514D8;
  v11[3] = &unk_1E2958360;
  v11[4] = &v12;
  objc_msgSend_getActiveClientsUsingLocationWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (__CFDictionary *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (__CFArray)copyTechnologiesInUse
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFArray *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4515A0;
  v11[3] = &unk_1E2958388;
  v11[4] = &v12;
  objc_msgSend_getTechnologiesInUseWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (__CFArray *)v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (__CFDictionary)copyInternalState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F206C64;
  v16 = sub_18F206BB8;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F451680;
  v11[3] = &unk_1E2958360;
  v11[4] = &v12;
  objc_msgSend_getClientManagerInternalStateWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (__CFDictionary *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (__CFString)copyMicroLocationInternalVersion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F45174C;
  v11[3] = &unk_1E29583B0;
  v11[4] = &v12;
  objc_msgSend_getMicroLocationInternalVersionWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (__CFString *)v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (__CFDictionary)copyZaxisStats
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F451818;
  v11[3] = &unk_1E2958360;
  v11[4] = &v12;
  objc_msgSend_getZaxisStatsWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (__CFDictionary *)v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (__CFArray)copyGnssBandsInUse
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFArray *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4518E4;
  v11[3] = &unk_1E2958388;
  v11[4] = &v12;
  objc_msgSend_getGnssBandsInUseWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (__CFArray *)v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)setLocationDefaultForKey:(__CFString *)a3 value:(void *)a4
{
  uint64_t v4;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint8_t buf[1640];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      v7 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], a2, (uint64_t)a4, 200, 0, 0);
    else
      v7 = 0;
    v9 = objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
    MEMORY[0x1E0DE7D20](v9, sel_setLocationDefaultForKey_andValue_replyBlock_, a3, v7, &unk_1E29583D0);
  }
  else
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v8 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_FAULT, "#Spi, Key is NULL!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion setLocationDefaultForKey:value:]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf)
        free(v10);
    }
  }
}

- (void)getLocationDefaultForKey:(__CFString *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v5 = a3;
  if (a3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3052000000;
    v16 = sub_18F206C64;
    v17 = sub_18F206BB8;
    v18 = 0;
    v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_18F451D90;
    v12[3] = &unk_1E29583F8;
    v12[4] = &v13;
    objc_msgSend_getLocationDefaultForKey_replyBlock_(v6, v7, (uint64_t)v5, (uint64_t)v12, v8);
    v10 = v14[5];
    if (v10)
    {
      v5 = (void *)objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v9, v10, 0, 0, 0);

    }
    else
    {
      v5 = 0;
    }
    _Block_object_dispose(&v13, 8);
  }
  return v5;
}

- (id)timeZoneAtLocation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  _QWORD v20[5];
  _OWORD v21[10];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;

  if (!a3)
  {
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    v18 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v15, (uint64_t)"-[CLLocationInternalClient_CoreMotion timeZoneAtLocation:]", v16, v17);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v14, v19, v18, (uint64_t)CFSTR("LocationInternal.m"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != location"));
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = sub_18F206C64;
  v26 = sub_18F206BB8;
  v27 = 0;
  v11 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
  if (a3)
    objc_msgSend_clientLocation(a3, v7, v8, v9, v10);
  else
    memset(v21, 0, 156);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18F452004;
  v20[3] = &unk_1E29583B0;
  v20[4] = &v22;
  objc_msgSend_timeZoneForLocation_replyBlock_(v11, v7, (uint64_t)v21, (uint64_t)v20, v10);
  v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);
  return v12;
}

- (void)setPrivateMode:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a3;
  v6 = objc_msgSend_synchronousRemoteObject(self, a2, a3, v3, v4);
  MEMORY[0x1E0DE7D20](v6, sel_setPrivateMode_replyBlock_, v5 != 0, &unk_1E2958418, v7);
}

- (unsigned)getPrivateMode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4522A8;
  v11[3] = &unk_1E2958440;
  v11[4] = &v12;
  objc_msgSend_getPrivateMode_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unsigned)pingDaemon
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F452364;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_pingDaemonWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)setLocationServicesEnabled:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v5 = a3;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, v3, v4);
  objc_msgSend_setLocationServicesEnabled_replyBlock_(v6, v7, v5 != 0, (uint64_t)&unk_1E2958460, v8);
  CFPreferencesSynchronize(CFSTR("com.apple.locationd"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (unsigned)getLocationServicesEnabled:(char *)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  if (a3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18F452604;
    v11[3] = &unk_1E29582E8;
    v11[4] = &v12;
    v11[5] = v5;
    objc_msgSend_getLocationServicesEnabledWithReplyBlock_(v6, v7, (uint64_t)v11, v8, v9);
    LOBYTE(v5) = *((_BYTE *)v13 + 24);
    _Block_object_dispose(&v12, 8);
  }
  return v5;
}

- (id)setAuthorizationPromptMapDisplayEnabled:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F206C64;
  v16 = sub_18F206BB8;
  v17 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4526FC;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_setAuthorizationPromptMapDisplayEnabled_replyBlock_(v6, v7, v5 != 0, (uint64_t)v11, v8);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unsigned)getAuthorizationPromptMapDisplayEnabled:(char *)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  if (a3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18F452950;
    v11[3] = &unk_1E2958488;
    v11[4] = &v12;
    v11[5] = v5;
    objc_msgSend_getAuthorizationPromptMapDisplayEnabledWithReplyBlock_(v6, v7, (uint64_t)v11, v8, v9);
    LOBYTE(v5) = *((_BYTE *)v13 + 24);
    _Block_object_dispose(&v12, 8);
  }
  return v5;
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
  uint64_t v17;
  const char *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = sub_18F206C64;
  v24 = sub_18F206BB8;
  v25 = 0;
  if (!a5)
  {
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, 0);
    v17 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v14, (uint64_t)"-[CLLocationInternalClient_CoreMotion setTemporaryAuthorizationStatusForBundleId:orBundlePath:statusData:]", v15, v16);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v13, v18, v17, (uint64_t)CFSTR("LocationInternal.m"), 765, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));
  }
  v9 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18F452AC0;
  v19[3] = &unk_1E29582C0;
  v19[4] = &v20;
  objc_msgSend_setTemporaryAuthorizationStatusForBundleId_orBundlePath_statusData_replyBlock_(v9, v10, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v19);
  v11 = (id)v21[5];
  _Block_object_dispose(&v20, 8);
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
  v16 = sub_18F206C64;
  v17 = sub_18F206BB8;
  v18 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F452D44;
  v12[3] = &unk_1E29584B0;
  v12[4] = &v13;
  v12[5] = a5;
  objc_msgSend_getTemporaryAuthorizationStatusForBundleId_orBundlePath_replyBlock_(v8, v9, (uint64_t)a3, (uint64_t)a4, (uint64_t)v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (double)modifyOrSetAuthorizationTime:(double)a3 forBundleID:(id)a4 orBundlePath:(id)a5
{
  uint64_t v5;
  void *v9;
  const char *v10;
  double v11;
  _QWORD v13[5];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  unint64_t v17;

  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0xBFF0000000000000;
  v9 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a4, (uint64_t)a5, v5);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F452FD8;
  v13[3] = &unk_1E29584D8;
  v13[4] = &v14;
  objc_msgSend_modifyOrSetAuthorizationTime_forBundleID_orBundlePath_replyBlock_(v9, v10, (uint64_t)a4, (uint64_t)a5, (uint64_t)v13, a3);
  v11 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (id)triggerExpiredAuthorizationPurgeOnClientManager
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F206C64;
  v16 = sub_18F206BB8;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F45323C;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_triggerExpiredAuthorizationPurgeWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)setGestureServiceEnabled:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a3;
  v6 = objc_msgSend_synchronousRemoteObject(self, a2, a3, v3, v4);
  MEMORY[0x1E0DE7D20](v6, sel_setGestureServiceEnabled_replyBlock_, v5 != 0, &unk_1E29584F8, v7);
}

- (unsigned)getGestureServiceEnabled:(char *)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  if (a3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18F453644;
    v11[3] = &unk_1E2958488;
    v11[4] = &v12;
    v11[5] = v5;
    objc_msgSend_getGestureServiceEnabledWithReplyBlock_(v6, v7, (uint64_t)v11, v8, v9);
    LOBYTE(v5) = *((_BYTE *)v13 + 24);
    _Block_object_dispose(&v12, 8);
  }
  return v5;
}

- (unsigned)getAuthorizationStatusForApp:(int *)a3 withAuditToken:(id *)a4
{
  uint64_t v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *v5;
  void *v7;
  __int128 v8;
  const char *v9;
  uint64_t v10;
  _OWORD v12[2];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F453728;
  v13[3] = &unk_1E29582E8;
  v13[4] = &v14;
  v13[5] = a3;
  v8 = *(_OWORD *)&v5->var0[4];
  v12[0] = *(_OWORD *)v5->var0;
  v12[1] = v8;
  objc_msgSend_getAuthorizationStatusForAppWithAuditToken_replyBlock_(v7, v9, (uint64_t)v12, (uint64_t)v13, v10);
  LOBYTE(v5) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v5;
}

- (unsigned)getAuthorizationStatus:(int *)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  __CFString *v5;
  void *v8;
  const char *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a5;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F45380C;
  v11[3] = &unk_1E29582E8;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend_getAuthorizationStatusForBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, (uint64_t)v5, (uint64_t)v11);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v5;
}

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
  v22 = sub_18F206C64;
  v23 = sub_18F206BB8;
  v24 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18F453AC8;
  v18[3] = &unk_1E2958520;
  v18[5] = &v19;
  v18[6] = a3;
  v18[4] = &v25;
  objc_msgSend_getPrecisionPermissionForBundleID_orBundlePath_replyBlock_(v8, v9, (uint64_t)a4, (uint64_t)a5, (uint64_t)v18);
  v10 = v20;
  if (v20[5])
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v11 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_FAULT))
    {
      v12 = v20[5];
      buf = 68289282;
      v30 = 2082;
      v31 = "";
      v32 = 2114;
      v33 = v12;
      _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, CLInternalGetPrecisionPermission failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    }
    v13 = qword_1ECEDEE50;
    v14 = os_signpost_enabled((os_log_t)qword_1ECEDEE50);
    v10 = v20;
    if (v14)
    {
      v15 = v20[5];
      buf = 68289282;
      v30 = 2082;
      v31 = "";
      v32 = 2114;
      v33 = v15;
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, CLInternalGetPrecisionPermission failed", "{\"msg%{public}.0s\":\"#Spi, CLInternalGetPrecisionPermission failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      v10 = v20;
    }
  }

  v16 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

- (unsigned)performMigration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned __int8 v10;
  char *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[1640];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F453D2C;
  v13[3] = &unk_1E29582C0;
  v13[4] = &v14;
  objc_msgSend_performMigrationWithReplyBlock_(v5, v6, (uint64_t)v13, v7, v8);
  if (!*((_BYTE *)v15 + 24))
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v9 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "#Spi, _CLInternalPerformMigration failed", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion performMigration]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
  }
  v10 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v10;
}

- (unsigned)shutdownDaemon
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned __int8 v10;
  char *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[1640];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F453F5C;
  v13[3] = &unk_1E29582C0;
  v13[4] = &v14;
  objc_msgSend_shutdownDaemonWithReplyBlock_(v5, v6, (uint64_t)v13, v7, v8);
  if (!*((_BYTE *)v15 + 24))
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v9 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "#Spi, _CLShutdownDaemon failed", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion shutdownDaemon]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
  }
  v10 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v10;
}

- (unsigned)displayStatistics
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned __int8 v10;
  char *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[1640];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F454188;
  v13[3] = &unk_1E29582C0;
  v13[4] = &v14;
  objc_msgSend_displayStatisticsWithReplyBlock_(v5, v6, (uint64_t)v13, v7, v8);
  if (!*((_BYTE *)v15 + 24))
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v9 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "#Spi, _CLDisplayStatistics failed", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion displayStatistics]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
  }
  v10 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v10;
}

- (unsigned)dumpLogs:(__CFString *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  unsigned __int8 v10;
  char *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[1640];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F4543C0;
  v13[3] = &unk_1E29582C0;
  v13[4] = &v14;
  objc_msgSend_dumpLogsWithDescription_replyBlock_(v6, v7, (uint64_t)a3, (uint64_t)v13, v8);
  if (!*((_BYTE *)v15 + 24))
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v9 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "#Spi, _CLDumpLogs failed", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion dumpLogs:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
  }
  v10 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v10;
}

- (__CFDictionary)copyMonitoredRegionsForBundleIdentifier:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  __CFDictionary *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F454494;
  v11[3] = &unk_1E2958360;
  v11[4] = &v12;
  objc_msgSend_getMonitoredRegionsForBundleID_orBundlePath_replyBlock_(v7, v8, (uint64_t)a3, (uint64_t)a4, (uint64_t)v11);
  v9 = (__CFDictionary *)v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
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
  v25 = sub_18F206C64;
  v26 = sub_18F206BB8;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v10 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, a5);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18F454654;
  v17[3] = &unk_1E2958548;
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
  v29 = sub_18F206C64;
  v30 = sub_18F206BB8;
  v31 = 0;
  v20 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, *(uint64_t *)&a7, *(uint64_t *)&a8);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_18F454818;
  v25[3] = &unk_1E2958338;
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
  v24 = sub_18F206C64;
  v25 = sub_18F206BB8;
  v26 = 0;
  v15 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18F4549B8;
  v20[3] = &unk_1E2958338;
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
  v21 = sub_18F206C64;
  v22 = sub_18F206BB8;
  v23 = 0;
  v12 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, (uint64_t)a4, (uint64_t)a5);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18F454B44;
  v17[3] = &unk_1E2958338;
  v17[4] = &v18;
  v17[5] = &v24;
  objc_msgSend_setRelevance_forInterestZoneWithId_registeredForBundleId_orBundlePath_replyBlock_(v12, v13, v11, (uint64_t)a4, (uint64_t)a5, a6, v17);
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
  v19 = sub_18F206C64;
  v20 = sub_18F206BB8;
  v21 = 0;
  v10 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18F454CC0;
  v15[3] = &unk_1E2958338;
  v15[4] = &v16;
  v15[5] = &v22;
  objc_msgSend_deleteInterestZoneWithId_registeredForBundleId_orBundlePath_replyBlock_(v10, v11, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v15);
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
  v12 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, a5);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18F454DF0;
  v16[3] = &unk_1E29584B0;
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
    v11 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_18F454F14;
    v14[3] = &unk_1E2958570;
    v14[4] = &v15;
    v14[5] = a6;
    objc_msgSend_getGroundAltitudeForBundleID_orBundlePath_location_replyBlock_(v11, v12, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v14);
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
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  char *v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a4 < 501)
  {
    v9 = *(_QWORD *)&a6;
    v10 = *(_QWORD *)&a5;
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v13 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240704;
      v25 = a4;
      v26 = 1026;
      v27 = v10;
      v28 = 1026;
      v29 = v9;
      _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_DEBUG, "#Spi,RouteHint,LocationInternal,Received route hint road segments,%{public}d,routeType,%{public}d,stepType,%{public}d", buf, 0x14u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion setMapMatchingRouteHint:count:routingType:stepType:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf)
        free(v23);
    }
    v16 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v14, (uint64_t)a3, 40 * a4, v15);
    v21 = (void *)objc_msgSend_synchronousRemoteObject(self, v17, v18, v19, v20);
    objc_msgSend_setMapMatchingRouteHint_routingType_stepType_replyBlock_(v21, v22, v16, v10, v9, &unk_1E2943B50);
  }
  else
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v7 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240448;
      v25 = a4;
      v26 = 1026;
      v27 = 500;
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_ERROR, "#Spi,RouteHintError, Exceeded max number of route hint road segments (%{public}d > %{public}d)", buf, 0xEu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion setMapMatchingRouteHint:count:routingType:stepType:]", "CoreLocation: %s\n", v8);
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
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  char *v16;
  uint8_t buf[1640];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDEE58 != -1)
    dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
  v5 = qword_1ECEDEE50;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_INFO, "#Spi,CLTR,CLTrackRunHint received,framework side", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v16 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion setTrackRunHint:]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf)
      free(v16);
  }
  v8 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)a3, 16, v7);
  v13 = (void *)objc_msgSend_synchronousRemoteObject(self, v9, v10, v11, v12);
  objc_msgSend_setTrackRunHint_replyBlock_(v13, v14, v8, (uint64_t)&unk_1E2945188, v15);
}

- (int)getAccessoryTypeBitSet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  int v13;
  char *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18F4559D8;
  v15[3] = &unk_1E2958598;
  v15[4] = &v16;
  objc_msgSend_getAccessoryTypeBitSetWithReplyBlock_(v5, v6, (uint64_t)v15, v7, v8);
  if (qword_1ECEDEE58 != -1)
    dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
  v9 = qword_1ECEDEE50;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_DEBUG))
  {
    v10 = *((_DWORD *)v17 + 6);
    *(_DWORD *)buf = 67109120;
    v23 = v10;
    _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEBUG, "#Spi,getAccessoryTypeBitSet,%d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v13 = *((_DWORD *)v17 + 6);
    v20 = 67109120;
    v21 = v13;
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion getAccessoryTypeBitSet]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
  v11 = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);
  return v11;
}

- (int)getAccessoryPASCDTransmissionState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  int v13;
  char *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 4;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18F455DB4;
  v15[3] = &unk_1E2958598;
  v15[4] = &v16;
  objc_msgSend_getAccessoryPASCDTransmissionStateWithReplyBlock_(v5, v6, (uint64_t)v15, v7, v8);
  if (qword_1ECEDEE58 != -1)
    dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
  v9 = qword_1ECEDEE50;
  if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_DEBUG))
  {
    v10 = *((_DWORD *)v17 + 6);
    *(_DWORD *)buf = 67109120;
    v23 = v10;
    _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEBUG, "#Spi,getAccessoryPASCDTransmissionState,%d", buf, 8u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v13 = *((_DWORD *)v17 + 6);
    v20 = 67109120;
    v21 = v13;
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion getAccessoryPASCDTransmissionState]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
  v11 = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);
  return v11;
}

- (id)getOdometryBatchedLocations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = sub_18F206C64;
  v28 = sub_18F206BB8;
  v29 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_18F4561C0;
  v23[3] = &unk_1E2958360;
  v23[4] = &v24;
  objc_msgSend_getOdometryBatchedLocationsWithReplyBlock_(v5, v6, (uint64_t)v23, v7, v8);
  if (v25[5])
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v9 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_msgSend_count((void *)v25[5], v10, v11, v12, v13);
      *(_DWORD *)buf = 134349056;
      v33 = v14;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_DEBUG, "#Spi,getOdometryBatchedLocations,returned with count,%{public}lu", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v21 = objc_msgSend_count((void *)v25[5], v17, v18, v19, v20);
      v30 = 134349056;
      v31 = v21;
      v22 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion getOdometryBatchedLocations]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf)
        free(v22);
    }
  }
  v15 = (void *)v25[5];
  _Block_object_dispose(&v24, 8);
  return v15;
}

- (unsigned)copyLastLog
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unsigned __int8 v10;
  char *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[1640];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F4566D4;
  v13[3] = &unk_1E29582C0;
  v13[4] = &v14;
  objc_msgSend_copyLastLogWithReplyBlock_(v5, v6, (uint64_t)v13, v7, v8);
  if (!*((_BYTE *)v15 + 24))
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v9 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "#Spi, _CLCopyLastLog failed", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CLLocationInternalClient_CoreMotion copyLastLog]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
  }
  v10 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v10;
}

- (unsigned)setStatusBarIconEnabled:(BOOL)a3 forEntityClass:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  unsigned __int8 v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, *(uint64_t *)&a4, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F456918;
  v13[3] = &unk_1E29582C0;
  v13[4] = &v14;
  objc_msgSend_setStatusBarIconEnabledForEntityClass_enabled_replyBlock_(v7, v8, v5, v6, (uint64_t)v13);
  if (!*((_BYTE *)v15 + 24))
  {
    if (qword_1ECEDEE58 != -1)
      dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    v9 = qword_1ECEDEE50;
    if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2050;
      v23 = (int)v5;
      _os_log_impl(&dword_18F1DC000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Spi, Setting status bar enabled for entity class failed\", \"entityClass\":%{public, location:CLLocationDictionaryUtilitiesEntityClass}lld}", buf, 0x1Cu);
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
    }
    v10 = qword_1ECEDEE50;
    if (os_signpost_enabled((os_log_t)qword_1ECEDEE50))
    {
      *(_DWORD *)buf = 68289282;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2050;
      v23 = (int)v5;
      _os_signpost_emit_with_name_impl(&dword_18F1DC000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Spi, Setting status bar enabled for entity class failed", "{\"msg%{public}.0s\":\"#Spi, Setting status bar enabled for entity class failed\", \"entityClass\":%{public, location:CLLocationDictionaryUtilitiesEntityClass}lld}", buf, 0x1Cu);
    }
  }
  v11 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (unsigned)getStatusBarIconEnabled:(BOOL *)a3 forEntityClass:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v11[6];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = *(_QWORD *)&a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, *(uint64_t *)&a4, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4569EC;
  v11[3] = &unk_1E29585C0;
  v11[4] = &v13;
  v11[5] = a3;
  v12 = v5;
  objc_msgSend_getStatusBarIconEnabledForEntityClass_replyBlock_(v7, v8, v5, (uint64_t)v11, v9);
  LOBYTE(v5) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v5;
}

- (int)getStatusBarIconState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F456C3C;
  v11[3] = &unk_1E2958598;
  v11[4] = &v12;
  objc_msgSend_getStatusBarIconState_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)getPipelinedCache
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v6 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = sub_18F206C64;
  v21 = sub_18F206BB8;
  v22 = 0;
  v7 = MEMORY[0x1E0C809B0];
  do
  {
    v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = sub_18F456D4C;
    v16[3] = &unk_1E2958388;
    v16[4] = &v17;
    objc_msgSend_getPipelinedCacheWithReply_(v8, v9, (uint64_t)v16, v10, v11);
    v12 = (void *)v18[5];
    if (v12)
      v13 = 1;
    else
      v13 = v6 >= 9;
    ++v6;
  }
  while (!v13);
  v14 = v12;
  _Block_object_dispose(&v17, 8);
  return v14;
}

- (unsigned)getGyroCalibrationDatabaseBiasFit:(id *)a3 atTemperature:(float)a4
{
  uint64_t v4;
  uint64_t v5;
  $27EAB7405FCF4138B96BF1D57C6DB1C9 *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v7 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v4, v5);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F456E44;
  v13[3] = &unk_1E29584B0;
  v13[4] = &v14;
  v13[5] = v7;
  objc_msgSend_getGyroCalibrationDatabaseBiasFitAtTemperature_withReply_(v8, v9, (uint64_t)v13, v10, v11, COERCE_DOUBLE((unint64_t)LODWORD(a4)));
  LOBYTE(v7) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (BOOL)startStopAdvertisingBeacon:(id)a3 power:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  void *v8;
  const char *v9;
  BOOL v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if (a4)
    v7 = objc_msgSend_intValue(a4, a2, (uint64_t)a3, (uint64_t)a4, v4);
  else
    v7 = 0xFFFFFFFFLL;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18F456F6C;
  v12[3] = &unk_1E29582C0;
  v12[4] = &v13;
  objc_msgSend_startStopAdvertisingBeacon_atPower_replyBlock_(v8, v9, (uint64_t)a3, v7, (uint64_t)v12);
  v10 = *((_BYTE *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (unsigned)insertGyroCalibrationDatabaseBiasEstimateIfValid:(id)a3 temperature:(float)a4 variance:(id)a5 timestamp:(double)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float var2;
  float var1;
  float var0;
  float v14;
  float v15;
  float v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  var2 = a5.var2;
  var1 = a5.var1;
  var0 = a5.var0;
  v14 = a3.var2;
  v15 = a3.var1;
  v16 = a3.var0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v17 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v6, v7, v8);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_18F457088;
  v29[3] = &unk_1E29582C0;
  v29[4] = &v30;
  *(float *)&v18 = v15;
  *(float *)&v19 = v14;
  *(float *)&v20 = a4;
  *(float *)&v21 = var0;
  *(float *)&v22 = var1;
  *(float *)&v23 = var2;
  objc_msgSend_insertGyroCalibrationDatabaseBiasEstimateIfValid_temperature_variance_timestamp_replyBlock_(v17, v24, (uint64_t)v29, v25, v26, COERCE_DOUBLE((unint64_t)LODWORD(v16)), v18, v19, v20, v21, v22, v23, a6);
  v27 = *((_BYTE *)v31 + 24);
  _Block_object_dispose(&v30, 8);
  return v27;
}

- (unsigned)gyroCalibrationDatabaseWipe
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F457144;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_gyroCalibrationDatabaseWipeWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (unsigned)getGyroCalibrationDatabaseNumTemperatures:(int *)a3
{
  uint64_t v3;
  uint64_t v4;
  int *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F457204;
  v11[3] = &unk_1E29582E8;
  v11[4] = &v12;
  v11[5] = v5;
  objc_msgSend_gyroCalibrationDatabaseGetNumTemperaturesWithReplyBlock_(v6, v7, (uint64_t)v11, v8, v9);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (unsigned)configure:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = *(_QWORD *)&a3.var7;
  v5 = *(_QWORD *)&a3.var0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3.var0, *(uint64_t *)&a3.var7, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F4572E4;
  v9[3] = &unk_1E29582C0;
  v9[4] = &v10;
  objc_msgSend_configure_replyBlock_(v6, v7, v5, v4, (uint64_t)v9);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (unsigned)getControlPlaneStatusReportClear:(int)a3 startTime:(double *)a4 endTime:(double *)a5 latitude:(double *)a6 longitude:(double *)a7 altitude:(double *)a8 accuracy:(double *)a9 status:(unsigned int *)a10
{
  unsigned __int8 v10;
  uint64_t v16;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  char *v34;
  _QWORD v36[12];
  __int16 v37;
  _QWORD v38[12];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  uint64_t v44;
  uint8_t buf[1632];
  uint64_t v46;

  v10 = 0;
  v46 = *MEMORY[0x1E0C80C00];
  if (a7 && a6 && a4 && a5 && a10)
  {
    v16 = *(_QWORD *)&a3;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3052000000;
    v42 = sub_18F206C64;
    v43 = sub_18F206BB8;
    v44 = 0;
    v18 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = sub_18F457614;
    v38[3] = &unk_1E29585E8;
    v38[6] = a5;
    v38[7] = a6;
    v38[8] = a7;
    v38[9] = a8;
    v38[10] = a9;
    v38[11] = a10;
    v38[4] = &v39;
    v38[5] = a4;
    objc_msgSend_getControlPlaneStatusReportClear_replyBlock_(v18, v19, v16, (uint64_t)v38, v20);
    while (1)
    {
      v25 = (void *)v40[5];
      if (!v25)
      {
        v10 = 1;
        goto LABEL_21;
      }
      if (objc_msgSend_code(v25, v21, v22, v23, v24) != 1)
        break;
      if (qword_1ECEDEE58 != -1)
        dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
      v26 = qword_1ECEDEE50;
      if (os_log_type_enabled((os_log_t)qword_1ECEDEE50, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v26, OS_LOG_TYPE_DEBUG, "#Spi, Blocking Mig routine deferred on Daemon side... waiting and retrying", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1ECEDEE58 != -1)
          dispatch_once(&qword_1ECEDEE58, &unk_1E2958720);
        v37 = 0;
        v34 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CLLocationInternalClient_CoreMotion getControlPlaneStatusReportClear:startTime:endTime:latitude:longitude:altitude:accuracy:status:]", "CoreLocation: %s\n", v34);
        if (v34 != (char *)buf)
          free(v34);
      }
      sleep(1u);
      v31 = (void *)objc_msgSend_synchronousRemoteObject(self, v27, v28, v29, v30);
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = sub_18F457650;
      v36[3] = &unk_1E29585E8;
      v36[6] = a5;
      v36[7] = a6;
      v36[8] = a7;
      v36[9] = a8;
      v36[10] = a9;
      v36[11] = a10;
      v36[4] = &v39;
      v36[5] = a4;
      objc_msgSend_getControlPlaneStatusReportClear_replyBlock_(v31, v32, v16, (uint64_t)v36, v33);
    }
    v10 = v40[5] == 0;
LABEL_21:
    _Block_object_dispose(&v39, 8);
  }
  return v10;
}

- (unsigned)getEmergencyLocationSettingsCompatibilityVersion:(int *)a3 andContentVersion:(int *)a4
{
  uint64_t v4;
  unsigned __int8 v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = 0;
  if (a3 && a4)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_18F457750;
    v13[3] = &unk_1E2958610;
    v13[5] = a3;
    v13[6] = a4;
    v13[4] = &v14;
    objc_msgSend_getEmergencyLocationSettingsVersion_(v8, v9, (uint64_t)v13, v10, v11);
    v5 = *((_BYTE *)v15 + 24);
    _Block_object_dispose(&v14, 8);
  }
  return v5;
}

- (unsigned)deleteCurrentEmergencyLocationAsset
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F457818;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_deleteCurrentEmergencyLocationAsset_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (__CFDictionary)copyNearbyAssetSettings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F206C64;
  v16 = sub_18F206BB8;
  v17 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4578E8;
  v11[3] = &unk_1E2958638;
  v11[4] = &v12;
  objc_msgSend_copyNearbyAssetSettings_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (__CFDictionary *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (__CFDictionary)copyNearbyAssetSettingsOfAccessoryFile:(__CFString *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  __CFDictionary *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_18F206C64;
  v16 = sub_18F206BB8;
  v17 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4579D8;
  v11[3] = &unk_1E2958638;
  v11[4] = &v12;
  objc_msgSend_copyNearbyAssetSettingsOfAccessoryFile_withReply_(v6, v7, (uint64_t)a3, (uint64_t)v11, v8);
  v9 = (__CFDictionary *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (__CFDictionary)copyRoutineAssetSettingsWithCompatibilityVersion:(int *)a3 contentVersion:(int *)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  __CFDictionary *v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_18F206C64;
  v18 = sub_18F206BB8;
  v19 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F457AD4;
  v13[3] = &unk_1E2958660;
  v13[4] = &v14;
  v13[5] = a3;
  v13[6] = a4;
  objc_msgSend_copyRoutineAssetSettings_(v7, v8, (uint64_t)v13, v9, v10);
  v11 = (__CFDictionary *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (unsigned)shouldDisplayEEDUI
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F457BD0;
  v11[3] = &unk_1E2958688;
  v11[4] = &v12;
  objc_msgSend_shouldDisplayEEDUI_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)getEEDCloakingKey:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_18F206C64;
  v18 = sub_18F206BB8;
  v19 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F457CAC;
  v13[3] = &unk_1E29584B0;
  v13[4] = &v14;
  v13[5] = a3;
  objc_msgSend_getEEDCloakingKeyWithReply_(v6, v7, (uint64_t)v13, v8, v9);
  v10 = *a3;
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (id)getEEDEmergencyContactNames:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_18F206C64;
  v18 = sub_18F206BB8;
  v19 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18F457DB8;
  v13[3] = &unk_1E29586B0;
  v13[4] = &v14;
  v13[5] = a3;
  objc_msgSend_getEEDEmergencyContactNamesWithReply_(v6, v7, (uint64_t)v13, v8, v9);
  v10 = *a3;
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (id)getMotionSensorLogs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = sub_18F206C64;
  v19 = sub_18F206BB8;
  v20 = 0;
  v6 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v7 = (void *)v16[5];
    if (v7)
      break;
    v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = sub_18F457EE4;
    v14[3] = &unk_1E29586D8;
    v14[4] = &v15;
    objc_msgSend_getMotionSensorLogsWithReply_(v8, v9, (uint64_t)v14, v10, v11);
  }
  v12 = v7;
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (id)getAccessoryMotionSensorLogs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = sub_18F206C64;
  v19 = sub_18F206BB8;
  v20 = 0;
  v6 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v7 = (void *)v16[5];
    if (v7)
      break;
    v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = sub_18F457FFC;
    v14[3] = &unk_1E29586D8;
    v14[4] = &v15;
    objc_msgSend_getAccessoryMotionSensorLogsWithReply_(v8, v9, (uint64_t)v14, v10, v11);
  }
  v12 = v7;
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (unsigned)setTemporaryAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5 orAuditToken:(id *)a6 byLocationButton:(unsigned __int8)a7 voiceInteractionEnabled:(unsigned __int8)a8
{
  int v8;
  int v9;
  __CFString *v11;
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
  v11 = a5;
  v13 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, (uint64_t)a4, (uint64_t)a5);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18F45812C;
  v19[3] = &unk_1E29582C0;
  v19[4] = &v20;
  v15 = *(_OWORD *)&a6->var0[4];
  v18[0] = *(_OWORD *)a6->var0;
  v18[1] = v15;
  objc_msgSend_setTemporaryAuthorizationGranted_forBundleID_orBundlePath_orAuditToken_byLocationButton_voiceInteractionEnabled_replyBlock_(v14, v16, v13 != 0, (uint64_t)a4, (uint64_t)v11, v18, v9 != 0, v8 != 0, v19);
  LOBYTE(v11) = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v11;
}

- (unsigned)setTemporaryPreciseAuthorizationGranted:(unsigned __int8)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  __CFString *v5;
  int v7;
  void *v8;
  const char *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a5;
  v7 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, a3, (uint64_t)a4, (uint64_t)a5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F45820C;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_setTemporaryPreciseAuthorizationGranted_forBundleID_orBundlePath_replyBlock_(v8, v9, v7 != 0, (uint64_t)a4, (uint64_t)v5, v11);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (unsigned)tearDownLocationAuthPromptForBundleID:(__CFString *)a3 orBundlePath:(__CFString *)a4
{
  uint64_t v4;
  __CFString *v5;
  void *v7;
  const char *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v5 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F4582E0;
  v10[3] = &unk_1E29582C0;
  v10[4] = &v11;
  objc_msgSend_tearDownLocationAuthPromptForBundleID_orBundlePath_replyBlock_(v7, v8, (uint64_t)a3, (uint64_t)v5, (uint64_t)v10);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

- (__CFArray)copyActivityAlarms
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFArray *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v2, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F45839C;
  v11[3] = &unk_1E2958388;
  v11[4] = &v12;
  objc_msgSend_getActivitiesWithReplyBlock_(v5, v6, (uint64_t)v11, v7, v8);
  v9 = (__CFArray *)v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
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
  v14 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, (uint64_t)a5);
  v17[1] = 3221225472;
  v17[2] = sub_18F4584AC;
  v17[3] = &unk_1E29582C0;
  v17[4] = &v18;
  v17[0] = MEMORY[0x1E0C809B0];
  objc_msgSend_setAuthorizationStatusByType_withCorrectiveCompensation_andZoneIdentifier_andSubIdentityIdentifier_forBundleID_orBundlePath_replyBlock_(v14, v15, v13, v12, (uint64_t)a5, a6, a7, a8, v17);
  LOBYTE(a8) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return a8;
}

- (unsigned)updatePillButtonChoiceForOutstandingPrompt:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v5 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F458570;
  v10[3] = &unk_1E29582C0;
  v10[4] = &v11;
  objc_msgSend_updatePillButtonChoiceForOutstandingPrompt_replyBlock_(v6, v7, v5, (uint64_t)v10, v8);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

- (unsigned)updatePromptedLatitude:(double)a3 longitude:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v9 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, v4, v5, v6);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18F458644;
  v15[3] = &unk_1E29582C0;
  v15[4] = &v16;
  objc_msgSend_updatePromptedLatitude_longitude_replyBlock_(v9, v10, (uint64_t)v15, v11, v12, a3, a4);
  v13 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v13;
}

- (unsigned)setIncidentalUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  __CFString *v5;
  uint64_t v7;
  void *v8;
  const char *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F458720;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_setIncidentalUseMode_forBundleID_orBundlePath_replyBlock_(v8, v9, v7, (uint64_t)a4, (uint64_t)v5, v11);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (unsigned)setLocationButtonUseMode:(int)a3 forBundleID:(__CFString *)a4 orBundlePath:(__CFString *)a5
{
  __CFString *v5;
  uint64_t v7;
  void *v8;
  const char *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4587FC;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_setLocationButtonUseMode_forBundleID_orBundlePath_replyBlock_(v8, v9, v7, (uint64_t)a4, (uint64_t)v5, v11);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v5;
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
  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, a5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F4588DC;
  v11[3] = &unk_1E29582C0;
  v11[4] = &v12;
  objc_msgSend_setBackgroundIndicatorEnabled_forBundleID_orBundlePath_replyBlock_(v8, v9, v5 != 0, (uint64_t)a3, (uint64_t)v6, v11);
  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v6;
}

- (unsigned)gyroCalibrationDatabaseSupportsMiniCalibration:(int *)a3
{
  uint64_t v3;
  uint64_t v4;
  int *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, v3, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18F45899C;
  v11[3] = &unk_1E29582E8;
  v11[4] = &v12;
  v11[5] = v5;
  objc_msgSend_gyroCalibrationDatabaseSupportsMiniCalibrationWithReplyBlock_(v6, v7, (uint64_t)v11, v8, v9);
  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
  void *v8;
  const char *v9;

  v8 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  objc_msgSend_notifyPassKitPayment_transaction_info_(v8, v9, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)notifyWeatherForecast:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 latitude:(double)a7 longitude:(double)a8
{
  void *v14;
  const char *v15;

  v14 = (void *)objc_msgSend_synchronousRemoteObject(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  objc_msgSend_notifyWeatherForecast_airQualityConditions_hourlyForecasts_dailyForecasts_latitude_longitude_(v14, v15, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
}

@end
