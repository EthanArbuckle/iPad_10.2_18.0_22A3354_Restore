uint64_t HKClinicalAccountStoreClientInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E434D8);
}

id HKClinicalAccountStoreServerInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C408);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x24BDBCF20]);
  v2 = objc_opt_class();
  v3 = (void *)objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_fetchAllAccountsWithCompletion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_fetchAccountsForGatewaysWithExternalIDs_completion_, 0, 1);
  v4 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchAllEventsForAccountIdentifier_completion_, 0, 1);
  v5 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion_, 0, 0);
  v6 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion_, 0, 1);

  return v0;
}

void sub_2163C60D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *HDHealthRecordsPublicUserAgentString()
{
  return CFSTR("AppleHealth/1.0");
}

id HDHealthRecordsPrivateUserAgentString()
{
  if (HDHealthRecordsPrivateUserAgentString_onceToken != -1)
    dispatch_once(&HDHealthRecordsPrivateUserAgentString_onceToken, &__block_literal_global_0);
  return (id)HDHealthRecordsPrivateUserAgentString_userAgent;
}

BOOL HKFHIRResourceQueryModeIncludesFullMode(unint64_t a1)
{
  return a1 < 2;
}

const __CFString *NSStringFromHKFHIRResourceQueryMode(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("{unknown}");
  else
    return off_24D549160[a1];
}

uint64_t HKProviderServiceMaximumCompatibleAPIVersion()
{
  if (_os_feature_enabled_impl())
    return 8;
  else
    return 7;
}

BOOL HKProviderServiceIsMinCompatibleAPIVersionSupported(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = _os_feature_enabled_impl();
  v3 = 7;
  if (v2)
    v3 = 8;
  return v3 >= a1;
}

const __CFString *HKClinicalGatewayFeatureStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_24D549190[a1 - 1];
}

uint64_t HKClinicalGatewayFeatureStatusFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Active")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Inactive")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Disabled")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Removed")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t HKMedicalDownloadableAttachmentStoreClientInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E3FD80);
}

id HKMedicalDownloadableAttachmentStoreServerInterface()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C108);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_remote_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_remote_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion_, 0, 1);

  return v0;
}

void sub_2163CCEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
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

id HDHealthRecordsIngestionServiceInterface()
{
  void *v0;
  id v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C168);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_processOriginalSignedClinicalDataRecords_options_completion_, 0, 0);
  v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_triggerDownloadIssuerRegistryWithOptions_completion_, 0, 1);
  v3 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_triggerDownloadPublicKeysWithOptions_completion_, 0, 1);
  return v0;
}

__CFString *HKClinicalSharingFeatureStatusToString(unint64_t a1)
{
  if (a1 < 6)
    return off_24D549250[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown(%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HKClinicalSharingUserStatusToString(unint64_t a1)
{
  if (a1 < 6)
    return off_24D549280[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown(%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HKClinicalSharingMultiDeviceStatusToString(unint64_t a1)
{
  if (a1 < 5)
    return off_24D5492B0[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown(%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t HKSignedClinicalDataStoreClientInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E414B0);
}

id HKSignedClinicalDataStoreServerInterface()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C1C8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_insertOrReplaceIssuerRegistryEntries_completion_, 0, 0);
  v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_insertOrReplacePublicKeyEntries_completion_, 0, 0);
  v3 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchPublicKeyEntriesWithCompletion_, 0, 1);
  v4 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_removePublicKeyEntriesWithKeyIDs_completion_, 0, 0);
  v5 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_triggerDownloadIssuerRegistryWithOptions_completion_, 0, 1);
  v6 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_triggerDownloadPublicKeysWithOptions_completion_, 0, 1);
  return v0;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

const __CFString *NSStringFromAttachmentStatus(unint64_t a1)
{
  if (a1 > 9)
    return CFSTR("unknown");
  else
    return off_24D5495A0[a1];
}

const __CFString *NSStringFromHDClinicalAnalyticsExtractionFailureCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return CFSTR("Nil");
  else
    return off_24D549600[a1 - 1];
}

id HKClinicalSharingServerInterface()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C228);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_shareHealthDataWithOptions_reason_date_completion_, 0, 1);
  return v0;
}

uint64_t HKClinicalSharingSyncObserverServerInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C288);
}

