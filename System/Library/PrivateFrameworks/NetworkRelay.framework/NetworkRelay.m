void __nrCopyLogObj_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj;
  nrCopyLogObj_sNRLogObj = (uint64_t)v0;

}

id nrCopyLogObj()
{
  if (nrCopyLogObj_onceToken != -1)
    dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
  return (id)nrCopyLogObj_sNRLogObj;
}

__CFString *NRDataProtectionClassCreateString(unsigned int a1)
{
  if (a1 < 5 && ((0x1Bu >> a1) & 1) != 0)
    return off_1EA3F6C10[a1];
  else
    return (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown[%lld]"), a1);
}

__CFString *createStringFromNRDeviceEndpointType(unsigned int a1)
{
  if ((a1 + 1) >= 9u)
    return (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown(%u)"), a1);
  else
    return off_1EA3F6BC8[(a1 + 1)];
}

void __nrCopyLogObj_block_invoke_16()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_14;
  nrCopyLogObj_sNRLogObj_14 = (uint64_t)v0;

}

void sub_1DBD4E09C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void scDynamicStoreCallout(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    if (*(_QWORD *)(a3 + 48) == a1)
      -[NRLaunchEventMonitor processSCDUpdate:](a3, a2);
  }
}

id nrCopyLogObj_25()
{
  if (nrCopyLogObj_onceToken_13 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_13, &__block_literal_global_45);
  return (id)nrCopyLogObj_sNRLogObj_14;
}

uint64_t createStringFromNRLinkType(unsigned int a1)
{
  id v1;
  const char *v2;
  uint64_t result;

  switch(a1)
  {
    case 0u:
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "Invalid";
      goto LABEL_9;
    case 1u:
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "Bluetooth";
      goto LABEL_9;
    case 2u:
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "WiFi";
      goto LABEL_9;
    case 3u:
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "Cellular";
      goto LABEL_9;
    case 4u:
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "QuickRelay";
      goto LABEL_9;
    case 5u:
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "Wired";
LABEL_9:
      result = objc_msgSend(v1, "initWithUTF8String:", v2);
      break;
    default:
      result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%lld)"), a1);
      break;
  }
  return result;
}

uint64_t createStringFromNRLinkSubtype(unsigned int a1)
{
  id v1;
  const char *v2;

  switch(a1)
  {
    case 'e':
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "WiFiInfra";
      return objc_msgSend(v1, "initWithUTF8String:", v2);
    case 'f':
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "WiFiP2PAWDL";
      return objc_msgSend(v1, "initWithUTF8String:", v2);
    case 'g':
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "WiFiP2PNAN";
      return objc_msgSend(v1, "initWithUTF8String:", v2);
    case 'h':
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "WiFiP2PInfraRelay";
      return objc_msgSend(v1, "initWithUTF8String:", v2);
    default:
      if (a1)
        return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%lld)"), a1);
      v1 = objc_alloc(MEMORY[0x1E0CB3940]);
      v2 = "None";
      return objc_msgSend(v1, "initWithUTF8String:", v2);
  }
}

__CFString *createShortStringFromNRLinkType(char a1)
{
  if ((a1 - 1) >= 4u)
    return (__CFString *)createStringFromNRLinkType(a1);
  else
    return off_1EA3F6D10[(a1 - 1)];
}

__CFString *createShortStringFromNRLinkSubtype(char a1)
{
  if ((a1 - 101) >= 4u)
    return (__CFString *)createStringFromNRLinkSubtype(a1);
  else
    return off_1EA3F6D30[(a1 - 101)];
}

id nrCopyLogObj_68()
{
  if (nrCopyLogObj_onceToken_76 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_76, &__block_literal_global_50);
  return (id)nrCopyLogObj_sNRLogObj_77;
}

void __nrCopyLogObj_block_invoke_78()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_77;
  nrCopyLogObj_sNRLogObj_77 = (uint64_t)v0;

}

void NRPreferP2PImmediatelySet(char a1)
{
  NSObject *v2;
  id v3;
  _QWORD v4[5];
  char v5;

  objc_opt_self();
  if (sharedInstanceForP2PImmediate_onceToken != -1)
    dispatch_once(&sharedInstanceForP2PImmediate_onceToken, &__block_literal_global_2);
  if (sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance)
  {
    v2 = *(NSObject **)(sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance + 16);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __30__NRPreferWiFi_submitRequest___block_invoke;
    v4[3] = &unk_1EA3F6FD0;
    v4[4] = sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance;
    v5 = a1;
    v3 = (id)sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance;
    dispatch_async(v2, v4);

  }
}

void NRPreferP2PSet(char a1)
{
  NSObject *v2;
  id v3;
  _QWORD v4[5];
  char v5;

  objc_opt_self();
  if (sharedInstanceForP2P_onceToken != -1)
    dispatch_once(&sharedInstanceForP2P_onceToken, &__block_literal_global_1);
  if (sharedInstanceForP2P_gPreferP2PWiFiInstance)
  {
    v2 = *(NSObject **)(sharedInstanceForP2P_gPreferP2PWiFiInstance + 16);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __30__NRPreferWiFi_submitRequest___block_invoke;
    v4[3] = &unk_1EA3F6FD0;
    v4[4] = sharedInstanceForP2P_gPreferP2PWiFiInstance;
    v5 = a1;
    v3 = (id)sharedInstanceForP2P_gPreferP2PWiFiInstance;
    dispatch_async(v2, v4);

  }
}

void NRPreferWiFiSet(char a1)
{
  NSObject *v2;
  id v3;
  _QWORD v4[5];
  char v5;

  objc_opt_self();
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_83);
  if (sharedInstance_gPreferWiFiInstance)
  {
    v2 = *(NSObject **)(sharedInstance_gPreferWiFiInstance + 16);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __30__NRPreferWiFi_submitRequest___block_invoke;
    v4[3] = &unk_1EA3F6FD0;
    v4[4] = sharedInstance_gPreferWiFiInstance;
    v5 = a1;
    v3 = (id)sharedInstance_gPreferWiFiInstance;
    dispatch_async(v2, v4);

  }
}

void sub_1DBD50FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_NRCopyPolicyTrafficClassifiersDescription(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    if (v2 == 1)
    {
      objc_msgSend(v1, "anyObject");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ids.trafficclass.nanoregistry.check")) & 1) != 0)
      {
        v4 = CFSTR("Check");
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ids.trafficclass.nanoregistry.update")) & 1) != 0)
      {
        v4 = CFSTR("Update");
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ids.trafficclass.nanoregistry.configure")) & 1) != 0)
      {
        v4 = CFSTR("Configure");
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ids.trafficclass.all")) & 1) != 0)
      {
        v4 = CFSTR("All");
      }
      else
      {
        v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\"%@\""), v3);
      }
    }
    else
    {
      objc_msgSend(v1, "allObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{("));
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v3 = v6;
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        v10 = "";
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v3);
          -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%s\"%@\""), v10, **((_QWORD **)&v13 + 1), (_QWORD)v13);
          if (v8 >= 2)
          {
            for (i = 1; i != v8; ++i)
            {
              if (*(_QWORD *)v14 != v9)
                objc_enumerationMutation(v3);
              -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%s\"%@\""), ", ", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
            }
          }
          v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          v10 = ", ";
        }
        while (v8);
      }

      -[__CFString appendString:](v4, "appendString:", CFSTR(")}"));
    }

  }
  else
  {
    v4 = CFSTR("Null");
  }

  return v4;
}

void sub_1DBD51CEC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_115()
{
  if (nrCopyLogObj_onceToken_109 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_109, &__block_literal_global_110);
  return (id)nrCopyLogObj_sNRLogObj_111;
}

double __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = 136446978;
  *(_DWORD *)a1 = 136446978;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = 0;
  *(_WORD *)(a1 + 22) = 2048;
  *(_QWORD *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 1024;
  *(_DWORD *)(a1 + 34) = 0;
  return result;
}

double __os_log_helper_1_2_3_8_34_8_0_4_0(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = 136446722;
  *(_DWORD *)a1 = 136446722;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = 0;
  *(_WORD *)(a1 + 22) = 1024;
  *(_DWORD *)(a1 + 24) = 0;
  return result;
}

void __nrCopyLogObj_block_invoke_151()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_111;
  nrCopyLogObj_sNRLogObj_111 = (uint64_t)v0;

}

void sub_1DBD531C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void __nrCopyLogObj_block_invoke_221()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_217;
  nrCopyLogObj_sNRLogObj_217 = (uint64_t)v0;

}

id nrCopyLogObj_222()
{
  if (nrCopyLogObj_onceToken_215 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_215, &__block_literal_global_216);
  return (id)nrCopyLogObj_sNRLogObj_217;
}

void sub_1DBD53CA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1DBD56810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBD57118(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_322()
{
  if (nrCopyLogObj_onceToken_331 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_331, &__block_literal_global_332);
  return (id)nrCopyLogObj_sNRLogObj_333;
}

void __nrCopyLogObj_block_invoke_334()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_333;
  nrCopyLogObj_sNRLogObj_333 = (uint64_t)v0;

}

void _NRLogSetCopyToStderr(char a1)
{
  os_unfair_lock_lock(&sNRLogLock);
  sNRCopyLogToStdErr = a1;
  os_unfair_lock_unlock(&sNRLogLock);
}

uint64_t _NRLogSetPacketLoggingState(uint64_t result)
{
  gNRPacketLoggingEnabled = result;
  return result;
}

BOOL _NRLogIsLevelEnabled(NSObject *a1, os_log_type_t a2)
{
  return sNRCopyLogToStdErr || os_log_type_enabled(a1, a2);
}

void _NRLogAbortWithPack(void *a1)
{
  id v1;

  v1 = a1;
  qword_1F0312E20 = os_log_pack_compose();
  __break(1u);
}

const __CFString *_NRCopyTimeStringForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  if (!a1)
    return CFSTR("nil");
  v1 = (void *)MEMORY[0x1E0C99D48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 224, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v6 = v5;

  v7 = v6 - floor(v6) + (double)objc_msgSend(v4, "second");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%02u:%02u:%07.4f"), objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), *(_QWORD *)&v7);

  return (const __CFString *)v8;
}

const __CFString *_NRCopyTimeString()
{
  void *v0;
  const __CFString *v1;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = _NRCopyTimeStringForDate(v0);

  return v1;
}

void _NRLogRegisterSimCrashHook(void *a1)
{
  os_unfair_lock_lock(&sNRLogLock);
  sNRLogSimCrashHook = a1;
  os_unfair_lock_unlock(&sNRLogLock);
}

void _NRLogPackSend(void *a1, uint64_t a2, int a3)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  char *v8;
  tm *v9;
  void (*v10)(void);
  void *v11;
  tm v12;
  char v13[9];
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = v5;
  if (a3 == 17 || sNRCopyLogToStdErr)
  {
    if (os_log_type_enabled(v5, (os_log_type_t)a3))
    {
      v7 = os_log_pack_send_and_compose();
    }
    else
    {
      mach_get_times();
      v7 = os_log_pack_compose();
    }
    v8 = (char *)v7;
    os_unfair_lock_lock(&sNRLogLock);
    if (sNRCopyLogToStdErr)
    {
      nrLogLevelToString(a3);
      if ((_NRLogPackSend_sHasSetTZ & 1) == 0)
      {
        tzset();
        _NRLogPackSend_sHasSetTZ = 1;
      }
      memset(&v12, 0, sizeof(v12));
      v9 = localtime_r((const time_t *)(a2 + 8), &v12);
      if (strftime(v13, 9uLL, "%T", v9))
      {
        v13[8] = 0;
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s %s.%04ld %s\n");
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s %s\n");
      }
    }
    v10 = (void (*)(void))sNRLogSimCrashHook;
    os_unfair_lock_unlock(&sNRLogLock);
    if (a3 == 17 && v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v8);
      v10();

    }
    if (v8 != &v14 && v8)
      free(v8);
  }
  else if (os_log_type_enabled(v5, (os_log_type_t)a3))
  {
    os_log_pack_send();
  }

}

const char *nrLogLevelToString(int a1)
{
  const char *result;

  result = "DEFLT";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "INFO ";
      break;
    case 2:
      result = "DEBUG";
      break;
    case 16:
      result = "ERROR";
      break;
    case 17:
      result = "FAULT";
      break;
    default:
      result = "?????";
      break;
  }
  return result;
}

void _NRAddEligibleNRUUIDForLogObject(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;

  v4 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  v1 = (void *)sNRUUIDsEligibleForLogObject;
  if (!sNRUUIDsEligibleForLogObject)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v3 = (void *)sNRUUIDsEligibleForLogObject;
    sNRUUIDsEligibleForLogObject = (uint64_t)v2;

    v1 = (void *)sNRUUIDsEligibleForLogObject;
  }
  objc_msgSend(v1, "addObject:", v4);
  os_unfair_lock_unlock(&sNRLogLock);

}

void _NRRemoveEligibleNRUUIDForLogObject(void *a1)
{
  id v1;

  v1 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  objc_msgSend((id)sNRUUIDsEligibleForLogObject, "removeObject:", v1);

  os_unfair_lock_unlock(&sNRLogLock);
}

void _NRUpdateNRUUIDsEligibleForLogObjects(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  if (objc_msgSend((id)sNRUUIDToLogObject, "count"))
  {
    objc_msgSend((id)sNRUUIDToLogObject, "allKeys");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "copy");

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v32;
      *(_QWORD *)&v6 = 138412290;
      v25 = v6;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((objc_msgSend(v1, "containsObject:", v10, v25) & 1) == 0)
          {
            if (nrCopyLogObj_onceToken_383 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
            v11 = nrCopyLogObj_sNRLogObj_384;
            if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_384, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v25;
              v37 = v10;
              _os_log_impl(&dword_1DBD4B000, v11, OS_LOG_TYPE_DEFAULT, "removing log object for %@", buf, 0xCu);
            }
            objc_msgSend((id)sNRUUIDToLogObject, "setObject:forKeyedSubscript:", 0, v10);
          }
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v7);
    }

  }
  if (objc_msgSend((id)sNRUUIDToEventLogObject, "count"))
  {
    objc_msgSend((id)sNRUUIDToEventLogObject, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v28;
      *(_QWORD *)&v16 = 138412290;
      v26 = v16;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          if ((objc_msgSend(v1, "containsObject:", v20, v26, (_QWORD)v27) & 1) == 0)
          {
            if (nrCopyLogObj_onceToken_383 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
            v21 = nrCopyLogObj_sNRLogObj_384;
            if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_384, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              v37 = v20;
              _os_log_impl(&dword_1DBD4B000, v21, OS_LOG_TYPE_DEFAULT, "removing event log object for %@", buf, 0xCu);
            }
            objc_msgSend((id)sNRUUIDToEventLogObject, "setObject:forKeyedSubscript:", 0, v20);
          }
        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v17);
    }

  }
  v22 = (void *)sNRUUIDsEligibleForLogObject;
  if (!sNRUUIDsEligibleForLogObject)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v24 = (void *)sNRUUIDsEligibleForLogObject;
    sNRUUIDsEligibleForLogObject = (uint64_t)v23;

    v22 = (void *)sNRUUIDsEligibleForLogObject;
  }
  objc_msgSend(v22, "removeAllObjects");
  objc_msgSend((id)sNRUUIDsEligibleForLogObject, "addObjectsFromArray:", v1);
  os_unfair_lock_unlock(&sNRLogLock);

}

void __nrCopyLogObj_block_invoke_385()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_384;
  nrCopyLogObj_sNRLogObj_384 = (uint64_t)v0;

}

os_log_t _NRCopyLogObjectForNRUUID(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  os_log_t v6;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  v2 = (void *)sNRUUIDToLogObject;
  if (!sNRUUIDToLogObject)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)sNRUUIDToLogObject;
    sNRUUIDToLogObject = (uint64_t)v3;

    v2 = (void *)sNRUUIDToLogObject;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (os_log_t)v5;
    os_unfair_lock_unlock(&sNRLogLock);
    goto LABEL_5;
  }
  if ((objc_msgSend((id)sNRUUIDsEligibleForLogObject, "containsObject:", v1) & 1) == 0)
  {
    os_unfair_lock_unlock(&sNRLogLock);
LABEL_12:
    if (nrCopyLogObj_onceToken_383 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
    v6 = (os_log_t)(id)nrCopyLogObj_sNRLogObj_384;
    goto LABEL_5;
  }
  objc_msgSend(v1, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringToIndex:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v9);
  v6 = os_log_create("com.apple.networkrelay", (const char *)objc_msgSend(v10, "UTF8String"));
  v11 = nrCopyLogObj_390();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v1;
    _os_log_impl(&dword_1DBD4B000, v11, OS_LOG_TYPE_DEFAULT, "adding log object for %@", buf, 0xCu);
  }

  objc_msgSend((id)sNRUUIDToLogObject, "setObject:forKeyedSubscript:", v6, v1);
  os_unfair_lock_unlock(&sNRLogLock);
  if (!v6)
    goto LABEL_12;
LABEL_5:

  return v6;
}

id nrCopyLogObj_390()
{
  if (nrCopyLogObj_onceToken_383 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
  return (id)nrCopyLogObj_sNRLogObj_384;
}

os_log_t _NRCopyEventLogObjectForNRUUID(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  os_log_t v6;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  v2 = (void *)sNRUUIDToEventLogObject;
  if (!sNRUUIDToEventLogObject)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)sNRUUIDToEventLogObject;
    sNRUUIDToEventLogObject = (uint64_t)v3;

    v2 = (void *)sNRUUIDToEventLogObject;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (os_log_t)v5;
    os_unfair_lock_unlock(&sNRLogLock);
    goto LABEL_5;
  }
  if ((objc_msgSend((id)sNRUUIDsEligibleForLogObject, "containsObject:", v1) & 1) == 0)
  {
    os_unfair_lock_unlock(&sNRLogLock);
LABEL_12:
    if (nrCopyLogObj_onceToken_383 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
    v6 = (os_log_t)(id)nrCopyLogObj_sNRLogObj_384;
    goto LABEL_5;
  }
  objc_msgSend(v1, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringToIndex:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.events"), v9);
  v6 = os_log_create("com.apple.networkrelay", (const char *)objc_msgSend(v10, "UTF8String"));
  v11 = nrCopyLogObj_390();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v1;
    _os_log_impl(&dword_1DBD4B000, v11, OS_LOG_TYPE_DEFAULT, "adding event log object for %@", buf, 0xCu);
  }

  objc_msgSend((id)sNRUUIDToEventLogObject, "setObject:forKeyedSubscript:", v6, v1);
  os_unfair_lock_unlock(&sNRLogLock);
  if (!v6)
    goto LABEL_12;
LABEL_5:

  return v6;
}

void _NRLogWithArgs(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  __CFString *v15;
  void (*v16)(void *);

  os_log_with_args();
  if (a2 == 17 || sNRCopyLogToStdErr)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
    v13 = (void *)objc_msgSend(v11, "initWithFormat:arguments:", v12, &a9);

    os_unfair_lock_lock(&sNRLogLock);
    if (sNRCopyLogToStdErr)
    {
      v14 = nrLogLevelToString(a2);
      v15 = (__CFString *)_NRCopyTimeString();
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s %s %s\n", v14, (const char *)-[__CFString UTF8String](v15, "UTF8String"), (const char *)objc_msgSend(v13, "UTF8String"));

    }
    v16 = (void (*)(void *))sNRLogSimCrashHook;
    os_unfair_lock_unlock(&sNRLogLock);
    if (a2 == 17)
    {
      if (v16)
        v16(v13);
    }

  }
}

__CFString *_NRCreateMACAddressString(void *a1)
{
  id v1;
  __CFString *v2;
  unsigned __int8 *v3;
  unint64_t v4;

  v1 = a1;
  if (v1)
  {
    v2 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v3 = (unsigned __int8 *)objc_msgSend(v1, "bytes");
    if (objc_msgSend(v1, "length"))
    {
      -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%02X"), *v3);
      if ((unint64_t)objc_msgSend(v1, "length") >= 2)
      {
        v4 = 1;
        do
          -[__CFString appendFormat:](v2, "appendFormat:", CFSTR(":%02X"), v3[v4++]);
        while (v4 < objc_msgSend(v1, "length"));
      }
    }
  }
  else
  {
    v2 = CFSTR("[nil]");
  }

  return v2;
}

__CFString *_NRCreateDataStringTruncated(void *a1, unsigned int a2)
{
  id v3;
  __CFString *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unsigned int v9;

  v3 = a1;
  if (!v3)
  {
    v4 = CFSTR("[nil]");
    goto LABEL_13;
  }
  v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("[%llu:"), objc_msgSend(v3, "length"));
  v5 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v6 = objc_msgSend(v3, "length");
  v7 = v6;
  if (a2)
  {
    if (v6 >= a2)
      v7 = a2;
    v8 = v7 != objc_msgSend(v3, "length");
    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  v8 = 0;
  if (v6)
  {
    do
    {
LABEL_9:
      v9 = *v5++;
      -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%02X"), v9);
      --v7;
    }
    while (v7);
  }
LABEL_10:
  if (v8)
    -[__CFString appendString:](v4, "appendString:", CFSTR("..."));
  -[__CFString appendString:](v4, "appendString:", CFSTR("]"));
LABEL_13:

  return v4;
}

__CFString *_NRCreateDataString(void *a1)
{
  id v1;
  __CFString *v2;
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v1 = a1;
  if (v1)
  {
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("[%llu:"), objc_msgSend(v1, "length"));
    v3 = (unsigned __int8 *)objc_msgSend(v1, "bytes");
    v4 = objc_msgSend(v1, "length");
    if (v4)
    {
      v5 = v4;
      do
      {
        v6 = *v3++;
        -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%02X"), v6);
        --v5;
      }
      while (v5);
    }
    -[__CFString appendString:](v2, "appendString:", CFSTR("]"));
  }
  else
  {
    v2 = CFSTR("[nil]");
  }

  return v2;
}

uint64_t _NRIsAppleInternal()
{
  if (_NRIsAppleInternal_onceToken != -1)
    dispatch_once(&_NRIsAppleInternal_onceToken, &__block_literal_global_409);
  return _NRIsAppleInternal_internal;
}

uint64_t _NRShouldDebugAutoRelease()
{
  if (_NRShouldDebugAutoRelease_onceToken != -1)
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_30);
  return _NRShouldDebugAutoRelease_debugAutoRelease;
}

uint64_t _NRCopySerialQueueAttr()
{
  if (_NRShouldDebugAutoRelease_onceToken != -1)
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_30);
  if ((_NRShouldDebugAutoRelease_debugAutoRelease & 1) != 0)
    return 0;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  return objc_claimAutoreleasedReturnValue();
}

void NRTLVAddData(void *a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  NRTLVAdd(v6, a2, (unsigned __int16)objc_msgSend(v5, "length"), objc_msgSend(v5, "bytes"));

}

void NRTLVAdd(void *a1, char a2, unsigned int a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int16 v27;

  v7 = a1;
  v8 = v7;
  if (!v7)
  {
    v16 = nrCopyLogObj_390();
    v17 = v16;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v18 = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);

      if (!v18)
        goto LABEL_18;
    }
    v19 = nrCopyLogObj_390();
    _NRLogWithArgs((uint64_t)v19, 17, (uint64_t)"%s called with null tlvData", v20, v21, v22, v23, v24, (uint64_t)"NRTLVAdd");

    goto LABEL_18;
  }
  if (objc_msgSend(v7, "length") + (unint64_t)a3 < 0x10000)
  {
    if ((a3 || !a4) && (!a3 || a4))
    {
      v26 = a2;
      v27 = __rev16(a3);
      objc_msgSend(v8, "appendBytes:length:", &v26, 3);
      if (a4)
        objc_msgSend(v8, "appendBytes:length:", a4, a3);
    }
    else
    {
      if (nrCopyLogObj_onceToken_383 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_384, OS_LOG_TYPE_FAULT))
      {
        v14 = nrCopyLogObj_sNRLogObj_384;
        v15 = "invalid tlv length and value";
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_383 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_384, OS_LOG_TYPE_FAULT))
    {
      v14 = nrCopyLogObj_sNRLogObj_384;
      v15 = "tlv buffer full";
LABEL_17:
      _NRLogWithArgs(v14, 17, (uint64_t)v15, v9, v10, v11, v12, v13, v25);
    }
  }
LABEL_18:

}

BOOL NRTLVParse(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  int v13;
  uint64_t v14;
  unsigned __int16 v15;
  _BOOL8 v16;
  unsigned __int16 v18;
  unsigned __int16 v19;
  unint64_t v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _BOOL4 v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;

  v3 = a1;
  v4 = a2;
  v5 = (uint64_t (**)(_QWORD, _QWORD))v4;
  if (!v3)
  {
    v22 = nrCopyLogObj_390();
    v23 = v22;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v26 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);

      if (!v26)
        goto LABEL_11;
    }
    v27 = nrCopyLogObj_390();
    _NRLogWithArgs((uint64_t)v27, 17, (uint64_t)"%s called with null tlvData", v28, v29, v30, v31, v32, (uint64_t)"NRTLVParse");
LABEL_38:

    goto LABEL_11;
  }
  if (!v4)
  {
    v24 = nrCopyLogObj_390();
    v25 = v24;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v33 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v33)
        goto LABEL_11;
    }
    v27 = nrCopyLogObj_390();
    _NRLogWithArgs((uint64_t)v27, 17, (uint64_t)"%s called with null block", v34, v35, v36, v37, v38, (uint64_t)"NRTLVParse");
    goto LABEL_38;
  }
  if ((unint64_t)objc_msgSend(v3, "length") < 0x10000)
  {
    v14 = objc_msgSend(v3, "bytes");
    v15 = objc_msgSend(v3, "length");
    if (v15 >= 3uLL)
    {
      v18 = v15;
      v19 = 0;
      while (1)
      {
        v16 = v18 <= v19;
        if (v18 <= v19)
          goto LABEL_12;
        if ((unsigned __int16)(v18 - v19) <= 2u)
          break;
        v20 = (bswap32(*(unsigned __int16 *)(v14 + 1)) >> 16) + 3;
        if (v20 > (unsigned __int16)(v18 - v19))
        {
          if (nrCopyLogObj_onceToken_383 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_384, OS_LOG_TYPE_ERROR))
          {
            v11 = nrCopyLogObj_sNRLogObj_384;
            v39 = "";
            v12 = "%s%.30s:%-4d Invalid tlv buffer (%u < %zu + %u)";
            goto LABEL_29;
          }
          goto LABEL_11;
        }
        v21 = v5[2](v5, v14);
        v14 += v20;
        v19 += v20;
        if ((v21 & 1) == 0)
          goto LABEL_11;
      }
      if (nrCopyLogObj_onceToken_383 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_384, OS_LOG_TYPE_ERROR))
      {
        v11 = nrCopyLogObj_sNRLogObj_384;
        v39 = "";
        v12 = "%s%.30s:%-4d Incomplete tlv buffer (%u < %zu)";
LABEL_29:
        v13 = 16;
        goto LABEL_9;
      }
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_383 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_383, &__block_literal_global_47);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_384, OS_LOG_TYPE_FAULT))
    {
      v11 = nrCopyLogObj_sNRLogObj_384;
      v12 = "tlv buffer larger than expected";
      v13 = 17;
LABEL_9:
      _NRLogWithArgs(v11, v13, (uint64_t)v12, v6, v7, v8, v9, v10, (uint64_t)v39);
    }
  }
LABEL_11:
  v16 = 0;
LABEL_12:

  return v16;
}

id nrCopyLogObj_433()
{
  if (nrCopyLogObj_onceToken_438 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_438, &__block_literal_global_439);
  return (id)nrCopyLogObj_sNRLogObj_440;
}

void __nrCopyLogObj_block_invoke_441()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_440;
  nrCopyLogObj_sNRLogObj_440 = (uint64_t)v0;

}

id NRLPCopyUInt64NSNumberFromXPCDict(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a1;
  if (!a2)
  {
    v9 = nrCopyLogObj_433();
    v10 = v9;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
        goto LABEL_12;
    }
    v12 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (xpcKey) != ((void *)0)", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_12;
  }
  v4 = v3;
  xpc_dictionary_get_value(v3, a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && MEMORY[0x1DF0BA7A8](v5) == MEMORY[0x1E0C81398])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", xpc_uint64_get_value(v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_6;
    v20 = nrCopyLogObj_433();
    v21 = v20;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v22 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (!v22)
      {
LABEL_12:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v18 = _os_log_pack_fill();
        *(_DWORD *)v18 = 136446210;
        *(_QWORD *)(v18 + 4) = "NRLPCopyUInt64NSNumberFromXPCDict";
        v19 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v19);
      }
    }
    v23 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v23, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (retNum) != ((void *)0)", v24, v25, v26, v27, v28, (uint64_t)"");

    goto LABEL_12;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

id checkAndCapValue(void *a1)
{
  id v1;
  unint64_t v2;
  id v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = a1;
  v2 = objc_msgSend(v1, "unsignedLongLongValue");
  if (HIDWORD(v2))
  {
    v5 = v2;
    v6 = nrCopyLogObj_433();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v7 = v6;
      v8 = os_log_type_enabled(v6, OS_LOG_TYPE_FAULT);

      if (!v8)
      {
LABEL_8:
        v3 = &unk_1EA400E28;
        goto LABEL_3;
      }
    }
    v9 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v9, 17, (uint64_t)"%llu > UINT32_MAX, capping", v10, v11, v12, v13, v14, v5);

    goto LABEL_8;
  }
  v3 = v1;
LABEL_3:

  return v3;
}

void NRLPAddUint64ToXPCDict(void *a1, const char *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;

  v26 = a1;
  v5 = a3;
  if (!v26)
  {
    v6 = nrCopyLogObj_433();
    v7 = v6;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
        goto LABEL_16;
    }
    v12 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (xpcDict) != ((void *)0)", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_16;
  }
  if (!a2)
  {
    v9 = nrCopyLogObj_433();
    v10 = v9;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
      {
LABEL_16:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v24 = _os_log_pack_fill();
        *(_DWORD *)v24 = 136446210;
        *(_QWORD *)(v24 + 4) = "NRLPAddUint64ToXPCDict";
        v25 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v25);
      }
    }
    v18 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v18, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (xpcKey) != ((void *)0)", v19, v20, v21, v22, v23, (uint64_t)"");

    goto LABEL_16;
  }
  if (v5)
    xpc_dictionary_set_uint64(v26, a2, objc_msgSend(v5, "unsignedLongLongValue"));

}

id nrCopyLogObj_506()
{
  if (nrCopyLogObj_onceToken_509 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_509, &__block_literal_global_353);
  return (id)nrCopyLogObj_sNRLogObj_510;
}

void __nrCopyLogObj_block_invoke_511()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_510;
  nrCopyLogObj_sNRLogObj_510 = (uint64_t)v0;

}

double __os_log_helper_1_2_3_8_34_8_0_8_0(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = 136446722;
  *(_DWORD *)a1 = 136446722;
  *(_QWORD *)(a1 + 4) = "strict_calloc";
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = 1;
  *(_WORD *)(a1 + 22) = 2048;
  *(_QWORD *)(a1 + 24) = a2;
  return result;
}

void NRParserLinkWriteAvailable(uint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  void *v9;
  id v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  _QWORD *v14;
  void (*v15)(uint64_t);
  char v16;
  int v17;
  const char *v18;
  os_log_t v19;
  os_log_t v20;
  int v21;
  unsigned __int8 *v22;
  void *v23;
  id v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  _QWORD *v28;
  void (*v29)(uint64_t);
  char v30;
  int v31;
  const char *v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  int v40;
  int v41;
  id *v42;
  void **v43;
  id *v44;
  void (*v45)(uint64_t);
  uint64_t *v46;
  _QWORD *v47;
  void *v48;
  id v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  char v53;
  const char *v54;
  _QWORD *v55;
  uint64_t v56;
  int v57;
  __int16 v58;
  const char *v59;
  int v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  int v64;
  os_log_t v65;
  os_log_t v66;
  _BOOL4 v67;
  os_log_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  os_log_t v74;
  os_log_t v75;
  os_log_t v76;
  _BOOL4 v77;
  os_log_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t v87;
  size_t v88;
  char *v89;
  unsigned int v90;
  unsigned int v91;
  int v92;
  os_log_t v93;
  unsigned int v94;
  unsigned int v95;
  uint64_t v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned __int16 v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  unsigned int v107;
  unsigned int v108;
  os_log_t v109;
  os_log_t v110;
  os_log_t v111;
  os_log_t v112;
  os_log_t v113;
  os_log_t v114;
  _BOOL4 v115;
  os_log_t v116;
  uint64_t v117;
  unsigned int v118;
  _BOOL4 valid;
  uint64_t v120;
  unsigned int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  os_log_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  os_log_t v133;
  _BOOL4 v134;
  os_log_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  os_log_t v141;
  int v142;
  _BOOL4 v143;
  uint64_t v144;
  char v145;
  int v146;
  unint64_t v147;
  os_log_t v148;
  os_log_t v149;
  uint64_t v150;
  os_log_t v151;
  os_log_t v152;
  uint64_t v153;
  os_log_t v154;
  os_log_t v155;
  uint64_t v156;
  uint64_t v157;
  os_log_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  unsigned int v165;
  unsigned int v166;
  os_log_t v167;
  os_log_t v168;
  os_log_t v169;
  os_log_t v170;
  os_log_t v171;
  os_log_t v172;
  os_log_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  os_log_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  os_log_t v185;
  os_log_t v186;
  os_log_t v187;
  os_log_t v188;
  os_log_t v189;
  os_log_t v190;
  os_log_t v191;
  os_log_t v192;
  os_log_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  os_log_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  os_log_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  os_log_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  os_log_t v217;
  os_log_t v218;
  os_log_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  _BOOL4 v240;
  int v241;
  os_log_t v242;
  os_log_t v243;
  _BOOL4 v244;
  os_log_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  unsigned int v251;
  unsigned int v252;
  unsigned int v253;
  os_log_t v254;
  os_log_t v255;
  os_log_t v256;
  os_log_t v257;
  _BOOL4 v258;
  os_log_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  _BOOL4 v265;
  os_log_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  dispatch_object_t *v273;
  os_log_t v274;
  os_log_t v275;
  uint64_t v276;
  uint64_t v277;
  os_log_t v278;
  os_log_t v279;
  unsigned int v280;
  unsigned int v281;
  os_log_t v282;
  os_log_t v283;
  uint64_t v284;
  os_log_t v285;
  os_log_t v286;
  os_log_t v287;
  os_log_t v288;
  _BOOL4 v289;
  os_log_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  _BOOL4 v296;
  os_log_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  _BOOL4 v303;
  os_log_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  os_log_t v310;
  os_log_t v311;
  os_log_t v312;
  os_log_t v313;
  os_log_t v314;
  os_log_t v315;
  _BOOL4 v316;
  os_log_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  _BOOL4 v323;
  os_log_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  _BOOL4 v330;
  os_log_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  os_log_t v337;
  os_log_t v338;
  os_log_t v339;
  os_log_t v340;
  os_log_t v341;
  os_log_t v342;
  os_log_t v343;
  os_log_t v344;
  os_log_t v345;
  os_log_t v346;
  _BOOL4 v347;
  os_log_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  _BOOL4 v354;
  os_log_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  id *v361;
  _BOOL4 v362;
  os_log_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  _BOOL4 v369;
  os_log_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  _BOOL4 v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  _BOOL4 v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  _BOOL4 v388;
  os_log_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  os_log_t v395;
  os_log_t v396;
  _BOOL4 v397;
  os_log_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  id v405;
  uint64_t v406;
  os_log_t v407;
  os_log_t v408;
  os_log_t v409;
  os_log_t v410;
  os_log_t v411;
  os_log_t v412;
  _BOOL4 v413;
  os_log_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  NSObject *v420;
  NSObject *v421;
  os_log_t v422;
  os_log_t v423;
  _BOOL4 v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  _BOOL4 v430;
  os_log_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  os_log_t v437;
  os_log_t v438;
  os_log_t v439;
  os_log_t v440;
  _BOOL4 v441;
  os_log_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  _BOOL4 v448;
  os_log_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  _QWORD *v455;
  uint64_t v456;
  uint64_t v457;
  int v458;
  __int16 v459;
  void (*v460)(uint64_t);
  int v461;
  uint64_t v462;
  uint64_t v463;
  int v464;
  os_log_t v465;
  os_log_t v466;
  _BOOL4 v467;
  os_log_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  os_log_t v476;
  os_log_t v477;
  _BOOL4 v478;
  os_log_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  int v485;
  uint64_t v486;
  unsigned int v487;
  uint64_t v488;
  size_t v489;
  void (*v490)(uint64_t);
  unsigned int v491;
  unsigned int v492;
  int v493;
  uint64_t v494;
  unsigned int v495;
  unsigned int v496;
  uint64_t v497;
  unsigned int v498;
  unsigned __int16 v499;
  int v500;
  unsigned __int8 *v501;
  uint64_t v502;
  uint64_t v503;
  unsigned int v504;
  unsigned int v505;
  os_log_t v506;
  os_log_t v507;
  os_log_t v508;
  os_log_t v509;
  NSObject *v510;
  NSObject *v511;
  _BOOL4 v512;
  os_log_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  _BOOL4 v519;
  os_log_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  os_log_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  int v532;
  uint64_t v533;
  char v534;
  int v535;
  unint64_t v536;
  os_log_t v537;
  os_log_t v538;
  uint64_t v539;
  os_log_t v540;
  os_log_t v541;
  uint64_t v542;
  uint64_t v543;
  os_log_t v544;
  os_log_t v545;
  uint64_t v546;
  _BOOL4 v547;
  os_log_t v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  unint64_t v554;
  unsigned int v555;
  unsigned int v556;
  os_log_t v557;
  os_log_t v558;
  os_log_t v559;
  os_log_t v560;
  os_log_t v561;
  os_log_t v562;
  _BOOL4 v563;
  os_log_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  _BOOL4 v570;
  os_log_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  os_log_t v577;
  os_log_t v578;
  os_log_t v579;
  os_log_t v580;
  os_log_t v581;
  os_log_t v582;
  os_log_t v583;
  os_log_t v584;
  _BOOL4 v585;
  os_log_t v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  _BOOL4 v592;
  os_log_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  _BOOL4 v599;
  os_log_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  _BOOL4 v606;
  os_log_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  os_log_t v613;
  os_log_t v614;
  os_log_t v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  _BOOL4 v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  _BOOL4 v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  _BOOL4 v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  _BOOL4 v640;
  int v641;
  os_log_t v642;
  os_log_t v643;
  _BOOL4 v644;
  os_log_t v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  unsigned int v651;
  unsigned int v652;
  unsigned int v653;
  int v654;
  os_log_t v655;
  os_log_t v656;
  int v657;
  os_log_t v658;
  _BOOL4 v659;
  os_log_t v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  uint64_t v665;
  _BOOL4 v666;
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  unsigned int v672;
  uint64_t v673;
  dispatch_object_t *v674;
  uint64_t v675;
  uint64_t v676;
  os_log_t v677;
  os_log_t v678;
  unsigned int v679;
  unsigned int v680;
  uint64_t v681;
  id v682;
  unint64_t v683;
  uint64_t v684;
  void (*v685)(uint64_t);
  char v686;
  int v687;
  const char *v688;
  uint64_t v689;
  os_log_t v690;
  os_log_t v691;
  os_log_t v692;
  os_log_t v693;
  os_log_t v694;
  os_log_t v695;
  uint64_t v696;
  char v697;
  int v698;
  uint64_t v699;
  __int16 v700;
  uint64_t v701;
  int v702;
  uint64_t v703;
  uint64_t v704;
  int v705;
  os_log_t v706;
  os_log_t v707;
  _BOOL4 v708;
  os_log_t v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  _BYTE *v715;
  os_log_t v716;
  os_log_t v717;
  _BOOL4 v718;
  os_log_t v719;
  uint64_t v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  unsigned int v726;
  uint64_t v727;
  size_t v728;
  char *v729;
  unsigned int v730;
  unsigned int v731;
  int v732;
  int v733;
  _BYTE *v734;
  unsigned int v735;
  unsigned int v736;
  uint64_t v737;
  unsigned int v738;
  unsigned __int16 v739;
  int v740;
  unsigned __int8 *v741;
  uint64_t v742;
  uint64_t v743;
  unsigned int v744;
  unsigned int v745;
  os_log_t v746;
  os_log_t v747;
  os_log_t v748;
  os_log_t v749;
  NSObject *v750;
  NSObject *v751;
  _BOOL4 v752;
  os_log_t v753;
  uint64_t v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  uint64_t v758;
  os_log_t v759;
  uint64_t v760;
  uint64_t v761;
  uint64_t v762;
  uint64_t v763;
  uint64_t v764;
  os_log_t v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  uint64_t v769;
  uint64_t v770;
  _BYTE *v771;
  int v772;
  uint64_t v773;
  char v774;
  int v775;
  unint64_t v776;
  os_log_t v777;
  os_log_t v778;
  uint64_t v779;
  os_log_t v780;
  os_log_t v781;
  uint64_t v782;
  uint64_t v783;
  os_log_t v784;
  os_log_t v785;
  uint64_t v786;
  _BOOL4 v787;
  os_log_t v788;
  uint64_t v789;
  uint64_t v790;
  uint64_t v791;
  uint64_t v792;
  uint64_t v793;
  unint64_t v794;
  unsigned int v795;
  unsigned int v796;
  os_log_t v797;
  os_log_t v798;
  os_log_t v799;
  os_log_t v800;
  os_log_t v801;
  os_log_t v802;
  os_log_t v803;
  os_log_t v804;
  _BOOL4 v805;
  os_log_t v806;
  uint64_t v807;
  uint64_t v808;
  uint64_t v809;
  uint64_t v810;
  uint64_t v811;
  _BOOL4 v812;
  os_log_t v813;
  uint64_t v814;
  uint64_t v815;
  uint64_t v816;
  uint64_t v817;
  uint64_t v818;
  os_log_t v819;
  os_log_t v820;
  os_log_t v821;
  os_log_t v822;
  os_log_t v823;
  os_log_t v824;
  os_log_t v825;
  uint64_t v826;
  uint64_t v827;
  uint64_t v828;
  uint64_t v829;
  uint64_t v830;
  _BOOL4 v831;
  os_log_t v832;
  uint64_t v833;
  uint64_t v834;
  uint64_t v835;
  uint64_t v836;
  uint64_t v837;
  os_log_t v838;
  uint64_t v839;
  uint64_t v840;
  uint64_t v841;
  uint64_t v842;
  uint64_t v843;
  _BOOL4 v844;
  os_log_t v845;
  uint64_t v846;
  uint64_t v847;
  uint64_t v848;
  uint64_t v849;
  uint64_t v850;
  _BOOL4 v851;
  os_log_t v852;
  uint64_t v853;
  uint64_t v854;
  uint64_t v855;
  uint64_t v856;
  uint64_t v857;
  os_log_t v858;
  os_log_t v859;
  _BOOL4 v860;
  uint64_t v861;
  uint64_t v862;
  uint64_t v863;
  uint64_t v864;
  uint64_t v865;
  _BOOL4 v866;
  uint64_t v867;
  uint64_t v868;
  uint64_t v869;
  uint64_t v870;
  uint64_t v871;
  _BOOL4 v872;
  uint64_t v873;
  uint64_t v874;
  uint64_t v875;
  uint64_t v876;
  uint64_t v877;
  uint64_t v878;
  _BOOL4 v879;
  int v880;
  os_log_t v881;
  os_log_t v882;
  _BOOL4 v883;
  os_log_t v884;
  uint64_t v885;
  uint64_t v886;
  uint64_t v887;
  uint64_t v888;
  uint64_t v889;
  unsigned int v890;
  unsigned int v891;
  unsigned int v892;
  int v893;
  os_log_t v894;
  os_log_t v895;
  os_log_t v896;
  _BOOL4 v897;
  os_log_t v898;
  uint64_t v899;
  uint64_t v900;
  uint64_t v901;
  uint64_t v902;
  uint64_t v903;
  _BOOL4 v904;
  uint64_t v905;
  uint64_t v906;
  uint64_t v907;
  uint64_t v908;
  uint64_t v909;
  unsigned int v910;
  NSObject *v911;
  NSObject *v912;
  _BOOL4 v913;
  id v914;
  uint64_t v915;
  uint64_t v916;
  uint64_t v917;
  uint64_t v918;
  uint64_t v919;
  uint64_t v920;
  os_log_t v921;
  os_log_t v922;
  uint64_t v923;
  unsigned int v924;
  unsigned int v925;
  uint64_t v926;
  os_log_t v927;
  os_log_t v928;
  os_log_t v929;
  os_log_t v930;
  _BOOL4 v931;
  os_log_t v932;
  uint64_t v933;
  uint64_t v934;
  uint64_t v935;
  uint64_t v936;
  uint64_t v937;
  _BOOL4 v938;
  os_log_t v939;
  uint64_t v940;
  uint64_t v941;
  uint64_t v942;
  uint64_t v943;
  uint64_t v944;
  _BOOL4 v945;
  os_log_t v946;
  uint64_t v947;
  uint64_t v948;
  uint64_t v949;
  uint64_t v950;
  uint64_t v951;
  _BOOL4 v952;
  uint64_t v953;
  uint64_t v954;
  uint64_t v955;
  uint64_t v956;
  uint64_t v957;
  _BOOL4 v958;
  uint64_t v959;
  uint64_t v960;
  uint64_t v961;
  uint64_t v962;
  uint64_t v963;
  _BOOL4 v964;
  uint64_t v965;
  uint64_t v966;
  uint64_t v967;
  uint64_t v968;
  uint64_t v969;
  os_log_t v970;
  os_log_t v971;
  _QWORD *v972;
  uint64_t v973;
  uint64_t v974;
  int v975;
  __int16 v976;
  void (*v977)(uint64_t);
  int v978;
  uint64_t v979;
  uint64_t v980;
  int v981;
  os_log_t v982;
  os_log_t v983;
  _BOOL4 v984;
  os_log_t v985;
  uint64_t v986;
  uint64_t v987;
  uint64_t v988;
  uint64_t v989;
  uint64_t v990;
  uint64_t next_slot;
  uint64_t v992;
  os_log_t v993;
  os_log_t v994;
  _BOOL4 v995;
  os_log_t v996;
  uint64_t v997;
  uint64_t v998;
  uint64_t v999;
  uint64_t v1000;
  uint64_t v1001;
  int v1002;
  uint64_t v1003;
  unsigned int v1004;
  uint64_t v1005;
  size_t v1006;
  void (*v1007)(uint64_t);
  unsigned int v1008;
  unsigned int v1009;
  int v1010;
  uint64_t v1011;
  unsigned int v1012;
  unsigned int data_offset;
  uint64_t object_address;
  unsigned int data_length;
  unsigned __int16 v1016;
  int v1017;
  unsigned __int8 *v1018;
  uint64_t v1019;
  uint64_t v1020;
  unsigned int v1021;
  unsigned int v1022;
  os_log_t v1023;
  os_log_t v1024;
  os_log_t v1025;
  os_log_t v1026;
  NSObject *v1027;
  NSObject *v1028;
  _BOOL4 v1029;
  os_log_t v1030;
  uint64_t v1031;
  uint64_t v1032;
  uint64_t v1033;
  uint64_t v1034;
  uint64_t v1035;
  _BOOL4 v1036;
  os_log_t v1037;
  uint64_t v1038;
  uint64_t v1039;
  uint64_t v1040;
  uint64_t v1041;
  uint64_t v1042;
  os_log_t v1043;
  uint64_t v1044;
  uint64_t v1045;
  uint64_t v1046;
  uint64_t v1047;
  uint64_t v1048;
  int v1049;
  uint64_t v1050;
  char v1051;
  int v1052;
  unint64_t v1053;
  os_log_t v1054;
  os_log_t v1055;
  uint64_t v1056;
  uint64_t v1057;
  os_log_t v1058;
  os_log_t v1059;
  uint64_t v1060;
  os_log_t v1061;
  os_log_t v1062;
  uint64_t v1063;
  _BOOL4 v1064;
  os_log_t v1065;
  uint64_t v1066;
  uint64_t v1067;
  uint64_t v1068;
  uint64_t v1069;
  uint64_t v1070;
  unint64_t v1071;
  unsigned int v1072;
  unsigned int v1073;
  os_log_t v1074;
  os_log_t v1075;
  os_log_t v1076;
  os_log_t v1077;
  os_log_t v1078;
  os_log_t v1079;
  _BOOL4 v1080;
  os_log_t v1081;
  uint64_t v1082;
  uint64_t v1083;
  uint64_t v1084;
  uint64_t v1085;
  uint64_t v1086;
  _BOOL4 v1087;
  os_log_t v1088;
  uint64_t v1089;
  uint64_t v1090;
  uint64_t v1091;
  uint64_t v1092;
  uint64_t v1093;
  os_log_t v1094;
  os_log_t v1095;
  os_log_t v1096;
  os_log_t v1097;
  os_log_t v1098;
  os_log_t v1099;
  os_log_t v1100;
  os_log_t v1101;
  _BOOL4 v1102;
  os_log_t v1103;
  uint64_t v1104;
  uint64_t v1105;
  uint64_t v1106;
  uint64_t v1107;
  uint64_t v1108;
  _BOOL4 v1109;
  os_log_t v1110;
  uint64_t v1111;
  uint64_t v1112;
  uint64_t v1113;
  uint64_t v1114;
  uint64_t v1115;
  _BOOL4 v1116;
  os_log_t v1117;
  uint64_t v1118;
  uint64_t v1119;
  uint64_t v1120;
  uint64_t v1121;
  uint64_t v1122;
  _BOOL4 v1123;
  os_log_t v1124;
  uint64_t v1125;
  uint64_t v1126;
  uint64_t v1127;
  uint64_t v1128;
  uint64_t v1129;
  os_log_t v1130;
  os_log_t v1131;
  os_log_t v1132;
  uint64_t v1133;
  uint64_t v1134;
  uint64_t v1135;
  uint64_t v1136;
  uint64_t v1137;
  _BOOL4 v1138;
  uint64_t v1139;
  uint64_t v1140;
  uint64_t v1141;
  uint64_t v1142;
  uint64_t v1143;
  _BOOL4 v1144;
  uint64_t v1145;
  uint64_t v1146;
  uint64_t v1147;
  uint64_t v1148;
  uint64_t v1149;
  _BOOL4 v1150;
  uint64_t v1151;
  uint64_t v1152;
  uint64_t v1153;
  uint64_t v1154;
  uint64_t v1155;
  uint64_t v1156;
  _BOOL4 v1157;
  int v1158;
  os_log_t v1159;
  os_log_t v1160;
  _BOOL4 v1161;
  os_log_t v1162;
  uint64_t v1163;
  uint64_t v1164;
  uint64_t v1165;
  uint64_t v1166;
  uint64_t v1167;
  unsigned int v1168;
  unsigned int v1169;
  unsigned int v1170;
  int v1171;
  os_log_t v1172;
  os_log_t v1173;
  int v1174;
  os_log_t v1175;
  _BOOL4 v1176;
  os_log_t v1177;
  uint64_t v1178;
  uint64_t v1179;
  uint64_t v1180;
  uint64_t v1181;
  uint64_t v1182;
  _BOOL4 v1183;
  uint64_t v1184;
  uint64_t v1185;
  uint64_t v1186;
  uint64_t v1187;
  uint64_t v1188;
  unsigned int v1189;
  id v1190;
  uint64_t v1191;
  uint64_t v1192;
  uint64_t v1193;
  uint64_t v1194;
  uint64_t v1195;
  uint64_t v1196;
  dispatch_object_t *v1197;
  uint64_t v1198;
  uint64_t v1199;
  os_log_t v1200;
  os_log_t v1201;
  unsigned int v1202;
  unsigned int v1203;
  uint64_t v1204;
  os_log_t v1205;
  os_log_t v1206;
  os_log_t v1207;
  os_log_t v1208;
  _BOOL4 v1209;
  os_log_t v1210;
  uint64_t v1211;
  uint64_t v1212;
  uint64_t v1213;
  uint64_t v1214;
  uint64_t v1215;
  _BOOL4 v1216;
  os_log_t v1217;
  uint64_t v1218;
  uint64_t v1219;
  uint64_t v1220;
  uint64_t v1221;
  uint64_t v1222;
  _BOOL4 v1223;
  os_log_t v1224;
  uint64_t v1225;
  uint64_t v1226;
  uint64_t v1227;
  uint64_t v1228;
  uint64_t v1229;
  _BOOL4 v1230;
  os_log_t v1231;
  uint64_t v1232;
  uint64_t v1233;
  uint64_t v1234;
  uint64_t v1235;
  uint64_t v1236;
  char v1237;
  os_log_t v1238;
  os_log_t v1239;
  os_log_t v1240;
  os_log_t v1241;
  os_log_t v1242;
  char v1243;
  os_log_t v1244;
  os_log_t v1245;
  os_log_t v1246;
  char v1247;
  os_log_t v1248;
  os_log_t v1249;
  os_log_t v1250;
  os_log_t v1251;
  os_log_t v1252;
  _BOOL4 v1253;
  os_log_t v1254;
  uint64_t v1255;
  uint64_t v1256;
  uint64_t v1257;
  uint64_t v1258;
  uint64_t v1259;
  _BOOL4 v1260;
  uint64_t v1261;
  uint64_t v1262;
  uint64_t v1263;
  uint64_t v1264;
  uint64_t v1265;
  _BOOL4 v1266;
  os_log_t v1267;
  uint64_t v1268;
  uint64_t v1269;
  uint64_t v1270;
  uint64_t v1271;
  uint64_t v1272;
  _BOOL4 v1273;
  os_log_t v1274;
  uint64_t v1275;
  uint64_t v1276;
  uint64_t v1277;
  uint64_t v1278;
  uint64_t v1279;
  _BOOL4 v1280;
  uint64_t v1281;
  uint64_t v1282;
  uint64_t v1283;
  uint64_t v1284;
  uint64_t v1285;
  _BOOL4 v1286;
  os_log_t v1287;
  uint64_t v1288;
  uint64_t v1289;
  uint64_t v1290;
  uint64_t v1291;
  uint64_t v1292;
  _BOOL4 v1293;
  uint64_t v1294;
  uint64_t v1295;
  uint64_t v1296;
  uint64_t v1297;
  uint64_t v1298;
  _BOOL4 v1299;
  os_log_t v1300;
  uint64_t v1301;
  uint64_t v1302;
  uint64_t v1303;
  uint64_t v1304;
  uint64_t v1305;
  _BOOL4 v1306;
  os_log_t v1307;
  uint64_t v1308;
  uint64_t v1309;
  uint64_t v1310;
  uint64_t v1311;
  uint64_t v1312;
  os_log_t v1313;
  os_log_t v1314;
  os_log_t v1315;
  os_log_t v1316;
  os_log_t v1317;
  os_log_t v1318;
  os_log_t v1319;
  os_log_t v1320;
  os_log_t v1321;
  os_log_t v1322;
  os_log_t v1323;
  os_log_t v1324;
  os_log_t v1325;
  os_log_t v1326;
  os_log_t v1327;
  os_log_t v1328;
  os_log_t v1329;
  os_log_t v1330;
  os_log_t v1331;
  os_log_t v1332;
  os_log_t v1333;
  os_log_t v1334;
  os_log_t v1335;
  os_log_t v1336;
  os_log_t v1337;
  os_log_t v1338;
  os_log_t v1339;
  os_log_t v1340;
  os_log_t v1341;
  os_log_t v1342;
  _BOOL4 v1343;
  os_log_t v1344;
  uint64_t v1345;
  uint64_t v1346;
  uint64_t v1347;
  uint64_t v1348;
  uint64_t v1349;
  _BOOL4 v1350;
  os_log_t v1351;
  uint64_t v1352;
  uint64_t v1353;
  uint64_t v1354;
  uint64_t v1355;
  uint64_t v1356;
  os_log_t v1357;
  os_log_t v1358;
  os_log_t v1359;
  os_log_t v1360;
  _BOOL4 v1361;
  os_log_t v1362;
  uint64_t v1363;
  uint64_t v1364;
  uint64_t v1365;
  uint64_t v1366;
  uint64_t v1367;
  _BOOL4 v1368;
  os_log_t v1369;
  uint64_t v1370;
  uint64_t v1371;
  uint64_t v1372;
  uint64_t v1373;
  uint64_t v1374;
  _BOOL4 v1375;
  os_log_t v1376;
  uint64_t v1377;
  uint64_t v1378;
  uint64_t v1379;
  uint64_t v1380;
  uint64_t v1381;
  _BOOL4 v1382;
  os_log_t v1383;
  uint64_t v1384;
  uint64_t v1385;
  uint64_t v1386;
  uint64_t v1387;
  uint64_t v1388;
  _BOOL4 v1389;
  os_log_t v1390;
  uint64_t v1391;
  uint64_t v1392;
  uint64_t v1393;
  uint64_t v1394;
  uint64_t v1395;
  _BOOL4 v1396;
  os_log_t v1397;
  uint64_t v1398;
  uint64_t v1399;
  uint64_t v1400;
  uint64_t v1401;
  uint64_t v1402;
  _BOOL4 v1403;
  os_log_t v1404;
  uint64_t v1405;
  uint64_t v1406;
  uint64_t v1407;
  uint64_t v1408;
  uint64_t v1409;
  os_log_t v1410;
  os_log_t v1411;
  _BOOL4 v1412;
  os_log_t v1413;
  uint64_t v1414;
  uint64_t v1415;
  uint64_t v1416;
  uint64_t v1417;
  uint64_t v1418;
  _BOOL4 v1419;
  os_log_t v1420;
  uint64_t v1421;
  uint64_t v1422;
  uint64_t v1423;
  uint64_t v1424;
  uint64_t v1425;
  _BOOL4 v1426;
  os_log_t v1427;
  uint64_t v1428;
  uint64_t v1429;
  uint64_t v1430;
  uint64_t v1431;
  uint64_t v1432;
  _BOOL4 v1433;
  uint64_t v1434;
  uint64_t v1435;
  uint64_t v1436;
  uint64_t v1437;
  uint64_t v1438;
  _BOOL4 v1439;
  os_log_t v1440;
  uint64_t v1441;
  uint64_t v1442;
  uint64_t v1443;
  uint64_t v1444;
  uint64_t v1445;
  os_log_t v1446;
  os_log_t v1447;
  _BOOL4 v1448;
  uint64_t v1449;
  uint64_t v1450;
  uint64_t v1451;
  uint64_t v1452;
  uint64_t v1453;
  _BOOL4 v1454;
  uint64_t v1455;
  uint64_t v1456;
  uint64_t v1457;
  uint64_t v1458;
  uint64_t v1459;
  _BOOL4 v1460;
  os_log_t v1461;
  uint64_t v1462;
  uint64_t v1463;
  uint64_t v1464;
  uint64_t v1465;
  uint64_t v1466;
  _BOOL4 v1467;
  uint64_t v1468;
  uint64_t v1469;
  uint64_t v1470;
  uint64_t v1471;
  uint64_t v1472;
  _BOOL4 v1473;
  uint64_t v1474;
  uint64_t v1475;
  uint64_t v1476;
  uint64_t v1477;
  uint64_t v1478;
  _BOOL4 v1479;
  os_log_t v1480;
  uint64_t v1481;
  uint64_t v1482;
  uint64_t v1483;
  uint64_t v1484;
  uint64_t v1485;
  _BOOL4 v1486;
  os_log_t v1487;
  uint64_t v1488;
  uint64_t v1489;
  uint64_t v1490;
  uint64_t v1491;
  uint64_t v1492;
  _BOOL4 v1493;
  os_log_t v1494;
  uint64_t v1495;
  uint64_t v1496;
  uint64_t v1497;
  uint64_t v1498;
  uint64_t v1499;
  os_log_t v1500;
  os_log_t v1501;
  os_log_t v1502;
  os_log_t v1503;
  os_log_t v1504;
  os_log_t v1505;
  _BOOL4 v1506;
  os_log_t v1507;
  uint64_t v1508;
  uint64_t v1509;
  uint64_t v1510;
  uint64_t v1511;
  uint64_t v1512;
  _BOOL4 v1513;
  os_log_t v1514;
  uint64_t v1515;
  uint64_t v1516;
  uint64_t v1517;
  uint64_t v1518;
  uint64_t v1519;
  _BOOL4 v1520;
  os_log_t v1521;
  uint64_t v1522;
  uint64_t v1523;
  uint64_t v1524;
  uint64_t v1525;
  uint64_t v1526;
  __CFString *StringFromNRLinkChannelPriority;
  uint64_t v1528;
  _BYTE *v1529;
  uint64_t v1530;
  void **v1531;
  id *v1532;
  _BYTE *v1533;
  uint64_t v1534;
  void **v1535;
  id *v1536;
  _BYTE *v1537;
  uint64_t v1538;
  void **v1539;
  id *v1540;
  int v1541;
  id *v1542;
  id *v1543;
  id *v1544;
  _QWORD *v1545;
  _QWORD *v1546;
  _QWORD *v1547;
  _BYTE *v1548;
  uint64_t v1549;
  void **v1550;
  id *v1551;
  const char *v1552;
  id *v1553;
  int v1554;
  unsigned __int8 *v1555;
  int v1556;
  id v1557;
  dispatch_object_t *v1558;
  dispatch_object_t *v1559;
  uint64_t *v1560;
  id v1561;
  const char *v1562;
  const char *v1563;
  void (*v1564)(uint64_t);
  void (*v1565)(uint64_t);
  uint64_t v1566;
  uint64_t v1567;
  unint64_t v1568;
  os_log_t v1569;
  uint64_t v1570;
  uint64_t v1571;
  uint64_t v1572;
  _BYTE *ESPSequenceNumberFromPacket;
  uint64_t v1574;
  id v1575;
  unint64_t v1576;
  uint64_t v1577;
  __int128 v1578;
  __int128 v1579;
  __int128 v1580;
  __int128 v1581;
  uint64_t v1582;

  v1582 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(id *)(a1 + 16);
    v3 = (uint64_t)v2;
    if (*((_BYTE *)v2 + 8) == 4)
      goto LABEL_3;
    v4 = 0x1ED368000uLL;
    if (gNRPacketLoggingEnabled)
    {
      v422 = _NRCopyLogObjectForNRUUID(*((void **)v2 + 5));
      v423 = v422;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v430 = os_log_type_enabled(v422, OS_LOG_TYPE_INFO);

        v4 = 0x1ED368000;
        if (!v430)
          goto LABEL_6;
      }
      v431 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
      StringFromNRLinkChannelPriority = createStringFromNRLinkChannelPriority(*(unsigned __int8 *)(a1 + 83));
      _NRLogWithArgs((uint64_t)v431, 1, (uint64_t)"%s%.30s:%-4d Link output available - %@", v432, v433, v434, v435, v436, (uint64_t)"");

      v4 = 0x1ED368000;
    }
LABEL_6:
    v5 = *(_BYTE *)(a1 + 84);
    v1570 = v3;
    if ((v5 & 1) == 0)
      goto LABEL_7;
    *(_BYTE *)(a1 + 84) = v5 & 0xFE;
    switch(*(_BYTE *)(a1 + 83))
    {
      case 0:
        v19 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
        v20 = v19;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v413 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

          if (!v413)
          {
LABEL_7:
            v6 = *(unsigned __int8 *)(a1 + 82);
            if (v6 >= 0xB)
            {
              v6 = *(unsigned __int8 *)(a1 + 82)
                 - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(a1 + 82)) >> 32);
              *(_BYTE *)(a1 + 82) = v6;
            }
            *(_DWORD *)(a1 + 4 * v6 + 36) = 0x80000;
            v7 = (117 * (*(_BYTE *)(a1 + 82) + 1)) >> 8;
            *(_BYTE *)(a1 + 82) = *(_BYTE *)(a1 + 82)
                                + 1
                                - 11 * ((v7 + (((*(_BYTE *)(a1 + 82) + 1 - v7) & 0xFE) >> 1)) >> 3);
            v8 = *(unsigned __int8 *)(a1 + 83);
            if (v8 == 3)
            {
              if ((*(_BYTE *)(v3 + 10) & 8) == 0)
                goto LABEL_29;
              if (*(_BYTE *)(v3 + 8) == 4)
                goto LABEL_3;
              dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
              v1563 = *(const char **)(v3 + 208);
              v23 = *(void **)(v3 + 240);
              v24 = *(id *)(v3 + 304);
              v25 = 0x1ED368000uLL;
              if (gNRPacketLoggingEnabled)
              {
                v439 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                v440 = v439;
                if (sNRCopyLogToStdErr)
                {

                  v3 = v1570;
                }
                else
                {
                  v448 = os_log_type_enabled(v439, OS_LOG_TYPE_INFO);

                  v3 = v1570;
                  v25 = 0x1ED368000;
                  if (!v448)
                    goto LABEL_32;
                }
                v449 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                _NRLogWithArgs((uint64_t)v449, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v450, v451, v452, v453, v454, (uint64_t)"");

                v25 = 0x1ED368000;
              }
LABEL_32:
              v26 = *(unsigned __int8 *)(v3 + 10);
              if ((v26 & 8) != 0)
              {
                v28 = (_QWORD *)(v3 + 128);
                v32 = "Isochronous";
                v31 = 3;
                v29 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                goto LABEL_917;
              }
              if ((v26 & 4) != 0)
              {
                v28 = (_QWORD *)(v3 + 112);
                v29 = NRBluetoothPacketParserSuspendNexusVOInputSource;
LABEL_396:
                v32 = "High";
                v31 = 2;
                goto LABEL_917;
              }
              v27 = *(_QWORD *)(v3 + 104);
              if (!v27)
              {
                v29 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                goto LABEL_916;
              }
              if ((*(_BYTE *)(*(_QWORD *)v27 + 27) & 3) == 1 && !*(_BYTE *)(v3 + 12))
              {

                v25 = 0x1ED368000;
                v30 = 0;
                v29 = 0;
                v24 = 0;
                v23 = 0;
                v1563 = 0;
                v28 = (_QWORD *)(v3 + 112);
                if (!*(_BYTE *)(v3 + 12))
                  goto LABEL_39;
              }
              else
              {
                v28 = 0;
                v29 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                v30 = 1;
                if (!*(_BYTE *)(v3 + 12))
                  goto LABEL_39;
              }
              if (!*(_BYTE *)(v25 + 1513))
                goto LABEL_39;
              v1251 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              v1252 = v1251;
              if (sNRCopyLogToStdErr)
              {

                v3 = v1570;
              }
              else
              {
                v1306 = os_log_type_enabled(v1251, OS_LOG_TYPE_INFO);

                v3 = v1570;
                v25 = 0x1ED368000;
                if (!v1306)
                  goto LABEL_39;
              }
              v1307 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              _NRLogWithArgs((uint64_t)v1307, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v1308, v1309, v1310, v1311, v1312, (uint64_t)"");

              v25 = 0x1ED368000;
LABEL_39:
              if (v28)
              {
                if ((v30 & 1) != 0)
                {
                  v31 = 0;
                  v32 = "Invalid";
                  goto LABEL_917;
                }
                goto LABEL_396;
              }
LABEL_916:
              v28 = (_QWORD *)(v3 + 96);
              v32 = "Medium";
              v31 = 1;
LABEL_917:
              v1568 = (unint64_t)v28;
              v972 = (_QWORD *)*v28;
              if (*v28)
              {
                v1565 = v29;
                v973 = v972[3];
                if ((*(_BYTE *)(v973 + 84) & 1) == 0)
                {
                  LODWORD(v1559) = v31;
                  LODWORD(v1574) = v26;
                  v1575 = v23;
                  v1562 = v32;
                  v1561 = v24;
                  v1560 = &v1528;
                  v974 = v3;
                  v975 = 0;
                  v976 = 0;
                  LODWORD(v1571) = 0;
                  v1558 = (dispatch_object_t *)(v974 + 304);
                  v977 = *(void (**)(uint64_t))(v973 + 8);
                  v978 = *(unsigned __int8 *)(v973 + 83);
                  v979 = 568;
                  if (v978 == 3)
                    v979 = 584;
                  v62 = v978 == 2;
                  v980 = 600;
                  if (!v62)
                    v980 = v979;
                  v1566 = v980;
                  v1572 = v974 + 688;
                  ESPSequenceNumberFromPacket = (_BYTE *)(v974 + 672);
                  v981 = 9;
                  v1564 = v977;
                  if (*(_BYTE *)(v25 + 1513))
                  {
LABEL_924:
                    v982 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    v983 = v982;
                    if (sNRCopyLogToStdErr)
                    {

                    }
                    else
                    {
                      v984 = os_log_type_enabled(v982, OS_LOG_TYPE_INFO);

                      v25 = 0x1ED368000;
                      if (!v984)
                        goto LABEL_928;
                    }
                    v985 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    _NRLogWithArgs((uint64_t)v985, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v986, v987, v988, v989, v990, (uint64_t)"");

                    v25 = 0x1ED368000uLL;
                  }
LABEL_928:
                  next_slot = 0;
                  v992 = 0;
                  v1567 = 0;
                  v1580 = 0u;
                  v1581 = 0u;
                  v1578 = 0u;
                  v1579 = 0u;
                  if (*(_BYTE *)(v25 + 1513))
                  {
LABEL_929:
                    v993 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    v994 = v993;
                    if (sNRCopyLogToStdErr)
                    {

LABEL_932:
                      v996 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      _NRLogWithArgs((uint64_t)v996, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v997, v998, v999, v1000, v1001, (uint64_t)"");

                      v25 = 0x1ED368000;
                      goto LABEL_933;
                    }
                    v995 = os_log_type_enabled(v993, OS_LOG_TYPE_INFO);

                    v25 = 0x1ED368000;
                    if (v995)
                      goto LABEL_932;
                  }
LABEL_933:
                  v1002 = v981 | 0x10;
                  if ((v1574 & 8) != 0)
                    goto LABEL_943;
                  v1004 = *(_DWORD *)(v973 + 28);
                  v1003 = *(unsigned int *)(v973 + 32);
                  if (v1004 <= v1003)
                    goto LABEL_943;
                  v1005 = *(unsigned __int16 *)(v973 + 80);
                  if ((unsigned __int16)(v1004 - v1003) >= (unsigned __int16)(0x4000 - v1005))
                    v1006 = (unsigned __int16)(0x4000 - v1005);
                  else
                    v1006 = (unsigned __int16)(v1004 - v1003);
                  v1007 = v1564;
                  memcpy((void *)(*(_QWORD *)v973 + v1005), (char *)v1564 + v1003, v1006);
                  v1008 = *(_DWORD *)(v973 + 28);
                  v1009 = *(_DWORD *)(v973 + 32) + v1006;
                  *(_DWORD *)(v973 + 32) = v1009;
                  if (v1008 <= v1009)
                  {
                    v1010 = 0;
                  }
                  else
                  {
                    memmove(v1007, (char *)v1007 + v1009, v1008 - v1009);
                    v1010 = *(_DWORD *)(v973 + 28) - *(_DWORD *)(v973 + 32);
                  }
                  v25 = 0x1ED368000uLL;
                  *(_DWORD *)(v973 + 28) = v1010;
                  *(_DWORD *)(v973 + 32) = 0;
                  *(_WORD *)(v973 + 80) += v1006;
                  if (!gNRPacketLoggingEnabled)
                  {
LABEL_942:
                    v1002 = v981 | 0x30;
                    v975 += v1006;
LABEL_943:
                    if (v1575)
                    {
                      next_slot = os_channel_get_next_slot();
                      v25 = 0x1ED368000;
                    }
                    if (!next_slot)
                      goto LABEL_981;
                    v1011 = next_slot;
                    while (1)
                    {
                      v1012 = 0x4000 - *(unsigned __int16 *)(v973 + 80);
                      if (v1012 < nrMaxTLVLengthForPacket(v1579, WORD1(v1578)))
                      {
                        v1002 |= 0x40u;
                        v25 = 0x1ED368000uLL;
                        if (!gNRPacketLoggingEnabled)
                        {
                          next_slot = v1011;
                          goto LABEL_981;
                        }
                        v1094 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v1095 = v1094;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_1040;
                        }
                        v1109 = os_log_type_enabled(v1094, OS_LOG_TYPE_INFO);

                        if (v1109)
                        {
LABEL_1040:
                          v1110 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          _NRLogWithArgs((uint64_t)v1110, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v1111, v1112, v1113, v1114, v1115, (uint64_t)"");

                          next_slot = v1011;
                        }
                        else
                        {
                          next_slot = v1011;
                        }
LABEL_980:
                        v25 = 0x1ED368000uLL;
LABEL_981:
                        v1049 = *(unsigned __int16 *)(v973 + 80);
                        LODWORD(v1569) = *(_WORD *)(v973 + 80) != 0;
                        if (v1049)
                        {
                          v1576 = 0;
                          v1050 = v25;
                          if (!*(_BYTE *)(v25 + 1513))
                            goto LABEL_983;
                          v1074 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v1075 = v1074;
                          if (sNRCopyLogToStdErr)
                          {

                            v1050 = 0x1ED368000;
                            goto LABEL_1024;
                          }
                          v1080 = os_log_type_enabled(v1074, OS_LOG_TYPE_INFO);

                          v1050 = 0x1ED368000;
                          if (v1080)
                          {
LABEL_1024:
                            v1081 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v1081, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v1082, v1083, v1084, v1085, v1086, (uint64_t)"");

                          }
LABEL_983:
                          v1051 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, unint64_t *, _QWORD, _QWORD))(*(_QWORD *)v1568 + 8))(**(_QWORD **)v1568, *(_QWORD *)v973, *(unsigned __int16 *)(v973 + 80), &v1576, 0, 0);
                          v25 = v1050;
                          if (*(_BYTE *)(v1050 + 1513))
                          {
                            v1076 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            v1077 = v1076;
                            if (sNRCopyLogToStdErr)
                            {

                            }
                            else
                            {
                              v1087 = os_log_type_enabled(v1076, OS_LOG_TYPE_INFO);

                              v25 = 0x1ED368000;
                              if (!v1087)
                                goto LABEL_984;
                            }
                            v1088 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v1088, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v1089, v1090, v1091, v1092, v1093, (uint64_t)"");

                            v25 = 0x1ED368000;
                          }
LABEL_984:
                          if ((v1051 & 1) == 0)
                          {
                            if (v1565)
                            {
                              v1565(v1570);
                              v25 = 0x1ED368000uLL;
                            }
                            *(_BYTE *)(v973 + 84) |= 1u;
                            switch(*(_BYTE *)(v973 + 83))
                            {
                              case 0:
                                v1054 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                v1055 = v1054;
                                if (sNRCopyLogToStdErr)
                                {

                                }
                                else
                                {
                                  v1064 = os_log_type_enabled(v1054, OS_LOG_TYPE_ERROR);

                                  v25 = 0x1ED368000;
                                  if (!v1064)
                                    goto LABEL_1004;
                                }
                                v1065 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs((uint64_t)v1065, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v1066, v1067, v1068, v1069, v1070, (uint64_t)"");
                                goto LABEL_1003;
                              case 1:
                                v1056 = v1570;
                                v1057 = *(_QWORD *)(v1570 + 136);
                                ++*(_QWORD *)(v1570 + 144);
                                *(_QWORD *)(v1056 + 136) = v1057 & 0xFFFFFFFFFFFFFFFELL | *(_BYTE *)(v973 + 84) & 1;
                                if (!*(_BYTE *)(v25 + 1513))
                                  goto LABEL_999;
                                v1058 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                v1059 = v1058;
                                if (sNRCopyLogToStdErr)
                                {

                                }
                                else
                                {
                                  v1138 = os_log_type_enabled(v1058, OS_LOG_TYPE_INFO);

                                  v25 = 0x1ED368000;
                                  if (!v1138)
                                    goto LABEL_1004;
                                }
                                v1065 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs((uint64_t)v1065, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v1139, v1140, v1141, v1142, v1143, (uint64_t)"");
                                goto LABEL_1003;
                              case 2:
                                v1060 = v1570;
                                ++*(_QWORD *)(v1570 + 160);
                                *(_QWORD *)(v1060 + 136) = *(_QWORD *)(v1060 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(_BYTE *)(v973 + 84) & 1));
                                if (!*(_BYTE *)(v25 + 1513))
                                  goto LABEL_999;
                                v1061 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                v1062 = v1061;
                                if (sNRCopyLogToStdErr)
                                {

                                }
                                else
                                {
                                  v1144 = os_log_type_enabled(v1061, OS_LOG_TYPE_INFO);

                                  v25 = 0x1ED368000;
                                  if (!v1144)
                                    goto LABEL_1004;
                                }
                                v1065 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs((uint64_t)v1065, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v1145, v1146, v1147, v1148, v1149, (uint64_t)"");
                                goto LABEL_1003;
                              case 3:
                                v1063 = v1570;
                                ++*(_QWORD *)(v1570 + 176);
                                *(_QWORD *)(v1063 + 136) = *(_QWORD *)(v1063 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(_BYTE *)(v973 + 84) & 1));
                                if (!*(_BYTE *)(v25 + 1513))
                                {
LABEL_999:
                                  v1052 = v1002 | 0x1800;
                                  v1053 = v1576;
                                  if (v1576)
                                    goto LABEL_1006;
                                  goto LABEL_1012;
                                }
                                v1130 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                v1131 = v1130;
                                if (sNRCopyLogToStdErr)
                                {

                                }
                                else
                                {
                                  v1150 = os_log_type_enabled(v1130, OS_LOG_TYPE_INFO);

                                  v25 = 0x1ED368000;
                                  if (!v1150)
                                    goto LABEL_1004;
                                }
                                v1065 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs((uint64_t)v1065, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v1151, v1152, v1153, v1154, v1155, (uint64_t)"");
LABEL_1003:

                                v25 = 0x1ED368000uLL;
LABEL_1004:
                                v1052 = v1002 | 0x1800;
                                if (!*(_BYTE *)(v25 + 1513))
                                {
                                  v1053 = v1576;
                                  if (!v1576)
                                    goto LABEL_1012;
                                  goto LABEL_1006;
                                }
                                v1078 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                v1079 = v1078;
                                if (sNRCopyLogToStdErr)
                                {

                                }
                                else
                                {
                                  v1102 = os_log_type_enabled(v1078, OS_LOG_TYPE_INFO);

                                  if (!v1102)
                                    goto LABEL_1037;
                                }
                                v1103 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs((uint64_t)v1103, 1, (uint64_t)"%s%.30s:%-4d ", v1104, v1105, v1106, v1107, v1108, (uint64_t)"");

LABEL_1037:
                                v25 = 0x1ED368000;
                                v1053 = v1576;
                                if (v1576)
                                  goto LABEL_1006;
                                break;
                              default:
                                goto LABEL_1004;
                            }
                            goto LABEL_1012;
                          }
                          v1052 = v1002 | 0x800;
                          v1053 = v1576;
                          if (!v1576)
                          {
LABEL_1012:
                            LODWORD(v1571) = v1571 + 1;
                            if ((v1051 & 1) != 0)
                            {
                              v1072 = *(unsigned __int8 *)(v973 + 82);
                              if (v1072 >= 0xB)
                              {
                                v1072 = *(unsigned __int8 *)(v973 + 82)
                                      - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v973 + 82)) >> 32);
                                *(_BYTE *)(v973 + 82) = v1072;
                              }
                              v981 = 0;
                              *(_DWORD *)(v973 + 4 * v1072 + 36) = v1052;
                              v1073 = (117 * (*(_BYTE *)(v973 + 82) + 1)) >> 8;
                              *(_BYTE *)(v973 + 82) = *(_BYTE *)(v973 + 82)
                                                    + 1
                                                    - 11
                                                    * ((v1073
                                                      + (((*(_BYTE *)(v973 + 82) + 1 - v1073) & 0xFE) >> 1)) >> 3);
                              if (!*(_BYTE *)(v25 + 1513))
                                goto LABEL_933;
                              goto LABEL_929;
                            }
LABEL_1065:
                            v1157 = v1049 == 0;
                            LODWORD(v1156) = (_DWORD)v1569;
                            if (!*(_BYTE *)(v25 + 1513))
                            {
                              v1158 = v1052 | 0x8000;
                              if (v992)
                                goto LABEL_1067;
LABEL_1058:
                              if (!*(_BYTE *)(v1570 + 13))
                              {
LABEL_1073:
                                if ((v1156 & v1157) == 1)
                                {
                                  v1169 = *(unsigned __int8 *)(v973 + 82);
                                  if (v1169 >= 0xB)
                                  {
                                    v1169 = *(unsigned __int8 *)(v973 + 82)
                                          - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v973 + 82)) >> 32);
                                    *(_BYTE *)(v973 + 82) = v1169;
                                  }
                                  *(_DWORD *)(v973 + 4 * v1169 + 36) = v1158;
                                  v1170 = (117 * (*(_BYTE *)(v973 + 82) + 1)) >> 8;
                                  *(_BYTE *)(v973 + 82) = *(_BYTE *)(v973 + 82)
                                                        + 1
                                                        - 11
                                                        * ((v1170
                                                          + (((*(_BYTE *)(v973 + 82) + 1 - v1170) & 0xFE) >> 1)) >> 3);
                                  v981 = 8;
                                  if (!*(_BYTE *)(v25 + 1513))
                                    goto LABEL_928;
                                  goto LABEL_924;
                                }
                                v24 = v1561;
                                if (*(_BYTE *)(v25 + 1513))
                                {
                                  v1247 = v1156;
                                  v1248 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v1156 = (uint64_t)v1248;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    v24 = v1561;
                                  }
                                  else
                                  {
                                    v1293 = os_log_type_enabled(v1248, OS_LOG_TYPE_INFO);

                                    v25 = 0x1ED368000;
                                    v24 = v1561;
                                    LOBYTE(v1156) = v1247;
                                    if (!v1293)
                                      goto LABEL_1100;
                                  }
                                  v1156 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs(v1156, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v1294, v1295, v1296, v1297, v1298, (uint64_t)"");

                                  LOBYTE(v1156) = v1247;
                                  v25 = 0x1ED368000;
                                }
LABEL_1100:
                                v3 = v1570;
                                if ((v1156 & 1) != 0)
                                  goto LABEL_1143;
                                if ((_DWORD)v1559 != 1)
                                {
                                  if ((_DWORD)v1559 != 2)
                                  {
                                    if ((_DWORD)v1559 == 3)
                                    {
                                      v1196 = *(_QWORD *)(v1570 + 136);
                                      if ((v1196 & 8) != 0 && *v1558)
                                      {
                                        *(_QWORD *)(v1570 + 136) = v1196 & 0xFFFFFFFFFFFFFFF7;
                                        if (!*(_BYTE *)(v25 + 1513))
                                          goto LABEL_1107;
                                        v1357 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        v1358 = v1357;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          goto LABEL_1276;
                                        }
                                        v1473 = os_log_type_enabled(v1357, OS_LOG_TYPE_INFO);

                                        if (v1473)
                                        {
LABEL_1276:
                                          v1383 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                          _NRLogWithArgs((uint64_t)v1383, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1474, v1475, v1476, v1477, v1478, (uint64_t)"");
LABEL_1277:

                                        }
LABEL_1278:
                                        v3 = v1570;
                                        v24 = v1561;
LABEL_1107:
                                        v1197 = v1558;
                                        goto LABEL_1142;
                                      }
                                      goto LABEL_1143;
                                    }
                                    v1198 = *(_QWORD *)(v1570 + 136);
LABEL_1126:
                                    if ((v1198 & 8) != 0 && *v1558)
                                    {
                                      *(_QWORD *)(v1570 + 136) = v1198 & 0xFFFFFFFFFFFFFFF7;
                                      if (!*(_BYTE *)(v25 + 1513))
                                        goto LABEL_1129;
                                      v1331 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v1332 = v1331;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v3 = v1570;
                                        v24 = v1561;
                                        goto LABEL_1252;
                                      }
                                      v1412 = os_log_type_enabled(v1331, OS_LOG_TYPE_INFO);

                                      v3 = v1570;
                                      v24 = v1561;
                                      if (v1412)
                                      {
LABEL_1252:
                                        v1413 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        _NRLogWithArgs((uint64_t)v1413, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1414, v1415, v1416, v1417, v1418, (uint64_t)"");

                                      }
LABEL_1129:
                                      dispatch_resume(*(dispatch_object_t *)(v3 + 304));
                                      v1198 = *(_QWORD *)(v3 + 136);
                                    }
                                    if ((v1198 & 0x10) != 0 && *(_QWORD *)(v3 + 320))
                                    {
                                      *(_QWORD *)(v3 + 136) = v1198 & 0xFFFFFFFFFFFFFFEFLL;
                                      if (!gNRPacketLoggingEnabled)
                                        goto LABEL_1133;
                                      v1333 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v1334 = v1333;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v3 = v1570;
                                        v24 = v1561;
                                        goto LABEL_1254;
                                      }
                                      v1419 = os_log_type_enabled(v1333, OS_LOG_TYPE_INFO);

                                      v3 = v1570;
                                      v24 = v1561;
                                      if (v1419)
                                      {
LABEL_1254:
                                        v1420 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        _NRLogWithArgs((uint64_t)v1420, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1421, v1422, v1423, v1424, v1425, (uint64_t)"");

                                      }
LABEL_1133:
                                      dispatch_resume(*(dispatch_object_t *)(v3 + 320));
                                      v1198 = *(_QWORD *)(v3 + 136);
                                    }
                                    if ((v1198 & 0x20) == 0)
                                      goto LABEL_1138;
                                    v25 = 0x1ED368000uLL;
                                    if (*(_QWORD *)(v3 + 336))
                                    {
                                      *(_QWORD *)(v3 + 136) = v1198 & 0xFFFFFFFFFFFFFFDFLL;
                                      if (!gNRPacketLoggingEnabled)
                                        goto LABEL_1137;
                                      v1335 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v1336 = v1335;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v3 = v1570;
                                        v24 = v1561;
                                        goto LABEL_1256;
                                      }
                                      v1426 = os_log_type_enabled(v1335, OS_LOG_TYPE_INFO);

                                      v3 = v1570;
                                      v24 = v1561;
                                      if (v1426)
                                      {
LABEL_1256:
                                        v1427 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        _NRLogWithArgs((uint64_t)v1427, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1428, v1429, v1430, v1431, v1432, (uint64_t)"");

                                      }
LABEL_1137:
                                      dispatch_resume(*(dispatch_object_t *)(v3 + 336));
                                      v1198 = *(_QWORD *)(v3 + 136);
LABEL_1138:
                                      v25 = 0x1ED368000uLL;
                                    }
                                    if ((v1198 & 0x40) == 0 || !*(_QWORD *)(v3 + 352))
                                      goto LABEL_1143;
LABEL_1141:
                                    v1197 = (dispatch_object_t *)(v3 + 352);
                                    *(_QWORD *)(v3 + 136) = v1198 & 0xFFFFFFFFFFFFFFBFLL;
                                    if (*(_BYTE *)(v25 + 1513))
                                    {
                                      v1558 = (dispatch_object_t *)(v3 + 352);
                                      v1323 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v1324 = v1323;
                                      if (sNRCopyLogToStdErr)
                                      {

                                      }
                                      else
                                      {
                                        v1382 = os_log_type_enabled(v1323, OS_LOG_TYPE_INFO);

                                        if (!v1382)
                                          goto LABEL_1278;
                                      }
                                      v1383 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                      _NRLogWithArgs((uint64_t)v1383, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v1384, v1385, v1386, v1387, v1388, (uint64_t)"");
                                      goto LABEL_1277;
                                    }
LABEL_1142:
                                    dispatch_resume(*v1197);
                                    v25 = 0x1ED368000uLL;
LABEL_1143:
                                    if (*(_BYTE *)(v25 + 1513))
                                    {
                                      v1249 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v1250 = v1249;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v3 = v1570;
                                        v24 = v1561;
                                      }
                                      else
                                      {
                                        v1299 = os_log_type_enabled(v1249, OS_LOG_TYPE_INFO);

                                        v3 = v1570;
                                        v24 = v1561;
                                        if (!v1299)
                                          goto LABEL_1144;
                                      }
                                      v1300 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      _NRLogWithArgs((uint64_t)v1300, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v1301, v1302, v1303, v1304, v1305, (uint64_t)"");

                                    }
LABEL_1144:
                                    v1202 = *(unsigned __int8 *)(v973 + 82);
                                    if (v1202 >= 0xB)
                                    {
                                      v1202 = *(unsigned __int8 *)(v973 + 82)
                                            - 11
                                            * ((390451573 * (unint64_t)*(unsigned __int8 *)(v973 + 82)) >> 32);
                                      *(_BYTE *)(v973 + 82) = v1202;
                                    }
                                    *(_DWORD *)(v973 + 4 * v1202 + 36) = v1158 | 0x60000;
LABEL_1147:
                                    v1203 = (117 * (*(_BYTE *)(v973 + 82) + 1)) >> 8;
                                    *(_BYTE *)(v973 + 82) = *(_BYTE *)(v973 + 82)
                                                          + 1
                                                          - 11
                                                          * ((v1203
                                                            + (((*(_BYTE *)(v973 + 82) + 1 - v1203) & 0xFE) >> 1)) >> 3);
                                    goto LABEL_1148;
                                  }
                                  v1199 = *(_QWORD *)(v1570 + 136);
                                  if ((v1199 & 8) != 0 && *v1558)
                                  {
                                    *(_QWORD *)(v1570 + 136) = v1199 & 0xFFFFFFFFFFFFFFF7;
                                    if (!*(_BYTE *)(v25 + 1513))
                                      goto LABEL_1119;
                                    v1359 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    v1360 = v1359;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v3 = v1570;
                                      v24 = v1561;
                                      goto LABEL_1280;
                                    }
                                    v1479 = os_log_type_enabled(v1359, OS_LOG_TYPE_INFO);

                                    v3 = v1570;
                                    v24 = v1561;
                                    if (v1479)
                                    {
LABEL_1280:
                                      v1480 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      _NRLogWithArgs((uint64_t)v1480, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1481, v1482, v1483, v1484, v1485, (uint64_t)"");

                                    }
LABEL_1119:
                                    dispatch_resume(*(dispatch_object_t *)(v3 + 304));
                                    v1199 = *(_QWORD *)(v3 + 136);
                                    v25 = 0x1ED368000uLL;
                                  }
                                  if ((v1199 & 0x10) != 0 && *(_QWORD *)(v3 + 320))
                                  {
                                    v1197 = (dispatch_object_t *)(v3 + 320);
                                    *(_QWORD *)(v3 + 136) = v1199 & 0xFFFFFFFFFFFFFFEFLL;
                                    if (*(_BYTE *)(v25 + 1513))
                                    {
                                      v1558 = (dispatch_object_t *)(v3 + 320);
                                      v1200 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v1201 = v1200;
                                      if (sNRCopyLogToStdErr)
                                      {

                                      }
                                      else
                                      {
                                        v1467 = os_log_type_enabled(v1200, OS_LOG_TYPE_INFO);

                                        if (!v1467)
                                          goto LABEL_1278;
                                      }
                                      v1383 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                      _NRLogWithArgs((uint64_t)v1383, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1468, v1469, v1470, v1471, v1472, (uint64_t)"");
                                      goto LABEL_1277;
                                    }
                                    goto LABEL_1142;
                                  }
                                  goto LABEL_1143;
                                }
                                v1198 = *(_QWORD *)(v1570 + 136);
                                if ((*(_BYTE *)(v1570 + 10) & 4) == 0)
                                  goto LABEL_1126;
                                if ((v1198 & 0x20) != 0 && *(_QWORD *)(v1570 + 336))
                                {
                                  *(_QWORD *)(v1570 + 136) = v1198 & 0xFFFFFFFFFFFFFFDFLL;
                                  if (!*(_BYTE *)(v25 + 1513))
                                    goto LABEL_1112;
                                  v1446 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                  v1447 = v1446;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    v3 = v1570;
                                    v24 = v1561;
                                    goto LABEL_1284;
                                  }
                                  v1493 = os_log_type_enabled(v1446, OS_LOG_TYPE_INFO);

                                  v3 = v1570;
                                  v24 = v1561;
                                  if (v1493)
                                  {
LABEL_1284:
                                    v1494 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    _NRLogWithArgs((uint64_t)v1494, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1495, v1496, v1497, v1498, v1499, (uint64_t)"");

                                  }
LABEL_1112:
                                  dispatch_resume(*(dispatch_object_t *)(v3 + 336));
                                  v1198 = *(_QWORD *)(v3 + 136);
                                  v25 = 0x1ED368000;
                                }
                                if ((v1198 & 0x40) == 0 || !*(_QWORD *)(v3 + 352))
                                  goto LABEL_1143;
                                goto LABEL_1141;
                              }
LABEL_1068:
                              if (v1571 <= 8u)
                              {
                                if (!v1575)
                                  goto LABEL_1073;
                                v1168 = os_channel_available_slot_count();
                                v25 = 0x1ED368000uLL;
                                if (v1168 > 1)
                                  goto LABEL_1073;
                              }
                              if (!*(_BYTE *)(v25 + 1513))
                              {
LABEL_1072:
                                v1158 = v1052 | 0x18000;
                                os_channel_sync();
                                *(_BYTE *)(v1570 + 13) = 0;
                                v25 = 0x1ED368000uLL;
                                goto LABEL_1073;
                              }
                              v1174 = v1156;
                              v1175 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v1156 = (uint64_t)v1175;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v1183 = os_log_type_enabled(v1175, OS_LOG_TYPE_INFO);

                                LODWORD(v1156) = v1174;
                                if (!v1183)
                                  goto LABEL_1072;
                              }
                              v1156 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs(v1156, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v1184, v1185, v1186, v1187, v1188, (uint64_t)"");

                              LODWORD(v1156) = v1174;
                              goto LABEL_1072;
                            }
                            v1171 = (int)v1569;
                            v1172 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            v1173 = v1172;
                            if (sNRCopyLogToStdErr)
                            {

                              goto LABEL_1083;
                            }
                            v1176 = os_log_type_enabled(v1172, OS_LOG_TYPE_INFO);

                            if (v1176)
                            {
LABEL_1083:
                              v1177 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v1177, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v1178, v1179, v1180, v1181, v1182, (uint64_t)"");

                            }
                            v25 = 0x1ED368000;
                            LODWORD(v1156) = v1171;
                            v1158 = v1052 | 0x8000;
                            if (!v992)
                              goto LABEL_1058;
LABEL_1067:
                            os_channel_advance_slot();
                            v25 = 0x1ED368000;
                            *(_BYTE *)(v1570 + 13) = 1;
                            goto LABEL_1068;
                          }
LABEL_1006:
                          if (v1053 < *(unsigned __int16 *)(v973 + 80))
                          {
                            if (!*(_BYTE *)(v25 + 1513))
                              goto LABEL_1008;
                            v1096 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            v1097 = v1096;
                            if (sNRCopyLogToStdErr)
                            {

                              goto LABEL_1042;
                            }
                            v1116 = os_log_type_enabled(v1096, OS_LOG_TYPE_INFO);

                            if (v1116)
                            {
LABEL_1042:
                              v1117 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v1117, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v1118, v1119, v1120, v1121, v1122, (uint64_t)"");

                            }
LABEL_1008:
                            v1052 |= 0x2000u;
                            memmove(*(void **)v973, (const void *)(*(_QWORD *)v973 + v1576), *(unsigned __int16 *)(v973 + 80) - v1576);
                            v1071 = v1576;
                            *(_WORD *)(v973 + 80) -= v1576;
                            v1567 = (v1567 + 1);
                            v25 = 0x1ED368000;
LABEL_1011:
                            *(_QWORD *)(v1570 + v1566) += v1071;
                            goto LABEL_1012;
                          }
                          if (!*(_BYTE *)(v25 + 1513))
                          {
LABEL_1010:
                            v1052 |= 0x4000u;
                            *(_WORD *)(v973 + 80) = 0;
                            v1071 = v1576;
                            goto LABEL_1011;
                          }
                          v1098 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v1099 = v1098;
                          if (sNRCopyLogToStdErr)
                          {

                          }
                          else
                          {
                            v1123 = os_log_type_enabled(v1098, OS_LOG_TYPE_INFO);

                            v25 = 0x1ED368000;
                            if (!v1123)
                              goto LABEL_1010;
                          }
                          v1124 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          _NRLogWithArgs((uint64_t)v1124, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v1125, v1126, v1127, v1128, v1129, (uint64_t)"");

                          v25 = 0x1ED368000;
                          goto LABEL_1010;
                        }
                        v1052 = v1002 | 0x400;
                        if (!*(_BYTE *)(v25 + 1513))
                        {
                          LODWORD(v1156) = 0;
                          v1157 = 1;
                          v1158 = v1002 | 0x8400;
                          if (v992)
                            goto LABEL_1067;
                          goto LABEL_1058;
                        }
                        v1159 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v1160 = v1159;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_1063;
                        }
                        v1161 = os_log_type_enabled(v1159, OS_LOG_TYPE_INFO);

                        if (v1161)
                        {
LABEL_1063:
                          v1162 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          _NRLogWithArgs((uint64_t)v1162, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v1163, v1164, v1165, v1166, v1167, (uint64_t)"");

                        }
                        v25 = 0x1ED368000uLL;
                        goto LABEL_1065;
                      }
                      os_channel_slot_get_packet();
                      os_packet_get_next_buflet();
                      data_offset = os_buflet_get_data_offset();
                      object_address = os_buflet_get_object_address();
                      data_length = os_buflet_get_data_length();
                      if (data_length >= 0x10000)
                      {
                        if (nrCopyLogObj_onceToken_509 != -1)
                          dispatch_once(&nrCopyLogObj_onceToken_509, &__block_literal_global_353);
                        if (sNRCopyLogToStdErr
                          || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_510, OS_LOG_TYPE_ERROR))
                        {
                          v1190 = nrCopyLogObj_506();
                          _NRLogWithArgs((uint64_t)v1190, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen <= 65535", v1191, v1192, v1193, v1194, v1195, (uint64_t)"");

                        }
                        goto LABEL_377;
                      }
                      v1016 = data_length;
                      if (!(_WORD)data_length && WORD1(v1578))
                      {
                        v1576 = 0;
                        v1577 = 0;
                        v1576 = *(_QWORD *)v973 + *(unsigned __int16 *)(v973 + 80);
                        LODWORD(v1577) = v1012;
                        v1017 = nrPacketToTLV((unsigned __int8 *)v1579, WORD1(v1578), (uint64_t)&v1576, 1u, (uint64_t)ESPSequenceNumberFromPacket, v1572);
                        if (!gNRPacketLoggingEnabled)
                        {
LABEL_952:
                          v1002 |= 0x80u;
                          goto LABEL_958;
                        }
                        v1023 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v1024 = v1023;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          v1029 = os_log_type_enabled(v1023, OS_LOG_TYPE_INFO);

                          if (!v1029)
                            goto LABEL_952;
                        }
                        v1030 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        getESPSequenceNumberFromPacket(v1579, WORD1(v1578));
                        getESPSPIFromPacket(v1579, WORD1(v1578));
                        _NRLogWithArgs((uint64_t)v1030, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v1031, v1032, v1033, v1034, v1035, (uint64_t)"");

                        goto LABEL_952;
                      }
                      if ((_WORD)data_length)
                      {
                        v1018 = (unsigned __int8 *)(object_address + data_offset);
                        v1576 = 0;
                        v1577 = 0;
                        v1576 = *(_QWORD *)v973 + *(unsigned __int16 *)(v973 + 80);
                        LODWORD(v1577) = v1012;
                        v1017 = nrPacketToTLV(v1018, (unsigned __int16)data_length, (uint64_t)&v1576, 1u, (uint64_t)ESPSequenceNumberFromPacket, v1572);
                        if (!gNRPacketLoggingEnabled)
                        {
LABEL_955:
                          v1002 |= 0x100u;
                          goto LABEL_958;
                        }
                        v1025 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v1026 = v1025;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          v1036 = os_log_type_enabled(v1025, OS_LOG_TYPE_INFO);

                          if (!v1036)
                            goto LABEL_955;
                        }
                        v1037 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        getESPSequenceNumberFromPacket((uint64_t)v1018, v1016);
                        getESPSPIFromPacket((uint64_t)v1018, v1016);
                        _NRLogWithArgs((uint64_t)v1037, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v1038, v1039, v1040, v1041, v1042, (uint64_t)"");

                        goto LABEL_955;
                      }
                      v1002 |= 0x200u;
                      if (!gNRPacketLoggingEnabled)
                        goto LABEL_957;
                      v1027 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      v1028 = v1027;
                      if (sNRCopyLogToStdErr)
                        break;
                      v1017 = os_log_type_enabled(v1027, OS_LOG_TYPE_INFO);

                      if (v1017)
                        goto LABEL_976;
LABEL_958:
                      *(_WORD *)(v973 + 80) += v1017;
                      if ((v1574 & 8) != 0)
                        v1019 = 0;
                      else
                        v1019 = os_channel_get_next_slot();
                      ++v976;
                      v1020 = v1570;
                      ++*(_QWORD *)(v1570 + 432);
                      *(_BYTE *)(v1020 + 14) = 1;
                      v975 += v1017;
                      if (!v1019)
                      {
                        next_slot = 0;
                        v992 = v1011;
                        goto LABEL_980;
                      }
                      v1021 = *(unsigned __int8 *)(v973 + 82);
                      if (v1021 >= 0xB)
                      {
                        v1021 = *(unsigned __int8 *)(v973 + 82)
                              - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v973 + 82)) >> 32);
                        *(_BYTE *)(v973 + 82) = v1021;
                      }
                      *(_DWORD *)(v973 + 4 * v1021 + 36) = v1002;
                      v1022 = (117 * (*(_BYTE *)(v973 + 82) + 1)) >> 8;
                      *(_BYTE *)(v973 + 82) = *(_BYTE *)(v973 + 82)
                                            + 1
                                            - 11
                                            * ((v1022
                                              + (((*(_BYTE *)(v973 + 82) + 1 - v1022) & 0xFE) >> 1)) >> 3);
                      v992 = v1011;
                      v1011 = v1019;
                      v1002 = 0;
                    }

LABEL_976:
                    v1043 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    _NRLogWithArgs((uint64_t)v1043, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v1044, v1045, v1046, v1047, v1048, (uint64_t)"");

LABEL_957:
                    v1017 = 0;
                    goto LABEL_958;
                  }
                  v1100 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  v1101 = v1100;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    LODWORD(v1569) = os_log_type_enabled(v1100, OS_LOG_TYPE_INFO);

                    v25 = 0x1ED368000;
                    if (!(_DWORD)v1569)
                      goto LABEL_942;
                  }
                  v1132 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  _NRLogWithArgs((uint64_t)v1132, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v1133, v1134, v1135, v1136, v1137, (uint64_t)"");

                  v25 = 0x1ED368000;
                  goto LABEL_942;
                }
                if (!*(_BYTE *)(v25 + 1513))
                {
LABEL_1089:
                  if (v1565)
                    v1565(v3);
                  v1189 = *(unsigned __int8 *)(v973 + 82);
                  if (v1189 >= 0xB)
                  {
                    v1189 = *(unsigned __int8 *)(v973 + 82)
                          - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v973 + 82)) >> 32);
                    *(_BYTE *)(v973 + 82) = v1189;
                  }
                  *(_DWORD *)(v973 + 4 * v1189 + 36) = 3;
                  goto LABEL_1147;
                }
                v1207 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                v1208 = v1207;
                if (sNRCopyLogToStdErr)
                {

                  v3 = v1570;
                }
                else
                {
                  v1230 = os_log_type_enabled(v1207, OS_LOG_TYPE_INFO);

                  v3 = v1570;
                  if (!v1230)
                    goto LABEL_1089;
                }
                v1231 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                _NRLogWithArgs((uint64_t)v1231, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v1232, v1233, v1234, v1235, v1236, (uint64_t)"");

                goto LABEL_1089;
              }
              v1204 = (uint64_t)v32;
              if (!*(_BYTE *)(v25 + 1513))
                goto LABEL_1151;
              v1504 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
              v1505 = v1504;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v1520 = os_log_type_enabled(v1504, OS_LOG_TYPE_INFO);

                if (!v1520)
                  goto LABEL_1151;
              }
              v1521 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
              _NRLogWithArgs((uint64_t)v1521, 1, (uint64_t)"%s%.30s:%-4d ", v1522, v1523, v1524, v1525, v1526, (uint64_t)"");

LABEL_1151:
              v1205 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
              v1206 = v1205;
              if (sNRCopyLogToStdErr)
              {

                v3 = v1570;
              }
              else
              {
                v1209 = os_log_type_enabled(v1205, OS_LOG_TYPE_FAULT);

                v3 = v1570;
                if (!v1209)
                  goto LABEL_1148;
              }
              v1210 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              _NRLogWithArgs((uint64_t)v1210, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v1211, v1212, v1213, v1214, v1215, v1204);

LABEL_1148:
              goto LABEL_3;
            }
            if ((v8 & 0xFE) != 2)
            {
              v21 = 4;
              v22 = (unsigned __int8 *)&NRParserLinkWriteAvailable_priorityArrayFull;
              if (v8 == 1)
              {
                if ((*(_BYTE *)(v3 + 10) & 4) != 0)
                  v33 = 21;
                else
                  v33 = 20;
                if ((*(_BYTE *)(v3 + 10) & 4) != 0)
                {
                  v22 = (unsigned __int8 *)&NRParserLinkWriteAvailable_priorityArrayForMedium;
                  v21 = 2;
                }
                else
                {
                  v21 = 4;
                }
                goto LABEL_50;
              }
LABEL_49:
              v33 = 20;
LABEL_50:
              v34 = 0;
              v35 = v21 - 1;
              v36 = (v21 - 1) & *(unsigned __int8 *)(v3 + v33);
              v1528 = v33;
              *(_BYTE *)(v3 + v33) = v36;
              v1540 = (id *)(v3 + 232);
              v1539 = (void **)(v3 + 288);
              v1544 = (id *)(v3 + 352);
              v1538 = v3 + 480;
              v1537 = (_BYTE *)(v3 + 17);
              v1536 = (id *)(v3 + 224);
              v1535 = (void **)(v3 + 272);
              v1542 = (id *)(v3 + 336);
              v1534 = v3 + 464;
              v1533 = (_BYTE *)(v3 + 16);
              v1532 = (id *)(v3 + 216);
              v1531 = (void **)(v3 + 256);
              v1543 = (id *)(v3 + 320);
              v1530 = v3 + 448;
              v1529 = (_BYTE *)(v3 + 15);
              v1551 = (id *)(v3 + 208);
              v1550 = (void **)(v3 + 240);
              v1553 = (id *)(v3 + 304);
              v1549 = v3 + 432;
              v1548 = (_BYTE *)(v3 + 14);
              v1546 = (_QWORD *)(v3 + 128);
              v1545 = (_QWORD *)(v3 + 112);
              v1547 = (_QWORD *)(v3 + 96);
              v1572 = v3 + 672;
              v1571 = v3 + 688;
              v1541 = v21;
              v1555 = v22;
              v1554 = v21 - 1;
              while (1)
              {
                v39 = v36 & v35;
                if (*(_BYTE *)(v3 + 8) != 4)
                  break;
LABEL_55:
                v36 = v39 + 1;
                if (++v34 == v21)
                {
                  ++*(_BYTE *)(v3 + v1528);
                  goto LABEL_3;
                }
              }
              v1558 = (dispatch_object_t *)&v1528;
              LODWORD(v1560) = v34;
              v1559 = (dispatch_object_t *)(v36 & v35);
              v40 = v22[(v36 & v35)];
              dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
              switch(v40)
              {
                case 'd':
                  v41 = 1;
                  v42 = v1551;
                  v43 = v1550;
                  v44 = v1553;
                  ESPSequenceNumberFromPacket = v1548;
                  v45 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                  v46 = (uint64_t *)&v1579 + 1;
                  break;
                case 'e':
                  v41 = 1;
                  v42 = v1532;
                  v43 = v1531;
                  v44 = v1543;
                  ESPSequenceNumberFromPacket = v1529;
                  v45 = NRBluetoothPacketParserSuspendNexusVIInputSource;
                  v46 = (uint64_t *)&v1562;
                  break;
                case 'g':
                  v41 = 0;
                  v42 = v1540;
                  v43 = v1539;
                  v44 = v1544;
                  ESPSequenceNumberFromPacket = v1537;
                  v45 = NRBluetoothPacketParserSuspendNexusBKInputSource;
                  v46 = &v1570;
                  break;
                case 'f':
                  v41 = 0;
                  v42 = v1536;
                  v43 = v1535;
                  v44 = v1542;
                  ESPSequenceNumberFromPacket = v1533;
                  v45 = NRBluetoothPacketParserSuspendNexusBEInputSource;
                  v46 = &v1566;
                  break;
                default:
                  ESPSequenceNumberFromPacket = 0;
                  v45 = 0;
                  v41 = 0;
                  v47 = 0;
                  v49 = 0;
                  v48 = 0;
                  v1561 = 0;
LABEL_60:
                  v50 = 0x1ED368000uLL;
                  if (!gNRPacketLoggingEnabled)
                    goto LABEL_61;
                  v282 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  v283 = v282;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v289 = os_log_type_enabled(v282, OS_LOG_TYPE_INFO);

                    v50 = 0x1ED368000;
                    if (!v289)
                      goto LABEL_61;
                  }
                  v290 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  _NRLogWithArgs((uint64_t)v290, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v291, v292, v293, v294, v295, (uint64_t)"");

                  v50 = 0x1ED368000;
LABEL_61:
                  v3 = v1570;
                  if (v40 == 100 && (*(_BYTE *)(v1570 + 10) & 8) != 0)
                  {
                    v1556 = 3;
                    LODWORD(v1574) = 1;
                    v52 = v1546;
                    v54 = "Isochronous";
                    goto LABEL_89;
                  }
                  if (!v41)
                    goto LABEL_73;
                  if ((*(_BYTE *)(v1570 + 10) & 4) != 0)
                  {
                    v52 = v1545;
                    goto LABEL_88;
                  }
                  v51 = *(_QWORD *)(v1570 + 104);
                  if (!v51)
                  {
LABEL_73:
                    LODWORD(v1574) = 0;
                    v1556 = 1;
                    v52 = v1547;
                    v54 = "Medium";
                    goto LABEL_89;
                  }
                  if ((*(_BYTE *)(*(_QWORD *)v51 + 27) & 3) == 1)
                  {
                    if (*(_BYTE *)(v1570 + 12))
                    {
                      v52 = 0;
                      v53 = 1;
                    }
                    else
                    {

                      v50 = 0x1ED368000uLL;
                      v53 = 0;
                      v45 = 0;
                      v49 = 0;
                      v48 = 0;
                      v1561 = 0;
                      v52 = v1545;
                      if (!*(_BYTE *)(v3 + 12))
                        goto LABEL_83;
                    }
                  }
                  else
                  {
                    v52 = 0;
                    v53 = 1;
                    if (!*(_BYTE *)(v1570 + 12))
                      goto LABEL_83;
                  }
                  if (*(_BYTE *)(v50 + 1513))
                  {
                    v314 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    v315 = v314;
                    if (sNRCopyLogToStdErr)
                    {

                      v21 = v1541;
                    }
                    else
                    {
                      v330 = os_log_type_enabled(v314, OS_LOG_TYPE_INFO);

                      v50 = 0x1ED368000;
                      v21 = v1541;
                      if (!v330)
                        goto LABEL_83;
                    }
                    v331 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    _NRLogWithArgs((uint64_t)v331, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v332, v333, v334, v335, v336, (uint64_t)"");

                    v50 = 0x1ED368000;
                  }
LABEL_83:
                  if (!v52)
                  {
                    LODWORD(v1574) = 0;
                    v1556 = 1;
                    v52 = v1547;
                    v54 = "Medium";
                    v3 = v1570;
                    goto LABEL_89;
                  }
                  if ((v53 & 1) != 0)
                  {
                    LODWORD(v1574) = 0;
                    v1556 = 0;
                    v54 = "Invalid";
                    v3 = v1570;
                    goto LABEL_89;
                  }
                  v3 = v1570;
LABEL_88:
                  LODWORD(v1574) = 0;
                  v1556 = 2;
                  v54 = "High";
LABEL_89:
                  v55 = (_QWORD *)*v52;
                  v1557 = v49;
                  if (v55)
                  {
                    v56 = v55[3];
                    if ((*(_BYTE *)(v56 + 84) & 1) == 0)
                    {
                      v1567 = (uint64_t)v52;
                      v1564 = v45;
                      v1552 = v54;
                      v57 = 0;
                      v58 = 0;
                      LODWORD(v1568) = 0;
                      v59 = *(const char **)(v56 + 8);
                      v60 = *(unsigned __int8 *)(v56 + 83);
                      v61 = 568;
                      if (v60 == 3)
                        v61 = 584;
                      v62 = v60 == 2;
                      v63 = 600;
                      if (!v62)
                        v63 = v61;
                      v1565 = (void (*)(uint64_t))v63;
                      v64 = 9;
                      v1575 = v48;
                      v1563 = v59;
                      if (*(_BYTE *)(v50 + 1513))
                      {
LABEL_96:
                        v65 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v66 = v65;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_99;
                        }
                        v67 = os_log_type_enabled(v65, OS_LOG_TYPE_INFO);

                        v50 = 0x1ED368000;
                        if (v67)
                        {
LABEL_99:
                          v68 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          _NRLogWithArgs((uint64_t)v68, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v69, v70, v71, v72, v73, (uint64_t)"");

                          v50 = 0x1ED368000uLL;
                        }
                      }
LABEL_100:
                      v1569 = 0;
                      v74 = 0;
                      v1566 = 0;
                      v1580 = 0u;
                      v1581 = 0u;
                      v1578 = 0u;
                      v1579 = 0u;
                      if (*(_BYTE *)(v50 + 1513))
                      {
LABEL_101:
                        v75 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v76 = v75;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_104;
                        }
                        v77 = os_log_type_enabled(v75, OS_LOG_TYPE_INFO);

                        v50 = 0x1ED368000;
                        if (v77)
                        {
LABEL_104:
                          v78 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          _NRLogWithArgs((uint64_t)v78, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v79, v80, v81, v82, v83, (uint64_t)"");

                          v50 = 0x1ED368000;
                        }
                      }
                      while (2)
                      {
                        v84 = v64 | 0x10;
                        if ((v1574 & 1) == 0)
                        {
                          v86 = *(_DWORD *)(v56 + 28);
                          v85 = *(unsigned int *)(v56 + 32);
                          if (v86 > v85)
                          {
                            v87 = *(unsigned __int16 *)(v56 + 80);
                            if ((unsigned __int16)(v86 - v85) >= (unsigned __int16)(0x4000 - v87))
                              v88 = (unsigned __int16)(0x4000 - v87);
                            else
                              v88 = (unsigned __int16)(v86 - v85);
                            v89 = (char *)v1563;
                            memcpy((void *)(*(_QWORD *)v56 + v87), &v1563[v85], v88);
                            v90 = *(_DWORD *)(v56 + 28);
                            v91 = *(_DWORD *)(v56 + 32) + v88;
                            *(_DWORD *)(v56 + 32) = v91;
                            if (v90 <= v91)
                            {
                              v92 = 0;
                            }
                            else
                            {
                              memmove(v89, &v89[v91], v90 - v91);
                              v92 = *(_DWORD *)(v56 + 28) - *(_DWORD *)(v56 + 32);
                            }
                            v50 = 0x1ED368000uLL;
                            *(_DWORD *)(v56 + 28) = v92;
                            *(_DWORD *)(v56 + 32) = 0;
                            *(_WORD *)(v56 + 80) += v88;
                            if (gNRPacketLoggingEnabled)
                            {
                              v191 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v192 = v191;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                LODWORD(v1562) = os_log_type_enabled(v191, OS_LOG_TYPE_INFO);

                                v50 = 0x1ED368000;
                                if (!(_DWORD)v1562)
                                  goto LABEL_114;
                              }
                              v219 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v219, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v220, v221, v222, v223, v224, (uint64_t)"");

                              v50 = 0x1ED368000;
                            }
LABEL_114:
                            v84 = v64 | 0x30;
                            v57 += v88;
                          }
                        }
                        v93 = v1569;
                        if (v1575)
                        {
                          v93 = (os_log_t)os_channel_get_next_slot();
                          v50 = 0x1ED368000;
                        }
                        if (!v93)
                        {
                          v141 = 0;
                          goto LABEL_163;
                        }
LABEL_118:
                        v94 = 0x4000 - *(unsigned __int16 *)(v56 + 80);
                        if (v94 < nrMaxTLVLengthForPacket(v1579, WORD1(v1578)))
                        {
                          v84 |= 0x40u;
                          v50 = 0x1ED368000uLL;
                          if (!gNRPacketLoggingEnabled)
                          {
                            v141 = v93;
                            goto LABEL_163;
                          }
                          v185 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v186 = v185;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_222;
                          }
                          LODWORD(v1569) = os_log_type_enabled(v185, OS_LOG_TYPE_INFO);

                          if ((_DWORD)v1569)
                          {
LABEL_222:
                            v199 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v199, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v200, v201, v202, v203, v204, (uint64_t)"");

                          }
                          v141 = v93;
LABEL_162:
                          v50 = 0x1ED368000uLL;
LABEL_163:
                          v142 = *(unsigned __int16 *)(v56 + 80);
                          v143 = *(_WORD *)(v56 + 80) != 0;
                          if (*(_WORD *)(v56 + 80))
                          {
                            v1569 = v141;
                            v1576 = 0;
                            v144 = v50;
                            if (!*(_BYTE *)(v50 + 1513))
                              goto LABEL_165;
                            v167 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            v168 = v167;
                            if (sNRCopyLogToStdErr)
                            {

                              v144 = 0x1ED368000;
                              goto LABEL_206;
                            }
                            LODWORD(v1562) = os_log_type_enabled(v167, OS_LOG_TYPE_INFO);

                            v144 = 0x1ED368000;
                            if ((_DWORD)v1562)
                            {
LABEL_206:
                              v173 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v173, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v174, v175, v176, v177, v178, (uint64_t)"");

                            }
LABEL_165:
                            v145 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, unint64_t *, _QWORD, _QWORD))(*(_QWORD *)v1567 + 8))(**(_QWORD **)v1567, *(_QWORD *)v56, *(unsigned __int16 *)(v56 + 80), &v1576, 0, 0);
                            v50 = v144;
                            if (*(_BYTE *)(v144 + 1513))
                            {
                              v169 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v170 = v169;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                LODWORD(v1562) = os_log_type_enabled(v169, OS_LOG_TYPE_INFO);

                                v50 = 0x1ED368000;
                                if (!(_DWORD)v1562)
                                  goto LABEL_166;
                              }
                              v179 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v179, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v180, v181, v182, v183, v184, (uint64_t)"");

                              v50 = 0x1ED368000;
                            }
LABEL_166:
                            if ((v145 & 1) == 0)
                            {
                              if (v1564)
                              {
                                v1564(v1570);
                                v50 = 0x1ED368000uLL;
                              }
                              *(_BYTE *)(v56 + 84) |= 1u;
                              switch(*(_BYTE *)(v56 + 83))
                              {
                                case 0:
                                  v148 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v149 = v148;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    LODWORD(v1562) = os_log_type_enabled(v148, OS_LOG_TYPE_ERROR);

                                    v50 = 0x1ED368000;
                                    if (!(_DWORD)v1562)
                                      goto LABEL_186;
                                  }
                                  v158 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v158, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v159, v160, v161, v162, v163, (uint64_t)"");
                                  goto LABEL_185;
                                case 1:
                                  v156 = v1570;
                                  v157 = *(_QWORD *)(v1570 + 136);
                                  ++*(_QWORD *)(v1570 + 144);
                                  *(_QWORD *)(v156 + 136) = v157 & 0xFFFFFFFFFFFFFFFELL | *(_BYTE *)(v56 + 84) & 1;
                                  if (!*(_BYTE *)(v50 + 1513))
                                    goto LABEL_181;
                                  v217 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v218 = v217;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    LODWORD(v1562) = os_log_type_enabled(v217, OS_LOG_TYPE_INFO);

                                    v50 = 0x1ED368000;
                                    if (!(_DWORD)v1562)
                                      goto LABEL_186;
                                  }
                                  v158 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v158, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v235, v236, v237, v238, v239, (uint64_t)"");
                                  goto LABEL_185;
                                case 2:
                                  v150 = v1570;
                                  ++*(_QWORD *)(v1570 + 160);
                                  *(_QWORD *)(v150 + 136) = *(_QWORD *)(v150 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(_BYTE *)(v56 + 84) & 1));
                                  if (!*(_BYTE *)(v50 + 1513))
                                    goto LABEL_181;
                                  v151 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v152 = v151;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    LODWORD(v1562) = os_log_type_enabled(v151, OS_LOG_TYPE_INFO);

                                    v50 = 0x1ED368000;
                                    if (!(_DWORD)v1562)
                                      goto LABEL_186;
                                  }
                                  v158 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v158, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v225, v226, v227, v228, v229, (uint64_t)"");
                                  goto LABEL_185;
                                case 3:
                                  v153 = v1570;
                                  ++*(_QWORD *)(v1570 + 176);
                                  *(_QWORD *)(v153 + 136) = *(_QWORD *)(v153 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(_BYTE *)(v56 + 84) & 1));
                                  if (!*(_BYTE *)(v50 + 1513))
                                  {
LABEL_181:
                                    v146 = v84 | 0x1800;
                                    v147 = v1576;
                                    if (v1576)
                                      goto LABEL_188;
                                    goto LABEL_194;
                                  }
                                  v154 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v155 = v154;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    LODWORD(v1562) = os_log_type_enabled(v154, OS_LOG_TYPE_INFO);

                                    v50 = 0x1ED368000;
                                    if (!(_DWORD)v1562)
                                      goto LABEL_186;
                                  }
                                  v158 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v158, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v230, v231, v232, v233, v234, (uint64_t)"");
LABEL_185:

                                  v50 = 0x1ED368000uLL;
LABEL_186:
                                  v146 = v84 | 0x1800;
                                  if (!*(_BYTE *)(v50 + 1513))
                                  {
                                    v147 = v1576;
                                    if (!v1576)
                                      goto LABEL_194;
                                    goto LABEL_188;
                                  }
                                  v171 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v172 = v171;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    LODWORD(v1562) = os_log_type_enabled(v171, OS_LOG_TYPE_INFO);

                                    if (!(_DWORD)v1562)
                                      goto LABEL_219;
                                  }
                                  v193 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v193, 1, (uint64_t)"%s%.30s:%-4d ", v194, v195, v196, v197, v198, (uint64_t)"");

LABEL_219:
                                  v50 = 0x1ED368000;
                                  v147 = v1576;
                                  if (v1576)
                                    goto LABEL_188;
                                  break;
                                default:
                                  goto LABEL_186;
                              }
                              goto LABEL_194;
                            }
                            v146 = v84 | 0x800;
                            v147 = v1576;
                            if (!v1576)
                            {
LABEL_194:
                              LODWORD(v1568) = v1568 + 1;
                              if ((v145 & 1) != 0)
                              {
                                v165 = *(unsigned __int8 *)(v56 + 82);
                                if (v165 >= 0xB)
                                {
                                  v165 = *(unsigned __int8 *)(v56 + 82)
                                       - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v56 + 82)) >> 32);
                                  *(_BYTE *)(v56 + 82) = v165;
                                }
                                v64 = 0;
                                *(_DWORD *)(v56 + 4 * v165 + 36) = v146;
                                v166 = (117 * (*(_BYTE *)(v56 + 82) + 1)) >> 8;
                                *(_BYTE *)(v56 + 82) = *(_BYTE *)(v56 + 82)
                                                     + 1
                                                     - 11
                                                     * ((v166
                                                       + (((*(_BYTE *)(v56 + 82) + 1 - v166) & 0xFE) >> 1)) >> 3);
                                if (!*(_BYTE *)(v50 + 1513))
                                  continue;
                                goto LABEL_101;
                              }
LABEL_247:
                              v240 = v142 == 0;
                              if (!*(_BYTE *)(v50 + 1513))
                              {
                                v241 = v146 | 0x8000;
                                if (v74)
                                  goto LABEL_249;
LABEL_240:
                                v3 = v1570;
                                if (!*(_BYTE *)(v1570 + 13))
                                {
LABEL_255:
                                  if (v143 && v240)
                                  {
                                    v252 = *(unsigned __int8 *)(v56 + 82);
                                    if (v252 >= 0xB)
                                    {
                                      v252 = *(unsigned __int8 *)(v56 + 82)
                                           - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v56 + 82)) >> 32);
                                      *(_BYTE *)(v56 + 82) = v252;
                                    }
                                    *(_DWORD *)(v56 + 4 * v252 + 36) = v241;
                                    v253 = (117 * (*(_BYTE *)(v56 + 82) + 1)) >> 8;
                                    *(_BYTE *)(v56 + 82) = *(_BYTE *)(v56 + 82)
                                                         + 1
                                                         - 11
                                                         * ((v253
                                                           + (((*(_BYTE *)(v56 + 82) + 1 - v253) & 0xFE) >> 1)) >> 3);
                                    v64 = 8;
                                    if (!*(_BYTE *)(v50 + 1513))
                                      goto LABEL_100;
                                    goto LABEL_96;
                                  }
                                  if (*(_BYTE *)(v50 + 1513))
                                  {
                                    v310 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    v311 = v310;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v3 = v1570;
                                    }
                                    else
                                    {
                                      v316 = os_log_type_enabled(v310, OS_LOG_TYPE_INFO);

                                      v3 = v1570;
                                      v50 = 0x1ED368000;
                                      if (!v316)
                                        goto LABEL_274;
                                    }
                                    v317 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    _NRLogWithArgs((uint64_t)v317, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v318, v319, v320, v321, v322, (uint64_t)"");

                                    v50 = 0x1ED368000;
                                  }
LABEL_274:
                                  if (v143)
                                    goto LABEL_314;
                                  if (v1556 != 1)
                                  {
                                    if (v1556 != 2)
                                    {
                                      if (v1556 == 3)
                                      {
                                        v272 = *(_QWORD *)(v3 + 136);
                                        if ((v272 & 8) != 0 && *v1553)
                                        {
                                          *(_QWORD *)(v3 + 136) = v272 & 0xFFFFFFFFFFFFFFF7;
                                          v273 = (dispatch_object_t *)v1553;
                                          if (*(_BYTE *)(v50 + 1513))
                                          {
                                            v274 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                            v275 = v274;
                                            if (sNRCopyLogToStdErr)
                                            {

                                              v3 = v1570;
                                              goto LABEL_362;
                                            }
                                            v376 = os_log_type_enabled(v274, OS_LOG_TYPE_INFO);

                                            v273 = (dispatch_object_t *)v1553;
                                            v3 = v1570;
                                            if (v376)
                                            {
LABEL_362:
                                              v355 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                              _NRLogWithArgs((uint64_t)v355, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v377, v378, v379, v380, v381, (uint64_t)"");
                                              v361 = (id *)&v1581 + 1;
                                              goto LABEL_365;
                                            }
                                          }
                                          goto LABEL_313;
                                        }
                                        goto LABEL_314;
                                      }
                                      v276 = *(_QWORD *)(v3 + 136);
LABEL_297:
                                      if ((v276 & 8) != 0 && *v1553)
                                      {
                                        *(_QWORD *)(v3 + 136) = v276 & 0xFFFFFFFFFFFFFFF7;
                                        if (!*(_BYTE *)(v50 + 1513))
                                          goto LABEL_300;
                                        v341 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        v342 = v341;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          v3 = v1570;
                                          goto LABEL_358;
                                        }
                                        v362 = os_log_type_enabled(v341, OS_LOG_TYPE_INFO);

                                        v3 = v1570;
                                        if (v362)
                                        {
LABEL_358:
                                          v363 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                          _NRLogWithArgs((uint64_t)v363, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v364, v365, v366, v367, v368, (uint64_t)"");

                                        }
LABEL_300:
                                        dispatch_resume(*(dispatch_object_t *)(v3 + 304));
                                        v276 = *(_QWORD *)(v3 + 136);
                                      }
                                      if ((v276 & 0x10) != 0 && *v1543)
                                      {
                                        *(_QWORD *)(v3 + 136) = v276 & 0xFFFFFFFFFFFFFFEFLL;
                                        if (!gNRPacketLoggingEnabled)
                                          goto LABEL_304;
                                        v343 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        v344 = v343;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          v3 = v1570;
                                          goto LABEL_360;
                                        }
                                        v369 = os_log_type_enabled(v343, OS_LOG_TYPE_INFO);

                                        v3 = v1570;
                                        if (v369)
                                        {
LABEL_360:
                                          v370 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                          _NRLogWithArgs((uint64_t)v370, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v371, v372, v373, v374, v375, (uint64_t)"");

                                        }
LABEL_304:
                                        dispatch_resume(*(dispatch_object_t *)(v3 + 320));
                                        v276 = *(_QWORD *)(v3 + 136);
                                      }
                                      if ((v276 & 0x20) != 0)
                                      {
                                        v50 = 0x1ED368000uLL;
                                        if (*v1542)
                                          goto LABEL_307;
LABEL_310:
                                        if ((v276 & 0x40) != 0 && *v1544)
                                        {
                                          *(_QWORD *)(v3 + 136) = v276 & 0xFFFFFFFFFFFFFFBFLL;
                                          v273 = (dispatch_object_t *)v1544;
                                          if (!*(_BYTE *)(v50 + 1513))
                                            goto LABEL_313;
                                          v339 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                          v340 = v339;
                                          if (sNRCopyLogToStdErr)
                                          {

                                            v3 = v1570;
                                          }
                                          else
                                          {
                                            v354 = os_log_type_enabled(v339, OS_LOG_TYPE_INFO);

                                            v273 = (dispatch_object_t *)v1544;
                                            v3 = v1570;
                                            if (!v354)
                                              goto LABEL_313;
                                          }
                                          v355 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                          _NRLogWithArgs((uint64_t)v355, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v356, v357, v358, v359, v360, (uint64_t)"");
                                          v361 = (id *)&v1576;
                                          goto LABEL_365;
                                        }
                                        goto LABEL_314;
                                      }
LABEL_309:
                                      v50 = 0x1ED368000uLL;
                                      goto LABEL_310;
                                    }
                                    v277 = *(_QWORD *)(v3 + 136);
                                    if ((v277 & 8) != 0 && *v1553)
                                    {
                                      *(_QWORD *)(v3 + 136) = v277 & 0xFFFFFFFFFFFFFFF7;
                                      if (!*(_BYTE *)(v50 + 1513))
                                        goto LABEL_290;
                                      v345 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v346 = v345;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v3 = v1570;
                                        goto LABEL_367;
                                      }
                                      v388 = os_log_type_enabled(v345, OS_LOG_TYPE_INFO);

                                      v3 = v1570;
                                      if (v388)
                                      {
LABEL_367:
                                        v389 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        _NRLogWithArgs((uint64_t)v389, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v390, v391, v392, v393, v394, (uint64_t)"");

                                      }
LABEL_290:
                                      dispatch_resume(*(dispatch_object_t *)(v3 + 304));
                                      v277 = *(_QWORD *)(v3 + 136);
                                      v50 = 0x1ED368000uLL;
                                    }
                                    if ((v277 & 0x10) != 0 && *v1543)
                                    {
                                      *(_QWORD *)(v3 + 136) = v277 & 0xFFFFFFFFFFFFFFEFLL;
                                      v273 = (dispatch_object_t *)v1543;
                                      if (!*(_BYTE *)(v50 + 1513))
                                        goto LABEL_313;
                                      v278 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v279 = v278;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v3 = v1570;
                                      }
                                      else
                                      {
                                        v382 = os_log_type_enabled(v278, OS_LOG_TYPE_INFO);

                                        v273 = (dispatch_object_t *)v1543;
                                        v3 = v1570;
                                        if (!v382)
                                          goto LABEL_313;
                                      }
                                      v355 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      _NRLogWithArgs((uint64_t)v355, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v383, v384, v385, v386, v387, (uint64_t)"");
                                      v361 = &v1575;
LABEL_365:
                                      v273 = (dispatch_object_t *)*(v361 - 32);

                                      v3 = v1570;
LABEL_313:
                                      dispatch_resume(*v273);
                                      v50 = 0x1ED368000uLL;
                                    }
LABEL_314:
                                    if (*(_BYTE *)(v50 + 1513))
                                    {
                                      v312 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v313 = v312;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v3 = v1570;
                                      }
                                      else
                                      {
                                        v323 = os_log_type_enabled(v312, OS_LOG_TYPE_INFO);

                                        v3 = v1570;
                                        if (!v323)
                                          goto LABEL_315;
                                      }
                                      v324 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      _NRLogWithArgs((uint64_t)v324, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v325, v326, v327, v328, v329, (uint64_t)"");

                                    }
LABEL_315:
                                    v280 = *(unsigned __int8 *)(v56 + 82);
                                    if (v280 >= 0xB)
                                    {
                                      v280 = *(unsigned __int8 *)(v56 + 82)
                                           - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v56 + 82)) >> 32);
                                      *(_BYTE *)(v56 + 82) = v280;
                                    }
                                    *(_DWORD *)(v56 + 4 * v280 + 36) = v241 | 0x60000;
                                    v281 = (117 * (*(_BYTE *)(v56 + 82) + 1)) >> 8;
                                    *(_BYTE *)(v56 + 82) = *(_BYTE *)(v56 + 82)
                                                         + 1
                                                         - 11
                                                         * ((v281
                                                           + (((*(_BYTE *)(v56 + 82) + 1 - v281) & 0xFE) >> 1)) >> 3);
                                    v21 = v1541;
                                    goto LABEL_54;
                                  }
                                  v276 = *(_QWORD *)(v3 + 136);
                                  if ((*(_BYTE *)(v3 + 10) & 4) == 0)
                                    goto LABEL_297;
                                  if ((v276 & 0x20) == 0 || !*v1542)
                                    goto LABEL_310;
LABEL_307:
                                  *(_QWORD *)(v3 + 136) = v276 & 0xFFFFFFFFFFFFFFDFLL;
                                  if (!*(_BYTE *)(v50 + 1513))
                                  {
LABEL_308:
                                    dispatch_resume(*(dispatch_object_t *)(v3 + 336));
                                    v276 = *(_QWORD *)(v3 + 136);
                                    goto LABEL_309;
                                  }
                                  v337 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                  v338 = v337;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    v3 = v1570;
                                  }
                                  else
                                  {
                                    v347 = os_log_type_enabled(v337, OS_LOG_TYPE_INFO);

                                    v3 = v1570;
                                    if (!v347)
                                      goto LABEL_308;
                                  }
                                  v348 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                  _NRLogWithArgs((uint64_t)v348, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v349, v350, v351, v352, v353, (uint64_t)"");

                                  goto LABEL_308;
                                }
LABEL_250:
                                if (v1568 <= 8u)
                                {
                                  if (!v1575)
                                    goto LABEL_255;
                                  v251 = os_channel_available_slot_count();
                                  v50 = 0x1ED368000uLL;
                                  if (v251 > 1)
                                    goto LABEL_255;
                                }
                                if (!*(_BYTE *)(v50 + 1513))
                                {
LABEL_254:
                                  v241 = v146 | 0x18000;
                                  os_channel_sync();
                                  *(_BYTE *)(v3 + 13) = 0;
                                  v50 = 0x1ED368000uLL;
                                  goto LABEL_255;
                                }
                                v256 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                v257 = v256;
                                if (sNRCopyLogToStdErr)
                                {

                                  v3 = v1570;
                                }
                                else
                                {
                                  v265 = os_log_type_enabled(v256, OS_LOG_TYPE_INFO);

                                  v3 = v1570;
                                  if (!v265)
                                    goto LABEL_254;
                                }
                                v266 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                _NRLogWithArgs((uint64_t)v266, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v267, v268, v269, v270, v271, (uint64_t)"");

                                v3 = v1570;
                                goto LABEL_254;
                              }
                              v254 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v255 = v254;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_265;
                              }
                              v258 = os_log_type_enabled(v254, OS_LOG_TYPE_INFO);

                              if (v258)
                              {
LABEL_265:
                                v259 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs((uint64_t)v259, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v260, v261, v262, v263, v264, (uint64_t)"");

                              }
                              v50 = 0x1ED368000;
                              v241 = v146 | 0x8000;
                              if (!v74)
                                goto LABEL_240;
LABEL_249:
                              os_channel_advance_slot();
                              v50 = 0x1ED368000;
                              v3 = v1570;
                              *(_BYTE *)(v1570 + 13) = 1;
                              goto LABEL_250;
                            }
LABEL_188:
                            if (v147 < *(unsigned __int16 *)(v56 + 80))
                            {
                              if (!*(_BYTE *)(v50 + 1513))
                                goto LABEL_190;
                              v187 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v188 = v187;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_225;
                              }
                              LODWORD(v1562) = os_log_type_enabled(v187, OS_LOG_TYPE_INFO);

                              if ((_DWORD)v1562)
                              {
LABEL_225:
                                v205 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs((uint64_t)v205, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v206, v207, v208, v209, v210, (uint64_t)"");

                              }
LABEL_190:
                              v146 |= 0x2000u;
                              memmove(*(void **)v56, (const void *)(*(_QWORD *)v56 + v1576), *(unsigned __int16 *)(v56 + 80) - v1576);
                              v164 = v1576;
                              *(_WORD *)(v56 + 80) -= v1576;
                              v1566 = (v1566 + 1);
                              v50 = 0x1ED368000;
LABEL_193:
                              *(_QWORD *)((char *)v1565 + v1570) += v164;
                              goto LABEL_194;
                            }
                            if (!*(_BYTE *)(v50 + 1513))
                            {
LABEL_192:
                              v146 |= 0x4000u;
                              *(_WORD *)(v56 + 80) = 0;
                              v164 = v1576;
                              goto LABEL_193;
                            }
                            v189 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            v190 = v189;
                            if (sNRCopyLogToStdErr)
                            {

                            }
                            else
                            {
                              LODWORD(v1562) = os_log_type_enabled(v189, OS_LOG_TYPE_INFO);

                              v50 = 0x1ED368000;
                              if (!(_DWORD)v1562)
                                goto LABEL_192;
                            }
                            v211 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v211, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v212, v213, v214, v215, v216, (uint64_t)"");

                            v50 = 0x1ED368000;
                            goto LABEL_192;
                          }
                          v146 = v84 | 0x400;
                          if (!*(_BYTE *)(v50 + 1513))
                          {
                            v143 = 0;
                            v240 = 1;
                            v241 = v146 | 0x8000;
                            if (v74)
                              goto LABEL_249;
                            goto LABEL_240;
                          }
                          v242 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v243 = v242;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_245;
                          }
                          v244 = os_log_type_enabled(v242, OS_LOG_TYPE_INFO);

                          if (v244)
                          {
LABEL_245:
                            v245 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v245, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v246, v247, v248, v249, v250, (uint64_t)"");

                          }
                          v50 = 0x1ED368000uLL;
                          goto LABEL_247;
                        }
                        break;
                      }
                      os_channel_slot_get_packet();
                      os_packet_get_next_buflet();
                      v95 = os_buflet_get_data_offset();
                      v96 = os_buflet_get_object_address();
                      v97 = os_buflet_get_data_length();
                      if (v97 >= 0x10000)
                      {
                        if (nrCopyLogObj_onceToken_509 != -1)
                          dispatch_once(&nrCopyLogObj_onceToken_509, &__block_literal_global_353);
                        if (sNRCopyLogToStdErr
                          || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_510, OS_LOG_TYPE_ERROR))
                        {
                          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_510, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen <= 65535", v98, v99, v100, v101, v102, (uint64_t)"");
                        }
                        goto LABEL_377;
                      }
                      v103 = v97;
                      if (!(_WORD)v97 && WORD1(v1578))
                      {
                        v1576 = 0;
                        v1577 = 0;
                        v1576 = *(_QWORD *)v56 + *(unsigned __int16 *)(v56 + 80);
                        LODWORD(v1577) = v94;
                        v104 = nrPacketToTLV((unsigned __int8 *)v1579, WORD1(v1578), (uint64_t)&v1576, 1u, v1572, v1571);
                        if (!gNRPacketLoggingEnabled)
                          goto LABEL_123;
                        v109 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v110 = v109;
                        if (sNRCopyLogToStdErr)
                        {

                          goto LABEL_143;
                        }
                        v115 = os_log_type_enabled(v109, OS_LOG_TYPE_INFO);

                        if (v115)
                        {
LABEL_143:
                          v116 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v117 = v1579;
                          v118 = WORD1(v1578);
                          valid = isPacketValidIPv6((_BYTE *)v1579, WORD1(v1578));
                          v1569 = v116;
                          if (valid)
                            isNextHeaderValidESP(v117, v118);
                          v120 = v1579;
                          v121 = WORD1(v1578);
                          if (isPacketValidIPv6((_BYTE *)v1579, WORD1(v1578)))
                            isNextHeaderValidESP(v120, v121);
                          v127 = v1569;
                          _NRLogWithArgs((uint64_t)v1569, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v122, v123, v124, v125, v126, (uint64_t)"");

                        }
LABEL_123:
                        v84 |= 0x80u;
LABEL_129:
                        *(_WORD *)(v56 + 80) += v104;
                        if ((v1574 & 1) != 0)
                          v106 = 0;
                        else
                          v106 = os_channel_get_next_slot();
                        ++v58;
                        ++*v47;
                        *ESPSequenceNumberFromPacket = 1;
                        v57 += v104;
                        if (!v106)
                        {
                          v141 = 0;
                          v74 = v93;
                          goto LABEL_162;
                        }
                        v107 = *(unsigned __int8 *)(v56 + 82);
                        if (v107 >= 0xB)
                        {
                          v107 = *(unsigned __int8 *)(v56 + 82)
                               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v56 + 82)) >> 32);
                          *(_BYTE *)(v56 + 82) = v107;
                        }
                        *(_DWORD *)(v56 + 4 * v107 + 36) = v84;
                        v108 = (117 * (*(_BYTE *)(v56 + 82) + 1)) >> 8;
                        *(_BYTE *)(v56 + 82) = *(_BYTE *)(v56 + 82)
                                             + 1
                                             - 11
                                             * ((v108
                                               + (((*(_BYTE *)(v56 + 82) + 1 - v108) & 0xFE) >> 1)) >> 3);
                        v74 = v93;
                        v93 = (os_log_t)v106;
                        v84 = 0;
                        goto LABEL_118;
                      }
                      if ((_WORD)v97)
                      {
                        v105 = v96 + v95;
                        v1576 = 0;
                        v1577 = 0;
                        v1576 = *(_QWORD *)v56 + *(unsigned __int16 *)(v56 + 80);
                        LODWORD(v1577) = v94;
                        v104 = nrPacketToTLV((unsigned __int8 *)v105, (unsigned __int16)v97, (uint64_t)&v1576, 1u, v1572, v1571);
                        if (!gNRPacketLoggingEnabled)
                        {
LABEL_126:
                          v84 |= 0x100u;
                          goto LABEL_129;
                        }
                        v111 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v112 = v111;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          LODWORD(v1569) = os_log_type_enabled(v111, OS_LOG_TYPE_INFO);

                          if (!(_DWORD)v1569)
                            goto LABEL_126;
                        }
                        v1569 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        if (isPacketValidIPv6((_BYTE *)v105, v103) && isNextHeaderValidESP(v105, v103))
                          v1562 = (const char *)bswap32(*(_DWORD *)(v105 + 44));
                        else
                          v1562 = 0;
                        if (isPacketValidIPv6((_BYTE *)v105, v103))
                          isNextHeaderValidESP(v105, v103);
                        v133 = v1569;
                        _NRLogWithArgs((uint64_t)v1569, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v128, v129, v130, v131, v132, (uint64_t)"");

                        goto LABEL_126;
                      }
                      v84 |= 0x200u;
                      if (!gNRPacketLoggingEnabled)
                      {
LABEL_128:
                        v104 = 0;
                        goto LABEL_129;
                      }
                      v113 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      v114 = v113;
                      if (sNRCopyLogToStdErr)
                      {

                      }
                      else
                      {
                        v134 = os_log_type_enabled(v113, OS_LOG_TYPE_INFO);

                        if (!v134)
                          goto LABEL_128;
                      }
                      v135 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      _NRLogWithArgs((uint64_t)v135, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v136, v137, v138, v139, v140, (uint64_t)"");

                      goto LABEL_128;
                    }
                    if (!*(_BYTE *)(v50 + 1513))
                    {
LABEL_271:
                      v3 = v1570;
                      if (v45)
                        v45(v1570);
                      v37 = *(unsigned __int8 *)(v56 + 82);
                      if (v37 >= 0xB)
                      {
                        v37 = *(unsigned __int8 *)(v56 + 82)
                            - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v56 + 82)) >> 32);
                        *(_BYTE *)(v56 + 82) = v37;
                      }
                      *(_DWORD *)(v56 + 4 * v37 + 36) = 3;
                      v38 = (117 * (*(_BYTE *)(v56 + 82) + 1)) >> 8;
                      *(_BYTE *)(v56 + 82) = *(_BYTE *)(v56 + 82)
                                           + 1
                                           - 11
                                           * ((v38 + (((*(_BYTE *)(v56 + 82) + 1 - v38) & 0xFE) >> 1)) >> 3);
                      goto LABEL_54;
                    }
                    v287 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    v288 = v287;
                    if (sNRCopyLogToStdErr)
                    {

                    }
                    else
                    {
                      v303 = os_log_type_enabled(v287, OS_LOG_TYPE_INFO);

                      if (!v303)
                        goto LABEL_271;
                    }
                    v304 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    _NRLogWithArgs((uint64_t)v304, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v305, v306, v307, v308, v309, (uint64_t)"");

                    goto LABEL_271;
                  }
                  v284 = (uint64_t)v54;
                  if (!*(_BYTE *)(v50 + 1513))
                    goto LABEL_321;
                  v395 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                  v396 = v395;
                  if (sNRCopyLogToStdErr)
                  {

                    v3 = v1570;
                    v21 = v1541;
                  }
                  else
                  {
                    v397 = os_log_type_enabled(v395, OS_LOG_TYPE_INFO);

                    v3 = v1570;
                    v21 = v1541;
                    if (!v397)
                      goto LABEL_321;
                  }
                  v398 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                  _NRLogWithArgs((uint64_t)v398, 1, (uint64_t)"%s%.30s:%-4d ", v399, v400, v401, v402, v403, (uint64_t)"");

LABEL_321:
                  v285 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                  v286 = v285;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v296 = os_log_type_enabled(v285, OS_LOG_TYPE_FAULT);

                    if (!v296)
                      goto LABEL_54;
                  }
                  v297 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                  _NRLogWithArgs((uint64_t)v297, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v298, v299, v300, v301, v302, v284);

LABEL_54:
                  v22 = v1555;
                  v34 = (int)v1560;
                  v35 = v1554;
                  v39 = (int)v1559;
                  goto LABEL_55;
              }
              v47 = (_QWORD *)*(v46 - 32);
              v1561 = *v42;
              v48 = *v43;
              v49 = *v44;
              goto LABEL_60;
            }
            if ((*(_BYTE *)(v3 + 10) & 4) == 0)
            {
LABEL_29:
              v21 = 4;
              v22 = (unsigned __int8 *)&NRParserLinkWriteAvailable_priorityArrayFull;
              goto LABEL_49;
            }
            if (*(_BYTE *)(v3 + 8) == 4)
            {
LABEL_648:
              if (*(_BYTE *)(v3 + 8) == 4)
              {
LABEL_3:

                return;
              }
              dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
              v1564 = *(void (**)(uint64_t))(v3 + 216);
              v681 = *(_QWORD *)(v3 + 256);
              v682 = *(id *)(v3 + 320);
              v683 = 0x1ED368000uLL;
              if (gNRPacketLoggingEnabled)
              {
                v692 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                v693 = v692;
                if (sNRCopyLogToStdErr)
                {

                  v3 = v1570;
                }
                else
                {
                  v938 = os_log_type_enabled(v692, OS_LOG_TYPE_INFO);

                  v3 = v1570;
                  v683 = 0x1ED368000;
                  if (!v938)
                    goto LABEL_650;
                }
                v939 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                _NRLogWithArgs((uint64_t)v939, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v940, v941, v942, v943, v944, (uint64_t)"");

                v683 = 0x1ED368000;
              }
LABEL_650:
              if ((*(_BYTE *)(v3 + 10) & 4) != 0)
              {
                v1569 = (os_log_t)(v3 + 112);
                v685 = NRBluetoothPacketParserSuspendNexusVIInputSource;
LABEL_660:
                v688 = "High";
                v687 = 2;
                goto LABEL_672;
              }
              v684 = *(_QWORD *)(v3 + 104);
              if (!v684)
              {
                v685 = NRBluetoothPacketParserSuspendNexusVIInputSource;
                goto LABEL_671;
              }
              if ((*(_BYTE *)(*(_QWORD *)v684 + 27) & 3) == 1 && !*(_BYTE *)(v3 + 12))
              {

                v683 = 0x1ED368000;
                v686 = 0;
                v685 = 0;
                v682 = 0;
                v681 = 0;
                v1564 = 0;
                v1569 = (os_log_t)(v3 + 112);
                if (!*(_BYTE *)(v3 + 12))
                  goto LABEL_656;
              }
              else
              {
                v1569 = 0;
                v685 = NRBluetoothPacketParserSuspendNexusVIInputSource;
                v686 = 1;
                if (!*(_BYTE *)(v3 + 12))
                  goto LABEL_656;
              }
              if (!*(_BYTE *)(v683 + 1513))
                goto LABEL_656;
              v970 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              v971 = v970;
              if (sNRCopyLogToStdErr)
              {

                v3 = v1570;
              }
              else
              {
                v1253 = os_log_type_enabled(v970, OS_LOG_TYPE_INFO);

                v3 = v1570;
                v683 = 0x1ED368000;
                if (!v1253)
                  goto LABEL_656;
              }
              v1254 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              _NRLogWithArgs((uint64_t)v1254, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v1255, v1256, v1257, v1258, v1259, (uint64_t)"");

              v683 = 0x1ED368000;
LABEL_656:
              if (v1569)
              {
                if ((v686 & 1) != 0)
                {
                  v687 = 0;
                  v688 = "Invalid";
                  goto LABEL_672;
                }
                goto LABEL_660;
              }
LABEL_671:
              v1569 = (os_log_t)(v3 + 96);
              v688 = "Medium";
              v687 = 1;
LABEL_672:
              if (v1569->isa)
              {
                v696 = *((_QWORD *)v1569->isa + 3);
                v697 = *(_BYTE *)(v696 + 84);
                v1565 = v685;
                if ((v697 & 1) == 0)
                {
                  LODWORD(v1560) = v687;
                  v1563 = v688;
                  v1561 = v682;
                  v1562 = (const char *)&v1528;
                  v698 = 0;
                  v699 = v3;
                  v700 = 0;
                  LODWORD(v1572) = 0;
                  v1559 = (dispatch_object_t *)(v699 + 320);
                  v701 = *(_QWORD *)(v696 + 8);
                  v702 = *(unsigned __int8 *)(v696 + 83);
                  v703 = 568;
                  if (v702 == 3)
                    v703 = 584;
                  v62 = v702 == 2;
                  v704 = 600;
                  if (!v62)
                    v704 = v703;
                  v1567 = v704;
                  v1574 = v699 + 688;
                  v1575 = (id)(v699 + 672);
                  v705 = 9;
                  v1566 = v701;
                  if (*(_BYTE *)(v683 + 1513))
                  {
LABEL_679:
                    v706 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    v707 = v706;
                    if (sNRCopyLogToStdErr)
                    {

                    }
                    else
                    {
                      v708 = os_log_type_enabled(v706, OS_LOG_TYPE_INFO);

                      v683 = 0x1ED368000;
                      if (!v708)
                        goto LABEL_683;
                    }
                    v709 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    _NRLogWithArgs((uint64_t)v709, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v710, v711, v712, v713, v714, (uint64_t)"");

                    v683 = 0x1ED368000uLL;
                  }
LABEL_683:
                  ESPSequenceNumberFromPacket = 0;
                  v715 = 0;
                  v1568 = 0;
                  v1580 = 0u;
                  v1581 = 0u;
                  v1578 = 0u;
                  v1579 = 0u;
                  if (!*(_BYTE *)(v683 + 1513))
                    goto LABEL_688;
LABEL_684:
                  v716 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  v717 = v716;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v718 = os_log_type_enabled(v716, OS_LOG_TYPE_INFO);

                    v683 = 0x1ED368000;
                    if (!v718)
                      goto LABEL_688;
                  }
                  v719 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  _NRLogWithArgs((uint64_t)v719, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v720, v721, v722, v723, v724, (uint64_t)"");

                  v683 = 0x1ED368000;
LABEL_688:
                  v726 = *(_DWORD *)(v696 + 28);
                  v725 = *(unsigned int *)(v696 + 32);
                  if (v726 <= v725)
                  {
                    v733 = v705 | 0x10;
                    v734 = ESPSequenceNumberFromPacket;
                    if (!v681)
                    {
LABEL_700:
                      if (!v734)
                      {
                        v771 = 0;
                        goto LABEL_733;
                      }
                      while (1)
                      {
                        v735 = 0x4000 - *(unsigned __int16 *)(v696 + 80);
                        if (v735 < nrMaxTLVLengthForPacket(v1579, WORD1(v1578)))
                        {
                          v733 |= 0x40u;
                          v683 = 0x1ED368000uLL;
                          if (!gNRPacketLoggingEnabled)
                          {
                            v771 = v734;
                            goto LABEL_733;
                          }
                          v819 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v820 = v819;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_794;
                          }
                          LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v819, OS_LOG_TYPE_INFO);

                          if ((_DWORD)ESPSequenceNumberFromPacket)
                          {
LABEL_794:
                            v838 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v838, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v839, v840, v841, v842, v843, (uint64_t)"");

                          }
                          v771 = v734;
LABEL_732:
                          v683 = 0x1ED368000uLL;
LABEL_733:
                          v772 = *(unsigned __int16 *)(v696 + 80);
                          LODWORD(v1571) = *(_WORD *)(v696 + 80) != 0;
                          if (v772)
                          {
                            ESPSequenceNumberFromPacket = v771;
                            v1576 = 0;
                            v773 = v683;
                            if (!*(_BYTE *)(v683 + 1513))
                              goto LABEL_735;
                            v797 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            v798 = v797;
                            if (sNRCopyLogToStdErr)
                            {

                              v773 = 0x1ED368000;
                              goto LABEL_778;
                            }
                            v805 = os_log_type_enabled(v797, OS_LOG_TYPE_INFO);

                            v773 = 0x1ED368000;
                            if (v805)
                            {
LABEL_778:
                              v806 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v806, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v807, v808, v809, v810, v811, (uint64_t)"");

                            }
LABEL_735:
                            v774 = (*((uint64_t (**)(_QWORD, _QWORD, _QWORD, unint64_t *, _QWORD, _QWORD))v1569->isa
                                    + 1))(*(_QWORD *)v1569->isa, *(_QWORD *)v696, *(unsigned __int16 *)(v696 + 80), &v1576, 0, 0);
                            v683 = v773;
                            if (*(_BYTE *)(v773 + 1513))
                            {
                              v799 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v800 = v799;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v812 = os_log_type_enabled(v799, OS_LOG_TYPE_INFO);

                                v683 = 0x1ED368000;
                                if (!v812)
                                  goto LABEL_736;
                              }
                              v813 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v813, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v814, v815, v816, v817, v818, (uint64_t)"");

                              v683 = 0x1ED368000;
                            }
LABEL_736:
                            if ((v774 & 1) == 0)
                            {
                              if (v1565)
                              {
                                v1565(v1570);
                                v683 = 0x1ED368000uLL;
                              }
                              *(_BYTE *)(v696 + 84) |= 1u;
                              switch(*(_BYTE *)(v696 + 83))
                              {
                                case 0:
                                  v777 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v778 = v777;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    v787 = os_log_type_enabled(v777, OS_LOG_TYPE_ERROR);

                                    v683 = 0x1ED368000;
                                    if (!v787)
                                      goto LABEL_756;
                                  }
                                  v788 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v788, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v789, v790, v791, v792, v793, (uint64_t)"");
                                  goto LABEL_755;
                                case 1:
                                  v782 = v1570;
                                  v783 = *(_QWORD *)(v1570 + 136);
                                  ++*(_QWORD *)(v1570 + 144);
                                  *(_QWORD *)(v782 + 136) = v783 & 0xFFFFFFFFFFFFFFFELL | *(_BYTE *)(v696 + 84) & 1;
                                  if (!*(_BYTE *)(v683 + 1513))
                                    goto LABEL_751;
                                  v784 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v785 = v784;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    v866 = os_log_type_enabled(v784, OS_LOG_TYPE_INFO);

                                    v683 = 0x1ED368000;
                                    if (!v866)
                                      goto LABEL_756;
                                  }
                                  v788 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v788, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v867, v868, v869, v870, v871, (uint64_t)"");
                                  goto LABEL_755;
                                case 2:
                                  v779 = v1570;
                                  ++*(_QWORD *)(v1570 + 160);
                                  *(_QWORD *)(v779 + 136) = *(_QWORD *)(v779 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(_BYTE *)(v696 + 84) & 1));
                                  if (!*(_BYTE *)(v683 + 1513))
                                    goto LABEL_751;
                                  v780 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v781 = v780;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    v860 = os_log_type_enabled(v780, OS_LOG_TYPE_INFO);

                                    v683 = 0x1ED368000;
                                    if (!v860)
                                      goto LABEL_756;
                                  }
                                  v788 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v788, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v861, v862, v863, v864, v865, (uint64_t)"");
                                  goto LABEL_755;
                                case 3:
                                  v786 = v1570;
                                  ++*(_QWORD *)(v1570 + 176);
                                  *(_QWORD *)(v786 + 136) = *(_QWORD *)(v786 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(_BYTE *)(v696 + 84) & 1));
                                  if (!*(_BYTE *)(v683 + 1513))
                                  {
LABEL_751:
                                    v775 = v733 | 0x1800;
                                    v776 = v1576;
                                    if (v1576)
                                      goto LABEL_758;
                                    goto LABEL_764;
                                  }
                                  v858 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v859 = v858;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    v872 = os_log_type_enabled(v858, OS_LOG_TYPE_INFO);

                                    v683 = 0x1ED368000;
                                    if (!v872)
                                      goto LABEL_756;
                                  }
                                  v788 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v788, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v873, v874, v875, v876, v877, (uint64_t)"");
LABEL_755:

                                  v683 = 0x1ED368000uLL;
LABEL_756:
                                  v775 = v733 | 0x1800;
                                  if (!*(_BYTE *)(v683 + 1513))
                                  {
                                    v776 = v1576;
                                    if (!v1576)
                                      goto LABEL_764;
                                    goto LABEL_758;
                                  }
                                  v803 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  v804 = v803;
                                  if (sNRCopyLogToStdErr)
                                  {

                                  }
                                  else
                                  {
                                    v831 = os_log_type_enabled(v803, OS_LOG_TYPE_INFO);

                                    if (!v831)
                                      goto LABEL_791;
                                  }
                                  v832 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                  _NRLogWithArgs((uint64_t)v832, 1, (uint64_t)"%s%.30s:%-4d ", v833, v834, v835, v836, v837, (uint64_t)"");

LABEL_791:
                                  v683 = 0x1ED368000;
                                  v776 = v1576;
                                  if (v1576)
                                    goto LABEL_758;
                                  break;
                                default:
                                  goto LABEL_756;
                              }
                              goto LABEL_764;
                            }
                            v775 = v733 | 0x800;
                            v776 = v1576;
                            if (!v1576)
                            {
LABEL_764:
                              LODWORD(v1572) = v1572 + 1;
                              if ((v774 & 1) != 0)
                              {
                                v795 = *(unsigned __int8 *)(v696 + 82);
                                if (v795 >= 0xB)
                                {
                                  v795 = *(unsigned __int8 *)(v696 + 82)
                                       - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v696 + 82)) >> 32);
                                  *(_BYTE *)(v696 + 82) = v795;
                                }
                                v705 = 0;
                                *(_DWORD *)(v696 + 4 * v795 + 36) = v775;
                                v796 = (117 * (*(_BYTE *)(v696 + 82) + 1)) >> 8;
                                *(_BYTE *)(v696 + 82) = *(_BYTE *)(v696 + 82)
                                                      + 1
                                                      - 11
                                                      * ((v796
                                                        + (((*(_BYTE *)(v696 + 82) + 1 - v796) & 0xFE) >> 1)) >> 3);
                                if (!*(_BYTE *)(v683 + 1513))
                                  goto LABEL_688;
                                goto LABEL_684;
                              }
LABEL_817:
                              v879 = v772 == 0;
                              LODWORD(v878) = v1571;
                              if (!*(_BYTE *)(v683 + 1513))
                              {
                                v880 = v775 | 0x8000;
                                if (v715)
                                  goto LABEL_819;
LABEL_810:
                                if (!*(_BYTE *)(v1570 + 13))
                                {
LABEL_825:
                                  if ((v878 & v879) == 1)
                                  {
                                    v891 = *(unsigned __int8 *)(v696 + 82);
                                    if (v891 >= 0xB)
                                    {
                                      v891 = *(unsigned __int8 *)(v696 + 82)
                                           - 11
                                           * ((390451573 * (unint64_t)*(unsigned __int8 *)(v696 + 82)) >> 32);
                                      *(_BYTE *)(v696 + 82) = v891;
                                    }
                                    *(_DWORD *)(v696 + 4 * v891 + 36) = v880;
                                    v892 = (117 * (*(_BYTE *)(v696 + 82) + 1)) >> 8;
                                    *(_BYTE *)(v696 + 82) = *(_BYTE *)(v696 + 82)
                                                          + 1
                                                          - 11
                                                          * ((v892
                                                            + (((*(_BYTE *)(v696 + 82) + 1 - v892) & 0xFE) >> 1)) >> 3);
                                    v705 = 8;
                                    if (!*(_BYTE *)(v683 + 1513))
                                      goto LABEL_683;
                                    goto LABEL_679;
                                  }
                                  if (*(_BYTE *)(v683 + 1513))
                                  {
                                    v1243 = v878;
                                    v1244 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                    v878 = (uint64_t)v1244;
                                    if (sNRCopyLogToStdErr)
                                    {

                                    }
                                    else
                                    {
                                      v1280 = os_log_type_enabled(v1244, OS_LOG_TYPE_INFO);

                                      v683 = 0x1ED368000;
                                      LOBYTE(v878) = v1243;
                                      if (!v1280)
                                        goto LABEL_854;
                                    }
                                    v878 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                    _NRLogWithArgs(v878, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v1281, v1282, v1283, v1284, v1285, (uint64_t)"");

                                    LOBYTE(v878) = v1243;
                                    v683 = 0x1ED368000;
                                  }
LABEL_854:
                                  v3 = v1570;
                                  if ((v878 & 1) != 0)
                                    goto LABEL_888;
                                  if ((_DWORD)v1560 != 1)
                                  {
                                    if ((_DWORD)v1560 == 2)
                                    {
                                      v920 = *(_QWORD *)(v1570 + 136);
                                      if ((v920 & 8) != 0 && *(_QWORD *)(v1570 + 304))
                                      {
                                        *(_QWORD *)(v1570 + 136) = v920 & 0xFFFFFFFFFFFFFFF7;
                                        if (!*(_BYTE *)(v683 + 1513))
                                          goto LABEL_860;
                                        v1337 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        v1338 = v1337;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          v3 = v1570;
                                          goto LABEL_1262;
                                        }
                                        v1439 = os_log_type_enabled(v1337, OS_LOG_TYPE_INFO);

                                        v3 = v1570;
                                        if (v1439)
                                        {
LABEL_1262:
                                          v1440 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                          _NRLogWithArgs((uint64_t)v1440, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1441, v1442, v1443, v1444, v1445, (uint64_t)"");

                                        }
LABEL_860:
                                        dispatch_resume(*(dispatch_object_t *)(v3 + 304));
                                        v920 = *(_QWORD *)(v3 + 136);
                                        v683 = 0x1ED368000uLL;
                                      }
                                      if ((v920 & 0x10) != 0 && *v1559)
                                      {
                                        *(_QWORD *)(v3 + 136) = v920 & 0xFFFFFFFFFFFFFFEFLL;
                                        if (*(_BYTE *)(v683 + 1513))
                                        {
                                          v921 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                          v922 = v921;
                                          if (sNRCopyLogToStdErr)
                                          {

                                            goto LABEL_1258;
                                          }
                                          v1433 = os_log_type_enabled(v921, OS_LOG_TYPE_INFO);

                                          if (v1433)
                                          {
LABEL_1258:
                                            v1351 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                            _NRLogWithArgs((uint64_t)v1351, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1434, v1435, v1436, v1437, v1438, (uint64_t)"");
LABEL_1259:

                                          }
LABEL_1260:
                                          v3 = v1570;
                                        }
                                        goto LABEL_887;
                                      }
                                      goto LABEL_888;
                                    }
                                    v923 = *(_QWORD *)(v1570 + 136);
LABEL_871:
                                    if ((v923 & 8) != 0 && *(_QWORD *)(v1570 + 304))
                                    {
                                      *(_QWORD *)(v1570 + 136) = v923 & 0xFFFFFFFFFFFFFFF7;
                                      if (!*(_BYTE *)(v683 + 1513))
                                        goto LABEL_874;
                                      v1319 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v1320 = v1319;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v3 = v1570;
                                        goto LABEL_1238;
                                      }
                                      v1368 = os_log_type_enabled(v1319, OS_LOG_TYPE_INFO);

                                      v3 = v1570;
                                      if (v1368)
                                      {
LABEL_1238:
                                        v1369 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        _NRLogWithArgs((uint64_t)v1369, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1370, v1371, v1372, v1373, v1374, (uint64_t)"");

                                      }
LABEL_874:
                                      dispatch_resume(*(dispatch_object_t *)(v3 + 304));
                                      v923 = *(_QWORD *)(v3 + 136);
                                    }
                                    if ((v923 & 0x10) != 0 && *v1559)
                                    {
                                      *(_QWORD *)(v3 + 136) = v923 & 0xFFFFFFFFFFFFFFEFLL;
                                      if (!gNRPacketLoggingEnabled)
                                        goto LABEL_878;
                                      v1321 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v1322 = v1321;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v3 = v1570;
                                        goto LABEL_1240;
                                      }
                                      v1375 = os_log_type_enabled(v1321, OS_LOG_TYPE_INFO);

                                      v3 = v1570;
                                      if (v1375)
                                      {
LABEL_1240:
                                        v1376 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        _NRLogWithArgs((uint64_t)v1376, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1377, v1378, v1379, v1380, v1381, (uint64_t)"");

                                      }
LABEL_878:
                                      dispatch_resume(*(dispatch_object_t *)(v3 + 320));
                                      v923 = *(_QWORD *)(v3 + 136);
                                    }
                                    if ((v923 & 0x20) != 0)
                                    {
                                      v683 = 0x1ED368000uLL;
                                      if (*(_QWORD *)(v3 + 336))
                                        goto LABEL_881;
LABEL_884:
                                      if ((v923 & 0x40) != 0 && *(_QWORD *)(v3 + 352))
                                      {
                                        v1559 = (dispatch_object_t *)(v3 + 352);
                                        *(_QWORD *)(v3 + 136) = v923 & 0xFFFFFFFFFFFFFFBFLL;
                                        if (*(_BYTE *)(v683 + 1513))
                                        {
                                          v1315 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                          v1316 = v1315;
                                          if (sNRCopyLogToStdErr)
                                          {

                                          }
                                          else
                                          {
                                            v1350 = os_log_type_enabled(v1315, OS_LOG_TYPE_INFO);

                                            if (!v1350)
                                              goto LABEL_1260;
                                          }
                                          v1351 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                          _NRLogWithArgs((uint64_t)v1351, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v1352, v1353, v1354, v1355, v1356, (uint64_t)"");
                                          goto LABEL_1259;
                                        }
LABEL_887:
                                        dispatch_resume(*v1559);
                                        v683 = 0x1ED368000uLL;
                                      }
LABEL_888:
                                      if (*(_BYTE *)(v683 + 1513))
                                      {
                                        v1245 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        v1246 = v1245;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          v3 = v1570;
                                        }
                                        else
                                        {
                                          v1286 = os_log_type_enabled(v1245, OS_LOG_TYPE_INFO);

                                          v3 = v1570;
                                          if (!v1286)
                                            goto LABEL_889;
                                        }
                                        v1287 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                        _NRLogWithArgs((uint64_t)v1287, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v1288, v1289, v1290, v1291, v1292, (uint64_t)"");

                                      }
LABEL_889:
                                      v924 = *(unsigned __int8 *)(v696 + 82);
                                      v682 = v1561;
                                      if (v924 >= 0xB)
                                      {
                                        v924 = *(unsigned __int8 *)(v696 + 82)
                                             - 11
                                             * ((390451573 * (unint64_t)*(unsigned __int8 *)(v696 + 82)) >> 32);
                                        *(_BYTE *)(v696 + 82) = v924;
                                      }
                                      *(_DWORD *)(v696 + 4 * v924 + 36) = v880 | 0x60000;
LABEL_892:
                                      v925 = (117 * (*(_BYTE *)(v696 + 82) + 1)) >> 8;
                                      *(_BYTE *)(v696 + 82) = *(_BYTE *)(v696 + 82)
                                                            + 1
                                                            - 11
                                                            * ((v925
                                                              + (((*(_BYTE *)(v696 + 82) + 1 - v925) & 0xFE) >> 1)) >> 3);
                                      goto LABEL_893;
                                    }
LABEL_883:
                                    v683 = 0x1ED368000uLL;
                                    goto LABEL_884;
                                  }
                                  v923 = *(_QWORD *)(v1570 + 136);
                                  if ((*(_BYTE *)(v1570 + 10) & 4) == 0)
                                    goto LABEL_871;
                                  if ((v923 & 0x20) == 0 || !*(_QWORD *)(v1570 + 336))
                                    goto LABEL_884;
LABEL_881:
                                  *(_QWORD *)(v3 + 136) = v923 & 0xFFFFFFFFFFFFFFDFLL;
                                  if (!*(_BYTE *)(v683 + 1513))
                                  {
LABEL_882:
                                    dispatch_resume(*(dispatch_object_t *)(v3 + 336));
                                    v923 = *(_QWORD *)(v3 + 136);
                                    goto LABEL_883;
                                  }
                                  v1313 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                  v1314 = v1313;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    v3 = v1570;
                                  }
                                  else
                                  {
                                    v1343 = os_log_type_enabled(v1313, OS_LOG_TYPE_INFO);

                                    v3 = v1570;
                                    if (!v1343)
                                      goto LABEL_882;
                                  }
                                  v1344 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                  _NRLogWithArgs((uint64_t)v1344, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1345, v1346, v1347, v1348, v1349, (uint64_t)"");

                                  goto LABEL_882;
                                }
LABEL_820:
                                if (v1572 <= 8u)
                                {
                                  if (!v681)
                                    goto LABEL_825;
                                  v890 = os_channel_available_slot_count();
                                  v683 = 0x1ED368000uLL;
                                  if (v890 > 1)
                                    goto LABEL_825;
                                }
                                if (!*(_BYTE *)(v683 + 1513))
                                {
LABEL_824:
                                  v880 = v775 | 0x18000;
                                  os_channel_sync();
                                  *(_BYTE *)(v1570 + 13) = 0;
                                  v683 = 0x1ED368000uLL;
                                  goto LABEL_825;
                                }
                                LODWORD(v1571) = v878;
                                v896 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                v878 = (uint64_t)v896;
                                if (sNRCopyLogToStdErr)
                                {

                                }
                                else
                                {
                                  v904 = os_log_type_enabled(v896, OS_LOG_TYPE_INFO);

                                  LODWORD(v878) = v1571;
                                  if (!v904)
                                    goto LABEL_824;
                                }
                                v878 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs(v878, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v905, v906, v907, v908, v909, (uint64_t)"");

                                LODWORD(v878) = v1571;
                                goto LABEL_824;
                              }
                              v893 = v1571;
                              v894 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v895 = v894;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_835;
                              }
                              v897 = os_log_type_enabled(v894, OS_LOG_TYPE_INFO);

                              if (v897)
                              {
LABEL_835:
                                v898 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs((uint64_t)v898, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v899, v900, v901, v902, v903, (uint64_t)"");

                              }
                              v683 = 0x1ED368000;
                              LODWORD(v878) = v893;
                              v880 = v775 | 0x8000;
                              if (!v715)
                                goto LABEL_810;
LABEL_819:
                              os_channel_advance_slot();
                              v683 = 0x1ED368000;
                              *(_BYTE *)(v1570 + 13) = 1;
                              goto LABEL_820;
                            }
LABEL_758:
                            if (v776 < *(unsigned __int16 *)(v696 + 80))
                            {
                              if (!*(_BYTE *)(v683 + 1513))
                                goto LABEL_760;
                              v821 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v822 = v821;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_797;
                              }
                              v844 = os_log_type_enabled(v821, OS_LOG_TYPE_INFO);

                              if (v844)
                              {
LABEL_797:
                                v845 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs((uint64_t)v845, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v846, v847, v848, v849, v850, (uint64_t)"");

                              }
LABEL_760:
                              v775 |= 0x2000u;
                              memmove(*(void **)v696, (const void *)(*(_QWORD *)v696 + v1576), *(unsigned __int16 *)(v696 + 80) - v1576);
                              v794 = v1576;
                              *(_WORD *)(v696 + 80) -= v1576;
                              v1568 = (v1568 + 1);
                              v683 = 0x1ED368000;
LABEL_763:
                              *(_QWORD *)(v1570 + v1567) += v794;
                              goto LABEL_764;
                            }
                            if (!*(_BYTE *)(v683 + 1513))
                            {
LABEL_762:
                              v775 |= 0x4000u;
                              *(_WORD *)(v696 + 80) = 0;
                              v794 = v1576;
                              goto LABEL_763;
                            }
                            v823 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            v824 = v823;
                            if (sNRCopyLogToStdErr)
                            {

                            }
                            else
                            {
                              v851 = os_log_type_enabled(v823, OS_LOG_TYPE_INFO);

                              v683 = 0x1ED368000;
                              if (!v851)
                                goto LABEL_762;
                            }
                            v852 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v852, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v853, v854, v855, v856, v857, (uint64_t)"");

                            v683 = 0x1ED368000;
                            goto LABEL_762;
                          }
                          v775 = v733 | 0x400;
                          if (!*(_BYTE *)(v683 + 1513))
                          {
                            LODWORD(v878) = 0;
                            v879 = 1;
                            v880 = v775 | 0x8000;
                            if (v715)
                              goto LABEL_819;
                            goto LABEL_810;
                          }
                          v881 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v882 = v881;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_815;
                          }
                          v883 = os_log_type_enabled(v881, OS_LOG_TYPE_INFO);

                          if (v883)
                          {
LABEL_815:
                            v884 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v884, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v885, v886, v887, v888, v889, (uint64_t)"");

                          }
                          v683 = 0x1ED368000uLL;
                          goto LABEL_817;
                        }
                        os_channel_slot_get_packet();
                        os_packet_get_next_buflet();
                        v736 = os_buflet_get_data_offset();
                        v737 = os_buflet_get_object_address();
                        v738 = os_buflet_get_data_length();
                        if (v738 >= 0x10000)
                        {
                          if (nrCopyLogObj_onceToken_509 == -1)
                          {
LABEL_847:
                            v911 = (id)nrCopyLogObj_sNRLogObj_510;
                            v912 = v911;
                            if (sNRCopyLogToStdErr)
                            {

                            }
                            else
                            {
                              v913 = os_log_type_enabled(v911, OS_LOG_TYPE_ERROR);

                              if (!v913)
                                goto LABEL_377;
                            }
                            v914 = nrCopyLogObj_506();
                            _NRLogWithArgs((uint64_t)v914, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen <= 65535", v915, v916, v917, v918, v919, (uint64_t)"");

LABEL_377:
                            _os_log_pack_size();
                            MEMORY[0x1E0C80A78]();
                            __error();
                            v404 = _os_log_pack_fill();
                            *(_DWORD *)v404 = 136446210;
                            *(_QWORD *)(v404 + 4) = "NRBluetoothPacketParserNexusToLinkLoop";
                            v405 = nrCopyLogObj_506();
                            _NRLogAbortWithPack(v405);
                          }
LABEL_898:
                          dispatch_once(&nrCopyLogObj_onceToken_509, &__block_literal_global_353);
                          goto LABEL_847;
                        }
                        v739 = v738;
                        if (!(_WORD)v738 && WORD1(v1578))
                        {
                          v1576 = 0;
                          v1577 = 0;
                          v1576 = *(_QWORD *)v696 + *(unsigned __int16 *)(v696 + 80);
                          LODWORD(v1577) = v735;
                          v740 = nrPacketToTLV((unsigned __int8 *)v1579, WORD1(v1578), (uint64_t)&v1576, 1u, (uint64_t)v1575, v1574);
                          if (!gNRPacketLoggingEnabled)
                          {
LABEL_706:
                            v733 |= 0x80u;
                            goto LABEL_712;
                          }
                          v746 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v747 = v746;
                          if (sNRCopyLogToStdErr)
                          {

                          }
                          else
                          {
                            v752 = os_log_type_enabled(v746, OS_LOG_TYPE_INFO);

                            if (!v752)
                              goto LABEL_706;
                          }
                          v753 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          getESPSequenceNumberFromPacket(v1579, WORD1(v1578));
                          getESPSPIFromPacket(v1579, WORD1(v1578));
                          _NRLogWithArgs((uint64_t)v753, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v754, v755, v756, v757, v758, (uint64_t)"");

                          goto LABEL_706;
                        }
                        if ((_WORD)v738)
                        {
                          v741 = (unsigned __int8 *)(v737 + v736);
                          v1576 = 0;
                          v1577 = 0;
                          v1576 = *(_QWORD *)v696 + *(unsigned __int16 *)(v696 + 80);
                          LODWORD(v1577) = v735;
                          v740 = nrPacketToTLV(v741, (unsigned __int16)v738, (uint64_t)&v1576, 1u, (uint64_t)v1575, v1574);
                          if (!gNRPacketLoggingEnabled)
                          {
LABEL_709:
                            v733 |= 0x100u;
                            goto LABEL_712;
                          }
                          v748 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v749 = v748;
                          if (sNRCopyLogToStdErr)
                          {

                          }
                          else
                          {
                            LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v748, OS_LOG_TYPE_INFO);

                            if (!(_DWORD)ESPSequenceNumberFromPacket)
                              goto LABEL_709;
                          }
                          v759 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          ESPSequenceNumberFromPacket = (_BYTE *)getESPSequenceNumberFromPacket((uint64_t)v741, v739);
                          getESPSPIFromPacket((uint64_t)v741, v739);
                          _NRLogWithArgs((uint64_t)v759, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v760, v761, v762, v763, v764, (uint64_t)"");

                          goto LABEL_709;
                        }
                        v733 |= 0x200u;
                        if (!gNRPacketLoggingEnabled)
                          goto LABEL_711;
                        v750 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v751 = v750;
                        if (sNRCopyLogToStdErr)
                          break;
                        v740 = os_log_type_enabled(v750, OS_LOG_TYPE_INFO);

                        if (v740)
                          goto LABEL_727;
LABEL_712:
                        *(_WORD *)(v696 + 80) += v740;
                        v742 = os_channel_get_next_slot();
                        ++v700;
                        v743 = v1570;
                        ++*(_QWORD *)(v1570 + 448);
                        *(_BYTE *)(v743 + 15) = 1;
                        v698 += v740;
                        if (!v742)
                        {
                          v771 = 0;
                          v715 = v734;
                          goto LABEL_732;
                        }
                        v744 = *(unsigned __int8 *)(v696 + 82);
                        if (v744 >= 0xB)
                        {
                          v744 = *(unsigned __int8 *)(v696 + 82)
                               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v696 + 82)) >> 32);
                          *(_BYTE *)(v696 + 82) = v744;
                        }
                        *(_DWORD *)(v696 + 4 * v744 + 36) = v733;
                        v745 = (117 * (*(_BYTE *)(v696 + 82) + 1)) >> 8;
                        *(_BYTE *)(v696 + 82) = *(_BYTE *)(v696 + 82)
                                              + 1
                                              - 11
                                              * ((v745
                                                + (((*(_BYTE *)(v696 + 82) + 1 - v745) & 0xFE) >> 1)) >> 3);
                        v715 = v734;
                        v734 = (_BYTE *)v742;
                        v733 = 0;
                      }

LABEL_727:
                      v765 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      _NRLogWithArgs((uint64_t)v765, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v766, v767, v768, v769, v770, (uint64_t)"");

LABEL_711:
                      v740 = 0;
                      goto LABEL_712;
                    }
LABEL_699:
                    v734 = (_BYTE *)os_channel_get_next_slot();
                    v683 = 0x1ED368000;
                    goto LABEL_700;
                  }
                  v727 = *(unsigned __int16 *)(v696 + 80);
                  if ((unsigned __int16)(v726 - v725) >= (unsigned __int16)(0x4000 - v727))
                    v728 = (unsigned __int16)(0x4000 - v727);
                  else
                    v728 = (unsigned __int16)(v726 - v725);
                  v729 = (char *)v1566;
                  memcpy((void *)(*(_QWORD *)v696 + v727), (const void *)(v1566 + v725), v728);
                  v730 = *(_DWORD *)(v696 + 28);
                  v731 = *(_DWORD *)(v696 + 32) + v728;
                  *(_DWORD *)(v696 + 32) = v731;
                  if (v730 <= v731)
                  {
                    v732 = 0;
                  }
                  else
                  {
                    memmove(v729, &v729[v731], v730 - v731);
                    v732 = *(_DWORD *)(v696 + 28) - *(_DWORD *)(v696 + 32);
                  }
                  v683 = 0x1ED368000uLL;
                  *(_DWORD *)(v696 + 28) = v732;
                  *(_DWORD *)(v696 + 32) = 0;
                  *(_WORD *)(v696 + 80) += v728;
                  if (gNRPacketLoggingEnabled)
                  {
                    v801 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    v802 = v801;
                    if (sNRCopyLogToStdErr)
                    {

                    }
                    else
                    {
                      LODWORD(v1571) = os_log_type_enabled(v801, OS_LOG_TYPE_INFO);

                      v683 = 0x1ED368000;
                      if (!(_DWORD)v1571)
                        goto LABEL_698;
                    }
                    v825 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    _NRLogWithArgs((uint64_t)v825, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v826, v827, v828, v829, v830, (uint64_t)"");

                    v683 = 0x1ED368000;
                  }
LABEL_698:
                  v733 = v705 | 0x30;
                  v698 += v728;
                  v734 = ESPSequenceNumberFromPacket;
                  if (!v681)
                    goto LABEL_700;
                  goto LABEL_699;
                }
                if (!*(_BYTE *)(v683 + 1513))
                {
LABEL_841:
                  if (v685)
                    v685(v3);
                  v910 = *(unsigned __int8 *)(v696 + 82);
                  if (v910 >= 0xB)
                  {
                    v910 = *(unsigned __int8 *)(v696 + 82)
                         - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v696 + 82)) >> 32);
                    *(_BYTE *)(v696 + 82) = v910;
                  }
                  *(_DWORD *)(v696 + 4 * v910 + 36) = 3;
                  goto LABEL_892;
                }
                v929 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                v930 = v929;
                if (sNRCopyLogToStdErr)
                {

                  v3 = v1570;
                  v685 = v1565;
                }
                else
                {
                  v1223 = os_log_type_enabled(v929, OS_LOG_TYPE_INFO);

                  v3 = v1570;
                  v685 = v1565;
                  if (!v1223)
                    goto LABEL_841;
                }
                v1224 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                _NRLogWithArgs((uint64_t)v1224, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v1225, v1226, v1227, v1228, v1229, (uint64_t)"");

                goto LABEL_841;
              }
              v926 = (uint64_t)v688;
              if (*(_BYTE *)(v683 + 1513))
              {
                v1502 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                v1503 = v1502;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v1513 = os_log_type_enabled(v1502, OS_LOG_TYPE_INFO);

                  if (!v1513)
                    goto LABEL_896;
                }
                v1514 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                _NRLogWithArgs((uint64_t)v1514, 1, (uint64_t)"%s%.30s:%-4d ", v1515, v1516, v1517, v1518, v1519, (uint64_t)"");

              }
LABEL_896:
              v927 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
              v928 = v927;
              if (sNRCopyLogToStdErr)
              {

                v3 = v1570;
              }
              else
              {
                v945 = os_log_type_enabled(v927, OS_LOG_TYPE_FAULT);

                v3 = v1570;
                if (!v945)
                  goto LABEL_893;
              }
              v946 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              _NRLogWithArgs((uint64_t)v946, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v947, v948, v949, v950, v951, v926);

LABEL_893:
              goto LABEL_3;
            }
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
            v1563 = *(const char **)(v3 + 208);
            v9 = *(void **)(v3 + 240);
            v10 = *(id *)(v3 + 304);
            v11 = 0x1ED368000uLL;
            if (gNRPacketLoggingEnabled)
            {
              v437 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              v438 = v437;
              if (sNRCopyLogToStdErr)
              {

                v3 = v1570;
              }
              else
              {
                v441 = os_log_type_enabled(v437, OS_LOG_TYPE_INFO);

                v3 = v1570;
                v11 = 0x1ED368000;
                if (!v441)
                  goto LABEL_14;
              }
              v442 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              _NRLogWithArgs((uint64_t)v442, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v443, v444, v445, v446, v447, (uint64_t)"");

              v11 = 0x1ED368000;
            }
LABEL_14:
            v12 = *(unsigned __int8 *)(v3 + 10);
            if ((v12 & 8) != 0)
            {
              v14 = (_QWORD *)(v3 + 128);
              v18 = "Isochronous";
              v17 = 3;
              v15 = NRBluetoothPacketParserSuspendNexusVOInputSource;
              goto LABEL_419;
            }
            if ((v12 & 4) != 0)
            {
              v14 = (_QWORD *)(v3 + 112);
              v15 = NRBluetoothPacketParserSuspendNexusVOInputSource;
LABEL_391:
              v18 = "High";
              v17 = 2;
              goto LABEL_419;
            }
            v13 = *(_QWORD *)(v3 + 104);
            if (!v13)
            {
              v15 = NRBluetoothPacketParserSuspendNexusVOInputSource;
              goto LABEL_418;
            }
            if ((*(_BYTE *)(*(_QWORD *)v13 + 27) & 3) == 1 && !*(_BYTE *)(v3 + 12))
            {

              v11 = 0x1ED368000;
              v16 = 0;
              v15 = 0;
              v10 = 0;
              v9 = 0;
              v1563 = 0;
              v14 = (_QWORD *)(v3 + 112);
              if (!*(_BYTE *)(v3 + 12))
                goto LABEL_21;
            }
            else
            {
              v14 = 0;
              v15 = NRBluetoothPacketParserSuspendNexusVOInputSource;
              v16 = 1;
              if (!*(_BYTE *)(v3 + 12))
                goto LABEL_21;
            }
            if (!*(_BYTE *)(v11 + 1513))
              goto LABEL_21;
            v1241 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
            v1242 = v1241;
            if (sNRCopyLogToStdErr)
            {

              v3 = v1570;
            }
            else
            {
              v1273 = os_log_type_enabled(v1241, OS_LOG_TYPE_INFO);

              v3 = v1570;
              v11 = 0x1ED368000;
              if (!v1273)
                goto LABEL_21;
            }
            v1274 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
            _NRLogWithArgs((uint64_t)v1274, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v1275, v1276, v1277, v1278, v1279, (uint64_t)"");

            v11 = 0x1ED368000;
LABEL_21:
            if (v14)
            {
              if ((v16 & 1) != 0)
              {
                v17 = 0;
                v18 = "Invalid";
                goto LABEL_419;
              }
              goto LABEL_391;
            }
LABEL_418:
            v14 = (_QWORD *)(v3 + 96);
            v18 = "Medium";
            v17 = 1;
LABEL_419:
            v1568 = (unint64_t)v14;
            v455 = (_QWORD *)*v14;
            if (*v14)
            {
              v1565 = v15;
              v456 = v455[3];
              if ((*(_BYTE *)(v456 + 84) & 1) == 0)
              {
                LODWORD(v1559) = v17;
                LODWORD(v1574) = v12;
                v1575 = v9;
                v1562 = v18;
                v1561 = v10;
                v1560 = &v1528;
                v457 = v3;
                v458 = 0;
                v459 = 0;
                LODWORD(v1571) = 0;
                v1558 = (dispatch_object_t *)(v457 + 304);
                v460 = *(void (**)(uint64_t))(v456 + 8);
                v461 = *(unsigned __int8 *)(v456 + 83);
                v462 = 568;
                if (v461 == 3)
                  v462 = 584;
                v62 = v461 == 2;
                v463 = 600;
                if (!v62)
                  v463 = v462;
                v1566 = v463;
                v1572 = v457 + 688;
                ESPSequenceNumberFromPacket = (_BYTE *)(v457 + 672);
                v464 = 9;
                v1564 = v460;
                if (*(_BYTE *)(v11 + 1513))
                {
LABEL_426:
                  v465 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  v466 = v465;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v467 = os_log_type_enabled(v465, OS_LOG_TYPE_INFO);

                    v11 = 0x1ED368000;
                    if (!v467)
                      goto LABEL_430;
                  }
                  v468 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  _NRLogWithArgs((uint64_t)v468, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v469, v470, v471, v472, v473, (uint64_t)"");

                  v11 = 0x1ED368000uLL;
                }
LABEL_430:
                v474 = 0;
                v475 = 0;
                v1567 = 0;
                v1580 = 0u;
                v1581 = 0u;
                v1578 = 0u;
                v1579 = 0u;
                if (*(_BYTE *)(v11 + 1513))
                {
LABEL_431:
                  v476 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  v477 = v476;
                  if (sNRCopyLogToStdErr)
                  {

LABEL_434:
                    v479 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    _NRLogWithArgs((uint64_t)v479, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v480, v481, v482, v483, v484, (uint64_t)"");

                    v11 = 0x1ED368000;
                    goto LABEL_435;
                  }
                  v478 = os_log_type_enabled(v476, OS_LOG_TYPE_INFO);

                  v11 = 0x1ED368000;
                  if (v478)
                    goto LABEL_434;
                }
LABEL_435:
                v485 = v464 | 0x10;
                if ((v1574 & 8) != 0)
                  goto LABEL_445;
                v487 = *(_DWORD *)(v456 + 28);
                v486 = *(unsigned int *)(v456 + 32);
                if (v487 <= v486)
                  goto LABEL_445;
                v488 = *(unsigned __int16 *)(v456 + 80);
                if ((unsigned __int16)(v487 - v486) >= (unsigned __int16)(0x4000 - v488))
                  v489 = (unsigned __int16)(0x4000 - v488);
                else
                  v489 = (unsigned __int16)(v487 - v486);
                v490 = v1564;
                memcpy((void *)(*(_QWORD *)v456 + v488), (char *)v1564 + v486, v489);
                v491 = *(_DWORD *)(v456 + 28);
                v492 = *(_DWORD *)(v456 + 32) + v489;
                *(_DWORD *)(v456 + 32) = v492;
                if (v491 <= v492)
                {
                  v493 = 0;
                }
                else
                {
                  memmove(v490, (char *)v490 + v492, v491 - v492);
                  v493 = *(_DWORD *)(v456 + 28) - *(_DWORD *)(v456 + 32);
                }
                v11 = 0x1ED368000uLL;
                *(_DWORD *)(v456 + 28) = v493;
                *(_DWORD *)(v456 + 32) = 0;
                *(_WORD *)(v456 + 80) += v489;
                if (!gNRPacketLoggingEnabled)
                {
LABEL_444:
                  v485 = v464 | 0x30;
                  v458 += v489;
LABEL_445:
                  if (v1575)
                  {
                    v474 = os_channel_get_next_slot();
                    v11 = 0x1ED368000;
                  }
                  if (!v474)
                    goto LABEL_483;
                  v494 = v474;
                  while (1)
                  {
                    v495 = 0x4000 - *(unsigned __int16 *)(v456 + 80);
                    if (v495 < nrMaxTLVLengthForPacket(v1579, WORD1(v1578)))
                    {
                      v485 |= 0x40u;
                      v11 = 0x1ED368000uLL;
                      if (!gNRPacketLoggingEnabled)
                      {
                        v474 = v494;
                        goto LABEL_483;
                      }
                      v577 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      v578 = v577;
                      if (sNRCopyLogToStdErr)
                      {

                        goto LABEL_542;
                      }
                      v592 = os_log_type_enabled(v577, OS_LOG_TYPE_INFO);

                      if (v592)
                      {
LABEL_542:
                        v593 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        _NRLogWithArgs((uint64_t)v593, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v594, v595, v596, v597, v598, (uint64_t)"");

                        v474 = v494;
                      }
                      else
                      {
                        v474 = v494;
                      }
LABEL_482:
                      v11 = 0x1ED368000uLL;
LABEL_483:
                      v532 = *(unsigned __int16 *)(v456 + 80);
                      LODWORD(v1569) = *(_WORD *)(v456 + 80) != 0;
                      if (v532)
                      {
                        v1576 = 0;
                        v533 = v11;
                        if (!*(_BYTE *)(v11 + 1513))
                          goto LABEL_485;
                        v557 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v558 = v557;
                        if (sNRCopyLogToStdErr)
                        {

                          v533 = 0x1ED368000;
                          goto LABEL_526;
                        }
                        v563 = os_log_type_enabled(v557, OS_LOG_TYPE_INFO);

                        v533 = 0x1ED368000;
                        if (v563)
                        {
LABEL_526:
                          v564 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          _NRLogWithArgs((uint64_t)v564, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v565, v566, v567, v568, v569, (uint64_t)"");

                        }
LABEL_485:
                        v534 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, unint64_t *, _QWORD, _QWORD))(*(_QWORD *)v1568 + 8))(**(_QWORD **)v1568, *(_QWORD *)v456, *(unsigned __int16 *)(v456 + 80), &v1576, 0, 0);
                        v11 = v533;
                        if (*(_BYTE *)(v533 + 1513))
                        {
                          v559 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v560 = v559;
                          if (sNRCopyLogToStdErr)
                          {

                          }
                          else
                          {
                            v570 = os_log_type_enabled(v559, OS_LOG_TYPE_INFO);

                            v11 = 0x1ED368000;
                            if (!v570)
                              goto LABEL_486;
                          }
                          v571 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          _NRLogWithArgs((uint64_t)v571, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v572, v573, v574, v575, v576, (uint64_t)"");

                          v11 = 0x1ED368000;
                        }
LABEL_486:
                        if ((v534 & 1) == 0)
                        {
                          if (v1565)
                          {
                            v1565(v1570);
                            v11 = 0x1ED368000uLL;
                          }
                          *(_BYTE *)(v456 + 84) |= 1u;
                          switch(*(_BYTE *)(v456 + 83))
                          {
                            case 0:
                              v537 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v538 = v537;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v547 = os_log_type_enabled(v537, OS_LOG_TYPE_ERROR);

                                v11 = 0x1ED368000;
                                if (!v547)
                                  goto LABEL_506;
                              }
                              v548 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v548, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v549, v550, v551, v552, v553, (uint64_t)"");
                              goto LABEL_505;
                            case 1:
                              v542 = v1570;
                              v543 = *(_QWORD *)(v1570 + 136);
                              ++*(_QWORD *)(v1570 + 144);
                              *(_QWORD *)(v542 + 136) = v543 & 0xFFFFFFFFFFFFFFFELL | *(_BYTE *)(v456 + 84) & 1;
                              if (!*(_BYTE *)(v11 + 1513))
                                goto LABEL_501;
                              v544 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v545 = v544;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v627 = os_log_type_enabled(v544, OS_LOG_TYPE_INFO);

                                v11 = 0x1ED368000;
                                if (!v627)
                                  goto LABEL_506;
                              }
                              v548 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v548, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v628, v629, v630, v631, v632, (uint64_t)"");
                              goto LABEL_505;
                            case 2:
                              v539 = v1570;
                              ++*(_QWORD *)(v1570 + 160);
                              *(_QWORD *)(v539 + 136) = *(_QWORD *)(v539 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(_BYTE *)(v456 + 84) & 1));
                              if (!*(_BYTE *)(v11 + 1513))
                                goto LABEL_501;
                              v540 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v541 = v540;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v621 = os_log_type_enabled(v540, OS_LOG_TYPE_INFO);

                                v11 = 0x1ED368000;
                                if (!v621)
                                  goto LABEL_506;
                              }
                              v548 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v548, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v622, v623, v624, v625, v626, (uint64_t)"");
                              goto LABEL_505;
                            case 3:
                              v546 = v1570;
                              ++*(_QWORD *)(v1570 + 176);
                              *(_QWORD *)(v546 + 136) = *(_QWORD *)(v546 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(_BYTE *)(v456 + 84) & 1));
                              if (!*(_BYTE *)(v11 + 1513))
                              {
LABEL_501:
                                v535 = v485 | 0x1800;
                                v536 = v1576;
                                if (v1576)
                                  goto LABEL_508;
                                goto LABEL_514;
                              }
                              v613 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v614 = v613;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v633 = os_log_type_enabled(v613, OS_LOG_TYPE_INFO);

                                v11 = 0x1ED368000;
                                if (!v633)
                                  goto LABEL_506;
                              }
                              v548 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v548, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v634, v635, v636, v637, v638, (uint64_t)"");
LABEL_505:

                              v11 = 0x1ED368000uLL;
LABEL_506:
                              v535 = v485 | 0x1800;
                              if (!*(_BYTE *)(v11 + 1513))
                              {
                                v536 = v1576;
                                if (!v1576)
                                  goto LABEL_514;
                                goto LABEL_508;
                              }
                              v561 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              v562 = v561;
                              if (sNRCopyLogToStdErr)
                              {

                              }
                              else
                              {
                                v585 = os_log_type_enabled(v561, OS_LOG_TYPE_INFO);

                                if (!v585)
                                  goto LABEL_539;
                              }
                              v586 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                              _NRLogWithArgs((uint64_t)v586, 1, (uint64_t)"%s%.30s:%-4d ", v587, v588, v589, v590, v591, (uint64_t)"");

LABEL_539:
                              v11 = 0x1ED368000;
                              v536 = v1576;
                              if (v1576)
                                goto LABEL_508;
                              break;
                            default:
                              goto LABEL_506;
                          }
                          goto LABEL_514;
                        }
                        v535 = v485 | 0x800;
                        v536 = v1576;
                        if (!v1576)
                        {
LABEL_514:
                          LODWORD(v1571) = v1571 + 1;
                          if ((v534 & 1) != 0)
                          {
                            v555 = *(unsigned __int8 *)(v456 + 82);
                            if (v555 >= 0xB)
                            {
                              v555 = *(unsigned __int8 *)(v456 + 82)
                                   - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v456 + 82)) >> 32);
                              *(_BYTE *)(v456 + 82) = v555;
                            }
                            v464 = 0;
                            *(_DWORD *)(v456 + 4 * v555 + 36) = v535;
                            v556 = (117 * (*(_BYTE *)(v456 + 82) + 1)) >> 8;
                            *(_BYTE *)(v456 + 82) = *(_BYTE *)(v456 + 82)
                                                  + 1
                                                  - 11
                                                  * ((v556
                                                    + (((*(_BYTE *)(v456 + 82) + 1 - v556) & 0xFE) >> 1)) >> 3);
                            if (!*(_BYTE *)(v11 + 1513))
                              goto LABEL_435;
                            goto LABEL_431;
                          }
LABEL_567:
                          v640 = v532 == 0;
                          LODWORD(v639) = (_DWORD)v1569;
                          if (!*(_BYTE *)(v11 + 1513))
                          {
                            v641 = v535 | 0x8000;
                            if (v475)
                              goto LABEL_569;
LABEL_560:
                            if (!*(_BYTE *)(v1570 + 13))
                            {
LABEL_575:
                              if ((v639 & v640) == 1)
                              {
                                v652 = *(unsigned __int8 *)(v456 + 82);
                                if (v652 >= 0xB)
                                {
                                  v652 = *(unsigned __int8 *)(v456 + 82)
                                       - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v456 + 82)) >> 32);
                                  *(_BYTE *)(v456 + 82) = v652;
                                }
                                *(_DWORD *)(v456 + 4 * v652 + 36) = v641;
                                v653 = (117 * (*(_BYTE *)(v456 + 82) + 1)) >> 8;
                                *(_BYTE *)(v456 + 82) = *(_BYTE *)(v456 + 82)
                                                      + 1
                                                      - 11
                                                      * ((v653
                                                        + (((*(_BYTE *)(v456 + 82) + 1 - v653) & 0xFE) >> 1)) >> 3);
                                v464 = 8;
                                if (!*(_BYTE *)(v11 + 1513))
                                  goto LABEL_430;
                                goto LABEL_426;
                              }
                              v10 = v1561;
                              if (*(_BYTE *)(v11 + 1513))
                              {
                                v1237 = v639;
                                v1238 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                v639 = (uint64_t)v1238;
                                if (sNRCopyLogToStdErr)
                                {

                                  v10 = v1561;
                                }
                                else
                                {
                                  v1260 = os_log_type_enabled(v1238, OS_LOG_TYPE_INFO);

                                  v11 = 0x1ED368000;
                                  v10 = v1561;
                                  LOBYTE(v639) = v1237;
                                  if (!v1260)
                                    goto LABEL_599;
                                }
                                v639 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                _NRLogWithArgs(v639, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v1261, v1262, v1263, v1264, v1265, (uint64_t)"");

                                LOBYTE(v639) = v1237;
                                v11 = 0x1ED368000;
                              }
LABEL_599:
                              v3 = v1570;
                              if ((v639 & 1) != 0)
                                goto LABEL_642;
                              if ((_DWORD)v1559 != 1)
                              {
                                if ((_DWORD)v1559 != 2)
                                {
                                  if ((_DWORD)v1559 == 3)
                                  {
                                    v673 = *(_QWORD *)(v1570 + 136);
                                    if ((v673 & 8) != 0 && *v1558)
                                    {
                                      *(_QWORD *)(v1570 + 136) = v673 & 0xFFFFFFFFFFFFFFF7;
                                      if (!*(_BYTE *)(v11 + 1513))
                                        goto LABEL_606;
                                      v1339 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      v1340 = v1339;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        goto LABEL_1268;
                                      }
                                      v1454 = os_log_type_enabled(v1339, OS_LOG_TYPE_INFO);

                                      if (v1454)
                                      {
LABEL_1268:
                                        v1362 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                        _NRLogWithArgs((uint64_t)v1362, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1455, v1456, v1457, v1458, v1459, (uint64_t)"");
LABEL_1269:

                                      }
LABEL_1270:
                                      v3 = v1570;
                                      v10 = v1561;
LABEL_606:
                                      v674 = v1558;
                                      goto LABEL_641;
                                    }
                                    goto LABEL_642;
                                  }
                                  v675 = *(_QWORD *)(v1570 + 136);
LABEL_625:
                                  if ((v675 & 8) != 0 && *v1558)
                                  {
                                    *(_QWORD *)(v1570 + 136) = v675 & 0xFFFFFFFFFFFFFFF7;
                                    if (!*(_BYTE *)(v11 + 1513))
                                      goto LABEL_628;
                                    v1325 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    v1326 = v1325;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v3 = v1570;
                                      v10 = v1561;
                                      goto LABEL_1244;
                                    }
                                    v1389 = os_log_type_enabled(v1325, OS_LOG_TYPE_INFO);

                                    v3 = v1570;
                                    v10 = v1561;
                                    if (v1389)
                                    {
LABEL_1244:
                                      v1390 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      _NRLogWithArgs((uint64_t)v1390, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1391, v1392, v1393, v1394, v1395, (uint64_t)"");

                                    }
LABEL_628:
                                    dispatch_resume(*(dispatch_object_t *)(v3 + 304));
                                    v675 = *(_QWORD *)(v3 + 136);
                                  }
                                  if ((v675 & 0x10) != 0 && *(_QWORD *)(v3 + 320))
                                  {
                                    *(_QWORD *)(v3 + 136) = v675 & 0xFFFFFFFFFFFFFFEFLL;
                                    if (!gNRPacketLoggingEnabled)
                                      goto LABEL_632;
                                    v1327 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    v1328 = v1327;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v3 = v1570;
                                      v10 = v1561;
                                      goto LABEL_1246;
                                    }
                                    v1396 = os_log_type_enabled(v1327, OS_LOG_TYPE_INFO);

                                    v3 = v1570;
                                    v10 = v1561;
                                    if (v1396)
                                    {
LABEL_1246:
                                      v1397 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      _NRLogWithArgs((uint64_t)v1397, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1398, v1399, v1400, v1401, v1402, (uint64_t)"");

                                    }
LABEL_632:
                                    dispatch_resume(*(dispatch_object_t *)(v3 + 320));
                                    v675 = *(_QWORD *)(v3 + 136);
                                  }
                                  if ((v675 & 0x20) == 0)
                                    goto LABEL_637;
                                  v11 = 0x1ED368000uLL;
                                  if (*(_QWORD *)(v3 + 336))
                                  {
                                    *(_QWORD *)(v3 + 136) = v675 & 0xFFFFFFFFFFFFFFDFLL;
                                    if (!gNRPacketLoggingEnabled)
                                      goto LABEL_636;
                                    v1329 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    v1330 = v1329;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v3 = v1570;
                                      v10 = v1561;
                                      goto LABEL_1248;
                                    }
                                    v1403 = os_log_type_enabled(v1329, OS_LOG_TYPE_INFO);

                                    v3 = v1570;
                                    v10 = v1561;
                                    if (v1403)
                                    {
LABEL_1248:
                                      v1404 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                      _NRLogWithArgs((uint64_t)v1404, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1405, v1406, v1407, v1408, v1409, (uint64_t)"");

                                    }
LABEL_636:
                                    dispatch_resume(*(dispatch_object_t *)(v3 + 336));
                                    v675 = *(_QWORD *)(v3 + 136);
LABEL_637:
                                    v11 = 0x1ED368000uLL;
                                  }
                                  if ((v675 & 0x40) == 0 || !*(_QWORD *)(v3 + 352))
                                    goto LABEL_642;
LABEL_640:
                                  v674 = (dispatch_object_t *)(v3 + 352);
                                  *(_QWORD *)(v3 + 136) = v675 & 0xFFFFFFFFFFFFFFBFLL;
                                  if (*(_BYTE *)(v11 + 1513))
                                  {
                                    v1558 = (dispatch_object_t *)(v3 + 352);
                                    v1317 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    v1318 = v1317;
                                    if (sNRCopyLogToStdErr)
                                    {

                                    }
                                    else
                                    {
                                      v1361 = os_log_type_enabled(v1317, OS_LOG_TYPE_INFO);

                                      if (!v1361)
                                        goto LABEL_1270;
                                    }
                                    v1362 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                    _NRLogWithArgs((uint64_t)v1362, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v1363, v1364, v1365, v1366, v1367, (uint64_t)"");
                                    goto LABEL_1269;
                                  }
LABEL_641:
                                  dispatch_resume(*v674);
                                  v11 = 0x1ED368000uLL;
LABEL_642:
                                  if (*(_BYTE *)(v11 + 1513))
                                  {
                                    v1239 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    v1240 = v1239;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v3 = v1570;
                                      v10 = v1561;
                                    }
                                    else
                                    {
                                      v1266 = os_log_type_enabled(v1239, OS_LOG_TYPE_INFO);

                                      v3 = v1570;
                                      v10 = v1561;
                                      if (!v1266)
                                        goto LABEL_643;
                                    }
                                    v1267 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    _NRLogWithArgs((uint64_t)v1267, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v1268, v1269, v1270, v1271, v1272, (uint64_t)"");

                                  }
LABEL_643:
                                  v679 = *(unsigned __int8 *)(v456 + 82);
                                  if (v679 >= 0xB)
                                  {
                                    v679 = *(unsigned __int8 *)(v456 + 82)
                                         - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v456 + 82)) >> 32);
                                    *(_BYTE *)(v456 + 82) = v679;
                                  }
                                  *(_DWORD *)(v456 + 4 * v679 + 36) = v641 | 0x60000;
LABEL_646:
                                  v680 = (117 * (*(_BYTE *)(v456 + 82) + 1)) >> 8;
                                  *(_BYTE *)(v456 + 82) = *(_BYTE *)(v456 + 82)
                                                        + 1
                                                        - 11
                                                        * ((v680
                                                          + (((*(_BYTE *)(v456 + 82) + 1 - v680) & 0xFE) >> 1)) >> 3);
                                  goto LABEL_647;
                                }
                                v676 = *(_QWORD *)(v1570 + 136);
                                if ((v676 & 8) != 0 && *v1558)
                                {
                                  *(_QWORD *)(v1570 + 136) = v676 & 0xFFFFFFFFFFFFFFF7;
                                  if (!*(_BYTE *)(v11 + 1513))
                                    goto LABEL_618;
                                  v1341 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                  v1342 = v1341;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    v3 = v1570;
                                    v10 = v1561;
                                    goto LABEL_1272;
                                  }
                                  v1460 = os_log_type_enabled(v1341, OS_LOG_TYPE_INFO);

                                  v3 = v1570;
                                  v10 = v1561;
                                  if (v1460)
                                  {
LABEL_1272:
                                    v1461 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    _NRLogWithArgs((uint64_t)v1461, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1462, v1463, v1464, v1465, v1466, (uint64_t)"");

                                  }
LABEL_618:
                                  dispatch_resume(*(dispatch_object_t *)(v3 + 304));
                                  v676 = *(_QWORD *)(v3 + 136);
                                  v11 = 0x1ED368000uLL;
                                }
                                if ((v676 & 0x10) != 0 && *(_QWORD *)(v3 + 320))
                                {
                                  v674 = (dispatch_object_t *)(v3 + 320);
                                  *(_QWORD *)(v3 + 136) = v676 & 0xFFFFFFFFFFFFFFEFLL;
                                  if (*(_BYTE *)(v11 + 1513))
                                  {
                                    v1558 = (dispatch_object_t *)(v3 + 320);
                                    v677 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                    v678 = v677;
                                    if (sNRCopyLogToStdErr)
                                    {

                                    }
                                    else
                                    {
                                      v1448 = os_log_type_enabled(v677, OS_LOG_TYPE_INFO);

                                      if (!v1448)
                                        goto LABEL_1270;
                                    }
                                    v1362 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                                    _NRLogWithArgs((uint64_t)v1362, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1449, v1450, v1451, v1452, v1453, (uint64_t)"");
                                    goto LABEL_1269;
                                  }
                                  goto LABEL_641;
                                }
                                goto LABEL_642;
                              }
                              v675 = *(_QWORD *)(v1570 + 136);
                              if ((*(_BYTE *)(v1570 + 10) & 4) == 0)
                                goto LABEL_625;
                              if ((v675 & 0x20) != 0 && *(_QWORD *)(v1570 + 336))
                              {
                                *(_QWORD *)(v1570 + 136) = v675 & 0xFFFFFFFFFFFFFFDFLL;
                                if (!*(_BYTE *)(v11 + 1513))
                                  goto LABEL_611;
                                v1410 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                v1411 = v1410;
                                if (sNRCopyLogToStdErr)
                                {

                                  v3 = v1570;
                                  v10 = v1561;
                                  goto LABEL_1282;
                                }
                                v1486 = os_log_type_enabled(v1410, OS_LOG_TYPE_INFO);

                                v3 = v1570;
                                v10 = v1561;
                                if (v1486)
                                {
LABEL_1282:
                                  v1487 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
                                  _NRLogWithArgs((uint64_t)v1487, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1488, v1489, v1490, v1491, v1492, (uint64_t)"");

                                }
LABEL_611:
                                dispatch_resume(*(dispatch_object_t *)(v3 + 336));
                                v675 = *(_QWORD *)(v3 + 136);
                                v11 = 0x1ED368000;
                              }
                              if ((v675 & 0x40) == 0 || !*(_QWORD *)(v3 + 352))
                                goto LABEL_642;
                              goto LABEL_640;
                            }
LABEL_570:
                            if (v1571 <= 8u)
                            {
                              if (!v1575)
                                goto LABEL_575;
                              v651 = os_channel_available_slot_count();
                              v11 = 0x1ED368000uLL;
                              if (v651 > 1)
                                goto LABEL_575;
                            }
                            if (!*(_BYTE *)(v11 + 1513))
                            {
LABEL_574:
                              v641 = v535 | 0x18000;
                              os_channel_sync();
                              *(_BYTE *)(v1570 + 13) = 0;
                              v11 = 0x1ED368000uLL;
                              goto LABEL_575;
                            }
                            v657 = v639;
                            v658 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            v639 = (uint64_t)v658;
                            if (sNRCopyLogToStdErr)
                            {

                            }
                            else
                            {
                              v666 = os_log_type_enabled(v658, OS_LOG_TYPE_INFO);

                              LODWORD(v639) = v657;
                              if (!v666)
                                goto LABEL_574;
                            }
                            v639 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs(v639, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v667, v668, v669, v670, v671, (uint64_t)"");

                            LODWORD(v639) = v657;
                            goto LABEL_574;
                          }
                          v654 = (int)v1569;
                          v655 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v656 = v655;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_585;
                          }
                          v659 = os_log_type_enabled(v655, OS_LOG_TYPE_INFO);

                          if (v659)
                          {
LABEL_585:
                            v660 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v660, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v661, v662, v663, v664, v665, (uint64_t)"");

                          }
                          v11 = 0x1ED368000;
                          LODWORD(v639) = v654;
                          v641 = v535 | 0x8000;
                          if (!v475)
                            goto LABEL_560;
LABEL_569:
                          os_channel_advance_slot();
                          v11 = 0x1ED368000;
                          *(_BYTE *)(v1570 + 13) = 1;
                          goto LABEL_570;
                        }
LABEL_508:
                        if (v536 < *(unsigned __int16 *)(v456 + 80))
                        {
                          if (!*(_BYTE *)(v11 + 1513))
                            goto LABEL_510;
                          v579 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                          v580 = v579;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_544;
                          }
                          v599 = os_log_type_enabled(v579, OS_LOG_TYPE_INFO);

                          if (v599)
                          {
LABEL_544:
                            v600 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                            _NRLogWithArgs((uint64_t)v600, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v601, v602, v603, v604, v605, (uint64_t)"");

                          }
LABEL_510:
                          v535 |= 0x2000u;
                          memmove(*(void **)v456, (const void *)(*(_QWORD *)v456 + v1576), *(unsigned __int16 *)(v456 + 80) - v1576);
                          v554 = v1576;
                          *(_WORD *)(v456 + 80) -= v1576;
                          v1567 = (v1567 + 1);
                          v11 = 0x1ED368000;
LABEL_513:
                          *(_QWORD *)(v1570 + v1566) += v554;
                          goto LABEL_514;
                        }
                        if (!*(_BYTE *)(v11 + 1513))
                        {
LABEL_512:
                          v535 |= 0x4000u;
                          *(_WORD *)(v456 + 80) = 0;
                          v554 = v1576;
                          goto LABEL_513;
                        }
                        v581 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        v582 = v581;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          v606 = os_log_type_enabled(v581, OS_LOG_TYPE_INFO);

                          v11 = 0x1ED368000;
                          if (!v606)
                            goto LABEL_512;
                        }
                        v607 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        _NRLogWithArgs((uint64_t)v607, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v608, v609, v610, v611, v612, (uint64_t)"");

                        v11 = 0x1ED368000;
                        goto LABEL_512;
                      }
                      v535 = v485 | 0x400;
                      if (!*(_BYTE *)(v11 + 1513))
                      {
                        LODWORD(v639) = 0;
                        v640 = 1;
                        v641 = v485 | 0x8400;
                        if (v475)
                          goto LABEL_569;
                        goto LABEL_560;
                      }
                      v642 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      v643 = v642;
                      if (sNRCopyLogToStdErr)
                      {

                        goto LABEL_565;
                      }
                      v644 = os_log_type_enabled(v642, OS_LOG_TYPE_INFO);

                      if (v644)
                      {
LABEL_565:
                        v645 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                        _NRLogWithArgs((uint64_t)v645, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v646, v647, v648, v649, v650, (uint64_t)"");

                      }
                      v11 = 0x1ED368000uLL;
                      goto LABEL_567;
                    }
                    os_channel_slot_get_packet();
                    os_packet_get_next_buflet();
                    v496 = os_buflet_get_data_offset();
                    v497 = os_buflet_get_object_address();
                    v498 = os_buflet_get_data_length();
                    if (v498 >= 0x10000)
                    {
                      if (nrCopyLogObj_onceToken_509 == -1)
                        goto LABEL_847;
                      goto LABEL_898;
                    }
                    v499 = v498;
                    if (!(_WORD)v498 && WORD1(v1578))
                    {
                      v1576 = 0;
                      v1577 = 0;
                      v1576 = *(_QWORD *)v456 + *(unsigned __int16 *)(v456 + 80);
                      LODWORD(v1577) = v495;
                      v500 = nrPacketToTLV((unsigned __int8 *)v1579, WORD1(v1578), (uint64_t)&v1576, 1u, (uint64_t)ESPSequenceNumberFromPacket, v1572);
                      if (!gNRPacketLoggingEnabled)
                      {
LABEL_454:
                        v485 |= 0x80u;
                        goto LABEL_460;
                      }
                      v506 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      v507 = v506;
                      if (sNRCopyLogToStdErr)
                      {

                      }
                      else
                      {
                        v512 = os_log_type_enabled(v506, OS_LOG_TYPE_INFO);

                        if (!v512)
                          goto LABEL_454;
                      }
                      v513 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      getESPSequenceNumberFromPacket(v1579, WORD1(v1578));
                      getESPSPIFromPacket(v1579, WORD1(v1578));
                      _NRLogWithArgs((uint64_t)v513, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v514, v515, v516, v517, v518, (uint64_t)"");

                      goto LABEL_454;
                    }
                    if ((_WORD)v498)
                    {
                      v501 = (unsigned __int8 *)(v497 + v496);
                      v1576 = 0;
                      v1577 = 0;
                      v1576 = *(_QWORD *)v456 + *(unsigned __int16 *)(v456 + 80);
                      LODWORD(v1577) = v495;
                      v500 = nrPacketToTLV(v501, (unsigned __int16)v498, (uint64_t)&v1576, 1u, (uint64_t)ESPSequenceNumberFromPacket, v1572);
                      if (!gNRPacketLoggingEnabled)
                      {
LABEL_457:
                        v485 |= 0x100u;
                        goto LABEL_460;
                      }
                      v508 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      v509 = v508;
                      if (sNRCopyLogToStdErr)
                      {

                      }
                      else
                      {
                        v519 = os_log_type_enabled(v508, OS_LOG_TYPE_INFO);

                        if (!v519)
                          goto LABEL_457;
                      }
                      v520 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                      getESPSequenceNumberFromPacket((uint64_t)v501, v499);
                      getESPSPIFromPacket((uint64_t)v501, v499);
                      _NRLogWithArgs((uint64_t)v520, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v521, v522, v523, v524, v525, (uint64_t)"");

                      goto LABEL_457;
                    }
                    v485 |= 0x200u;
                    if (!gNRPacketLoggingEnabled)
                      goto LABEL_459;
                    v510 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                    v511 = v510;
                    if (sNRCopyLogToStdErr)
                      break;
                    v500 = os_log_type_enabled(v510, OS_LOG_TYPE_INFO);

                    if (v500)
                      goto LABEL_478;
LABEL_460:
                    *(_WORD *)(v456 + 80) += v500;
                    if ((v1574 & 8) != 0)
                      v502 = 0;
                    else
                      v502 = os_channel_get_next_slot();
                    ++v459;
                    v503 = v1570;
                    ++*(_QWORD *)(v1570 + 432);
                    *(_BYTE *)(v503 + 14) = 1;
                    v458 += v500;
                    if (!v502)
                    {
                      v474 = 0;
                      v475 = v494;
                      goto LABEL_482;
                    }
                    v504 = *(unsigned __int8 *)(v456 + 82);
                    if (v504 >= 0xB)
                    {
                      v504 = *(unsigned __int8 *)(v456 + 82)
                           - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v456 + 82)) >> 32);
                      *(_BYTE *)(v456 + 82) = v504;
                    }
                    *(_DWORD *)(v456 + 4 * v504 + 36) = v485;
                    v505 = (117 * (*(_BYTE *)(v456 + 82) + 1)) >> 8;
                    *(_BYTE *)(v456 + 82) = *(_BYTE *)(v456 + 82)
                                          + 1
                                          - 11
                                          * ((v505 + (((*(_BYTE *)(v456 + 82) + 1 - v505) & 0xFE) >> 1)) >> 3);
                    v475 = v494;
                    v494 = v502;
                    v485 = 0;
                  }

LABEL_478:
                  v526 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                  _NRLogWithArgs((uint64_t)v526, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v527, v528, v529, v530, v531, (uint64_t)"");

LABEL_459:
                  v500 = 0;
                  goto LABEL_460;
                }
                v583 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                v584 = v583;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  LODWORD(v1569) = os_log_type_enabled(v583, OS_LOG_TYPE_INFO);

                  v11 = 0x1ED368000;
                  if (!(_DWORD)v1569)
                    goto LABEL_444;
                }
                v615 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
                _NRLogWithArgs((uint64_t)v615, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v616, v617, v618, v619, v620, (uint64_t)"");

                v11 = 0x1ED368000;
                goto LABEL_444;
              }
              if (!*(_BYTE *)(v11 + 1513))
              {
LABEL_591:
                if (v1565)
                  v1565(v3);
                v672 = *(unsigned __int8 *)(v456 + 82);
                if (v672 >= 0xB)
                {
                  v672 = *(unsigned __int8 *)(v456 + 82)
                       - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v456 + 82)) >> 32);
                  *(_BYTE *)(v456 + 82) = v672;
                }
                *(_DWORD *)(v456 + 4 * v672 + 36) = 3;
                goto LABEL_646;
              }
              v694 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              v695 = v694;
              if (sNRCopyLogToStdErr)
              {

                v3 = v1570;
              }
              else
              {
                v1216 = os_log_type_enabled(v694, OS_LOG_TYPE_INFO);

                v3 = v1570;
                if (!v1216)
                  goto LABEL_591;
              }
              v1217 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
              _NRLogWithArgs((uint64_t)v1217, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v1218, v1219, v1220, v1221, v1222, (uint64_t)"");

              goto LABEL_591;
            }
            v689 = (uint64_t)v18;
            if (!*(_BYTE *)(v11 + 1513))
              goto LABEL_664;
            v1500 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
            v1501 = v1500;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v1506 = os_log_type_enabled(v1500, OS_LOG_TYPE_INFO);

              if (!v1506)
                goto LABEL_664;
            }
            v1507 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
            _NRLogWithArgs((uint64_t)v1507, 1, (uint64_t)"%s%.30s:%-4d ", v1508, v1509, v1510, v1511, v1512, (uint64_t)"");

LABEL_664:
            v690 = _NRCopyLogObjectForNRUUID(*(void **)(v1570 + 40));
            v691 = v690;
            if (sNRCopyLogToStdErr)
            {

              v3 = v1570;
            }
            else
            {
              v931 = os_log_type_enabled(v690, OS_LOG_TYPE_FAULT);

              v3 = v1570;
              if (!v931)
                goto LABEL_647;
            }
            v932 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
            _NRLogWithArgs((uint64_t)v932, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v933, v934, v935, v936, v937, v689);

LABEL_647:
            goto LABEL_648;
          }
        }
        v414 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
        _NRLogWithArgs((uint64_t)v414, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v415, v416, v417, v418, v419, (uint64_t)"");
        goto LABEL_394;
      case 1:
        v406 = *(_QWORD *)(v3 + 136);
        ++*(_QWORD *)(v3 + 144);
        *(_QWORD *)(v3 + 136) = v406 & 0xFFFFFFFFFFFFFFFELL | *(_BYTE *)(a1 + 84) & 1;
        if (!*(_BYTE *)(v4 + 1513))
          goto LABEL_7;
        v407 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
        v408 = v407;
        if (sNRCopyLogToStdErr)
        {

          v3 = v1570;
        }
        else
        {
          v952 = os_log_type_enabled(v407, OS_LOG_TYPE_INFO);

          v3 = v1570;
          if (!v952)
            goto LABEL_7;
        }
        v414 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
        _NRLogWithArgs((uint64_t)v414, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v953, v954, v955, v956, v957, (uint64_t)"");
        goto LABEL_394;
      case 2:
        ++*(_QWORD *)(v3 + 160);
        *(_QWORD *)(v3 + 136) = *(_QWORD *)(v3 + 136) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(_BYTE *)(a1 + 84) & 1));
        if (!*(_BYTE *)(v4 + 1513))
          goto LABEL_7;
        v409 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
        v410 = v409;
        if (sNRCopyLogToStdErr)
        {

          v3 = v1570;
        }
        else
        {
          v958 = os_log_type_enabled(v409, OS_LOG_TYPE_INFO);

          v3 = v1570;
          if (!v958)
            goto LABEL_7;
        }
        v414 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
        _NRLogWithArgs((uint64_t)v414, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v959, v960, v961, v962, v963, (uint64_t)"");
        goto LABEL_394;
      case 3:
        ++*(_QWORD *)(v3 + 176);
        *(_QWORD *)(v3 + 136) = *(_QWORD *)(v3 + 136) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(_BYTE *)(a1 + 84) & 1));
        if (!*(_BYTE *)(v4 + 1513))
          goto LABEL_7;
        v411 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
        v412 = v411;
        if (sNRCopyLogToStdErr)
        {

          v3 = v1570;
        }
        else
        {
          v964 = os_log_type_enabled(v411, OS_LOG_TYPE_INFO);

          v3 = v1570;
          if (!v964)
            goto LABEL_7;
        }
        v414 = _NRCopyLogObjectForNRUUID(*(void **)(v3 + 40));
        _NRLogWithArgs((uint64_t)v414, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v965, v966, v967, v968, v969, (uint64_t)"");
LABEL_394:

        goto LABEL_7;
      default:
        goto LABEL_7;
    }
  }
  v420 = nrCopyLogObj_506();
  v421 = v420;
  if (sNRCopyLogToStdErr)
  {

LABEL_406:
    v1575 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v1575, 17, (uint64_t)"%s called with null linkWriteContext", v425, v426, v427, v428, v429, (uint64_t)"NRParserLinkWriteAvailable");

    return;
  }
  v424 = os_log_type_enabled(v420, OS_LOG_TYPE_FAULT);

  if (v424)
    goto LABEL_406;
}

__CFString *createStringFromNRLinkChannelPriority(unsigned int a1)
{
  if (a1 >= 4)
    return (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%d)"), a1);
  else
    return off_1EA3F70A0[a1];
}

void NRBluetoothPacketParserSuspendNexusVOInputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 8) == 0 && *(_QWORD *)(a1 + 304))
  {
    *(_QWORD *)(a1 + 136) = v1 | 8;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_suspend(*(dispatch_object_t *)(a1 + 304));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusVOInput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

void NRBluetoothPacketParserSuspendNexusBEInputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 0x20) == 0 && *(_QWORD *)(a1 + 336))
  {
    *(_QWORD *)(a1 + 136) = v1 | 0x20;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_suspend(*(dispatch_object_t *)(a1 + 336));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusBEInput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

void NRBluetoothPacketParserSuspendNexusBKInputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 0x40) == 0 && *(_QWORD *)(a1 + 352))
  {
    *(_QWORD *)(a1 + 136) = v1 | 0x40;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_suspend(*(dispatch_object_t *)(a1 + 352));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusBKInput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

void NRBluetoothPacketParserSuspendNexusVIInputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 0x10) == 0 && *(_QWORD *)(a1 + 320))
  {
    *(_QWORD *)(a1 + 136) = v1 | 0x10;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_suspend(*(dispatch_object_t *)(a1 + 320));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusVIInput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

void NRBluetoothParserReadFlushCallback(uint64_t a1)
{
  void **v2;
  os_log_t v3;
  os_log_t v4;
  os_log_t v5;
  os_log_t v6;
  os_log_t v7;
  os_log_t v8;
  _BOOL4 v9;
  os_log_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void **v29;

  if (a1)
  {
    v2 = (void **)*(id *)(a1 + 8);
    if (*((_BYTE *)v2 + 8) == 4)
    {
LABEL_15:

      return;
    }
    if (*(unsigned __int8 *)(a1 + 26) - 1 > 2)
    {
      if (*(_WORD *)(a1 + 24))
      {
LABEL_11:
        if (!gNRPacketLoggingEnabled)
          goto LABEL_15;
        v29 = v2;
        v3 = _NRCopyLogObjectForNRUUID(v2[5]);
        v4 = v3;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v16 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

          v2 = v29;
          if (!v16)
            goto LABEL_15;
        }
        v10 = _NRCopyLogObjectForNRUUID(v29[5]);
        _NRLogWithArgs((uint64_t)v10, 1, (uint64_t)"%s%.30s:%-4d Tried to sync nexus output but _nexusOutputRing is NULL", v17, v18, v19, v20, v21, (uint64_t)"");
        goto LABEL_24;
      }
    }
    else if (*(_WORD *)(a1 + 24))
    {
      if (v2[-2 * (*(_BYTE *)(a1 + 26) - 1) + 35])
      {
        v29 = v2;
        if (!gNRPacketLoggingEnabled)
        {
LABEL_7:
          os_channel_sync();
          *(_WORD *)(a1 + 24) = 0;
LABEL_8:
          v2 = v29;
          goto LABEL_15;
        }
        v7 = _NRCopyLogObjectForNRUUID(v2[5]);
        v8 = v7;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v22 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

          if (!v22)
            goto LABEL_7;
        }
        v23 = _NRCopyLogObjectForNRUUID(v29[5]);
        _NRLogWithArgs((uint64_t)v23, 1, (uint64_t)"%s%.30s:%-4d syncing nexus output (%u packets)", v24, v25, v26, v27, v28, (uint64_t)"");

        goto LABEL_7;
      }
      goto LABEL_11;
    }
    if (!gNRPacketLoggingEnabled)
      goto LABEL_15;
    v29 = v2;
    v5 = _NRCopyLogObjectForNRUUID(v2[5]);
    v6 = v5;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v9 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      v2 = v29;
      if (!v9)
        goto LABEL_15;
    }
    v10 = _NRCopyLogObjectForNRUUID(v29[5]);
    _NRLogWithArgs((uint64_t)v10, 1, (uint64_t)"%s%.30s:%-4d highestNexusOutputSlotWrittenTo is NULL", v11, v12, v13, v14, v15, (uint64_t)"");
LABEL_24:

    goto LABEL_8;
  }
}

uint64_t NRBluetoothParserReadInputCallback(uint64_t a1, const __CFString *a2, unint64_t a3, unint64_t *a4, char a5)
{
  void **v10;
  void **v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  os_log_t v17;
  os_log_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  os_log_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  os_log_t v48;
  os_log_t v49;
  _BOOL4 v50;
  os_log_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  os_log_t v57;
  os_log_t v58;
  _BOOL4 v59;
  os_log_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __CFString *StringFromNRLinkChannelPriority;

  if (!a2)
  {
    v31 = nrCopyLogObj_506();
    v32 = v31;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v35 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

      if (!v35)
        return 0;
    }
    v11 = (void **)nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null buffer", v36, v37, v38, v39, v40, (uint64_t)"NRBluetoothParserReadInputCallback");
LABEL_35:
    v12 = 0;
    goto LABEL_26;
  }
  if (!a4)
  {
    v33 = nrCopyLogObj_506();
    v34 = v33;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v41 = os_log_type_enabled(v33, OS_LOG_TYPE_FAULT);

      if (!v41)
        return 0;
    }
    v11 = (void **)nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null handledBufferLength", v42, v43, v44, v45, v46, (uint64_t)"NRBluetoothParserReadInputCallback");
    goto LABEL_35;
  }
  if (!a1)
    return 0;
  v10 = (void **)*(id *)(a1 + 8);
  v11 = v10;
  if (*((_BYTE *)v10 + 8) != 4)
  {
    if (!gNRPacketLoggingEnabled)
      goto LABEL_7;
    v48 = _NRCopyLogObjectForNRUUID(v10[5]);
    v49 = v48;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v50 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);

      if (!v50)
        goto LABEL_7;
    }
    v51 = _NRCopyLogObjectForNRUUID(v11[5]);
    StringFromNRLinkChannelPriority = createStringFromNRLinkChannelPriority(*(unsigned __int8 *)(a1 + 26));
    _NRLogWithArgs((uint64_t)v51, 1, (uint64_t)"%s%.30s:%-4d Link input available - %@", v52, v53, v54, v55, v56, (uint64_t)"");

LABEL_7:
    v13 = *(unsigned __int8 *)(a1 + 26);
    v14 = 560;
    if (v13 == 3)
      v14 = 576;
    v15 = v13 == 2;
    v16 = 592;
    if (!v15)
      v16 = v14;
    *(void **)((char *)v11 + v16) = *(char **)((char *)v11 + v16) + a3;
    if ((*(_BYTE *)(a1 + 27) & 1) == 0)
    {
      v17 = _NRCopyLogObjectForNRUUID(v11[5]);
      v18 = v17;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v23 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

        if (!v23)
        {
LABEL_21:
          v12 = 0;
          *a4 = 0;
          goto LABEL_26;
        }
      }
      v24 = _NRCopyLogObjectForNRUUID(v11[5]);
      _NRLogWithArgs((uint64_t)v24, 0, (uint64_t)"%s%.30s:%-4d not ready to accept data", v25, v26, v27, v28, v29, (uint64_t)"");

      goto LABEL_21;
    }
    if ((*(_BYTE *)(a1 + 27) & 2) != 0)
    {
      v12 = NRBluetoothPacketParserLinkToNexusLoopFastPath((uint64_t)v11, a1, a2, a3, a4, a5);
      goto LABEL_26;
    }
    if (*((_BYTE *)v11 + 8) == 4)
    {
LABEL_25:
      *a4 = a3;
      v12 = 1;
      goto LABEL_26;
    }
    v19 = *(_QWORD *)a1;
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (*(unsigned __int8 *)(a1 + 26) - 1 > 2)
      v22 = &unk_1EA400ED0;
    else
      v22 = (void *)qword_1EA3F70C0[(*(_BYTE *)(a1 + 26) - 1)];
    memcpy((void *)(v19 + *(unsigned int *)(a1 + 16)), a2, a3);
    *(_DWORD *)(a1 + 16) += a3;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_24:
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2, a3);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("channel-id"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, CFSTR("message-data"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1EA400EE8, CFSTR("message-pre-act"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("message"));
      objc_msgSend(v11[50], "sendXPCCommDictionary:", v20);

      goto LABEL_25;
    }
    v57 = _NRCopyLogObjectForNRUUID(v11[5]);
    v58 = v57;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v59 = os_log_type_enabled(v57, OS_LOG_TYPE_INFO);

      if (!v59)
        goto LABEL_24;
    }
    v60 = _NRCopyLogObjectForNRUUID(v11[5]);
    _NRLogWithArgs((uint64_t)v60, 1, (uint64_t)"%s%.30s:%-4d Reading link input, setting filledIn=%u (linkChannelPriority=%u)", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_24;
  }
  v12 = 0;
LABEL_26:

  return v12;
}

uint64_t NRBluetoothPacketParserLinkToNexusLoopFastPath(uint64_t a1, uint64_t a2, const __CFString *a3, unint64_t a4, unint64_t *a5, char a6)
{
  char v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  char v19;
  char v20;
  _BOOL4 v21;
  unsigned int v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  os_log_t v31;
  os_log_t v32;
  _BOOL4 v33;
  os_log_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  os_log_t v40;
  os_log_t v41;
  _BOOL4 v42;
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  _BOOL4 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;
  unint64_t v62;
  _DWORD *v63;
  char v64;
  int v65;
  int v66;
  unint64_t v67;
  unsigned int v68;
  os_log_t v69;
  os_log_t v70;
  int v71;
  int v72;
  os_log_t v73;
  os_log_t v74;
  char v75;
  unsigned int v76;
  unint64_t v77;
  unint64_t v78;
  BOOL v79;
  unsigned int v80;
  unsigned int v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  os_log_t v86;
  os_log_t v87;
  unsigned int v88;
  unsigned int v89;
  unint64_t v90;
  const void **v91;
  int v92;
  os_log_t v93;
  os_log_t v94;
  _BOOL4 v95;
  os_log_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  os_log_t v102;
  os_log_t v103;
  os_log_t v104;
  os_log_t v105;
  os_log_t v106;
  os_log_t v107;
  os_log_t v108;
  os_log_t v109;
  _BOOL4 v110;
  os_log_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  os_log_t v117;
  os_log_t v118;
  os_log_t v119;
  os_log_t v120;
  os_log_t v121;
  os_log_t v122;
  os_log_t v123;
  _BOOL4 v124;
  os_log_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  os_log_t v131;
  os_log_t v132;
  _BOOL4 v133;
  os_log_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  os_log_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  _BOOL4 v146;
  os_log_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unsigned int v153;
  os_log_t v154;
  os_log_t v155;
  _BOOL4 v156;
  os_log_t v157;
  __CFString *StringFromNRTLVType;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  os_log_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  os_log_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  os_log_t v176;
  os_log_t v177;
  os_log_t v178;
  os_log_t v179;
  os_log_t v180;
  os_log_t v181;
  os_log_t v182;
  os_log_t v183;
  os_log_t v184;
  os_log_t v185;
  _BOOL4 v186;
  __CFString *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unsigned int v193;
  unsigned int v194;
  uint64_t v195;
  unsigned int v196;
  unsigned int v197;
  uint64_t v198;
  unsigned int v199;
  unsigned int v200;
  unsigned int v201;
  size_t v202;
  size_t v203;
  int v204;
  int v205;
  __int128 *v206;
  unsigned int v207;
  unsigned __int8 *v208;
  size_t v209;
  unsigned int v210;
  uint64_t v211;
  unsigned int v212;
  unsigned int v213;
  char *v214;
  char *v215;
  int v216;
  size_t v217;
  unsigned int v218;
  int v219;
  uint64_t v220;
  uint64_t v221;
  int v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const void **v227;
  uint64_t v228;
  size_t v229;
  int v230;
  os_log_t v231;
  os_log_t v232;
  os_log_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  os_log_t v239;
  uint64_t v240;
  unsigned int v241;
  unsigned int v242;
  int v243;
  size_t v244;
  id v245;
  id v246;
  void *v247;
  os_log_t v248;
  os_log_t v249;
  os_log_t v250;
  os_log_t v251;
  uint64_t v252;
  os_log_t v253;
  os_log_t v254;
  _BOOL4 v255;
  os_log_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  os_log_t v262;
  os_log_t v263;
  os_log_t v264;
  os_log_t v265;
  os_log_t v266;
  os_log_t v267;
  os_log_t v268;
  os_log_t v269;
  os_log_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  _BOOL4 v281;
  os_log_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  _BOOL4 v288;
  os_log_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  _BOOL4 v295;
  uint64_t v296;
  void *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  _BOOL4 v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  _BOOL4 v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  os_log_t v325;
  os_log_t v326;
  _BOOL4 v327;
  os_log_t v328;
  __CFString *v329;
  unsigned int v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  _BOOL4 v336;
  os_log_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  os_log_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  os_log_t v349;
  os_log_t v350;
  _BOOL4 v351;
  os_log_t v352;
  void *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  _BOOL4 v359;
  os_log_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  os_log_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  _BOOL4 v372;
  os_log_t v373;
  __CFString *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  os_log_t v380;
  os_log_t v381;
  _BOOL4 v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  _BOOL4 v388;
  os_log_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  os_log_t v395;
  os_log_t v396;
  _BOOL4 v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  int v403;
  unsigned int v404;
  os_log_t v405;
  os_log_t v406;
  os_log_t v407;
  os_log_t v408;
  __CFString *v409;
  void *IOVecStringWithContents;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  _BOOL4 v423;
  uint64_t v424;
  os_log_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  void *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  os_log_t v437;
  os_log_t v438;
  _BOOL4 v439;
  os_log_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  unsigned int v446;
  unsigned int v447;
  os_log_t v448;
  os_log_t v449;
  unint64_t v450;
  int v451;
  os_log_t v452;
  os_log_t v453;
  const __CFString *v455;
  size_t v456;
  os_log_t v457;
  os_log_t v458;
  os_log_t v459;
  os_log_t v460;
  _BOOL4 v461;
  os_log_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  os_log_t v468;
  os_log_t v469;
  NSObject *v470;
  NSObject *v471;
  const char *v472;
  _BOOL4 v473;
  NSObject *v474;
  NSObject *v475;
  _BOOL4 v476;
  NSObject *v477;
  NSObject *v478;
  _BOOL4 v479;
  int v480;
  int v481;
  unsigned int v482;
  NSObject *v483;
  NSObject *v484;
  _BOOL4 v485;
  NSObject *v486;
  NSObject *v487;
  _BOOL4 v488;
  id v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  _BOOL4 v495;
  os_log_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  os_log_t v502;
  os_log_t v503;
  id v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  const char *v511;
  id v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  id v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  void *v525;
  id v526;
  id v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  int v534;
  int v535;
  NSObject *v536;
  NSObject *v537;
  _BOOL4 v538;
  NSObject *v539;
  NSObject *v540;
  NSObject *v541;
  _BOOL4 v542;
  NSObject *v543;
  NSObject *v544;
  _BOOL4 v545;
  NSObject *v546;
  os_log_t v547;
  os_log_t v548;
  os_log_t v549;
  os_log_t v550;
  _BOOL4 v551;
  os_log_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  NSObject *v558;
  NSObject *v559;
  _BOOL4 v560;
  unsigned int v561;
  NSObject *v562;
  NSObject *v563;
  _BOOL4 v564;
  unsigned int v565;
  NSObject *v566;
  NSObject *v567;
  _BOOL4 v568;
  id v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  id v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  id v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  void *v588;
  id v589;
  _BOOL4 v590;
  os_log_t v591;
  uint64_t v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  NSObject *v597;
  id v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  const char *v604;
  NSObject *v605;
  void *v606;
  unsigned int v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  os_log_t v614;
  os_log_t v615;
  _BOOL4 v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  os_log_t v623;
  os_log_t v624;
  _BOOL4 v625;
  os_log_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  _BOOL4 v632;
  os_log_t v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  os_log_t v639;
  os_log_t v640;
  id v641;
  uint64_t v642;
  uint64_t v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  id v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  id v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  id v661;
  NSObject *v662;
  NSObject *v663;
  _BOOL4 v664;
  int v665;
  NSObject *v666;
  NSObject *v667;
  _BOOL4 v668;
  _BOOL4 v669;
  os_log_t v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t v675;
  id v676;
  uint64_t v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  id v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  uint64_t v687;
  uint64_t v688;
  uint64_t v689;
  _BOOL4 v690;
  uint64_t v691;
  uint64_t v692;
  uint64_t v693;
  uint64_t v694;
  uint64_t v695;
  _BOOL4 v696;
  os_log_t v697;
  uint64_t v698;
  uint64_t v699;
  uint64_t v700;
  uint64_t v701;
  uint64_t v702;
  os_log_t v703;
  os_log_t v704;
  _BOOL4 v705;
  os_log_t v706;
  uint64_t v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t v711;
  os_log_t v712;
  os_log_t v713;
  _BOOL4 v714;
  os_log_t v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t v719;
  uint64_t v720;
  _BOOL4 v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  NSObject *v727;
  NSObject *v728;
  _BOOL4 v729;
  id v730;
  uint64_t v731;
  uint64_t v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  void *v736;
  void *IOVecString;
  void *v738;
  void *v739;
  void *v740;
  void *v741;
  void *v742;
  void *v743;
  __CFString *v744;
  void *v745;
  void *v746;
  void *v747;
  void *v748;
  void *v749;
  void *v750;
  uint64_t v751;
  uint64_t v752;
  uint64_t *v753;
  uint64_t v754;
  unint64_t v755;
  uint64_t v756;
  uint64_t (*v757)();
  size_t v758;
  _BYTE *v759;
  _QWORD *v760;
  uint64_t (*v761)();
  _OWORD *v762;
  _OWORD *v763;
  __CFString *v764;
  uint64_t v765;
  _BOOL4 v766;
  unint64_t *v767;
  uint64_t *PacketString;
  uint64_t v769;
  char *v770;
  os_log_t v771;
  os_log_t v772;
  id v773;
  uint64_t next_slot;
  uint64_t v775;
  uint64_t v776;
  const __CFString *v777;
  unint64_t v778;
  __int128 v779;
  __int128 v780;
  __int128 v781;
  __int128 v782;
  uint64_t v783;
  uint64_t v784;
  __int128 v785;
  __int128 v786;
  __int128 v787;
  __int128 v788;
  __int128 v789;
  __int128 v790;
  __int128 v791;
  __int128 v792;
  __int128 v793;
  __int128 v794;
  __int128 v795;
  __int128 v796;
  __int128 v797;
  __int128 v798;
  __int128 v799;
  __int128 v800;
  uint64_t v801;

  v801 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 8) == 4)
  {
    v6 = 0;
    return v6 & 1;
  }
  v11 = a1;
  v767 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  v18 = *(_BYTE **)a2;
  v19 = *(_BYTE *)(a2 + 27);
  if ((v19 & 4) == 0 && (a6 & 1) == 0)
    v20 = 0;
  else
    v20 = 4;
  *(_BYTE *)(a2 + 27) = v20 | v19 & 0xFB;
  v21 = (v19 & 4) != 0 || (a6 & 1) != 0 || *(_BYTE *)(v11 + 19) != 0;
  v766 = v21;
  v22 = *(unsigned __int8 *)(a2 + 26) - 1;
  if (v22 > 2)
  {
    v759 = 0;
    v760 = 0;
    v775 = 0;
    v773 = 0;
    v757 = 0;
    v761 = 0;
  }
  else
  {
    v23 = (*(_BYTE *)(a2 + 26) - 1);
    v24 = (_QWORD *)(v11 - 16 * v22);
    v757 = off_1EA3F7058[v23];
    v761 = off_1EA3F7070[v23];
    v25 = (void *)v24[43];
    v775 = v24[35];
    v773 = v25;
    v759 = (_BYTE *)(v11 - v23 + 16);
    v760 = v24 + 59;
  }
  v26 = 0x1ED368000uLL;
  if (!gNRPacketLoggingEnabled)
    goto LABEL_13;
  v459 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
  v460 = v459;
  if (sNRCopyLogToStdErr)
  {

LABEL_484:
    v462 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v462, 1, (uint64_t)"%s%.30s:%-4d start LtN fast path outer loop", v463, v464, v465, v466, v467, (uint64_t)"");

    v26 = 0x1ED368000;
    goto LABEL_13;
  }
  v461 = os_log_type_enabled(v459, OS_LOG_TYPE_INFO);

  v26 = 0x1ED368000;
  if (v461)
    goto LABEL_484;
LABEL_13:
  next_slot = 0;
  v772 = 0;
  v27 = 0;
  v765 = 0;
  v762 = (_OWORD *)(v11 + 672);
  v763 = (_OWORD *)(v11 + 688);
  v769 = 0;
  v770 = (char *)&v785 + 8;
  v6 = 1;
  v776 = v11;
  v777 = a3;
  v778 = a4;
  while (1)
  {
    if (!*(_BYTE *)(v26 + 1513))
      goto LABEL_15;
    v102 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    v103 = v102;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v110 = os_log_type_enabled(v102, OS_LOG_TYPE_INFO);

      v26 = 0x1ED368000;
      if (!v110)
        goto LABEL_15;
    }
    v111 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v111, 1, (uint64_t)"%s%.30s:%-4d start LtN fast path inner loop", v112, v113, v114, v115, v116, (uint64_t)"");

    v26 = 0x1ED368000;
LABEL_15:
    if (a4 == 0 || (v6 & 1) == 0)
      goto LABEL_412;
    if (v27 && v27 >= a4)
    {
      v6 = 1;
LABEL_412:
      if (v27 < a4)
      {
        v403 = 0;
        if (*(_BYTE *)(v26 + 1513))
          goto LABEL_436;
        goto LABEL_440;
      }
      if (v27 != a4)
      {
        -[NRBluetoothPacketParser handleInternalError:](v11, CFSTR("curLinkInputSlotPartialBytesAlreadyRead != linkInputBufferLength (%zu != %zu)"), v12, v13, v14, v15, v16, v17, v27);
        goto LABEL_453;
      }
      if (*(_BYTE *)(v26 + 1513))
      {
        v639 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        v640 = v639;
        if (sNRCopyLogToStdErr)
        {

          v11 = v776;
          a4 = v778;
        }
        else
        {
          v696 = os_log_type_enabled(v639, OS_LOG_TYPE_INFO);

          v11 = v776;
          a4 = v778;
          v26 = 0x1ED368000;
          if (!v696)
            goto LABEL_418;
        }
        v697 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        _NRLogWithArgs((uint64_t)v697, 1, (uint64_t)"%s%.30s:%-4d read all of len=%zu alreadyRead=%zu nexusOutputAvailable=%d", v698, v699, v700, v701, v702, (uint64_t)"");

        v26 = 0x1ED368000;
      }
LABEL_418:
      ((void (*)(uint64_t))v757)(v11);
      v403 = 0;
      v27 = a4;
      if (*(_BYTE *)(v26 + 1513))
        goto LABEL_436;
      goto LABEL_440;
    }
    if (!v27 || !*(_BYTE *)(v26 + 1513))
    {
      if (!*(_BYTE *)(v26 + 1513))
        goto LABEL_21;
      goto LABEL_153;
    }
    v104 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    v105 = v104;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v124 = os_log_type_enabled(v104, OS_LOG_TYPE_INFO);

      if (!v124)
        goto LABEL_152;
    }
    v125 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v125, 1, (uint64_t)"%s%.30s:%-4d reusing existing len=%zu alreadyRead=%zu", v126, v127, v128, v129, v130, (uint64_t)"");

LABEL_152:
    v26 = 0x1ED368000uLL;
    if (!gNRPacketLoggingEnabled)
      goto LABEL_21;
LABEL_153:
    v131 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    v132 = v131;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v133 = os_log_type_enabled(v131, OS_LOG_TYPE_INFO);

      v26 = 0x1ED368000;
      if (!v133)
        goto LABEL_21;
    }
    v134 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v134, 1, (uint64_t)"%s%.30s:%-4d Reading from buf=%p len=%zu alreadyRead=%zu handled=%u filledIn=%u", v135, v136, v137, v138, v139, (uint64_t)"");

    v26 = 0x1ED368000;
LABEL_21:
    LODWORD(v28) = *(_DWORD *)(a2 + 16);
    v29 = *(unsigned int *)(a2 + 20);
    if (v28 <= v29)
      break;
    v30 = v18[v29];
    if (v18[v29])
    {
LABEL_40:
      v49 = v29 + 2;
      if (v28 > (int)v29 + 2)
      {
        v50 = bswap32(*(unsigned __int16 *)&v18[(v29 + 1)]);
        v51 = BYTE2(v50);
        v52 = HIBYTE(v50);
        if (!*(_BYTE *)(v26 + 1513))
        {
LABEL_42:
          v53 = 1;
          a4 = v778;
          goto LABEL_43;
        }
        LODWORD(v758) = BYTE2(v50);
        LODWORD(v764) = HIBYTE(v50);
        v117 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        v118 = v117;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v53 = 1;
          v156 = os_log_type_enabled(v117, OS_LOG_TYPE_INFO);

          if (!v156)
          {
            a4 = v778;
            goto LABEL_360;
          }
        }
        v157 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        StringFromNRTLVType = (__CFString *)createStringFromNRTLVType(v30);
        v53 = 1;
        _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o1 %@ len=%u handled=%u filledIn=%u", v159, v160, v161, v162, v163, (uint64_t)"");
        goto LABEL_358;
      }
      v61 = v29 + 1;
      if ((_DWORD)v28 != v49)
      {
        if ((_DWORD)v28 == v61)
          v67 = v27;
        else
          v67 = v27 + 1;
        if (v67 + 2 < a4)
        {
          v68 = bswap32(*(unsigned __int16 *)((char *)&a3->isa + v67));
          v51 = BYTE2(v68);
          v52 = HIBYTE(v68);
          if (!*(_BYTE *)(v26 + 1513))
            goto LABEL_42;
          LODWORD(v758) = BYTE2(v68);
          LODWORD(v764) = HIBYTE(v68);
          v69 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          v70 = v69;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v53 = 1;
            v303 = os_log_type_enabled(v69, OS_LOG_TYPE_INFO);

            if (!v303)
              goto LABEL_382;
          }
          v11 = v776;
          v157 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          StringFromNRTLVType = (__CFString *)createStringFromNRTLVType(v30);
          a4 = v778;
          v53 = 1;
          _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o4 %@ len=%u handled=%u filledIn=%u slotLen=%zu", v304, v305, v306, v307, v308, (uint64_t)"");
LABEL_359:

          goto LABEL_360;
        }
        if (!*(_BYTE *)(v26 + 1513))
        {
          v53 = 0;
          v51 = 0;
          v52 = 0;
          goto LABEL_43;
        }
        v184 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        v185 = v184;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v53 = os_log_type_enabled(v184, OS_LOG_TYPE_INFO);

          if (!v53)
          {
            LODWORD(v764) = 0;
            goto LABEL_381;
          }
        }
        v11 = v776;
        v157 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        StringFromNRTLVType = (__CFString *)createStringFromNRTLVType(v30);
        _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o5 %@", v320, v321, v322, v323, v324, (uint64_t)"");
        LODWORD(v764) = 0;
        goto LABEL_357;
      }
      v52 = v18[v61];
      if (a4 <= v27)
      {
        if (!*(_BYTE *)(v26 + 1513))
        {
          v53 = 0;
          v51 = 0;
          goto LABEL_43;
        }
        LODWORD(v764) = v18[v61];
        v182 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        v183 = v182;
        if (sNRCopyLogToStdErr)
        {

LABEL_354:
          v11 = v776;
          v157 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          StringFromNRTLVType = (__CFString *)createStringFromNRTLVType(v30);
          _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o3 %@", v315, v316, v317, v318, v319, (uint64_t)"");
LABEL_357:
          LODWORD(v758) = 0;
          v53 = 0;
LABEL_358:
          a4 = v778;
          goto LABEL_359;
        }
        v53 = os_log_type_enabled(v182, OS_LOG_TYPE_INFO);

        if (v53)
          goto LABEL_354;
LABEL_381:
        LODWORD(v758) = 0;
        goto LABEL_382;
      }
      v51 = *((unsigned __int8 *)&a3->isa + v27);
      if (!*(_BYTE *)(v26 + 1513))
      {
        v53 = 1;
        goto LABEL_43;
      }
      LODWORD(v758) = *((unsigned __int8 *)&a3->isa + v27);
      LODWORD(v764) = v52;
      v180 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      v181 = v180;
      if (sNRCopyLogToStdErr)
      {

LABEL_352:
        v11 = v776;
        v157 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        StringFromNRTLVType = (__CFString *)createStringFromNRTLVType(v30);
        a4 = v778;
        v53 = 1;
        _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o2 %@ len=%u handled=%u filledIn=%u slotLen=%zu alreadyRead=%zu", v310, v311, v312, v313, v314, (uint64_t)"");
        goto LABEL_359;
      }
      v53 = 1;
      v309 = os_log_type_enabled(v180, OS_LOG_TYPE_INFO);

      if (v309)
        goto LABEL_352;
LABEL_382:
      v11 = v776;
      a4 = v778;
LABEL_360:
      if (gNRPacketLoggingEnabled)
      {
        v325 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        v326 = v325;
        if (sNRCopyLogToStdErr)
        {

LABEL_364:
          v328 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          v329 = (__CFString *)createStringFromNRTLVType(v30);
          v330 = v758;
          _NRLogWithArgs((uint64_t)v328, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV %@ len=%u%s", v331, v332, v333, v334, v335, (uint64_t)"");

          v51 = v330;
          v52 = v764;
          v26 = 0x1ED368000;
          goto LABEL_43;
        }
        v327 = os_log_type_enabled(v325, OS_LOG_TYPE_INFO);

        if (v327)
          goto LABEL_364;
      }
      v26 = 0x1ED368000;
      v52 = v764;
      v51 = v758;
LABEL_43:
      v799 = 0u;
      v800 = 0u;
      v797 = 0u;
      v798 = 0u;
      v795 = 0u;
      v796 = 0u;
      v793 = 0u;
      v794 = 0u;
      v791 = 0u;
      v792 = 0u;
      v789 = 0u;
      v790 = 0u;
      v787 = 0u;
      v788 = 0u;
      v785 = 0u;
      v786 = 0u;
      v54 = *(unsigned int *)(a2 + 16);
      v55 = (uint64_t *)*(unsigned int *)(a2 + 20);
      if (v54 <= v55)
      {
        v58 = 0;
        v57 = 0;
        v59 = a4 - v27;
        if (a4 <= v27)
          goto LABEL_50;
        goto LABEL_57;
      }
      *(_QWORD *)&v785 = (char *)v55 + (_QWORD)v18;
      v56 = v51 | (v52 << 8);
      if (v56 + 5 >= (unint64_t)(v54 - (_DWORD)v55))
        v57 = v54 - (_DWORD)v55;
      else
        v57 = v56 + 5;
      if (!v57)
      {
        -[NRBluetoothPacketParser handleInternalError:](v776, CFSTR("lrbIOVecLen=0 tlvLen=%u filledInLinkReadBufferBytes=%u handledLinkReadBufferBytes=%u"), v12, v13, v14, v15, v16, v17, v51 | (v52 << 8));
        goto LABEL_424;
      }
      DWORD2(v785) = v57;
      if (!*(_BYTE *)(v26 + 1513))
      {
        v58 = 1;
        v59 = a4 - v27;
        if (a4 <= v27)
          goto LABEL_50;
        goto LABEL_57;
      }
      LODWORD(v758) = v51;
      LODWORD(v764) = v52;
      PacketString = v55;
      v756 = v54;
      v119 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
      v120 = v119;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v58 = 1;
        LODWORD(v771) = os_log_type_enabled(v119, OS_LOG_TYPE_INFO);

        if (!(_DWORD)v771)
          goto LABEL_167;
      }
      v58 = 1;
      v164 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
      _NRLogWithArgs((uint64_t)v164, 1, (uint64_t)"%s%.30s:%-4d Placing linkReadBuffer handled=%u filledIn=%u in ioVec[%u] buf=%p len=%u", v165, v166, v167, v168, v169, (uint64_t)"");

LABEL_167:
      v54 = v756;
      v55 = PacketString;
      v52 = v764;
      v51 = v758;
      v59 = a4 - v27;
      if (a4 <= v27)
      {
LABEL_50:
        if (!v53)
        {
          LODWORD(v60) = v58;
          v26 = 0x1ED368000;
          goto LABEL_115;
        }
        goto LABEL_66;
      }
LABEL_57:
      if (v53 && (v51 | ((unint64_t)v52 << 8)) + 5 <= v57)
      {
LABEL_66:
        v66 = 0;
        v60 = v58;
LABEL_99:
        v26 = 0x1ED368000uLL;
LABEL_100:
        v80 = v30 - 100;
        if ((v30 - 100) >= 6 && (v30 - 2) >= 4)
        {
          if ((_DWORD)v30 != 1)
          {
            v82 = v51 | (v52 << 8);
            goto LABEL_104;
          }
          v81 = 255;
        }
        else
        {
          v81 = 2000;
        }
        v82 = v51 | (v52 << 8);
        if (v82 > v81)
        {
          v755 = v51 | (v52 << 8);
          v404 = v60;
          if (*(_BYTE *)(a2 + 26) != 3)
          {
            v409 = (__CFString *)createStringFromNRTLVType(v30);
            IOVecStringWithContents = createIOVecStringWithContents((uint64_t)&v785, v404);
            -[NRBluetoothPacketParser handleInternalError:](v776, CFSTR("Received invalid TLV len %u for %@ (max=%u) %@"), v411, v412, v413, v414, v415, v416, v755);
            goto LABEL_570;
          }
          v11 = v776;
          v405 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v406 = v405;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            LODWORD(v777) = os_log_type_enabled(v405, OS_LOG_TYPE_INFO);

            if (!(_DWORD)v777)
              goto LABEL_434;
          }
          v425 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          v777 = createStringFromNRTLVType(v30);
          v745 = createIOVecStringWithContents((uint64_t)&v785, v404);
          v431 = (void *)v777;
          _NRLogWithArgs((uint64_t)v425, 1, (uint64_t)"%s%.30s:%-4d Received invalid TLV len %u for %@ (max=%u) %@", v432, v433, v434, v435, v436, (uint64_t)"");

LABEL_433:
LABEL_434:
          v403 = 1;
          v6 = 1;
          goto LABEL_435;
        }
LABEL_104:
        if ((unint64_t)v82 + 5 > v57)
          goto LABEL_115;
        v83 = *(unsigned __int8 *)(v26 + 1513);
        v758 = v82;
        LODWORD(v764) = v30 - 100;
        LODWORD(v771) = v60;
        PacketString = v55;
        v755 = v82;
        if (v83)
        {
          v756 = v54;
          v122 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v123 = v122;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v186 = os_log_type_enabled(v122, OS_LOG_TYPE_INFO);

            if (!v186)
              goto LABEL_183;
          }
          v754 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v187 = (__CFString *)createStringFromNRTLVType(v30);
          IOVecString = createIOVecString((uint64_t)&v785, v771);
          _NRLogWithArgs(v754, 1, (uint64_t)"%s%.30s:%-4d Ready to handle %@ len %u in %@ ioVecContentLen=%u alreadyRead=%zu", v188, v189, v190, v191, v192, (uint64_t)"");

LABEL_183:
          v83 = gNRPacketLoggingEnabled;
          v60 = v771;
          LODWORD(v82) = v755;
          v54 = v756;
          LODWORD(v55) = (_DWORD)PacketString;
          v80 = v764;
          if (v66)
            goto LABEL_107;
          goto LABEL_184;
        }
        if (v66)
        {
LABEL_107:
          if (!v83)
            goto LABEL_185;
          v84 = (int)v55;
          v756 = v54;
          v85 = v60;
          v86 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v87 = v86;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            LODWORD(v754) = os_log_type_enabled(v86, OS_LOG_TYPE_INFO);

            v60 = v85;
            LODWORD(v82) = v755;
            v54 = v756;
            LODWORD(v55) = v84;
            v80 = v764;
            if (!(_DWORD)v754)
              goto LABEL_185;
          }
          v270 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          _NRLogWithArgs((uint64_t)v270, 1, (uint64_t)"%s%.30s:%-4d Marking as completed", v271, v272, v273, v274, v275, (uint64_t)"");
          goto LABEL_341;
        }
LABEL_184:
        if (!v83)
          goto LABEL_185;
        v84 = (int)v55;
        v756 = v54;
        v85 = v60;
        v248 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        v249 = v248;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          LODWORD(v754) = os_log_type_enabled(v248, OS_LOG_TYPE_INFO);

          v60 = v85;
          LODWORD(v82) = v755;
          v54 = v756;
          LODWORD(v55) = v84;
          v80 = v764;
          if (!(_DWORD)v754)
            goto LABEL_185;
        }
        v270 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        _NRLogWithArgs((uint64_t)v270, 1, (uint64_t)"%s%.30s:%-4d Not marking as completed (all in linkReadBuffer)", v276, v277, v278, v279, v280, (uint64_t)"");
LABEL_341:

        v60 = v85;
        LODWORD(v82) = v755;
        v54 = v756;
        LODWORD(v55) = v84;
        v80 = v764;
LABEL_185:
        if ((char)v30 < 100)
        {
          v756 = v54;
          if (!(_DWORD)v60)
          {
            v477 = nrCopyLogObj_506();
            v478 = v477;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v479 = os_log_type_enabled(v477, OS_LOG_TYPE_ERROR);

              if (!v479)
              {
LABEL_513:
                _os_log_pack_size();
                MEMORY[0x1E0C80A78]();
                __error();
                v510 = _os_log_pack_fill();
                *(_DWORD *)v510 = 136446210;
                v511 = "nrChecksumIOVecInner";
                goto LABEL_587;
              }
            }
            v512 = nrCopyLogObj_506();
            _NRLogWithArgs((uint64_t)v512, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v513, v514, v515, v516, v517, (uint64_t)"");

            goto LABEL_513;
          }
          v754 = (uint64_t)&v751;
          v196 = v82 + 3;
          v197 = DWORD2(v785);
          if (DWORD2(v785) >= (v82 + 3))
            v198 = v196;
          else
            v198 = DWORD2(v785);
          if (!(_DWORD)v198)
          {
LABEL_487:
            v470 = nrCopyLogObj_506();
            v471 = v470;
            v472 = "nrChecksumUpdate";
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v473 = os_log_type_enabled(v470, OS_LOG_TYPE_ERROR);

              if (!v473)
                goto LABEL_519;
            }
            v489 = nrCopyLogObj_506();
            _NRLogWithArgs((uint64_t)v489, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen > 0", v490, v491, v492, v493, v494, (uint64_t)"");

            goto LABEL_519;
          }
          v12 = MEMORY[0x1DF0BA514](v785, v198, 0);
          if (v196 <= v197 && v198 < DWORD2(v785))
          {
            v199 = 0;
            v200 = v198;
            goto LABEL_197;
          }
          if ((_DWORD)v771 == 1)
          {
            v200 = v198;
            a4 = v778;
          }
          else
          {
            if (v196 <= v197)
            {
              v200 = 0;
              v199 = 1;
LABEL_197:
              a4 = v778;
              if ((_DWORD)v198 != v196)
                goto LABEL_499;
              goto LABEL_208;
            }
            if (DWORD2(v786) >= v196 - v198)
              v211 = v196 - v198;
            else
              v211 = DWORD2(v786);
            a4 = v778;
            if (!(_DWORD)v211)
              goto LABEL_487;
            v753 = &v751;
            if ((v198 & 1) != 0)
            {
              LOWORD(v779) = 0;
              v752 = v786;
              LOWORD(v779) = *(unsigned __int8 *)v786 << 8;
              v12 = MEMORY[0x1DF0BA514](&v779, 2, v12);
              if (v211 >= 2)
                v12 = MEMORY[0x1DF0BA514](v752 + 1, (v211 - 1), v12);
              a4 = v778;
            }
            else
            {
              v12 = MEMORY[0x1DF0BA514](v786, v211, v12);
            }
            LODWORD(v198) = v211 + v198;
            v200 = v211;
            if (v198 >= v196 && v211 < DWORD2(v786))
            {
              v199 = 1;
              if ((_DWORD)v198 != v196)
              {
LABEL_499:
                v486 = nrCopyLogObj_506();
                v487 = v486;
                v472 = "nrChecksumIOVecInner";
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v488 = os_log_type_enabled(v486, OS_LOG_TYPE_ERROR);

                  if (!v488)
                  {
LABEL_519:
                    _os_log_pack_size();
                    MEMORY[0x1E0C80A78]();
                    __error();
                    v533 = _os_log_pack_fill();
                    *(_DWORD *)v533 = 136446210;
                    *(_QWORD *)(v533 + 4) = v472;
                    goto LABEL_595;
                  }
                }
                v527 = nrCopyLogObj_506();
                _NRLogWithArgs((uint64_t)v527, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: computedBytes == writtenLength", v528, v529, v530, v531, v532, (uint64_t)"");

                goto LABEL_519;
              }
LABEL_208:
              v204 = ~(_BYTE)v12;
              v205 = ((unsigned __int16)~(_WORD)v12 >> 8);
              v206 = &v785 + v199;
              v207 = *((_DWORD *)v206 + 2);
              if (v207 >= v200 + 2)
              {
                v208 = (unsigned __int8 *)(*(_QWORD *)v206 + v200);
                v60 = v771;
                LODWORD(v54) = v756;
                LODWORD(v55) = (_DWORD)PacketString;
                v80 = v764;
                if (*v208 != v204 || v208[1] != v205)
                {
                  v777 = (const __CFString *)~(_DWORD)v12;
                  v539 = nrCopyLogObj_506();
                  if (sNRCopyLogToStdErr)
                  {

                    goto LABEL_560;
                  }
                  v597 = v539;
                  LODWORD(next_slot) = os_log_type_enabled(v539, OS_LOG_TYPE_ERROR);

                  if ((_DWORD)next_slot)
                  {
LABEL_560:
                    v598 = nrCopyLogObj_506();
                    v604 = "%s%.30s:%-4d checksum failed same IOVec received 0x%02x%02x != computed 0x%02x%02x";
                    goto LABEL_563;
                  }
                  goto LABEL_564;
                }
              }
              else
              {
                LODWORD(v54) = v756;
                LODWORD(v55) = (_DWORD)PacketString;
                v80 = v764;
                if (v207 < v200 + 1)
                {
                  v534 = v199;
                  v535 = v200;
                  v536 = nrCopyLogObj_506();
                  v537 = v536;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v538 = os_log_type_enabled(v536, OS_LOG_TYPE_ERROR);

                    if (!v538)
                      goto LABEL_554;
                  }
                  v569 = nrCopyLogObj_506();
                  v740 = createIOVecString((uint64_t)&v785, v771);
                  _NRLogWithArgs((uint64_t)v569, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex].len >= bytesToCheckThisIOVec + 1; %@, iovecIndex=%u bytesToCheckThisIOVec=%u",
                    v570,
                    v571,
                    v572,
                    v573,
                    v574,
                    (uint64_t)"");

LABEL_554:
                  _os_log_pack_size();
                  MEMORY[0x1E0C80A78]();
                  __error();
                  v587 = _os_log_pack_fill();
                  v588 = createIOVecString((uint64_t)&v785, v771);
                  __os_log_helper_1_2_4_8_34_8_64_4_0_4_0(v587, (uint64_t)"nrChecksumIOVecInner", (uint64_t)v588, v534, v535);
                  goto LABEL_555;
                }
                v60 = v771;
                if (v199 + 1 >= v771)
                {
                  v534 = v199;
                  v535 = v200;
                  v540 = nrCopyLogObj_506();
                  v541 = v540;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v542 = os_log_type_enabled(v540, OS_LOG_TYPE_ERROR);

                    if (!v542)
                      goto LABEL_554;
                  }
                  v575 = nrCopyLogObj_506();
                  v741 = createIOVecString((uint64_t)&v785, v771);
                  _NRLogWithArgs((uint64_t)v575, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecIndex + 1 < numIOVecs; %@, iovecIndex=%u byte"
                             "sToCheckThisIOVec=%u",
                    v576,
                    v577,
                    v578,
                    v579,
                    v580,
                    (uint64_t)"");

                  goto LABEL_554;
                }
                if (!DWORD2(v786))
                {
                  v534 = v199;
                  v535 = v200;
                  v543 = nrCopyLogObj_506();
                  v544 = v543;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v545 = os_log_type_enabled(v543, OS_LOG_TYPE_ERROR);

                    if (!v545)
                      goto LABEL_554;
                  }
                  v581 = nrCopyLogObj_506();
                  v742 = createIOVecString((uint64_t)&v785, v771);
                  _NRLogWithArgs((uint64_t)v581, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex + 1].len >= 1; %@, iovecIndex=%u"
                             " bytesToCheckThisIOVec=%u",
                    v582,
                    v583,
                    v584,
                    v585,
                    v586,
                    (uint64_t)"");

                  goto LABEL_554;
                }
                if (*(unsigned __int8 *)(*(_QWORD *)v206 + v200) != v204 || *(unsigned __int8 *)v786 != v205)
                {
                  v777 = (const __CFString *)~(_DWORD)v12;
                  v546 = nrCopyLogObj_506();
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v605 = v546;
                    LODWORD(next_slot) = os_log_type_enabled(v546, OS_LOG_TYPE_ERROR);

                    if (!(_DWORD)next_slot)
                      goto LABEL_564;
                  }
                  v598 = nrCopyLogObj_506();
                  v604 = "%s%.30s:%-4d checksum failed disjoint IOVec received 0x%02x%02x != computed 0x%02x%02x";
LABEL_563:
                  v606 = v598;
                  _NRLogWithArgs((uint64_t)v598, 16, (uint64_t)v604, v599, v600, v601, v602, v603, (uint64_t)"");

LABEL_564:
                  a4 = v778;
                  LODWORD(v60) = (_DWORD)v771;
LABEL_565:
                  v607 = v60;
                  v409 = CFSTR("Invalid");
                  switch(*(_BYTE *)(a2 + 26))
                  {
                    case 0:
                      goto LABEL_569;
                    case 1:
                      v409 = CFSTR("Medium");
                      goto LABEL_569;
                    case 2:
                      v409 = CFSTR("High");
                      goto LABEL_569;
                    case 3:
                      v614 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                      v615 = v614;
                      if (sNRCopyLogToStdErr)
                      {

                      }
                      else
                      {
                        v616 = os_log_type_enabled(v614, OS_LOG_TYPE_INFO);

                        if (!v616)
                        {
                          v11 = v776;
                          goto LABEL_434;
                        }
                      }
                      v617 = v776;
                      v425 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                      v11 = v617;
                      _NRLogWithArgs((uint64_t)v425, 1, (uint64_t)"%s%.30s:%-4d Invalid checksum detected in Isoch loop len %u filledIn=%u handled=%u ioVecContentLen=%u alreadyRead=%zu ", v618, v619, v620, v621, v622, (uint64_t)"");
                      goto LABEL_433;
                    default:
                      v409 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%d)"), *(unsigned __int8 *)(a2 + 26));
LABEL_569:
                      IOVecStringWithContents = (void *)createStringFromNRTLVType(v30);
                      v743 = createIOVecString((uint64_t)&v785, v607);
                      -[NRBluetoothPacketParser handleInternalError:](v776, CFSTR("Invalid checksum detected in loop (%@) on read type %@ len %u filledIn=%u handled=%u in %@ ioVecContentLen=%u alreadyRead=%zu "), v608, v609, v610, v611, v612, v613, (uint64_t)v409);

                      goto LABEL_570;
                  }
                }
              }
              goto LABEL_240;
            }
          }
          v199 = v771;
          if ((_DWORD)v198 != v196)
            goto LABEL_499;
          goto LABEL_208;
        }
        LOWORD(v779) = 0;
        if (!(_DWORD)v60)
        {
          v474 = nrCopyLogObj_506();
          v475 = v474;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v476 = os_log_type_enabled(v474, OS_LOG_TYPE_ERROR);

            if (!v476)
              goto LABEL_510;
          }
          v504 = nrCopyLogObj_506();
          _NRLogWithArgs((uint64_t)v504, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v505, v506, v507, v508, v509, (uint64_t)"");

LABEL_510:
          _os_log_pack_size();
          MEMORY[0x1E0C80A78]();
          __error();
          v510 = _os_log_pack_fill();
          *(_DWORD *)v510 = 136446210;
          v511 = "nrWriteIOVecToBuffer";
LABEL_587:
          *(_QWORD *)(v510 + 4) = v511;
          goto LABEL_595;
        }
        v193 = v82 + 3;
        v194 = v82 + 3 - DWORD2(v785);
        if ((v82 + 3) > DWORD2(v785))
        {
          v195 = 0;
LABEL_219:
          if ((_DWORD)v60 != 1 && (!v194 || DWORD2(v786) > v194))
          {
            if (DWORD2(v786) - v194 >= 2 - (int)v195)
              v209 = (2 - v195);
            else
              v209 = DWORD2(v786) - v194;
            v756 = v54;
            v754 = v195;
            v210 = v193;
            memcpy((char *)&v779 + v195, (const void *)(v786 + v194), v209);
            v193 = v210;
            v80 = v764;
            LODWORD(v55) = (_DWORD)PacketString;
            LODWORD(v54) = v756;
            v60 = v771;
            LODWORD(v195) = v209 + v754;
          }
          goto LABEL_238;
        }
        if (v193 >= DWORD2(v785))
        {
          v195 = 0;
          v194 = 0;
          goto LABEL_219;
        }
        v756 = v54;
        v201 = DWORD2(v785) - v193;
        if (DWORD2(v785) - v193 >= 2)
          v202 = 2;
        else
          v202 = v201;
        v754 = (v82 + 3);
        v203 = v202;
        memcpy(&v779, (const void *)(v785 + v193), v202);
        if (v201 <= 1)
        {
          v194 = 0;
          v60 = v771;
          v54 = v756;
          LODWORD(v55) = (_DWORD)PacketString;
          v80 = v764;
          v193 = v754;
          v195 = v203;
          goto LABEL_219;
        }
        v60 = v771;
        LODWORD(v54) = v756;
        LODWORD(v55) = (_DWORD)PacketString;
        v80 = v764;
        v193 = v754;
        LODWORD(v195) = v203;
LABEL_238:
        if ((_DWORD)v195 != 2)
        {
          v480 = v195;
          v481 = v193;
          v482 = v60;
          v483 = nrCopyLogObj_506();
          v484 = v483;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v485 = os_log_type_enabled(v483, OS_LOG_TYPE_ERROR);

            if (!v485)
            {
LABEL_516:
              _os_log_pack_size();
              MEMORY[0x1E0C80A78]();
              __error();
              v524 = _os_log_pack_fill();
              v525 = createIOVecString((uint64_t)&v785, v482);
              __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v524, (uint64_t)"nrWriteIOVecToBuffer", v480, 2, v481, (uint64_t)v525);

              v526 = nrCopyLogObj_506();
              _NRLogAbortWithPack(v526);
            }
          }
          v518 = nrCopyLogObj_506();
          v746 = createIOVecString((uint64_t)&v785, v482);
          _NRLogWithArgs((uint64_t)v518, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%u), "
                     "offset: %u, ioVec: %@",
            v519,
            v520,
            v521,
            v522,
            v523,
            (uint64_t)"");

          goto LABEL_516;
        }
        v212 = bswap32(v758);
        if ((unsigned __int16)v779 != (unsigned __int16)(((v30 >> 4) ^ BYTE2(v212)) | (unsigned __int16)(((unsigned __int16)(16 * v30) ^ HIBYTE(v212)) << 8)))
          goto LABEL_565;
LABEL_240:
        v781 = 0u;
        v782 = 0u;
        v779 = 0u;
        v780 = 0u;
        v11 = v776;
        v26 = 0x1ED368000uLL;
        a3 = v777;
        if (!v775)
          goto LABEL_244;
        v213 = v54;
        next_slot = os_channel_get_next_slot();
        if (next_slot)
        {
          if (gNRPacketLoggingEnabled)
          {
            v250 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
            v251 = v250;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v336 = os_log_type_enabled(v250, OS_LOG_TYPE_INFO);

              if (!v336)
              {
                v11 = v776;
                goto LABEL_368;
              }
            }
            v11 = v776;
            v337 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            _NRLogWithArgs((uint64_t)v337, 1, (uint64_t)"%s%.30s:%-4d Using new nexusOutputSlot=%p", v338, v339, v340, v341, v342, (uint64_t)"");

LABEL_368:
            a3 = v777;
            a4 = v778;
            v26 = 0x1ED368000;
          }
          v60 = v771;
          LODWORD(v54) = v213;
          LODWORD(v55) = (_DWORD)PacketString;
          v80 = v764;
LABEL_244:
          if (v54 > v55)
          {
            if (!*(_BYTE *)(v26 + 1513))
            {
LABEL_246:
              *(_DWORD *)(a2 + 20) += DWORD2(v785);
              goto LABEL_247;
            }
            v252 = v60;
            v253 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
            v254 = v253;
            if (sNRCopyLogToStdErr)
            {

              v11 = v776;
              a3 = v777;
              a4 = v778;
            }
            else
            {
              LODWORD(PacketString) = os_log_type_enabled(v253, OS_LOG_TYPE_INFO);

              v11 = v776;
              a3 = v777;
              a4 = v778;
              v26 = 0x1ED368000;
              v60 = v252;
              v80 = v764;
              if (!(_DWORD)PacketString)
                goto LABEL_246;
            }
            v343 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
            _NRLogWithArgs((uint64_t)v343, 1, (uint64_t)"%s%.30s:%-4d Advancing linkReadBuffer handled by %u handled=%u filledIn=%u", v344, v345, v346, v347, v348, (uint64_t)"");

            v80 = v764;
            v60 = v252;
            v26 = 0x1ED368000;
            goto LABEL_246;
          }
LABEL_247:
          if ((int)v30 > 99)
          {
            if (v80 >= 6)
              goto LABEL_317;
            goto LABEL_257;
          }
          if ((v30 - 2) < 2)
          {
LABEL_257:
            if (next_slot)
            {
              v220 = v780;
              v771 = (os_log_t)WORD1(v779);
              v221 = nrTLVToPacket((uint64_t)&v785, v60, (_OWORD *)v30, v758, v780, WORD1(v779), v763, v762);
              v222 = *(unsigned __int8 *)(v26 + 1513);
              if ((_DWORD)v221)
              {
                v223 = v221;
                if (!v222)
                {
LABEL_260:
                  v783 = 0;
                  v784 = 0;
                  if (v766)
                  {
                    LOBYTE(v783) = 1;
                    WORD1(v779) = v223;
                    if (os_channel_slot_get_packet())
                      os_packet_set_flow_uuid();
                    os_channel_set_slot_properties();
                    if (isPacketValidIPv6((_BYTE *)v220, v223) && isNextHeaderValidESP(v220, v223))
                      v224 = bswap32(*(_DWORD *)(v220 + 44));
                    else
                      v224 = 0;
                    if (isPacketValidIPv6((_BYTE *)v220, v223) && isNextHeaderValidESP(v220, v223))
                      v240 = bswap32(*(_DWORD *)(v220 + 40));
                    else
                      v240 = 0;
                    -[NRBluetoothPacketParser handleIncomingWakePacket:spi:](v11, v224, v240);
                    v239 = (os_log_t)next_slot;
                  }
                  else
                  {
                    WORD1(v779) = v223;
                    v239 = (os_log_t)next_slot;
                    os_channel_slot_get_packet();
                    os_packet_clear_flow_uuid();
                    os_channel_set_slot_properties();
                  }
                  v766 = 0;
                  *(_BYTE *)(a2 + 27) &= ~4u;
                  *(_BYTE *)(v11 + 19) = 0;
                  ++*v760;
                  *v759 = 1;
                  ++v769;
                  v765 += v223;
                  v772 = v239;
LABEL_316:
                  v26 = 0x1ED368000uLL;
LABEL_317:
                  if (!*(_BYTE *)(v26 + 1513))
                    goto LABEL_318;
LABEL_400:
                  v395 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                  v396 = v395;
                  if (sNRCopyLogToStdErr)
                  {

LABEL_403:
                    v11 = v776;
                    v360 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                    a4 = v778;
                    v6 = 1;
                    _NRLogWithArgs((uint64_t)v360, 1, (uint64_t)"%s%.30s:%-4d end of LtN inner loop alreadyRead=%zu splen=%zu", v398, v399, v400, v401, v402, (uint64_t)"");
LABEL_404:

                    goto LABEL_405;
                  }
                  v6 = 1;
                  v397 = os_log_type_enabled(v395, OS_LOG_TYPE_INFO);

                  if (v397)
                    goto LABEL_403;
                  goto LABEL_406;
                }
                v266 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                v267 = v266;
                if (sNRCopyLogToStdErr)
                {

                  v11 = v776;
                  a3 = v777;
                  a4 = v778;
                }
                else
                {
                  LODWORD(v772) = os_log_type_enabled(v266, OS_LOG_TYPE_INFO);

                  v11 = v776;
                  a3 = v777;
                  a4 = v778;
                  if (!(_DWORD)v772)
                    goto LABEL_260;
                }
                v772 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                v764 = (__CFString *)createStringFromNRTLVType(v30);
                PacketString = (uint64_t *)createPacketString((unsigned __int8 *)v220, v223);
                v366 = v772;
                _NRLogWithArgs((uint64_t)v772, 1, (uint64_t)"%s%.30s:%-4d Reinjecting %@ packet len %u to nexusOutputSlot=%p buf=%p len=%u: %@, buflet: %d", v367, v368, v369, v370, v371, (uint64_t)"");

                goto LABEL_260;
              }
              if (*(_BYTE *)(v26 + 1513))
              {
                v349 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                v350 = v349;
                if (sNRCopyLogToStdErr)
                {

LABEL_393:
                  v11 = v776;
                  v373 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                  v374 = (__CFString *)createStringFromNRTLVType(v30);
                  _NRLogWithArgs((uint64_t)v373, 1, (uint64_t)"%s%.30s:%-4d failed to reinject %@ tlvLen=%u slotLen=%u", v383, v384, v385, v386, v387, (uint64_t)"");
LABEL_394:

                  goto LABEL_399;
                }
                v382 = os_log_type_enabled(v349, OS_LOG_TYPE_INFO);

                if (v382)
                  goto LABEL_393;
                goto LABEL_398;
              }
              v6 = 1;
            }
            else
            {
              if (*(_BYTE *)(v26 + 1513))
              {
                v268 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                v269 = v268;
                if (sNRCopyLogToStdErr)
                {

LABEL_384:
                  v11 = v776;
                  v373 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                  v374 = (__CFString *)createStringFromNRTLVType(v30);
                  _NRLogWithArgs((uint64_t)v373, 1, (uint64_t)"%s%.30s:%-4d no curNexusOutputSlot, dropping %@ tlvLen=%u slotLen=%u", v375, v376, v377, v378, v379, (uint64_t)"");
                  goto LABEL_394;
                }
                v372 = os_log_type_enabled(v268, OS_LOG_TYPE_INFO);

                if (v372)
                  goto LABEL_384;
                goto LABEL_398;
              }
              next_slot = 0;
              v6 = 1;
            }
          }
          else
          {
            if ((_DWORD)v30 != 1)
            {
              if ((_DWORD)v30 != 4)
                goto LABEL_317;
              if (!(_DWORD)v758)
              {
                v246 = objc_alloc_init(MEMORY[0x1E0C99D50]);
LABEL_313:
                v247 = v246;
                v11 = v776;
                -[NRBluetoothPacketParser handleIncomingIKEData:linkPriority:](v776, v246, *(unsigned __int8 *)(a2 + 26));
                a3 = v777;
                if (v766)
                  -[NRBluetoothPacketParser handleIncomingWakePacket:spi:](v11, 0, 0);
                *(_BYTE *)(v11 + 19) = 0;
                *(_BYTE *)(a2 + 27) &= ~4u;

                v766 = 0;
                goto LABEL_316;
              }
              v214 = (char *)malloc_type_malloc(v758, 0xA172743EuLL);
              if (v214)
              {
                v215 = v214;
                v216 = (int)v771;
                if (DWORD2(v785) > 2)
                {
                  v241 = DWORD2(v785) - 3;
                  v219 = v755;
                  if (DWORD2(v785) == 3)
                  {
                    LODWORD(v217) = 0;
                    v218 = 0;
                    a4 = v778;
                  }
                  else
                  {
                    if (v241 >= v755)
                      v217 = v755;
                    else
                      v217 = v241;
                    v242 = v755;
                    memcpy(v214, (const void *)(v785 + 3), v217);
                    v219 = v242;
                    if (v241 >= v242)
                    {
                      a4 = v778;
LABEL_311:
                      if ((_DWORD)v217 != v219)
                      {
                        v665 = v219;
                        v666 = nrCopyLogObj_506();
                        v667 = v666;
                        if (sNRCopyLogToStdErr)
                        {

                        }
                        else
                        {
                          v668 = os_log_type_enabled(v666, OS_LOG_TYPE_ERROR);

                          if (!v668)
                          {
LABEL_609:
                            _os_log_pack_size();
                            MEMORY[0x1E0C80A78]();
                            __error();
                            v689 = _os_log_pack_fill();
                            v588 = createIOVecString((uint64_t)&v785, v771);
                            __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v689, (uint64_t)"nrWriteIOVecToBuffer", v217, v665, 3, (uint64_t)v588);
LABEL_555:

                            v589 = nrCopyLogObj_506();
                            _NRLogAbortWithPack(v589);
                          }
                        }
                        v683 = nrCopyLogObj_506();
                        v747 = createIOVecString((uint64_t)&v785, v771);
                        _NRLogWithArgs((uint64_t)v683, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) !="
                                   " length (%u), offset: %u, ioVec: %@",
                          v684,
                          v685,
                          v686,
                          v687,
                          v688,
                          (uint64_t)"");

                        goto LABEL_609;
                      }
                      v245 = objc_alloc(MEMORY[0x1E0C99D50]);
                      v246 = (id)objc_msgSend(v245, "initWithBytesNoCopy:length:freeWhenDone:", v215, v758, 1);
                      goto LABEL_313;
                    }
                    v218 = 0;
                    a4 = v778;
                    v216 = (int)v771;
                  }
                }
                else
                {
                  LODWORD(v217) = 0;
                  v218 = 3 - DWORD2(v785);
                  v219 = v755;
                }
                if (v216 != 1 && (!v218 || DWORD2(v786) > v218))
                {
                  PacketString = &v751;
                  v243 = v219;
                  if (DWORD2(v786) - v218 >= v219 - (int)v217)
                    v244 = (v219 - v217);
                  else
                    v244 = DWORD2(v786) - v218;
                  memcpy(&v215[v217], (const void *)(v786 + v218), v244);
                  v219 = v243;
                  LODWORD(v217) = v244 + v217;
                }
                goto LABEL_311;
              }
              v662 = nrCopyLogObj_506();
              v663 = v662;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v664 = os_log_type_enabled(v662, OS_LOG_TYPE_ERROR);

                if (!v664)
                  goto LABEL_606;
              }
              v676 = nrCopyLogObj_506();
              _NRLogWithArgs((uint64_t)v676, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v677, v678, v679, v680, v681, (uint64_t)"");

LABEL_606:
              _os_log_pack_size();
              MEMORY[0x1E0C80A78]();
              __error();
              v682 = _os_log_pack_fill();
              *(_DWORD *)v682 = 136446466;
              *(_QWORD *)(v682 + 4) = "strict_malloc";
              *(_WORD *)(v682 + 12) = 2048;
              *(_QWORD *)(v682 + 14) = v758;
LABEL_595:
              v661 = nrCopyLogObj_506();
              _NRLogAbortWithPack(v661);
            }
            if (*(_BYTE *)(v26 + 1513))
            {
              v380 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
              v381 = v380;
              if (sNRCopyLogToStdErr)
              {

LABEL_397:
                v11 = v776;
                v389 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                _NRLogWithArgs((uint64_t)v389, 1, (uint64_t)"%s%.30s:%-4d Handling PadN %u", v390, v391, v392, v393, v394, (uint64_t)"");

                goto LABEL_399;
              }
              v388 = os_log_type_enabled(v380, OS_LOG_TYPE_INFO);

              if (v388)
                goto LABEL_397;
LABEL_398:
              v11 = v776;
LABEL_399:
              a3 = v777;
              a4 = v778;
              v26 = 0x1ED368000uLL;
              if (gNRPacketLoggingEnabled)
                goto LABEL_400;
LABEL_318:
              v6 = 1;
            }
            else
            {
              v6 = 1;
            }
          }
        }
        else
        {
          ((void (*)(uint64_t))v761)(v11);
          if (!gNRPacketLoggingEnabled)
            goto LABEL_267;
          v262 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v263 = v262;
          if (sNRCopyLogToStdErr)
          {

            a4 = v778;
          }
          else
          {
            v351 = os_log_type_enabled(v262, OS_LOG_TYPE_INFO);

            a4 = v778;
            v26 = 0x1ED368000;
            if (!v351)
              goto LABEL_267;
          }
          v352 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v353 = createIOVecString((uint64_t)&v785, v771);
          _NRLogWithArgs((uint64_t)v352, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot highestSlot=%p %@ filledIn=%u handled=%u", v354, v355, v356, v357, v358, (uint64_t)"");

          v26 = 0x1ED368000;
LABEL_267:
          if (v771 > (v213 > PacketString))
          {
            v225 = v213 > PacketString;
            v226 = v771;
            v227 = (const void **)&v770[16 * v225];
            do
            {
              if (!*(_BYTE *)(v26 + 1513))
                goto LABEL_270;
              v231 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              v232 = v231;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                LODWORD(next_slot) = os_log_type_enabled(v231, OS_LOG_TYPE_INFO);

                v26 = 0x1ED368000;
                if (!(_DWORD)next_slot)
                  goto LABEL_270;
              }
              v233 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              _NRLogWithArgs((uint64_t)v233, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot - consolidating %u bytes from linkInputSlot ioVecs[%u].buf=%p to linkReadBuffer filledIn=%u handled=%u", v234, v235, v236, v237, v238, (uint64_t)"");

              v26 = 0x1ED368000;
LABEL_270:
              v228 = *(unsigned int *)(a2 + 16);
              v229 = *(unsigned int *)v227;
              if ((v229 + v228) >= 0xFFFF)
              {
                if (*(_BYTE *)(v26 + 1513))
                {
                  v457 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                  v458 = v457;
                  if (sNRCopyLogToStdErr)
                  {

                    goto LABEL_624;
                  }
                  v721 = os_log_type_enabled(v457, OS_LOG_TYPE_INFO);

                  if (v721)
                  {
LABEL_624:
                    v409 = (__CFString *)_NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                    IOVecStringWithContents = createIOVecString((uint64_t)&v785, v771);
                    _NRLogWithArgs((uint64_t)v409, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot and linkReadBuffer is full %@ filledIn=%u handled=%u", v722, v723, v724, v725, v726, (uint64_t)"");
LABEL_570:

                    v6 = 0;
                    goto LABEL_467;
                  }
                }
LABEL_424:
                v6 = 0;
                goto LABEL_467;
              }
              memcpy(&v18[v228], *(v227 - 1), v229);
              v230 = *(_DWORD *)v227;
              v227 += 2;
              *(_DWORD *)(a2 + 16) += v230;
              ++v225;
            }
            while (v226 != v225);
          }
          if (v213 > PacketString && (_DWORD)v771 == 1)
          {
            v455 = v777;
            if (!*(_BYTE *)(v26 + 1513))
              goto LABEL_470;
            v703 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            v704 = v703;
            if (sNRCopyLogToStdErr)
            {

              v455 = v777;
              a4 = v778;
              goto LABEL_618;
            }
            v705 = os_log_type_enabled(v703, OS_LOG_TYPE_INFO);

            v455 = v777;
            a4 = v778;
            v26 = 0x1ED368000;
            if (v705)
            {
LABEL_618:
              v706 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              _NRLogWithArgs((uint64_t)v706, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot and everything in linkReadBuffer alreadyRead=%zu", v707, v708, v709, v710, v711, (uint64_t)"");

              v26 = 0x1ED368000;
            }
LABEL_470:
            v11 = v776;
            if (v27)
            {
              v456 = a4 - v27;
              if (a4 > v27)
              {
                if (!gNRPacketLoggingEnabled)
                  goto LABEL_473;
                v712 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                v713 = v712;
                if (sNRCopyLogToStdErr)
                {

                  v11 = v776;
                  v455 = v777;
                  a4 = v778;
                  goto LABEL_622;
                }
                v714 = os_log_type_enabled(v712, OS_LOG_TYPE_INFO);

                v11 = v776;
                v455 = v777;
                a4 = v778;
                if (v714)
                {
LABEL_622:
                  v715 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                  _NRLogWithArgs((uint64_t)v715, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot - tail consolidating %zu bytes from linkInputSlot to linkReadBuffer filledIn=%u handled=%u and marking as completed", v716, v717, v718, v719, v720, (uint64_t)"");

                }
LABEL_473:
                memcpy(&v18[*(unsigned int *)(a2 + 16)], (char *)v455 + v27, v456);
                *(_DWORD *)(a2 + 16) += v456;
                v27 = a4;
              }
              v26 = 0x1ED368000uLL;
            }
            v403 = 0;
            v6 = 0;
            if (*(_BYTE *)(v26 + 1513))
              goto LABEL_436;
            goto LABEL_440;
          }
          a3 = v777;
          if (*(_BYTE *)(v26 + 1513))
          {
            v264 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            v265 = v264;
            if (sNRCopyLogToStdErr)
            {

LABEL_377:
              v11 = v776;
              v360 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              _NRLogWithArgs((uint64_t)v360, 1, (uint64_t)"%s%.30s:%-4d Marking as completed (no nexusOutputSlot) alreadyRead=%zu", v361, v362, v363, v364, v365, (uint64_t)"");
              next_slot = 0;
              v6 = 0;
              a4 = v778;
              goto LABEL_404;
            }
            v359 = os_log_type_enabled(v264, OS_LOG_TYPE_INFO);

            if (v359)
              goto LABEL_377;
            next_slot = 0;
            v6 = 0;
LABEL_406:
            v11 = v776;
            a4 = v778;
LABEL_405:
            v26 = 0x1ED368000;
            a3 = v777;
          }
          else
          {
            next_slot = 0;
            v6 = 0;
            v11 = v776;
          }
        }
      }
      else
      {
        v62 = (unint64_t)(&v785 + v58);
        *(_QWORD *)v62 = (char *)v777 + v27;
        v63 = (_DWORD *)(v62 | 8);
        *(_DWORD *)(v62 + 8) = v59;
        if (!gNRPacketLoggingEnabled)
          goto LABEL_60;
        v755 = v62 | 8;
        v756 = v54;
        LODWORD(v758) = v51;
        LODWORD(v764) = v52;
        PacketString = v55;
        v121 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v771 = v121;
          LODWORD(v754) = os_log_type_enabled(v121, OS_LOG_TYPE_INFO);

          v63 = (_DWORD *)v755;
          v54 = v756;
          v55 = PacketString;
          v52 = v764;
          v51 = v758;
          if (!(_DWORD)v754)
            goto LABEL_60;
        }
        v170 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        _NRLogWithArgs((uint64_t)v170, 1, (uint64_t)"%s%.30s:%-4d Placing in ioVec[%u] buf=%p len=%u alreadyRead=%zu += %zu", v171, v172, v173, v174, v175, (uint64_t)"");

        v63 = (_DWORD *)v755;
        v54 = v756;
        v51 = v758;
        v52 = v764;
        v55 = PacketString;
LABEL_60:
        v57 += v59;
        v60 = (v58 + 1);
        v64 = v57 < 3 || v53;
        if ((v64 & 1) != 0)
        {
          v65 = gNRPacketLoggingEnabled;
          if (!v53)
          {
            v75 = 0;
            a4 = v778;
            goto LABEL_111;
          }
          a4 = v778;
        }
        else
        {
          if (DWORD2(v785) < 3)
          {
            if (DWORD2(v785) == 2)
            {
              a4 = v778;
              if (v54 <= v55)
              {
                v558 = nrCopyLogObj_506();
                v559 = v558;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v560 = os_log_type_enabled(v558, OS_LOG_TYPE_ERROR);

                  if (!v560)
                    goto LABEL_586;
                }
                v641 = nrCopyLogObj_506();
                _NRLogWithArgs((uint64_t)v641, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 1", v642, v643, v644, v645, v646, (uint64_t)"");

LABEL_586:
                _os_log_pack_size();
                MEMORY[0x1E0C80A78]();
                __error();
                v510 = _os_log_pack_fill();
                *(_DWORD *)v510 = 136446210;
                v511 = "nrReadTLVLenHBOFromIOVec";
                goto LABEL_587;
              }
              v71 = *(unsigned __int8 *)(v785 + 1);
              v72 = *(unsigned __int8 *)v786;
            }
            else
            {
              a4 = v778;
              if (DWORD2(v785) != 1)
              {
                v561 = v58 + 1;
                v562 = nrCopyLogObj_506();
                v563 = v562;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v564 = os_log_type_enabled(v562, OS_LOG_TYPE_ERROR);

                  if (!v564)
                    goto LABEL_590;
                }
                v647 = nrCopyLogObj_506();
                v748 = createIOVecString((uint64_t)&v785, v561);
                _NRLogWithArgs((uint64_t)v647, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: ioVecs[0].len == 1; %@",
                  v648,
                  v649,
                  v650,
                  v651,
                  v652,
                  (uint64_t)"");

LABEL_590:
                _os_log_pack_size();
                MEMORY[0x1E0C80A78]();
                __error();
                v653 = _os_log_pack_fill();
                v654 = createIOVecString((uint64_t)&v785, v561);
                *(_DWORD *)v653 = 136446466;
                *(_QWORD *)(v653 + 4) = "nrReadTLVLenHBOFromIOVec";
LABEL_594:
                *(_WORD *)(v653 + 12) = 2112;
                *(_QWORD *)(v653 + 14) = v654;
                goto LABEL_595;
              }
              if (DWORD2(v786) < 2)
              {
                v565 = v58 + 1;
                v727 = nrCopyLogObj_506();
                v728 = v727;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v729 = os_log_type_enabled(v727, OS_LOG_TYPE_ERROR);

                  if (!v729)
                  {
LABEL_593:
                    _os_log_pack_size();
                    MEMORY[0x1E0C80A78]();
                    __error();
                    v653 = _os_log_pack_fill();
                    v654 = createIOVecString((uint64_t)&v785, v565);
                    *(_DWORD *)v653 = 136446466;
                    *(_QWORD *)(v653 + 4) = "nrReadTLVLenHBOFromIOVec";
                    goto LABEL_594;
                  }
                }
                v730 = nrCopyLogObj_506();
                v750 = createIOVecString((uint64_t)&v785, v565);
                _NRLogWithArgs((uint64_t)v730, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 2; %@",
                  v731,
                  v732,
                  v733,
                  v734,
                  v735,
                  (uint64_t)"");

                goto LABEL_593;
              }
              if (v54 <= v55)
              {
                v565 = v58 + 1;
                v566 = nrCopyLogObj_506();
                v567 = v566;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v568 = os_log_type_enabled(v566, OS_LOG_TYPE_ERROR);

                  if (!v568)
                    goto LABEL_593;
                }
                v655 = nrCopyLogObj_506();
                v749 = createIOVecString((uint64_t)&v785, v565);
                _NRLogWithArgs((uint64_t)v655, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 1; %@",
                  v656,
                  v657,
                  v658,
                  v659,
                  v660,
                  (uint64_t)"");

                goto LABEL_593;
              }
              v71 = *(_WORD *)v786;
              v72 = HIBYTE(*(unsigned __int16 *)v786);
            }
          }
          else
          {
            v71 = *(_WORD *)(v785 + 1);
            v72 = HIBYTE(*(unsigned __int16 *)(v785 + 1));
            a4 = v778;
          }
          v76 = bswap32(v71 | (v72 << 8));
          v51 = BYTE2(v76);
          v52 = HIBYTE(v76);
          v65 = gNRPacketLoggingEnabled;
        }
        v77 = (v51 | ((unint64_t)v52 << 8)) + 5;
        if (v77 < v57)
        {
          v78 = v57 - v77;
          if (!v65)
            goto LABEL_96;
          v754 = v57 - v77;
          v755 = (unint64_t)v63;
          LODWORD(v758) = v51;
          LODWORD(v764) = v52;
          PacketString = v55;
          v756 = v54;
          LODWORD(v771) = v58 + 1;
          v176 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v177 = v176;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v288 = os_log_type_enabled(v176, OS_LOG_TYPE_INFO);

            v60 = v771;
            v63 = (_DWORD *)v755;
            v54 = v756;
            v55 = PacketString;
            v52 = v764;
            v51 = v758;
            v78 = v754;
            if (!v288)
              goto LABEL_96;
          }
          v289 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v738 = createIOVecString((uint64_t)&v785, v771);
          _NRLogWithArgs((uint64_t)v289, 1, (uint64_t)"%s%.30s:%-4d Shrinking ioVecs[%u] down by %u - %@ ioVecContentLen=%u alreadyRead=%zu", v290, v291, v292, v293, v294, (uint64_t)"");

          v78 = v754;
          v63 = (_DWORD *)v755;
          v51 = v758;
          v52 = v764;
          v55 = PacketString;
          v54 = v756;
          v60 = v771;
LABEL_96:
          v79 = *v63 == (_DWORD)v78;
          *v63 -= v78;
          if (v79)
          {
            v736 = createIOVecString((uint64_t)&v785, v60);
            -[NRBluetoothPacketParser handleInternalError:](v776, CFSTR("Shrunk ioVecs[%u] down by %u to 0 - %@ ioVecContentLen=%u alreadyRead=%zu"), v417, v418, v419, v420, v421, v422, v58);

            v6 = 0;
            goto LABEL_467;
          }
          v27 = a4 - v78;
          if (!gNRPacketLoggingEnabled)
          {
            v66 = 1;
            v57 = v77;
            goto LABEL_99;
          }
          v754 = v78;
          LODWORD(v758) = v51;
          LODWORD(v764) = v52;
          PacketString = v55;
          v756 = v54;
          LODWORD(v771) = v60;
          v178 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v179 = v178;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v66 = 1;
            v295 = os_log_type_enabled(v178, OS_LOG_TYPE_INFO);

            if (!v295)
            {
              v57 = v77;
              a4 = v778;
              v26 = 0x1ED368000;
              v60 = v771;
              goto LABEL_348;
            }
          }
          v755 = (unint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v296 = v771;
          v739 = createIOVecString((uint64_t)&v785, v771);
          v66 = 1;
          v297 = (void *)v755;
          _NRLogWithArgs(v755, 1, (uint64_t)"%s%.30s:%-4d Shrunk ioVecs[%u] down by %u - %@ ioVecContentLen=%u alreadyRead=%zu", v298, v299, v300, v301, v302, (uint64_t)"");

          v60 = v296;
          v57 = v77;
          a4 = v778;
          v26 = 0x1ED368000;
LABEL_348:
          v54 = v756;
          v55 = PacketString;
          v52 = v764;
          v51 = v758;
          goto LABEL_100;
        }
        v75 = 1;
LABEL_111:
        v26 = 0x1ED368000uLL;
        if (v65)
        {
          LODWORD(v758) = v51;
          v153 = v52;
          PacketString = v55;
          v756 = v54;
          LODWORD(v771) = v60;
          v154 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v155 = v154;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v255 = os_log_type_enabled(v154, OS_LOG_TYPE_INFO);

            v26 = 0x1ED368000;
            v60 = v771;
            v54 = v756;
            v55 = PacketString;
            v52 = v153;
            v51 = v758;
            if (!v255)
              goto LABEL_112;
          }
          v256 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v66 = 1;
          _NRLogWithArgs((uint64_t)v256, 1, (uint64_t)"%s%.30s:%-4d not shrinking len %u%s ioVecContentLen=%u alreadyRead=%zu", v257, v258, v259, v260, v261, (uint64_t)"");

          v51 = v758;
          v52 = v153;
          v55 = PacketString;
          v54 = v756;
          v60 = v771;
          v26 = 0x1ED368000;
          v27 = a4;
          if ((v75 & 1) != 0)
            goto LABEL_100;
          goto LABEL_115;
        }
LABEL_112:
        if ((v75 & 1) != 0)
        {
          v66 = 1;
          v27 = a4;
          goto LABEL_100;
        }
        v27 = a4;
LABEL_115:
        v88 = v51;
        v89 = v52;
        a3 = v777;
        if (*(_BYTE *)(v26 + 1513))
        {
          PacketString = v55;
          v756 = v54;
          LODWORD(v771) = v60;
          v106 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v107 = v106;
          if (sNRCopyLogToStdErr)
          {

LABEL_158:
            v140 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            v744 = (__CFString *)createStringFromNRTLVType(v30);
            _NRLogWithArgs((uint64_t)v140, 1, (uint64_t)"%s%.30s:%-4d LtN not enough input bytes from linkInputSlot %u to fit %@ tlvLen %u", v141, v142, v143, v144, v145, (uint64_t)"");

            LODWORD(v55) = (_DWORD)PacketString;
            LODWORD(v54) = v756;
            LODWORD(v60) = (_DWORD)v771;
            v26 = 0x1ED368000;
            goto LABEL_116;
          }
          LODWORD(v764) = os_log_type_enabled(v106, OS_LOG_TYPE_INFO);

          v26 = 0x1ED368000;
          LODWORD(v60) = (_DWORD)v771;
          LODWORD(v54) = v756;
          LODWORD(v55) = (_DWORD)PacketString;
          if ((_DWORD)v764)
            goto LABEL_158;
        }
LABEL_116:
        if (*(_BYTE *)(a2 + 26) == 3 && (v88 | ((unint64_t)v89 << 8)) + 5 > v57)
        {
          v407 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v408 = v407;
          if (sNRCopyLogToStdErr)
          {

            goto LABEL_430;
          }
          v423 = os_log_type_enabled(v407, OS_LOG_TYPE_INFO);

          if (v423)
          {
LABEL_430:
            v424 = v776;
            v425 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            v11 = v424;
            _NRLogWithArgs((uint64_t)v425, 1, (uint64_t)"%s%.30s:%-4d truncated packet received %u != %lu", v426, v427, v428, v429, v430, (uint64_t)"");
            a4 = v778;
            goto LABEL_433;
          }
          v11 = v776;
          a4 = v778;
          goto LABEL_434;
        }
        if (v60 > (v54 > v55))
        {
          v90 = v60 - (unint64_t)(v54 > v55);
          v91 = (const void **)&v770[16 * (v54 > v55)];
          do
          {
            if (*(_BYTE *)(v26 + 1513))
            {
              v93 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              v94 = v93;
              if (sNRCopyLogToStdErr)
              {

LABEL_126:
                v96 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                _NRLogWithArgs((uint64_t)v96, 1, (uint64_t)"%s%.30s:%-4d partial TLV - consolidating %u bytes from linkInputSlot buf %p to linkReadBuffer filledIn=%u handled=%u", v97, v98, v99, v100, v101, (uint64_t)"");

                v26 = 0x1ED368000;
                goto LABEL_121;
              }
              v95 = os_log_type_enabled(v93, OS_LOG_TYPE_INFO);

              v26 = 0x1ED368000;
              if (v95)
                goto LABEL_126;
            }
LABEL_121:
            memcpy(&v18[*(unsigned int *)(a2 + 16)], *(v91 - 1), *(unsigned int *)v91);
            v92 = *(_DWORD *)v91;
            v91 += 2;
            *(_DWORD *)(a2 + 16) += v92;
            --v90;
          }
          while (v90);
        }
        v11 = v776;
        a4 = v778;
        if (*(_BYTE *)(v26 + 1513))
        {
          v108 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v109 = v108;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v146 = os_log_type_enabled(v108, OS_LOG_TYPE_INFO);

            v26 = 0x1ED368000;
            if (!v146)
              goto LABEL_128;
          }
          v147 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          _NRLogWithArgs((uint64_t)v147, 1, (uint64_t)"%s%.30s:%-4d Marking as completed (not enough input bytes) alreadyRead=%zu", v148, v149, v150, v151, v152, (uint64_t)"");

          v26 = 0x1ED368000;
        }
LABEL_128:
        v6 = 1;
      }
    }
    else
    {
      while (1)
      {
        if (*(_BYTE *)(v26 + 1513))
        {
          v40 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          v41 = v40;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v42 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);

            v26 = 0x1ED368000;
            if (!v42)
              goto LABEL_38;
          }
          v43 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          _NRLogWithArgs((uint64_t)v43, 1, (uint64_t)"%s%.30s:%-4d Handling Pad0 in linkReadBuffer", v44, v45, v46, v47, v48, (uint64_t)"");

          v26 = 0x1ED368000;
        }
LABEL_38:
        v28 = *(unsigned int *)(a2 + 16);
        LODWORD(v29) = *(_DWORD *)(a2 + 20) + 1;
        *(_DWORD *)(a2 + 20) = v29;
        if (v28 <= v29)
          break;
        v30 = v18[v29];
        if (v18[v29])
          goto LABEL_40;
      }
      if ((_DWORD)v28 != (_DWORD)v29)
      {
        -[NRBluetoothPacketParser handleInternalError:](v11, CFSTR("*filledInBytes != *handledBytes (%u != %u)"), v12, v13, v14, v15, v16, v17, v28);
LABEL_453:
        v6 = 0;
        goto LABEL_467;
      }
      v6 = 1;
      if (*(_BYTE *)(v26 + 1513))
      {
        v73 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        v74 = v73;
        if (sNRCopyLogToStdErr)
        {

          goto LABEL_343;
        }
        v6 = 1;
        v281 = os_log_type_enabled(v73, OS_LOG_TYPE_INFO);

        v26 = 0x1ED368000;
        if (v281)
        {
LABEL_343:
          v282 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          v6 = 1;
          _NRLogWithArgs((uint64_t)v282, 1, (uint64_t)"%s%.30s:%-4d Ended linkReadBuffer on a Pad0 handled=%u filledIn=%u", v283, v284, v285, v286, v287, (uint64_t)"");

          v26 = 0x1ED368000;
        }
      }
    }
  }
  do
  {
    v30 = *((unsigned __int8 *)&a3->isa + v27);
    if (*((_BYTE *)&a3->isa + v27))
    {
      LODWORD(v28) = *(_DWORD *)(a2 + 16);
      LODWORD(v29) = *(_DWORD *)(a2 + 20);
      goto LABEL_40;
    }
    if (*(_BYTE *)(v26 + 1513))
    {
      v31 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      v32 = v31;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v33 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);

        v26 = 0x1ED368000;
        if (!v33)
          goto LABEL_26;
      }
      v34 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v34, 1, (uint64_t)"%s%.30s:%-4d Handling Pad0 in linkInputSlot alreadyRead=%zu", v35, v36, v37, v38, v39, (uint64_t)"");

      v26 = 0x1ED368000;
    }
LABEL_26:
    ++v27;
  }
  while (v27 < a4);
  if (v27 != a4)
  {
    -[NRBluetoothPacketParser handleInternalError:](v11, CFSTR("curLinkInputSlotPartialBytesAlreadyRead != linkInputBufferLength (%u != %u)"), v12, v13, v14, v15, v16, v17, v27);
    goto LABEL_453;
  }
  if (!*(_BYTE *)(v26 + 1513))
  {
    v403 = 0;
    v6 = 1;
    v27 = a4;
    goto LABEL_441;
  }
  v468 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
  v469 = v468;
  if (sNRCopyLogToStdErr)
  {

    goto LABEL_538;
  }
  v6 = 1;
  v551 = os_log_type_enabled(v468, OS_LOG_TYPE_INFO);

  if (v551)
  {
LABEL_538:
    v11 = v776;
    v552 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
    v6 = 1;
    _NRLogWithArgs((uint64_t)v552, 1, (uint64_t)"%s%.30s:%-4d Ended linkInputSlot on a Pad0 handled=%u filledIn=%u", v553, v554, v555, v556, v557, (uint64_t)"");

    v403 = 0;
    a4 = v778;
    v27 = v778;
  }
  else
  {
    v403 = 0;
    a4 = v778;
    v27 = v778;
    v11 = v776;
  }
LABEL_435:
  if (gNRPacketLoggingEnabled)
  {
LABEL_436:
    v437 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    v438 = v437;
    if (sNRCopyLogToStdErr)
    {

      goto LABEL_439;
    }
    v439 = os_log_type_enabled(v437, OS_LOG_TYPE_INFO);

    if (v439)
    {
LABEL_439:
      v440 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v440, 1, (uint64_t)"%s%.30s:%-4d out of LtN fast path inner loop", v441, v442, v443, v444, v445, (uint64_t)"");

    }
  }
LABEL_440:
  v26 = 0x1ED368000uLL;
LABEL_441:
  v447 = *(_DWORD *)(a2 + 16);
  v446 = *(_DWORD *)(a2 + 20);
  if (v447 <= v446)
  {
    if (v446 != v447)
    {
      -[NRBluetoothPacketParser handleInternalError:](v11, CFSTR("mismatch handled/filled bytes (%u != %u)"), v12, v13, v14, v15, v16, v17, *(unsigned int *)(a2 + 20));
      goto LABEL_453;
    }
    if (!*(_BYTE *)(v26 + 1513))
      goto LABEL_447;
    v549 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    v550 = v549;
    if (sNRCopyLogToStdErr)
    {

      v11 = v776;
      a4 = v778;
    }
    else
    {
      v632 = os_log_type_enabled(v549, OS_LOG_TYPE_INFO);

      v11 = v776;
      a4 = v778;
      v26 = 0x1ED368000;
      if (!v632)
      {
LABEL_447:
        *(_QWORD *)(a2 + 16) = 0;
        goto LABEL_455;
      }
    }
    v633 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v633, 1, (uint64_t)"%s%.30s:%-4d resetting the linkReadBuffer (filledIn=%u)", v634, v635, v636, v637, v638, (uint64_t)"");

    v26 = 0x1ED368000;
    goto LABEL_447;
  }
  if (v446 <= 0x8000)
  {
    if (v446)
    {
      if (!*(_BYTE *)(v26 + 1513))
        goto LABEL_455;
      v448 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      v449 = v448;
      if (sNRCopyLogToStdErr)
      {

        v11 = v776;
        a4 = v778;
      }
      else
      {
        v669 = os_log_type_enabled(v448, OS_LOG_TYPE_INFO);

        v11 = v776;
        a4 = v778;
        v26 = 0x1ED368000;
        if (!v669)
          goto LABEL_455;
      }
      v670 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v670, 1, (uint64_t)"%s%.30s:%-4d not memmoving the linkReadBuffer thresh handled=%u filledIn=%u thresh=%u", v671, v672, v673, v674, v675, (uint64_t)"");
    }
    else
    {
      if (!*(_BYTE *)(v26 + 1513))
        goto LABEL_455;
      v623 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      v624 = v623;
      if (sNRCopyLogToStdErr)
      {

        v11 = v776;
        a4 = v778;
      }
      else
      {
        v690 = os_log_type_enabled(v623, OS_LOG_TYPE_INFO);

        v11 = v776;
        a4 = v778;
        v26 = 0x1ED368000;
        if (!v690)
          goto LABEL_455;
      }
      v670 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v670, 1, (uint64_t)"%s%.30s:%-4d not memmoving the linkReadBuffer zero handled=%u filledIn=%u thresh=%u", v691, v692, v693, v694, v695, (uint64_t)"");
    }

    v26 = 0x1ED368000;
  }
  else
  {
    if (!*(_BYTE *)(v26 + 1513))
      goto LABEL_444;
    v547 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    v548 = v547;
    if (sNRCopyLogToStdErr)
    {

      v11 = v776;
      a4 = v778;
      goto LABEL_579;
    }
    v625 = os_log_type_enabled(v547, OS_LOG_TYPE_INFO);

    v11 = v776;
    a4 = v778;
    v26 = 0x1ED368000;
    if (v625)
    {
LABEL_579:
      v626 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v626, 1, (uint64_t)"%s%.30s:%-4d memmoving the linkReadBuffer by handled=%u (filledIn=%u) thresh=%u", v627, v628, v629, v630, v631, (uint64_t)"");

      v26 = 0x1ED368000;
    }
LABEL_444:
    memmove(v18, &v18[*(unsigned int *)(a2 + 20)], (*(_DWORD *)(a2 + 16) - *(_DWORD *)(a2 + 20)));
    *(_QWORD *)(a2 + 16) = (*(_DWORD *)(a2 + 16) - *(_DWORD *)(a2 + 20));
  }
LABEL_455:
  if (v767)
  {
    if (v403)
      v450 = a4;
    else
      v450 = v27;
    *v767 = v450;
  }
  if (!v772)
  {
    if (!*(_BYTE *)(v26 + 1513))
    {
      *(_WORD *)(a2 + 24) += v769;
      goto LABEL_467;
    }
    v502 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    v503 = v502;
    if (sNRCopyLogToStdErr)
    {

      v11 = v776;
    }
    else
    {
      v590 = os_log_type_enabled(v502, OS_LOG_TYPE_INFO);

      v11 = v776;
      v26 = 0x1ED368000;
      if (!v590)
        goto LABEL_462;
    }
    v591 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v591, 1, (uint64_t)"%s%.30s:%-4d highestNexusOutputSlotWrittenTo is NULL", v592, v593, v594, v595, v596, (uint64_t)"");

    v26 = 0x1ED368000;
    goto LABEL_462;
  }
  os_channel_advance_slot();
LABEL_462:
  v451 = *(unsigned __int8 *)(v26 + 1513);
  *(_WORD *)(a2 + 24) += v769;
  if (!v451)
    goto LABEL_467;
  v452 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
  v453 = v452;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v495 = os_log_type_enabled(v452, OS_LOG_TYPE_INFO);

    if (!v495)
      goto LABEL_467;
  }
  v496 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
  _NRLogWithArgs((uint64_t)v496, 1, (uint64_t)"%s%.30s:%-4d out of LtN fast path loop (%llu/%llu bytes)", v497, v498, v499, v500, v501, (uint64_t)"");

LABEL_467:
  return v6 & 1;
}

void NRBluetoothPacketParserSuspendNexusBEOutputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 0x200) == 0 && *(_QWORD *)(a1 + 344))
  {
    *(_QWORD *)(a1 + 136) = v1 | 0x200;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_suspend(*(dispatch_object_t *)(a1 + 344));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusBEOutput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

void NRBluetoothPacketParserSuspendNexusVIOutputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 0x100) == 0 && *(_QWORD *)(a1 + 328))
  {
    *(_QWORD *)(a1 + 136) = v1 | 0x100;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_suspend(*(dispatch_object_t *)(a1 + 328));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusVIOutput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

void NRBluetoothPacketParserSuspendNexusVOOutputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 0x80) == 0 && *(_QWORD *)(a1 + 312))
  {
    *(_QWORD *)(a1 + 136) = v1 | 0x80;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_suspend(*(dispatch_object_t *)(a1 + 312));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusVOOutput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

double __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6)
{
  double result;

  *(_QWORD *)&result = 136447234;
  *(_DWORD *)a1 = 136447234;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 18) = 1024;
  *(_DWORD *)(a1 + 20) = a4;
  *(_WORD *)(a1 + 24) = 1024;
  *(_DWORD *)(a1 + 26) = a5;
  *(_WORD *)(a1 + 30) = 2112;
  *(_QWORD *)(a1 + 32) = a6;
  return result;
}

double __os_log_helper_1_2_4_8_34_8_64_4_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  double result;

  *(_QWORD *)&result = 136446978;
  *(_DWORD *)a1 = 136446978;
  *(_QWORD *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2112;
  *(_QWORD *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 1024;
  *(_DWORD *)(a1 + 24) = a4;
  *(_WORD *)(a1 + 28) = 1024;
  *(_DWORD *)(a1 + 30) = a5;
  return result;
}

void NRBluetoothPacketParserResumeNexusBEOutputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 0x200) != 0 && *(_QWORD *)(a1 + 344))
  {
    *(_QWORD *)(a1 + 136) = v1 & 0xFFFFFFFFFFFFFDFFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_resume(*(dispatch_object_t *)(a1 + 344));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEOutput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

void NRBluetoothPacketParserResumeNexusVIOutputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 0x100) != 0 && *(_QWORD *)(a1 + 328))
  {
    *(_QWORD *)(a1 + 136) = v1 & 0xFFFFFFFFFFFFFEFFLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_resume(*(dispatch_object_t *)(a1 + 328));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIOutput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

void NRBluetoothPacketParserResumeNexusVOOutputSource(uint64_t a1)
{
  uint64_t v1;
  os_log_t v3;
  os_log_t v4;
  _BOOL4 v5;
  os_log_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 136);
  if ((v1 & 0x80) != 0 && *(_QWORD *)(a1 + 312))
  {
    *(_QWORD *)(a1 + 136) = v1 & 0xFFFFFFFFFFFFFF7FLL;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_4:
      dispatch_resume(*(dispatch_object_t *)(a1 + 312));
      return;
    }
    v3 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

      if (!v5)
        goto LABEL_4;
    }
    v6 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v6, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOOutput", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_4;
  }
}

void sub_1DBD6ADE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *createStringForNRNexusChannelPriority(unsigned int a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 'd':
      result = CFSTR("Voice");
      break;
    case 'e':
      result = CFSTR("Video");
      break;
    case 'f':
      result = CFSTR("BestEffort");
      break;
    case 'g':
      result = CFSTR("Background");
      break;
    default:
      if (a1)
        result = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%d)"), a1);
      else
        result = CFSTR("Invalid");
      break;
  }
  return result;
}

unsigned __int8 *NRBluetoothPacketParserCreate(const unsigned __int8 *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  void *v10;
  NRBluetoothPacketParser *v11;
  id v12;
  void *v13;
  os_unfair_lock_s *v14;
  id v15;
  id v16;
  id *v17;
  unsigned __int8 *v18;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  _BOOL4 v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL4 v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v3 = a2;
  if (v3)
  {
    if (uuid_is_null(a1))
    {
      if (nrCopyLogObj_onceToken_509 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_509, &__block_literal_global_353);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_510, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_510, 17, (uint64_t)"invalid bluetooth UUID", v4, v5, v6, v7, v8, v57);
      goto LABEL_8;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a1);
    if (!v10)
    {
      v29 = nrCopyLogObj_506();
      v30 = v29;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v44 = os_log_type_enabled(v29, OS_LOG_TYPE_FAULT);

        if (!v44)
        {
          v9 = 0;
          goto LABEL_18;
        }
      }
      v12 = nrCopyLogObj_506();
      _NRLogWithArgs((uint64_t)v12, 17, (uint64_t)"%s called with null btUUID", v45, v46, v47, v48, v49, (uint64_t)"NRBluetoothPacketParserCreate");
      v9 = 0;
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    v11 = -[NRBluetoothPacketParser initWithBluetoothUUID:queue:]([NRBluetoothPacketParser alloc], "initWithBluetoothUUID:queue:", v10, v3);
    if (v11)
    {
      v12 = v11;
      objc_opt_self();
      if (copySharedManager_onceToken != -1)
        dispatch_once(&copySharedManager_onceToken, &__block_literal_global_589);
      v13 = (void *)copySharedManager_manager;
      if (copySharedManager_manager)
      {
        v14 = (os_unfair_lock_s *)(copySharedManager_manager + 8);
        v15 = v12;
        v16 = v10;
        v17 = v13;
        os_unfair_lock_lock(v14);
        objc_msgSend(v17[2], "setObject:forKeyedSubscript:", v15, v16);

        os_unfair_lock_unlock(v14);
      }
      v18 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x10uLL, 0xF1748037uLL);
      if (v18)
      {
        v9 = v18;
        uuid_copy(v18, a1);
        goto LABEL_17;
      }
      v33 = nrCopyLogObj_506();
      v34 = v33;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v35 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

        if (!v35)
        {
LABEL_33:
          _os_log_pack_size();
          MEMORY[0x1E0C80A78]();
          __error();
          v42 = _os_log_pack_fill();
          __os_log_helper_1_2_3_8_34_8_0_8_0(v42, 16);
          v43 = nrCopyLogObj_506();
          _NRLogAbortWithPack(v43);
        }
      }
      v36 = nrCopyLogObj_506();
      _NRLogWithArgs((uint64_t)v36, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v37, v38, v39, v40, v41, (uint64_t)"");

      goto LABEL_33;
    }
    v31 = nrCopyLogObj_506();
    v32 = v31;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v50 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

      if (!v50)
      {
LABEL_38:
        v12 = 0;
        v9 = 0;
        goto LABEL_17;
      }
    }
    v51 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v51, 17, (uint64_t)"%s called with null parser", v52, v53, v54, v55, v56, (uint64_t)"NRBluetoothPacketParserCreate");

    goto LABEL_38;
  }
  v20 = nrCopyLogObj_506();
  v21 = v20;
  if (sNRCopyLogToStdErr)
  {

LABEL_23:
    v23 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)"%s called with null queue", v24, v25, v26, v27, v28, (uint64_t)"NRBluetoothPacketParserCreate");

    goto LABEL_8;
  }
  v22 = os_log_type_enabled(v20, OS_LOG_TYPE_FAULT);

  if (v22)
    goto LABEL_23;
LABEL_8:
  v9 = 0;
LABEL_19:

  return v9;
}

void NRBluetoothPacketParserStart(uint64_t a1)
{
  char *v1;
  id *v2;
  os_unfair_lock_s *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  if (a1)
  {
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a1);
    if (v22)
    {
      objc_opt_self();
      if (copySharedManager_onceToken != -1)
        dispatch_once(&copySharedManager_onceToken, &__block_literal_global_589);
      v1 = (char *)(id)copySharedManager_manager;
      if (v1)
      {
        v2 = (id *)v1;
        v3 = (os_unfair_lock_s *)(v1 + 8);
        v4 = v22;
        os_unfair_lock_lock(v3);
        objc_msgSend(v2[2], "objectForKeyedSubscript:", v4);
        v5 = objc_claimAutoreleasedReturnValue();

        os_unfair_lock_unlock(v3);
        if (v5)
        {
          if (*(_BYTE *)(v5 + 8) != 4)
          {
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
            objc_msgSend((id)v5, "start");
          }
        }
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      v8 = nrCopyLogObj_506();
      v9 = v8;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v16 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);

        if (!v16)
        {
          v22 = 0;
          goto LABEL_10;
        }
      }
      v5 = (uint64_t)nrCopyLogObj_506();
      _NRLogWithArgs(v5, 17, (uint64_t)"%s called with null btUUID", v17, v18, v19, v20, v21, (uint64_t)"NRBluetoothPacketParserStart");
    }

LABEL_10:
    return;
  }
  v6 = nrCopyLogObj_506();
  v7 = v6;
  if (sNRCopyLogToStdErr)
  {

LABEL_16:
    v22 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v22, 17, (uint64_t)"%s called with null parserRef", v11, v12, v13, v14, v15, (uint64_t)"NRBluetoothPacketParserStart");
    goto LABEL_10;
  }
  v10 = os_log_type_enabled(v6, OS_LOG_TYPE_FAULT);

  if (v10)
    goto LABEL_16;
}

void NRBluetoothPacketParserCancel(uint64_t a1)
{
  char *v1;
  id *v2;
  os_unfair_lock_s *v3;
  id v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;
  id v8;
  id *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  if (a1)
  {
    v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a1);
    if (!v26)
    {
      v12 = nrCopyLogObj_506();
      v13 = v12;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v20 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);

        if (!v20)
        {
          v26 = 0;
          goto LABEL_12;
        }
      }
      v5 = (uint64_t)nrCopyLogObj_506();
      _NRLogWithArgs(v5, 17, (uint64_t)"%s called with null btUUID", v21, v22, v23, v24, v25, (uint64_t)"NRBluetoothPacketParserCancel");
      goto LABEL_11;
    }
    objc_opt_self();
    if (copySharedManager_onceToken != -1)
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_589);
    v1 = (char *)(id)copySharedManager_manager;
    if (!v1)
    {
      v5 = 0;
      goto LABEL_11;
    }
    v2 = (id *)v1;
    v3 = (os_unfair_lock_s *)(v1 + 8);
    v4 = v26;
    os_unfair_lock_lock(v3);
    objc_msgSend(v2[2], "objectForKeyedSubscript:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v3);
    if (!v5 || *(_BYTE *)(v5 + 8) == 4)
      goto LABEL_11;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
    objc_msgSend((id)v5, "resetContextForPriority:", 3);
    objc_msgSend((id)v5, "resetContextForPriority:", 2);
    objc_msgSend((id)v5, "resetContextForPriority:", 1);
    objc_msgSend((id)v5, "cancel");
    objc_opt_self();
    if (copySharedManager_onceToken == -1)
    {
      v6 = (os_unfair_lock_s *)copySharedManager_manager;
      if (!copySharedManager_manager)
      {
LABEL_11:

LABEL_12:
        return;
      }
    }
    else
    {
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_589);
      v6 = (os_unfair_lock_s *)copySharedManager_manager;
      if (!copySharedManager_manager)
        goto LABEL_11;
    }
    v7 = v6 + 2;
    v8 = v4;
    v9 = v6;
    os_unfair_lock_lock(v7);
    objc_msgSend(v9[2], "setObject:forKeyedSubscript:", 0, v8);

    os_unfair_lock_unlock(v7);
    goto LABEL_11;
  }
  v10 = nrCopyLogObj_506();
  v11 = v10;
  if (sNRCopyLogToStdErr)
  {

LABEL_18:
    v26 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)"%s called with null parserRef", v15, v16, v17, v18, v19, (uint64_t)"NRBluetoothPacketParserCancel");
    goto LABEL_12;
  }
  v14 = os_log_type_enabled(v10, OS_LOG_TYPE_FAULT);

  if (v14)
    goto LABEL_18;
}

uint64_t NRBluetoothPacketParserCreateReadContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char *v8;
  id *v9;
  os_unfair_lock_s *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  if (!a1)
  {
    v15 = nrCopyLogObj_506();
    v16 = v15;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v21 = os_log_type_enabled(v15, OS_LOG_TYPE_FAULT);

      if (!v21)
        return 0;
    }
    v7 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null parserRef", v22, v23, v24, v25, v26, (uint64_t)"NRBluetoothPacketParserCreateReadContext");
LABEL_24:
    v13 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    v17 = nrCopyLogObj_506();
    v18 = v17;
    if (sNRCopyLogToStdErr)
    {

LABEL_23:
      v7 = nrCopyLogObj_506();
      _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null readAvailableCallback", v28, v29, v30, v31, v32, (uint64_t)"NRBluetoothPacketParserCreateReadContext");
      goto LABEL_24;
    }
    v27 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);

    if (v27)
      goto LABEL_23;
    return 0;
  }
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a1);
  if (v7)
  {
    objc_opt_self();
    if (copySharedManager_onceToken != -1)
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_589);
    v8 = (char *)(id)copySharedManager_manager;
    if (v8)
    {
      v9 = (id *)v8;
      v10 = (os_unfair_lock_s *)(v8 + 8);
      v11 = v7;
      os_unfair_lock_lock(v10);
      objc_msgSend(v9[2], "objectForKeyedSubscript:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(v10);
      if (v12 && *(_BYTE *)(v12 + 8) != 4)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
        v13 = objc_msgSend((id)v12, "createReadContextForPriority:readAvailableCallback:readAvailableContext:", a2, a3, a4);
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
  }
  else
  {
    v19 = nrCopyLogObj_506();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v33 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

      if (!v33)
      {
        v7 = 0;
        v13 = 0;
        goto LABEL_12;
      }
    }
    v12 = (uint64_t)nrCopyLogObj_506();
    _NRLogWithArgs(v12, 17, (uint64_t)"%s called with null btUUID", v34, v35, v36, v37, v38, (uint64_t)"NRBluetoothPacketParserCreateReadContext");
    v13 = 0;
  }

LABEL_12:
  return v13;
}

uint64_t NRBluetoothPacketParserCreateWriteContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char *v8;
  id *v9;
  os_unfair_lock_s *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  if (!a1)
  {
    v15 = nrCopyLogObj_506();
    v16 = v15;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v21 = os_log_type_enabled(v15, OS_LOG_TYPE_FAULT);

      if (!v21)
        return 0;
    }
    v7 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null parserRef", v22, v23, v24, v25, v26, (uint64_t)"NRBluetoothPacketParserCreateWriteContext");
LABEL_24:
    v13 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    v17 = nrCopyLogObj_506();
    v18 = v17;
    if (sNRCopyLogToStdErr)
    {

LABEL_23:
      v7 = nrCopyLogObj_506();
      _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null writeOutputCallback", v28, v29, v30, v31, v32, (uint64_t)"NRBluetoothPacketParserCreateWriteContext");
      goto LABEL_24;
    }
    v27 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);

    if (v27)
      goto LABEL_23;
    return 0;
  }
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a1);
  if (v7)
  {
    objc_opt_self();
    if (copySharedManager_onceToken != -1)
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_589);
    v8 = (char *)(id)copySharedManager_manager;
    if (v8)
    {
      v9 = (id *)v8;
      v10 = (os_unfair_lock_s *)(v8 + 8);
      v11 = v7;
      os_unfair_lock_lock(v10);
      objc_msgSend(v9[2], "objectForKeyedSubscript:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(v10);
      if (v12 && *(_BYTE *)(v12 + 8) != 4)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
        v13 = objc_msgSend((id)v12, "createWriteContextForPriority:writeOutputCallback:writeOutputContext:", a2, a3, a4);
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
  }
  else
  {
    v19 = nrCopyLogObj_506();
    v20 = v19;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v33 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

      if (!v33)
      {
        v7 = 0;
        v13 = 0;
        goto LABEL_12;
      }
    }
    v12 = (uint64_t)nrCopyLogObj_506();
    _NRLogWithArgs(v12, 17, (uint64_t)"%s called with null btUUID", v34, v35, v36, v37, v38, (uint64_t)"NRBluetoothPacketParserCreateWriteContext");
    v13 = 0;
  }

LABEL_12:
  return v13;
}

void NRBluetoothPacketParserResetContext(uint64_t a1, uint64_t a2)
{
  char *v3;
  id *v4;
  os_unfair_lock_s *v5;
  id v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  id v10;
  id *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  if (a1)
  {
    v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a1);
    if (!v28)
    {
      v14 = nrCopyLogObj_506();
      v15 = v14;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v22 = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);

        if (!v22)
        {
          v28 = 0;
          goto LABEL_14;
        }
      }
      v7 = (uint64_t)nrCopyLogObj_506();
      _NRLogWithArgs(v7, 17, (uint64_t)"%s called with null btUUID", v23, v24, v25, v26, v27, (uint64_t)"NRBluetoothPacketParserResetContext");
      goto LABEL_13;
    }
    objc_opt_self();
    if (copySharedManager_onceToken != -1)
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_589);
    v3 = (char *)(id)copySharedManager_manager;
    if (!v3)
    {
      v7 = 0;
      goto LABEL_13;
    }
    v4 = (id *)v3;
    v5 = (os_unfair_lock_s *)(v3 + 8);
    v6 = v28;
    os_unfair_lock_lock(v5);
    objc_msgSend(v4[2], "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v5);
    if (!v7)
      goto LABEL_13;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 56));
    objc_msgSend((id)v7, "resetContextForPriority:", a2);
    if ((_DWORD)a2 == 1)
      objc_msgSend((id)v7, "cancel");
    if (*(_QWORD *)(v7 + 664))
      goto LABEL_13;
    objc_msgSend((id)v7, "cancel");
    objc_opt_self();
    if (copySharedManager_onceToken == -1)
    {
      v8 = (os_unfair_lock_s *)copySharedManager_manager;
      if (!copySharedManager_manager)
      {
LABEL_13:

LABEL_14:
        return;
      }
    }
    else
    {
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_589);
      v8 = (os_unfair_lock_s *)copySharedManager_manager;
      if (!copySharedManager_manager)
        goto LABEL_13;
    }
    v9 = v8 + 2;
    v10 = v6;
    v11 = v8;
    os_unfair_lock_lock(v9);
    objc_msgSend(v11[2], "setObject:forKeyedSubscript:", 0, v10);

    os_unfair_lock_unlock(v9);
    goto LABEL_13;
  }
  v12 = nrCopyLogObj_506();
  v13 = v12;
  if (sNRCopyLogToStdErr)
  {

LABEL_20:
    v28 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v28, 17, (uint64_t)"%s called with null parserRef", v17, v18, v19, v20, v21, (uint64_t)"NRBluetoothPacketParserResetContext");
    goto LABEL_14;
  }
  v16 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);

  if (v16)
    goto LABEL_20;
}

void NRBluetoothPacketParserGetSlotCount(uint64_t a1, uint64_t a2, _WORD *a3, _WORD *a4)
{
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (!a1)
  {
    v4 = nrCopyLogObj_506();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v5 = v4;
      v6 = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);

      if (!v6)
        return;
    }
    v12 = nrCopyLogObj_506();
    _NRLogWithArgs((uint64_t)v12, 17, (uint64_t)"%s called with null parserRef", v7, v8, v9, v10, v11, (uint64_t)"NRBluetoothPacketParserGetSlotCount");

    return;
  }
  if (a3)
    *a3 = 64;
  if (a4)
    *a4 = 16;
}

void sub_1DBD751A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

id nrCopyLogObj_617()
{
  if (nrCopyLogObj_onceToken_620 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_620, &__block_literal_global_621);
  return (id)nrCopyLogObj_sNRLogObj_622;
}

void __nrCopyLogObj_block_invoke_623()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_622;
  nrCopyLogObj_sNRLogObj_622 = (uint64_t)v0;

}

void sub_1DBD76FB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 104), 8);
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

void __nrCopyLogObj_block_invoke_753()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_748;
  nrCopyLogObj_sNRLogObj_748 = (uint64_t)v0;

}

id nrCopyLogObj_757()
{
  if (nrCopyLogObj_onceToken_746 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_746, &__block_literal_global_747);
  return (id)nrCopyLogObj_sNRLogObj_748;
}

BOOL _NRIsUUIDNonZero(void *a1)
{
  NSObject *v2;
  NSObject *v3;
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 uu[8];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v2 = nrCopyLogObj_757();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v3 = v2;
      v4 = os_log_type_enabled(v2, OS_LOG_TYPE_FAULT);

      if (!v4)
        return 0;
    }
    v5 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v5, 17, (uint64_t)"%s called with null nsUUID", v6, v7, v8, v9, v10, (uint64_t)"_NRIsUUIDNonZero");

    return 0;
  }
  *(_QWORD *)uu = 0;
  v12 = 0;
  objc_msgSend(a1, "getUUIDBytes:", uu);
  return uuid_is_null(uu) == 0;
}

void __nrCopyLogObj_block_invoke_839()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_835;
  nrCopyLogObj_sNRLogObj_835 = (uint64_t)v0;

}

void sub_1DBD79F6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id nrCopyLogObj_852()
{
  if (nrCopyLogObj_onceToken_833 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_833, &__block_literal_global_834);
  return (id)nrCopyLogObj_sNRLogObj_835;
}

id nrCopyLogObj_896()
{
  if (nrCopyLogObj_onceToken_900 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_900, &__block_literal_global_347);
  return (id)nrCopyLogObj_sNRLogObj_901;
}

void __nrCopyLogObj_block_invoke_902()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_901;
  nrCopyLogObj_sNRLogObj_901 = (uint64_t)v0;

}

const __CFString *_NRKeyCreateLogString(void *a1)
{
  id v1;
  int v2;
  uint64_t v3;
  _BYTE *v4;
  void *v5;
  _BYTE *v6;
  char *v7;
  __CFString *v8;
  const __CFString *v9;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  unsigned __int8 md[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    v9 = CFSTR("[nil]");
    goto LABEL_39;
  }
  if (_NRIsAppleInternal_onceToken != -1)
    dispatch_once(&_NRIsAppleInternal_onceToken, &__block_literal_global_409);
  if (_NRIsAppleInternal_internal
    && objc_msgSend(v1, "length")
    && (unint64_t)objc_msgSend(v1, "length") <= 0xFFFFFFE4)
  {
    v2 = objc_msgSend(v1, "length");
    v3 = (v2 + 26);
    if (v2 != -26)
    {
      v4 = malloc_type_malloc((v2 + 26), 0xA172743EuLL);
      if (v4)
      {
        v5 = v4;
        v6 = v4;
        if (v3 >= 2)
        {
          *v4 = 78;
          v6 = v4 + 1;
          if (v3 != 2)
          {
            v7 = &aNetworkrelayke[v3 - 2];
            v4[1] = 101;
            if (v7 == "etworkRelayKeyLogHashSalt")
            {
              v6 = v4 + 2;
            }
            else
            {
              v4[2] = 116;
              if (v7 == "tworkRelayKeyLogHashSalt")
              {
                v6 = v4 + 3;
              }
              else
              {
                v4[3] = 119;
                if (v7 == "workRelayKeyLogHashSalt")
                {
                  v6 = v4 + 4;
                }
                else
                {
                  v4[4] = 111;
                  if (v7 == "orkRelayKeyLogHashSalt")
                  {
                    v6 = v4 + 5;
                  }
                  else
                  {
                    v4[5] = 114;
                    if (v7 == "rkRelayKeyLogHashSalt")
                    {
                      v6 = v4 + 6;
                    }
                    else
                    {
                      v4[6] = 107;
                      if (v7 == "kRelayKeyLogHashSalt")
                      {
                        v6 = v4 + 7;
                      }
                      else
                      {
                        v4[7] = 82;
                        if (v7 == "RelayKeyLogHashSalt")
                        {
                          v6 = v4 + 8;
                        }
                        else
                        {
                          v4[8] = 101;
                          if (v7 == "elayKeyLogHashSalt")
                          {
                            v6 = v4 + 9;
                          }
                          else
                          {
                            v4[9] = 108;
                            if (v7 == "layKeyLogHashSalt")
                            {
                              v6 = v4 + 10;
                            }
                            else
                            {
                              v4[10] = 97;
                              if (v7 == "ayKeyLogHashSalt")
                              {
                                v6 = v4 + 11;
                              }
                              else
                              {
                                v4[11] = 121;
                                if (v7 == "yKeyLogHashSalt")
                                {
                                  v6 = v4 + 12;
                                }
                                else
                                {
                                  v4[12] = 75;
                                  if (v7 == "KeyLogHashSalt")
                                  {
                                    v6 = v4 + 13;
                                  }
                                  else
                                  {
                                    v4[13] = 101;
                                    if (v7 == "eyLogHashSalt")
                                    {
                                      v6 = v4 + 14;
                                    }
                                    else
                                    {
                                      v4[14] = 121;
                                      if (v7 == "yLogHashSalt")
                                      {
                                        v6 = v4 + 15;
                                      }
                                      else
                                      {
                                        v4[15] = 76;
                                        if (v7 == "LogHashSalt")
                                        {
                                          v6 = v4 + 16;
                                        }
                                        else
                                        {
                                          v4[16] = 111;
                                          if (v7 == "ogHashSalt")
                                          {
                                            v6 = v4 + 17;
                                          }
                                          else
                                          {
                                            v4[17] = 103;
                                            if (v7 == "gHashSalt")
                                            {
                                              v6 = v4 + 18;
                                            }
                                            else
                                            {
                                              v4[18] = 72;
                                              if (v7 == "HashSalt")
                                              {
                                                v6 = v4 + 19;
                                              }
                                              else
                                              {
                                                v4[19] = 97;
                                                if (v7 == "ashSalt")
                                                {
                                                  v6 = v4 + 20;
                                                }
                                                else
                                                {
                                                  v4[20] = 115;
                                                  if (v7 == "shSalt")
                                                  {
                                                    v6 = v4 + 21;
                                                  }
                                                  else
                                                  {
                                                    v4[21] = 104;
                                                    if (v7 == "hSalt")
                                                    {
                                                      v6 = v4 + 22;
                                                    }
                                                    else
                                                    {
                                                      v4[22] = 83;
                                                      if (v7 == "Salt")
                                                      {
                                                        v6 = v4 + 23;
                                                      }
                                                      else
                                                      {
                                                        v4[23] = 97;
                                                        if (v7 == "alt")
                                                        {
                                                          v6 = v4 + 24;
                                                        }
                                                        else
                                                        {
                                                          v4[24] = 108;
                                                          if (v7 == "lt")
                                                          {
                                                            v6 = v4 + 25;
                                                          }
                                                          else
                                                          {
                                                            v4[25] = 116;
                                                            v6 = v4 + 26;
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        *v6 = 0;
        objc_msgSend(v1, "getBytes:length:", v4 + 26, v3 - 26);
        v39 = 0u;
        v40 = 0u;
        *(_OWORD *)md = 0u;
        v38 = 0u;
        CC_SHA512(v5, v3, md);
        cc_clear();
        free(v5);
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 64);
        objc_msgSend(v33, "base64EncodedStringWithOptions:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v34, "substringToIndex:", 6);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (__CFString *)objc_msgSend(v35, "initWithFormat:", CFSTR(":%@"), v36);

        goto LABEL_37;
      }
      v14 = nrCopyLogObj_896();
      v15 = v14;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v16 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

        if (!v16)
        {
LABEL_65:
          _os_log_pack_size();
          MEMORY[0x1E0C80A78]();
          __error();
          v31 = _os_log_pack_fill();
          *(_DWORD *)v31 = 136446466;
          *(_QWORD *)(v31 + 4) = "strict_malloc";
          *(_WORD *)(v31 + 12) = 2048;
          *(_QWORD *)(v31 + 14) = v3;
          v32 = nrCopyLogObj_896();
          _NRLogAbortWithPack(v32);
        }
      }
      v25 = nrCopyLogObj_896();
      _NRLogWithArgs((uint64_t)v25, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v26, v27, v28, v29, v30, (uint64_t)"");

      goto LABEL_65;
    }
    v11 = nrCopyLogObj_896();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_62:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v23 = _os_log_pack_fill();
        *(_DWORD *)v23 = 136446210;
        *(_QWORD *)(v23 + 4) = "strict_malloc";
        v24 = nrCopyLogObj_896();
        _NRLogAbortWithPack(v24);
      }
    }
    v17 = nrCopyLogObj_896();
    _NRLogWithArgs((uint64_t)v17, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc called with size 0", v18, v19, v20, v21, v22, (uint64_t)"");

    goto LABEL_62;
  }
  v8 = &stru_1EA3F8020;
LABEL_37:
  v9 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%llu%@]"), objc_msgSend(v1, "length"), v8);

LABEL_39:
  return v9;
}

id nrCopyLogObj_1090()
{
  if (nrCopyLogObj_onceToken_1095 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1095, &__block_literal_global_1096);
  return (id)nrCopyLogObj_sNRLogObj_1097;
}

void __nrCopyLogObj_block_invoke_1098()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_1097;
  nrCopyLogObj_sNRLogObj_1097 = (uint64_t)v0;

}

void sub_1DBD803A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBD80620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBD80CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBD811D4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DBD81464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBD81714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DBD81A7C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DBD826F4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_1274()
{
  if (nrCopyLogObj_onceToken_1285 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1285, &__block_literal_global_1286);
  return (id)nrCopyLogObj_sNRLogObj_1287;
}

void sub_1DBD83C98(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void __nrCopyLogObj_block_invoke_1289()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_1287;
  nrCopyLogObj_sNRLogObj_1287 = (uint64_t)v0;

}

void sub_1DBD84A84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1DBD86150(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1DBD869FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1DBD87298(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1DBD88044(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1DBD888E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_1436()
{
  if (nrCopyLogObj_onceToken_1440 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1440, &__block_literal_global_67);
  return (id)nrCopyLogObj_sNRLogObj_1441;
}

void __nrCopyLogObj_block_invoke_1444()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_1441;
  nrCopyLogObj_sNRLogObj_1441 = (uint64_t)v0;

}

double __os_log_helper_1_2_3_8_34_8_32_8_0(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = 136446722;
  *(_DWORD *)a1 = 136446722;
  *(_QWORD *)(a1 + 4) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
  *(_WORD *)(a1 + 12) = 2080;
  *(_QWORD *)(a1 + 14) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
  *(_WORD *)(a1 + 22) = 2048;
  *(_QWORD *)(a1 + 24) = a2;
  return result;
}

uint64_t __Block_byref_object_copy__1501(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1502(uint64_t a1)
{

}

uint64_t NRCompanionLinkIsEnabled(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t IsEnabled;

  if (nrCopyLogObj_onceToken_1513 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1513, &__block_literal_global_1514);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1515, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1515, 0, (uint64_t)"%s%.30s:%-4d Querying whether companion link is enabled", a4, a5, a6, a7, a8, (uint64_t)"");
  IsEnabled = nrXPCCompanionLinkIsEnabled();
  if (nrCopyLogObj_onceToken_1513 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_9:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1515, 0, (uint64_t)"%s%.30s:%-4d Returning that companion link is %sabled", v8, v9, v10, v11, v12, (uint64_t)"");
      return IsEnabled;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_1513, &__block_literal_global_1514);
    if (sNRCopyLogToStdErr)
      goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1515, OS_LOG_TYPE_DEFAULT))
    goto LABEL_9;
  return IsEnabled;
}

void __nrCopyLogObj_block_invoke_1521()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_1515;
  nrCopyLogObj_sNRLogObj_1515 = (uint64_t)v0;

}

uint64_t NRDeviceSupportsIDSRestrictedPorts(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 uu[8];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  if (nrCopyLogObj_onceToken_1513 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1513, &__block_literal_global_1514);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1515, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1515, 0, (uint64_t)"%s%.30s:%-4d Querying whether device supports restricted ports", v1, v2, v3, v4, v5, (uint64_t)"");
  if (!v6)
  {
    v20 = nrCopyLogObj_1524();
    v21 = v20;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v22 = os_log_type_enabled(v20, OS_LOG_TYPE_FAULT);

      if (!v22)
        goto LABEL_12;
    }
    v23 = nrCopyLogObj_1524();
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)"%s called with null device", v24, v25, v26, v27, v28, (uint64_t)"NRDeviceSupportsIDSRestrictedPorts");

    goto LABEL_12;
  }
  *(_QWORD *)uu = 0;
  v31 = 0;
  objc_msgSend(v6, "nrDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getUUIDBytes:", uu);

  if (!uuid_is_null(uu))
  {
    v13 = nrXPCSupportsRestrictedPorts(uu);
    if (nrCopyLogObj_onceToken_1513 == -1)
    {
      if (sNRCopyLogToStdErr)
        goto LABEL_16;
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_1513, &__block_literal_global_1514);
      if (sNRCopyLogToStdErr)
        goto LABEL_16;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1515, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
LABEL_16:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1515, 0, (uint64_t)"%s%.30s:%-4d Device supports restricted ports: %s", v14, v15, v16, v17, v18, (uint64_t)"");
    goto LABEL_17;
  }
  if (nrCopyLogObj_onceToken_1513 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_11:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1515, 17, (uint64_t)"null nrUUID", v8, v9, v10, v11, v12, v29);
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_1513, &__block_literal_global_1514);
    if (sNRCopyLogToStdErr)
      goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1515, OS_LOG_TYPE_FAULT))
    goto LABEL_11;
LABEL_12:
  v13 = 0;
LABEL_17:

  return v13;
}

id nrCopyLogObj_1524()
{
  if (nrCopyLogObj_onceToken_1513 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1513, &__block_literal_global_1514);
  return (id)nrCopyLogObj_sNRLogObj_1515;
}

const __CFString *createIPv6AddrString(_DWORD *a1)
{
  _DWORD *v1;
  int v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11[46];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return CFSTR("<NULL>");
  v1 = a1;
  if (*a1)
  {
    v2 = 30;
  }
  else
  {
    v4 = a1[1];
    v2 = 30;
    if (!v4)
    {
      v2 = v1[2] == -65536 ? 2 : 30;
      if (v1[2] == -65536)
        v1 += 3;
    }
  }
  if (inet_ntop(v2, v1, v11, 0x2Eu))
    return (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v11);
  if (nrCopyLogObj_onceToken_1533 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1533, &__block_literal_global_1534);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1535, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1535, 17, (uint64_t)"inet_ntop failed", v5, v6, v7, v8, v9, v10);
  return CFSTR("<ERROR>");
}

void __nrCopyLogObj_block_invoke_1541()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_1535;
  nrCopyLogObj_sNRLogObj_1535 = (uint64_t)v0;

}

const __CFString *createIPv6AddrStringFromData(void *a1)
{
  id v1;
  void *v2;
  const __CFString *IPv6AddrString;
  const __CFString *v4;
  _QWORD v6[2];

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v6[0] = 0;
    v6[1] = 0;
    if (objc_msgSend(v1, "length") == 16)
    {
      objc_msgSend(v2, "getBytes:length:", v6, 16);
      IPv6AddrString = createIPv6AddrString(v6);
    }
    else
    {
      IPv6AddrString = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<bad length %llu>"), objc_msgSend(v2, "length"));
    }
    v4 = IPv6AddrString;
  }
  else
  {
    v4 = CFSTR("<nil>");
  }

  return v4;
}

const __CFString *createSockaddrString(sockaddr *a1)
{
  unint64_t sa_len;
  uint64_t sa_family;
  const __CFString *v4;
  uint64_t v5;
  id v7;
  void *v8;
  int v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  char v21[2];
  char __str[57];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    sa_len = a1->sa_len;
    if (a1->sa_len)
    {
      sa_family = a1->sa_family;
      if ((_DWORD)sa_len != 1)
      {
        switch(a1->sa_family)
        {
          case 1u:
            if (sa_len < 3)
              return CFSTR("<invalid_un>");
            snprintf(__str, 7uLL, "%%.%lus", sa_len - 2);
            __str[6] = 0;
            v7 = objc_alloc(MEMORY[0x1E0CB3940]);
            v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", __str);
            v4 = (const __CFString *)objc_msgSend(v7, "initWithFormat:", v8, a1->sa_data);

            return v4;
          case 2u:
          case 0x1Eu:
            if (getnameinfo(a1, sa_len, __str, 0x39u, v21, 6u, 10))
              return CFSTR("<getnameinfo_fail>");
            v9 = *(unsigned __int16 *)v21;
            v10 = objc_alloc(MEMORY[0x1E0CB3940]);
            if (v9 == 48)
            {
              v5 = objc_msgSend(v10, "initWithUTF8String:", __str);
            }
            else
            {
              if (a1->sa_family == 2)
                v11 = CFSTR("%s:%s");
              else
                v11 = CFSTR("%s.%s");
              v5 = objc_msgSend(v10, "initWithFormat:", v11, __str, v21);
            }
            break;
          case 0x12u:
            if (sa_len < 8
              || a1->sa_data[3]
               + (unint64_t)a1->sa_data[4]
               + a1->sa_data[5]
               + 8 > sa_len)
            {
              return CFSTR("<invalid_dl>");
            }
            objc_msgSend(MEMORY[0x1E0CB37A0], "string");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            v14 = a1->sa_data[3];
            if (a1->sa_data[4])
            {
              v15 = &a1->sa_len + v14;
              objc_msgSend(v12, "appendFormat:", CFSTR("%x"), a1->sa_data[v14 + 6]);
              if (a1->sa_data[4] >= 2u)
              {
                v16 = 9;
                do
                {
                  objc_msgSend(v13, "appendFormat:", CFSTR(":%x"), v15[v16]);
                  v17 = v16 - 7;
                  ++v16;
                }
                while (v17 < a1->sa_data[4]);
              }
              LODWORD(v14) = a1->sa_data[3];
            }
            if ((_DWORD)v14)
            {
              if (objc_msgSend(v13, "length"))
                snprintf(__str, 8uLL, "%%%%%%.%us");
              else
                snprintf(__str, 8uLL, "%%.%us");
              __str[7] = 0;
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", __str);
              objc_msgSend(v13, "appendFormat:", v18, &a1->sa_data[6]);

            }
            else if (*(_WORD *)a1->sa_data)
            {
              if (objc_msgSend(v13, "length"))
                v19 = CFSTR("%%%d");
              else
                v19 = CFSTR("%d");
              objc_msgSend(v13, "appendFormat:", v19, *(unsigned __int16 *)a1->sa_data);
            }
            if (objc_msgSend(v13, "length"))
              v4 = v13;
            else
              v4 = CFSTR("<invalid_dl2>");

            return v4;
          default:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unsupported af: %u>"), a1->sa_family, v20);
            return (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
        return (const __CFString *)v5;
      }
    }
    else
    {
      sa_family = a1->sa_family;
      if (!a1->sa_family)
        return CFSTR("<EMPTY>");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid_%d_%d>"), sa_family, sa_len);
    return (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  return CFSTR("<NULL>");
}

const __CFString *createSockaddrStringFromData(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  sockaddr *v5;
  const __CFString *SockaddrString;
  const __CFString *v7;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "length");
    if (v3)
    {
      v4 = v3;
      v5 = (sockaddr *)objc_msgSend(v2, "bytes");
      if (v4 >= v5->sa_len)
        SockaddrString = createSockaddrString(v5);
      else
        SockaddrString = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<bad sa_len %hhu length %llu>"), v5->sa_len, v4);
    }
    else
    {
      SockaddrString = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<bad length %llu>"), 0);
    }
    v7 = SockaddrString;
  }
  else
  {
    v7 = CFSTR("<nil>");
  }

  return v7;
}

const __CFString *createStringFromNRTLVType(unsigned int a1)
{
  uint64_t v1;
  const __CFString *result;

  v1 = a1;
  result = CFSTR("Pad0");
  switch(a1)
  {
    case 0u:
      return result;
    case 1u:
      result = CFSTR("PadN");
      break;
    case 2u:
      result = CFSTR("UncompressedIP");
      break;
    case 3u:
      result = CFSTR("Encapsulated6LoWPAN");
      break;
    case 4u:
      result = CFSTR("IKEv2PointToPoint");
      break;
    case 5u:
      result = CFSTR("ControlMessage");
      break;
    case 0x64u:
      result = CFSTR("KnownIPv6Hdr_ESP");
      break;
    case 0x65u:
      result = CFSTR("KnownIPv6Hdr_ESP_ECT0");
      break;
    case 0x66u:
      result = CFSTR("KnownIPv6Hdr_TCP");
      break;
    case 0x67u:
      result = CFSTR("KnownIPv6Hdr_TCP_ECT0");
      break;
    case 0x68u:
      result = CFSTR("KnownIPv6Hdr_ESP_ClassC");
      break;
    case 0x69u:
      result = CFSTR("KnownIPv6Hdr_ESP_ClassC_ECT0");
      break;
    default:
      result = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%lld)"), v1);
      break;
  }
  return result;
}

const __CFString *createIPProtoString(unsigned int a1)
{
  uint64_t v1;
  const __CFString *result;

  v1 = a1;
  result = CFSTR("HOPOPTS");
  switch(a1)
  {
    case 0u:
      return result;
    case 1u:
      result = CFSTR("ICMP");
      break;
    case 2u:
      result = CFSTR("IGMP");
      break;
    case 3u:
      result = CFSTR("GGP");
      break;
    case 4u:
      result = CFSTR("IPV4");
      break;
    case 6u:
      result = CFSTR("TCP");
      break;
    case 7u:
      result = CFSTR("ST");
      break;
    case 8u:
      result = CFSTR("EGP");
      break;
    case 9u:
      result = CFSTR("PIGP");
      break;
    case 0xAu:
      result = CFSTR("RCCMON");
      break;
    case 0xBu:
      result = CFSTR("NVPII");
      break;
    case 0xCu:
      result = CFSTR("PUP");
      break;
    case 0xDu:
      result = CFSTR("ARGUS");
      break;
    case 0xEu:
      result = CFSTR("EMCON");
      break;
    case 0xFu:
      result = CFSTR("XNET");
      break;
    case 0x10u:
      result = CFSTR("CHAOS");
      break;
    case 0x11u:
      result = CFSTR("UDP");
      break;
    case 0x12u:
      result = CFSTR("MUX");
      break;
    case 0x13u:
      result = CFSTR("MEAS");
      break;
    case 0x14u:
      result = CFSTR("HMP");
      break;
    case 0x15u:
      result = CFSTR("PRM");
      break;
    case 0x16u:
      result = CFSTR("IDP");
      break;
    case 0x17u:
      result = CFSTR("TRUNK1");
      break;
    case 0x18u:
      result = CFSTR("TRUNK2");
      break;
    case 0x19u:
      result = CFSTR("LEAF1");
      break;
    case 0x1Au:
      result = CFSTR("LEAF2");
      break;
    case 0x1Bu:
      result = CFSTR("RDP");
      break;
    case 0x1Cu:
      result = CFSTR("IRTP");
      break;
    case 0x1Du:
      result = CFSTR("TP");
      break;
    case 0x1Eu:
      result = CFSTR("BLT");
      break;
    case 0x1Fu:
      result = CFSTR("NSP");
      break;
    case 0x20u:
      result = CFSTR("INP");
      break;
    case 0x21u:
      result = CFSTR("SEP");
      break;
    case 0x22u:
      result = CFSTR("3PC");
      break;
    case 0x23u:
      result = CFSTR("IDPR");
      break;
    case 0x24u:
      result = CFSTR("XTP");
      break;
    case 0x25u:
      result = CFSTR("DDP");
      break;
    case 0x26u:
      result = CFSTR("CMTP");
      break;
    case 0x27u:
      result = CFSTR("TPXX");
      break;
    case 0x28u:
      result = CFSTR("IL");
      break;
    case 0x29u:
      result = CFSTR("IPV6");
      break;
    case 0x2Au:
      result = CFSTR("SDRP");
      break;
    case 0x2Bu:
      result = CFSTR("ROUTING");
      break;
    case 0x2Cu:
      result = CFSTR("FRAGMENT");
      break;
    case 0x2Du:
      result = CFSTR("IDRP");
      break;
    case 0x2Eu:
      result = CFSTR("RSVP");
      break;
    case 0x2Fu:
      result = CFSTR("GRE");
      break;
    case 0x30u:
      result = CFSTR("MHRP");
      break;
    case 0x31u:
      result = CFSTR("BHA");
      break;
    case 0x32u:
      result = CFSTR("ESP");
      break;
    case 0x33u:
      result = CFSTR("AH");
      break;
    case 0x34u:
      result = CFSTR("INLSP");
      break;
    case 0x35u:
      result = CFSTR("SWIPE");
      break;
    case 0x36u:
      result = CFSTR("NHRP");
      break;
    case 0x3Au:
      result = CFSTR("ICMPV6");
      break;
    case 0x3Bu:
      result = CFSTR("NONE");
      break;
    case 0x3Cu:
      result = CFSTR("DSTOPTS");
      break;
    case 0x3Du:
      result = CFSTR("AHIP");
      break;
    case 0x3Eu:
      result = CFSTR("CFTP");
      break;
    case 0x3Fu:
      result = CFSTR("HELLO");
      break;
    case 0x40u:
      result = CFSTR("SATEXPAK");
      break;
    case 0x41u:
      result = CFSTR("KRYPTOLAN");
      break;
    case 0x42u:
      result = CFSTR("RVD");
      break;
    case 0x43u:
      result = CFSTR("IPPC");
      break;
    case 0x44u:
      result = CFSTR("ADFS");
      break;
    case 0x45u:
      result = CFSTR("SATMON");
      break;
    case 0x46u:
      result = CFSTR("VISA");
      break;
    case 0x47u:
      result = CFSTR("IPCV");
      break;
    case 0x48u:
      result = CFSTR("CPNX");
      break;
    case 0x49u:
      result = CFSTR("CPHB");
      break;
    case 0x4Au:
      result = CFSTR("WSN");
      break;
    case 0x4Bu:
      result = CFSTR("PVP");
      break;
    case 0x4Cu:
      result = CFSTR("BRSATMON");
      break;
    case 0x4Du:
      result = CFSTR("ND");
      break;
    case 0x4Eu:
      result = CFSTR("WBMON");
      break;
    case 0x4Fu:
      result = CFSTR("WBEXPAK");
      break;
    case 0x50u:
      result = CFSTR("EON");
      break;
    case 0x51u:
      result = CFSTR("VMTP");
      break;
    case 0x52u:
      result = CFSTR("SVMTP");
      break;
    case 0x53u:
      result = CFSTR("VINES");
      break;
    case 0x54u:
      result = CFSTR("TTP");
      break;
    case 0x55u:
      result = CFSTR("IGP");
      break;
    case 0x56u:
      result = CFSTR("DGP");
      break;
    case 0x57u:
      result = CFSTR("TCF");
      break;
    case 0x58u:
      result = CFSTR("IGRP");
      break;
    case 0x59u:
      result = CFSTR("OSPFIGP");
      break;
    case 0x5Au:
      result = CFSTR("SRPC");
      break;
    case 0x5Bu:
      result = CFSTR("LARP");
      break;
    case 0x5Cu:
      result = CFSTR("MTP");
      break;
    case 0x5Du:
      result = CFSTR("AX25");
      break;
    case 0x5Eu:
      result = CFSTR("IPEIP");
      break;
    case 0x5Fu:
      result = CFSTR("MICP");
      break;
    case 0x60u:
      result = CFSTR("SCCSP");
      break;
    case 0x61u:
      result = CFSTR("ETHERIP");
      break;
    case 0x62u:
      result = CFSTR("ENCAP");
      break;
    case 0x63u:
      result = CFSTR("APES");
      break;
    case 0x64u:
      result = CFSTR("GMTP");
      break;
    case 0x67u:
      result = CFSTR("PIM");
      break;
    case 0x6Cu:
      result = CFSTR("IPCOMP");
      break;
    case 0x71u:
      result = CFSTR("PGM");
      break;
    case 0x84u:
      result = CFSTR("SCTP");
      break;
    default:
      result = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("IPProto(%u)"), v1);
      break;
  }
  return result;
}

void *createIOVecString(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  void *v5;
  _DWORD *v6;
  id v7;
  uint64_t v8;
  unsigned int v9;

  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("ioVec[%u]{"), a2);
  if (a2)
  {
    v6 = (_DWORD *)(a1 + 8);
    do
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v8 = *((_QWORD *)v6 - 1);
      v9 = *v6;
      v6 += 4;
      objc_msgSend(v5, "appendFormat:", CFSTR("%p:%@%u;"), v8, v7, v9);

      --v4;
    }
    while (v4);
  }
  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

void *createIOVecStringWithContents(uint64_t a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  unsigned __int8 **v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v14;

  v14 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("ioVec[%u]{"), a2);
  if (a2)
  {
    v5 = 0;
    do
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      objc_msgSend(v6, "appendFormat:", CFSTR("("));
      v7 = (unsigned __int8 **)(a1 + 16 * v5);
      v9 = (unsigned int *)(v7 + 1);
      v8 = *((_DWORD *)v7 + 2);
      if (v8 >= 4)
        v8 = 4;
      if (v8)
      {
        objc_msgSend(v6, "appendFormat:", CFSTR("%s%02x"), "", **v7);
        v10 = *v9;
        if (*v9 >= 4)
          v10 = 4;
        if (v10 >= 2)
        {
          v11 = 1;
          do
          {
            objc_msgSend(v6, "appendFormat:", CFSTR("%s%02x"), " ", (*v7)[v11++]);
            v12 = *v9;
            if (*v9 >= 4)
              v12 = 4;
          }
          while (v12 > v11);
        }
      }
      objc_msgSend(v6, "appendFormat:", CFSTR("):"));
      objc_msgSend(v4, "appendFormat:", CFSTR("%p:%@%u;"), *(_QWORD *)(a1 + 16 * v5), v6, *v9);

      ++v5;
    }
    while (v5 != v14);
  }
  objc_msgSend(v4, "appendString:", CFSTR("}"));
  return v4;
}

BOOL isPacketValidIPv6(_BYTE *a1, unsigned int a2)
{
  _BOOL8 result;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = 0;
  if (a1 && a2)
  {
    if (a2 <= 0x27)
    {
      if (!gNRPacketLoggingEnabled)
        return 0;
      v4 = nrCopyLogObj_1712();
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v5 = v4;
        v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

        if (!v6)
          return 0;
      }
      v7 = nrCopyLogObj_1712();
      _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d Packet too short for determining address family", v8, v9, v10, v11, v12, (uint64_t)"");

      return 0;
    }
    return (*a1 & 0xF0) == 96;
  }
  return result;
}

id nrCopyLogObj_1712()
{
  if (nrCopyLogObj_onceToken_1533 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_1533, &__block_literal_global_1534);
  return (id)nrCopyLogObj_sNRLogObj_1535;
}

uint64_t getDSCPFromPacket(_BYTE *a1, unsigned int a2)
{
  uint64_t result;

  result = isPacketValidIPv6(a1, a2);
  if ((_DWORD)result)
    return (bswap32(*(_DWORD *)a1) >> 22) & 0x3F;
  return result;
}

uint64_t getESPSPIFromPacket(uint64_t a1, unsigned int a2)
{
  if (isPacketValidIPv6((_BYTE *)a1, a2) && isNextHeaderValidESP(a1, a2))
    return bswap32(*(_DWORD *)(a1 + 40));
  else
    return 0;
}

BOOL isNextHeaderValidESP(uint64_t a1, unsigned int a2)
{
  _BOOL8 result;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = 0;
  if (a1 && a2)
  {
    if (a2 <= 0x28)
    {
      if (!gNRPacketLoggingEnabled)
        return 0;
      v5 = nrCopyLogObj_1712();
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v6 = v5;
        v7 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

        if (!v7)
          return 0;
      }
      v8 = nrCopyLogObj_1712();
      _NRLogWithArgs((uint64_t)v8, 1, (uint64_t)"%s%.30s:%-4d Packet too short for determining next header", v9, v10, v11, v12, v13, (uint64_t)"");

      return 0;
    }
    return *(_BYTE *)(a1 + 6) == 50 && a2 > 0x2F;
  }
  return result;
}

uint64_t getESPSequenceNumberFromPacket(uint64_t a1, unsigned int a2)
{
  if (isPacketValidIPv6((_BYTE *)a1, a2) && isNextHeaderValidESP(a1, a2))
    return bswap32(*(_DWORD *)(a1 + 44));
  else
    return 0;
}

uint64_t createPacketString(unsigned __int8 *a1, uint64_t a2)
{
  __CFString *v2;
  __int16 v3;
  id v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  unsigned int v15;
  id v16;
  __CFString *IPv6AddrString;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *IPProtoString;
  id v22;
  __CFString *v23;

  v2 = CFSTR("nil");
  if (a1)
  {
    v3 = a2;
    if ((_DWORD)a2)
    {
      if (a2 <= 0x27)
        return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("IPv%u too short %u"), *a1 >> 4, a2);
      v6 = objc_alloc(MEMORY[0x1E0CB37A0]);
      v7 = *a1 >> 4;
      if ((_DWORD)v7 == 6)
      {
        v8 = *(_DWORD *)a1;
        v9 = (bswap32(*(_DWORD *)a1) >> 22) & 0x3F;
        v10 = &stru_1EA3F8020;
        if ((_DWORD)v9)
        {
          v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DSCP:0x%02x "), v9);
          v8 = *(_DWORD *)a1;
        }
        else
        {
          v23 = &stru_1EA3F8020;
        }
        v12 = CFSTR("CE ");
        if ((v8 & 0x1000) != 0)
        {
          v13 = CFSTR("ECT(1) ");
        }
        else
        {
          v12 = CFSTR("ECT(0) ");
          v13 = &stru_1EA3F8020;
        }
        if ((v8 & 0x2000) != 0)
          v14 = v12;
        else
          v14 = v13;
        v15 = v8 & 0xFFFF0F00;
        v22 = v6;
        if (v15)
          v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FlowLabel:0x%03x "), bswap32(v15));
        v16 = objc_alloc(MEMORY[0x1E0CB3940]);
        IPv6AddrString = (__CFString *)createIPv6AddrString((_DWORD *)a1 + 2);
        v18 = (__CFString *)createIPv6AddrString((_DWORD *)a1 + 6);
        v19 = a1[7];
        v20 = bswap32(*((unsigned __int16 *)a1 + 2)) >> 16;
        IPProtoString = (__CFString *)createIPProtoString(a1[6]);
        v11 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@ -> %@ hlim %u %@%@%@len %u %@"), IPv6AddrString, v18, v19, v23, v14, v10, v20, IPProtoString);

        v6 = v22;
      }
      else
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("IPv%u"), v7);
      }
      v2 = (__CFString *)objc_msgSend(v6, "initWithString:", v11);

      if ((v3 & 0xFFF8) != 0x28 && a1[6] == 50)
        -[__CFString appendFormat:](v2, "appendFormat:", CFSTR(" SPI 0x%08x seq %u"), bswap32(*((_DWORD *)a1 + 10)), bswap32(*((_DWORD *)a1 + 11)));
    }
  }
  return (uint64_t)v2;
}

uint64_t nrTLVToPacket(uint64_t a1, uint64_t a2, _OWORD *a3, unsigned int a4, uint64_t a5, uint64_t a6, _OWORD *a7, _OWORD *a8)
{
  unsigned int v9;
  unsigned int v10;
  _OWORD *v12;
  char *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  size_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int16 v27;
  id v28;
  __CFString *StringFromNRTLVType;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  _OWORD *v40;
  _OWORD *v41;
  unsigned int v42;
  size_t v43;
  unsigned int v44;
  char *v45;
  int v46;
  unsigned int v47;
  char v48;
  int v49;
  char v50;
  unsigned int v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  size_t v65;
  NSObject *v67;
  NSObject *v68;
  _BOOL4 v69;
  NSObject *v70;
  NSObject *v71;
  _BOOL4 v72;
  NSObject *v73;
  NSObject *v74;
  _BOOL4 v75;
  NSObject *v76;
  NSObject *v77;
  _BOOL4 v78;
  NSObject *v79;
  NSObject *v80;
  _BOOL4 v81;
  NSObject *v82;
  NSObject *v83;
  _BOOL4 v84;
  NSObject *v85;
  NSObject *v86;
  _BOOL4 v87;
  NSObject *v88;
  NSObject *v89;
  __int16 v90;
  NSObject *v91;
  NSObject *v92;
  int v93;
  uint64_t v94;
  NSObject *v95;
  NSObject *v96;
  int v97;
  NSObject *v98;
  NSObject *v99;
  int v100;
  uint64_t v101;
  NSObject *v102;
  NSObject *v103;
  _BOOL4 v104;
  unsigned int v105;
  int v106;
  NSObject *v107;
  NSObject *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  NSObject *v116;
  _BOOL4 v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  NSObject *v125;
  _BOOL4 v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  NSObject *v134;
  _BOOL4 v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSObject *v142;
  NSObject *v143;
  _BOOL4 v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  id v165;
  __int16 v166;
  NSObject *v167;
  NSObject *v168;
  int v169;
  uint64_t v170;
  int v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  int v181;
  int v182;
  int v183;
  id v184;
  _BOOL4 v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  _BOOL4 v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  _BOOL4 v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  _BOOL4 v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  id v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  id v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *IOVecString;
  id v237;
  unsigned int v238;
  int v239;
  int v240;
  _BOOL4 v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  int v247;
  unsigned __int8 *v248;
  __int16 v249;
  uint64_t v250;
  int v251;
  unsigned __int8 *v252;
  int v253;
  int v254;
  NSObject *v255;
  NSObject *v256;
  _BOOL4 v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  id v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  _BOOL4 v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  __CFString *v276;
  __CFString *v277;
  void *v278;
  void *PacketString;
  void *v280;
  void *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t *v285;
  uint64_t v286;
  uint64_t *v287;
  uint64_t v288;
  uint64_t v289;
  char *v290;
  _BYTE v291[42];
  uint64_t v292;

  v9 = a4;
  v10 = a2;
  v292 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a3 == 2)
  {
    if (a6 < a4)
    {
      LOWORD(v9) = 0;
      return (unsigned __int16)v9;
    }
    if (!a4)
      return (unsigned __int16)v9;
    if (a1)
    {
      if ((_DWORD)a2)
      {
        if (a5)
        {
          v14 = 0;
          v15 = 0;
          v16 = 16 * a2;
          v17 = 3;
          while (1)
          {
            v18 = *(_DWORD *)(a1 + v14 + 8);
            if (!v17)
              goto LABEL_23;
            if (v17 <= v18)
              break;
            v17 -= v18;
LABEL_19:
            v14 += 16;
            if (v16 == v14)
              goto LABEL_28;
          }
          if (v17 < v18)
          {
LABEL_23:
            v19 = v18 - v17;
            if (v19 >= v9 - v15)
              v20 = v9 - v15;
            else
              v20 = v19;
            memcpy((void *)(a5 + v15), (const void *)(*(_QWORD *)(a1 + v14) + v17), v20);
            v15 += v20;
            if (v15 >= v9)
            {
LABEL_28:
              if (v15 == v9)
                return (unsigned __int16)v9;
              v142 = nrCopyLogObj_1712();
              v143 = v142;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v144 = os_log_type_enabled(v142, OS_LOG_TYPE_ERROR);

                if (!v144)
                {
LABEL_222:
                  _os_log_pack_size();
                  MEMORY[0x1E0C80A78]();
                  __error();
                  v235 = _os_log_pack_fill();
                  IOVecString = createIOVecString(a1, v10);
                  __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v235, (uint64_t)"nrWriteIOVecToBuffer", v15, v9, 3, (uint64_t)IOVecString);
                  v237 = nrCopyLogObj_1712();
                  _NRLogAbortWithPack(v237);
                }
              }
              v229 = nrCopyLogObj_1712();
              v280 = createIOVecString(a1, v10);
              _NRLogWithArgs((uint64_t)v229, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%"
                         "u), offset: %u, ioVec: %@",
                v230,
                v231,
                v232,
                v233,
                v234,
                (uint64_t)"");

              goto LABEL_222;
            }
          }
          v17 = 0;
          goto LABEL_19;
        }
        v133 = nrCopyLogObj_1712();
        v134 = v133;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v135 = os_log_type_enabled(v133, OS_LOG_TYPE_ERROR);

          if (!v135)
            goto LABEL_219;
        }
        v223 = nrCopyLogObj_1712();
        _NRLogWithArgs((uint64_t)v223, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (outBuffer) != ((void *)0)", v224, v225, v226, v227, v228, (uint64_t)"");

      }
      else
      {
        v124 = nrCopyLogObj_1712();
        v125 = v124;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v126 = os_log_type_enabled(v124, OS_LOG_TYPE_ERROR);

          if (!v126)
            goto LABEL_219;
        }
        v217 = nrCopyLogObj_1712();
        _NRLogWithArgs((uint64_t)v217, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v218, v219, v220, v221, v222, (uint64_t)"");

      }
    }
    else
    {
      v115 = nrCopyLogObj_1712();
      v116 = v115;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v117 = os_log_type_enabled(v115, OS_LOG_TYPE_ERROR);

        if (!v117)
          goto LABEL_219;
      }
      v211 = nrCopyLogObj_1712();
      _NRLogWithArgs((uint64_t)v211, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (ioVecs) != ((void *)0)", v212, v213, v214, v215, v216, (uint64_t)"");

    }
LABEL_219:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v163 = _os_log_pack_fill();
    *(_DWORD *)v163 = 136446210;
    v164 = "nrWriteIOVecToBuffer";
LABEL_184:
    *(_QWORD *)(v163 + 4) = v164;
    v165 = nrCopyLogObj_1712();
    _NRLogAbortWithPack(v165);
  }
  if (!a1)
  {
    v67 = nrCopyLogObj_1712();
    v68 = v67;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v69 = os_log_type_enabled(v67, OS_LOG_TYPE_ERROR);

      if (!v69)
        goto LABEL_183;
    }
    v109 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v109, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (ioVecs) != ((void *)0)", v110, v111, v112, v113, v114, (uint64_t)"");

LABEL_183:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v163 = _os_log_pack_fill();
    *(_DWORD *)v163 = 136446210;
    v164 = "nr6LoWPANTLVToPacket";
    goto LABEL_184;
  }
  if (!(_DWORD)a2)
  {
    v70 = nrCopyLogObj_1712();
    v71 = v70;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v72 = os_log_type_enabled(v70, OS_LOG_TYPE_ERROR);

      if (!v72)
        goto LABEL_183;
    }
    v118 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v118, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v119, v120, v121, v122, v123, (uint64_t)"");

    goto LABEL_183;
  }
  if (!a4)
  {
    v73 = nrCopyLogObj_1712();
    v74 = v73;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v75 = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);

      if (!v75)
        goto LABEL_183;
    }
    v127 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v127, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: tlvLen > 0", v128, v129, v130, v131, v132, (uint64_t)"");

    goto LABEL_183;
  }
  if (!a5)
  {
    v76 = nrCopyLogObj_1712();
    v77 = v76;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v78 = os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);

      if (!v78)
        goto LABEL_183;
    }
    v136 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v136, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (packetBuffer) != ((void *)0)", v137, v138, v139, v140, v141, (uint64_t)"");

    goto LABEL_183;
  }
  if (a6 <= 0x27)
  {
    v79 = nrCopyLogObj_1712();
    v80 = v79;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v81 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);

      if (!v81)
        goto LABEL_183;
    }
    v145 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v145, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: packetLength >= sizeof(NRIPv6Hdr_s)", v146, v147, v148, v149, v150, (uint64_t)"");

    goto LABEL_183;
  }
  if (!a7)
  {
    v82 = nrCopyLogObj_1712();
    v83 = v82;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v84 = os_log_type_enabled(v82, OS_LOG_TYPE_ERROR);

      if (!v84)
        goto LABEL_183;
    }
    v151 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v151, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (srcAddr) != ((void *)0)", v152, v153, v154, v155, v156, (uint64_t)"");

    goto LABEL_183;
  }
  if (!a8)
  {
    v85 = nrCopyLogObj_1712();
    v86 = v85;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v87 = os_log_type_enabled(v85, OS_LOG_TYPE_ERROR);

      if (!v87)
        goto LABEL_183;
    }
    v157 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v157, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (dstAddr) != ((void *)0)", v158, v159, v160, v161, v162, (uint64_t)"");

    goto LABEL_183;
  }
  v12 = a3;
  v289 = a2;
  v286 = a6;
  v287 = &v282;
  switch((int)a3)
  {
    case 'd':
      v13 = &nrKnownIPv6HdrESP;
      goto LABEL_66;
    case 'e':
      v13 = &nrKnownIPv6HdrESP_ECT0;
      goto LABEL_66;
    case 'f':
      v13 = &nrKnownIPv6HdrTCP;
      goto LABEL_66;
    case 'g':
      v13 = &nrKnownIPv6HdrTCP_ECT0;
      goto LABEL_66;
    case 'h':
      v13 = &nrKnownIPv6HdrESP_ClassC;
      goto LABEL_66;
    case 'i':
      v13 = &nrKnownIPv6HdrESP_ClassC_ECT0;
      goto LABEL_66;
    default:
      if ((_DWORD)a3 != 3)
      {
        if (nrCopyLogObj_onceToken_1533 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1533, &__block_literal_global_1534);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1535, OS_LOG_TYPE_FAULT))
        {
          v28 = (id)nrCopyLogObj_sNRLogObj_1535;
          StringFromNRTLVType = (__CFString *)createStringFromNRTLVType(v12);
          _NRLogWithArgs((uint64_t)v28, 17, (uint64_t)"unexpected tlvType %@", v30, v31, v32, v33, v34, (uint64_t)StringFromNRTLVType);

          v27 = 0;
          goto LABEL_102;
        }
        goto LABEL_210;
      }
      if (a4 <= 1)
      {
        if (nrCopyLogObj_onceToken_1533 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_1533, &__block_literal_global_1534);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1535, OS_LOG_TYPE_ERROR))
        {
          v21 = nrCopyLogObj_1712();
          _NRLogWithArgs((uint64_t)v21, 16, (uint64_t)"%s%.30s:%-4d received 6LoWPAN TLV too short %u", v22, v23, v24, v25, v26, (uint64_t)"");
LABEL_37:

          v27 = 0;
          goto LABEL_102;
        }
LABEL_210:
        v27 = 0;
        goto LABEL_102;
      }
      v286 = a6;
      v287 = &v282;
      v285 = &v282;
      v35 = 0;
      v36 = 0;
      if (a4 >= 0x2A)
        v37 = 42;
      else
        v37 = a4;
      v288 = 16 * a2;
      v38 = 3;
      break;
  }
  while (1)
  {
    v39 = *(_DWORD *)(a1 + v35 + 8);
    if (!v38)
      break;
    if (v38 <= v39)
    {
      if (v38 >= v39)
      {
        v38 = 0;
        goto LABEL_53;
      }
      break;
    }
    v38 -= v39;
LABEL_53:
    v35 += 16;
    if (v288 == v35)
      goto LABEL_64;
  }
  v40 = a7;
  v41 = v12;
  v12 = a8;
  v42 = v39 - v38;
  if (v42 >= v37 - v36)
    v43 = v37 - v36;
  else
    v43 = v42;
  memcpy(&v291[v36], (const void *)(*(_QWORD *)(a1 + v35) + v38), v43);
  v36 += v43;
  if (v36 < v37)
  {
    v38 = 0;
    a8 = v12;
    v12 = v41;
    a7 = v40;
    goto LABEL_53;
  }
  a8 = v12;
  LODWORD(v12) = (_DWORD)v41;
  a7 = v40;
LABEL_64:
  if (v36 != v37)
  {
    v255 = nrCopyLogObj_1712();
    v256 = v255;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v257 = os_log_type_enabled(v255, OS_LOG_TYPE_ERROR);

      if (!v257)
        goto LABEL_252;
    }
    v263 = nrCopyLogObj_1712();
    v281 = createIOVecString(a1, v289);
    _NRLogWithArgs((uint64_t)v263, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%u), offset: %u, ioVec: %@",
      v264,
      v265,
      v266,
      v267,
      v268,
      (uint64_t)"");

LABEL_252:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v269 = _os_log_pack_fill();
    v179 = createIOVecString(a1, v289);
    v180 = v269;
    v181 = v36;
    v182 = v37;
    v183 = 3;
LABEL_203:
    __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v180, (uint64_t)"nrWriteIOVecToBuffer", v181, v182, v183, (uint64_t)v179);
    v184 = nrCopyLogObj_1712();
    _NRLogAbortWithPack(v184);
  }
  v13 = v291;
LABEL_66:
  v290 = v13;
  if ((*v13 & 0xE0) != 0x60)
  {
    v88 = nrCopyLogObj_1712();
    v89 = v88;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v185 = os_log_type_enabled(v88, OS_LOG_TYPE_ERROR);

      if (!v185)
        goto LABEL_249;
    }
    v186 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v186, 16, (uint64_t)"%s%.30s:%-4d received unknown 6LoWPAN dispatch %u", v187, v188, v189, v190, v191, (uint64_t)"");
    goto LABEL_248;
  }
  if (v13[1] < 0)
    v44 = 3;
  else
    v44 = 2;
  v45 = &v13[v44];
  *(_DWORD *)a5 = 96;
  v46 = (*v13 >> 3) & 3;
  switch(v46)
  {
    case 3:
      v47 = 0;
      break;
    case 0:
      v90 = *(_WORD *)(v45 + 1);
      *(_BYTE *)(a5 + 3) = v45[3];
      *(_WORD *)(a5 + 1) = v90;
      v47 = 4;
      goto LABEL_224;
    case 1:
      v166 = *(_WORD *)v45;
      *(_BYTE *)(a5 + 3) = v45[2];
      *(_WORD *)(a5 + 1) = v166;
      if (*v45 < 0)
      {
        *(_DWORD *)a5 |= 0x2000u;
        v47 = 3;
        if ((*v45 & 0x40) != 0)
          goto LABEL_242;
      }
      else
      {
        v47 = 3;
        if ((*v45 & 0x40) != 0)
        {
LABEL_242:
          v238 = 4096;
          goto LABEL_225;
        }
      }
      break;
    default:
      v47 = 1;
LABEL_224:
      v238 = bswap32(*v45 << 20);
LABEL_225:
      *(_DWORD *)a5 |= v238;
      break;
  }
  v48 = *v13;
  if ((*v13 & 4) != 0)
  {
    v91 = nrCopyLogObj_1712();
    v92 = v91;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v192 = os_log_type_enabled(v91, OS_LOG_TYPE_ERROR);

      if (!v192)
        goto LABEL_210;
    }
    v21 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v21, 16, (uint64_t)"%s%.30s:%-4d can't handle NH=1 yet", v193, v194, v195, v196, v197, (uint64_t)"");
    goto LABEL_37;
  }
  *(_BYTE *)(a5 + 6) = v45[v47];
  v288 = v47 + 1;
  v49 = v48 & 3;
  if (v49 == 2)
  {
    v50 = 64;
    goto LABEL_74;
  }
  if (v49)
  {
    if (v49 == 1)
      v50 = 1;
    else
      v50 = -1;
LABEL_74:
    *(_BYTE *)(a5 + 7) = v50;
  }
  else
  {
    *(_BYTE *)(a5 + 7) = v45[v288];
    v288 = v47 + 2;
  }
  v51 = v13[1];
  v52 = (v51 >> 4) & 3;
  if ((v51 & 0x40) != 0)
  {
    if (v52 == 3)
    {
LABEL_77:
      *(_OWORD *)(a5 + 8) = *a7;
      goto LABEL_78;
    }
    if (!v52)
    {
      *(_QWORD *)(a5 + 8) = 0;
      *(_QWORD *)(a5 + 16) = 0;
      goto LABEL_78;
    }
    if (v52 != 1)
    {
      *(_OWORD *)(a5 + 8) = *a7;
      v239 = v288;
      *(_WORD *)(a5 + 16) = *(_WORD *)&v45[v288];
      goto LABEL_228;
    }
    *(_QWORD *)(a5 + 8) = *(_QWORD *)a7;
LABEL_196:
    v169 = v288;
    *(_QWORD *)(a5 + 16) = *(_QWORD *)&v45[v288];
    v170 = (v169 + 8);
  }
  else
  {
    switch(v52)
    {
      case 3:
        goto LABEL_77;
      case 0:
        v97 = v288;
        *(_OWORD *)(a5 + 8) = *(_OWORD *)&v45[v288];
        v288 = v97 | 0x10u;
        goto LABEL_78;
      case 1:
        *(_WORD *)(a5 + 8) = -32514;
        *(_DWORD *)(a5 + 10) = 0;
        *(_WORD *)(a5 + 14) = 0;
        goto LABEL_196;
    }
    *(_WORD *)(a5 + 8) = -32514;
    *(_QWORD *)(a5 + 10) = 0;
    *(_WORD *)(a5 + 19) = -257;
    *(_BYTE *)(a5 + 21) = 0;
    v239 = v288;
    *(_WORD *)(a5 + 22) = *(_WORD *)&v45[v288];
LABEL_228:
    v170 = (v239 + 2);
  }
  v288 = v170;
LABEL_78:
  v53 = v13[1] & 3;
  if ((v13[1] & 8) != 0)
  {
    if ((v13[1] & 4) == 0)
    {
      if (v53 == 2)
      {
        *(_BYTE *)(a5 + 24) = -1;
        v247 = v288;
        v248 = (unsigned __int8 *)&v45[v288];
        *(_BYTE *)(a5 + 25) = *v248;
        *(_QWORD *)(a5 + 26) = 0;
        *(_DWORD *)(a5 + 33) = 0;
        v249 = *(_WORD *)(v248 + 1);
        *(_BYTE *)(a5 + 39) = v248[3];
        *(_WORD *)(a5 + 37) = v249;
        v250 = (v247 + 4);
      }
      else
      {
        if (v53 != 1)
        {
          if ((v13[1] & 3) != 0)
          {
            *(_QWORD *)(a5 + 31) = 0;
            *(_QWORD *)(a5 + 24) = 767;
            v254 = v288;
            *(_BYTE *)(a5 + 39) = v45[v288];
            v94 = (v254 + 1);
          }
          else
          {
            v93 = v288;
            *(_OWORD *)(a5 + 24) = *(_OWORD *)&v45[v288];
            v94 = (v93 + 16);
          }
          v288 = v94;
          v54 = v286;
          goto LABEL_82;
        }
        *(_BYTE *)(a5 + 24) = -1;
        v251 = v288;
        v252 = (unsigned __int8 *)&v45[v288];
        *(_BYTE *)(a5 + 25) = *v252;
        *(_QWORD *)(a5 + 26) = 0;
        *(_BYTE *)(a5 + 34) = 0;
        v253 = *(_DWORD *)(v252 + 1);
        *(_BYTE *)(a5 + 39) = v252[5];
        *(_DWORD *)(a5 + 35) = v253;
        v250 = (v251 + 6);
      }
      v288 = v250;
      v54 = v286;
      goto LABEL_82;
    }
    v167 = nrCopyLogObj_1712();
    v168 = v167;
    if (sNRCopyLogToStdErr)
    {

      if (!v53)
        goto LABEL_247;
    }
    else
    {
      v241 = os_log_type_enabled(v167, OS_LOG_TYPE_ERROR);

      if (!v53)
      {
        if (!v241)
          goto LABEL_249;
LABEL_247:
        v186 = nrCopyLogObj_1712();
        _NRLogWithArgs((uint64_t)v186, 16, (uint64_t)"%s%.30s:%-4d can't handle M=1 DAC=1 DAM=00 yet", v258, v259, v260, v261, v262, (uint64_t)"");
        goto LABEL_248;
      }
      if (!v241)
        goto LABEL_249;
    }
    v186 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v186, 16, (uint64_t)"%s%.30s:%-4d M=1 DAC=1 DAM!=00 is reserved", v242, v243, v244, v245, v246, (uint64_t)"");
    goto LABEL_248;
  }
  v54 = v286;
  if ((v13[1] & 4) == 0)
  {
    if (v53 == 3)
      goto LABEL_81;
    if ((v13[1] & 3) == 0)
    {
      v100 = v288;
      *(_OWORD *)(a5 + 24) = *(_OWORD *)&v45[v288];
      v101 = (v100 + 16);
      goto LABEL_232;
    }
    if (v53 == 1)
    {
      *(_WORD *)(a5 + 24) = -32514;
      *(_DWORD *)(a5 + 26) = 0;
      *(_WORD *)(a5 + 30) = 0;
      goto LABEL_199;
    }
    *(_WORD *)(a5 + 24) = -32514;
    *(_QWORD *)(a5 + 26) = 0;
    *(_WORD *)(a5 + 35) = -257;
    *(_BYTE *)(a5 + 37) = 0;
    v240 = v288;
    *(_WORD *)(a5 + 38) = *(_WORD *)&v45[v288];
LABEL_231:
    v101 = (v240 + 2);
    goto LABEL_232;
  }
  if (v53 == 3)
  {
LABEL_81:
    *(_OWORD *)(a5 + 24) = *a8;
  }
  else
  {
    if ((v13[1] & 3) == 0)
    {
      v98 = nrCopyLogObj_1712();
      v99 = v98;
      if (sNRCopyLogToStdErr)
      {

        goto LABEL_260;
      }
      v270 = os_log_type_enabled(v98, OS_LOG_TYPE_ERROR);

      if (v270)
      {
LABEL_260:
        v186 = nrCopyLogObj_1712();
        _NRLogWithArgs((uint64_t)v186, 16, (uint64_t)"%s%.30s:%-4d M=0 DAC=1 DAM=00 is reserved", v271, v272, v273, v274, v275, (uint64_t)"");
LABEL_248:

      }
LABEL_249:
      v27 = 0;
      goto LABEL_102;
    }
    if (v53 != 1)
    {
      *(_OWORD *)(a5 + 24) = *a8;
      v240 = v288;
      *(_WORD *)(a5 + 32) = *(_WORD *)&v45[v288];
      goto LABEL_231;
    }
    *(_QWORD *)(a5 + 24) = *(_QWORD *)a8;
LABEL_199:
    v171 = v288;
    *(_QWORD *)(a5 + 32) = *(_QWORD *)&v45[v288];
    v101 = (v171 + 8);
LABEL_232:
    v288 = v101;
  }
LABEL_82:
  v55 = v44 + v288;
  if ((_DWORD)v12 != 3)
    v55 = 0;
  *(_WORD *)(a5 + 4) = bswap32(v9 - v55) >> 16;
  v27 = v9 - v55 + 40;
  if (v27 > v54)
  {
    v95 = nrCopyLogObj_1712();
    v96 = v95;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v198 = os_log_type_enabled(v95, OS_LOG_TYPE_ERROR);

      if (!v198)
        goto LABEL_210;
    }
    v21 = nrCopyLogObj_1712();
    v276 = (__CFString *)createStringFromNRTLVType(v12);
    _NRLogWithArgs((uint64_t)v21, 16, (uint64_t)"%s%.30s:%-4d packet too big %@ tlvLen=%u payloadLength=%u packetLength=%u", v199, v200, v201, v202, v203, (uint64_t)"");

    goto LABEL_37;
  }
  v284 = (unsigned __int16)(v9 - v55 + 40);
  if (v55 == v9)
    goto LABEL_101;
  v285 = &v282;
  LODWORD(v286) = v9 - v55 + 40;
  v56 = 0;
  v57 = 0;
  v58 = (v55 + 3);
  v59 = (unsigned __int16)(v9 - v55);
  if (v289 <= 1)
    v60 = 1;
  else
    v60 = v289;
  v61 = 16 * v60;
  v283 = v58;
  v62 = v58;
  while (2)
  {
    v63 = *(_DWORD *)(a1 + v56 + 8);
    if (v62)
    {
      if (v62 > v63)
      {
        v62 -= v63;
      }
      else
      {
        if (v62 < v63)
          break;
LABEL_99:
        v62 = 0;
      }
      v56 += 16;
      if (v61 == v56)
        goto LABEL_100;
      continue;
    }
    break;
  }
  v64 = v63 - v62;
  if (v64 >= v59 - v57)
    v65 = v59 - v57;
  else
    v65 = v64;
  memcpy((void *)(a5 + 40 + v57), (const void *)(*(_QWORD *)(a1 + v56) + v62), v65);
  v57 += v65;
  if (v57 < v59)
    goto LABEL_99;
LABEL_100:
  v27 = v286;
  if (v57 != v59)
  {
    v102 = nrCopyLogObj_1712();
    v103 = v102;
    if (sNRCopyLogToStdErr)
    {

      v105 = v289;
      v106 = v283;
    }
    else
    {
      v104 = os_log_type_enabled(v102, OS_LOG_TYPE_ERROR);

      v105 = v289;
      v106 = v283;
      if (!v104)
        goto LABEL_202;
    }
    v172 = nrCopyLogObj_1712();
    v278 = createIOVecString(a1, v105);
    _NRLogWithArgs((uint64_t)v172, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%u), offset: %u, ioVec: %@",
      v173,
      v174,
      v175,
      v176,
      v177,
      (uint64_t)"");

LABEL_202:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v178 = _os_log_pack_fill();
    v179 = createIOVecString(a1, v105);
    v180 = v178;
    v181 = v57;
    v182 = v59;
    v183 = v106;
    goto LABEL_203;
  }
LABEL_101:
  if (!gNRPacketLoggingEnabled)
    goto LABEL_102;
  v107 = nrCopyLogObj_1712();
  v108 = v107;
  if (sNRCopyLogToStdErr)
  {

    goto LABEL_212;
  }
  v204 = os_log_type_enabled(v107, OS_LOG_TYPE_INFO);

  if (v204)
  {
LABEL_212:
    v205 = nrCopyLogObj_1712();
    v277 = (__CFString *)NRDCreateIPHCString((unsigned __int16 *)&v290, (int)v288 + 2);
    PacketString = (void *)createPacketString((unsigned __int8 *)a5, v54);
    _NRLogWithArgs((uint64_t)v205, 1, (uint64_t)"%s%.30s:%-4d Decompressed 6LoWPAN data from %u to %u, %@ to %@", v206, v207, v208, v209, v210, (uint64_t)"");

  }
LABEL_102:
  LOWORD(v9) = v27;
  return (unsigned __int16)v9;
}

const __CFString *NRDCreateIPHCString(unsigned __int16 *a1, unsigned int a2)
{
  int v4;
  id v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unsigned __int8 *v24;
  unsigned int v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  if (!a1)
    return CFSTR("nil");
  v4 = bswap32(*a1);
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v6 = 48;
  if ((v4 & 0x20000) != 0)
    v7 = 49;
  else
    v7 = 48;
  v38 = v7;
  if ((v4 & 0x40000) != 0)
    v8 = 49;
  else
    v8 = 48;
  if ((v4 & 0x80000) != 0)
    v9 = 49;
  else
    v9 = 48;
  v36 = v9;
  v37 = v8;
  if ((v4 & 0x100000) != 0)
    v10 = 49;
  else
    v10 = 48;
  if ((v4 & 0x200000) != 0)
    v11 = 49;
  else
    v11 = 48;
  v34 = v11;
  v35 = v10;
  if ((v4 & 0x400000) != 0)
    v12 = 49;
  else
    v12 = 48;
  if ((v4 & 0x800000) != 0)
    v13 = 49;
  else
    v13 = 48;
  v32 = v13;
  v33 = v12;
  if ((v4 & 0x1000000) != 0)
    v14 = 49;
  else
    v14 = 48;
  if ((v4 & 0x2000000) != 0)
    v15 = 49;
  else
    v15 = 48;
  v30 = v15;
  v31 = v14;
  if ((v4 & 0x4000000) != 0)
    v16 = 49;
  else
    v16 = 48;
  if ((v4 & 0x8000000) != 0)
    v17 = 49;
  else
    v17 = 48;
  v28 = v17;
  v29 = v16;
  if ((v4 & 0x10000000) != 0)
    v18 = 49;
  else
    v18 = 48;
  if ((v4 & 0x20000000) != 0)
    v19 = 49;
  else
    v19 = 48;
  v27 = v18;
  if ((v4 & 0x40000000) != 0)
    v20 = 49;
  else
    v20 = 48;
  if (v4 >> 16 < 0)
    v6 = 49;
  v21 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[D%c%c%cTF%c%cNH%cHLIM%c%cCID%cSAC%cSAM%c%cM%cDAC%cDAM%c%c"), v6, v20, v19, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, HIWORD(v4) & 1 | 0x30);
  v22 = v21;
  if (a2 >= 3)
  {
    objc_msgSend(v21, "appendString:", CFSTR(" "));
    v23 = a2 - 2;
    v24 = (unsigned __int8 *)(a1 + 1);
    do
    {
      v25 = *v24++;
      objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v25);
      --v23;
    }
    while (v23);
  }
  objc_msgSend(v22, "appendString:", CFSTR("]"));
  return (const __CFString *)v22;
}

uint64_t nrMaxTLVLengthForPacket(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  if (!a1)
  {
    v3 = nrCopyLogObj_1712();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (!v5)
        goto LABEL_14;
    }
    v9 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (packetBuffer) != ((void *)0)", v10, v11, v12, v13, v14, (uint64_t)"");

    goto LABEL_14;
  }
  if (!a2)
  {
    v6 = nrCopyLogObj_1712();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v7 = v6;
      v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
      {
LABEL_14:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v21 = _os_log_pack_fill();
        *(_DWORD *)v21 = 136446210;
        *(_QWORD *)(v21 + 4) = "nrMaxTLVLengthForPacket";
        v22 = nrCopyLogObj_1712();
        _NRLogAbortWithPack(v22);
      }
    }
    v15 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: packetLength > 0", v16, v17, v18, v19, v20, (uint64_t)"");

    goto LABEL_14;
  }
  return (a2 + 5);
}

uint64_t nrMaxPacketLengthForTLV(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (!a2)
  {
    v3 = nrCopyLogObj_1712();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (!v5)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v12 = _os_log_pack_fill();
        *(_DWORD *)v12 = 136446210;
        *(_QWORD *)(v12 + 4) = "nrMaxPacketLengthForTLV";
        v13 = nrCopyLogObj_1712();
        _NRLogAbortWithPack(v13);
      }
    }
    v6 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v6, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: tlvLen > 0", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_8;
  }
  return (unsigned __int16)(a2 + 40);
}

uint64_t nrPacketToTLV(unsigned __int8 *a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unsigned __int8 *v10;
  int v11;
  unsigned int v12;
  unsigned __int8 *v13;
  _BOOL4 v15;
  unsigned __int8 *v16;
  _BOOL4 v18;
  unsigned int v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  int v23;
  char v24;
  char v25;
  int v26;
  int v28;
  unsigned int v29;
  BOOL v30;
  int v31;
  int v32;
  int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int *v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  size_t v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  unsigned int v50;
  size_t v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int *v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  size_t v58;
  uint64_t v59;
  unsigned int v60;
  int v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  unsigned int *v65;
  unsigned int v66;
  uint64_t v67;
  unsigned __int8 *v68;
  unsigned __int8 *v69;
  uint64_t v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned __int8 *v74;
  __int16 v75;
  uint64_t v76;
  unsigned int v77;
  unsigned __int8 *v78;
  uint64_t v79;
  _BYTE *v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int *v83;
  unsigned __int8 v84;
  unsigned int v85;
  uint64_t v86;
  unsigned int v87;
  unsigned int v88;
  size_t v89;
  int v90;
  NSObject *v92;
  NSObject *v93;
  const char *v94;
  _BOOL4 v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  NSObject *v104;
  _BOOL4 v105;
  NSObject *v106;
  NSObject *v107;
  _BOOL4 v108;
  NSObject *v109;
  NSObject *v110;
  _BOOL4 v111;
  NSObject *v112;
  NSObject *v113;
  _BOOL4 v114;
  NSObject *v115;
  NSObject *v116;
  _BOOL4 v117;
  NSObject *v118;
  NSObject *v119;
  _BOOL4 v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  NSObject *v124;
  NSObject *v125;
  NSObject *v126;
  NSObject *v127;
  NSObject *v128;
  _BYTE *v129;
  BOOL v130;
  NSObject *v131;
  NSObject *v132;
  _BOOL4 v133;
  NSObject *v134;
  NSObject *v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  NSObject *v174;
  NSObject *v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  NSObject *v183;
  NSObject *v184;
  _BOOL4 v185;
  _BOOL4 v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  _BOOL4 v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  _BOOL4 v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  _BOOL4 v206;
  id v207;
  __CFString *v208;
  char *v209;
  char *v210;
  unsigned int v211;
  unsigned int *v212;
  unsigned int v213;
  unsigned int v214;
  unsigned int v215;
  size_t v216;
  id v217;
  void *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  BOOL v224;
  id v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  NSObject *v231;
  NSObject *v232;
  _BOOL4 v233;
  NSObject *v234;
  NSObject *v235;
  _BOOL4 v236;
  NSObject *v237;
  NSObject *v238;
  _BOOL4 v239;
  _BOOL4 v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  _BOOL4 v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  unsigned int v252;
  unsigned int v253;
  unsigned int v254;
  unsigned int *v255;
  unsigned int v256;
  uint64_t v257;
  unsigned int v258;
  unsigned int v259;
  size_t v260;
  uint64_t v261;
  unsigned int v262;
  uint64_t v263;
  int v264;
  unsigned int v265;
  unsigned int *v266;
  unsigned int v267;
  uint64_t v268;
  unsigned __int8 *v269;
  unsigned __int8 *v270;
  uint64_t v271;
  NSObject *v272;
  NSObject *v273;
  _BOOL4 v274;
  int v275;
  __int16 v276;
  uint64_t v277;
  unsigned int v278;
  uint64_t v279;
  _BYTE *v280;
  id v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  id v287;
  NSObject *v288;
  NSObject *v289;
  _BOOL4 v290;
  NSObject *v291;
  NSObject *v292;
  _BOOL4 v293;
  id v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  id v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  id v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  id v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  id v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  NSObject *v326;
  NSObject *v327;
  _BOOL4 v328;
  NSObject *v329;
  NSObject *v330;
  _BOOL4 v331;
  NSObject *v332;
  NSObject *v333;
  _BOOL4 v334;
  id v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  id v343;
  id v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  id v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  void *v357;
  id v358;
  NSObject *v359;
  NSObject *v360;
  _BOOL4 v361;
  id v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  _BYTE *v368;
  NSObject *v369;
  NSObject *v370;
  _BOOL4 v371;
  NSObject *v372;
  NSObject *v373;
  _BOOL4 v374;
  NSObject *v375;
  NSObject *v376;
  _BOOL4 v377;
  NSObject *v378;
  NSObject *v379;
  _BOOL4 v380;
  uint64_t v381;
  id v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  NSObject *v388;
  NSObject *v389;
  _BOOL4 v390;
  NSObject *v391;
  NSObject *v392;
  _BOOL4 v393;
  id v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  id v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  id v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  id v414;
  id v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  id v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  void *v429;
  void *PacketString;
  void *v431;
  void *v432;
  void *v433;
  void *IOVecString;
  void *v435;
  void *v436;
  __CFString *v437;
  void *v438;
  __CFString *IPProtoString;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  int v444;
  unsigned int v445;
  uint64_t v446;
  uint64_t v447;
  void *v448;
  unsigned __int16 v450;
  __CFString *StringFromNRTLVType;
  uint64_t v453;
  __int16 v454;
  _OWORD v455[2];
  uint64_t v456;
  _DWORD v457[11];
  uint64_t v458;

  v458 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v103 = nrCopyLogObj_1712();
    v104 = v103;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v105 = os_log_type_enabled(v103, OS_LOG_TYPE_ERROR);

      if (!v105)
        goto LABEL_221;
    }
    v136 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v136, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (packetBuffer) != ((void *)0)", v137, v138, v139, v140, v141, (uint64_t)"");

LABEL_221:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v154 = _os_log_pack_fill();
    *(_DWORD *)v154 = 136446210;
    v155 = "nrPacketToTLV";
    goto LABEL_341;
  }
  if (!(_DWORD)a2)
  {
    v106 = nrCopyLogObj_1712();
    v107 = v106;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v108 = os_log_type_enabled(v106, OS_LOG_TYPE_ERROR);

      if (!v108)
        goto LABEL_221;
    }
    v142 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v142, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: packetLength > 0", v143, v144, v145, v146, v147, (uint64_t)"");

    goto LABEL_221;
  }
  v6 = a3;
  if (!a3)
  {
    v109 = nrCopyLogObj_1712();
    v110 = v109;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v111 = os_log_type_enabled(v109, OS_LOG_TYPE_ERROR);

      if (!v111)
        goto LABEL_221;
    }
    v148 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v148, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (ioVecs) != ((void *)0)", v149, v150, v151, v152, v153, (uint64_t)"");

    goto LABEL_221;
  }
  if (!a4)
  {
    v112 = nrCopyLogObj_1712();
    v113 = v112;
    v94 = "nrPacketToTLV";
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v114 = os_log_type_enabled(v112, OS_LOG_TYPE_ERROR);

      if (!v114)
        goto LABEL_224;
    }
    v156 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v156, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v157, v158, v159, v160, v161, (uint64_t)"");

LABEL_224:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    goto LABEL_167;
  }
  if (!a5)
  {
    v115 = nrCopyLogObj_1712();
    v116 = v115;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v117 = os_log_type_enabled(v115, OS_LOG_TYPE_ERROR);

      if (!v117)
        goto LABEL_229;
    }
    v162 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v162, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (srcAddr) != ((void *)0)", v163, v164, v165, v166, v167, (uint64_t)"");

LABEL_229:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v154 = _os_log_pack_fill();
    *(_DWORD *)v154 = 136446210;
    v155 = "nrPacketTo6LoWPANTLV";
    goto LABEL_341;
  }
  if (!a6)
  {
    v118 = nrCopyLogObj_1712();
    v119 = v118;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v120 = os_log_type_enabled(v118, OS_LOG_TYPE_ERROR);

      if (!v120)
        goto LABEL_229;
    }
    v168 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v168, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (dstAddr) != ((void *)0)", v169, v170, v171, v172, v173, (uint64_t)"");

    goto LABEL_229;
  }
  v10 = a1;
  v446 = a2;
  if (a2 <= 0x27)
  {
    v121 = nrCopyLogObj_1712();
    v122 = v121;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v186 = os_log_type_enabled(v121, OS_LOG_TYPE_INFO);

      if (!v186)
        goto LABEL_294;
    }
    v187 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v187, 1, (uint64_t)"%s%.30s:%-4d no 6lo compression - too short %u", v188, v189, v190, v191, v192, (uint64_t)"");
    goto LABEL_293;
  }
  v11 = *a1 >> 4;
  if (v11 != 6)
  {
    if (v11 == 4)
    {
      v123 = nrCopyLogObj_1712();
      v124 = v123;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v240 = os_log_type_enabled(v123, OS_LOG_TYPE_INFO);

        if (!v240)
          goto LABEL_294;
      }
      v187 = nrCopyLogObj_1712();
      IPProtoString = (__CFString *)createIPProtoString(v10[9]);
      _NRLogWithArgs((uint64_t)v187, 1, (uint64_t)"%s%.30s:%-4d no 6lo compression - IPv4 - %@", v241, v242, v243, v244, v245, (uint64_t)"");

    }
    else
    {
      v174 = nrCopyLogObj_1712();
      v175 = v174;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v246 = os_log_type_enabled(v174, OS_LOG_TYPE_INFO);

        if (!v246)
          goto LABEL_294;
      }
      v187 = nrCopyLogObj_1712();
      _NRLogWithArgs((uint64_t)v187, 1, (uint64_t)"%s%.30s:%-4d no 6lo compression - not IPv6 - v=%u", v247, v248, v249, v250, v251, (uint64_t)"");
    }
LABEL_293:

LABEL_294:
    **(_BYTE **)v6 = 2;
    v252 = *(_DWORD *)(v6 + 8);
    if (v252 > 2)
    {
      v253 = v446;
      *(_WORD *)(*(_QWORD *)v6 + 1) = __rev16(v446);
      goto LABEL_296;
    }
    if (v252 == 2)
    {
      v253 = v446;
      *(_BYTE *)(*(_QWORD *)v6 + 1) = BYTE1(v446);
      v368 = *(_BYTE **)(v6 + 16);
    }
    else
    {
      v381 = *(_QWORD *)(v6 + 16);
      if (*(_DWORD *)(v6 + 24) >= 2u)
      {
        v253 = v446;
        *(_WORD *)v381 = __rev16(v446);
LABEL_422:
        v10 = a1;
LABEL_296:
        v254 = 0;
        v255 = (unsigned int *)(v6 + 8);
        v256 = 3;
        v257 = a4;
        while (1)
        {
          v258 = *v255;
          if (!v256)
            goto LABEL_302;
          if (v256 <= v258)
            break;
          v256 -= v258;
LABEL_298:
          v255 += 4;
          if (!--v257)
            goto LABEL_307;
        }
        if (v256 >= v258)
        {
LABEL_306:
          v256 = 0;
          goto LABEL_298;
        }
LABEL_302:
        v259 = v258 - v256;
        if (v259 >= v253 - v254)
          v260 = v253 - v254;
        else
          v260 = v259;
        memcpy((void *)(*((_QWORD *)v255 - 1) + v256), &v10[v254], v260);
        v254 += v260;
        if (v254 < v253)
          goto LABEL_306;
LABEL_307:
        if (v254 != v253)
          goto LABEL_325;
        v261 = 0;
        v262 = 0;
        v263 = 0;
        v264 = 0;
        v265 = v253 + 3;
        v266 = (unsigned int *)(v6 + 8);
        while (1)
        {
          v267 = v265 - v262;
          if (v265 <= v262)
          {
            LODWORD(v268) = 0;
            goto LABEL_330;
          }
          if (*v266 >= v267)
            v268 = v267;
          else
            v268 = *v266;
          if (!(_DWORD)v268)
          {
            v359 = nrCopyLogObj_1712();
            v360 = v359;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v361 = os_log_type_enabled(v359, OS_LOG_TYPE_ERROR);

              if (!v361)
                goto LABEL_386;
            }
            v362 = nrCopyLogObj_1712();
            _NRLogWithArgs((uint64_t)v362, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen > 0", v363, v364, v365, v366, v367, (uint64_t)"");

LABEL_386:
            _os_log_pack_size();
            MEMORY[0x1E0C80A78]();
            __error();
            v154 = _os_log_pack_fill();
            *(_DWORD *)v154 = 136446210;
            v155 = "nrChecksumUpdate";
            goto LABEL_341;
          }
          v269 = (unsigned __int8 *)*((_QWORD *)v266 - 1);
          if (v264)
          {
            LOWORD(v457[0]) = 0;
            LOWORD(v457[0]) = *v269 << 8;
            v263 = MEMORY[0x1DF0BA514](v457, 2, v263);
            if (v268 < 2)
              goto LABEL_318;
            v270 = v269 + 1;
            v271 = (v268 - 1);
          }
          else
          {
            v270 = (unsigned __int8 *)*((_QWORD *)v266 - 1);
            v271 = v268;
          }
          v263 = MEMORY[0x1DF0BA514](v270, v271, v263);
LABEL_318:
          if ((v268 & 1) != 0)
            v264 ^= 1u;
          v262 += v268;
          if (v262 >= v265 && v268 < *v266)
            goto LABEL_330;
          ++v261;
          v266 += 4;
          if (a4 == v261)
          {
            LOWORD(v261) = a4;
LABEL_330:
            if (v262 == v265)
            {
              v275 = (unsigned __int16)v261;
              v276 = ~(_WORD)v263;
              v277 = v6 + 16 * (unsigned __int16)v261;
              v278 = *(_DWORD *)(v277 + 8);
              v90 = v446;
              if (v278 >= (int)v268 + 2)
              {
                *(_BYTE *)(*(_QWORD *)v277 + v268) = v276;
                v280 = (_BYTE *)(*(_QWORD *)v277 + v268 + 1);
                goto LABEL_337;
              }
              if (v278 < (int)v268 + 1)
              {
                v372 = nrCopyLogObj_1712();
                v373 = v372;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v374 = os_log_type_enabled(v372, OS_LOG_TYPE_ERROR);

                  if (!v374)
                    goto LABEL_419;
                }
                v394 = nrCopyLogObj_1712();
                IOVecString = createIOVecString(v6, a4);
                _NRLogWithArgs((uint64_t)v394, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex].len >= bytesToCheckThisIOVec + 1;"
                           " %@, iovecIndex=%u bytesToCheckThisIOVec=%u",
                  v395,
                  v396,
                  v397,
                  v398,
                  v399,
                  (uint64_t)"");

                goto LABEL_419;
              }
              v279 = (unsigned __int16)v261 + 1;
              if (v279 < a4)
              {
                if (*(_DWORD *)(v6 + 16 * v279 + 8))
                {
                  *(_BYTE *)(*(_QWORD *)v277 + v268) = v276;
                  v280 = *(_BYTE **)(v6 + 16 * v279);
LABEL_337:
                  *v280 = HIBYTE(v276);
                  return (v90 + 5);
                }
                v378 = nrCopyLogObj_1712();
                v379 = v378;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v380 = os_log_type_enabled(v378, OS_LOG_TYPE_ERROR);

                  if (!v380)
                  {
LABEL_419:
                    _os_log_pack_size();
                    MEMORY[0x1E0C80A78]();
                    __error();
                    v412 = _os_log_pack_fill();
                    v413 = createIOVecString(v6, a4);
                    __os_log_helper_1_2_4_8_34_8_64_4_0_4_0(v412, (uint64_t)"nrChecksumIOVecInner", (uint64_t)v413, v275, v268);
                    v414 = nrCopyLogObj_1712();
                    _NRLogAbortWithPack(v414);
                  }
                }
                v406 = nrCopyLogObj_1712();
                v436 = createIOVecString(v6, a4);
                _NRLogWithArgs((uint64_t)v406, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex + 1].len >= 1; %@, iovecIndex=%u b"
                           "ytesToCheckThisIOVec=%u",
                  v407,
                  v408,
                  v409,
                  v410,
                  v411,
                  (uint64_t)"");

                goto LABEL_419;
              }
              v375 = nrCopyLogObj_1712();
              v376 = v375;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v377 = os_log_type_enabled(v375, OS_LOG_TYPE_ERROR);

                if (!v377)
                  goto LABEL_419;
              }
              v400 = nrCopyLogObj_1712();
              v435 = createIOVecString(v6, a4);
              _NRLogWithArgs((uint64_t)v400, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecIndex + 1 < numIOVecs; %@, iovecIndex=%u bytesToC"
                         "heckThisIOVec=%u",
                v401,
                v402,
                v403,
                v404,
                v405,
                (uint64_t)"");

              goto LABEL_419;
            }
            v369 = nrCopyLogObj_1712();
            v370 = v369;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v371 = os_log_type_enabled(v369, OS_LOG_TYPE_ERROR);

              if (!v371)
                goto LABEL_405;
            }
            v382 = nrCopyLogObj_1712();
            _NRLogWithArgs((uint64_t)v382, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: computedBytes == writtenLength", v383, v384, v385, v386, v387, (uint64_t)"");

LABEL_405:
            _os_log_pack_size();
            MEMORY[0x1E0C80A78]();
            __error();
            v154 = _os_log_pack_fill();
            *(_DWORD *)v154 = 136446210;
            v155 = "nrChecksumIOVecInner";
            goto LABEL_341;
          }
        }
      }
      v253 = v446;
      *(_BYTE *)(v381 + 1) = BYTE1(v446);
      v368 = *(_BYTE **)(v6 + 32);
    }
    *v368 = v253;
    goto LABEL_422;
  }
  if (!gNRPacketLoggingEnabled)
    goto LABEL_10;
  v125 = nrCopyLogObj_1712();
  v126 = v125;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v193 = os_log_type_enabled(v125, OS_LOG_TYPE_INFO);

    LOWORD(a2) = v446;
    if (!v193)
      goto LABEL_10;
  }
  v194 = nrCopyLogObj_1712();
  PacketString = (void *)createPacketString(a1, v446);
  _NRLogWithArgs((uint64_t)v194, 1, (uint64_t)"%s%.30s:%-4d Got [%@] total len %u", v195, v196, v197, v198, v199, (uint64_t)"");

  LOWORD(a2) = v446;
LABEL_10:
  v12 = (unsigned __int16)(a2 - 40);
  v10 = a1;
  if (v12 != bswap32(*((unsigned __int16 *)a1 + 2)) >> 16)
  {
    v127 = nrCopyLogObj_1712();
    v128 = v127;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v200 = os_log_type_enabled(v127, OS_LOG_TYPE_INFO);

      if (!v200)
        goto LABEL_294;
    }
    v187 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v187, 1, (uint64_t)"%s%.30s:%-4d Avoiding compression of strange length payload %u expected %u", v201, v202, v203, v204, v205, (uint64_t)"");
    goto LABEL_293;
  }
  v13 = a1 + 8;
  v15 = *((_QWORD *)a1 + 1) != *(_QWORD *)a5 || *((_QWORD *)a1 + 2) != *(_QWORD *)(a5 + 8);
  v16 = a1 + 24;
  v18 = *((_QWORD *)a1 + 3) != *(_QWORD *)a6 || *((_QWORD *)a1 + 4) != *(_QWORD *)(a6 + 8);
  memset((char *)&v457[4] + 1, 0, 27);
  *(_OWORD *)((char *)v457 + 1) = 0u;
  v456 = 0;
  memset(v455, 0, sizeof(v455));
  v19 = bswap32(*(_DWORD *)a1);
  if ((v19 & 0xFF00000) != 0)
  {
    LOBYTE(v455[0]) = v19 >> 20;
    v20 = 1;
    v21 = 112;
  }
  else
  {
    v20 = 0;
    v21 = 120;
  }
  LOBYTE(v457[0]) = v21;
  *(_BYTE *)((unint64_t)v455 | v20) = a1[6];
  v22 = v20 + 1;
  v23 = a1[7];
  switch(v23)
  {
    case 64:
      v24 = v21 | 2;
      break;
    case 255:
      v24 = v21 | 3;
      break;
    case 1:
      v24 = v21 | 1;
      break;
    default:
      *(_BYTE *)((unint64_t)v455 | v22) = v23;
      LODWORD(v22) = v20 | 2;
      if (!v15)
        goto LABEL_29;
      goto LABEL_267;
  }
  LOBYTE(v457[0]) = v24;
  if (!v15)
  {
LABEL_29:
    v25 = 48;
    BYTE1(v457[0]) = 48;
    goto LABEL_30;
  }
LABEL_267:
  if (*(_QWORD *)v13 == *(_QWORD *)a5
    && (*(_DWORD *)(a1 + 18) == *(_DWORD *)(a5 + 10)
      ? (v224 = *((unsigned __int16 *)a1 + 11) == *(unsigned __int16 *)(a5 + 14))
      : (v224 = 0),
        v224))
  {
    v25 = 96;
    BYTE1(v457[0]) = 96;
    *(_WORD *)((unint64_t)v455 | v22) = *((_WORD *)a1 + 8);
    LODWORD(v22) = v22 + 2;
  }
  else if (*v13 == 254 && (a1[9] & 0xC0) == 0x80)
  {
    v25 = 16;
    BYTE1(v457[0]) = 16;
    *(_QWORD *)((unint64_t)v455 | v22) = *((_QWORD *)a1 + 2);
    LODWORD(v22) = v22 | 8;
  }
  else
  {
    v25 = 0;
    *(_OWORD *)((unint64_t)v455 | v22) = *(_OWORD *)v13;
    LODWORD(v22) = v22 | 0x10;
  }
LABEL_30:
  v26 = *v16;
  if (v26 == 255)
  {
    if (*(_QWORD *)v16 ^ 0x2FFLL | *(_QWORD *)(a1 + 31))
    {
      BYTE1(v457[0]) = v25 | 8;
LABEL_209:
      *(_OWORD *)((char *)v455 + v22) = *(_OWORD *)v16;
      LODWORD(v22) = v22 + 16;
      goto LABEL_33;
    }
    BYTE1(v457[0]) = v25 | 0xB;
    *((_BYTE *)v455 + v22) = a1[39];
    LODWORD(v22) = v22 + 1;
  }
  else
  {
    if (!v18)
    {
      BYTE1(v457[0]) = v25 | 3;
      goto LABEL_33;
    }
    if (*(_QWORD *)v16 != *(_QWORD *)a6
      || (*(_DWORD *)(a1 + 34) == *(_DWORD *)(a6 + 10)
        ? (v130 = *((unsigned __int16 *)a1 + 19) == *(unsigned __int16 *)(a6 + 14))
        : (v130 = 0),
          !v130))
    {
      if (v26 == 254 && (a1[25] & 0xC0) == 0x80)
      {
        BYTE1(v457[0]) = v25 | 1;
        *(_QWORD *)((char *)v455 + v22) = *((_QWORD *)a1 + 4);
        LODWORD(v22) = v22 + 8;
        goto LABEL_33;
      }
      goto LABEL_209;
    }
    BYTE1(v457[0]) = v25 | 6;
    *(_WORD *)((char *)v455 + v22) = *((_WORD *)a1 + 16);
    LODWORD(v22) = v22 + 2;
  }
LABEL_33:
  __memcpy_chk();
  switch((int)v22)
  {
    case 1:
      if (LOWORD(v457[0]) == 13178 && BYTE2(v457[0]) == 50)
      {
        v34 = 0;
        v28 = 0;
        LODWORD(v22) = 1;
        v35 = 100;
      }
      else
      {
        if (bswap32(LOWORD(v457[0])) >> 16 != 31283)
        {
          LODWORD(v22) = 1;
          goto LABEL_40;
        }
        LODWORD(v22) = 1;
        if (BYTE2(v457[0]) != 6)
        {
LABEL_40:
          v28 = 3;
          goto LABEL_55;
        }
        v34 = 0;
        v28 = 0;
        v35 = 102;
      }
LABEL_56:
      v36 = v12 + v28;
      **(_BYTE **)v6 = v35;
      v37 = *(_DWORD *)(v6 + 8);
      v450 = v12 + v28;
      v445 = v35;
      if (v37 >= 3)
      {
        *(_WORD *)(*(_QWORD *)v6 + 1) = bswap32(v36) >> 16;
        goto LABEL_58;
      }
      if (v37 == 2)
      {
        *(_BYTE *)(*(_QWORD *)v6 + 1) = BYTE1(v36);
        v129 = *(_BYTE **)(v6 + 16);
      }
      else
      {
        v176 = *(_QWORD *)(v6 + 16);
        if (*(_DWORD *)(v6 + 24) >= 2u)
        {
          *(_WORD *)v176 = bswap32(v36) >> 16;
          goto LABEL_58;
        }
        *(_BYTE *)(v176 + 1) = BYTE1(v36);
        v129 = *(_BYTE **)(v6 + 32);
      }
      *v129 = v36;
LABEL_58:
      v453 = a4;
      if (!v34)
        goto LABEL_85;
      v444 = v34;
      v38 = 0;
      v447 = v6;
      v39 = (unsigned int *)(v6 + 8);
      v40 = 3;
      v41 = v453;
      break;
    case 2:
      if (v457[0] == 839005042)
      {
        v34 = 0;
        v28 = 0;
        LODWORD(v22) = 2;
        v35 = 101;
      }
      else
      {
        v29 = bswap32(v457[0]);
        v30 = v29 >= 0x72330206;
        v31 = v29 > 0x72330206;
        v32 = !v30;
        LODWORD(v22) = 2;
        if (v31 == v32)
        {
          v34 = 0;
          v28 = 0;
          v35 = 103;
        }
        else
        {
          v28 = 4;
LABEL_55:
          v34 = 1;
          v35 = 3;
        }
      }
      goto LABEL_56;
    case 5:
      if (v457[0] != 3303034 || *(_DWORD *)((char *)v457 + 3) != 201329664)
        goto LABEL_54;
      v34 = 0;
      v28 = 0;
      LODWORD(v22) = 5;
      v35 = 104;
      goto LABEL_56;
    case 6:
      if (*(_QWORD *)v457 != 0xC000C0032026672)
        goto LABEL_54;
      v34 = 0;
      v28 = 0;
      LODWORD(v22) = 6;
      v35 = 105;
      goto LABEL_56;
    default:
LABEL_54:
      v28 = v22 + 2;
      goto LABEL_55;
  }
  while (1)
  {
    v42 = *v39;
    if (!v40)
      goto LABEL_65;
    if (v40 <= v42)
      break;
    v40 -= v42;
LABEL_61:
    v39 += 4;
    if (!--v41)
      goto LABEL_70;
  }
  if (v40 >= v42)
  {
LABEL_69:
    v40 = 0;
    goto LABEL_61;
  }
LABEL_65:
  v43 = v42 - v40;
  if (v43 >= 2 - v38)
    v44 = 2 - v38;
  else
    v44 = v43;
  memcpy((void *)(*((_QWORD *)v39 - 1) + v40), (char *)v457 + v38, v44);
  v38 += v44;
  if (v38 <= 1)
    goto LABEL_69;
LABEL_70:
  if (v38 != 2)
    goto LABEL_325;
  v10 = a1;
  if (!(_DWORD)v22)
    goto LABEL_84;
  v45 = 0;
  v46 = (unsigned int *)(v447 + 8);
  v47 = 5;
  v48 = v453;
  while (2)
  {
    v49 = *v46;
    if (v47)
    {
      if (v47 > v49)
      {
        v47 -= v49;
      }
      else
      {
        if (v47 < v49)
          break;
LABEL_82:
        v47 = 0;
      }
      v46 += 4;
      if (!--v48)
        goto LABEL_83;
      continue;
    }
    break;
  }
  v50 = v49 - v47;
  if (v50 >= v22 - v45)
    v51 = v22 - v45;
  else
    v51 = v50;
  memcpy((void *)(*((_QWORD *)v46 - 1) + v47), (char *)v455 + v45, v51);
  v45 += v51;
  if (v45 < v22)
    goto LABEL_82;
LABEL_83:
  if (v45 != (_DWORD)v22)
    goto LABEL_325;
LABEL_84:
  v6 = v447;
  v34 = v444;
LABEL_85:
  if (!v12)
    goto LABEL_98;
  v52 = 0;
  v53 = v28 + 3;
  v54 = (unsigned int *)(v6 + 8);
  v55 = v453;
  while (2)
  {
    v56 = *v54;
    if (v53)
    {
      if (v53 > v56)
      {
        v53 -= v56;
      }
      else
      {
        if (v53 < v56)
          break;
LABEL_96:
        v53 = 0;
      }
      v54 += 4;
      if (!--v55)
        goto LABEL_97;
      continue;
    }
    break;
  }
  v57 = v56 - v53;
  if (v57 >= v12 - v52)
    v58 = v12 - v52;
  else
    v58 = v57;
  memcpy((void *)(*((_QWORD *)v54 - 1) + v53), &v10[v52 + 40], v58);
  v52 += v58;
  if (v52 < v12)
    goto LABEL_96;
LABEL_97:
  if (v52 != v12)
  {
    v131 = nrCopyLogObj_1712();
    v132 = v131;
    v94 = "nrWriteBufferToIOVec";
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v133 = os_log_type_enabled(v131, OS_LOG_TYPE_ERROR);

      if (!v133)
        goto LABEL_238;
    }
    v177 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v177, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length", v178, v179, v180, v181, v182, (uint64_t)"");

LABEL_238:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    goto LABEL_167;
  }
LABEL_98:
  if (!v34)
  {
    v71 = *(_DWORD *)(v6 + 8);
    if (v71 >= 3)
    {
      v72 = *(unsigned __int16 *)(*(_QWORD *)v6 + 1);
      v73 = v72 >> 8;
LABEL_144:
      v82 = 0;
      v83 = (unsigned int *)(v6 + 8);
      v84 = **(_BYTE **)v6;
      LOBYTE(v454) = v72 ^ (v84 >> 4);
      HIBYTE(v454) = v73 ^ (16 * v84);
      v85 = __rev16(v72 | (v73 << 8)) + 3;
      v86 = v453;
      while (1)
      {
        v87 = *v83;
        if (!v85)
          goto LABEL_150;
        if (v85 <= v87)
          break;
        v85 -= v87;
LABEL_146:
        v83 += 4;
        if (!--v86)
          goto LABEL_155;
      }
      if (v85 < v87)
      {
LABEL_150:
        v88 = v87 - v85;
        if (v88 >= 2 - v82)
          v89 = 2 - v82;
        else
          v89 = v88;
        memcpy((void *)(*((_QWORD *)v83 - 1) + v85), (char *)&v454 + v82, v89);
        v82 += v89;
        if (v82 > 1)
        {
LABEL_155:
          if (v82 == 2)
          {
            v78 = a1;
            goto LABEL_157;
          }
LABEL_325:
          v272 = nrCopyLogObj_1712();
          v273 = v272;
          if (sNRCopyLogToStdErr)
          {

            goto LABEL_339;
          }
          v274 = os_log_type_enabled(v272, OS_LOG_TYPE_ERROR);

          if (v274)
          {
LABEL_339:
            v281 = nrCopyLogObj_1712();
            _NRLogWithArgs((uint64_t)v281, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length", v282, v283, v284, v285, v286, (uint64_t)"");

          }
          _os_log_pack_size();
          MEMORY[0x1E0C80A78]();
          __error();
          v154 = _os_log_pack_fill();
          *(_DWORD *)v154 = 136446210;
          v155 = "nrWriteBufferToIOVec";
LABEL_341:
          *(_QWORD *)(v154 + 4) = v155;
LABEL_342:
          v287 = nrCopyLogObj_1712();
          _NRLogAbortWithPack(v287);
        }
      }
      v85 = 0;
      goto LABEL_146;
    }
    if (v71 == 2)
    {
      if (a4 > 1)
      {
        LOBYTE(v72) = *(_BYTE *)(*(_QWORD *)v6 + 1);
        v74 = *(unsigned __int8 **)(v6 + 16);
LABEL_143:
        v73 = *v74;
        goto LABEL_144;
      }
      v288 = nrCopyLogObj_1712();
      v289 = v288;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v290 = os_log_type_enabled(v288, OS_LOG_TYPE_ERROR);

        if (!v290)
          goto LABEL_360;
      }
      v314 = nrCopyLogObj_1712();
      _NRLogWithArgs((uint64_t)v314, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 1", v315, v316, v317, v318, v319, (uint64_t)"");

LABEL_360:
      _os_log_pack_size();
      MEMORY[0x1E0C80A78]();
      __error();
      v154 = _os_log_pack_fill();
      *(_DWORD *)v154 = 136446210;
      v155 = "nrReadTLVLenHBOFromIOVec";
      goto LABEL_341;
    }
    if (v71 == 1)
    {
      v81 = *(_DWORD *)(v6 + 24);
      if (v81 >= 2)
      {
        if (a4 > 1)
        {
          v72 = **(unsigned __int16 **)(v6 + 16);
          v73 = v72 >> 8;
          goto LABEL_144;
        }
        v326 = nrCopyLogObj_1712();
        v327 = v326;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v328 = os_log_type_enabled(v326, OS_LOG_TYPE_ERROR);

          if (!v328)
          {
LABEL_374:
            _os_log_pack_size();
            MEMORY[0x1E0C80A78]();
            __error();
            v341 = _os_log_pack_fill();
            v342 = createIOVecString(v6, 1u);
            *(_DWORD *)v341 = 136446466;
            *(_QWORD *)(v341 + 4) = "nrReadTLVLenHBOFromIOVec";
            *(_WORD *)(v341 + 12) = 2112;
            *(_QWORD *)(v341 + 14) = v342;
            v343 = nrCopyLogObj_1712();
            _NRLogAbortWithPack(v343);
          }
        }
        v335 = nrCopyLogObj_1712();
        v441 = createIOVecString(v6, 1u);
        _NRLogWithArgs((uint64_t)v335, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 1; %@",
          v336,
          v337,
          v338,
          v339,
          v340,
          (uint64_t)"");

        goto LABEL_374;
      }
      if (a4 <= 2)
      {
        v329 = nrCopyLogObj_1712();
        v330 = v329;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v331 = os_log_type_enabled(v329, OS_LOG_TYPE_ERROR);

          if (!v331)
            goto LABEL_379;
        }
        v344 = nrCopyLogObj_1712();
        v442 = createIOVecString(v6, a4);
        _NRLogWithArgs((uint64_t)v344, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 2; %@",
          v345,
          v346,
          v347,
          v348,
          v349,
          (uint64_t)"");

      }
      else
      {
        if (v81 == 1)
        {
          LOBYTE(v72) = **(_BYTE **)(v6 + 16);
          v74 = *(unsigned __int8 **)(v6 + 32);
          goto LABEL_143;
        }
        v332 = nrCopyLogObj_1712();
        v333 = v332;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v334 = os_log_type_enabled(v332, OS_LOG_TYPE_ERROR);

          if (!v334)
            goto LABEL_379;
        }
        v350 = nrCopyLogObj_1712();
        v443 = createIOVecString(v6, a4);
        _NRLogWithArgs((uint64_t)v350, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: ioVecs[1].len == 1; %@",
          v351,
          v352,
          v353,
          v354,
          v355,
          (uint64_t)"");

      }
    }
    else
    {
      v291 = nrCopyLogObj_1712();
      v292 = v291;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v293 = os_log_type_enabled(v291, OS_LOG_TYPE_ERROR);

        if (!v293)
          goto LABEL_379;
      }
      v320 = nrCopyLogObj_1712();
      v440 = createIOVecString(v6, a4);
      _NRLogWithArgs((uint64_t)v320, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: ioVecs[0].len == 1; %@",
        v321,
        v322,
        v323,
        v324,
        v325,
        (uint64_t)"");

    }
LABEL_379:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v356 = _os_log_pack_fill();
    v357 = createIOVecString(v6, a4);
    *(_DWORD *)v356 = 136446466;
    *(_QWORD *)(v356 + 4) = "nrReadTLVLenHBOFromIOVec";
    *(_WORD *)(v356 + 12) = 2112;
    *(_QWORD *)(v356 + 14) = v357;
    goto LABEL_380;
  }
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v62 = 0;
  v63 = v450 + 3;
  v64 = v6;
  v65 = (unsigned int *)(v6 + 8);
  do
  {
    v66 = v63 - v60;
    if (v63 <= v60)
    {
      LODWORD(v67) = 0;
      goto LABEL_123;
    }
    if (*v65 >= v66)
      v67 = v66;
    else
      v67 = *v65;
    if (!(_DWORD)v67)
    {
      v92 = nrCopyLogObj_1712();
      v93 = v92;
      v94 = "nrChecksumUpdate";
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v95 = os_log_type_enabled(v92, OS_LOG_TYPE_ERROR);

        if (!v95)
          goto LABEL_166;
      }
      v96 = nrCopyLogObj_1712();
      _NRLogWithArgs((uint64_t)v96, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen > 0", v97, v98, v99, v100, v101, (uint64_t)"");

LABEL_166:
      _os_log_pack_size();
      MEMORY[0x1E0C80A78]();
      __error();
LABEL_167:
      v102 = _os_log_pack_fill();
      *(_DWORD *)v102 = 136446210;
      *(_QWORD *)(v102 + 4) = v94;
      goto LABEL_342;
    }
    v68 = (unsigned __int8 *)*((_QWORD *)v65 - 1);
    if (!v61)
    {
      v69 = (unsigned __int8 *)*((_QWORD *)v65 - 1);
      v70 = v67;
LABEL_108:
      v62 = MEMORY[0x1DF0BA514](v69, v70, v62);
      goto LABEL_109;
    }
    v454 = 0;
    v454 = *v68 << 8;
    v62 = MEMORY[0x1DF0BA514](&v454, 2, v62);
    if (v67 >= 2)
    {
      v69 = v68 + 1;
      v70 = (v67 - 1);
      goto LABEL_108;
    }
LABEL_109:
    if ((v67 & 1) != 0)
      v61 ^= 1u;
    v60 += v67;
    if (v60 >= v63 && v67 < *v65)
      goto LABEL_123;
    ++v59;
    v65 += 4;
  }
  while (v453 != v59);
  LOWORD(v59) = a4;
LABEL_123:
  if (v60 != v63)
  {
    v183 = nrCopyLogObj_1712();
    v184 = v183;
    v94 = "nrChecksumIOVecInner";
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v185 = os_log_type_enabled(v183, OS_LOG_TYPE_ERROR);

      if (!v185)
        goto LABEL_166;
    }
    v225 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v225, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: computedBytes == writtenLength", v226, v227, v228, v229, v230, (uint64_t)"");

    goto LABEL_166;
  }
  v6 = v64;
  v75 = ~(_WORD)v62;
  v76 = v64 + 16 * (unsigned __int16)v59;
  v77 = *(_DWORD *)(v76 + 8);
  if (v77 < (int)v67 + 2)
  {
    v78 = a1;
    if (v77 < (int)v67 + 1)
    {
      v231 = nrCopyLogObj_1712();
      v232 = v231;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v233 = os_log_type_enabled(v231, OS_LOG_TYPE_ERROR);

        if (!v233)
          goto LABEL_357;
      }
      v294 = nrCopyLogObj_1712();
      v431 = createIOVecString(v64, a4);
      _NRLogWithArgs((uint64_t)v294, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex].len >= bytesToCheckThisIOVec + 1; %@, iovec"
                 "Index=%u bytesToCheckThisIOVec=%u",
        v295,
        v296,
        v297,
        v298,
        v299,
        (uint64_t)"");

    }
    else
    {
      v79 = (unsigned __int16)v59 + 1;
      if (v79 >= a4)
      {
        v234 = nrCopyLogObj_1712();
        v235 = v234;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v236 = os_log_type_enabled(v234, OS_LOG_TYPE_ERROR);

          if (!v236)
            goto LABEL_357;
        }
        v300 = nrCopyLogObj_1712();
        v432 = createIOVecString(v64, a4);
        _NRLogWithArgs((uint64_t)v300, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecIndex + 1 < numIOVecs; %@, iovecIndex=%u bytesToCheckThisIOVec=%u",
          v301,
          v302,
          v303,
          v304,
          v305,
          (uint64_t)"");

      }
      else
      {
        if (*(_DWORD *)(v64 + 16 * v79 + 8))
        {
          *(_BYTE *)(*(_QWORD *)v76 + v67) = v75;
          v80 = *(_BYTE **)(v64 + 16 * v79);
          goto LABEL_130;
        }
        v237 = nrCopyLogObj_1712();
        v238 = v237;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v239 = os_log_type_enabled(v237, OS_LOG_TYPE_ERROR);

          if (!v239)
            goto LABEL_357;
        }
        v306 = nrCopyLogObj_1712();
        v433 = createIOVecString(v64, a4);
        _NRLogWithArgs((uint64_t)v306, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex + 1].len >= 1; %@, iovecIndex=%u bytesToCheckThisIOVec=%u",
          v307,
          v308,
          v309,
          v310,
          v311,
          (uint64_t)"");

      }
    }
LABEL_357:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v312 = _os_log_pack_fill();
    v313 = createIOVecString(v64, a4);
    __os_log_helper_1_2_4_8_34_8_64_4_0_4_0(v312, (uint64_t)"nrChecksumIOVecInner", (uint64_t)v313, (unsigned __int16)v59, v67);
    goto LABEL_380;
  }
  *(_BYTE *)(*(_QWORD *)v76 + v67) = v75;
  v80 = (_BYTE *)(*(_QWORD *)v76 + v67 + 1);
  v78 = a1;
LABEL_130:
  *v80 = HIBYTE(v75);
LABEL_157:
  if (gNRPacketLoggingEnabled)
  {
    v134 = nrCopyLogObj_1712();
    v135 = v134;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v206 = os_log_type_enabled(v134, OS_LOG_TYPE_INFO);

      if (!v206)
        goto LABEL_158;
    }
    v207 = nrCopyLogObj_1712();
    StringFromNRTLVType = (__CFString *)createStringFromNRTLVType(v445);
    v448 = (void *)createPacketString(v78, v446);
    v208 = (__CFString *)NRDCreateIPHCString((unsigned __int16 *)v457, 2u);
    if (!v450)
    {
      v217 = objc_alloc_init(MEMORY[0x1E0C99D50]);
LABEL_265:
      v218 = v217;
      v437 = _NRCreateDataString(v217);
      _NRLogWithArgs((uint64_t)v207, 1, (uint64_t)"%s%.30s:%-4d Used 6LowPAN IPHC to compress %@, %u to %u - %@ %@ %@", v219, v220, v221, v222, v223, (uint64_t)"");

      goto LABEL_158;
    }
    v209 = (char *)malloc_type_malloc(v450, 0xA172743EuLL);
    if (v209)
    {
      v210 = v209;
      v211 = 0;
      v212 = (unsigned int *)(v6 + 8);
      v213 = 3;
      while (1)
      {
        v214 = *v212;
        if (!v213)
          goto LABEL_258;
        if (v213 <= v214)
          break;
        v213 -= v214;
LABEL_254:
        v212 += 4;
        if (!--v453)
          goto LABEL_263;
      }
      if (v213 < v214)
      {
LABEL_258:
        v215 = v214 - v213;
        if (v215 >= v450 - v211)
          v216 = v450 - v211;
        else
          v216 = v215;
        memcpy(&v210[v211], (const void *)(*((_QWORD *)v212 - 1) + v213), v216);
        v211 += v216;
        if (v211 >= v450)
        {
LABEL_263:
          if (v211 == v450)
          {
            v217 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v210, v450, 1);
            goto LABEL_265;
          }
          v391 = nrCopyLogObj_1712();
          v392 = v391;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v393 = os_log_type_enabled(v391, OS_LOG_TYPE_ERROR);

            if (!v393)
            {
LABEL_428:
              _os_log_pack_size();
              MEMORY[0x1E0C80A78]();
              __error();
              v428 = _os_log_pack_fill();
              v429 = createIOVecString(v6, a4);
              __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v428, (uint64_t)"nrWriteIOVecToBuffer", v211, v450, 3, (uint64_t)v429);

LABEL_380:
              v358 = nrCopyLogObj_1712();
              _NRLogAbortWithPack(v358);
            }
          }
          v422 = nrCopyLogObj_1712();
          v438 = createIOVecString(v6, a4);
          _NRLogWithArgs((uint64_t)v422, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%u), "
                     "offset: %u, ioVec: %@",
            v423,
            v424,
            v425,
            v426,
            v427,
            (uint64_t)"");

          goto LABEL_428;
        }
      }
      v213 = 0;
      goto LABEL_254;
    }
    v388 = nrCopyLogObj_1712();
    v389 = v388;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v390 = os_log_type_enabled(v388, OS_LOG_TYPE_ERROR);

      if (!v390)
        goto LABEL_425;
    }
    v415 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v415, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v416, v417, v418, v419, v420, (uint64_t)"");

LABEL_425:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v421 = _os_log_pack_fill();
    *(_DWORD *)v421 = 136446466;
    *(_QWORD *)(v421 + 4) = "strict_malloc";
    *(_WORD *)(v421 + 12) = 2048;
    *(_QWORD *)(v421 + 14) = v450;
    goto LABEL_342;
  }
LABEL_158:
  v90 = v450;
  return (v90 + 5);
}

void *createIKEv2PacketString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unsigned __int8 *v4;
  void *v5;
  unsigned int v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v11 = nrCopyLogObj_1712();
    v12 = v11;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);

      if (!v13)
      {
LABEL_21:
        v3 = 0;
        goto LABEL_16;
      }
    }
    v14 = nrCopyLogObj_1712();
    _NRLogWithArgs((uint64_t)v14, 17, (uint64_t)"%s called with null data", v15, v16, v17, v18, v19, (uint64_t)"createIKEv2PacketString");

    goto LABEL_21;
  }
  if ((unint64_t)objc_msgSend(v1, "length") > 0x1B)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
    v4 = (unsigned __int8 *)objc_msgSend(v2, "bytes");
    if (v4[18] - 34 >= 5)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UNKNOWN_MSG_TYPE(%u)"), v4[18]);
    else
      v5 = (void *)*((_QWORD *)&off_1EA3F7630 + (v4[18] - 34));
    objc_msgSend(v3, "appendString:", v5);
    if (v4[17] != 32)
      objc_msgSend(v3, "appendFormat:", CFSTR(" vers %02X"), v4[17]);
    HIDWORD(v7) = v4[19];
    LODWORD(v7) = HIDWORD(v7);
    v6 = v7 >> 3;
    if (v6 < 6 && ((0x33u >> v6) & 1) != 0)
      v8 = (void *)*((_QWORD *)&off_1EA3F7658 + v6);
    else
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown Flags(%u)"), v4[19]);
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v8);
    objc_msgSend(v3, "appendFormat:", CFSTR(" id %u"), bswap32(*((_DWORD *)v4 + 5)));
    v9 = bswap32(*((_DWORD *)v4 + 6));
    if ((_DWORD)v9 != objc_msgSend(v2, "length"))
      objc_msgSend(v3, "appendFormat:", CFSTR(" len %u"), v9);
    objc_msgSend(v3, "appendString:", CFSTR(" "));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), *v4);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[1]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[2]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[3]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[4]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[5]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[6]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[7]);
    objc_msgSend(v3, "appendString:", CFSTR("-"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[8]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[9]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[10]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[11]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[12]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[13]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[14]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v4[15]);
    objc_msgSend(v3, "appendString:", CFSTR("]"));

  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[Invalid len %u]"), objc_msgSend(v2, "length"));
  }
LABEL_16:

  return v3;
}

const __CFString *createStringFromThermalPressureLevel(uint64_t a1)
{
  int v2;
  const __CFString *result;

  v2 = a1;
  result = CFSTR("Nominal");
  switch(v2)
  {
    case 0:
      return result;
    case 10:
      result = CFSTR("Light");
      break;
    case 20:
      result = CFSTR("Moderate");
      break;
    case 30:
      result = CFSTR("Heavy");
      break;
    case 40:
      result = CFSTR("Trapping");
      break;
    case 50:
      result = CFSTR("Sleeping");
      break;
    default:
      result = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown(%d)"), a1);
      break;
  }
  return result;
}

__CFString *createStringFromNRXPCType(unint64_t a1)
{
  if (a1 < 0x34 && ((0xFFFFFFFFFFCFFuLL >> a1) & 1) != 0)
    return off_1EA3F7B40[a1];
  else
    return (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%lld)"), a1);
}

const __CFString *createStringFromNRXPCRes(uint64_t a1)
{
  const __CFString *result;

  if (a1 <= -2020)
  {
    switch(a1)
    {
      case -3004:
        result = CFSTR("FailureOperationTimedOut");
        break;
      case -3003:
        result = CFSTR("FailureOperationAlreadyInProgress");
        break;
      case -3002:
        result = CFSTR("FailureOperationFailed");
        break;
      case -3001:
        result = CFSTR("FailureInvalidState");
        break;
      default:
        if (a1 == -9999)
          result = CFSTR("FailureUnimplemented");
        else
LABEL_32:
          result = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%lld)"), a1);
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case -2019:
        result = CFSTR("FailureXPCError");
        break;
      case -2018:
        result = CFSTR("FailureCopyIDSDeviceIDFailed");
        break;
      case -2017:
        result = CFSTR("FailurePairingClientFailed");
        break;
      case -2016:
        result = CFSTR("FailurePairingAttemptFixedInterfaceMode");
        break;
      case -2015:
        result = CFSTR("FailureBabelRoutes");
        break;
      case -2014:
        result = CFSTR("FailureInvalidOperationOnUnregisteredDevice");
        break;
      case -2013:
        result = CFSTR("FailureIKEPairingDidNotConnect");
        break;
      case -2012:
        result = CFSTR("FailureFileWriteFailed");
        break;
      case -2011:
        result = CFSTR("FailureNoBestTestingDevice");
        break;
      case -2010:
        result = CFSTR("FailureMonitorConnectionLost");
        break;
      case -2009:
        result = CFSTR("FailureCopyDeviceListFailed");
        break;
      case -2008:
        result = CFSTR("FailureNRUUIDIsUnknown");
        break;
      case -2007:
        result = CFSTR("FailureAsyncBadXPCResponse");
        break;
      case -2006:
        result = CFSTR("FailureResolveNoLink");
        break;
      case -2005:
        result = CFSTR("FailureInvalidInput");
        break;
      case -2004:
        result = CFSTR("FailureLinkStatus");
        break;
      case -2003:
        result = CFSTR("FailureInvalidType");
        break;
      case -2002:
        result = CFSTR("FailureMissingEntitlement");
        break;
      case -2001:
        result = CFSTR("FailureUnknown");
        break;
      case -2000:
        result = CFSTR("AsyncInProgress");
        break;
      default:
        if (a1)
          goto LABEL_32;
        result = CFSTR("Success");
        break;
    }
  }
  return result;
}

void __nrXPCCopyQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  if (_NRShouldDebugAutoRelease_onceToken != -1)
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_30);
  if ((_NRShouldDebugAutoRelease_debugAutoRelease & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = dispatch_queue_create("com.apple.networkrelay.xpc", v0);

  if (!v1)
  {
    v3 = nrCopyLogObj_2128();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (!v5)
      {
LABEL_17:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v15 = _os_log_pack_fill();
        *(_DWORD *)v15 = 136446466;
        *(_QWORD *)(v15 + 4) = "nr_dispatch_queue_create";
        *(_WORD *)(v15 + 12) = 2080;
        *(_QWORD *)(v15 + 14) = "com.apple.networkrelay.xpc";
        v16 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v16);
      }
    }
    v9 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed", v10, v11, v12, v13, v14, (uint64_t)"");

    goto LABEL_17;
  }
  v2 = (void *)nrXPCCopyQueue_nrXPCQueue;
  nrXPCCopyQueue_nrXPCQueue = (uint64_t)v1;

  if (!nrXPCCopyQueue_nrXPCQueue)
  {
    v6 = nrCopyLogObj_2128();
    v7 = v6;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
      {
LABEL_20:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v23 = _os_log_pack_fill();
        *(_DWORD *)v23 = 136446210;
        *(_QWORD *)(v23 + 4) = "nrXPCCopyQueue_block_invoke";
        v24 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v24);
      }
    }
    v17 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v17, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (nrXPCQueue) != ((void *)0)", v18, v19, v20, v21, v22, (uint64_t)"");

    goto LABEL_20;
  }
}

id nrCopyLogObj_2128()
{
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  return (id)nrCopyLogObj_sNRLogObj_2135;
}

void __nrCopyLogObj_block_invoke_2136()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_2135;
  nrCopyLogObj_sNRLogObj_2135 = (uint64_t)v0;

}

char *nrXPCSendPingCopyResponse()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  char *string;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  _BOOL4 v66;
  __CFString *StringFromNRXPCRes;
  __CFString *v68;
  uint64_t v69;
  char __strerrbuf[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v53 = nrCopyLogObj_2128();
    v54 = v53;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        v65 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v65);
      }
    }
    v58 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_80;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 1uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCSendPingCopyResponse", v1);
  v3 = v2;
  if (!v2)
  {
    v56 = nrCopyLogObj_2128();
    v57 = v56;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x1DF0BA7A8](v16) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v22);
        if (!value)
        {

          string = (char *)xpc_dictionary_get_string(v3, "PingMessage");
          if (string)
            string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
          goto LABEL_35;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v44 = nrCopyLogObj_2128();
            v45 = v44;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46)
                goto LABEL_33;
            }
            v47 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          v68 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    string = (char *)MEMORY[0x1DF0BA6A0](v3);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)string);
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  string = (char *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)string);
LABEL_10:
  if (string)
  {
    free(string);
LABEL_34:
    string = 0;
  }
LABEL_35:

  return string;
}

xpc_object_t nrXPCSendSyncInner(uint64_t a1, void *a2)
{
  id v2;
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  _BOOL4 v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v2 = a2;
  v3 = (_xpc_connection_s *)nrXPCCopyConnection();
  v4 = v3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_3;
  }
  v5 = xpc_connection_send_message_with_reply_sync(v3, v2);
  v6 = (xpc_object_t)MEMORY[0x1E0C81258];
  if (v5 == (xpc_object_t)MEMORY[0x1E0C81258])
  {
    v8 = nrCopyLogObj_2128();
    v9 = v8;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (!v10)
        goto LABEL_9;
    }
    v11 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v11, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v12, v13, v14, v15, v16, (uint64_t)"");

LABEL_9:
    v5 = xpc_connection_send_message_with_reply_sync(v4, v2);

    if (v5 != v6)
      goto LABEL_3;
    v17 = nrCopyLogObj_2128();
    v18 = v17;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (!v19)
        goto LABEL_14;
    }
    v20 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v20, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v21, v22, v23, v24, v25, (uint64_t)"");

LABEL_14:
    v5 = xpc_connection_send_message_with_reply_sync(v4, v2);

    if (v5 != v6)
      goto LABEL_3;
    v26 = nrCopyLogObj_2128();
    v27 = v26;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v28 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (!v28)
        goto LABEL_19;
    }
    v29 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v29, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v30, v31, v32, v33, v34, (uint64_t)"");

LABEL_19:
    v5 = xpc_connection_send_message_with_reply_sync(v4, v2);

    if (v5 != v6)
      goto LABEL_3;
    v35 = nrCopyLogObj_2128();
    v36 = v35;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v37 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

      if (!v37)
        goto LABEL_24;
    }
    v38 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v38, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v39, v40, v41, v42, v43, (uint64_t)"");

LABEL_24:
    v5 = xpc_connection_send_message_with_reply_sync(v4, v2);

    if (v5 != v6)
      goto LABEL_3;
    v44 = nrCopyLogObj_2128();
    v45 = v44;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

      if (!v46)
      {
LABEL_29:
        v5 = (xpc_object_t)MEMORY[0x1E0C81258];
        goto LABEL_3;
      }
    }
    v47 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v48, v49, v50, v51, v52, (uint64_t)"");

    goto LABEL_29;
  }
LABEL_3:

  return v5;
}

id nrXPCCopyConnection()
{
  id v0;
  NSObject *v1;
  id v2;
  _QWORD v4[4];
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (nrXPCCopyQueue_onceToken != -1)
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
  v0 = (id)nrXPCCopyQueue_nrXPCQueue;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2150;
  v11 = __Block_byref_object_dispose__2151;
  v12 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __nrXPCCopyConnection_block_invoke;
  v4[3] = &unk_1EA3F7AD0;
  v5 = v0;
  v6 = &v7;
  v1 = v0;
  dispatch_sync(v1, v4);
  v2 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v2;
}

uint64_t __Block_byref_object_copy__2150(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2151(uint64_t a1)
{

}

void __nrXPCCopyConnection_block_invoke(uint64_t a1)
{
  void *v2;
  xpc_connection_t mach_service;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _xpc_connection_s *v8;
  id v9;
  _QWORD handler[4];
  id v11;

  v2 = (void *)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection;
  if (nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection)
    goto LABEL_2;
  mach_service = xpc_connection_create_mach_service("com.apple.terminusd", *(dispatch_queue_t *)(a1 + 32), 2uLL);
  v4 = (void *)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection;
  nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection = (uint64_t)mach_service;

  if (nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection)
  {
    v5 = MEMORY[0x1DF0BA7A8]();
    v6 = (void *)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection;
    if (v5 == MEMORY[0x1E0C812E0])
    {
      v7 = (id)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection;
      v8 = (_xpc_connection_s *)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __nrXPCCopyConnection_block_invoke_2;
      handler[3] = &unk_1EA3F7AA8;
      v11 = v7;
      v9 = v7;
      xpc_connection_set_event_handler(v8, handler);
      xpc_connection_activate((xpc_connection_t)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection);

      v2 = (void *)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection;
      if (!nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection)
        return;
      goto LABEL_2;
    }
    if (nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection)
    {
      nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection = 0;

      v2 = (void *)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection;
      if (nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection)
LABEL_2:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
    }
  }
}

void __nrXPCCopyConnection_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = MEMORY[0x1DF0BA7A8]();
  v4 = v13;
  if (v13 != (id)MEMORY[0x1E0C81258])
  {
    v5 = v3 != MEMORY[0x1E0C81310] || nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection == 0;
    if (!v5 && *(_QWORD *)(a1 + 32) == nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection)
    {
      xpc_connection_cancel((xpc_connection_t)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection);
      v12 = (void *)nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection;
      nrXPCEntitlementXPCComm_block_invoke_sNRXPCConnection = 0;

      goto LABEL_16;
    }
    if (v3 == MEMORY[0x1E0C812F8])
    {
      v11 = (void *)MEMORY[0x1DF0BA6A0](v13);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"unexpected message from %s: %s", v6, v7, v8, v9, v10, (uint64_t)"com.apple.terminusd");
      v4 = v13;
      if (v11)
      {
        free(v11);
LABEL_16:
        v4 = v13;
      }
    }
  }

}

uint64_t nrXPCTestNRLinkDirectorMessage()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  _BOOL4 v66;
  __CFString *StringFromNRXPCRes;
  __CFString *v68;
  uint64_t v69;
  char __strerrbuf[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v53 = nrCopyLogObj_2128();
    v54 = v53;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        v65 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v65);
      }
    }
    v58 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_79;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x22uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCTestNRLinkDirectorMessage", v1);
  v3 = v2;
  if (!v2)
  {
    v56 = nrCopyLogObj_2128();
    v57 = v56;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x1DF0BA7A8](v16) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v22);
        if (!value)
        {

          v15 = xpc_dictionary_get_BOOL(v3, "TestNRLinkDirectorMessage");
          goto LABEL_35;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v44 = nrCopyLogObj_2128();
            v45 = v44;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46)
                goto LABEL_33;
            }
            v47 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          v68 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    v15 = MEMORY[0x1DF0BA6A0](v3);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, v15);
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  v15 = MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, v15);
LABEL_10:
  if (v15)
  {
    free((void *)v15);
LABEL_34:
    v15 = 0;
  }
LABEL_35:

  return v15;
}

BOOL nrXPCCompanionLinkDefault()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  _BOOL4 v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  _BOOL4 v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __CFString *StringFromNRXPCRes;
  __CFString *v82;
  uint64_t v83;
  char __strerrbuf[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v61 = nrCopyLogObj_2128();
    v62 = v61;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        v73 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v73);
      }
    }
    v66 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x19uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkDefault", v1);
  v3 = v2;
  if (!v2)
  {
    v64 = nrCopyLogObj_2128();
    v65 = v64;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        v45 = 0;
        goto LABEL_63;
      }
    }
    v75 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x1DF0BA7A8](v17) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v23);
        if (!value)
        {
          v16 = 0;
          goto LABEL_36;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v52 = nrCopyLogObj_2128();
            v53 = v52;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54)
                goto LABEL_35;
            }
            v55 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          v82 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x1E0C81310])
  {
    if (v3 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v39 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      if (v15)
        goto LABEL_11;
    }
LABEL_61:
    v16 = 1;
    goto LABEL_62;
  }
  v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  if (!v15)
    goto LABEL_61;
LABEL_11:
  free(v15);
  v16 = 1;
LABEL_62:
  v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionLinkEnable()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  _BOOL4 v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  _BOOL4 v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __CFString *StringFromNRXPCRes;
  __CFString *v82;
  uint64_t v83;
  char __strerrbuf[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v61 = nrCopyLogObj_2128();
    v62 = v61;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        v73 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v73);
      }
    }
    v66 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 2uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkEnable", v1);
  v3 = v2;
  if (!v2)
  {
    v64 = nrCopyLogObj_2128();
    v65 = v64;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        v45 = 0;
        goto LABEL_63;
      }
    }
    v75 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x1DF0BA7A8](v17) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v23);
        if (!value)
        {
          v16 = 0;
          goto LABEL_36;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v52 = nrCopyLogObj_2128();
            v53 = v52;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54)
                goto LABEL_35;
            }
            v55 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          v82 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x1E0C81310])
  {
    if (v3 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v39 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      if (v15)
        goto LABEL_11;
    }
LABEL_61:
    v16 = 1;
    goto LABEL_62;
  }
  v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  if (!v15)
    goto LABEL_61;
LABEL_11:
  free(v15);
  v16 = 1;
LABEL_62:
  v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionLinkDisable()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  _BOOL4 v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  _BOOL4 v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __CFString *StringFromNRXPCRes;
  __CFString *v82;
  uint64_t v83;
  char __strerrbuf[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v61 = nrCopyLogObj_2128();
    v62 = v61;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        v73 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v73);
      }
    }
    v66 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 3uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkDisable", v1);
  v3 = v2;
  if (!v2)
  {
    v64 = nrCopyLogObj_2128();
    v65 = v64;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        v45 = 0;
        goto LABEL_63;
      }
    }
    v75 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x1DF0BA7A8](v17) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v23);
        if (!value)
        {
          v16 = 0;
          goto LABEL_36;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v52 = nrCopyLogObj_2128();
            v53 = v52;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54)
                goto LABEL_35;
            }
            v55 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          v82 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x1E0C81310])
  {
    if (v3 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v39 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      if (v15)
        goto LABEL_11;
    }
LABEL_61:
    v16 = 1;
    goto LABEL_62;
  }
  v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  if (!v15)
    goto LABEL_61;
LABEL_11:
  free(v15);
  v16 = 1;
LABEL_62:
  v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionEnableBluetoothPacketParser(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x2AuLL);
  xpc_dictionary_set_BOOL(v3, "EnableBluetoothPacketParser", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionEnableBluetoothPacketParser", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

uint64_t nrXPCCompanionLinkIsEnabled()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  _BOOL4 v66;
  __CFString *StringFromNRXPCRes;
  __CFString *v68;
  uint64_t v69;
  char __strerrbuf[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v53 = nrCopyLogObj_2128();
    v54 = v53;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        v65 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v65);
      }
    }
    v58 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_79;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0xCuLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkIsEnabled", v1);
  v3 = v2;
  if (!v2)
  {
    v56 = nrCopyLogObj_2128();
    v57 = v56;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x1DF0BA7A8](v16) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v22);
        if (!value)
        {

          v15 = xpc_dictionary_get_BOOL(v3, "CompanionLinkIsEnabled");
          goto LABEL_35;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v44 = nrCopyLogObj_2128();
            v45 = v44;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46)
                goto LABEL_33;
            }
            v47 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          v68 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    v15 = MEMORY[0x1DF0BA6A0](v3);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, v15);
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  v15 = MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, v15);
LABEL_10:
  if (v15)
  {
    free((void *)v15);
LABEL_34:
    v15 = 0;
  }
LABEL_35:

  return v15;
}

uint64_t nrXPCSupportsRestrictedPorts(const unsigned __int8 *a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  _BOOL4 v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  _BOOL4 v57;
  NSObject *v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  _BOOL4 v68;
  __CFString *StringFromNRXPCRes;
  __CFString *v70;
  uint64_t v71;
  char __strerrbuf[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v55 = nrCopyLogObj_2128();
    v56 = v55;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

      if (!v57)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v66 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v66, (uint64_t)"nr_xpc_dictionary_create");
        v67 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v67);
      }
    }
    v60 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v60, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_79;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x23uLL);
  xpc_dictionary_set_uuid(v3, "DeviceIdentifier", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCSupportsRestrictedPorts", v3);
  v5 = v4;
  if (!v4)
  {
    v58 = nrCopyLogObj_2128();
    v59 = v58;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v68 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);

      if (!v68)
        goto LABEL_34;
    }
    v25 = nrCopyLogObj_2128();
    v24 = v25;
    v26 = "received nil response";
    goto LABEL_32;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v18 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v18;
    if (v18)
    {
      if (MEMORY[0x1DF0BA7A8](v18) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v24);
        if (!value)
        {

          v17 = xpc_dictionary_get_BOOL(v5, "SupportsRestrictedPorts");
          goto LABEL_35;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v46 = nrCopyLogObj_2128();
            v47 = v46;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v48 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

              if (!v48)
                goto LABEL_33;
            }
            v49 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v49, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v35 = nrCopyLogObj_2128();
          v70 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v41, v42, v43, v44, v45, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v25 = (id)nrCopyLogObj_sNRLogObj_2135;
      v26 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v25 = (id)nrCopyLogObj_sNRLogObj_2135;
      v26 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v25, 17, (uint64_t)v26, v19, v20, v21, v22, v23, v71);
    goto LABEL_33;
  }
  if (v6 != MEMORY[0x1E0C81310])
  {
    v17 = MEMORY[0x1DF0BA6A0](v5);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, v17);
    goto LABEL_10;
  }
  if (v5 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v71);
    goto LABEL_34;
  }
  if (v5 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
    goto LABEL_34;
  }
  if (v5 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v25 = nrCopyLogObj_2128();
    v24 = v25;
    v26 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  v17 = MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v27, v28, v29, v30, v31, v17);
LABEL_10:
  if (v17)
  {
    free((void *)v17);
LABEL_34:
    v17 = 0;
  }
LABEL_35:

  return v17;
}

void nrXPCRefreshCompanionProxyAgent()
{
  xpc_object_t v0;
  void *v1;
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  _QWORD *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v7 = nrCopyLogObj_2128();
    v8 = v7;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_13:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v16 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v16, (uint64_t)"nr_xpc_dictionary_create");
        v17 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v17);
      }
    }
    v10 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v11, v12, v13, v14, v15, (uint64_t)"");

    goto LABEL_13;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x24uLL);
  if (nrXPCCopyQueue_onceToken != -1)
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2127);
  v2 = (id)nrXPCCopyQueue_nrXPCQueue;
  v3 = v1;
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
  v18[3] = &unk_1EA3F7AF8;
  v19 = &__block_literal_global_294;
  v5 = v18;
  v6 = nrXPCCopyConnection();
  if (v6)
  {
    nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v6, v3, v2, v5, 1u);
  }
  else
  {
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __nrXPCSendAsyncInner_block_invoke;
    block[3] = &unk_1EA3F7A20;
    v21 = v5;
    dispatch_async(v2, block);

  }
}

void __nrXPCSendAsyncOnlyResultCode_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  void (*v35)(void);
  unint64_t value;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  const char *string;
  __CFString *StringFromNRXPCRes;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  void (*v67)(void);
  NSObject *v68;
  NSObject *v69;
  _BOOL4 v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char __strerrbuf[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v68 = nrCopyLogObj_2128();
    v69 = v68;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v70 = os_log_type_enabled(v68, OS_LOG_TYPE_FAULT);

      if (!v70)
      {
LABEL_108:
        v35 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
        goto LABEL_73;
      }
    }
    v71 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v71, 17, (uint64_t)"received nil response", v72, v73, v74, v75, v76, v77);

    goto LABEL_108;
  }
  v5 = MEMORY[0x1DF0BA7A8](v3);
  v11 = MEMORY[0x1E0C812F8];
  if (v5 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v4, "Result");
    v20 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v20;
    if (!v20)
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v27 = nrCopyLogObj_sNRLogObj_2135;
        v28 = "received response without result code";
        goto LABEL_36;
      }
LABEL_37:
      if (v4 != (void *)MEMORY[0x1E0C81258])
      {
        if (v4 != (void *)MEMORY[0x1E0C81260])
        {
          if (v4 != (void *)MEMORY[0x1E0C81288])
          {
            if (MEMORY[0x1DF0BA7A8](v4) == v11)
            {
              string = xpc_dictionary_get_string(v4, "ErrorDescription");
              xpc_dictionary_get_int64(v4, "Result");
              if (string)
                v34 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
              else
                v34 = CFSTR("Received bad XPC response");
              goto LABEL_42;
            }
LABEL_41:
            v34 = CFSTR("Received bad XPC response");
LABEL_42:
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_101:
            goto LABEL_102;
          }
LABEL_99:
          v67 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
          goto LABEL_100;
        }
LABEL_98:
        v67 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
        goto LABEL_100;
      }
      goto LABEL_97;
    }
    if (MEMORY[0x1DF0BA7A8](v20) != MEMORY[0x1E0C81328])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v27 = nrCopyLogObj_sNRLogObj_2135;
        v28 = "received invalid result type";
LABEL_36:
        _NRLogWithArgs(v27, 17, (uint64_t)v28, v21, v22, v23, v24, v25, v77);
        goto LABEL_37;
      }
      goto LABEL_37;
    }
    value = xpc_int64_get_value(v26);
    if (!value)
    {

      v35 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_73;
    }
    v37 = value;
    if (!(value >> 31))
    {
      if (strerror_r(value, __strerrbuf, 0x80uLL))
        __strerrbuf[0] = 0;
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v38 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v38, 17, (uint64_t)"received failure result code: [%d] %s", v39, v40, v41, v42, v43, v37);
LABEL_90:

      }
LABEL_91:
      if (v4 != (void *)MEMORY[0x1E0C81258])
      {
        if (v4 != (void *)MEMORY[0x1E0C81260])
        {
          if (v4 != (void *)MEMORY[0x1E0C81288])
          {
            if (MEMORY[0x1DF0BA7A8](v4) == v11)
            {
              v66 = xpc_dictionary_get_string(v4, "ErrorDescription");
              xpc_dictionary_get_int64(v4, "Result");
              if (v66)
                v34 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v66);
              else
                v34 = CFSTR("Received bad XPC response");
              goto LABEL_42;
            }
            goto LABEL_41;
          }
          goto LABEL_99;
        }
        goto LABEL_98;
      }
LABEL_97:
      v67 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_100:
      v67();
      goto LABEL_101;
    }
    if ((value | 2) == 0xFFFFF822)
    {
      v51 = nrCopyLogObj_2128();
      v52 = v51;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v60 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);

        if (!v60)
          goto LABEL_91;
      }
      v38 = nrCopyLogObj_2128();
      StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v37);
      _NRLogWithArgs((uint64_t)v38, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v61, v62, v63, v64, v65, (uint64_t)"");
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_91;
      v38 = nrCopyLogObj_2128();
      StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v37);
      _NRLogWithArgs((uint64_t)v38, 17, (uint64_t)"received internal failure result code: [%lld] %@", v55, v56, v57, v58, v59, v37);
    }

    goto LABEL_90;
  }
  v12 = (void *)MEMORY[0x1E0C81258];
  if (v5 != MEMORY[0x1E0C81310])
  {
    v18 = (void *)MEMORY[0x1DF0BA6A0](v4);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v13, v14, v15, v16, v17, (uint64_t)v18);
LABEL_9:
    if (v18)
      free(v18);
    goto LABEL_11;
  }
  if (v4 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v6, v7, v8, v9, v10, v77);
    goto LABEL_58;
  }
  if (v4 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v6, v7, v8, v9, v10, (uint64_t)"");
  }
  else
  {
    if (v4 != (void *)MEMORY[0x1E0C81288])
    {
      v18 = (void *)MEMORY[0x1DF0BA6A0](v4);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v29, v30, v31, v32, v33, (uint64_t)v18);
      goto LABEL_9;
    }
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    {
      v45 = nrCopyLogObj_2128();
      _NRLogWithArgs((uint64_t)v45, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v46, v47, v48, v49, v50, v77);

    }
  }
LABEL_11:
  if (v4 == v12)
  {
LABEL_58:
    v35 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_73;
  }
  if (v4 == (void *)MEMORY[0x1E0C81260])
  {
    v35 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_73:
    v35();
    goto LABEL_102;
  }
  if (v4 == (void *)MEMORY[0x1E0C81288])
  {
    v35 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_73;
  }
  if (MEMORY[0x1DF0BA7A8](v4) == v11)
  {
    v44 = xpc_dictionary_get_string(v4, "ErrorDescription");
    xpc_dictionary_get_int64(v4, "Result");
    if (v44)
      v19 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v44);
    else
      v19 = CFSTR("Received bad XPC response");
  }
  else
  {
    v19 = CFSTR("Received bad XPC response");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_102:
}

uint64_t __nrXPCSendAsyncInner_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void nrXPCSendAsyncInnerRec(uint64_t a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  _xpc_connection_s *v17;
  id v18;
  dispatch_queue_t v19;
  id v20;
  uint64_t v21;
  unsigned int v22;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (a6 >= 6)
  {
    (*((void (**)(id, _QWORD))v14 + 2))(v14, MEMORY[0x1E0C81258]);
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __nrXPCSendAsyncInnerRec_block_invoke;
    v16[3] = &unk_1EA3F7B20;
    v20 = v14;
    v21 = a1;
    v22 = a6;
    v17 = (_xpc_connection_s *)v11;
    v18 = v12;
    v19 = (dispatch_queue_t)v13;
    xpc_connection_send_message_with_reply(v17, v18, v19, v16);

  }
}

uint64_t __nrXPCSendAsyncInnerRec_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a2 != MEMORY[0x1E0C81258])
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v4 = nrCopyLogObj_2128();
  if (sNRCopyLogToStdErr)
  {

LABEL_6:
    v7 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v7, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v8, v9, v10, v11, v12, (uint64_t)"");

    return nrXPCSendAsyncInnerRec(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (*(_DWORD *)(a1 + 72) + 1));
  }
  v5 = v4;
  v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v6)
    goto LABEL_6;
  return nrXPCSendAsyncInnerRec(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (*(_DWORD *)(a1 + 72) + 1));
}

void __nrXPCRefreshCompanionProxyAgent_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v10 = a3;
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr
    || (v8 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT), v9 = v10, v8))
  {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Refresh generation response %lld (%@)", v3, v4, v5, v6, v7, (uint64_t)"");
    v9 = v10;
  }

}

char *nrXPCCompanionLinkCopyStatus()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  char *string;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  _BOOL4 v66;
  __CFString *StringFromNRXPCRes;
  __CFString *v68;
  uint64_t v69;
  char __strerrbuf[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v53 = nrCopyLogObj_2128();
    v54 = v53;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        v65 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v65);
      }
    }
    v58 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_80;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 4uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkCopyStatus", v1);
  v3 = v2;
  if (!v2)
  {
    v56 = nrCopyLogObj_2128();
    v57 = v56;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x1DF0BA7A8](v16) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v22);
        if (!value)
        {

          string = (char *)xpc_dictionary_get_string(v3, "CompanionLinkStatusMessage");
          if (string)
            string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
          goto LABEL_35;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v44 = nrCopyLogObj_2128();
            v45 = v44;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46)
                goto LABEL_33;
            }
            v47 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          v68 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    string = (char *)MEMORY[0x1DF0BA6A0](v3);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)string);
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  string = (char *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)string);
LABEL_10:
  if (string)
  {
    free(string);
LABEL_34:
    string = 0;
  }
LABEL_35:

  return string;
}

BOOL NRDiagnosticSaveNetworkRelayStatusToDirectory(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v1 = a1;
  if (!v1)
  {
    v15 = nrCopyLogObj_2128();
    v16 = v15;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v17)
        goto LABEL_38;
    }
    v24 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v24, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL directoryPath", v25, v26, v27, v28, v29, (uint64_t)"");

    goto LABEL_38;
  }
  v2 = v1;
  if (!objc_msgSend(v1, "length"))
  {
    v18 = nrCopyLogObj_2128();
    v19 = v18;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v20 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (!v20)
        goto LABEL_38;
    }
    v30 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v30, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL directoryPath.length", v31, v32, v33, v34, v35, (uint64_t)"");

    goto LABEL_38;
  }
  if (!objc_msgSend(v2, "UTF8String"))
  {
    v21 = nrCopyLogObj_2128();
    v22 = v21;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v23 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v23)
      {
LABEL_38:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v42 = _os_log_pack_fill();
        *(_DWORD *)v42 = 136446466;
        *(_QWORD *)(v42 + 4) = "NRDiagnosticSaveNetworkRelayStatusToDirectory";
        *(_WORD *)(v42 + 12) = 2080;
        *(_QWORD *)(v42 + 14) = "NRDiagnosticSaveNetworkRelayStatusToDirectory";
        v43 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v43);
      }
    }
    v36 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v36, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL directoryPathC", v37, v38, v39, v40, v41, (uint64_t)"");

    goto LABEL_38;
  }
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Saving diagnostic status to directory \"%s\"", v3, v4, v5, v6, v7, (uint64_t)"");
  nrSaveNetworkRelayStatusToDirectory(v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (nrCopyLogObj_onceToken_2134 == -1)
    {
      if (sNRCopyLogToStdErr)
        goto LABEL_19;
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr)
        goto LABEL_19;
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
LABEL_19:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Failed to save diagnostic status to directory \"%s\"", v8, v9, v10, v11, v12, (uint64_t)"");
    goto LABEL_20;
  }
  if (nrCopyLogObj_onceToken_2134 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_14:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Saved diagnostic status to directory \"%s\"", v8, v9, v10, v11, v12, (uint64_t)"");
      goto LABEL_20;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr)
      goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
    goto LABEL_14;
LABEL_20:

  return v13 != 0;
}

id nrSaveNetworkRelayStatusToDirectory(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  char v18;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  if (objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v1, &v18))
    v8 = v18 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Creating temporary directory at \"%@\"", v3, v4, v5, v6, v7, (uint64_t)"");
    v17 = 0;
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v17);
    v9 = v17;
    if (v9)
    {
      v15 = v9;
      if (nrCopyLogObj_onceToken_2134 == -1)
      {
        if (sNRCopyLogToStdErr)
          goto LABEL_15;
      }
      else
      {
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
        if (sNRCopyLogToStdErr)
          goto LABEL_15;
      }
      if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        v15 = 0;
        goto LABEL_22;
      }
LABEL_15:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d Failed to create directory at \"%@\": %@", v10, v11, v12, v13, v14, (uint64_t)"");
      goto LABEL_21;
    }
    if (nrCopyLogObj_onceToken_2134 == -1)
    {
      if (!sNRCopyLogToStdErr)
        goto LABEL_18;
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr)
      {
LABEL_18:
        if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
      }
    }
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Created temporary directory at \"%@\"", v10, v11, v12, v13, v14, (uint64_t)"");
  }
LABEL_20:
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("companion_link_status_phone.txt"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!nrSaveNetworkRelayStatusToFile(v15))
    goto LABEL_21;
LABEL_22:

  return v15;
}

BOOL nrSaveNetworkRelayStatusToFile(void *a1)
{
  id v1;
  const char *v2;
  const char *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  xpc_object_t v11;
  void *v12;
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t value;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v59;
  NSObject *v60;
  _BOOL4 v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BOOL4 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL4 v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  NSObject *v82;
  _BOOL4 v83;
  NSObject *v84;
  NSObject *v85;
  _BOOL4 v86;
  NSObject *v87;
  NSObject *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  _BOOL4 v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  __CFString *StringFromNRXPCRes;
  __CFString *v112;
  uint64_t v113;
  char __strerrbuf[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (const char *)objc_msgSend(v1, "UTF8String");
  if (!v2)
  {
    v81 = nrCopyLogObj_2128();
    v82 = v81;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v83 = os_log_type_enabled(v81, OS_LOG_TYPE_ERROR);

      if (!v83)
        goto LABEL_94;
    }
    v89 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v89, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL filePathC", v90, v91, v92, v93, v94, (uint64_t)"");

LABEL_94:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v95 = _os_log_pack_fill();
    *(_DWORD *)v95 = 136446466;
    *(_QWORD *)(v95 + 4) = "nrSaveNetworkRelayStatusToFile";
    *(_WORD *)(v95 + 12) = 2080;
    *(_QWORD *)(v95 + 14) = "nrSaveNetworkRelayStatusToFile";
    goto LABEL_98;
  }
  v3 = v2;
  v4 = open(v2, 1793, 420);
  if ((v4 & 0x80000000) == 0)
  {
    v10 = v4;
    v11 = xpc_dictionary_create(0, 0, 0);
    if (v11)
    {
      v12 = v11;
      xpc_dictionary_set_uint64(v11, "Type", 0x21uLL);
      xpc_dictionary_set_fd(v12, "CompanionLinkStatusDumpToFileDescriptor", v10);
      xpc_dictionary_set_string(v12, "CompanionLinkStatusDumpToFilePath", v3);
      v13 = nrXPCSendSyncInner((uint64_t)"nrSaveNetworkRelayStatusToFile", v12);
      close(v10);
      if (v13)
      {
        v14 = MEMORY[0x1DF0BA7A8](v13);
        if (v14 != MEMORY[0x1E0C812F8])
        {
          if (v14 != MEMORY[0x1E0C81310])
          {
            v25 = (void *)MEMORY[0x1DF0BA6A0](v13);
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v20, v21, v22, v23, v24, (uint64_t)v25);
            if (v25)
            {
LABEL_13:
              free(v25);
              v26 = 1;
LABEL_68:
              v27 = v26 == 0;
LABEL_69:

              goto LABEL_70;
            }
LABEL_67:
            v26 = 1;
            goto LABEL_68;
          }
          if (v13 == (xpc_object_t)MEMORY[0x1E0C81258])
          {
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v15, v16, v17, v18, v19, v113);
              v26 = 1;
              goto LABEL_68;
            }
            goto LABEL_67;
          }
          if (v13 == (xpc_object_t)MEMORY[0x1E0C81260])
          {
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
              goto LABEL_67;
            v47 = nrCopyLogObj_2128();
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v48, v49, v50, v51, v52, (uint64_t)"");
          }
          else
          {
            if (v13 != (xpc_object_t)MEMORY[0x1E0C81288])
            {
              v25 = (void *)MEMORY[0x1DF0BA6A0](v13);
              if (nrCopyLogObj_onceToken_2134 != -1)
                dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
              if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              {
                v37 = nrCopyLogObj_2128();
                _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received returned unknown XPC error %s", v38, v39, v40, v41, v42, (uint64_t)v25);

              }
              if (v25)
                goto LABEL_13;
              goto LABEL_67;
            }
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              goto LABEL_67;
            v47 = nrCopyLogObj_2128();
            _NRLogWithArgs((uint64_t)v47, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v53, v54, v55, v56, v57, v113);
          }

          v26 = 1;
          goto LABEL_68;
        }
        xpc_dictionary_get_value(v13, "Result");
        v28 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v28;
        if (v28)
        {
          if (MEMORY[0x1DF0BA7A8](v28) == MEMORY[0x1E0C81328])
          {
            value = xpc_int64_get_value(v34);
            if (!value)
            {
              v26 = 0;
              goto LABEL_43;
            }
            v44 = value;
            if (value >> 31)
            {
              v59 = nrCopyLogObj_2128();
              v60 = v59;
              if (!(_DWORD)v44)
              {
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v74 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);

                  if (!v74)
                    goto LABEL_42;
                }
                v75 = nrCopyLogObj_2128();
                StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v44);
                _NRLogWithArgs((uint64_t)v75, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v76, v77, v78, v79, v80, (uint64_t)"");

                goto LABEL_42;
              }
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v68 = os_log_type_enabled(v59, OS_LOG_TYPE_FAULT);

                if (!v68)
                  goto LABEL_42;
              }
              v62 = nrCopyLogObj_2128();
              v112 = (__CFString *)createStringFromNRXPCRes(v44);
              _NRLogWithArgs((uint64_t)v62, 17, (uint64_t)"received internal failure result code: [%lld] %@", v69, v70, v71, v72, v73, v44);

            }
            else
            {
              if (strerror_r(value, __strerrbuf, 0x80uLL))
                __strerrbuf[0] = 0;
              v45 = nrCopyLogObj_2128();
              v46 = v45;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v61 = os_log_type_enabled(v45, OS_LOG_TYPE_FAULT);

                if (!v61)
                  goto LABEL_42;
              }
              v62 = nrCopyLogObj_2128();
              _NRLogWithArgs((uint64_t)v62, 17, (uint64_t)"received failure result code: [%d] %s", v63, v64, v65, v66, v67, v44);
            }

            goto LABEL_42;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_42;
          v35 = nrCopyLogObj_sNRLogObj_2135;
          v36 = "received invalid result type";
        }
        else
        {
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_42;
          v35 = nrCopyLogObj_sNRLogObj_2135;
          v36 = "received response without result code";
        }
        _NRLogWithArgs(v35, 17, (uint64_t)v36, v29, v30, v31, v32, v33, v113);
LABEL_42:
        v26 = 1;
LABEL_43:

        goto LABEL_68;
      }
      v87 = nrCopyLogObj_2128();
      v88 = v87;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v104 = os_log_type_enabled(v87, OS_LOG_TYPE_FAULT);

        if (!v104)
        {
LABEL_101:
          v27 = 0;
          goto LABEL_69;
        }
      }
      v105 = nrCopyLogObj_2128();
      _NRLogWithArgs((uint64_t)v105, 17, (uint64_t)"received nil response", v106, v107, v108, v109, v110, v113);

      goto LABEL_101;
    }
    v84 = nrCopyLogObj_2128();
    v85 = v84;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v86 = os_log_type_enabled(v84, OS_LOG_TYPE_ERROR);

      if (!v86)
        goto LABEL_97;
    }
    v96 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v96, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v97, v98, v99, v100, v101, (uint64_t)"");

LABEL_97:
    _os_log_pack_size();
    MEMORY[0x1E0C80A78]();
    __error();
    v102 = _os_log_pack_fill();
    __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v102, (uint64_t)"nr_xpc_dictionary_create");
LABEL_98:
    v103 = nrCopyLogObj_2128();
    _NRLogAbortWithPack(v103);
  }
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
  {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"Failed to open \"%s\"", v5, v6, v7, v8, v9, (uint64_t)v3);
    v27 = 0;
  }
  else
  {
    v27 = 0;
  }
LABEL_70:

  return v27;
}

id NRDiagnosticSaveNetworkRelayStatusToTempDirectory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  char v29;

  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Saving diagnostic status to temp directory", a4, a5, a6, a7, a8, (uint64_t)"");
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("/tmp/terminusd/%@"), v10);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  if (objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v11, &v29) && v29)
    goto LABEL_21;
  if (nrCopyLogObj_onceToken_2134 == -1)
  {
    if (!sNRCopyLogToStdErr)
      goto LABEL_10;
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr)
    {
LABEL_10:
      if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
    }
  }
  _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Creating temporary directory at \"%@\"", v13, v14, v15, v16, v17, (uint64_t)"");
LABEL_12:
  v28 = 0;
  objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v28);
  v18 = v28;
  if (v18)
  {
    v24 = v18;
    if (nrCopyLogObj_onceToken_2134 == -1)
    {
      if (!sNRCopyLogToStdErr)
        goto LABEL_15;
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr)
      {
LABEL_15:
        if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
        {
          v25 = 0;
          goto LABEL_23;
        }
      }
    }
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d Failed to create directory at \"%@\": %@", v19, v20, v21, v22, v23, (uint64_t)"");
    v25 = 0;
    goto LABEL_23;
  }
  if (nrCopyLogObj_onceToken_2134 == -1)
  {
    if (!sNRCopyLogToStdErr)
      goto LABEL_19;
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr)
    {
LABEL_19:
      if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
    }
  }
  _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Created temporary directory at \"%@\"", v19, v20, v21, v22, v23, (uint64_t)"");
LABEL_21:
  nrSaveNetworkRelayStatusToDirectory(v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = v26;
  if (v24)
    objc_msgSend(v26, "addObject:", v24);
LABEL_23:

  return v25;
}

BOOL NRDiagnosticSaveNetworkRelayStatusToFile(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v1 = a1;
  if (!v1)
  {
    v15 = nrCopyLogObj_2128();
    v16 = v15;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v17)
        goto LABEL_31;
    }
    v24 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v24, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL filePath", v25, v26, v27, v28, v29, (uint64_t)"");

    goto LABEL_31;
  }
  v2 = v1;
  if (!objc_msgSend(v1, "length"))
  {
    v18 = nrCopyLogObj_2128();
    v19 = v18;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v20 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (!v20)
        goto LABEL_31;
    }
    v30 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v30, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL filePath.length", v31, v32, v33, v34, v35, (uint64_t)"");

    goto LABEL_31;
  }
  if (!objc_msgSend(v2, "UTF8String"))
  {
    v21 = nrCopyLogObj_2128();
    v22 = v21;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v23 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v23)
      {
LABEL_31:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v42 = _os_log_pack_fill();
        *(_DWORD *)v42 = 136446466;
        *(_QWORD *)(v42 + 4) = "NRDiagnosticSaveNetworkRelayStatusToFile";
        *(_WORD *)(v42 + 12) = 2080;
        *(_QWORD *)(v42 + 14) = "NRDiagnosticSaveNetworkRelayStatusToFile";
        v43 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v43);
      }
    }
    v36 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v36, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL filePathC", v37, v38, v39, v40, v41, (uint64_t)"");

    goto LABEL_31;
  }
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Saving diagnostic status to file \"%s\"", v3, v4, v5, v6, v7, (uint64_t)"");
  v13 = nrSaveNetworkRelayStatusToFile(v2);
  if (nrCopyLogObj_onceToken_2134 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_12:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 0, (uint64_t)"%s%.30s:%-4d Saved diagnostic status to file \"%s\"", v8, v9, v10, v11, v12, (uint64_t)"");
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr)
      goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_DEFAULT))
    goto LABEL_12;
LABEL_13:

  return v13;
}

void *nrXPCCompanionLinkCancel()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *uint64;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  _BOOL4 v66;
  __CFString *StringFromNRXPCRes;
  __CFString *v68;
  uint64_t v69;
  char __strerrbuf[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v53 = nrCopyLogObj_2128();
    v54 = v53;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        v65 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v65);
      }
    }
    v58 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_79;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 5uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkCancel", v1);
  v3 = v2;
  if (!v2)
  {
    v56 = nrCopyLogObj_2128();
    v57 = v56;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x1DF0BA7A8](v16) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v22);
        if (!value)
        {

          uint64 = (void *)xpc_dictionary_get_uint64(v3, "CompanionLinkCount");
          goto LABEL_35;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v44 = nrCopyLogObj_2128();
            v45 = v44;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46)
                goto LABEL_33;
            }
            v47 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          v68 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    uint64 = (void *)MEMORY[0x1DF0BA6A0](v3);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)uint64);
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64 = (void *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)uint64);
LABEL_10:
  if (uint64)
  {
    free(uint64);
LABEL_34:
    uint64 = 0;
  }
LABEL_35:

  return uint64;
}

BOOL nrXPCCompanionFlushBTPipe()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  _BOOL4 v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  _BOOL4 v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __CFString *StringFromNRXPCRes;
  __CFString *v82;
  uint64_t v83;
  char __strerrbuf[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v61 = nrCopyLogObj_2128();
    v62 = v61;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        v73 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v73);
      }
    }
    v66 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x30uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionFlushBTPipe", v1);
  v3 = v2;
  if (!v2)
  {
    v64 = nrCopyLogObj_2128();
    v65 = v64;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        v45 = 0;
        goto LABEL_63;
      }
    }
    v75 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x1DF0BA7A8](v17) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v23);
        if (!value)
        {
          v16 = 0;
          goto LABEL_36;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v52 = nrCopyLogObj_2128();
            v53 = v52;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54)
                goto LABEL_35;
            }
            v55 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          v82 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x1E0C81310])
  {
    if (v3 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v39 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      if (v15)
        goto LABEL_11;
    }
LABEL_61:
    v16 = 1;
    goto LABEL_62;
  }
  v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  if (!v15)
    goto LABEL_61;
LABEL_11:
  free(v15);
  v16 = 1;
LABEL_62:
  v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionEnableCloudLink()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  _BOOL4 v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  _BOOL4 v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __CFString *StringFromNRXPCRes;
  __CFString *v82;
  uint64_t v83;
  char __strerrbuf[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v61 = nrCopyLogObj_2128();
    v62 = v61;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        v73 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v73);
      }
    }
    v66 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x17uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionEnableCloudLink", v1);
  v3 = v2;
  if (!v2)
  {
    v64 = nrCopyLogObj_2128();
    v65 = v64;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        v45 = 0;
        goto LABEL_63;
      }
    }
    v75 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x1DF0BA7A8](v17) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v23);
        if (!value)
        {
          v16 = 0;
          goto LABEL_36;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v52 = nrCopyLogObj_2128();
            v53 = v52;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54)
                goto LABEL_35;
            }
            v55 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          v82 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x1E0C81310])
  {
    if (v3 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v39 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      if (v15)
        goto LABEL_11;
    }
LABEL_61:
    v16 = 1;
    goto LABEL_62;
  }
  v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  if (!v15)
    goto LABEL_61;
LABEL_11:
  free(v15);
  v16 = 1;
LABEL_62:
  v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionDisableCloudLink()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  _BOOL4 v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  _BOOL4 v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __CFString *StringFromNRXPCRes;
  __CFString *v82;
  uint64_t v83;
  char __strerrbuf[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v61 = nrCopyLogObj_2128();
    v62 = v61;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        v73 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v73);
      }
    }
    v66 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x18uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionDisableCloudLink", v1);
  v3 = v2;
  if (!v2)
  {
    v64 = nrCopyLogObj_2128();
    v65 = v64;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        v45 = 0;
        goto LABEL_63;
      }
    }
    v75 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x1DF0BA7A8](v17) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v23);
        if (!value)
        {
          v16 = 0;
          goto LABEL_36;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v52 = nrCopyLogObj_2128();
            v53 = v52;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54)
                goto LABEL_35;
            }
            v55 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          v82 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v24 = nrCopyLogObj_sNRLogObj_2135;
      v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x1E0C81310])
  {
    if (v3 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v39 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      if (v15)
        goto LABEL_11;
    }
LABEL_61:
    v16 = 1;
    goto LABEL_62;
  }
  v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  if (!v15)
    goto LABEL_61;
LABEL_11:
  free(v15);
  v16 = 1;
LABEL_62:
  v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionSetWatchRoleSwitchAllowed(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x26uLL);
  xpc_dictionary_set_BOOL(v3, "WatchRoleSwitchAllowed", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetWatchRoleSwitchAllowed", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSetSimulateAltAccount(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x25uLL);
  xpc_dictionary_set_BOOL(v3, "SimulateAltAccount", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetSimulateAltAccount", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSetRangeExtensionAllowed(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x1DuLL);
  xpc_dictionary_set_BOOL(v3, "WiFiRangeExtensionAllowed", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetRangeExtensionAllowed", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSetTetheringBundleIDs(void *a1)
{
  id v1;
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_85:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_85;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x33uLL);
  if (v1)
    xpc_dictionary_set_string(v3, "TetheringBundleIDs", (const char *)objc_msgSend(v1, "UTF8String"));
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetTetheringBundleIDs", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_88:
        v47 = 0;
        goto LABEL_65;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_88;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_38;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_37;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_37;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_37;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_37;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_37:
        v18 = 1;
LABEL_38:

        goto LABEL_64;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_37;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_37;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_37;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_64;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_64;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_64;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_13;
    }
LABEL_63:
    v18 = 1;
    goto LABEL_64;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_63;
LABEL_13:
  free(v17);
  v18 = 1;
LABEL_64:
  v47 = v18 == 0;
LABEL_65:

  return v47;
}

BOOL nrXPCCompanionSetPreferWiFiAllowed(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x1EuLL);
  xpc_dictionary_set_BOOL(v3, "PreferWiFiAllowed", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetPreferWiFiAllowed", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionBlockSHOESTraffic(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x27uLL);
  xpc_dictionary_set_BOOL(v3, "BlockSHOESTraffic", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionBlockSHOESTraffic", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionBlockIDSTraffic(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x28uLL);
  xpc_dictionary_set_BOOL(v3, "BlockIDSTraffic", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionBlockIDSTraffic", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSimulateWakePacket(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x2BuLL);
  xpc_dictionary_set_BOOL(v3, "SimulateWakePacket", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSimulateWakePacket", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSetFixedInterfaceMode(BOOL a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t value;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  _BOOL4 v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  NSObject *v72;
  _BOOL4 v73;
  NSObject *v74;
  NSObject *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  _BOOL4 v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __CFString *StringFromNRXPCRes;
  __CFString *v92;
  uint64_t v93;
  char __strerrbuf[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = xpc_dictionary_create(0, 0, 0);
  if (!v10)
  {
    v71 = nrCopyLogObj_2128();
    v72 = v71;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v73 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);

      if (!v73)
      {
LABEL_89:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v82 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v82, (uint64_t)"nr_xpc_dictionary_create");
        v83 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v83);
      }
    }
    v76 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v76, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v77, v78, v79, v80, v81, (uint64_t)"");

    goto LABEL_89;
  }
  v11 = v10;
  xpc_dictionary_set_uint64(v10, "Type", 0x20uLL);
  xpc_dictionary_set_BOOL(v11, "FixedInterfaceModeSetEnabled", a1);
  if (v7)
    xpc_dictionary_set_string(v11, "FixedInterfaceModeInterfaceName", (const char *)objc_msgSend(v7, "UTF8String"));
  if (v8)
    xpc_dictionary_set_string(v11, "FixedInterfaceModePeerAddress", (const char *)objc_msgSend(v8, "UTF8String"));
  if (v9)
    xpc_dictionary_set_string(v11, "IDSDeviceID", (const char *)objc_msgSend(v9, "UTF8String"));
  v12 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetFixedInterfaceMode", v11);
  v13 = v12;
  if (!v12)
  {
    v74 = nrCopyLogObj_2128();
    v75 = v74;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v84 = os_log_type_enabled(v74, OS_LOG_TYPE_FAULT);

      if (!v84)
      {
LABEL_92:
        v55 = 0;
        goto LABEL_69;
      }
    }
    v85 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v85, 17, (uint64_t)"received nil response", v86, v87, v88, v89, v90, v93);

    goto LABEL_92;
  }
  v14 = MEMORY[0x1DF0BA7A8](v12);
  if (v14 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v13, "Result");
    v27 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v27;
    if (v27)
    {
      if (MEMORY[0x1DF0BA7A8](v27) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v33);
        if (!value)
        {
          v26 = 0;
          goto LABEL_42;
        }
        v42 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v62 = nrCopyLogObj_2128();
            v63 = v62;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v64 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);

              if (!v64)
                goto LABEL_41;
            }
            v65 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v42);
            _NRLogWithArgs((uint64_t)v65, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v66, v67, v68, v69, v70, (uint64_t)"");

            goto LABEL_41;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_41;
          v43 = nrCopyLogObj_2128();
          v92 = (__CFString *)createStringFromNRXPCRes(v42);
          _NRLogWithArgs((uint64_t)v43, 17, (uint64_t)"received internal failure result code: [%lld] %@", v57, v58, v59, v60, v61, v42);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_41;
          v43 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v43, 17, (uint64_t)"received failure result code: [%d] %s", v44, v45, v46, v47, v48, v42);
        }

LABEL_41:
        v26 = 1;
LABEL_42:

        goto LABEL_68;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_41;
      v34 = nrCopyLogObj_sNRLogObj_2135;
      v35 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_41;
      v34 = nrCopyLogObj_sNRLogObj_2135;
      v35 = "received response without result code";
    }
    _NRLogWithArgs(v34, 17, (uint64_t)v35, v28, v29, v30, v31, v32, v93);
    goto LABEL_41;
  }
  if (v14 == MEMORY[0x1E0C81310])
  {
    if (v13 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v15, v16, v17, v18, v19, v93);
        v26 = 1;
        goto LABEL_68;
      }
    }
    else if (v13 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v15, v16, v17, v18, v19, (uint64_t)"");
        v26 = 1;
        goto LABEL_68;
      }
    }
    else if (v13 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v49 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v49, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v50, v51, v52, v53, v54, v93);

        v26 = 1;
        goto LABEL_68;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x1DF0BA6A0](v13);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v36, v37, v38, v39, v40, (uint64_t)v25);
      if (v25)
        goto LABEL_17;
    }
LABEL_67:
    v26 = 1;
    goto LABEL_68;
  }
  v25 = (void *)MEMORY[0x1DF0BA6A0](v13);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v20, v21, v22, v23, v24, (uint64_t)v25);
  if (!v25)
    goto LABEL_67;
LABEL_17:
  free(v25);
  v26 = 1;
LABEL_68:
  v55 = v26 == 0;
LABEL_69:

  return v55;
}

BOOL nrXPCCompanionLinkSubmitTestBTLinkRecommendation(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestBTLinkRecommendation", a2);
}

BOOL nrXPCCompanionLinkSubmitTestLinkRecommendation(const unsigned __int8 *a1, const char *a2, int a3)
{
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  xpc_object_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t value;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  _BOOL4 v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  _BOOL4 v70;
  NSObject *v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  _BOOL4 v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  __CFString *StringFromNRXPCRes;
  __CFString *v89;
  uint64_t v90;
  char __strerrbuf[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = xpc_dictionary_create(0, 0, 0);
  if (!v6)
  {
    v68 = nrCopyLogObj_2128();
    v69 = v68;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v70 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);

      if (!v70)
      {
LABEL_86:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v79 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v79, (uint64_t)"nr_xpc_dictionary_create");
        v80 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v80);
      }
    }
    v73 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v73, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v74, v75, v76, v77, v78, (uint64_t)"");

    goto LABEL_86;
  }
  v7 = v6;
  xpc_dictionary_set_uint64(v6, "Type", 0x1AuLL);
  xpc_dictionary_set_uuid(v7, "DeviceIdentifier", a1);
  if (a3)
    v8 = 1;
  else
    v8 = 2;
  xpc_dictionary_set_uint64(v7, a2, v8);
  v9 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkSubmitTestLinkRecommendation", v7);
  v10 = v9;
  if (!v9)
  {
    v71 = nrCopyLogObj_2128();
    v72 = v71;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v81 = os_log_type_enabled(v71, OS_LOG_TYPE_FAULT);

      if (!v81)
      {
LABEL_89:
        v52 = 0;
        goto LABEL_66;
      }
    }
    v82 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v82, 17, (uint64_t)"received nil response", v83, v84, v85, v86, v87, v90);

    goto LABEL_89;
  }
  v11 = MEMORY[0x1DF0BA7A8](v9);
  if (v11 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v10, "Result");
    v24 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v24;
    if (v24)
    {
      if (MEMORY[0x1DF0BA7A8](v24) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v30);
        if (!value)
        {
          v23 = 0;
          goto LABEL_39;
        }
        v39 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v59 = nrCopyLogObj_2128();
            v60 = v59;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v61 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);

              if (!v61)
                goto LABEL_38;
            }
            v62 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v39);
            _NRLogWithArgs((uint64_t)v62, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v63, v64, v65, v66, v67, (uint64_t)"");

            goto LABEL_38;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_38;
          v40 = nrCopyLogObj_2128();
          v89 = (__CFString *)createStringFromNRXPCRes(v39);
          _NRLogWithArgs((uint64_t)v40, 17, (uint64_t)"received internal failure result code: [%lld] %@", v54, v55, v56, v57, v58, v39);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_38;
          v40 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v40, 17, (uint64_t)"received failure result code: [%d] %s", v41, v42, v43, v44, v45, v39);
        }

LABEL_38:
        v23 = 1;
LABEL_39:

        goto LABEL_65;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_38;
      v31 = nrCopyLogObj_sNRLogObj_2135;
      v32 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_38;
      v31 = nrCopyLogObj_sNRLogObj_2135;
      v32 = "received response without result code";
    }
    _NRLogWithArgs(v31, 17, (uint64_t)v32, v25, v26, v27, v28, v29, v90);
    goto LABEL_38;
  }
  if (v11 == MEMORY[0x1E0C81310])
  {
    if (v10 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v12, v13, v14, v15, v16, v90);
        v23 = 1;
        goto LABEL_65;
      }
    }
    else if (v10 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v12, v13, v14, v15, v16, (uint64_t)"");
        v23 = 1;
        goto LABEL_65;
      }
    }
    else if (v10 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v46 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v46, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v47, v48, v49, v50, v51, v90);

        v23 = 1;
        goto LABEL_65;
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1DF0BA6A0](v10);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v33, v34, v35, v36, v37, (uint64_t)v22);
      if (v22)
        goto LABEL_14;
    }
LABEL_64:
    v23 = 1;
    goto LABEL_65;
  }
  v22 = (void *)MEMORY[0x1DF0BA6A0](v10);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v17, v18, v19, v20, v21, (uint64_t)v22);
  if (!v22)
    goto LABEL_64;
LABEL_14:
  free(v22);
  v23 = 1;
LABEL_65:
  v52 = v23 == 0;
LABEL_66:

  return v52;
}

BOOL nrXPCCompanionLinkSubmitTestCompanionWiFiLinkRecommendation(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestCompanionWiFiLinkRecommendation", a2);
}

BOOL nrXPCCompanionLinkSubmitTestDirectWiFiLinkRecommendation(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestDirectWiFiLinkRecommendation", a2);
}

BOOL nrXPCCompanionLinkSubmitTestALUAdviceWiFi(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestALUAdviceWiFi", a2);
}

BOOL nrXPCCompanionLinkSubmitTestALUAdviceBluetooth(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestALUAdviceBluetooth", a2);
}

BOOL nrXPCCompanionLinkSetEncryptionType(unsigned int a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x2CuLL);
  xpc_dictionary_set_uint64(v3, "CompanionLinkEncryptionType", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkSetEncryptionType", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

char *nrXPCTestCopyBabelRoutes()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  char *string;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  _BOOL4 v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  _BOOL4 v66;
  __CFString *StringFromNRXPCRes;
  __CFString *v68;
  uint64_t v69;
  char __strerrbuf[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v53 = nrCopyLogObj_2128();
    v54 = v53;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        v65 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v65);
      }
    }
    v58 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_80;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x1BuLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCTestCopyBabelRoutes", v1);
  v3 = v2;
  if (!v2)
  {
    v56 = nrCopyLogObj_2128();
    v57 = v56;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x1DF0BA7A8](v16) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v22);
        if (!value)
        {

          string = (char *)xpc_dictionary_get_string(v3, "BabelRoutes");
          if (string)
            string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
          goto LABEL_35;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v44 = nrCopyLogObj_2128();
            v45 = v44;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46)
                goto LABEL_33;
            }
            v47 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          v68 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    string = (char *)MEMORY[0x1DF0BA6A0](v3);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)string);
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  string = (char *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)string);
LABEL_10:
  if (string)
  {
    free(string);
LABEL_34:
    string = 0;
  }
LABEL_35:

  return string;
}

void *nrXPCCopyResolvedEndpoint(void *a1, uint64_t a2)
{
  id v3;
  xpc_object_t v4;
  void *v5;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t value;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL4 v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  _BOOL4 v86;
  NSObject *v87;
  NSObject *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  _BOOL4 v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _BOOL4 v104;
  __CFString *StringFromNRXPCRes;
  __CFString *v106;
  uint64_t v107;
  char __strerrbuf[8];
  uint64_t v109;
  unsigned __int8 uuid[8];
  uint64_t v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      v5 = v4;
      xpc_dictionary_set_uint64(v4, "Type", 6uLL);
      *(_QWORD *)uuid = 0;
      v111 = 0;
      objc_msgSend(v3, "getUUIDBytes:", uuid);
      xpc_dictionary_set_uuid(v5, "NRUUID", uuid);
      xpc_dictionary_set_uint64(v5, "DataProtectionClass", a2);
      v6 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyResolvedEndpoint", v5);
      v7 = v6;
      if (!v6)
      {
        v87 = nrCopyLogObj_2128();
        v88 = v87;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v104 = os_log_type_enabled(v87, OS_LOG_TYPE_FAULT);

          if (!v104)
            goto LABEL_35;
        }
        v43 = nrCopyLogObj_2128();
        v49 = v43;
        v50 = "received nil response";
        goto LABEL_62;
      }
      v8 = MEMORY[0x1DF0BA7A8](v6);
      if (v8 != MEMORY[0x1E0C812F8])
      {
        if (v8 != MEMORY[0x1E0C81310])
        {
          v19 = (void *)MEMORY[0x1DF0BA6A0](v7);
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v14, v15, v16, v17, v18, (uint64_t)v19);
LABEL_11:
          if (!v19)
          {
LABEL_36:

            goto LABEL_37;
          }
          free(v19);
LABEL_35:
          v19 = 0;
          goto LABEL_36;
        }
        if (v7 == (void *)MEMORY[0x1E0C81258])
        {
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v9, v10, v11, v12, v13, v107);
          goto LABEL_35;
        }
        if (v7 == (void *)MEMORY[0x1E0C81260])
        {
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v9, v10, v11, v12, v13, (uint64_t)"");
          goto LABEL_35;
        }
        if (v7 != (void *)MEMORY[0x1E0C81288])
        {
          v19 = (void *)MEMORY[0x1DF0BA6A0](v7);
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v29, v30, v31, v32, v33, (uint64_t)v19);
          goto LABEL_11;
        }
        if (nrCopyLogObj_onceToken_2134 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
          goto LABEL_35;
        v43 = nrCopyLogObj_2128();
        v49 = v43;
        v50 = "received XPC_ERROR_TERMINATION_IMMINENT";
LABEL_62:
        _NRLogWithArgs((uint64_t)v43, 17, (uint64_t)v50, v44, v45, v46, v47, v48, v107);

        goto LABEL_35;
      }
      xpc_dictionary_get_value(v7, "Result");
      v20 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v20;
      if (!v20)
      {
        if (nrCopyLogObj_onceToken_2134 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
          goto LABEL_34;
        v27 = nrCopyLogObj_sNRLogObj_2135;
        v28 = "received response without result code";
LABEL_33:
        _NRLogWithArgs(v27, 17, (uint64_t)v28, v21, v22, v23, v24, v25, v107);
        goto LABEL_34;
      }
      if (MEMORY[0x1DF0BA7A8](v20) != MEMORY[0x1E0C81328])
      {
        if (nrCopyLogObj_onceToken_2134 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
          goto LABEL_34;
        v27 = nrCopyLogObj_sNRLogObj_2135;
        v28 = "received invalid result type";
        goto LABEL_33;
      }
      value = xpc_int64_get_value(v26);
      if (value)
      {
        v36 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v68 = nrCopyLogObj_2128();
            v69 = v68;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v75 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);

              if (!v75)
                goto LABEL_34;
            }
            v76 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v36);
            _NRLogWithArgs((uint64_t)v76, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v77, v78, v79, v80, v81, (uint64_t)"");

            goto LABEL_34;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_34;
          v37 = nrCopyLogObj_2128();
          v106 = (__CFString *)createStringFromNRXPCRes(v36);
          _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received internal failure result code: [%lld] %@", v63, v64, v65, v66, v67, v36);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_34;
          v37 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received failure result code: [%d] %s", v38, v39, v40, v41, v42, v36);
        }

LABEL_34:
        goto LABEL_35;
      }

      xpc_dictionary_get_value(v7, "IPv6Address");
      v51 = objc_claimAutoreleasedReturnValue();
      v57 = (void *)v51;
      if (v51)
      {
        if (MEMORY[0x1DF0BA7A8](v51) == MEMORY[0x1E0C812E8])
        {
          *(_QWORD *)__strerrbuf = 0;
          v109 = 0;
          if (xpc_data_get_bytes(v57, __strerrbuf, 0, 0x10uLL) == 16)
          {
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", __strerrbuf, 16);
LABEL_94:

            goto LABEL_36;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d Response of invalid length %zu", v70, v71, v72, v73, v74, (uint64_t)"");
        }
        else
        {
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d Response of invalid type", v58, v59, v60, v61, v62, (uint64_t)"");
        }
      }
      else
      {
        if (nrCopyLogObj_onceToken_2134 != -1)
          dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d Missing address", v52, v53, v54, v55, v56, (uint64_t)"");
      }
      v19 = 0;
      goto LABEL_94;
    }
    v84 = nrCopyLogObj_2128();
    v85 = v84;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v86 = os_log_type_enabled(v84, OS_LOG_TYPE_ERROR);

      if (!v86)
      {
LABEL_104:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v95 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v95, (uint64_t)"nr_xpc_dictionary_create");
        v96 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v96);
      }
    }
    v89 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v89, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v90, v91, v92, v93, v94, (uint64_t)"");

    goto LABEL_104;
  }
  v82 = nrCopyLogObj_2128();
  v83 = v82;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v97 = os_log_type_enabled(v82, OS_LOG_TYPE_FAULT);

    if (!v97)
    {
      v19 = 0;
      goto LABEL_37;
    }
  }
  v98 = nrCopyLogObj_2128();
  _NRLogWithArgs((uint64_t)v98, 17, (uint64_t)"%s called with null nrUUID", v99, v100, v101, v102, v103, (uint64_t)"nrXPCCopyResolvedEndpoint");

  v19 = 0;
LABEL_37:

  return v19;
}

BOOL nrXPCSetPacketLogging(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 7uLL);
  xpc_dictionary_set_BOOL(v3, "PacketLoggingVal", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCSetPacketLogging", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCSetMPKLLogging(BOOL a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BOOL4 v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __CFString *StringFromNRXPCRes;
  __CFString *v84;
  uint64_t v85;
  char __strerrbuf[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        v75 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v75);
      }
    }
    v68 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x1FuLL);
  xpc_dictionary_set_BOOL(v3, "MPKLLoggingVal", a1);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCSetMPKLLogging", v3);
  v5 = v4;
  if (!v4)
  {
    v66 = nrCopyLogObj_2128();
    v67 = v66;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        v47 = 0;
        goto LABEL_63;
      }
    }
    v77 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {
          v18 = 0;
          goto LABEL_36;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v54 = nrCopyLogObj_2128();
            v55 = v54;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56)
                goto LABEL_35;
            }
            v57 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          v84 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x1E0C81310])
  {
    if (v5 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x1E0C81288])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      {
        v41 = nrCopyLogObj_2128();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      if (v17)
        goto LABEL_11;
    }
LABEL_61:
    v18 = 1;
    goto LABEL_62;
  }
  v17 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  if (!v17)
    goto LABEL_61;
LABEL_11:
  free(v17);
  v18 = 1;
LABEL_62:
  v47 = v18 == 0;
LABEL_63:

  return v47;
}

uint64_t nrXPCGetNetworkRelayVersion()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t uint64;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  _BOOL4 v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  NSObject *v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  _BOOL4 v67;
  __CFString *StringFromNRXPCRes;
  __CFString *v69;
  uint64_t v70;
  char __strerrbuf[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v54 = nrCopyLogObj_2128();
    v55 = v54;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

      if (!v56)
      {
LABEL_81:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v65 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v65, (uint64_t)"nr_xpc_dictionary_create");
        v66 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v66);
      }
    }
    v59 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v59, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v60, v61, v62, v63, v64, (uint64_t)"");

    goto LABEL_81;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x2DuLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCGetNetworkRelayVersion", v1);
  v3 = v2;
  if (!v2)
  {
    v57 = nrCopyLogObj_2128();
    v58 = v57;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v67 = os_log_type_enabled(v57, OS_LOG_TYPE_FAULT);

      if (!v67)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x1DF0BA7A8](v16) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v22);
        if (!value)
        {

          uint64 = xpc_dictionary_get_uint64(v3, "NetworkRelayVersion");
          if (uint64 >> 16)
            LOWORD(v15) = 0;
          else
            LOWORD(v15) = uint64;
          goto LABEL_35;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v45 = nrCopyLogObj_2128();
            v46 = v45;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v47 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);

              if (!v47)
                goto LABEL_33;
            }
            v48 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v48, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          v69 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v40, v41, v42, v43, v44, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v70);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v70);
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)v15);
LABEL_10:
  if (v15)
  {
    free(v15);
LABEL_34:
    LOWORD(v15) = 0;
  }
LABEL_35:

  return (unsigned __int16)v15;
}

void *nrXPCCopyNRUUIDForBluetoothUUID(void *a1)
{
  id v1;
  void *v2;
  xpc_object_t v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const unsigned __int8 *v42;
  const unsigned __int8 *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  _BOOL4 v67;
  NSObject *v68;
  NSObject *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  _BOOL4 v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  NSObject *v86;
  _BOOL4 v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _BOOL4 v94;
  NSObject *v95;
  NSObject *v96;
  _BOOL4 v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __CFString *StringFromNRXPCRes;
  __CFString *v104;
  uint64_t v105;
  unsigned __int8 uu[8];
  uint64_t v107;
  unsigned __int8 uuid[8];
  uint64_t v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v63 = nrCopyLogObj_757();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v78 = os_log_type_enabled(v63, OS_LOG_TYPE_FAULT);

      if (!v78)
        goto LABEL_94;
    }
    v79 = nrCopyLogObj_757();
    _NRLogWithArgs((uint64_t)v79, 17, (uint64_t)"%s called with null nsUUID", v80, v81, v82, v83, v84, (uint64_t)"_NRIsUUIDNonZero");

    goto LABEL_94;
  }
  *(_QWORD *)uu = 0;
  v107 = 0;
  objc_msgSend(v1, "getUUIDBytes:", uu);
  if (!uuid_is_null(uu))
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    if (v3)
    {
      v4 = v3;
      xpc_dictionary_set_uint64(v3, "Type", 0xDuLL);
      *(_QWORD *)uuid = 0;
      v109 = 0;
      objc_msgSend(v2, "getUUIDBytes:", uuid);
      xpc_dictionary_set_uuid(v4, "BluetoothUUID", uuid);
      v5 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyNRUUIDForBluetoothUUID", v4);
      v6 = v5;
      if (v5)
      {
        v7 = MEMORY[0x1DF0BA7A8](v5);
        if (v7 == MEMORY[0x1E0C812F8])
        {
          xpc_dictionary_get_value(v6, "Result");
          v19 = objc_claimAutoreleasedReturnValue();
          v25 = (id)v19;
          if (v19)
          {
            if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
            {
              value = xpc_int64_get_value(v25);
              if (!value)
              {

                v42 = xpc_dictionary_get_uuid(v6, "NRUUID");
                if (v42)
                {
                  v43 = v42;
                  if (!uuid_is_null(v42))
                  {
                    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v43);
                    goto LABEL_37;
                  }
                  if (nrCopyLogObj_onceToken_2134 != -1)
                    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
                  if (sNRCopyLogToStdErr
                    || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
                  {
                    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d All-zero nrUUID in response from daemon", v44, v45, v46, v47, v48, (uint64_t)"");
                  }
                  goto LABEL_36;
                }
                v95 = nrCopyLogObj_2128();
                v96 = v95;
                if (sNRCopyLogToStdErr)
                {

                }
                else
                {
                  v97 = os_log_type_enabled(v95, OS_LOG_TYPE_ERROR);

                  if (!v97)
                    goto LABEL_36;
                }
                v25 = nrCopyLogObj_2128();
                _NRLogWithArgs((uint64_t)v25, 16, (uint64_t)"%s%.30s:%-4d Missing nrUUID in response from daemon", v98, v99, v100, v101, v102, (uint64_t)"");
                goto LABEL_35;
              }
              v35 = value;
              if (value >> 31)
              {
                if (!(_DWORD)value)
                {
                  v54 = nrCopyLogObj_2128();
                  v55 = v54;
                  if (sNRCopyLogToStdErr)
                  {

                  }
                  else
                  {
                    v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

                    if (!v56)
                      goto LABEL_35;
                  }
                  v57 = nrCopyLogObj_2128();
                  StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v35);
                  _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

                  goto LABEL_35;
                }
                if (nrCopyLogObj_onceToken_2134 != -1)
                  dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
                if (!sNRCopyLogToStdErr
                  && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
                {
                  goto LABEL_35;
                }
                v36 = nrCopyLogObj_2128();
                v104 = (__CFString *)createStringFromNRXPCRes(v35);
                _NRLogWithArgs((uint64_t)v36, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v35);

              }
              else
              {
                if (strerror_r(value, (char *)uu, 0x80uLL))
                  uu[0] = 0;
                if (nrCopyLogObj_onceToken_2134 != -1)
                  dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
                if (!sNRCopyLogToStdErr
                  && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
                {
                  goto LABEL_35;
                }
                v36 = nrCopyLogObj_2128();
                _NRLogWithArgs((uint64_t)v36, 17, (uint64_t)"received failure result code: [%d] %s", v37, v38, v39, v40, v41, v35);
              }

LABEL_35:
              goto LABEL_36;
            }
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              goto LABEL_35;
            v26 = (id)nrCopyLogObj_sNRLogObj_2135;
            v27 = "received invalid result type";
          }
          else
          {
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              goto LABEL_35;
            v26 = (id)nrCopyLogObj_sNRLogObj_2135;
            v27 = "received response without result code";
          }
        }
        else
        {
          if (v7 != MEMORY[0x1E0C81310])
          {
            v18 = (void *)MEMORY[0x1DF0BA6A0](v6);
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v13, v14, v15, v16, v17, (uint64_t)v18);
LABEL_12:
            if (!v18)
            {
LABEL_37:

              goto LABEL_38;
            }
            free(v18);
LABEL_36:
            v18 = 0;
            goto LABEL_37;
          }
          if (v6 == (void *)MEMORY[0x1E0C81258])
          {
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v8, v9, v10, v11, v12, v105);
            goto LABEL_36;
          }
          if (v6 == (void *)MEMORY[0x1E0C81260])
          {
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v8, v9, v10, v11, v12, (uint64_t)"");
            goto LABEL_36;
          }
          if (v6 != (void *)MEMORY[0x1E0C81288])
          {
            v18 = (void *)MEMORY[0x1DF0BA6A0](v6);
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v18);
            goto LABEL_12;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_36;
          v26 = nrCopyLogObj_2128();
          v25 = v26;
          v27 = "received XPC_ERROR_TERMINATION_IMMINENT";
        }
      }
      else
      {
        v68 = nrCopyLogObj_2128();
        v69 = v68;
        if (sNRCopyLogToStdErr)
        {

        }
        else
        {
          v94 = os_log_type_enabled(v68, OS_LOG_TYPE_FAULT);

          if (!v94)
            goto LABEL_36;
        }
        v26 = nrCopyLogObj_2128();
        v25 = v26;
        v27 = "received nil response";
      }
      _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v105);
      goto LABEL_35;
    }
    v65 = nrCopyLogObj_2128();
    v66 = v65;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v67 = os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);

      if (!v67)
      {
LABEL_91:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v76 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v76, (uint64_t)"nr_xpc_dictionary_create");
        v77 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v77);
      }
    }
    v70 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v70, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v71, v72, v73, v74, v75, (uint64_t)"");

    goto LABEL_91;
  }
LABEL_94:
  v85 = nrCopyLogObj_2128();
  v86 = v85;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v87 = os_log_type_enabled(v85, OS_LOG_TYPE_FAULT);

    if (!v87)
    {
      v18 = 0;
      goto LABEL_38;
    }
  }
  v88 = nrCopyLogObj_2128();
  _NRLogWithArgs((uint64_t)v88, 17, (uint64_t)"called with all-zero bluetoothUUID", v89, v90, v91, v92, v93, v105);

  v18 = 0;
LABEL_38:

  return v18;
}

unsigned __int8 *nrXPCCopyBluetoothUUIDForNRUUID(void *a1)
{
  id v1;
  void *v2;
  xpc_object_t v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t value;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const unsigned __int8 *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  _BOOL4 v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  _BOOL4 v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BOOL4 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _BOOL4 v87;
  __CFString *StringFromNRXPCRes;
  __CFString *v89;
  uint64_t v90;
  unsigned __int8 uu[8];
  uint64_t v92;
  unsigned __int8 uuid[8];
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v57 = nrCopyLogObj_2128();
    v58 = v57;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v74 = os_log_type_enabled(v57, OS_LOG_TYPE_FAULT);

      if (!v74)
        goto LABEL_94;
    }
    v75 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"%s called with null nrUUID", v76, v77, v78, v79, v80, (uint64_t)"nrXPCCopyBluetoothUUIDForNRUUID");
LABEL_93:

    v18 = 0;
    goto LABEL_38;
  }
  *(_QWORD *)uu = 0;
  v92 = 0;
  objc_msgSend(v1, "getUUIDBytes:", uu);
  if (uuid_is_null(uu))
  {
    v59 = nrCopyLogObj_2128();
    v60 = v59;
    if (sNRCopyLogToStdErr)
    {

LABEL_92:
      v75 = nrCopyLogObj_2128();
      _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"called with all-zero nrUUID", v82, v83, v84, v85, v86, v90);
      goto LABEL_93;
    }
    v81 = os_log_type_enabled(v59, OS_LOG_TYPE_FAULT);

    if (v81)
      goto LABEL_92;
LABEL_94:
    v18 = 0;
    goto LABEL_38;
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    v61 = nrCopyLogObj_2128();
    v62 = v61;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_88:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        v73 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v73);
      }
    }
    v66 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_88;
  }
  v4 = v3;
  xpc_dictionary_set_uint64(v3, "Type", 0x32uLL);
  *(_QWORD *)uuid = 0;
  v94 = 0;
  objc_msgSend(v2, "getUUIDBytes:", uuid);
  xpc_dictionary_set_uuid(v4, "NRUUID", uuid);
  v5 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyBluetoothUUIDForNRUUID", v4);
  v6 = v5;
  if (!v5)
  {
    v64 = nrCopyLogObj_2128();
    v65 = v64;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v87 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v87)
        goto LABEL_36;
    }
    v26 = nrCopyLogObj_2128();
    v25 = v26;
    v27 = "received nil response";
    goto LABEL_34;
  }
  v7 = MEMORY[0x1DF0BA7A8](v5);
  if (v7 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v6, "Result");
    v19 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x1DF0BA7A8](v19) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v25);
        if (!value)
        {

          v42 = xpc_dictionary_get_uuid(v6, "BluetoothUUID");
          v18 = (unsigned __int8 *)v42;
          if (!v42)
            goto LABEL_37;
          if (!uuid_is_null(v42))
          {
            v18 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v18);
            goto LABEL_37;
          }
          goto LABEL_36;
        }
        v35 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v48 = nrCopyLogObj_2128();
            v49 = v48;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v50 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);

              if (!v50)
                goto LABEL_35;
            }
            v51 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v35);
            _NRLogWithArgs((uint64_t)v51, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v52, v53, v54, v55, v56, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v36 = nrCopyLogObj_2128();
          v89 = (__CFString *)createStringFromNRXPCRes(v35);
          _NRLogWithArgs((uint64_t)v36, 17, (uint64_t)"received internal failure result code: [%lld] %@", v43, v44, v45, v46, v47, v35);

        }
        else
        {
          if (strerror_r(value, (char *)uu, 0x80uLL))
            uu[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          v36 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v36, 17, (uint64_t)"received failure result code: [%d] %s", v37, v38, v39, v40, v41, v35);
        }

LABEL_35:
        goto LABEL_36;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = (id)nrCopyLogObj_sNRLogObj_2135;
      v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_35;
      v26 = (id)nrCopyLogObj_sNRLogObj_2135;
      v27 = "received response without result code";
    }
LABEL_34:
    _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v90);
    goto LABEL_35;
  }
  if (v7 != MEMORY[0x1E0C81310])
  {
    v18 = (unsigned __int8 *)MEMORY[0x1DF0BA6A0](v6);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v13, v14, v15, v16, v17, (uint64_t)v18);
    goto LABEL_12;
  }
  if (v6 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v8, v9, v10, v11, v12, v90);
    goto LABEL_36;
  }
  if (v6 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v8, v9, v10, v11, v12, (uint64_t)"");
    goto LABEL_36;
  }
  if (v6 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_36;
    v26 = nrCopyLogObj_2128();
    v25 = v26;
    v27 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_34;
  }
  v18 = (unsigned __int8 *)MEMORY[0x1DF0BA6A0](v6);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v18);
LABEL_12:
  if (v18)
  {
    free(v18);
LABEL_36:
    v18 = 0;
  }
LABEL_37:

LABEL_38:
  return v18;
}

void *nrXPCCopyNRUUIDForIDSDeviceID(void *a1, _BOOL4 a2)
{
  id v3;
  xpc_object_t v4;
  void *v5;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t value;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const unsigned __int8 *uuid;
  const unsigned __int8 *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  _BOOL4 v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  _BOOL4 v66;
  NSObject *v67;
  NSObject *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  _BOOL4 v77;
  NSObject *v78;
  NSObject *v79;
  _BOOL4 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __CFString *StringFromNRXPCRes;
  __CFString *v87;
  uint64_t v88;
  char __strerrbuf[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
  {
    v64 = nrCopyLogObj_2128();
    v65 = v64;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v66 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);

      if (!v66)
      {
LABEL_86:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v75 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v75, (uint64_t)"nr_xpc_dictionary_create");
        v76 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v76);
      }
    }
    v69 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v69, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v70, v71, v72, v73, v74, (uint64_t)"");

    goto LABEL_86;
  }
  v5 = v4;
  xpc_dictionary_set_uint64(v4, "Type", 0x2EuLL);
  xpc_dictionary_set_string(v5, "IDSDeviceID", (const char *)objc_msgSend(v3, "UTF8String"));
  xpc_dictionary_set_BOOL(v5, "ShouldCreateDevice", a2);
  v6 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyNRUUIDForIDSDeviceID", v5);
  v7 = v6;
  if (!v6)
  {
    v67 = nrCopyLogObj_2128();
    v68 = v67;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v77 = os_log_type_enabled(v67, OS_LOG_TYPE_FAULT);

      if (!v77)
        goto LABEL_34;
    }
    v27 = nrCopyLogObj_2128();
    v26 = v27;
    v28 = "received nil response";
    goto LABEL_32;
  }
  v8 = MEMORY[0x1DF0BA7A8](v6);
  if (v8 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v7, "Result");
    v20 = objc_claimAutoreleasedReturnValue();
    v26 = (id)v20;
    if (v20)
    {
      if (MEMORY[0x1DF0BA7A8](v20) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v26);
        if (value)
        {
          v36 = value;
          if (value >> 31)
          {
            if (!(_DWORD)value)
            {
              v55 = nrCopyLogObj_2128();
              v56 = v55;
              if (sNRCopyLogToStdErr)
              {

              }
              else
              {
                v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

                if (!v57)
                  goto LABEL_33;
              }
              v58 = nrCopyLogObj_2128();
              StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v36);
              _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v59, v60, v61, v62, v63, (uint64_t)"");

              goto LABEL_33;
            }
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              goto LABEL_33;
            v37 = nrCopyLogObj_2128();
            v87 = (__CFString *)createStringFromNRXPCRes(v36);
            _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, v36);

          }
          else
          {
            if (strerror_r(value, __strerrbuf, 0x80uLL))
              __strerrbuf[0] = 0;
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
              goto LABEL_33;
            v37 = nrCopyLogObj_2128();
            _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received failure result code: [%d] %s", v38, v39, v40, v41, v42, v36);
          }

        }
        else
        {

          uuid = xpc_dictionary_get_uuid(v7, "NRUUID");
          if (uuid)
          {
            v44 = uuid;
            if (!uuid_is_null(uuid))
            {
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v44);
              goto LABEL_35;
            }
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d All-zero nrUUID in response from daemon", v45, v46, v47, v48, v49, (uint64_t)"");
            goto LABEL_34;
          }
          if (!a2)
          {
LABEL_34:
            v19 = 0;
            goto LABEL_35;
          }
          v78 = nrCopyLogObj_2128();
          v79 = v78;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v80 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);

            if (!v80)
              goto LABEL_34;
          }
          v26 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v26, 16, (uint64_t)"%s%.30s:%-4d Missing nrUUID in response from daemon", v81, v82, v83, v84, v85, (uint64_t)"");
        }
LABEL_33:

        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v27 = (id)nrCopyLogObj_sNRLogObj_2135;
      v28 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v27 = (id)nrCopyLogObj_sNRLogObj_2135;
      v28 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v27, 17, (uint64_t)v28, v21, v22, v23, v24, v25, v88);
    goto LABEL_33;
  }
  if (v8 != MEMORY[0x1E0C81310])
  {
    v19 = (void *)MEMORY[0x1DF0BA6A0](v7);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v14, v15, v16, v17, v18, (uint64_t)v19);
    goto LABEL_10;
  }
  if (v7 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v9, v10, v11, v12, v13, v88);
    goto LABEL_34;
  }
  if (v7 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v9, v10, v11, v12, v13, (uint64_t)"");
    goto LABEL_34;
  }
  if (v7 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v27 = nrCopyLogObj_2128();
    v26 = v27;
    v28 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  v19 = (void *)MEMORY[0x1DF0BA6A0](v7);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v29, v30, v31, v32, v33, (uint64_t)v19);
LABEL_10:
  if (v19)
  {
    free(v19);
    goto LABEL_34;
  }
LABEL_35:

  return v19;
}

void *nrXPCCopyBestTestingNRUUID()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t value;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const unsigned __int8 *uuid;
  const unsigned __int8 *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  _BOOL4 v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  _BOOL4 v62;
  NSObject *v63;
  NSObject *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  _BOOL4 v73;
  NSObject *v74;
  NSObject *v75;
  _BOOL4 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __CFString *StringFromNRXPCRes;
  __CFString *v83;
  uint64_t v84;
  char __strerrbuf[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v60 = nrCopyLogObj_2128();
    v61 = v60;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v62 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);

      if (!v62)
      {
LABEL_86:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v71 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v71, (uint64_t)"nr_xpc_dictionary_create");
        v72 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v72);
      }
    }
    v65 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v65, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v66, v67, v68, v69, v70, (uint64_t)"");

    goto LABEL_86;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x14uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyBestTestingNRUUID", v1);
  v3 = v2;
  if (!v2)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v73 = os_log_type_enabled(v63, OS_LOG_TYPE_FAULT);

      if (!v73)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v3, "Result");
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = (id)v16;
    if (v16)
    {
      if (MEMORY[0x1DF0BA7A8](v16) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v22);
        if (!value)
        {

          uuid = xpc_dictionary_get_uuid(v3, "NRUUID");
          if (uuid)
          {
            v40 = uuid;
            if (!uuid_is_null(uuid))
            {
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v40);
              goto LABEL_35;
            }
            if (nrCopyLogObj_onceToken_2134 != -1)
              dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d All-zero nrUUID in response from daemon", v41, v42, v43, v44, v45, (uint64_t)"");
            goto LABEL_34;
          }
          v74 = nrCopyLogObj_2128();
          v75 = v74;
          if (sNRCopyLogToStdErr)
          {

          }
          else
          {
            v76 = os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);

            if (!v76)
              goto LABEL_34;
          }
          v22 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v22, 16, (uint64_t)"%s%.30s:%-4d Missing nrUUID in response from daemon", v77, v78, v79, v80, v81, (uint64_t)"");
          goto LABEL_33;
        }
        v32 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v51 = nrCopyLogObj_2128();
            v52 = v51;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v53 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);

              if (!v53)
                goto LABEL_33;
            }
            v54 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v54, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v55, v56, v57, v58, v59, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          v83 = (__CFString *)createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v46, v47, v48, v49, v50, v32);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v33 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v23 = (id)nrCopyLogObj_sNRLogObj_2135;
      v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v84);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x1E0C81310])
  {
    v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v84);
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)v15);
LABEL_10:
  if (v15)
  {
    free(v15);
LABEL_34:
    v15 = 0;
  }
LABEL_35:

  return v15;
}

void nrXPCRegisterDeviceByNRUUID(void *a1, int64_t a2, unsigned int a3, BOOL a4, void *a5, _BOOL4 a6, BOOL a7, void *a8, void *a9, void *a10, void *a11, BOOL a12, void *a13, void *a14)
{
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  xpc_object_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  _BOOL4 v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL4 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  _BOOL4 v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  id v76;
  id v80;
  uint64_t v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD block[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  _QWORD *v91;
  unsigned __int8 uuid[8];
  uint64_t v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v18 = a1;
  v19 = a5;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v80 = a13;
  v24 = a14;
  v30 = v24;
  if (!v18)
  {
    v45 = v22;
    v46 = nrCopyLogObj_2128();
    v47 = v46;
    if (sNRCopyLogToStdErr)
    {

      v31 = v20;
    }
    else
    {
      v50 = os_log_type_enabled(v46, OS_LOG_TYPE_FAULT);

      v31 = v20;
      v22 = v45;
      if (!v50)
        goto LABEL_42;
    }
    v51 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v51, 17, (uint64_t)"%s called with null nrUUID", v52, v53, v54, v55, v56, (uint64_t)"nrXPCRegisterDeviceByNRUUID");
LABEL_51:

    v22 = v45;
    goto LABEL_42;
  }
  if (!v24)
  {
    v45 = v22;
    v48 = nrCopyLogObj_2128();
    v49 = v48;
    v31 = v20;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v57 = os_log_type_enabled(v48, OS_LOG_TYPE_FAULT);

      v22 = v45;
      if (!v57)
        goto LABEL_42;
    }
    v51 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v51, 17, (uint64_t)"%s called with null completionBlock", v58, v59, v60, v61, v62, (uint64_t)"nrXPCRegisterDeviceByNRUUID");
    goto LABEL_51;
  }
  v31 = v20;
  if (!v19 && !a4)
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"outOfBandKey was nil and !wasInitiallySetupUsingIDSPairing", v25, v26, v27, v28, v29, v74);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __nrXPCRegisterDeviceByNRUUID_block_invoke;
    block[3] = &unk_1EA3F7A20;
    v87 = v30;
    dispatch_async(v21, block);

    goto LABEL_42;
  }
  if (!v20 && a6)
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"bluetoothMACAddress was nil and pairWithSPPLink", v25, v26, v27, v28, v29, v74);
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __nrXPCRegisterDeviceByNRUUID_block_invoke_2;
    v84[3] = &unk_1EA3F7A20;
    v85 = v30;
    dispatch_async(v21, v84);
    v32 = v85;
LABEL_41:

    goto LABEL_42;
  }
  if (!v22 || !objc_msgSend(v22, "length"))
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"Invalid operational properties data %@", v25, v26, v27, v28, v29, (uint64_t)v22);
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __nrXPCRegisterDeviceByNRUUID_block_invoke_3;
    v82[3] = &unk_1EA3F7A20;
    v83 = v30;
    dispatch_async(v21, v82);
    v32 = v83;
    goto LABEL_41;
  }
  v76 = v23;
  v75 = v22;
  v33 = xpc_dictionary_create(0, 0, 0);
  if (!v33)
  {
    v63 = nrCopyLogObj_2128();
    v64 = v63;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_58:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        v73 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v73);
      }
    }
    v66 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_58;
  }
  v34 = v33;
  xpc_dictionary_set_uint64(v33, "Type", 0xEuLL);
  xpc_dictionary_set_int64(v34, "PairingProtocolVersion", a2);
  xpc_dictionary_set_uint64(v34, "PeerNetworkRelayVersion", a3);
  xpc_dictionary_set_BOOL(v34, "WasInitiallySetupUsingIDSPairing", a4);
  if (v19)
  {
    v35 = v19;
    xpc_dictionary_set_data(v34, "OutOfBandKey", (const void *)objc_msgSend(v35, "bytes"), objc_msgSend(v35, "length"));

  }
  xpc_dictionary_set_BOOL(v34, "PairWithSPPLink", a6);
  xpc_dictionary_set_BOOL(v34, "IsAltAccountPairing", a7);
  v31 = v20;
  if (v20)
  {
    v36 = v20;
    xpc_dictionary_set_data(v34, "RemoteDeviceMACAddress", (const void *)objc_msgSend(v36, "bytes"), objc_msgSend(v36, "length"));

  }
  *(_QWORD *)uuid = 0;
  v93 = 0;
  objc_msgSend(v18, "getUUIDBytes:", uuid);
  xpc_dictionary_set_uuid(v34, "NRUUID", uuid);
  xpc_dictionary_set_data(v34, "OperationalPropData", (const void *)objc_msgSend(v75, "bytes"), objc_msgSend(v75, "length"));
  if (v76)
  {
    v81 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v76, 1, &v81);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (!v81)
      xpc_dictionary_set_data(v34, "PeerIPAddressData", (const void *)objc_msgSend(v37, "bytes"), objc_msgSend(v37, "length"));

  }
  if (v80)
    xpc_dictionary_set_string(v34, "CandidateService", (const char *)objc_msgSend(v80, "UTF8String"));
  xpc_dictionary_set_BOOL(v34, "IsEphemeral", a12);
  v39 = v34;
  v40 = v21;
  v41 = v30;
  v42 = MEMORY[0x1E0C809B0];
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
  v88[3] = &unk_1EA3F7AF8;
  v89 = v41;
  v43 = v88;
  v44 = nrXPCCopyConnection();
  if (v44)
  {
    nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v44, v39, v40, v43, 1u);
  }
  else
  {
    v90[0] = v42;
    v90[1] = 3221225472;
    v90[2] = __nrXPCSendAsyncInner_block_invoke;
    v90[3] = &unk_1EA3F7A20;
    v91 = v43;
    dispatch_async(v40, v90);

  }
  v23 = v76;

  v22 = v75;
LABEL_42:

}

uint64_t __nrXPCRegisterDeviceByNRUUID_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __nrXPCRegisterDeviceByNRUUID_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __nrXPCRegisterDeviceByNRUUID_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void nrXPCUnregisterDeviceByNRUUID(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD block[4];
  _QWORD *v47;
  unsigned __int8 uuid[8];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v5)
  {
    if (!v7)
    {
      v19 = nrCopyLogObj_2128();
      v20 = v19;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v38 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

        if (!v38)
          goto LABEL_8;
      }
      v11 = nrCopyLogObj_2128();
      _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null completionBlock", v39, v40, v41, v42, v43, (uint64_t)"nrXPCUnregisterDeviceByNRUUID");
      goto LABEL_7;
    }
    v9 = xpc_dictionary_create(0, 0, 0);
    if (v9)
    {
      v10 = v9;
      xpc_dictionary_set_uint64(v9, "Type", 0xFuLL);
      *(_QWORD *)uuid = 0;
      v49 = 0;
      objc_msgSend(v5, "getUUIDBytes:", uuid);
      xpc_dictionary_set_uuid(v10, "NRUUID", uuid);
      v11 = v10;
      v12 = v6;
      v13 = v8;
      v14 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
      v44[3] = &unk_1EA3F7AF8;
      v45 = v13;
      v15 = v44;
      v16 = nrXPCCopyConnection();
      if (v16)
      {
        nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v16, v11, v12, v15, 1u);
      }
      else
      {
        block[0] = v14;
        block[1] = 3221225472;
        block[2] = __nrXPCSendAsyncInner_block_invoke;
        block[3] = &unk_1EA3F7A20;
        v47 = v15;
        dispatch_async(v12, block);

      }
      goto LABEL_7;
    }
    v21 = nrCopyLogObj_2128();
    v22 = v21;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v23 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v23)
      {
LABEL_19:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v30 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v30, (uint64_t)"nr_xpc_dictionary_create");
        v31 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v31);
      }
    }
    v24 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v24, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v25, v26, v27, v28, v29, (uint64_t)"");

    goto LABEL_19;
  }
  v17 = nrCopyLogObj_2128();
  v18 = v17;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v32 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);

    if (!v32)
      goto LABEL_8;
  }
  v11 = nrCopyLogObj_2128();
  _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null nrUUID", v33, v34, v35, v36, v37, (uint64_t)"nrXPCUnregisterDeviceByNRUUID");
LABEL_7:

LABEL_8:
}

void nrXPCUnregisterAllDevices(void *a1, void *a2)
{
  id v3;
  id v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  _QWORD block[4];
  _QWORD *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v4)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_uint64(v5, "Type", 0x13uLL);
      v7 = v6;
      v8 = v3;
      v9 = v4;
      v10 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
      v32[3] = &unk_1EA3F7AF8;
      v33 = v9;
      v11 = v32;
      v12 = nrXPCCopyConnection();
      if (v12)
      {
        nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v12, v7, v8, v11, 1u);
      }
      else
      {
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __nrXPCSendAsyncInner_block_invoke;
        block[3] = &unk_1EA3F7A20;
        v35 = v11;
        dispatch_async(v8, block);

      }
      goto LABEL_6;
    }
    v15 = nrCopyLogObj_2128();
    v16 = v15;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v17)
      {
LABEL_16:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v24 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v24, (uint64_t)"nr_xpc_dictionary_create");
        v25 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v25);
      }
    }
    v18 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v18, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v19, v20, v21, v22, v23, (uint64_t)"");

    goto LABEL_16;
  }
  v13 = nrCopyLogObj_2128();
  v14 = v13;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v26 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);

    if (!v26)
      goto LABEL_7;
  }
  v7 = nrCopyLogObj_2128();
  _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null completionBlock", v27, v28, v29, v30, v31, (uint64_t)"nrXPCUnregisterAllDevices");
LABEL_6:

LABEL_7:
}

void nrXPCEnableDeviceByNRUUID(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD block[4];
  _QWORD *v47;
  unsigned __int8 uuid[8];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v5)
  {
    if (!v7)
    {
      v19 = nrCopyLogObj_2128();
      v20 = v19;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v38 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

        if (!v38)
          goto LABEL_8;
      }
      v11 = nrCopyLogObj_2128();
      _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null completionBlock", v39, v40, v41, v42, v43, (uint64_t)"nrXPCEnableDeviceByNRUUID");
      goto LABEL_7;
    }
    v9 = xpc_dictionary_create(0, 0, 0);
    if (v9)
    {
      v10 = v9;
      xpc_dictionary_set_uint64(v9, "Type", 0x10uLL);
      *(_QWORD *)uuid = 0;
      v49 = 0;
      objc_msgSend(v5, "getUUIDBytes:", uuid);
      xpc_dictionary_set_uuid(v10, "NRUUID", uuid);
      v11 = v10;
      v12 = v6;
      v13 = v8;
      v14 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
      v44[3] = &unk_1EA3F7AF8;
      v45 = v13;
      v15 = v44;
      v16 = nrXPCCopyConnection();
      if (v16)
      {
        nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v16, v11, v12, v15, 1u);
      }
      else
      {
        block[0] = v14;
        block[1] = 3221225472;
        block[2] = __nrXPCSendAsyncInner_block_invoke;
        block[3] = &unk_1EA3F7A20;
        v47 = v15;
        dispatch_async(v12, block);

      }
      goto LABEL_7;
    }
    v21 = nrCopyLogObj_2128();
    v22 = v21;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v23 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v23)
      {
LABEL_19:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v30 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v30, (uint64_t)"nr_xpc_dictionary_create");
        v31 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v31);
      }
    }
    v24 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v24, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v25, v26, v27, v28, v29, (uint64_t)"");

    goto LABEL_19;
  }
  v17 = nrCopyLogObj_2128();
  v18 = v17;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v32 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);

    if (!v32)
      goto LABEL_8;
  }
  v11 = nrCopyLogObj_2128();
  _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null nrUUID", v33, v34, v35, v36, v37, (uint64_t)"nrXPCEnableDeviceByNRUUID");
LABEL_7:

LABEL_8:
}

void nrXPCDisableDeviceByNRUUID(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD block[4];
  _QWORD *v47;
  unsigned __int8 uuid[8];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v5)
  {
    if (!v7)
    {
      v19 = nrCopyLogObj_2128();
      v20 = v19;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v38 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

        if (!v38)
          goto LABEL_8;
      }
      v11 = nrCopyLogObj_2128();
      _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null completionBlock", v39, v40, v41, v42, v43, (uint64_t)"nrXPCDisableDeviceByNRUUID");
      goto LABEL_7;
    }
    v9 = xpc_dictionary_create(0, 0, 0);
    if (v9)
    {
      v10 = v9;
      xpc_dictionary_set_uint64(v9, "Type", 0x11uLL);
      *(_QWORD *)uuid = 0;
      v49 = 0;
      objc_msgSend(v5, "getUUIDBytes:", uuid);
      xpc_dictionary_set_uuid(v10, "NRUUID", uuid);
      v11 = v10;
      v12 = v6;
      v13 = v8;
      v14 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
      v44[3] = &unk_1EA3F7AF8;
      v45 = v13;
      v15 = v44;
      v16 = nrXPCCopyConnection();
      if (v16)
      {
        nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v16, v11, v12, v15, 1u);
      }
      else
      {
        block[0] = v14;
        block[1] = 3221225472;
        block[2] = __nrXPCSendAsyncInner_block_invoke;
        block[3] = &unk_1EA3F7A20;
        v47 = v15;
        dispatch_async(v12, block);

      }
      goto LABEL_7;
    }
    v21 = nrCopyLogObj_2128();
    v22 = v21;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v23 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v23)
      {
LABEL_19:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v30 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v30, (uint64_t)"nr_xpc_dictionary_create");
        v31 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v31);
      }
    }
    v24 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v24, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v25, v26, v27, v28, v29, (uint64_t)"");

    goto LABEL_19;
  }
  v17 = nrCopyLogObj_2128();
  v18 = v17;
  if (sNRCopyLogToStdErr)
  {

  }
  else
  {
    v32 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);

    if (!v32)
      goto LABEL_8;
  }
  v11 = nrCopyLogObj_2128();
  _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null nrUUID", v33, v34, v35, v36, v37, (uint64_t)"nrXPCDisableDeviceByNRUUID");
LABEL_7:

LABEL_8:
}

const __CFString *nrXPCCopyDeviceListString()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  unint64_t value;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *string;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  _BOOL4 v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  _BOOL4 v57;
  NSObject *v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  _BOOL4 v68;
  NSObject *v69;
  NSObject *v70;
  _BOOL4 v71;
  __CFString *StringFromNRXPCRes;
  __CFString *v73;
  uint64_t v74;
  char __strerrbuf[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v55 = nrCopyLogObj_2128();
    v56 = v55;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

      if (!v57)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v66 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v66, (uint64_t)"nr_xpc_dictionary_create");
        v67 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v67);
      }
    }
    v60 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v60, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_80;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x12uLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyDeviceListString", v1);
  v3 = v2;
  if (!v2)
  {
    v58 = nrCopyLogObj_2128();
    v59 = v58;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v68 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);

      if (!v68)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 != MEMORY[0x1E0C812F8])
  {
    if (v4 != MEMORY[0x1E0C81310])
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
LABEL_10:
      if (v15)
        free(v15);
      goto LABEL_34;
    }
    if (v3 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v74);
      goto LABEL_34;
    }
    if (v3 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
      goto LABEL_34;
    }
    if (v3 != (void *)MEMORY[0x1E0C81288])
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)v15);
      goto LABEL_10;
    }
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v74);
    goto LABEL_33;
  }
  xpc_dictionary_get_value(v3, "Result");
  v16 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v16;
  if (!v16)
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_33;
    v23 = (id)nrCopyLogObj_sNRLogObj_2135;
    v24 = "received response without result code";
    goto LABEL_32;
  }
  if (MEMORY[0x1DF0BA7A8](v16) != MEMORY[0x1E0C81328])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_33;
    v23 = (id)nrCopyLogObj_sNRLogObj_2135;
    v24 = "received invalid result type";
    goto LABEL_32;
  }
  value = xpc_int64_get_value(v22);
  if (!value)
  {

    string = xpc_dictionary_get_string(v3, "DeviceListString");
    if (string)
    {
      v30 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
      goto LABEL_35;
    }
    v69 = nrCopyLogObj_2128();
    v70 = v69;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v71 = os_log_type_enabled(v69, OS_LOG_TYPE_FAULT);

      if (!v71)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "Missing device list string in XPC response";
    goto LABEL_32;
  }
  v33 = value;
  if (value >> 31)
  {
    if (!(_DWORD)value)
    {
      v46 = nrCopyLogObj_2128();
      v47 = v46;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v48 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

        if (!v48)
          goto LABEL_33;
      }
      v49 = nrCopyLogObj_2128();
      StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v33);
      _NRLogWithArgs((uint64_t)v49, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, (uint64_t)"");

      goto LABEL_33;
    }
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_33;
    v34 = nrCopyLogObj_2128();
    v73 = (__CFString *)createStringFromNRXPCRes(v33);
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)"received internal failure result code: [%lld] %@", v41, v42, v43, v44, v45, v33);

  }
  else
  {
    if (strerror_r(value, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_33;
    v34 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)"received failure result code: [%d] %s", v35, v36, v37, v38, v39, v33);
  }

LABEL_33:
LABEL_34:
  v30 = CFSTR("ERROR");
LABEL_35:

  return v30;
}

const __CFString *nrXPCCopyIDSDeviceID()
{
  xpc_object_t v0;
  void *v1;
  xpc_object_t v2;
  void *v3;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  unint64_t value;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *string;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  _BOOL4 v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  _BOOL4 v57;
  NSObject *v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  _BOOL4 v68;
  NSObject *v69;
  NSObject *v70;
  _BOOL4 v71;
  __CFString *StringFromNRXPCRes;
  __CFString *v73;
  uint64_t v74;
  char __strerrbuf[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    v55 = nrCopyLogObj_2128();
    v56 = v55;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

      if (!v57)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v66 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v66, (uint64_t)"nr_xpc_dictionary_create");
        v67 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v67);
      }
    }
    v60 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v60, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_80;
  }
  v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x2FuLL);
  v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyIDSDeviceID", v1);
  v3 = v2;
  if (!v2)
  {
    v58 = nrCopyLogObj_2128();
    v59 = v58;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v68 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);

      if (!v68)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received nil response";
    goto LABEL_32;
  }
  v4 = MEMORY[0x1DF0BA7A8](v2);
  if (v4 != MEMORY[0x1E0C812F8])
  {
    if (v4 != MEMORY[0x1E0C81310])
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
LABEL_10:
      if (v15)
        free(v15);
      goto LABEL_34;
    }
    if (v3 == (void *)MEMORY[0x1E0C81258])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v74);
      goto LABEL_34;
    }
    if (v3 == (void *)MEMORY[0x1E0C81260])
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
      goto LABEL_34;
    }
    if (v3 != (void *)MEMORY[0x1E0C81288])
    {
      v15 = (void *)MEMORY[0x1DF0BA6A0](v3);
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)v15);
      goto LABEL_10;
    }
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v74);
    goto LABEL_33;
  }
  xpc_dictionary_get_value(v3, "Result");
  v16 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v16;
  if (!v16)
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_33;
    v23 = (id)nrCopyLogObj_sNRLogObj_2135;
    v24 = "received response without result code";
    goto LABEL_32;
  }
  if (MEMORY[0x1DF0BA7A8](v16) != MEMORY[0x1E0C81328])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_33;
    v23 = (id)nrCopyLogObj_sNRLogObj_2135;
    v24 = "received invalid result type";
    goto LABEL_32;
  }
  value = xpc_int64_get_value(v22);
  if (!value)
  {

    string = xpc_dictionary_get_string(v3, "IDSDeviceID");
    if (string)
    {
      v30 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
      goto LABEL_35;
    }
    v69 = nrCopyLogObj_2128();
    v70 = v69;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v71 = os_log_type_enabled(v69, OS_LOG_TYPE_FAULT);

      if (!v71)
        goto LABEL_34;
    }
    v23 = nrCopyLogObj_2128();
    v22 = v23;
    v24 = "Missing device list string in XPC response";
    goto LABEL_32;
  }
  v33 = value;
  if (value >> 31)
  {
    if (!(_DWORD)value)
    {
      v46 = nrCopyLogObj_2128();
      v47 = v46;
      if (sNRCopyLogToStdErr)
      {

      }
      else
      {
        v48 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

        if (!v48)
          goto LABEL_33;
      }
      v49 = nrCopyLogObj_2128();
      StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v33);
      _NRLogWithArgs((uint64_t)v49, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, (uint64_t)"");

      goto LABEL_33;
    }
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_33;
    v34 = nrCopyLogObj_2128();
    v73 = (__CFString *)createStringFromNRXPCRes(v33);
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)"received internal failure result code: [%lld] %@", v41, v42, v43, v44, v45, v33);

  }
  else
  {
    if (strerror_r(value, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_33;
    v34 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)"received failure result code: [%d] %s", v35, v36, v37, v38, v39, v33);
  }

LABEL_33:
LABEL_34:
  v30 = CFSTR("ERROR");
LABEL_35:

  return v30;
}

void *nrXPCMeasureBTLatency(void *a1)
{
  id v1;
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
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
  uint64_t v16;
  void *uint64;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t value;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  _BOOL4 v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  _BOOL4 v57;
  NSObject *v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  _BOOL4 v68;
  __CFString *StringFromNRXPCRes;
  __CFString *v70;
  uint64_t v71;
  char __strerrbuf[128];
  unsigned __int8 uuid[8];
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    v55 = nrCopyLogObj_2128();
    v56 = v55;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

      if (!v57)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v66 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v66, (uint64_t)"nr_xpc_dictionary_create");
        v67 = nrCopyLogObj_2128();
        _NRLogAbortWithPack(v67);
      }
    }
    v60 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v60, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_79;
  }
  v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x1CuLL);
  *(_QWORD *)uuid = 0;
  v74 = 0;
  objc_msgSend(v1, "getUUIDBytes:", uuid);
  xpc_dictionary_set_uuid(v3, "NRUUID", uuid);
  v4 = nrXPCSendSyncInner((uint64_t)"nrXPCMeasureBTLatency", v3);
  v5 = v4;
  if (!v4)
  {
    v58 = nrCopyLogObj_2128();
    v59 = v58;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v68 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);

      if (!v68)
        goto LABEL_34;
    }
    v25 = nrCopyLogObj_2128();
    v24 = v25;
    v26 = "received nil response";
    goto LABEL_32;
  }
  v6 = MEMORY[0x1DF0BA7A8](v4);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "Result");
    v18 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v18;
    if (v18)
    {
      if (MEMORY[0x1DF0BA7A8](v18) == MEMORY[0x1E0C81328])
      {
        value = xpc_int64_get_value(v24);
        if (!value)
        {

          uint64 = (void *)xpc_dictionary_get_uint64(v5, "BTLatency");
          goto LABEL_35;
        }
        v34 = value;
        if (value >> 31)
        {
          if (!(_DWORD)value)
          {
            v46 = nrCopyLogObj_2128();
            v47 = v46;
            if (sNRCopyLogToStdErr)
            {

            }
            else
            {
              v48 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

              if (!v48)
                goto LABEL_33;
            }
            v49 = nrCopyLogObj_2128();
            StringFromNRXPCRes = (__CFString *)createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v49, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v35 = nrCopyLogObj_2128();
          v70 = (__CFString *)createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v41, v42, v43, v44, v45, v34);

        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL))
            __strerrbuf[0] = 0;
          if (nrCopyLogObj_onceToken_2134 != -1)
            dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          v35 = nrCopyLogObj_2128();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v25 = (id)nrCopyLogObj_sNRLogObj_2135;
      v26 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2134 != -1)
        dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      v25 = (id)nrCopyLogObj_sNRLogObj_2135;
      v26 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v25, 17, (uint64_t)v26, v19, v20, v21, v22, v23, v71);
    goto LABEL_33;
  }
  if (v6 != MEMORY[0x1E0C81310])
  {
    uint64 = (void *)MEMORY[0x1DF0BA6A0](v5);
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)uint64);
    goto LABEL_10;
  }
  if (v5 == (void *)MEMORY[0x1E0C81258])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v71);
    goto LABEL_34;
  }
  if (v5 == (void *)MEMORY[0x1E0C81260])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_ERROR))
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
    goto LABEL_34;
  }
  if (v5 == (void *)MEMORY[0x1E0C81288])
  {
    if (nrCopyLogObj_onceToken_2134 != -1)
      dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
      goto LABEL_34;
    v25 = nrCopyLogObj_2128();
    v24 = v25;
    v26 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64 = (void *)MEMORY[0x1DF0BA6A0](v5);
  if (nrCopyLogObj_onceToken_2134 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2134, &__block_literal_global_379);
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2135, OS_LOG_TYPE_FAULT))
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2135, 17, (uint64_t)"received returned unknown XPC error %s", v27, v28, v29, v30, v31, (uint64_t)uint64);
LABEL_10:
  if (uint64)
  {
    free(uint64);
LABEL_34:
    uint64 = 0;
  }
LABEL_35:

  return uint64;
}

id nrCopyAccountIdentifierForNRUUID(void *a1)
{
  id v1;
  id v2;
  void *v3;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = a1;
  if (v1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v1, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("NRD/%s"), objc_msgSend(v3, "UTF8String"));
  }
  else
  {
    v5 = nrCopyLogObj_2128();
    v6 = v5;
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v7 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);

      if (!v7)
      {
        v2 = 0;
        goto LABEL_4;
      }
    }
    v3 = nrCopyLogObj_2128();
    _NRLogWithArgs((uint64_t)v3, 17, (uint64_t)"%s called with null nrUUID", v8, v9, v10, v11, v12, (uint64_t)"nrCopyAccountIdentifierForNRUUID");
    v2 = 0;
  }

LABEL_4:
  return v2;
}

uint64_t nrSupportsPHSProxy()
{
  if (nrSupportsPHSProxy_onceToken != -1)
    dispatch_once(&nrSupportsPHSProxy_onceToken, &__block_literal_global_372);
  return nrSupportsPHSProxy_supported;
}

uint64_t __nrSupportsPHSProxy_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  nrSupportsPHSProxy_supported = result;
  return result;
}

uint64_t nrSupportsPHSProxyClient()
{
  if (nrSupportsPHSProxyClient_onceToken != -1)
    dispatch_once(&nrSupportsPHSProxyClient_onceToken, &__block_literal_global_375);
  return nrSupportsPHSProxyClient_supported;
}

uint64_t __nrSupportsPHSProxyClient_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  nrSupportsPHSProxyClient_supported = result;
  return result;
}

id nrCopyLogObj_2253()
{
  if (nrCopyLogObj_onceToken_2257 != -1)
    dispatch_once(&nrCopyLogObj_onceToken_2257, &__block_literal_global_2258);
  return (id)nrCopyLogObj_sNRLogObj_2259;
}

void __nrCopyLogObj_block_invoke_2260()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkrelay", "");
  v1 = (void *)nrCopyLogObj_sNRLogObj_2259;
  nrCopyLogObj_sNRLogObj_2259 = (uint64_t)v0;

}

id createStringFromNRServiceClass(unsigned int a1)
{
  void *v1;

  if (a1 >= 6)
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%u)"), a1);
  else
    v1 = *(&off_1EA3F7D30 + a1);
  return v1;
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C803A8](data, *(_QWORD *)&len, md);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x1E0CE8758](store, keys, patterns);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87A8](allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE87C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x1E0C81058]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x1E0C81060]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1E0C83708](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF3B0](hostname, port);
}

nw_parameters_t nw_parameters_copy(nw_parameters_t parameters)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF8B8](parameters);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1E0CCF8C8](parameters);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF930]();
}

uint64_t nw_parameters_create_legacy_tcp_socket()
{
  return MEMORY[0x1E0CCF950]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x1E0CCFA98]();
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x1E0CCFB10]();
}

uint64_t nw_parameters_set_local_address()
{
  return MEMORY[0x1E0CCFB30]();
}

uint64_t nw_parameters_set_no_proxy()
{
  return MEMORY[0x1E0CCFB60]();
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x1E0CCFC00]();
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
  MEMORY[0x1E0CCFC18](parameters, reuse_local_address);
}

void nw_parameters_set_service_class(nw_parameters_t parameters, nw_service_class_t service_class)
{
  MEMORY[0x1E0CCFC28](parameters, *(_QWORD *)&service_class);
}

uint64_t nw_path_assert_agent()
{
  return MEMORY[0x1E0CCFCA0]();
}

uint64_t nw_path_copy_netagent_dictionary()
{
  return MEMORY[0x1E0CCFCE0]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1E0CCFD10]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1E0CCFD20]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD38]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x1E0CCFD58]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

void nw_protocol_stack_set_transport_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
  MEMORY[0x1E0CD0000](stack, protocol);
}

nw_protocol_options_t nw_udp_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CD0408]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

uint64_t os_buflet_get_data_length()
{
  return MEMORY[0x1E0C84520]();
}

uint64_t os_buflet_get_data_offset()
{
  return MEMORY[0x1E0C84530]();
}

uint64_t os_buflet_get_object_address()
{
  return MEMORY[0x1E0C84538]();
}

uint64_t os_channel_advance_slot()
{
  return MEMORY[0x1E0C84548]();
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x1E0C84550]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x1E0C84558]();
}

uint64_t os_channel_attr_set()
{
  return MEMORY[0x1E0C84568]();
}

uint64_t os_channel_available_slot_count()
{
  return MEMORY[0x1E0C84578]();
}

uint64_t os_channel_create_extended()
{
  return MEMORY[0x1E0C84588]();
}

uint64_t os_channel_destroy()
{
  return MEMORY[0x1E0C84590]();
}

uint64_t os_channel_get_fd()
{
  return MEMORY[0x1E0C845C8]();
}

uint64_t os_channel_get_next_slot()
{
  return MEMORY[0x1E0C845E0]();
}

uint64_t os_channel_ring_id()
{
  return MEMORY[0x1E0C84620]();
}

uint64_t os_channel_rx_ring()
{
  return MEMORY[0x1E0C84638]();
}

uint64_t os_channel_set_slot_properties()
{
  return MEMORY[0x1E0C84640]();
}

uint64_t os_channel_slot_get_packet()
{
  return MEMORY[0x1E0C84658]();
}

uint64_t os_channel_sync()
{
  return MEMORY[0x1E0C84660]();
}

uint64_t os_channel_tx_ring()
{
  return MEMORY[0x1E0C84668]();
}

uint64_t os_inet_checksum()
{
  return MEMORY[0x1E0C846F8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

uint64_t os_log_pack_compose()
{
  return MEMORY[0x1E0C84738]();
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x1E0C84740]();
}

uint64_t os_log_pack_send_and_compose()
{
  return MEMORY[0x1E0C84748]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x1E0C84790]();
}

uint64_t os_packet_clear_flow_uuid()
{
  return MEMORY[0x1E0C84808]();
}

uint64_t os_packet_get_next_buflet()
{
  return MEMORY[0x1E0C84848]();
}

uint64_t os_packet_set_flow_uuid()
{
  return MEMORY[0x1E0C84888]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

void tzset(void)
{
  MEMORY[0x1E0C85990]();
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C85EE0](xarray, index, uuid);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1E0C86190](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

