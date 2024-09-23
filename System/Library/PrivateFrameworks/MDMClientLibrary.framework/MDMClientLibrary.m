void sub_1D4BF9264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4BFA790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
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

void sub_1D4BFAE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1D4BFB084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4BFB8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4BFCA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getLAContextClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("LAContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getLAContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D4C00FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1D4C01AA4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4C02694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C03A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C03CC0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
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

void sub_1D4C04568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C05478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_1D4C06350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C066EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D4C069E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C06F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C07360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C07640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _alwaysAllowedQueries()
{
  if (_alwaysAllowedQueries_onceToken != -1)
    dispatch_once(&_alwaysAllowedQueries_onceToken, &__block_literal_global_7_0);
  return (id)_alwaysAllowedQueries_set;
}

id _deviceInformationQueries()
{
  void *v0;
  int v1;

  if (_deviceInformationQueries_onceToken != -1)
    dispatch_once(&_deviceInformationQueries_onceToken, &__block_literal_global_9_0);
  objc_msgSend(MEMORY[0x1E0D1C198], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "hrnMode");

  switch(v1)
  {
    case 2:
      goto LABEL_6;
    case 1:
      objc_msgSend((id)_deviceInformationQueries_set, "removeObject:", CFSTR("AppStoreUserAgent"));
      objc_msgSend((id)_deviceInformationQueries_set, "removeObject:", CFSTR("MID"));
      objc_msgSend((id)_deviceInformationQueries_set, "removeObject:", CFSTR("VIDSeed"));
      return (id)_deviceInformationQueries_set;
    case 0:
LABEL_6:
      objc_msgSend((id)_deviceInformationQueries_set, "unionSet:", _deviceInformationQueries_hrnSet);
      break;
  }
  return (id)_deviceInformationQueries_set;
}

id _appInstallationQueries()
{
  if (_appInstallationQueries_onceToken != -1)
    dispatch_once(&_appInstallationQueries_onceToken, &__block_literal_global_13);
  return (id)_appInstallationQueries_set;
}

id _networkInformationQueries()
{
  if (_networkInformationQueries_onceToken != -1)
    dispatch_once(&_networkInformationQueries_onceToken, &__block_literal_global_14_0);
  return (id)_networkInformationQueries_set;
}

uint64_t ___alwaysAllowedQueries_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E20];
  v5[0] = CFSTR("UDID");
  v5[1] = CFSTR("OrganizationInfo");
  v5[2] = CFSTR("MDMOptions");
  v5[3] = CFSTR("LastCloudBackupDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_alwaysAllowedQueries_set;
  _alwaysAllowedQueries_set = v2;

  return objc_msgSend((id)_alwaysAllowedQueries_set, "addObject:", CFSTR("AwaitingConfiguration"));
}