uint64_t HKClinicalSharingSyncObserverClientInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E444C8);
}

void sub_2163D842C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
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

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_3(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return objc_opt_class();
}

id HDHealthRecordsXPCServiceInterface()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C2E8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_remote_processOriginalSignedClinicalDataRecords_options_completion_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_remote_reprocessOriginalRecords_options_completion_, 0, 0);
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_remote_fetchSpotlightSearchResultsForQueryString_completion_, 0, 1);

  return v0;
}

uint64_t HKClinicalIngestionStoreClientInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E42A90);
}

id HKClinicalIngestionStoreServerInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C348);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion_, 2, 0);

  return v0;
}

__CFString *HKStringFromHKClinicalIngestionState(unint64_t a1)
{
  if (a1 < 4)
    return off_24D549990[a1];
  objc_msgSend(CFSTR("HKClinicalIngestionState"), "stringByAppendingFormat:", CFSTR(" %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_2163DB61C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
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

const __CFString *NSStringFromHKClinicalAccountEventType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("credential state change");
  if (a1 == 2)
    return CFSTR("ignore incoming credential from sync");
  else
    return v1;
}

const __CFString *NSStringFromHKOptionalClinicalAccountCredentialState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_24D549B78[a1 - 1];
}

uint64_t HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState(uint64_t a1)
{
  uint64_t v1;

  v1 = 1;
  if (a1 == 1)
    v1 = 2;
  if (a1 == 2)
    return 3;
  else
    return v1;
}

const __CFString *NSStringFromHKFHIRServerAuthenticationPKCEAlgorithm(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("none");
  else
    return off_24D549B90[a1 - 1];
}

uint64_t HKFHIRServerAuthenticationPKCEAlgorithmFromNSString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("S256")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("plain")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("none")))
        v2 = 3;
      else
        v2 = 0;
    }
    else
    {
      v2 = 1;
    }
  }
  else
  {
    v2 = 2;
  }

  return v2;
}

BOOL HKFHIRServerAuthenticationPKCEAlgorithmIsSupported(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t HKClinicalProviderServiceStoreClientInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E446C0);
}

id HKClinicalProviderServiceStoreServerInterface()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C3A8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchRemoteSearchResultsPageForQuery_completion_, 0, 1);
  v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchRemoteGatewayWithExternalID_batchID_completion_, 0, 1);
  return v0;
}

void sub_2163E38DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2163E9094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
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

void sub_2163E9614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2163EA154(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2163EA7EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t HKHealthRecordsCurrentEnvironment()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  if (!objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
    return 0;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.healthd"));
  objc_msgSend(v0, "valueForKey:", CFSTR("HDCPSEnvironment"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || objc_msgSend(v1, "integerValue") < 0 || objc_msgSend(v2, "integerValue") > 13)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

void HKHealthRecordsSetEnvironment(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.healthd"));
  objc_msgSend(v2, "setInteger:forKey:", a1, CFSTR("HDCPSEnvironment"));

}

const __CFString *HKHealthRecordsNameForEnvironment(unint64_t a1)
{
  if (a1 > 0xD)
    return CFSTR("Unknown");
  else
    return off_24D54A2C8[a1];
}

uint64_t HKHealthRecordsDaemonConnectionServerInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C468);
}

void sub_2163EE5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
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

void sub_2163EE814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t HKVerifiableHealthRecordsParsingServiceInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C4C8);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_2_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

uint64_t HDHealthRecordsLegacyIngestionServiceInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C528);
}

uint64_t HKClinicalGatewayUnknownBaseURL()
{
  return objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("localhost"));
}

const __CFString *NSStringFromHKClinicalAccountCredentialState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("default");
  if (a1 == 1)
    v1 = CFSTR("needs relogin");
  if (a1 == 2)
    return CFSTR("needs scope upgrade");
  else
    return v1;
}

const __CFString *NSStringFromHKClinicalAccountDeletionReason(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("unknown");
  else
    return off_24D54A800[a1];
}

const __CFString *NSStringFromAccountStateChangeType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_24D54A820[a1 - 1];
}

