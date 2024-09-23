id CarGeneralLogging()
{
  if (CarGeneralLogging_onceToken != -1)
    dispatch_once(&CarGeneralLogging_onceToken, &__block_literal_global_5);
  return (id)CarGeneralLogging_facility;
}

void sub_1A83A4A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A83A52A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1A83A53A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A83A6300(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A83A64EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CRServiceCreateConnection()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC258);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_fetchInstrumentClusterURLsWithReply_, 0, 1);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.service"), 4096);
  objc_msgSend(v4, "setRemoteObjectInterface:", v0);
  objc_msgSend(v4, "resume");

  return v4;
}

void CRServiceConnectionPerform(void *a1, void *a2)
{
  void (**v3)(id, void *, _QWORD *);
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v3 = a1;
  v4 = a2;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit service.", buf, 2u);
  }

  CRServiceCreateConnection();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __CRServiceConnectionPerform_block_invoke;
  v12[3] = &unk_1E5427E30;
  v8 = v4;
  v13 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __CRServiceConnectionPerform_block_invoke_2;
    v10[3] = &unk_1E5427E58;
    v11 = v6;
    v3[2](v3, v9, v10);

  }
}

void CRServiceConnectionSynchronousPerform(void *a1, void *a2)
{
  void (**v3)(id, void *);
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v3 = a1;
  v4 = a2;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit service.", buf, 2u);
  }

  CRServiceCreateConnection();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __CRServiceConnectionSynchronousPerform_block_invoke;
  v9[3] = &unk_1E5427E30;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v3[2](v3, v8);
  objc_msgSend(v6, "invalidate");

}

void sub_1A83A6CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83A6F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83A7210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83A75A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83A7830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83A7BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

__CFString *CARVerifyString(void *a1)
{
  id v1;
  __CFString *v2;
  NSObject *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (__CFString *)v1;
  }
  else
  {
    CarGeneralLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      CARVerifyString_cold_1();

    v2 = &stru_1E542A520;
  }

  return v2;
}

id CARVerifyStringArray(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "filteredArrayUsingPredicate:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
    {
      v6 = v1;
      goto LABEL_7;
    }
    CarGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      CARVerifyStringArray_cold_1();

  }
  v6 = 0;
LABEL_7:

  return v6;
}

id CARVerifyClass(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;

  v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    CarGeneralLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      CARVerifyClass_cold_1();

    v2 = 0;
  }

  return v2;
}

uint64_t CARVerifyBool(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;

  v1 = a1;
  if (!v1)
  {
LABEL_7:
    v2 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CarGeneralLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      CARVerifyBool_cold_1();

    goto LABEL_7;
  }
  v2 = objc_msgSend(v1, "BOOLValue");
LABEL_8:

  return v2;
}

void sub_1A83A9D8C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void DBZipArchiverCopyFileFinishedHandler(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  id v5;

  BOMCopierUserData();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFileSystemRepresentation:length:", a2, strlen(a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v4);
}

id CarAppearanceLogging()
{
  if (CarAppearanceLogging_onceToken != -1)
    dispatch_once(&CarAppearanceLogging_onceToken, &__block_literal_global_15);
  return (id)CarAppearanceLogging_facility;
}

id CarCertificationOverrideLogging()
{
  if (CarCertificationOverrideLogging_onceToken != -1)
    dispatch_once(&CarCertificationOverrideLogging_onceToken, &__block_literal_global_17);
  return (id)CarCertificationOverrideLogging_facility;
}

id CarConnectionTimeLogging()
{
  if (CarConnectionTimeLogging_onceToken != -1)
    dispatch_once(&CarConnectionTimeLogging_onceToken, &__block_literal_global_19);
  return (id)CarConnectionTimeLogging_facility;
}

id CarDiagnosticsLogging()
{
  if (CarDiagnosticsLogging_onceToken != -1)
    dispatch_once(&CarDiagnosticsLogging_onceToken, &__block_literal_global_21);
  return (id)CarDiagnosticsLogging_facility;
}

id CarDNDWDLogging()
{
  if (CarDNDWDLogging_onceToken != -1)
    dispatch_once(&CarDNDWDLogging_onceToken, &__block_literal_global_23_0);
  return (id)CarDNDWDLogging_facility;
}

id CarSilentModeLogging()
{
  if (CarSilentModeLogging_onceToken != -1)
    dispatch_once(&CarSilentModeLogging_onceToken, &__block_literal_global_25_0);
  return (id)CarSilentModeLogging_facility;
}

id CarPairingLogging()
{
  if (CarPairingLogging_onceToken != -1)
    dispatch_once(&CarPairingLogging_onceToken, &__block_literal_global_27);
  return (id)CarPairingLogging_facility;
}

id CarThemeAssetsLogging()
{
  if (CarThemeAssetsLogging_onceToken != -1)
    dispatch_once(&CarThemeAssetsLogging_onceToken, &__block_literal_global_29);
  return (id)CarThemeAssetsLogging_facility;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A83ADACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1A83ADFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83AE0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83AE218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83AE370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_1A83B0FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83B11A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83B3B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83B3D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CRPostBannerToPhone(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3B50];
  v7 = a2;
  v8 = a1;
  objc_msgSend(v6, "interfaceWithProtocol:", &unk_1EE9AC258);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.service"), 4096);
  objc_msgSend(v10, "setRemoteObjectInterface:", v9);
  objc_msgSend(v10, "resume");
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __CRPostBannerToPhone_block_invoke_106;
  v14[3] = &unk_1E5428A10;
  v15 = v10;
  v16 = v5;
  v12 = v10;
  v13 = v5;
  objc_msgSend(v11, "postBannerToPhone:notificationMessage:reply:", v8, v7, v14);

}