void ___deviceInformationQueries_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[10];
  _QWORD v19[4];
  _QWORD v20[10];
  _QWORD v21[14];

  v21[13] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E20];
  v21[0] = CFSTR("DeviceName");
  v21[1] = CFSTR("DevicePropertiesAttestation");
  v21[2] = CFSTR("OSVersion");
  v21[3] = CFSTR("BuildVersion");
  v21[4] = CFSTR("ModelName");
  v21[5] = CFSTR("ModelNumber");
  v21[6] = CFSTR("ProductName");
  v21[7] = CFSTR("Model");
  v21[8] = CFSTR("SerialNumber");
  v21[9] = CFSTR("IsSupervised");
  v21[10] = CFSTR("TimeZone");
  v21[11] = CFSTR("SupplementalBuildVersion");
  v21[12] = CFSTR("SupplementalOSVersionExtra");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 13);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_deviceInformationQueries_set;
  _deviceInformationQueries_set = v2;

  v4 = objc_msgSend(MEMORY[0x1E0D1C1E0], "isAppleTV");
  v5 = (void *)_deviceInformationQueries_set;
  if (v4)
  {
    objc_msgSend((id)_deviceInformationQueries_set, "addObject:", CFSTR("DeviceID"));
  }
  else
  {
    v20[0] = CFSTR("DeviceCapacity");
    v20[1] = CFSTR("AvailableDeviceCapacity");
    v20[2] = CFSTR("BatteryLevel");
    v20[3] = CFSTR("IsDeviceLocatorServiceEnabled");
    v20[4] = CFSTR("IsDoNotDisturbInEffect");
    v20[5] = CFSTR("EASDeviceIdentifier");
    v20[6] = CFSTR("IsCloudBackupEnabled");
    v20[7] = CFSTR("DiagnosticSubmissionEnabled");
    v20[8] = CFSTR("AppAnalyticsEnabled");
    v20[9] = CFSTR("SoftwareUpdateDeviceID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    if ((objc_msgSend(MEMORY[0x1E0D1C1E0], "isVisionDevice") & 1) == 0
      && (objc_msgSend(MEMORY[0x1E0D1C1E0], "isAppleTV") & 1) == 0)
    {
      v7 = (void *)_deviceInformationQueries_set;
      v19[0] = CFSTR("IMEI");
      v19[1] = CFSTR("MEID");
      v19[2] = CFSTR("ModemFirmwareVersion");
      v19[3] = CFSTR("CellularTechnology");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v8);

    }
    if ((objc_msgSend(MEMORY[0x1E0D1C1E0], "isVisionDevice") & 1) == 0
      && (objc_msgSend(MEMORY[0x1E0D1C1E0], "isAppleTV") & 1) == 0)
    {
      objc_msgSend((id)_deviceInformationQueries_set, "addObject:", CFSTR("IsMDMLostModeEnabled"));
    }
    objc_msgSend((id)_deviceInformationQueries_set, "addObject:", CFSTR("IsMultiUser"));
    if ((objc_msgSend(MEMORY[0x1E0D1C1E0], "isVisionDevice") & 1) == 0
      && (objc_msgSend(MEMORY[0x1E0D1C1E0], "isAppleTV") & 1) == 0)
    {
      objc_msgSend((id)_deviceInformationQueries_set, "addObject:", CFSTR("IsActivationLockEnabled"));
    }
    if ((objc_msgSend(MEMORY[0x1E0D1C1E0], "isVisionDevice") & 1) == 0)
      objc_msgSend((id)_deviceInformationQueries_set, "addObject:", CFSTR("SoftwareUpdateSettings"));
    +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userMode") == 1)
    {
      v10 = objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad");

      if (v10)
      {
        v11 = (void *)_deviceInformationQueries_set;
        v18[0] = CFSTR("MaximumResidentUsers");
        v18[1] = CFSTR("QuotaSize");
        v18[2] = CFSTR("ResidentUsers");
        v18[3] = CFSTR("EstimatedResidentUsers");
        v18[4] = CFSTR("UserSessionTimeout");
        v18[5] = CFSTR("TemporarySessionTimeout");
        v18[6] = CFSTR("TemporarySessionOnly");
        v18[7] = CFSTR("ManagedAppleIDDefaultDomains");
        v18[8] = CFSTR("OnlineAuthenticationGracePeriod");
        v18[9] = CFSTR("SkipLanguageAndLocaleSetupForNewUsers");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v12);

      }
    }
    else
    {

    }
  }
  v13 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = CFSTR("AppStoreUserAgent");
  v17[1] = CFSTR("MID");
  v17[2] = CFSTR("VIDSeed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_deviceInformationQueries_hrnSet;
  _deviceInformationQueries_hrnSet = v15;

}

void ___appInstallationQueries_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D1C1E0], "isVisionDevice") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)_appInstallationQueries_set;
    _appInstallationQueries_set = v0;

  }
  else
  {
    v2 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6[0] = CFSTR("iTunesStoreAccountIsActive");
    v6[1] = CFSTR("iTunesStoreAccountHash");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "initWithArray:", v3);
    v5 = (void *)_appInstallationQueries_set;
    _appInstallationQueries_set = v4;

  }
}

