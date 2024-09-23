@implementation CLLocationPushServiceExtensionRemoteContext

- (CLLocationPushServiceExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  CLLocationPushServiceExtensionRemoteContext *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  objc_super v17;
  int v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CLLocationPushServiceExtensionRemoteContext;
  v5 = -[CLLocationPushServiceExtensionRemoteContext initWithInputItems:listenerEndpoint:contextUUID:](&v17, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  if (v5)
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990970);
    v6 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend__UUID(v5, v7, v8, v9);
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Location Push Service extension context initialized", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E748 != -1)
        dispatch_once(&qword_1ECD8E748, &unk_1E2990970);
      v15 = objc_msgSend__UUID(v5, v12, v13, v14);
      v18 = 138543362;
      v19 = v15;
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationPushServiceExtensionRemoteContext initWithInputItems:listenerEndpoint:contextUUID:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf)
        free(v16);
    }
  }
  return v5;
}

- (void)didReceiveLocationPushPayload:(id)a3 reply:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD block[7];
  int v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend__principalObject(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2990970);
  v8 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = objc_msgSend__UUID(self, v9, v10, v11);
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] didReceiveLocationPushPayload:reply:", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990970);
    v17 = 138543362;
    v18 = objc_msgSend__UUID(self, v12, v13, v14);
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationPushServiceExtensionRemoteContext didReceiveLocationPushPayload:reply:]", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf)
      free(v15);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F6E6B1C;
  block[3] = &unk_1E2991140;
  block[4] = v7;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)serviceExtensionWillTerminate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD block[5];
  int v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend__principalObject(self, a2, v2, v3);
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2990970);
  v6 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = objc_msgSend__UUID(self, v7, v8, v9);
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Location Push Service extension time will expire", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990970);
    v15 = 138543362;
    v16 = objc_msgSend__UUID(self, v10, v11, v12);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationPushServiceExtensionRemoteContext serviceExtensionWillTerminate]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf)
      free(v13);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F6E6D30;
  block[3] = &unk_1E2990DE0;
  block[4] = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)serviceExtensionPerformCleanup
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E748 != -1)
    dispatch_once(&qword_1ECD8E748, &unk_1E2990970);
  v3 = qword_1ECD8E740;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = objc_msgSend__UUID(self, v4, v5, v6);
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleaning up extension", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E2990970);
    objc_msgSend__UUID(self, v8, v9, v10);
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLLocationPushServiceExtensionRemoteContext serviceExtensionPerformCleanup]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  objc_msgSend_completeRequestReturningItems_completionHandler_(self, v7, 0, 0);
}

@end