void CRCollectCarPlayDiagnostics(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[16];

  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB3B50];
  v26 = a4;
  v11 = a3;
  v12 = a2;
  v13 = a1;
  objc_msgSend(v10, "interfaceWithProtocol:", &unk_1EE9AC258);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_handleCarPlayDiagnosticsWithDeviceScreenshotURL_carScreenshotURL_attachmentURLs_activeBundleIdentifier_reply_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_handleCarPlayDiagnosticsWithDeviceScreenshotURL_carScreenshotURL_attachmentURLs_activeBundleIdentifier_reply_, 1, 0);

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_handleCarPlayDiagnosticsWithDeviceScreenshotURL_carScreenshotURL_attachmentURLs_activeBundleIdentifier_reply_, 2, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_handleCarPlayDiagnosticsWithDeviceScreenshotURL_carScreenshotURL_attachmentURLs_activeBundleIdentifier_reply_, 3, 0);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.service"), 4096);
  objc_msgSend(v21, "setRemoteObjectInterface:", v14);
  objc_msgSend(v21, "resume");
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_112_0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CarGeneralLogging();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v23, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit diagnostics service.", buf, 2u);
  }

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __CRCollectCarPlayDiagnostics_block_invoke_113;
  v27[3] = &unk_1E5428A10;
  v28 = v21;
  v29 = v9;
  v24 = v21;
  v25 = v9;
  objc_msgSend(v22, "handleCarPlayDiagnosticsWithDeviceScreenshotURL:carScreenshotURL:attachmentURLs:activeBundleIdentifier:reply:", v13, v12, v11, v26, v27);

}

void CRCollectCarPlayDiagnosticsWithAttachments(void *a1, void *a2, void *a3, void *a4)
{
  CRCollectCarPlayDiagnostics(a1, a2, a3, 0, a4);
}

id CRSaveStringToTemporaryTextFile(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a1;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "temporaryDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.XXXXXX"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  v11 = mktemp((char *)objc_msgSend(v10, "fileSystemRepresentation"));
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.txt"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (objc_msgSend(v3, "writeToURL:atomically:encoding:error:", v15, 1, 4, 0))
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  return v17;
}

id CRStringForDate(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0CB3578];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd-HH:mm:ss"));
  objc_msgSend(v3, "stringFromDate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id CRBuildNumberForDevice()
{
  if (CRBuildNumberForDevice_onceToken != -1)
    dispatch_once(&CRBuildNumberForDevice_onceToken, &__block_literal_global_122_0);
  return (id)CRBuildNumberForDevice_buildVersion;
}

id CRDeviceHardwareIdentifierForDevice()
{
  if (CRDeviceHardwareIdentifierForDevice_onceToken != -1)
    dispatch_once(&CRDeviceHardwareIdentifierForDevice_onceToken, &__block_literal_global_124);
  return (id)CRDeviceHardwareIdentifierForDevice_hardwareIdentifier;
}

id CRFormattedBuildAndDeviceIdentifier()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;

  CRBuildNumberForDevice();
  v0 = objc_claimAutoreleasedReturnValue();
  CRDeviceHardwareIdentifierForDevice();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1 && v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v1, v0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v4 = v3;
    goto LABEL_10;
  }
  if (v1 | v0)
  {
    if (v1)
      v3 = (id)v1;
    else
      v3 = (id)v0;
    goto LABEL_9;
  }
  v4 = 0;
LABEL_10:

  return v4;
}

