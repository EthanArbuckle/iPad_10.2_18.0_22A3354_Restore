uint64_t MFIsMobileMail()
{
  if (MFIsMobileMail_onceToken != -1)
    dispatch_once(&MFIsMobileMail_onceToken, &__block_literal_global);
  return MFIsMobileMail_sIsMobileMail;
}

id MFReconciliationSignpostLog()
{
  if (MFReconciliationSignpostLog_mf_once_token_8 != -1)
    dispatch_once(&MFReconciliationSignpostLog_mf_once_token_8, &__block_literal_global_5);
  return (id)MFReconciliationSignpostLog_mf_once_object_8;
}

id MFReconciliationLog()
{
  if (MFReconciliationLog_mf_once_token_8 != -1)
    dispatch_once(&MFReconciliationLog_mf_once_token_8, &__block_literal_global_21);
  return (id)MFReconciliationLog_mf_once_object_8;
}

id MFAccountsLog()
{
  if (MFAccountsLog_mf_once_token_5 != -1)
    dispatch_once(&MFAccountsLog_mf_once_token_5, &__block_literal_global_15);
  return (id)MFAccountsLog_mf_once_object_5;
}

id MFPowerLog()
{
  if (MFPowerLog_mf_once_token_2 != -1)
    dispatch_once(&MFPowerLog_mf_once_token_2, &__block_literal_global_8);
  return (id)MFPowerLog_mf_once_object_2;
}

id MFAutoFetchLog()
{
  if (MFAutoFetchLog_mf_once_token_3 != -1)
    dispatch_once(&MFAutoFetchLog_mf_once_token_3, &__block_literal_global_10);
  return (id)MFAutoFetchLog_mf_once_object_3;
}

id MFLogGeneral()
{
  if (MFLogGeneral_mf_once_token_0 != -1)
    dispatch_once(&MFLogGeneral_mf_once_token_0, &__block_literal_global_1);
  return (id)MFLogGeneral_mf_once_object_0;
}

uint64_t MFDeviceSupportsNanoCompanion()
{
  return MGGetBoolAnswer();
}

void sub_1D2F2AF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t MFMobileMailContainerPath()
{
  if (MFMobileMailContainerPath_onceToken != -1)
    dispatch_once(&MFMobileMailContainerPath_onceToken, &__block_literal_global_6);
  return MFMobileMailContainerPath_containerPath;
}

void sub_1D2F2B0CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

const __CFString *MFMobileMailPreferenceDomain()
{
  return CFSTR("com.apple.mobilemail");
}

uint64_t MFDeviceSupportsForceTouch()
{
  return MGGetBoolAnswer();
}

uint64_t MFDeviceSupportsHighRefreshRate()
{
  if (MFDeviceSupportsHighRefreshRate_onceToken != -1)
    dispatch_once(&MFDeviceSupportsHighRefreshRate_onceToken, &__block_literal_global_0);
  return MFDeviceSupportsHighRefreshRate_deviceSupportsHighRefreshRate;
}

const __CFString *mf_defaultsKeyForFeature(uint64_t a1)
{
  void *v3;
  void *v4;

  if (a1 == 1)
    return CFSTR("ShowSendEml");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *mf_defaultsKeyForFeature(MFMobileMailFeature)");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MFFeaturePreferences.m"), 29, CFSTR("Invalid MFMailFeature %d passed to mf_defaultsKeyForFeature"), a1);

  return 0;
}

void sub_1D2F2B238(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t mf_isFeatureEnabled(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  mf_defaultsKeyForFeature(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (a1 != 1)
  {
    if (a1)
    {
      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL mf_isFeatureEnabled(MFMobileMailFeature)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MFFeaturePreferences.m"), 38, CFSTR("MFMailFeatureInvalid passed to mf_isFeatureEnabled"));
    goto LABEL_6;
  }
  v4 = v2;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = objc_msgSend(v5, "BOOLValue");
LABEL_7:

LABEL_9:
  return v7;
}

void sub_1D2F2B344(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D2F2B37C()
{
  JUMPOUT(0x1D2F2B370);
}

id MFLogNetwork()
{
  if (MFLogNetwork_mf_once_token_1 != -1)
    dispatch_once(&MFLogNetwork_mf_once_token_1, &__block_literal_global_6_0);
  return (id)MFLogNetwork_mf_once_object_1;
}

id MFPersistenceLog()
{
  if (MFPersistenceLog_mf_once_token_4 != -1)
    dispatch_once(&MFPersistenceLog_mf_once_token_4, &__block_literal_global_13);
  return (id)MFPersistenceLog_mf_once_object_4;
}

id MFExchangeLog()
{
  if (MFExchangeLog_mf_once_token_6 != -1)
    dispatch_once(&MFExchangeLog_mf_once_token_6, &__block_literal_global_17);
  return (id)MFExchangeLog_mf_once_object_6;
}

id MFComposeLog()
{
  if (MFComposeLog_mf_once_token_7 != -1)
    dispatch_once(&MFComposeLog_mf_once_token_7, &__block_literal_global_19);
  return (id)MFComposeLog_mf_once_object_7;
}

uint64_t MFGreenTeaLogger()
{
  return ct_green_tea_logger_create_static();
}

id MFMessageSelectionLifecycleSignpostLog()
{
  if (MFMessageSelectionLifecycleSignpostLog_mf_once_token_6 != -1)
    dispatch_once(&MFMessageSelectionLifecycleSignpostLog_mf_once_token_6, &__block_literal_global_2);
  return (id)MFMessageSelectionLifecycleSignpostLog_mf_once_object_6;
}

id MFMessageLoadingSignpostLog()
{
  if (MFMessageLoadingSignpostLog_mf_once_token_7 != -1)
    dispatch_once(&MFMessageLoadingSignpostLog_mf_once_token_7, &__block_literal_global_3);
  return (id)MFMessageLoadingSignpostLog_mf_once_object_7;
}

id MFMessageComposeLoadingSignpostLog()
{
  if (MFMessageComposeLoadingSignpostLog_mf_once_token_9 != -1)
    dispatch_once(&MFMessageComposeLoadingSignpostLog_mf_once_token_9, &__block_literal_global_7);
  return (id)MFMessageComposeLoadingSignpostLog_mf_once_object_9;
}

id MFMessageListLoadingSignpostLog()
{
  if (MFMessageListLoadingSignpostLog_mf_once_token_10 != -1)
    dispatch_once(&MFMessageListLoadingSignpostLog_mf_once_token_10, &__block_literal_global_9);
  return (id)MFMessageListLoadingSignpostLog_mf_once_object_10;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t ct_green_tea_logger_create_static()
{
  return MEMORY[0x1E0DDFE90]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