void ___networkInformationQueries_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[16];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E20];
  v7[0] = CFSTR("BluetoothMAC");
  v7[1] = CFSTR("WiFiMAC");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_networkInformationQueries_set;
  _networkInformationQueries_set = v2;

  if ((objc_msgSend(MEMORY[0x1E0D1C1E0], "isVisionDevice") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D1C1E0], "isAppleTV") & 1) == 0)
  {
    v4 = (void *)_networkInformationQueries_set;
    v6[0] = CFSTR("ICCID");
    v6[1] = CFSTR("CurrentCarrierNetwork");
    v6[2] = CFSTR("SIMCarrierNetwork");
    v6[3] = CFSTR("SubscriberCarrierNetwork");
    v6[4] = CFSTR("CarrierSettingsVersion");
    v6[5] = CFSTR("PhoneNumber");
    v6[6] = CFSTR("DataRoamingEnabled");
    v6[7] = CFSTR("VoiceRoamingEnabled");
    v6[8] = CFSTR("PersonalHotspotEnabled");
    v6[9] = CFSTR("SubscriberMCC");
    v6[10] = CFSTR("SubscriberMNC");
    v6[11] = CFSTR("IsRoaming");
    v6[12] = CFSTR("CurrentMCC");
    v6[13] = CFSTR("CurrentMNC");
    v6[14] = CFSTR("ServiceSubscriptions");
    v6[15] = CFSTR("IsNetworkTethered");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

void ___unavailableAppInstallationQueriesWithDataSeparation_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("iTunesStoreAccountIsActive");
  v4[1] = CFSTR("iTunesStoreAccountHash");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)_unavailableAppInstallationQueriesWithDataSeparation_set;
  _unavailableAppInstallationQueriesWithDataSeparation_set = v2;

}

void ___alwaysAllowedUserQueries_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E20];
  v4[0] = CFSTR("PushToken");
  v4[1] = CFSTR("AwaitingConfiguration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_alwaysAllowedUserQueries_set;
  _alwaysAllowedUserQueries_set = v2;

}

uint64_t ___validDeviceQueriesWithUserEnrollment_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[22];

  v5[21] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E20];
  v5[0] = CFSTR("AppAnalyticsEnabled");
  v5[1] = CFSTR("AvailableDeviceCapacity");
  v5[2] = CFSTR("BatteryLevel");
  v5[3] = CFSTR("BuildVersion");
  v5[4] = CFSTR("DeviceCapacity");
  v5[5] = CFSTR("DeviceName");
  v5[6] = CFSTR("DevicePropertiesAttestation");
  v5[7] = CFSTR("DiagnosticSubmissionEnabled");
  v5[8] = CFSTR("EASDeviceIdentifier");
  v5[9] = CFSTR("IsDeviceLocatorServiceEnabled");
  v5[10] = CFSTR("IsNetworkTethered");
  v5[11] = CFSTR("IsSupervised");
  v5[12] = CFSTR("Model");
  v5[13] = CFSTR("ModelName");
  v5[14] = CFSTR("ModelNumber");
  v5[15] = CFSTR("OSVersion");
  v5[16] = CFSTR("OrganizationInfo");
  v5[17] = CFSTR("ProductName");
  v5[18] = CFSTR("TimeZone");
  v5[19] = CFSTR("SupplementalBuildVersion");
  v5[20] = CFSTR("SupplementalOSVersionExtra");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 21);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_validDeviceQueriesWithUserEnrollment_validMCKeys;
  _validDeviceQueriesWithUserEnrollment_validMCKeys = v2;

  if ((objc_msgSend(MEMORY[0x1E0D1C1E0], "isVisionDevice") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D1C1E0], "isAppleTV") & 1) == 0)
  {
    objc_msgSend((id)_validDeviceQueriesWithUserEnrollment_validMCKeys, "addObject:", CFSTR("CellularTechnology"));
  }
  return objc_msgSend((id)_validDeviceQueriesWithUserEnrollment_validMCKeys, "addObject:", CFSTR("IsMultiUser"));
}

void sub_1D4C0AEFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __sortKeysAndMakeCommaSeparatedString_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D1C088]) & 1) != 0
    || objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D1C068]))
  {
    v6 = *(void **)(a1 + 32);
    v7 = v14;
    v8 = v5;
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = v8;
    if (coerceIntoString_onceToken != -1)
      dispatch_once(&coerceIntoString_onceToken, &__block_literal_global_76);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "stringValue");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)coerceIntoString_dateFormatter, "stringFromDate:", v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
          else
            objc_msgSend(v10, "description");
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v12 = v11;

    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@=\"%@\""), v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v13);
  }

}