id CRURLEncodedString(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB3940];
        urlEncode(v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        urlEncode(v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@=%@"), v11, v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "addObject:", v13);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("&"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id urlEncode(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void CRLostModeStateChanged(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1A85D37EC]();
  objc_msgSend(a2, "_updateCarPlayAllowed");
  objc_autoreleasePoolPop(v3);
}

uint64_t CRFrameworkBundle()
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

id CRLocalizedStringForKey(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E542A520, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

__CFString *CRNullableDescriptionForString(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;

  v1 = a1;
  if (-[__CFString length](v1, "length"))
    v2 = v1;
  else
    v2 = CFSTR("(None)");
  v3 = v2;

  return v3;
}

id CRLocalizedWiFiVariantKeyForKey(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = v1;
  if (MGGetBoolAnswer())
  {
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("WIFI"), CFSTR("WLAN"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

uint64_t CRSettingsDebugUIEnabled()
{
  CFPropertyListRef v0;
  void *v1;
  CFTypeID v2;
  uint64_t v3;
  CFTypeID v4;

  v0 = CFPreferencesCopyAppValue((CFStringRef)CRPreferencesSettingsDebugUIKey, CRPreferencesNotMigratedDomain);
  if (!v0)
    return 0;
  v1 = (void *)v0;
  v2 = CFGetTypeID(v0);
  if (v2 == CFStringGetTypeID())
  {
    v3 = objc_msgSend(v1, "BOOLValue");
  }
  else
  {
    v4 = CFGetTypeID(v1);
    v3 = v4 == CFBooleanGetTypeID() && v1 == (void *)*MEMORY[0x1E0C9AE50];
  }
  CFRelease(v1);
  return v3;
}

uint64_t CRDeviceSupportsAutomaticDNDMotionTrigger()
{
  if (CRDeviceSupportsAutomaticDNDMotionTrigger_onceToken != -1)
    dispatch_once(&CRDeviceSupportsAutomaticDNDMotionTrigger_onceToken, &__block_literal_global_13);
  return CRDeviceSupportsAutomaticDNDMotionTrigger_supportsMotionTrigger;
}

id CRAutomaticDNDLocationBundle()
{
  if (CRAutomaticDNDLocationBundle_onceToken != -1)
    dispatch_once(&CRAutomaticDNDLocationBundle_onceToken, &__block_literal_global_166);
  return (id)CRAutomaticDNDLocationBundle_bundle;
}

uint64_t CRAutomaticDNDLocationServicesStatus()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getCLLocationManagerClass_softClass;
  v9 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCLLocationManagerClass_block_invoke;
    v5[3] = &unk_1E5428AD0;
    v5[4] = &v6;
    __getCLLocationManagerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  CRAutomaticDNDLocationBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "authorizationStatusForBundle:", v2);

  return v3;
}

void sub_1A83B91D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL CRAutomaticDNDLocationServicesEnabled()
{
  return CRAutomaticDNDLocationServicesStatus() != 2;
}

uint64_t CRIsInternalInstall()
{
  if (CRIsInternalInstall_onceToken != -1)
    dispatch_once(&CRIsInternalInstall_onceToken, &__block_literal_global_170);
  return CRIsInternalInstall_isInternal;
}

uint64_t CRDeviceSupportsDNDWhileDriving()
{
  if (CRDeviceSupportsDNDWhileDriving_onceToken != -1)
    dispatch_once(&CRDeviceSupportsDNDWhileDriving_onceToken, &__block_literal_global_173_0);
  return CRDeviceSupportsDNDWhileDriving_supportsDNDWhileDriving;
}

uint64_t CRHardwareSupportedFeatures()
{
  return 0;
}

uint64_t CRIsTestContext()
{
  if (CRIsTestContext_onceToken != -1)
    dispatch_once(&CRIsTestContext_onceToken, &__block_literal_global_176);
  return CRIsTestContext__isTestingContext;
}

BOOL CRSizeFromDictionary(const __CFDictionary *a1, CGSize *a2)
{
  _BOOL8 result;
  CGSize v4;
  unsigned __int128 v5;

  v5 = 0uLL;
  result = CGSizeMakeWithDictionaryRepresentation(a1, (CGSize *)&v5);
  if (result)
    v4 = (CGSize)v5;
  else
    v4 = (CGSize)*MEMORY[0x1E0C9D820];
  *a2 = v4;
  return result;
}

uint64_t CRSizeFromAirPlayDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("widthPixels"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(v4, "objectForKey:", CFSTR("heightPixels")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("widthPixels"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      objc_msgSend(v4, "objectForKey:", CFSTR("heightPixels"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      *a2 = v10;
      a2[1] = v13;
      v14 = 1;
    }
    else
    {
      v14 = 0;
      *(_OWORD *)a2 = *MEMORY[0x1E0C9D820];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t CRPhysicalSizeFromAirPlayDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("widthPhysical"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(v4, "objectForKey:", CFSTR("heightPhysical")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("widthPhysical"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      objc_msgSend(v4, "objectForKey:", CFSTR("heightPhysical"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      *a2 = v10;
      a2[1] = v13;
      v14 = 1;
    }
    else
    {
      v14 = 0;
      *(_OWORD *)a2 = *MEMORY[0x1E0C9D820];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t CROriginFromAirPlayDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("originXPixels"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(v4, "objectForKey:", CFSTR("originYPixels")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("originXPixels"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;

      objc_msgSend(v4, "objectForKey:", CFSTR("originYPixels"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      *a2 = v10;
      a2[1] = v13;
      v14 = 1;
    }
    else
    {
      v14 = 0;
      *(_OWORD *)a2 = *MEMORY[0x1E0C9D538];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreLocationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLLocationManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCLLocationManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getCLLocationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _CARDNDEnabledCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_dndStateChanged:", 1);
}

uint64_t _CARDNDDisabledCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_dndStateChanged:", 0);
}

uint64_t _CARDNDExitConfirmationEnabledCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_exitConfirmationStateChanged:", 1);
}

uint64_t _CARDNDExitConfirmationDisabledCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_exitConfirmationStateChanged:", 0);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

const __CFString *CARStringFromVoiceTriggerMode(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E5428ED0[a1 + 1];
}

uint64_t NSStringFromEdgeInsets(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Left: %.1f, right: %.1f, top: %.1f, bottom: %.1f"), *(_QWORD *)&a2, *(_QWORD *)&a4, *(_QWORD *)&a1, *(_QWORD *)&a3);
}

id CARInteractionModelEntitlements()
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("com.apple.developer.carplay-maps");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1A83C0840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1A83C113C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void CRHandleConnectionForBluetoothAddress(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CRHandleConnectionForBluetoothAddress_block_invoke;
  v10[3] = &unk_1E5428FF8;
  v11 = v3;
  v12 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __CRHandleConnectionForBluetoothAddress_block_invoke_3;
  v8[3] = &unk_1E5427E30;
  v9 = v12;
  v6 = v12;
  v7 = v3;
  CRServiceConnectionPerform(v10, v8);

}

void CRHandleDisconnectionForBluetoothAddress(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CRHandleDisconnectionForBluetoothAddress_block_invoke;
  v10[3] = &unk_1E5428FF8;
  v11 = v3;
  v12 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __CRHandleDisconnectionForBluetoothAddress_block_invoke_3;
  v8[3] = &unk_1E5427E30;
  v9 = v12;
  v6 = v12;
  v7 = v3;
  CRServiceConnectionPerform(v10, v8);

}

void CRBluetoothIndicatesInCar(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __CRBluetoothIndicatesInCar_block_invoke;
  v6[3] = &unk_1E5429048;
  v7 = v1;
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __CRBluetoothIndicatesInCar_block_invoke_3;
  v4[3] = &unk_1E5427E30;
  v5 = v7;
  v3 = v7;
  CRServiceConnectionPerform(v6, v4);

}

void CRConnectBluetoothLE(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a1;
  v7 = a2;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __CRConnectBluetoothLE_block_invoke;
  v15[3] = &unk_1E5429070;
  v16 = v6;
  v17 = v7;
  v18 = v8;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __CRConnectBluetoothLE_block_invoke_3;
  v13[3] = &unk_1E5427E30;
  v14 = v18;
  v10 = v18;
  v11 = v7;
  v12 = v6;
  CRServiceConnectionPerform(v15, v13);

}

void CRHandleBluetoothClassicPairingCompleted(void *a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  char v20;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __CRHandleBluetoothClassicPairingCompleted_block_invoke;
  v16[3] = &unk_1E5429098;
  v17 = v7;
  v18 = v8;
  v20 = a3;
  v19 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __CRHandleBluetoothClassicPairingCompleted_block_invoke_3;
  v14[3] = &unk_1E5427E30;
  v15 = v19;
  v11 = v19;
  v12 = v8;
  v13 = v7;
  CRServiceConnectionPerform(v16, v14);

}

void CRStartBluetoothClassicPairing(void *a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;

  v5 = a1;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __CRStartBluetoothClassicPairing_block_invoke;
  v12[3] = &unk_1E54290C0;
  v13 = v5;
  v15 = a2;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __CRStartBluetoothClassicPairing_block_invoke_3;
  v10[3] = &unk_1E5427E30;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  CRServiceConnectionPerform(v12, v10);

}

void CRConfirmAndContinueBluetoothClassicPairing(void *a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __CRConfirmAndContinueBluetoothClassicPairing_block_invoke;
  v20[3] = &unk_1E54290E8;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v25 = a4;
  v24 = v12;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __CRConfirmAndContinueBluetoothClassicPairing_block_invoke_3;
  v18[3] = &unk_1E5427E30;
  v19 = v24;
  v14 = v24;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  CRServiceConnectionPerform(v20, v18);

}

void CRHandleCarPlayConnectionRequest(int a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  int v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __CRHandleCarPlayConnectionRequest_block_invoke;
  v5[3] = &unk_1E5429110;
  v7 = a1;
  v6 = v3;
  v4 = v3;
  CRServiceConnectionPerform(v5, &__block_literal_global_44);

}

void CRSaveWiFiCredentialsForAccessoryConnectionIdentifier(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke;
  v12[3] = &unk_1E5429138;
  v13 = v5;
  v15 = a1;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __CRSaveWiFiCredentialsForAccessoryConnectionIdentifier_block_invoke_3;
  v10[3] = &unk_1E5427E30;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  CRServiceConnectionPerform(v12, v10);

}

void CRAllowsConnectionsForWiFiUUID(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CRAllowsConnectionsForWiFiUUID_block_invoke;
  v10[3] = &unk_1E5428FF8;
  v11 = v3;
  v12 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __CRAllowsConnectionsForWiFiUUID_block_invoke_3;
  v8[3] = &unk_1E5427E30;
  v9 = v12;
  v6 = v12;
  v7 = v3;
  CRServiceConnectionPerform(v10, v8);

}

void CRAllowsConnectionsForCertificateSerialNumber(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CRAllowsConnectionsForCertificateSerialNumber_block_invoke;
  v10[3] = &unk_1E5428FF8;
  v11 = v3;
  v12 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __CRAllowsConnectionsForCertificateSerialNumber_block_invoke_3;
  v8[3] = &unk_1E5427E30;
  v9 = v12;
  v6 = v12;
  v7 = v3;
  CRServiceConnectionPerform(v10, v8);

}

void CRIsPairedWithCertificateSerialNumber(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CRIsPairedWithCertificateSerialNumber_block_invoke;
  v10[3] = &unk_1E5428FF8;
  v11 = v3;
  v12 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __CRIsPairedWithCertificateSerialNumber_block_invoke_3;
  v8[3] = &unk_1E5427E30;
  v9 = v12;
  v6 = v12;
  v7 = v3;
  CRServiceConnectionPerform(v10, v8);

}

void CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber_block_invoke;
  v10[3] = &unk_1E5428FF8;
  v11 = v3;
  v12 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __CRIsEnhancedIntegrationEnabledWithCertificateSerialNumber_block_invoke_3;
  v8[3] = &unk_1E5427E30;
  v9 = v12;
  v6 = v12;
  v7 = v3;
  CRServiceConnectionPerform(v10, v8);

}

void CRHandleCarPlayRestrictionChanged()
{
  CRServiceConnectionPerform(&__block_literal_global_46, 0);
}

void CRIsCarPlayAllowed(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __CRIsCarPlayAllowed_block_invoke;
  v6[3] = &unk_1E5429048;
  v7 = v1;
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __CRIsCarPlayAllowed_block_invoke_3;
  v4[3] = &unk_1E5427E30;
  v5 = v7;
  v3 = v7;
  CRServiceConnectionPerform(v6, v4);

}

void CRVehicleIdentifierForCertificateSerial(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __CRVehicleIdentifierForCertificateSerial_block_invoke;
  v10[3] = &unk_1E5428FF8;
  v11 = v3;
  v12 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __CRVehicleIdentifierForCertificateSerial_block_invoke_3;
  v8[3] = &unk_1E5427E30;
  v9 = v12;
  v6 = v12;
  v7 = v3;
  CRServiceConnectionPerform(v10, v8);

}

void CRFetchInstrumentClusterURLs(void *a1)
{
  id v1;
  CARInstrumentClusterURLController *v2;
  CARInstrumentClusterURLController *v3;
  id v4;
  _QWORD v5[4];
  CARInstrumentClusterURLController *v6;
  id v7;

  v1 = a1;
  v2 = objc_alloc_init(CARInstrumentClusterURLController);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __CRFetchInstrumentClusterURLs_block_invoke;
  v5[3] = &unk_1E54291D0;
  v6 = v2;
  v7 = v1;
  v3 = v2;
  v4 = v1;
  -[CARInstrumentClusterURLController fetchInstrumentClusterURLs:](v3, "fetchInstrumentClusterURLs:", v5);

}

void CRFetchScaledDisplays(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __CRFetchScaledDisplays_block_invoke;
  v5[3] = &unk_1E5428030;
  v6 = v3;
  v4 = v3;
  +[CRScreenScaleHeuristics scaledDisplays:reply:](CRScreenScaleHeuristics, "scaledDisplays:reply:", a1, v5);

}

void CRFetchCarPlayCapabilities(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __CRFetchCarPlayCapabilities_block_invoke;
  v3[3] = &unk_1E54291F8;
  v4 = v1;
  v2 = v1;
  +[CRCarPlayCapabilities waitForCarCapabilitiesValuesWithReply:](CRCarPlayCapabilities, "waitForCarCapabilitiesValuesWithReply:", v3);

}

id CARSignpostLogForCategory(unint64_t a1)
{
  if (a1 >= 4)
    CARSignpostLogForCategory_cold_1();
  if (CARSignpostLogForCategory_onceToken != -1)
    dispatch_once(&CARSignpostLogForCategory_onceToken, &__block_literal_global_18);
  return (id)CARSignpostLogForCategory_logObjects[a1];
}

void CRCarPlayAppServicePolicyChangedHandler()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("com.apple.carkit.app.policy-changed"), 0, 0);

}

void sub_1A83C7F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83C88AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLSApplicationRecordClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LSApplicationRecord");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLSApplicationRecordClass_block_invoke_cold_1();
    free(v3);
  }
  getLSApplicationRecordClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkAssistantDirectActionEventKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AssistantServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary;
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "kAssistantDirectActionEventKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getkAssistantDirectActionEventKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id CRCarPlayNavigationOwnersServiceInterface()
{
  if (CRCarPlayNavigationOwnersServiceInterface_onceToken != -1)
    dispatch_once(&CRCarPlayNavigationOwnersServiceInterface_onceToken, &__block_literal_global_20);
  return (id)CRCarPlayNavigationOwnersServiceInterface_interface;
}

id CRCarPlayNavigationOwnerClientInterface()
{
  if (CRCarPlayNavigationOwnerClientInterface_onceToken != -1)
    dispatch_once(&CRCarPlayNavigationOwnerClientInterface_onceToken, &__block_literal_global_67);
  return (id)CRCarPlayNavigationOwnerClientInterface_interface;
}

void sub_1A83CAB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1A83CBADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMFAACreateCertificateSerialNumberSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MFAAuthenticationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MFAAuthenticationLibraryCore_frameworkLibrary;
  }
  else
  {
    MFAAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MFAAuthenticationLibraryCore_frameworkLibrary;
    if (!MFAAuthenticationLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MFAACreateCertificateSerialNumber");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMFAACreateCertificateSerialNumberSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A83CC0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void _CRHandleRemoteControlEvent(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  int v6;
  void *v7;
  id v8;

  v8 = a4;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E0CA4558]))
  {
    objc_msgSend(v8, "_dataReceived:", a3);
LABEL_5:
    v7 = v8;
    goto LABEL_6;
  }
  v6 = CFEqual(a2, (CFTypeRef)*MEMORY[0x1E0CA4560]);
  v7 = v8;
  if (v6)
  {
    objc_msgSend(v8, "_channelInvalidated");
    goto LABEL_5;
  }
LABEL_6:

}

void sub_1A83CC744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CRRemoteControlSendMessageCompletion(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_sendComplete");
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_1A83CD3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A83CD4A4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A83CD7CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1A83CD8D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A83CDCD4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

__CFString *CRCarPlayFeaturesName(uint64_t a1)
{
  char v1;
  __CFString *v2;
  void *v3;
  void *v4;

  if (!a1)
  {
    v2 = CFSTR("none");
    return v2;
  }
  v1 = a1;
  if (a1 != -1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((v1 & 1) != 0)
    {
      objc_msgSend(v3, "addObject:", CFSTR("AlternateScreen"));
      if ((v1 & 2) == 0)
      {
LABEL_7:
        if ((v1 & 4) == 0)
          goto LABEL_8;
        goto LABEL_16;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v4, "addObject:", CFSTR("EnhancedSiri"));
    if ((v1 & 4) == 0)
    {
LABEL_8:
      if ((v1 & 8) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
LABEL_16:
    objc_msgSend(v4, "addObject:", CFSTR("HEVC"));
    if ((v1 & 8) == 0)
    {
LABEL_9:
      if ((v1 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
LABEL_17:
    objc_msgSend(v4, "addObject:", CFSTR("GaugeCluster"));
    if ((v1 & 0x10) == 0)
    {
LABEL_10:
      if ((v1 & 0x20) == 0)
      {
LABEL_12:
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

        return v2;
      }
LABEL_11:
      objc_msgSend(v4, "addObject:", CFSTR("PassengerDisplay"));
      goto LABEL_12;
    }
LABEL_18:
    objc_msgSend(v4, "addObject:", CFSTR("DataProtocol"));
    if ((v1 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v2 = CFSTR("all");
  return v2;
}

id CRCarPlayFeaturesAsAirPlayFeatures(char a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E543F6E8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("altScreen"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("enhancedSiri"));
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "addObject:", CFSTR("fileTransfer"));
    objc_msgSend(v3, "addObject:", CFSTR("logTransfer"));
    objc_msgSend(v3, "addObject:", CFSTR("uiSync"));
    if ((a1 & 0x10) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "addObject:", CFSTR("hevc"));
  if ((a1 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((a1 & 0x10) != 0)
LABEL_6:
    objc_msgSend(v3, "addObject:", CFSTR("vehicleStateProtocol"));
  return v3;
}

uint64_t CRCarPlayFeaturesAllFerriteFeatures()
{
  return 56;
}

void sub_1A83CE960(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A83CECA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1A83CEF08(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1A83CF4EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A83CF5B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A83D079C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1A83D0AA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_1A83D2C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1A83D2DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83D5158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1A83D53B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1A83D7620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A83D857C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _adjacentViewAreaForPayload(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("adjacentViewAreas"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("adjacentViewAreas"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");

      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v4, "objectAtIndex:", v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
    else
    {

    }
    v5 = 0;
  }
LABEL_7:

  return v5;
}

uint64_t _transitionControlTypeForViewAreaChange(void *a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "displaysTransitionControl");
  v6 = 0;
  if (v4 && v5)
  {
    objc_msgSend(v3, "safeFrame");
    v8 = v7;
    objc_msgSend(v3, "safeFrame");
    v10 = v8 * v9;
    objc_msgSend(v4, "safeFrame");
    v12 = v11;
    objc_msgSend(v4, "safeFrame");
    if (v12 * v13 >= v10)
      v6 = 1;
    else
      v6 = 2;
  }

  return v6;
}

void CARHandleSuggestUI(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  CarGeneralLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v29 = v7;
    v30 = 2114;
    v31 = v8;
    v32 = 2114;
    v33 = v9;
    _os_log_impl(&dword_1A83A2000, v11, OS_LOG_TYPE_DEFAULT, "In URLS: %{public}@, iOS URLS: %{public}@, info response URLs: %{public}@", buf, 0x20u);
  }

  objc_msgSend(v7, "bs_filter:", &__block_literal_global_312);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CarGeneralLogging();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v12;
    _os_log_impl(&dword_1A83A2000, v13, OS_LOG_TYPE_DEFAULT, "Sanitized suggested URLs = %{public}@", buf, 0xCu);
  }

  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __CARHandleSuggestUI_block_invoke_313;
  v26[3] = &unk_1E5429B80;
  v15 = v9;
  v27 = v15;
  objc_msgSend(v8, "bs_filter:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __CARHandleSuggestUI_block_invoke_2;
  v23[3] = &unk_1E5429BA8;
  v18 = v12;
  v24 = v18;
  v19 = v17;
  v25 = v19;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v23);
  CarGeneralLogging();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v29 = v18;
    v30 = 2114;
    v31 = v8;
    v32 = 2114;
    v33 = v15;
    v34 = 2114;
    v35 = v19;
    _os_log_impl(&dword_1A83A2000, v20, OS_LOG_TYPE_DEFAULT, "suggestUI URL list %{public}@, app supported list: %{public}@, session list: %{public}@, intersect list %{public}@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v19, CFSTR("urls"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CarGeneralLogging();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v21;
    _os_log_impl(&dword_1A83A2000, v22, OS_LOG_TYPE_DEFAULT, "Parameters for suggest UI Command: %{public}@", buf, 0xCu);
  }

  v10[2](v10, v21);
}

void sub_1A83DAE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CARSesssionStatusChangedCallback()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("CARSessionStatusChangedNotification"), 0, 0);

}

uint64_t CRSessionStatusInCarNotificationCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleInCarNotification");
}

uint64_t CRSessionStatusStartingWiredConnectionNotificationCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleStartingWiredConnectionNotification");
}

uint64_t CRSessionStatusAccessoryUpdatedNotificationCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleConfigurationUpdated");
}

uint64_t CRSessionStatusCapabilitiesUpdatedNotificationCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleCarCapabilitiesUpdated");
}

void sub_1A83DB884(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1A83DBB44(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

float CARGetMinimumScaleForProposedScaleOnDisplay(void *a1, float a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;

  v3 = a1;
  v4 = -[CARSessionStatus initAndWaitUntilSessionUpdated]([CARSessionStatus alloc], "initAndWaitUntilSessionUpdated");
  objc_msgSend(v4, "currentSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenInfoForScreenID:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = _CARGetMinimumScaleForScreenInfo(v7, a2);
  return v8;
}

float _CARGetMinimumScaleForScreenInfo(void *a1, float a2)
{
  id v3;
  float v4;
  float v5;

  v3 = a1;
  if (!objc_msgSend(v3, "screenType"))
  {
    v5 = _CARGetMinimumScaleForProposedScaleForScreenInfo(v3, a2);
    goto LABEL_5;
  }
  v4 = 2.0;
  if (objc_msgSend(v3, "screenType") == 1)
  {
    _CARGetMinimumScaleForSecondaryScreenInfo(v3);
LABEL_5:
    v4 = v5;
  }

  return v4;
}

float _CARGetMinimumScaleForProposedScaleForScreenInfo(void *a1, float a2)
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  _QWORD v8[5];
  uint64_t v9;
  float *v10;
  uint64_t v11;
  float v12;

  v3 = a1;
  v9 = 0;
  v10 = (float *)&v9;
  v11 = 0x2020000000;
  v12 = a2;
  objc_msgSend(v3, "viewAreas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "viewAreas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ___CARGetMinimumScaleForProposedScaleForScreenInfo_block_invoke;
    v8[3] = &unk_1E5429C80;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  }
  v6 = v10[6];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1A83DC410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _CARGetMinimumScaleForSecondaryScreenInfo(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "physicalSize");
  objc_msgSend(v1, "pixelSize");

}

void figEndpointNotificationCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  void *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  _QWORD *v60;
  void *v61;
  unsigned int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  id v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1A85D37EC]();
  v9 = a2;
  v10 = a3;
  if (figEndpointNotificationCallback_createFigToAVFNotificationMappingOnce != -1)
    dispatch_once(&figEndpointNotificationCallback_createFigToAVFNotificationMappingOnce, &__block_literal_global_577);
  objc_msgSend((id)figEndpointNotificationCallback_figToCARSessionNotificationMapping, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = a5;
    CarGeneralLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v69 = v11;
      v70 = 2112;
      v71 = v12;
      _os_log_impl(&dword_1A83A2000, v13, OS_LOG_TYPE_DEFAULT, "posting session notification %{public}@ %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", v11, v9, v12);
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3B88]))
  {
    CarGeneralLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      figEndpointNotificationCallback_cold_1();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    v17 = CFSTR("CARSessionServerConnectionDiedNotification");
LABEL_20:
    objc_msgSend(v16, "postNotificationName:object:", v17, v9);
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3AF8]))
  {
    CarGeneralLogging();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      figEndpointNotificationCallback_cold_2();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    v17 = CFSTR("CARSessionAuthenticationSucceededNotification");
    goto LABEL_20;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3B38]))
  {
    CarGeneralLogging();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      figEndpointNotificationCallback_cold_3();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    v17 = CFSTR("CARSessionEndpointActivatedNotification");
    goto LABEL_20;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3BA8]))
  {
    CarGeneralLogging();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v69 = a5;
      _os_log_impl(&dword_1A83A2000, v20, OS_LOG_TYPE_INFO, "vehicle information changed %@", buf, 0xCu);
    }

    objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CA49A8]);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_21;
    if (v9[4])
    {
      objc_msgSend(v9, "inputDeviceManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "vehicleInformationChanged:", v12);

    }
    objc_msgSend(v12, "valueForKey:", *MEMORY[0x1E0CA49B0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_21;
    CarGeneralLogging();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A83A2000, v23, OS_LOG_TYPE_INFO, "electronic toll collection state changed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("CARSessionElectronicTollCollectionStateChangedNotification"), v9);
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3BD0]))
  {
    CarGeneralLogging();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = a5;
      _os_log_impl(&dword_1A83A2000, v24, OS_LOG_TYPE_DEFAULT, "application URL requested: %@", buf, 0xCu);
    }

    objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CA49C0]);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleOpenURL:", v12);
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3B90]))
  {
    CarGeneralLogging();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = a5;
      _os_log_impl(&dword_1A83A2000, v25, OS_LOG_TYPE_DEFAULT, "Siri requested: %@", buf, 0xCu);
    }

    objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CA46A0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleSiriRequestEvent:withPayload:", +[CARSession _siriRequestEventForEndpointAction:](CARSession, "_siriRequestEventForEndpointAction:", v26), a5);

    goto LABEL_22;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3B18]))
  {
    CarGeneralLogging();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = a5;
      _os_log_impl(&dword_1A83A2000, v27, OS_LOG_TYPE_DEFAULT, "Alternate test Siri requested: %@", buf, 0xCu);
    }

    objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CA3820]);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CA46A0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleSiriRequestEvent:withPayload:", +[CARSession _siriRequestEventForEndpointAction:](CARSession, "_siriRequestEventForEndpointAction:", v14), v12);
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3BB0]))
  {
    CarGeneralLogging();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = a5;
      _os_log_impl(&dword_1A83A2000, v28, OS_LOG_TYPE_DEFAULT, "View area change received: %@", buf, 0xCu);
    }

    objc_msgSend(v9, "_handleViewAreaChangeWithPayload:", a5);
    goto LABEL_22;
  }
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3B68]))
  {
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3B78]))
    {
      v12 = a5;
      CarGeneralLogging();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v12;
        _os_log_impl(&dword_1A83A2000, v43, OS_LOG_TYPE_DEFAULT, "System night mode changed: %@", buf, 0xCu);
      }

      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA39D0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA3A90]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v9, "configuration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "screenInfoForScreenID:", v14);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "nightModeChanged:", objc_msgSend(v44, "BOOLValue"));
      }
      objc_msgSend(v9, "setSystemNightMode:", v44);
      objc_msgSend(v9, "appearanceManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "handleNightModeUpdateWithParameters:", v12);

      objc_msgSend(v9, "_handleNightModeChange");
      goto LABEL_7;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3BA0]))
    {
      v48 = *MEMORY[0x1E0CA49A0];
      v49 = a5;
      objc_msgSend(v49, "objectForKeyedSubscript:", v48);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", *MEMORY[0x1E0CA4998]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "sessionStatusOptions") & 2) == 0)
      {
LABEL_7:

LABEL_21:
        goto LABEL_22;
      }
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("showUI")))
      {
        CarGeneralLogging();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v14;
          _os_log_impl(&dword_1A83A2000, v50, OS_LOG_TYPE_DEFAULT, "ShowUI requested with %@", buf, 0xCu);
        }

        objc_msgSend(v9, "_handleShowUIWithParameters:", v14);
        goto LABEL_7;
      }
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("stopUI")))
      {
        CarGeneralLogging();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v14;
          _os_log_impl(&dword_1A83A2000, v54, OS_LOG_TYPE_DEFAULT, "StopUI requested with %@", buf, 0xCu);
        }

        objc_msgSend(v9, "_handleStopUIWithParameters:", v14);
        goto LABEL_7;
      }
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("uiAppearanceUpdate")))
      {
        CarGeneralLogging();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v14;
          _os_log_impl(&dword_1A83A2000, v56, OS_LOG_TYPE_DEFAULT, "setAppearanceMode called with %@", buf, 0xCu);
        }

        objc_msgSend(v9, "_handleAppearanceModeUpdateWithParameters:", v14);
        goto LABEL_7;
      }
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("mapAppearanceUpdate")))
      {
        CarGeneralLogging();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v14;
          _os_log_impl(&dword_1A83A2000, v57, OS_LOG_TYPE_DEFAULT, "setMapAppearanceMode called with %@", buf, 0xCu);
        }

        objc_msgSend(v9, "_handleMapAppearanceModeUpdateWithParameters:", v14);
        goto LABEL_7;
      }
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("updateDisplayPanels")))
      {
        objc_msgSend(v9, "_handleDisplayPanelsUpdateWithParameters:", v14);
        goto LABEL_7;
      }
      CarGeneralLogging();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v69 = v12;
        v70 = 2112;
        v71 = v14;
        _os_log_impl(&dword_1A83A2000, v58, OS_LOG_TYPE_DEFAULT, "Received unhandled remote event %@ with %@", buf, 0x16u);
      }

      objc_msgSend(v9, "observers");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "session:receivedUnhandledRemoteEvent:withPayload:", v9, v12, v14);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA3708]))
        goto LABEL_22;
      v12 = a5;
      CarGeneralLogging();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v12;
        _os_log_impl(&dword_1A83A2000, v51, OS_LOG_TYPE_DEFAULT, "Enhanced Siri parameters changed: %@", buf, 0xCu);
      }

      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA3998]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v52;
      if (v52)
        v53 = objc_msgSend(v52, "integerValue");
      else
        v53 = -1;
      v9[5] = v53;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "postNotificationName:object:userInfo:", CFSTR("CARSessionVoiceTriggerModeChangedNotification"), v9, v12);
    }

    goto LABEL_7;
  }
  v61 = v8;
  v29 = a5;
  CarGeneralLogging();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v29;
    _os_log_impl(&dword_1A83A2000, v30, OS_LOG_TYPE_DEFAULT, "Limited UI changed: %@", buf, 0xCu);
  }

  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CA39D0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v29;
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CA39D8]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v32, "BOOLValue");

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v60 = v9;
  objc_msgSend(v9, "configuration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "screens");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v64 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v39, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "isEqualToString:", v31);

        if (v41)
          objc_msgSend(v39, "limitedUIChanged:", v62);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v36);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v60;
  objc_msgSend(v42, "postNotificationName:object:userInfo:", CFSTR("CARSessionLimitUserInterfacesChangedNotification"), v60, v59);

  v8 = v61;