void HKReleaseSecKey(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

id HKSecPolicyNameAppleHealthProviderService()
{
  return (id)*MEMORY[0x24BDE9458];
}

uint64_t HKAcceptAuthenticationChallengeWithTrust(__SecTrust *a1)
{
  CFArrayRef v2;
  CFArrayRef v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFErrorRef error;

  error = 0;
  if (SecTrustEvaluateWithError(a1, &error))
  {
    v2 = SecTrustCopyCertificateChain(a1);
    v3 = v2;
    if (v2)
    {
      -[__CFArray lastObject](v2, "lastObject");

      v4 = 1;
      SecTrustStoreForDomain();
      if (SecTrustStoreContains())
      {
LABEL_14:

        return v4;
      }
      _HKInitializeLogging();
      v5 = *MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        HKAcceptAuthenticationChallengeWithTrust_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        HKAcceptAuthenticationChallengeWithTrust_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    v4 = 0;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  v13 = *MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    HKAcceptAuthenticationChallengeWithTrust_cold_3((uint64_t *)&error, v13);
  if (error)
    CFRelease(error);
  return 0;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id HKClinicalDocumentDownloaderInterface()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4C588);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_beginOrResumeDownloadingAttachments_shouldRequestMore_completion_, 0, 0);
  return v0;
}

Swift::String __swiftcall ClinicalAccountSummaryTileType.keyValueDomainName()()
{
  _BYTE *v0;
  uint64_t v1;
  void *v2;
  Swift::String result;

  if (*v0)
    v1 = 0xD000000000000043;
  else
    v1 = 0xD000000000000041;
  if (*v0)
    v2 = (void *)0x8000000216406AE0;
  else
    v2 = (void *)0x8000000216406B30;
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

HealthRecordServices::ClinicalAccountSummaryTileType_optional __swiftcall ClinicalAccountSummaryTileType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HealthRecordServices::ClinicalAccountSummaryTileType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2163FE540();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t ClinicalAccountSummaryTileType.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x5579617765746167;
  if (*v0 != 1)
    v1 = 0xD000000000000013;
  if (*v0)
    return v1;
  else
    return 0x4C746E756F636361;
}

uint64_t sub_2163FCC6C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2163FCCC0(*a1, *a2);
}

unint64_t sub_2163FCC7C()
{
  unint64_t result;

  result = qword_254E3C4B0;
  if (!qword_254E3C4B0)
  {
    result = MEMORY[0x2199F7EAC](&protocol conformance descriptor for ClinicalAccountSummaryTileType, &type metadata for ClinicalAccountSummaryTileType);
    atomic_store(result, (unint64_t *)&qword_254E3C4B0);
  }
  return result;
}

uint64_t sub_2163FCCC0(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xEC0000006E69676FLL;
  v3 = 0x4C746E756F636361;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x5579617765746167;
    else
      v5 = 0xD000000000000013;
    if (v4 == 1)
      v6 = 0xEE00656461726770;
    else
      v6 = 0x8000000216406AC0;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0x4C746E756F636361;
  v6 = 0xEC0000006E69676FLL;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v3 = 0x5579617765746167;
    else
      v3 = 0xD000000000000013;
    if (v7 == 1)
      v2 = 0xEE00656461726770;
    else
      v2 = 0x8000000216406AC0;
  }
LABEL_15:
  if (v5 == v3 && v6 == v2)
    v8 = 1;
  else
    v8 = sub_2163FE54C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2163FCDF8()
{
  sub_2163FE558();
  sub_2163FE4F8();
  swift_bridgeObjectRelease();
  return sub_2163FE564();
}

uint64_t sub_2163FCEB0()
{
  sub_2163FE4F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2163FCF44()
{
  sub_2163FE558();
  sub_2163FE4F8();
  swift_bridgeObjectRelease();
  return sub_2163FE564();
}

HealthRecordServices::ClinicalAccountSummaryTileType_optional sub_2163FCFF8(Swift::String *a1)
{
  return ClinicalAccountSummaryTileType.init(rawValue:)(*a1);
}

void sub_2163FD004(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xEC0000006E69676FLL;
  v4 = 0xEE00656461726770;
  v5 = 0x5579617765746167;
  if (v2 != 1)
  {
    v5 = 0xD000000000000013;
    v4 = 0x8000000216406AC0;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x4C746E756F636361;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2163FD07C()
{
  sub_2163FD2A4();
  return sub_2163FE510();
}

uint64_t sub_2163FD0D8()
{
  sub_2163FD2A4();
  return sub_2163FE504();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ClinicalAccountSummaryTileType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ClinicalAccountSummaryTileType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2163FD210 + 4 * byte_2164035D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2163FD244 + 4 * byte_2164035D0[v4]))();
}

uint64_t sub_2163FD244(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2163FD24C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2163FD254);
  return result;
}