uint64_t __coerceIntoString_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)coerceIntoString_dateFormatter;
  coerceIntoString_dateFormatter = v0;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)coerceIntoString_dateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)coerceIntoString_dateFormatter, "setFormatOptions:", 1907);
}

void sub_1D4C0BAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

uint64_t MDMSendManagedBooksChangedNotification()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D4BF7000, v0, OS_LOG_TYPE_DEFAULT, "Sending Managed Books changed notification.", v2, 2u);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("MCManagedBooksChanged"), "UTF8String"));
}

uint64_t MDMSendTriggerRollKeybagsNotification()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D4BF7000, v0, OS_LOG_TYPE_DEFAULT, "Sending rolld notification.", v2, 2u);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.rolld"), "UTF8String"));
}

uint64_t MDMSendManagingOrgInfoChangedNotification()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D4BF7000, v0, OS_LOG_TYPE_DEFAULT, "Sending MDM settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.managedorginfochanged"), "UTF8String"));
}

uint64_t MDMSendDevicePostureChangedNotification()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D4BF7000, v0, OS_LOG_TYPE_DEFAULT, "Sending device posture changed notification.", v2, 2u);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.devicemanagementclient.devicePostureChanged"), "UTF8String"));
}

void sub_1D4C0DD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_1D4C0F534(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DeviceIdentityLibrary()
{
  uint64_t v0;
  void *v2;

  if (!DeviceIdentityLibraryCore_frameworkLibrary)
    DeviceIdentityLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = DeviceIdentityLibraryCore_frameworkLibrary;
  if (!DeviceIdentityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void MDMSharedXPCProtocolInitialize(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  allowedDataClasses();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_notifyNewConfigurationWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_scheduleTokenUpdateWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_scheduleTokenUpdateIfNecessaryWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_simulatePushWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_simulatePushIfNetworkTetheredWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_retryNotNowWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_reauthenticationCompleteWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_pushTokenWithCompletion_, 1, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_touchWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_getAssertionDescriptionsWithCompletion_, 1, 1);

}

id allowedDataClasses()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 11);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void MDMXPCProtocolInitialize(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  MDMSharedXPCProtocolInitialize(v1);
  allowedDataClasses();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_migrateMDMWithContext_completion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_uprootMDMWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_processDeviceRequest_encodeResponse_completion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_processDeviceRequest_encodeResponse_completion_, 1, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_requestInstallOfAppsInRestoreWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_blockAppInstallsWithCompletion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_unblockAppInstallsWithCompletion_, 0, 1);

}

void MDMUserXPCProtocolInitialize(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  MDMSharedXPCProtocolInitialize(v1);
  allowedDataClasses();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_processUserRequest_encodeResponse_completion_, 0, 1);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_processUserRequest_encodeResponse_completion_, 1, 1);

}

void __getLAContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:].cold.1(v0);
}

uint64_t AMFIMDMModeEnroll()
{
  return MEMORY[0x1E0CFDEE0]();
}

uint64_t AMFIMDMModeRemove()
{
  return MEMORY[0x1E0CFDEE8]();
}

uint64_t AMFIProfileRemoveTrust()
{
  return MEMORY[0x1E0CFDEF0]();
}

uint64_t AMFIProfileRequiresReboot()
{
  return MEMORY[0x1E0CFDEF8]();
}

uint64_t AMFIProfileScheduleTrust()
{
  return MEMORY[0x1E0CFDF00]();
}

uint64_t AMFIProfileSetTrust()
{
  return MEMORY[0x1E0CFDF08]();
}