LABEL_22:

  objc_autoreleasePoolPop(v8);
}

void __figEndpointNotificationCallback_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("CARSessionScreenBecameAvailableNotification"), *MEMORY[0x1E0CA3830], CFSTR("CARSessionScreenBecameUnavailableNotification"), *MEMORY[0x1E0CA3838], CFSTR("CARSessioniOSHasMainAudioNotification"), *MEMORY[0x1E0CA3840], CFSTR("CARSessionCarHasMainAudioNotification"), *MEMORY[0x1E0CA3828], CFSTR("CARSessionOwnsTurnByTurnNavigationChangedNotification"), *MEMORY[0x1E0CA3848], CFSTR("CARSessionPerformanceReportPostedNotification"), *MEMORY[0x1E0CA3B80], 0);
  v2 = (void *)figEndpointNotificationCallback_figToCARSessionNotificationMapping;
  figEndpointNotificationCallback_figToCARSessionNotificationMapping = v1;

}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1A83DD67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83DD7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1A83DD9A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1A83DEB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A83DEEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void CARVerifyString_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "object %@ is not a string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void CARVerifyStringArray_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "non-string objects in array: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void CARVerifyClass_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1A83A2000, v1, OS_LOG_TYPE_ERROR, "object %@ is not of class %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void CARVerifyBool_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "object %@ is not a BOOL number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __getCLLocationManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[CARAutomaticDNDStatus _performCARPreferencesBlock:forReading:].cold.1(v0);
}

