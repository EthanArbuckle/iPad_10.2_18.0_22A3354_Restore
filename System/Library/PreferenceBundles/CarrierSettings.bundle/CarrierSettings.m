id PHPreferencesGetValue(void *a1)
{
  return PHPreferencesGetValueInDomain(a1, 0);
}

id PHPreferencesGetValueInDomain(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (-[__CFString length](v3, "length") && -[__CFString length](v4, "length"))
    v6 = (void *)CFPreferencesCopyValue(v3, v4, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  else
    v6 = 0;

  return v6;
}

void PHPreferencesSetValue(void *a1, void *a2)
{
  PHPreferencesSetValueInDomain(a1, a2, 0);
}

void PHPreferencesSetValueInDomain(void *a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFString *key;

  key = a1;
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (-[__CFString length](key, "length") && -[__CFString length](v6, "length"))
  {
    v8 = (const __CFString *)*MEMORY[0x24BDBD590];
    v9 = (const __CFString *)*MEMORY[0x24BDBD588];
    CFPreferencesSetValue(key, v5, v6, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
    CFPreferencesSynchronize(v6, v8, v9);
  }

}

id PHDefaultLog()
{
  if (PHDefaultLog_onceToken != -1)
    dispatch_once(&PHDefaultLog_onceToken, &__block_literal_global);
  return (id)PHDefaultLog_PHDefaultLog;
}

id PHOversizedLog()
{
  if (PHOversizedLog_onceToken != -1)
    dispatch_once(&PHOversizedLog_onceToken, &__block_literal_global_30);
  return (id)PHOversizedLog_PHOversizedLog;
}

id PHOversizedLogQueue()
{
  if (PHOversizedLogQueue_onceToken != -1)
    dispatch_once(&PHOversizedLogQueue_onceToken, &__block_literal_global_32);
  return (id)PHOversizedLogQueue_PHOversizedLogQueue;
}

void SettingRequestCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDC3030]);
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC3048]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDC3050];
  if (objc_msgSend(v11, "isEqual:", *MEMORY[0x24BDC3050]))
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC2F90]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v11;
  }
  v14 = v13;
  objc_msgSend(v7, "pendingRequestForUniqueSettingType:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PHDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412802;
      v21 = v8;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_21ED2A000, v16, OS_LOG_TYPE_DEFAULT, "Request %@ completed with status %@ and response %@", (uint8_t *)&v20, 0x20u);
    }

    objc_msgSend(v7, "receivedRequestResponseForUniqueSettingType:", v14);
    if (objc_msgSend(v11, "isEqualToString:", v12))
    {
      if (v10)
        v17 = v9;
      else
        v17 = 0;
      objc_msgSend(v7, "_handleCallForwardingSettings:didAttemptToSet:forwardingReason:", v17, 0, v14);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDC3058]))
    {
      if (v10)
        v18 = v9;
      else
        v18 = 0;
      objc_msgSend(v7, "_handleCallWaitingSettings:", v18);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDC3060]))
    {
      objc_msgSend(v7, "_handleCallerIDSettings:", v9);
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDC3070]))
    {
      if (v10)
        v19 = v9;
      else
        v19 = 0;
      objc_msgSend(v7, "_handleSIMLockSettings:", v19);
    }
  }

}

void SettingSaveCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a5;
  PHDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_21ED2A000, v10, OS_LOG_TYPE_DEFAULT, "SettingSaveCallback: %@: %@", (uint8_t *)&v22, 0x16u);
  }

  v11 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDC3040]);
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC3048]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDC3050];
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC3050]))
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC2F90]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v12;
  }
  v15 = v14;
  objc_msgSend(v7, "pendingSaveForUniqueSettingType:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v7, "receivedSaveResponseForUniqueSettingType:", v15);
    if (objc_msgSend(v12, "isEqualToString:", v13))
    {
      if (v11)
        v17 = v16;
      else
        v17 = 0;
      objc_msgSend(v7, "_handleCallForwardingSettings:didAttemptToSet:forwardingReason:", v17, 1, v15);
    }
    else if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC3058]))
    {
      if (v11)
        v18 = v16;
      else
        v18 = 0;
      objc_msgSend(v7, "_handleCallWaitingSettings:", v18);
    }
    else if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC3060]))
    {
      if (v11)
        v19 = v16;
      else
        v19 = 0;
      objc_msgSend(v7, "_handleCallerIDSettings:", v19);
    }
    else if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC3070]))
    {
      if (v11)
        v20 = v16;
      else
        v20 = 0;
      objc_msgSend(v7, "_handleSIMLockSettings:", v20);
    }
    else if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC3068]))
    {
      if (v11)
        v21 = v16;
      else
        v21 = 0;
      objc_msgSend(v7, "_handlePINSettings:", v21);
    }
  }
  else if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) == 0
         && (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC3070]) & 1) == 0)
  {
    objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC3068]);
  }

}

void SettingChangedCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a5;
  PHDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_21ED2A000, v10, OS_LOG_TYPE_DEFAULT, "SettingChangedCallback: %@: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC3048]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDC3060]))
    objc_msgSend(v7, "_handleCallerIDChanged");

}

void NetworkListCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a5;
  PHDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_21ED2A000, v10, OS_LOG_TYPE_DEFAULT, "NetworkListCallback: %@: %@", (uint8_t *)&v13, 0x16u);
  }

  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDC2BB0]))
  {
    objc_msgSend(v7, "_handleNetworkList:", 0);
  }
  else
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC2B98]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "_handleNetworkList:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_handleNetworkList:", v12);

    }
  }

}

void OperatorNameChangeCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = a2;
  PHDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_21ED2A000, v10, OS_LOG_TYPE_DEFAULT, "OperatorNameChangeCallback: %@: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("SettingsTelephonyOperatorNameChangedNotification"), v9);

}

void RadioModuleOffErrorCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = a2;
  PHDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_21ED2A000, v10, OS_LOG_TYPE_DEFAULT, "RadioModuleOffErrorCallback: %@: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("SettingsTelephonyRadioModuleOffErrorNotification"), v9);

}

void SIMStatusChangedCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v7, "simLocked:", 0);
  PHDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 1024;
    v18 = v10;
    _os_log_impl(&dword_21ED2A000, v11, OS_LOG_TYPE_DEFAULT, "SIMStatusChangedCallback: name: %@ userInfo: %@ currentSimLockedValue: %u", (uint8_t *)&v13, 0x1Cu);
  }

  if ((v10 & 1) != 0)
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDC2C98]))
      objc_msgSend(v7, "_handleSIMLockSettings:", 0);
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDC2CA8]))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDC2CA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC2CD0]))
    {
      objc_msgSend(v7, "_simRemoved");
LABEL_12:
      objc_msgSend(v7, "_invalidateSIMLockedSetting");
LABEL_15:

      goto LABEL_16;
    }
    if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC2D10]))
    {
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC2D00]))
      {
        objc_msgSend(v7, "_simPUKLocked");
        goto LABEL_12;
      }
      if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDC2CF8]))
        goto LABEL_15;
    }
    objc_msgSend(v7, "_invalidateSIMLockedSetting");
    objc_msgSend(v7, "simLocked:", 1);
    goto LABEL_15;
  }
LABEL_16:

}

void CustomerServiceProfileUpdated(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a5;
  PHDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_21ED2A000, v10, OS_LOG_TYPE_DEFAULT, "CustomerServiceProfileUpdated: %@: %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC2BC0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*MEMORY[0x24BDBD268];

  if (v11 == v12)
    objc_msgSend(v7, "_networkSettingsDisabled");

}

void SIMPhoneBookCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a5;
  if ((id)*MEMORY[0x24BDC2AE8] == v7)
  {
    objc_msgSend(v9, "_phoneBookSelected");
  }
  else if ((id)*MEMORY[0x24BDC2AE0] == v7)
  {
    objc_msgSend(v9, "_phoneNumberSaveFinishedWithSuccess:", 0);
  }
  else if ((id)*MEMORY[0x24BDC2AF0] == v7)
  {
    objc_msgSend(v9, "_phoneNumberWritten");
  }
  else if ((id)*MEMORY[0x24BDC3020] == v7)
  {
    objc_msgSend(v9, "_phoneNumberChanged");
  }

}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void sub_21ED30F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x24BE046F0]();
}

uint64_t CTRegistrationAutomaticallySelectNetwork()
{
  return MEMORY[0x24BDC2640]();
}

uint64_t CTRegistrationCopyLocalizedOperatorName()
{
  return MEMORY[0x24BDC2650]();
}

uint64_t CTRegistrationCopyManualNetworkSelection()
{
  return MEMORY[0x24BDC2658]();
}

uint64_t CTRegistrationGetNetworkSelectionMode()
{
  return MEMORY[0x24BDC2668]();
}

uint64_t CTRegistrationGetNetworkSelectionState()
{
  return MEMORY[0x24BDC2670]();
}

uint64_t CTRegistrationGetStatus()
{
  return MEMORY[0x24BDC2678]();
}

uint64_t CTRegistrationManuallySelectNetwork()
{
  return MEMORY[0x24BDC2680]();
}

uint64_t CTRegistrationNetworkSelectionMenuAvailable()
{
  return MEMORY[0x24BDC2688]();
}

uint64_t CTRegistrationRequestNetworkList()
{
  return MEMORY[0x24BDC2690]();
}

uint64_t CTSIMSupportGetRemainingPINAttempts()
{
  return MEMORY[0x24BDC2698]();
}

uint64_t CTSIMSupportGetSIMStatus()
{
  return MEMORY[0x24BDC26A0]();
}

uint64_t CTSettingCopyMyPhoneNumber()
{
  return MEMORY[0x24BDC26B0]();
}

uint64_t CTSettingRequest()
{
  return MEMORY[0x24BDC26B8]();
}

uint64_t CTSettingSave()
{
  return MEMORY[0x24BDC26C0]();
}

uint64_t CTTelephonyCenterAddObserver()
{
  return MEMORY[0x24BDC26D8]();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return MEMORY[0x24BDC26E0]();
}

uint64_t CTTelephonyCenterRemoveObserver()
{
  return MEMORY[0x24BDC26E8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x24BE04798]();
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x24BE047A0]();
}

uint64_t UIFormattedPhoneNumberFromStringWithCountry()
{
  return MEMORY[0x24BDF78B8]();
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x24BDF7FA0]();
}

uint64_t _CTServerConnectionCopyManualNetworkSelection()
{
  return MEMORY[0x24BDC2848]();
}

uint64_t _CTServerConnectionCopyMobileEquipmentInfo()
{
  return MEMORY[0x24BDC2850]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x24BDC2878]();
}

uint64_t _CTServerConnectionCreateOnRunLoop()
{
  return MEMORY[0x24BDC2880]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x24BDC2888]();
}

uint64_t _CTServerConnectionFetchNetworkList()
{
  return MEMORY[0x24BDC28C0]();
}

uint64_t _CTServerConnectionGetNetworkSelectionState()
{
  return MEMORY[0x24BDC28F0]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x24BDC2928]();
}

uint64_t _CTServerConnectionSavePhonebookEntry()
{
  return MEMORY[0x24BDC2938]();
}

uint64_t _CTServerConnectionSelectNetwork()
{
  return MEMORY[0x24BDC2940]();
}

uint64_t _CTServerConnectionSelectPhonebook()
{
  return MEMORY[0x24BDC2948]();
}

uint64_t _CTServerConnectionUnregisterForAllNotifications()
{
  return MEMORY[0x24BDC2988]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