uint64_t AMFISupervisedModeSetState()
{
  return MEMORY[0x1E0CFDF10]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

uint64_t DMCAKAppleIDSession()
{
  return MEMORY[0x1E0D1BFF8]();
}

uint64_t DMCAKAuthenticationIDMSTokenKey()
{
  return MEMORY[0x1E0D1C000]();
}

uint64_t DMCCTIMEI()
{
  return MEMORY[0x1E0D1C008]();
}

uint64_t DMCCTMEID()
{
  return MEMORY[0x1E0D1C010]();
}

uint64_t DMCDeviceManagementDaemonSetupOptionDirectoryPath()
{
  return MEMORY[0x1E0D1C018]();
}

uint64_t DMCErrorArray()
{
  return MEMORY[0x1E0D1C028]();
}

uint64_t DMCHTTPAuthStringWithAuthToken()
{
  return MEMORY[0x1E0D1C048]();
}

uint64_t DMCIOSerialString()
{
  return MEMORY[0x1E0D1C0B8]();
}

uint64_t DMCIsSetupBuddyDone()
{
  return MEMORY[0x1E0D1C0C0]();
}

uint64_t DMCLKLogoutSupportClass()
{
  return MEMORY[0x1E0D1C0C8]();
}

uint64_t DMCLocalizedFormat()
{
  return MEMORY[0x1E0D1C0D0]();
}

uint64_t DMCLocalizedString()
{
  return MEMORY[0x1E0D1C0D8]();
}

uint64_t DMCLocalizedStringByDevice()
{
  return MEMORY[0x1E0D1C0E0]();
}

uint64_t DMCLogObjects()
{
  return MEMORY[0x1E0D1C0E8]();
}

uint64_t DMCSendUPPTrustFailedNotification()
{
  return MEMORY[0x1E0D1C0F0]();
}

uint64_t DMCSendUPPVerificationOfflineNotification()
{
  return MEMORY[0x1E0D1C0F8]();
}

uint64_t DMCUMUserManagerClass()
{
  return MEMORY[0x1E0D1C108]();
}

uint64_t DMCUSEnglishNumberFormatter()
{
  return MEMORY[0x1E0D1C120]();
}

uint64_t DMCUSEnglishString()
{
  return MEMORY[0x1E0D1C128]();
}

uint64_t MDMAppManagementFilePath()
{
  return MEMORY[0x1E0D1C130]();
}

uint64_t MDMCloudConfigurationDetailsFilePath()
{
  return MEMORY[0x1E0D1C140]();
}

uint64_t MDMCloudConfigurationSetAsideDetailsFilePath()
{
  return MEMORY[0x1E0D1C148]();
}

uint64_t MDMFilePath()
{
  return MEMORY[0x1E0D1C158]();
}

uint64_t MDMManagedNonStoreBooksManifestPath()
{
  return MEMORY[0x1E0D1C160]();
}

uint64_t MDMManagedStoreBooksManifestPath()
{
  return MEMORY[0x1E0D1C168]();
}

uint64_t MDMPropertiesFilePath()
{
  return MEMORY[0x1E0D1C178]();
}

uint64_t MDMPropertiesUserFilePath()
{
  return MEMORY[0x1E0D1C180]();
}

uint64_t MDMSetupAssistantSettingsFilePath()
{
  return MEMORY[0x1E0D1C188]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x1E0DE7180]();
}

uint64_t MISEnumerateInstalledProvisioningProfiles()
{
  return MEMORY[0x1E0DE7198]();
}

uint64_t MISEnumerateTrustedUPPs()
{
  return MEMORY[0x1E0DE71B0]();
}

uint64_t MISProfileGetValue()
{
  return MEMORY[0x1E0DE71D8]();
}

uint64_t MISProvisioningProfileGetEntitlements()
{
  return MEMORY[0x1E0DE71F8]();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return MEMORY[0x1E0DE7208]();
}

uint64_t MISProvisioningProfileGrantsEntitlement()
{
  return MEMORY[0x1E0DE7210]();
}

uint64_t MISProvisioningProfileIsAppleInternalProfile()
{
  return MEMORY[0x1E0DE7218]();
}

uint64_t MISProvisioningProfileIsForLocalProvisioning()
{
  return MEMORY[0x1E0DE7220]();
}

uint64_t MISProvisioningProfileProvisionsAllDevices()
{
  return MEMORY[0x1E0DE7228]();
}

uint64_t MISUPPTrusted()
{
  return MEMORY[0x1E0DE7238]();
}

uint64_t MISValidateUPP()
{
  return MEMORY[0x1E0DE7250]();
}

uint64_t MISXMLProvisioningProfileGetDeveloperCertificates()
{
  return MEMORY[0x1E0DE7260]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1E0CD5FF8](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