void CARSignpostLogForCategory_cold_1()
{
  __assert_rtn("CARSignpostLogForCategory", "CARSignpost.m", 15, "category < CARSignpostCategoryCount");
}

uint64_t __getLSApplicationRecordClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return +[CRVehicleAccessoryManager _certificateSerialNumberForAccessory:].cold.2(v0);
}

void figEndpointNotificationCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "AirPlay endpoint server connection died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void figEndpointNotificationCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_1A83A2000, v0, v1, "AirPlay authentication succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void figEndpointNotificationCallback_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4(&dword_1A83A2000, v0, v1, "Endpoint activated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1E0D034A8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1E0D034B8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1E0D034C0]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x1E0D034D0]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x1E0D03508]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x1E0D03510]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1E0D01248]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSNSStringFromCGPoint()
{
  return MEMORY[0x1E0D01430]();
}

uint64_t BSNSStringFromCGSize()
{
  return MEMORY[0x1E0D01440]();
}

uint64_t BSStringFromCGPoint()
{
  return MEMORY[0x1E0D01600]();
}

uint64_t BSStringFromCGSize()
{
  return MEMORY[0x1E0D01610]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D808]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1E0C9D818](dict, size);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1E0C9EB28]();
}

uint64_t CMBaseObjectIsMemberOfClass()
{
  return MEMORY[0x1E0C9EB38]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1E0C9EEB8]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1E0C9EEC8]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x1E0C9EEE8]();
}

