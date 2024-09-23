@implementation DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives

- (DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives)init
{
  DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives *v2;
  uint64_t v3;
  DEPClient *DEPClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives;
  v2 = -[DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    DEPClient = v2->_DEPClient;
    v2->_DEPClient = (DEPClient *)v3;

  }
  return v2;
}

- (void)enrollWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives DEPClient](self, "DEPClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __96__DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives_enrollWithNonce_completionBlock___block_invoke;
  v10[3] = &unk_24E5A02F8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "provisionallyEnrollWithNonce:completionBlock:", v7, v10);

}

void __96__DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives_enrollWithNonce_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (_DMTLogGeneral_onceToken_1 != -1)
    dispatch_once(&_DMTLogGeneral_onceToken_1, &__block_literal_global_2);
  v9 = _DMTLogGeneral_logObj_1;
  if (os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_1, OS_LOG_TYPE_DEBUG))
  {
    v10 = CFSTR("NO");
    v11 = 138543874;
    if (a2)
      v10 = CFSTR("YES");
    v12 = v10;
    v13 = 2114;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    _os_log_debug_impl(&dword_21FD69000, v9, OS_LOG_TYPE_DEBUG, "Enrollment complete: %{public}@, response: %{public}@, error:%{public}@", (uint8_t *)&v11, 0x20u);
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (DEPClient)DEPClient
{
  return self->_DEPClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DEPClient, 0);
}

@end