uint64_t sub_2163FD260(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2163FD268);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2163FD26C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2163FD274(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2163FD280(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2163FD28C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ClinicalAccountSummaryTileType()
{
  return &type metadata for ClinicalAccountSummaryTileType;
}

unint64_t sub_2163FD2A4()
{
  unint64_t result;

  result = qword_254E3C4B8;
  if (!qword_254E3C4B8)
  {
    result = MEMORY[0x2199F7EAC](&protocol conformance descriptor for ClinicalAccountSummaryTileType, &type metadata for ClinicalAccountSummaryTileType);
    atomic_store(result, (unint64_t *)&qword_254E3C4B8);
  }
  return result;
}

id HKClinicalGateway.supportsSharingToProvider.getter()
{
  void *v0;
  id result;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  id v16;

  result = objc_msgSend(v0, sel_features);
  if (result)
  {
    v2 = result;
    sub_2163FD4C8();
    v3 = sub_2163FE51C();

    if (v3 >> 62)
      goto LABEL_20;
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v4; v4 = sub_2163FE534())
    {
      v5 = 4;
      while (1)
      {
        v6 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2199F79CC](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
        v7 = v6;
        v8 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
          break;
        v9 = objc_msgSend(v6, sel_name);
        v10 = sub_2163FE4EC();
        v12 = v11;
        if (v10 == sub_2163FE4EC() && v12 == v13)
        {

          swift_bridgeObjectRelease_n();
LABEL_17:
          swift_bridgeObjectRelease_n();
          v16 = objc_msgSend(v7, sel_status);

          return (id)(v16 == (id)1);
        }
        v15 = sub_2163FE54C();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v15 & 1) != 0)
          goto LABEL_17;

        ++v5;
        if (v8 == v4)
          goto LABEL_15;
      }
      __break(1u);
LABEL_20:
      swift_bridgeObjectRetain();
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  return result;
}

unint64_t sub_2163FD4C8()
{
  unint64_t result;

  result = qword_254E3C4C0;
  if (!qword_254E3C4C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254E3C4C0);
  }
  return result;
}

void HKAcceptAuthenticationChallengeWithTrust_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2163C4000, a1, a3, "HKAcceptAuthenticationChallengeWithTrust: Could not retrieve trust certificate chain", a5, a6, a7, a8, 0);
}

void HKAcceptAuthenticationChallengeWithTrust_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2163C4000, a1, a3, "HKAcceptAuthenticationChallengeWithTrust: SecTrustStore verification failed for root cert", a5, a6, a7, a8, 0);
}

void HKAcceptAuthenticationChallengeWithTrust_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_2163C4000, a2, OS_LOG_TYPE_ERROR, "HKAcceptAuthenticationChallengeWithTrust: Server not trusted: %{public}@", (uint8_t *)&v3, 0xCu);
}

uint64_t sub_2163FE4EC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2163FE4F8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2163FE504()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2163FE510()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2163FE51C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2163FE528()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2163FE534()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2163FE540()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2163FE54C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2163FE558()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2163FE564()
{
  return MEMORY[0x24BEE4328]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKDateMax()
{
  return MEMORY[0x24BDD2B48]();
}

uint64_t HKDiagnosticStringFromDate()
{
  return MEMORY[0x24BDD2B78]();
}

uint64_t HKFHIRReleaseFromNSString()
{
  return MEMORY[0x24BDD2BF8]();
}

uint64_t HKLogInfrastructure()
{
  return MEMORY[0x24BDD3018]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x24BDD3708]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x24BDD3730]();
}

uint64_t HKSharedResourcesDirectory()
{
  return MEMORY[0x24BDD3738]();
}

uint64_t HKStringFromBool()
{
  return MEMORY[0x24BDD37C8]();
}

uint64_t NSStringForSignedClinicalDataSourceType()
{
  return MEMORY[0x24BDD3898]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x24BDE8D90](trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

uint64_t SecTrustStoreContains()
{
  return MEMORY[0x24BDE8E68]();
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x24BDE8E80]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF198](adler, buf, *(_QWORD *)&len);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