uint64_t FigEndpointCopyActiveCarPlayEndpoint()
{
  return MEMORY[0x1E0CA0648]();
}

uint64_t FigEndpointExtendedGetClassID()
{
  return MEMORY[0x1E0CA0670]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x1E0CA0680]();
}

uint64_t FigEndpointRemoteControlSessionGetCMBaseObject()
{
  return MEMORY[0x1E0CA0728]();
}

uint64_t FigNotificationCenterAddWeakListeners()
{
  return MEMORY[0x1E0CA0FC8]();
}

uint64_t FigNotificationCenterRemoveWeakListeners()
{
  return MEMORY[0x1E0CA0FE8]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x1E0CBB1E8](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1E0CBB1F8]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x1E0CBB268]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4B0](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4D0](service);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x1E0DE2B88]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

BOOL NSEdgeInsetsEqual(NSEdgeInsets aInsets, NSEdgeInsets bInsets)
{
  return MEMORY[0x1E0CB2988](*(__n128 *)&aInsets.top, *(__n128 *)&aInsets.left, *(__n128 *)&aInsets.bottom, *(__n128 *)&aInsets.right, *(__n128 *)&bInsets.top, *(__n128 *)&bInsets.left, *(__n128 *)&bInsets.bottom, *(__n128 *)&bInsets.right);
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x1E0CB3150](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1E0C841C0](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

