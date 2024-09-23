const __CFString *DDUINotificationResultString(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("Unexpected Response!");
  else
    return off_1E81B4188[a1];
}

os_log_t _DDUICoreLog()
{
  return os_log_create("com.apple.DeviceDiscoveryUI", "core");
}

id DDUICorePrimaryQueue()
{
  if (DDUICorePrimaryQueue_onceToken != -1)
    dispatch_once(&DDUICorePrimaryQueue_onceToken, &__block_literal_global);
  return (id)DDUICorePrimaryQueue_primaryQueue;
}

__CFString *DDUILocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  __CFString *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.DeviceDiscoveryUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E81B4FA0, 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E81B4FA0;
  }

  return v4;
}

__CFString *DDUICoreLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  __CFString *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.DeviceDiscoveryUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E81B4FA0, 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E81B4FA0;
  }

  return v4;
}

__CFString *DDUILocalizedUsageStringForBundle(__CFBundle *a1, uint64_t a2, void *a3)
{
  void *v5;
  __CFString *v6;
  __CFString *v7;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = (__CFString *)CFBundleCopyLocalizedString(a1, (CFStringRef)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-UsageDescription"), a2), v6, CFSTR("InfoPlist"));

  return v7;
}

id DDUILocalizedUsageStringWithSuffixForBundle(__CFBundle *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  DDUILocalizedUsageStringForBundle(a1, (uint64_t)v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id DDUIBuildLocalizedKeyForDeviceTypes(void *a1, char a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = v4;
  if ((a2 & 8) == 0)
  {
    if ((a2 & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v5, "appendString:", CFSTR("_PHONE"));
    if ((a2 & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v4, "appendString:", CFSTR("_WATCH"));
  if ((a2 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((a2 & 2) != 0)
LABEL_4:
    objc_msgSend(v5, "appendString:", CFSTR("_PAD"));
LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

_DDUIRapportPairingTransport *DDUIEndpointPairingBrowsingTransportForOptions(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DDUIRapportPairingTransport *v9;

  if ((a1 & 1) != 0)
  {
    v9 = -[_DDUIRapportPairingTransport initWithMode:]([_DDUIRapportPairingTransport alloc], "initWithMode:", 0);
  }
  else
  {
    _DDUICoreLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      DDUIEndpointPairingBrowsingTransportForOptions_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

    v9 = 0;
  }
  return v9;
}

_DDUIRapportPairingTransport *DDUIEndpointPairingListeningTransportForOptions(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DDUIRapportPairingTransport *v9;

  if ((a1 & 1) != 0)
  {
    v9 = -[_DDUIRapportPairingTransport initWithMode:]([_DDUIRapportPairingTransport alloc], "initWithMode:", 1);
  }
  else
  {
    _DDUICoreLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      DDUIEndpointPairingListeningTransportForOptions_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

    v9 = 0;
  }
  return v9;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

os_log_t _DDUICoreRapportLog()
{
  return os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
}

void sub_1C87B64F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C87B6BE4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C87B6FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C87B7EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1CAA33E80](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1C87B877C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1C87B95BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C87B97FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C87B9B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id UnsupportedErrorWithDescription(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *MEMORY[0x1E0CB2FE0];
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = a1;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", v2, 19, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t initFigContinuityCaptureGetUserPreferenceDisabled()
{
  if (CMCaptureLibrary_sOnce != -1)
    dispatch_once(&CMCaptureLibrary_sOnce, &__block_literal_global_1);
  softLinkFigContinuityCaptureGetUserPreferenceDisabled = (uint64_t (*)())dlsym((void *)CMCaptureLibrary_sLib, "FigContinuityCaptureGetUserPreferenceDisabled");
  return softLinkFigContinuityCaptureGetUserPreferenceDisabled();
}

Class initCPSDedicatedCameraRequest()
{
  Class result;

  if (CompanionServicesLibrary_sOnce != -1)
    dispatch_once(&CompanionServicesLibrary_sOnce, &__block_literal_global_60);
  result = objc_getClass("CPSDedicatedCameraRequest");
  classCPSDedicatedCameraRequest = (uint64_t)result;
  getCPSDedicatedCameraRequestClass = (uint64_t (*)())CPSDedicatedCameraRequestFunction;
  return result;
}

id CPSDedicatedCameraRequestFunction()
{
  return (id)classCPSDedicatedCameraRequest;
}

Class initCPSAuthenticationSession()
{
  Class result;

  if (CompanionServicesLibrary_sOnce != -1)
    dispatch_once(&CompanionServicesLibrary_sOnce, &__block_literal_global_60);
  result = objc_getClass("CPSAuthenticationSession");
  classCPSAuthenticationSession = (uint64_t)result;
  getCPSAuthenticationSessionClass = (uint64_t (*)())CPSAuthenticationSessionFunction;
  return result;
}

id CPSAuthenticationSessionFunction()
{
  return (id)classCPSAuthenticationSession;
}

void sub_1C87BB230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *DDUIEndpointPairingSessionResultString(uint64_t a1)
{
  const __CFString *v1;

  v1 = &stru_1E81B4FA0;
  if (a1 == 1)
    v1 = CFSTR("Cancelled");
  if (a1)
    return v1;
  else
    return CFSTR("Accepted");
}

void sub_1C87BC750(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1C87BCA60(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t DDUIDeviceTypeForModelString(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v4;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("Watch")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("iPhone")) & 1) != 0
         || (objc_msgSend(v1, "hasPrefix:", CFSTR("iPod")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("iPad")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("AppleTV")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("Mac")) & 1) != 0)
  {
    v2 = 4;
  }
  else
  {
    _DDUICoreLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      DDUIDeviceTypeForModelString_cold_1((uint64_t)v1, v4);

    v2 = 0;
  }

  return v2;
}

void sub_1C87BFC54(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1C87C00E8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1C87C0BEC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 128));
  _Unwind_Resume(a1);
}

DDUIInfoPlist *DDUIInfoPlistFromTopLevelDictionary(void *a1)
{
  id v1;
  DDUIInfoPlist *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  DDUIInfoPlist *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(DDUIInfoPlist);
  objc_msgSend(v1, "objectForKey:", CFSTR("Browses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    DDUIInfoPlistServiceMapFromArray(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDUIInfoPlist setBrowsesByIdentifier:](v2, "setBrowsesByIdentifier:", v4);

  }
  objc_msgSend(v1, "objectForKey:", CFSTR("Advertises"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    DDUIInfoPlistServiceMapFromArray(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDUIInfoPlist setAdvertisesByIdentifier:](v2, "setAdvertisesByIdentifier:", v6);

  }
  _DDUICoreLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v2;
    v11 = 2112;
    v12 = v1;
    _os_log_impl(&dword_1C87B2000, v7, OS_LOG_TYPE_INFO, "Loaded info plist %@ from %@", (uint8_t *)&v9, 0x16u);
  }

  return v2;
}

id DDUIInfoPlistServiceMapFromArray(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  DDUIInfoPlistService *v11;
  uint64_t v12;
  NSObject *p_super;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v38;
    v25 = *(_QWORD *)v38;
    v26 = v2;
    do
    {
      v6 = 0;
      v30 = v4;
      do
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("NSApplicationServiceIdentifier"));
          v9 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v9;
          if (v9 && (v10 = v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v11 = objc_alloc_init(DDUIInfoPlistService);
            v12 = v10;
            p_super = &v11->super;
            -[DDUIInfoPlistService setIdentifier:](v11, "setIdentifier:", v12);
            -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("NSApplicationServiceUsageDescription"));
            v14 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v31 = (void *)v14;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[NSObject setUsageDescription:](p_super, "setUsageDescription:", v14);
            -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("NSApplicationServicePlatformSupport"), v25, v26);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = p_super;
              v28 = v8;
              v35 = 0u;
              v36 = 0u;
              v33 = 0u;
              v34 = 0u;
              v16 = v15;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              if (v17)
              {
                v18 = v17;
                v19 = 0;
                v20 = *(_QWORD *)v34;
                do
                {
                  for (i = 0; i != v18; ++i)
                  {
                    if (*(_QWORD *)v34 != v20)
                      objc_enumerationMutation(v16);
                    v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      if (objc_msgSend(v22, "isEqualToString:", CFSTR("iOS")))
                      {
                        v19 = v19 | 1;
                      }
                      else if (objc_msgSend(v22, "isEqualToString:", CFSTR("iPadOS")))
                      {
                        v19 = v19 | 2;
                      }
                      else if (objc_msgSend(v22, "isEqualToString:", CFSTR("watchOS")))
                      {
                        v19 = v19 | 8;
                      }
                      else
                      {
                        v19 = v19;
                      }
                    }
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
                }
                while (v18);
              }
              else
              {
                v19 = 0;
              }

              p_super = v27;
              -[NSObject setDeviceTypes:](v27, "setDeviceTypes:", v19);
              v5 = v25;
              v2 = v26;
              v8 = v28;
            }
            -[NSObject identifier](p_super, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKey:", p_super, v23);

            v4 = v30;
          }
          else
          {
            _DDUICoreLog();
            p_super = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = CFSTR("NSApplicationServiceIdentifier");
              _os_log_impl(&dword_1C87B2000, p_super, OS_LOG_TYPE_DEFAULT, "Identifier item under %@, is not of class NSString", buf, 0xCu);
            }
          }

        }
        else
        {
          _DDUICoreLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v43 = CFSTR("NSApplicationServices");
            _os_log_impl(&dword_1C87B2000, v8, OS_LOG_TYPE_DEFAULT, "Top level item under %@, is not of class NSDictionary", buf, 0xCu);
          }
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v4);
  }

  return v29;
}

id DDUIFetchInfoPlistFromRecord(void *a1)
{
  id v1;
  NSObject *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  _DDUICoreLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v1, "URL");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1C87B2000, v2, OS_LOG_TYPE_DEFAULT, "Looking for bundle at %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v1, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("NSApplicationServices"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    DDUIInfoPlistFromTopLevelDictionary(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _DDUICoreLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543874;
      v10 = CFSTR("NSApplicationServices");
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v1;
      _os_log_impl(&dword_1C87B2000, v7, OS_LOG_TYPE_DEFAULT, "Invalid %{public}@ value found. %@ is not an NSDictionary from %@", (uint8_t *)&v9, 0x20u);
    }

    v6 = 0;
  }

  return v6;
}

id DDUIDeviceTypeString(char a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
  v3 = v2;
  if ((a1 & 8) != 0)
  {
    objc_msgSend(v2, "appendString:", CFSTR("Watch"));
    if ((a1 & 1) == 0)
    {
      if ((a1 & 2) != 0)
      {
LABEL_14:
        objc_msgSend(v3, "appendString:", CFSTR("|"));
LABEL_15:
        objc_msgSend(v3, "appendString:", CFSTR("iPad"));
        if ((a1 & 0x10) != 0)
          goto LABEL_16;
        goto LABEL_10;
      }
LABEL_9:
      if ((a1 & 0x10) != 0)
      {
LABEL_16:
        objc_msgSend(v3, "appendString:", CFSTR("|"));
        goto LABEL_17;
      }
LABEL_10:
      if ((a1 & 4) == 0)
        goto LABEL_20;
      goto LABEL_18;
    }
    objc_msgSend(v3, "appendString:", CFSTR("|"));
LABEL_13:
    objc_msgSend(v3, "appendString:", CFSTR("iPhone"));
    if ((a1 & 2) != 0)
      goto LABEL_14;
    goto LABEL_9;
  }
  if ((a1 & 1) != 0)
    goto LABEL_13;
  if ((a1 & 2) != 0)
    goto LABEL_15;
  if ((a1 & 0x10) == 0)
  {
    if ((a1 & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_17:
  objc_msgSend(v3, "appendString:", CFSTR("TV"));
  if ((a1 & 4) != 0)
  {
LABEL_18:
    objc_msgSend(v3, "appendString:", CFSTR("|"));
LABEL_19:
    objc_msgSend(v3, "appendString:", CFSTR("Mac"));
  }
LABEL_20:
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

uint64_t sub_1C87C269C()
{
  uint64_t v0;

  v0 = sub_1C87C8A54();
  __swift_allocate_value_buffer(v0, qword_1EF8F8508);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF8F8508);
  return sub_1C87C8A48();
}

uint64_t sub_1C87C2718()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1C87C8A54();
  __swift_allocate_value_buffer(v0, qword_1EF8F8528);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EF8F8528);
  if (qword_1EF8F8500 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EF8F8508);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_1C87C27A8()
{
  uint64_t v0;

  type metadata accessor for NameDropIdentity();
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D358B0]), sel_init);
  NameDropIdentity.fetchNickname()();
  static NameDropIdentity.shared = v0;
}

uint64_t *NameDropIdentity.shared.unsafeMutableAddressor()
{
  if (qword_1EF8F8540 != -1)
    swift_once();
  return &static NameDropIdentity.shared;
}

uint64_t static NameDropIdentity.shared.getter()
{
  if (qword_1EF8F8540 != -1)
    swift_once();
  return swift_retain();
}

uint64_t variable initialization expression of NameDropIdentity.cachedNickname()
{
  return 0;
}

id variable initialization expression of NameDropIdentity.nicknameProvider()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D358B0]), sel_init);
}

Swift::Void __swiftcall NameDropIdentity.fetchNickname()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F8180);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C87C8B14();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_1C87C2F28((uint64_t)v3);
    v8 = 0;
    v9 = 0;
  }
  else
  {
    sub_1C87C8B08();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_1C87C8AFC();
      v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = &unk_1EF8F8190;
  *(_QWORD *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v8;
    v12[3] = v9;
  }
  swift_task_create();
  swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1CAA3406C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1C87C2AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 128) = a4;
  return swift_task_switch();
}

uint64_t sub_1C87C2B1C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[16] + 24);
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_1C87C2BE8;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_1C87C2F68;
  v3[3] = &block_descriptor;
  v3[4] = v2;
  objc_msgSend(v1, sel_nicknameForCurrentUserWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_1C87C2BE8()
{
  return swift_task_switch();
}

uint64_t sub_1C87C2C60()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 120);

  if (qword_1EF8F8520 != -1)
    swift_once();
  v3 = sub_1C87C8A54();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EF8F8528);
  swift_retain_n();
  v4 = sub_1C87C8A3C();
  v5 = sub_1C87C8B38();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = *(void **)(v1 + 16);
    if (v8)
    {
      *(_QWORD *)(v0 + 80) = v8;
      v9 = v8;
    }
    else
    {
      *(_QWORD *)(v0 + 80) = 0;
    }
    sub_1C87C8B50();
    *v7 = v8;
    swift_release_n();
    _os_log_impl(&dword_1C87B2000, v4, v5, "Nickname found: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B8);
    swift_arrayDestroy();
    MEMORY[0x1CAA340F0](v7, -1, -1);
    MEMORY[0x1CAA340F0](v6, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C87C2E54()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C87C2E80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C87C2EE0;
  v3[16] = v2;
  return swift_task_switch();
}

uint64_t sub_1C87C2EE0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1C87C2F28(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F8180);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C87C2F68(uint64_t a1, void *a2)
{
  id v2;

  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  v2 = a2;
  return swift_continuation_resume();
}

CNContact_optional __swiftcall NameDropIdentity.contact()()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  Swift::Bool v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  id v35;
  id v36;
  id v37;
  objc_class *v38;
  uint64_t v39;
  void *v40;
  CNContact_optional result;

  v2 = v0;
  v3 = _s21DeviceDiscoveryUICore17MeContactProviderV8contactsSaySo9CNContactCGyF_0();
  if ((unint64_t)v3 >> 62)
  {
    if (sub_1C87C8BC8())
    {
LABEL_3:
      if (((unint64_t)v3 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x1CAA33A78](0, v3);
      }
      else
      {
        if (!*(_QWORD *)(((unint64_t)v3 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_47;
        }
        v4 = *((id *)v3 + 4);
      }
      v1 = v4;
      swift_bridgeObjectRelease();
      if (qword_1EF8F8520 == -1)
      {
LABEL_7:
        v5 = sub_1C87C8A54();
        v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1EF8F8528);
        v7 = v1;
        v39 = v6;
        v8 = sub_1C87C8A3C();
        v9 = sub_1C87C8B38();
        if (os_log_type_enabled(v8, v9))
        {
          v10 = (uint8_t *)swift_slowAlloc();
          v11 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v10 = 138412290;
          v12 = v7;
          sub_1C87C8B50();
          *v11 = v7;

          _os_log_impl(&dword_1C87B2000, v8, v9, "NameDrop from Me Card: %@", v10, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B8);
          swift_arrayDestroy();
          MEMORY[0x1CAA340F0](v11, -1, -1);
          MEMORY[0x1CAA340F0](v10, -1, -1);
        }
        else
        {

        }
        v13 = objc_msgSend(v7, sel_emailAddresses);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B0);
        v14 = sub_1C87C8ACC();

        if (v14 >> 62)
        {
          swift_bridgeObjectRetain();
          v15 = sub_1C87C8BC8();
          swift_bridgeObjectRelease();
        }
        else
        {
          v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (!v15)
        {
          v17 = objc_msgSend(v7, sel_phoneNumbers);
          v18 = sub_1C87C8ACC();

          if (v18 >> 62)
          {
            swift_bridgeObjectRetain();
            v19 = sub_1C87C8BC8();
            swift_bridgeObjectRelease();
          }
          else
          {
            v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          if (!v19)
          {
            v20 = sub_1C87C8A3C();
            v21 = sub_1C87C8B2C();
            if (os_log_type_enabled(v20, v21))
            {
              v22 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v22 = 0;
              _os_log_impl(&dword_1C87B2000, v20, v21, "Me Card has no handles; sourcing them from iCloud & SIM",
                v22,
                2u);
              MEMORY[0x1CAA340F0](v22, -1, -1);
            }

            objc_msgSend(v7, sel_mutableCopy);
            sub_1C87C8B74();
            swift_unknownObjectRelease();
            sub_1C87C848C(0, &qword_1EF8F81A8);
            if ((swift_dynamicCast() & 1) != 0)
            {
              sub_1C87C79B8(v40);

              v7 = v40;
            }
          }
        }
        if (!v7)
        {
          v23 = 0;
          goto LABEL_44;
        }
        v23 = v7;
        v24 = *(void **)(v2 + 16);
        if (!v24)
          goto LABEL_44;
        goto LABEL_37;
      }
LABEL_47:
      swift_once();
      goto LABEL_7;
    }
  }
  else if (*(_QWORD *)(((unint64_t)v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  v25 = sub_1C87C769C();
  if (v25)
  {
    v23 = v25;
    if (qword_1EF8F8520 != -1)
      swift_once();
    v26 = sub_1C87C8A54();
    __swift_project_value_buffer(v26, (uint64_t)qword_1EF8F8528);
    v7 = v23;
    v27 = sub_1C87C8A3C();
    v28 = sub_1C87C8B38();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v29 = 138412290;
      v7 = v7;
      sub_1C87C8B50();
      *v30 = v23;

      _os_log_impl(&dword_1C87B2000, v27, v28, "NameDrop from iCloud+SIM: %@", v29, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B8);
      swift_arrayDestroy();
      MEMORY[0x1CAA340F0](v30, -1, -1);
      MEMORY[0x1CAA340F0](v29, -1, -1);
    }
    else
    {

    }
    v24 = *(void **)(v2 + 16);
    if (v24)
    {
LABEL_37:
      v35 = v24;
      objc_msgSend(v7, sel_mutableCopy);
      sub_1C87C8B74();
      swift_unknownObjectRelease();
      sub_1C87C848C(0, &qword_1EF8F81A8);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v23 = v40;
        v36 = objc_msgSend(v35, sel_firstName);
        if (!v36)
        {
          sub_1C87C8A78();
          v36 = (id)sub_1C87C8A6C();
          swift_bridgeObjectRelease();
        }
        objc_msgSend(v40, sel_setGivenName_, v36, v39);

        v37 = objc_msgSend(v35, sel_lastName);
        if (!v37)
        {
          sub_1C87C8A78();
          v37 = (id)sub_1C87C8A6C();
          swift_bridgeObjectRelease();
        }
        objc_msgSend(v40, sel_setFamilyName_, v37);

      }
    }
  }
  else
  {
    if (qword_1EF8F8520 != -1)
      swift_once();
    v31 = sub_1C87C8A54();
    __swift_project_value_buffer(v31, (uint64_t)qword_1EF8F8528);
    v32 = sub_1C87C8A3C();
    v33 = sub_1C87C8B2C();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1C87B2000, v32, v33, "Nothing to NameDrop", v34, 2u);
      MEMORY[0x1CAA340F0](v34, -1, -1);
    }

    v23 = 0;
  }
LABEL_44:
  v38 = (objc_class *)v23;
  result.value.super.isa = v38;
  result.is_nil = v16;
  return result;
}

BOOL CNContact.isNameDroppable.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  id v5;
  unint64_t v6;
  uint64_t v7;

  v1 = objc_msgSend(v0, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B0);
  v2 = sub_1C87C8ACC();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1C87C8BC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v3)
    return 1;
  v5 = objc_msgSend(v0, sel_phoneNumbers);
  v6 = sub_1C87C8ACC();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1C87C8BC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v7 != 0;
}

uint64_t NameDropIdentity.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t NameDropIdentity.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t vCardContactProvider.contacts()()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  void *v16;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_1C87C8A18();
  v18[0] = 0;
  v2 = objc_msgSend(v0, sel_contactsWithData_error_, v1, v18);

  v3 = v18[0];
  if (v2)
  {
    sub_1C87C848C(0, &qword_1EF8F81C0);
    v4 = sub_1C87C8ACC();
    v5 = v3;

  }
  else
  {
    v6 = v18[0];
    v7 = (void *)sub_1C87C8A0C();

    swift_willThrow();
    if (qword_1EF8F8520 != -1)
      swift_once();
    v8 = sub_1C87C8A54();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EF8F8528);
    v9 = v7;
    v10 = v7;
    v11 = sub_1C87C8A3C();
    v12 = sub_1C87C8B2C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v13 = 138412290;
      v15 = v7;
      v16 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v18[0] = v16;
      sub_1C87C8B50();
      *v14 = v16;

      _os_log_impl(&dword_1C87B2000, v11, v12, "Could not decode vCard: %@", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B8);
      swift_arrayDestroy();
      MEMORY[0x1CAA340F0](v14, -1, -1);
      MEMORY[0x1CAA340F0](v13, -1, -1);
    }
    else
    {

    }
    return MEMORY[0x1E0DEE9D8];
  }
  return v4;
}

uint64_t sub_1C87C3ADC()
{
  return vCardContactProvider.contacts()();
}

uint64_t CNContact.boopPresentedName.getter()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_givenName);
  v3 = sub_1C87C8A78();
  v5 = v4;

  swift_bridgeObjectRelease();
  v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0)
    v6 = v3 & 0xFFFFFFFFFFFFLL;
  if (!v6)
  {
    v7 = objc_msgSend(v1, sel_familyName);
    v8 = sub_1C87C8A78();
    v10 = v9;

    swift_bridgeObjectRelease();
    v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0)
      v11 = v8 & 0xFFFFFFFFFFFFLL;
    if (!v11)
      return 0;
  }
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97218]), sel_init);
  objc_msgSend(v1, sel_mutableCopy);
  sub_1C87C8B74();
  swift_unknownObjectRelease();
  sub_1C87C848C(0, &qword_1EF8F81A8);
  swift_dynamicCast();
  v13 = (void *)sub_1C87C8A6C();
  objc_msgSend(v35, sel_setMiddleName_, v13);

  v14 = (void *)sub_1C87C8A6C();
  objc_msgSend(v35, sel_setNamePrefix_, v14);

  v15 = (void *)sub_1C87C8A6C();
  objc_msgSend(v35, sel_setNameSuffix_, v15);

  v16 = objc_msgSend(v12, sel_stringFromContact_, v35);
  if (!v16)
  {

    return 0;
  }
  v17 = v16;
  v18 = sub_1C87C8A78();
  v19 = CNIsChineseJapaneseKoreanString();

  if (v19)
  {

  }
  else
  {
    swift_bridgeObjectRelease();
    v21 = objc_msgSend(v1, sel_givenName);
    v22 = sub_1C87C8A78();
    v24 = v23;

    swift_bridgeObjectRelease();
    if ((v24 & 0x2000000000000000) != 0)
      v25 = HIBYTE(v24) & 0xF;
    else
      v25 = v22 & 0xFFFFFFFFFFFFLL;
    v26 = objc_msgSend(v1, sel_familyName);
    v18 = sub_1C87C8A78();
    v28 = v27;
    if (v25)
    {

      swift_bridgeObjectRelease();
      v29 = HIBYTE(v28) & 0xF;
      if ((v28 & 0x2000000000000000) == 0)
        v29 = v18 & 0xFFFFFFFFFFFFLL;
      if (v29)
      {
        if (objc_msgSend((id)objc_opt_self(), sel_nameOrderForContact_, v35) == (id)2)
        {
          v30 = objc_msgSend(v1, sel_familyName);
          v31 = sub_1C87C8A78();

          swift_bridgeObjectRetain();
          sub_1C87C8A90();
          swift_bridgeObjectRelease();
          v32 = objc_msgSend(v1, sel_givenName);
        }
        else
        {
          v34 = objc_msgSend(v1, sel_givenName);
          v31 = sub_1C87C8A78();

          swift_bridgeObjectRetain();
          sub_1C87C8A90();
          swift_bridgeObjectRelease();
          v32 = objc_msgSend(v1, sel_familyName);
        }
        sub_1C87C8A78();

        swift_bridgeObjectRetain();
        sub_1C87C8A90();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v31;
      }
      else
      {
        v33 = objc_msgSend(v1, sel_givenName);
        v18 = sub_1C87C8A78();

      }
    }
    else
    {

    }
  }
  return v18;
}

uint64_t CNContact.boopPresentedHandles.getter()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_emailAddresses);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B0);
  v4 = sub_1C87C8ACC();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1C87C8BC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v41 = MEMORY[0x1E0DEE9D8];
    result = sub_1C87C6568(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
    {
      __break(1u);
      goto LABEL_32;
    }
    v37 = v3;
    v39 = v1;
    v8 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x1CAA33A78](v8, v4);
      else
        v9 = *(id *)(v4 + 8 * v8 + 32);
      v10 = v9;
      v11 = objc_msgSend(v9, sel_value, v37, v39);
      sub_1C87C8A78();

      v12 = sub_1C87C8AA8();
      v14 = v13;

      v16 = *(_QWORD *)(v41 + 16);
      v15 = *(_QWORD *)(v41 + 24);
      if (v16 >= v15 >> 1)
        sub_1C87C6568(v15 > 1, v16 + 1, 1);
      ++v8;
      *(_QWORD *)(v41 + 16) = v16 + 1;
      v17 = v41 + 16 * v16;
      *(_QWORD *)(v17 + 32) = v12;
      *(_QWORD *)(v17 + 40) = v14;
    }
    while (v5 != v8);
    swift_bridgeObjectRelease();
    v1 = v39;
    v6 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v18 = swift_bridgeObjectRetain();
  v19 = sub_1C87C7D54(v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v1, sel_phoneNumbers);
  v21 = sub_1C87C8ACC();

  if (!(v21 >> 62))
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v22)
      goto LABEL_16;
LABEL_29:
    swift_bridgeObjectRelease();
LABEL_30:
    v35 = swift_bridgeObjectRetain();
    v36 = sub_1C87C7D54(v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C87C6414(v19);
    return v36;
  }
  swift_bridgeObjectRetain();
  v22 = sub_1C87C8BC8();
  swift_bridgeObjectRelease();
  if (!v22)
    goto LABEL_29;
LABEL_16:
  result = sub_1C87C6568(0, v22 & ~(v22 >> 63), 0);
  if ((v22 & 0x8000000000000000) == 0)
  {
    v38 = 0;
    v40 = v19;
    v23 = 0;
    do
    {
      if ((v21 & 0xC000000000000001) != 0)
        v24 = (id)MEMORY[0x1CAA33A78](v23, v21);
      else
        v24 = *(id *)(v21 + 8 * v23 + 32);
      v25 = v24;
      v26 = objc_msgSend(v24, sel_value, v38, v40);
      v27 = objc_msgSend(v26, sel_formattedStringValue);

      if (!v27)
      {
        v28 = objc_msgSend(v25, sel_value);
        v27 = objc_msgSend(v28, sel_stringValue);

      }
      sub_1C87C8A78();

      v29 = sub_1C87C8AA8();
      v31 = v30;

      v33 = *(_QWORD *)(v6 + 16);
      v32 = *(_QWORD *)(v6 + 24);
      if (v33 >= v32 >> 1)
        sub_1C87C6568(v32 > 1, v33 + 1, 1);
      ++v23;
      *(_QWORD *)(v6 + 16) = v33 + 1;
      v34 = v6 + 16 * v33;
      *(_QWORD *)(v34 + 32) = v29;
      *(_QWORD *)(v34 + 40) = v31;
    }
    while (v22 != v23);
    swift_bridgeObjectRelease();
    v19 = v40;
    goto LABEL_30;
  }
LABEL_32:
  __break(1u);
  return result;
}

void CNContact.boopDefaultHandleIndex.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char **p_name;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  char v12;
  char v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  int v31;
  uint8_t *v32;
  id v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint8_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  id v48[3];
  uint64_t v49;

  v0 = sub_1C87C8A54();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = 0;
  if (qword_1EF8F8540 != -1)
    swift_once();
  sub_1C87C7484();
  p_name = &OBJC_PROTOCOL___UNUserNotificationCenterDelegate.name;
  if (v5)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0C97398]);
    v7 = (void *)sub_1C87C8A6C();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v6, sel_initWithStringValue_, v7);

    v9 = CNContact.boopPresentedHandles.getter();
    v10 = v8;
    v11 = sub_1C87C7FAC(v9, (uint64_t)v10);
    v13 = v12;
    swift_bridgeObjectRelease();

    if ((v13 & 1) == 0)
    {
      if (qword_1EF8F8520 != -1)
        swift_once();
      __swift_project_value_buffer(v0, (uint64_t)qword_1EF8F8528);
      v14 = v10;
      v15 = sub_1C87C8A3C();
      v16 = sub_1C87C8B20();
      if (os_log_type_enabled(v15, v16))
      {
        v46 = v11;
        v17 = (uint8_t *)swift_slowAlloc();
        v18 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v17 = 138412290;
        v48[0] = v14;
        v19 = v14;
        p_name = (char **)(&OBJC_PROTOCOL___UNUserNotificationCenterDelegate + 8);
        sub_1C87C8B50();
        *v18 = v14;

        _os_log_impl(&dword_1C87B2000, v15, v16, "Preferring voice SIM for NameDrop: %@", v17, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B8);
        swift_arrayDestroy();
        MEMORY[0x1CAA340F0](v18, -1, -1);
        MEMORY[0x1CAA340F0](v17, -1, -1);

        v49 = v46;
      }
      else
      {

        v49 = v11;
      }
      goto LABEL_23;
    }

  }
  v20 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(v20, sel_aa_primaryAppleAccount);
    if (v22)
    {
      v23 = v22;
      v24 = CNContact.boopPresentedHandles.getter();
      v25 = v23;
      v26 = sub_1C87C8098(v24, v25);
      LOBYTE(v23) = v27;
      swift_bridgeObjectRelease();

      if ((v23 & 1) != 0)
      {

      }
      else
      {
        if (qword_1EF8F8520 != -1)
          swift_once();
        v28 = __swift_project_value_buffer(v0, (uint64_t)qword_1EF8F8528);
        (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v28, v0);
        v29 = v25;
        v30 = sub_1C87C8A3C();
        v31 = sub_1C87C8B20();
        if (os_log_type_enabled(v30, (os_log_type_t)v31))
        {
          v45 = v31;
          v46 = v26;
          v32 = (uint8_t *)swift_slowAlloc();
          v44 = swift_slowAlloc();
          v48[0] = (id)v44;
          *(_DWORD *)v32 = 136315138;
          v33 = objc_msgSend(v29, sel_username);
          if (!v33)
          {

            __break(1u);
            return;
          }
          v34 = v33;
          v43 = v32 + 4;
          v35 = sub_1C87C8A78();
          v37 = v36;

          v47 = sub_1C87C5DD4(v35, v37, (uint64_t *)v48);
          sub_1C87C8B50();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C87B2000, v30, (os_log_type_t)v45, "Preferring iCloud email for NameDrop: %s", v32, 0xCu);
          v38 = v44;
          swift_arrayDestroy();
          MEMORY[0x1CAA340F0](v38, -1, -1);
          MEMORY[0x1CAA340F0](v32, -1, -1);

          (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
          p_name = (char **)(&OBJC_PROTOCOL___UNUserNotificationCenterDelegate + 8);
          v26 = v46;
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
        }
        v49 = v26;
      }
    }
    else
    {

    }
  }
LABEL_23:
  if (p_name[164] != (char *)-1)
    swift_once();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF8F8528);
  v39 = v49;
  v40 = sub_1C87C8A3C();
  v41 = sub_1C87C8B20();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v42 = 134217984;
    v48[0] = (id)v39;
    sub_1C87C8B50();
    _os_log_impl(&dword_1C87B2000, v40, v41, "Default NameDrop handle index: %ld", v42, 0xCu);
    MEMORY[0x1CAA340F0](v42, -1, -1);
  }

  swift_beginAccess();
}

void CNContact.boopDefaultHandle.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = CNContact.boopPresentedHandles.getter();
  if (!*(_QWORD *)(v0 + 16))
    goto LABEL_5;
  CNContact.boopDefaultHandleIndex.getter();
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v1 < *(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

void CNContact.boopDefaultHandleIsEmail.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = CNContact.boopPresentedHandles.getter();
  if (!*(_QWORD *)(v0 + 16))
    goto LABEL_5;
  CNContact.boopDefaultHandleIndex.getter();
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v1 < *(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    sub_1C87C81B0();
    sub_1C87C8B68();
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

CNContact __swiftcall CNContact.boopDefaultHandleAsContact()()
{
  id v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97360]), sel_init);
  v1 = CNContact.boopPresentedHandles.getter();
  if (*(_QWORD *)(v1 + 16))
  {
    CNContact.boopDefaultHandleIndex.getter();
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v2 < *(_QWORD *)(v1 + 16))
    {
      v3 = v1 + 16 * v2;
      v5 = *(_QWORD *)(v3 + 32);
      v4 = *(_QWORD *)(v3 + 40);
      swift_bridgeObjectRetain();
      goto LABEL_6;
    }
    __break(1u);
LABEL_24:
    swift_once();
    goto LABEL_14;
  }
  v5 = 0;
  v4 = 0xE000000000000000;
LABEL_6:
  swift_bridgeObjectRelease();
  v6 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v6 = v5 & 0xFFFFFFFFFFFFLL;
  if (v6)
  {
    CNContact.boopDefaultHandleIsEmail.getter();
    if ((v7 & 1) != 0)
    {
      v8 = (void *)sub_1C87C8A6C();
      swift_bridgeObjectRelease();
      v9 = objc_allocWithZone(MEMORY[0x1E0C97338]);
      v10 = (void *)sub_1C87C8A6C();
      objc_msgSend(v9, sel_initWithLabel_value_, v10, v8);

      v11 = objc_msgSend(v0, sel_emailAddresses);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B0);
      v12 = sub_1C87C8ACC();

      MEMORY[0x1CAA33988]();
      if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1C87C8AE4();
      sub_1C87C8AF0();
      sub_1C87C8AD8();
      v13 = (void *)sub_1C87C8AC0();
      swift_bridgeObjectRelease();
      objc_msgSend(v0, sel_setEmailAddresses_, v13);
    }
    else
    {
      v18 = objc_allocWithZone(MEMORY[0x1E0C97398]);
      v19 = (void *)sub_1C87C8A6C();
      swift_bridgeObjectRelease();
      v20 = objc_msgSend(v18, sel_initWithStringValue_, v19);

      v21 = objc_allocWithZone(MEMORY[0x1E0C97338]);
      v22 = (void *)sub_1C87C8A6C();
      objc_msgSend(v21, sel_initWithLabel_value_, v22, v20);

      v23 = objc_msgSend(v0, sel_phoneNumbers);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B0);
      v24 = sub_1C87C8ACC();

      MEMORY[0x1CAA33988]();
      if (*(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1C87C8AE4();
      sub_1C87C8AF0();
      sub_1C87C8AD8();
      v13 = (void *)sub_1C87C8AC0();
      swift_bridgeObjectRelease();
      objc_msgSend(v0, sel_setPhoneNumbers_, v13);
    }

    return (CNContact)v0;
  }
  swift_bridgeObjectRelease();
  if (qword_1EF8F8520 != -1)
    goto LABEL_24;
LABEL_14:
  v14 = sub_1C87C8A54();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EF8F8528);
  v15 = sub_1C87C8A3C();
  v16 = sub_1C87C8B2C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1C87B2000, v15, v16, "No default handle!", v17, 2u);
    MEMORY[0x1CAA340F0](v17, -1, -1);
  }

  return (CNContact)v0;
}

void CNContact.vCardForBoopingDefaultHandle()()
{
  uint64_t inited;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C87CA1D0;
  v1 = CNContact.boopPresentedHandles.getter();
  if (!*(_QWORD *)(v1 + 16))
  {
    v5 = 0;
    v4 = 0xE000000000000000;
    goto LABEL_6;
  }
  CNContact.boopDefaultHandleIndex.getter();
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v2 < *(_QWORD *)(v1 + 16))
  {
    v3 = v1 + 16 * v2;
    v5 = *(_QWORD *)(v3 + 32);
    v4 = *(_QWORD *)(v3 + 40);
    swift_bridgeObjectRetain();
LABEL_6:
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 32) = v5;
    *(_QWORD *)(inited + 40) = v4;
    CNContact.vCardForBooping(with:)(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    return;
  }
  __break(1u);
}

uint64_t CNContact.vCardForBooping(with:)(uint64_t a1)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void **v13;
  uint64_t v14;
  char **v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  char **v53;
  char **v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  _QWORD *v58;
  char **v59;
  void *v60;
  void *v62;
  id v63;
  id v64[2];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v2 = v1;
  v67 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97360]), sel_init);
  v5 = objc_msgSend(v1, sel_givenName);
  if (!v5)
  {
    sub_1C87C8A78();
    v5 = (id)sub_1C87C8A6C();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v4, sel_setGivenName_, v5);

  v6 = objc_msgSend(v2, sel_familyName);
  if (!v6)
  {
    sub_1C87C8A78();
    v6 = (id)sub_1C87C8A6C();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v4, sel_setFamilyName_, v6);

  objc_msgSend(v4, sel_setContactType_, 0);
  CNContact.boopPresentedName.getter();
  v7 = (void *)sub_1C87C8A6C();
  swift_bridgeObjectRelease();
  v8 = CNIsChineseJapaneseKoreanString();

  if (v8)
  {
    v9 = objc_msgSend(v2, sel_phoneticGivenName);
    if (!v9)
    {
      sub_1C87C8A78();
      v9 = (id)sub_1C87C8A6C();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v4, sel_setPhoneticGivenName_, v9);

    v10 = objc_msgSend(v2, sel_phoneticMiddleName);
    if (!v10)
    {
      sub_1C87C8A78();
      v10 = (id)sub_1C87C8A6C();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v4, sel_setPhoneticMiddleName_, v10);

    v11 = objc_msgSend(v2, sel_phoneticFamilyName);
    if (!v11)
    {
      sub_1C87C8A78();
      v11 = (id)sub_1C87C8A6C();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v4, sel_setPhoneticFamilyName_, v11);

  }
  v65 = MEMORY[0x1E0DEE9D8];
  v66 = MEMORY[0x1E0DEE9D8];
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
  {
    v62 = v2;
    v63 = v4;
    v13 = (void **)(a1 + 40);
    swift_bridgeObjectRetain();
    v14 = 1;
    sub_1C87C81B0();
    v15 = &selRef_setInterruptionHandler_;
    while (1)
    {
      v16 = *v13;
      v64[0] = *(v13 - 1);
      v64[1] = v16;
      swift_bridgeObjectRetain();
      if ((sub_1C87C8B68() & 1) != 0)
      {
        v17 = (void *)sub_1C87C8A6C();
        v18 = objc_allocWithZone(MEMORY[0x1E0C97338]);
        v19 = (void *)sub_1C87C8A6C();
        objc_msgSend(v18, sel_initWithLabel_value_, v19, v17);

        MEMORY[0x1CAA33988]();
        if (*(_QWORD *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1C87C8AE4();
      }
      else
      {
        v20 = objc_allocWithZone(MEMORY[0x1E0C97398]);
        swift_bridgeObjectRetain();
        v21 = (void *)sub_1C87C8A6C();
        swift_bridgeObjectRelease();
        v22 = objc_msgSend(v20, sel_initWithStringValue_, v21);

        v23 = objc_allocWithZone(MEMORY[0x1E0C97338]);
        v24 = (void *)sub_1C87C8A6C();
        objc_msgSend(v23, sel_initWithLabel_value_, v24, v22);

        MEMORY[0x1CAA33988]();
        if (*(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1C87C8AE4();
      }
      sub_1C87C8AF0();
      sub_1C87C8AD8();
      swift_bridgeObjectRelease();
      if (v12 == v14)
        break;
      v13 += 2;
      if (__OFADD__(v14++, 1))
      {
        __break(1u);
        goto LABEL_42;
      }
    }
    swift_bridgeObjectRelease();
    v2 = v62;
    v4 = v63;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B0);
  v26 = (void *)sub_1C87C8AC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setEmailAddresses_, v26);

  swift_bridgeObjectRetain();
  v27 = (void *)sub_1C87C8AC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setPhoneNumbers_, v27);

  v28 = objc_msgSend(v2, sel_thumbnailImageData);
  if (v28 || (v28 = objc_msgSend(v2, sel_imageData)) != 0)
  {
    v29 = sub_1C87C8A24();
    v31 = v30;

    v28 = (id)sub_1C87C8A18();
    sub_1C87C81F4(v29, v31);
  }
  objc_msgSend(v4, sel_setThumbnailImageData_, v28);

  if (CNSNaPWallpaperEnabled())
  {
    v32 = objc_msgSend(v2, sel_wallpaper);
    if (v32)
    {
      v33 = v32;
      v34 = objc_msgSend(v32, sel_posterArchiveData);

      v35 = sub_1C87C8A24();
      v37 = v36;

      sub_1C87C81F4(v35, v37);
      v38 = objc_msgSend(v2, sel_wallpaper);
      objc_msgSend(v4, sel_setWallpaper_, v38);

      objc_msgSend(v4, sel_setSharedPhotoDisplayPreference_, 1);
    }
  }
  v39 = objc_msgSend(v2, sel_watchWallpaperImageData);
  if (v39)
  {
    v40 = sub_1C87C8A24();
    v42 = v41;

    v39 = (id)sub_1C87C8A18();
    sub_1C87C81F4(v40, v42);
  }
  objc_msgSend(v4, sel_setWatchWallpaperImageData_, v39);

  v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DDCAF0]), sel_init);
  objc_msgSend(v43, sel_setIncludePhotos_, 1);
  objc_msgSend(v43, sel_setIncludeWallpaper_, 1);
  v44 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81D8);
  v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_1C87CA1E0;
  *(_QWORD *)(v45 + 32) = v4;
  sub_1C87C8AD8();
  sub_1C87C848C(0, &qword_1EF8F81C0);
  v46 = v4;
  v47 = (void *)sub_1C87C8AC0();
  swift_bridgeObjectRelease();
  v64[0] = 0;
  v48 = objc_msgSend(v44, sel_dataWithContacts_options_error_, v47, v43, v64);

  v49 = v64[0];
  if (v48)
  {
    v50 = sub_1C87C8A24();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v51 = v49;
    v15 = (char **)sub_1C87C8A0C();

    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EF8F8520 != -1)
LABEL_42:
      swift_once();
    v52 = sub_1C87C8A54();
    __swift_project_value_buffer(v52, (uint64_t)qword_1EF8F8528);
    v53 = v15;
    v54 = v15;
    v55 = sub_1C87C8A3C();
    v56 = sub_1C87C8B2C();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      v58 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v57 = 138412290;
      v59 = v15;
      v60 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v64[0] = v60;
      sub_1C87C8B50();
      *v58 = v60;

      _os_log_impl(&dword_1C87B2000, v55, v56, "Could not encode vCard: %@", v57, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B8);
      swift_arrayDestroy();
      MEMORY[0x1CAA340F0](v58, -1, -1);
      MEMORY[0x1CAA340F0](v57, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v50;
}

uint64_t CNContact.avatarImageData.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_thumbnailImageData);
  if (!v1)
  {
    v1 = objc_msgSend(v0, sel_imageData);
    if (!v1)
      return 0;
  }
  v2 = sub_1C87C8A24();

  return v2;
}

void *CNContact.posterArchiveData.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  if (!CNSNaPWallpaperEnabled())
    return 0;
  v1 = objc_msgSend(v0, sel_wallpaper);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, sel_posterArchiveData);

    v2 = (void *)sub_1C87C8A24();
  }
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CNMutableContact.saveToContactStore()()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7[2];

  v1 = v0;
  v7[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_init);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C973D0]), sel_init);
  v4 = (void *)sub_1C87C8A6C();
  objc_msgSend(v3, sel_setTransactionAuthor_, v4);

  objc_msgSend(v3, sel_addContact_toContainerWithIdentifier_, v1, 0);
  v7[0] = 0;
  if ((objc_msgSend(v2, sel_executeSaveRequest_error_, v3, v7) & 1) != 0)
  {
    v5 = v7[0];
  }
  else
  {
    v6 = v7[0];
    sub_1C87C8A0C();

    swift_willThrow();
  }

}

uint64_t sub_1C87C5B84(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1C87C5BE8;
  return v6(a1);
}

uint64_t sub_1C87C5BE8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1C87C5C34()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C87C5C58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C87C2EE0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF8F8198 + dword_1EF8F8198))(a1, v4);
}

_QWORD *sub_1C87C5CC8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81D0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C87C7EBC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C87C5DD4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1C87C5EA4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C87C844C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1C87C844C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C87C5EA4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1C87C8B5C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1C87C605C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1C87C8BB0();
  if (!v8)
  {
    sub_1C87C8BBC();
    __break(1u);
LABEL_17:
    result = sub_1C87C8BD4();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1C87C605C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C87C60F0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1C87C62C8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1C87C62C8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C87C60F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1C87C6264(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1C87C8B98();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1C87C8BBC();
      __break(1u);
LABEL_10:
      v2 = sub_1C87C8A9C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1C87C8BD4();
    __break(1u);
LABEL_14:
    result = sub_1C87C8BBC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1C87C6264(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F82C8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C87C62C8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F82C8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1C87C8BD4();
  __break(1u);
  return result;
}

uint64_t sub_1C87C6414(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_1C87C5CC8(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1C87C8BD4();
  __break(1u);
  return result;
}

uint64_t sub_1C87C6568(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1C87C6584(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1C87C6584(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81D0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1C87C8BD4();
  __break(1u);
  return result;
}

uint64_t sub_1C87C66EC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_1C87C8BF8();
  swift_bridgeObjectRetain();
  sub_1C87C8A84();
  v8 = sub_1C87C8C04();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1C87C8BE0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1C87C8BE0() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1C87C6B5C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1C87C6898()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F82D8);
  v3 = sub_1C87C8B8C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
    goto LABEL_37;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v31 = v0;
  v32 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v7)
    {
      v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_22;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v16 >= v8)
      break;
    v17 = (_QWORD *)(v2 + 56);
    v18 = *(_QWORD *)(v32 + 8 * v16);
    ++v11;
    if (!v18)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v8)
        goto LABEL_31;
      v18 = *(_QWORD *)(v32 + 8 * v11);
      if (!v18)
      {
        v19 = v16 + 2;
        if (v19 >= v8)
        {
LABEL_31:
          swift_release();
          v1 = v31;
          goto LABEL_33;
        }
        v18 = *(_QWORD *)(v32 + 8 * v19);
        if (!v18)
        {
          while (1)
          {
            v11 = v19 + 1;
            if (__OFADD__(v19, 1))
              goto LABEL_39;
            if (v11 >= v8)
              goto LABEL_31;
            v18 = *(_QWORD *)(v32 + 8 * v11);
            ++v19;
            if (v18)
              goto LABEL_21;
          }
        }
        v11 = v19;
      }
    }
LABEL_21:
    v7 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v11 << 6);
LABEL_22:
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v21 = *v20;
    v22 = v20[1];
    sub_1C87C8BF8();
    sub_1C87C8A84();
    result = sub_1C87C8C04();
    v23 = -1 << *(_BYTE *)(v4 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v9 + 8 * (v24 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v9 + 8 * v25);
      }
      while (v29 == -1);
      v12 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v21;
    v13[1] = v22;
    ++*(_QWORD *)(v4 + 16);
  }
  swift_release();
  v1 = v31;
  v17 = (_QWORD *)(v2 + 56);
LABEL_33:
  v30 = 1 << *(_BYTE *)(v2 + 32);
  if (v30 > 63)
    bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v17 = -1 << v30;
  *(_QWORD *)(v2 + 16) = 0;
LABEL_37:
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1C87C6B5C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_1C87C6898();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1C87C6CF4();
      goto LABEL_22;
    }
    sub_1C87C6E90();
  }
  v11 = *v4;
  sub_1C87C8BF8();
  sub_1C87C8A84();
  result = sub_1C87C8C04();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1C87C8BE0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1C87C8BEC();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_1C87C8BE0();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_1C87C6CF4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F82D8);
  v2 = *v0;
  v3 = sub_1C87C8B80();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1C87C6E90()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F82D8);
  v3 = sub_1C87C8B8C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_32:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain_n();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_21;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v16 >= v29)
      goto LABEL_30;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_30;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v18 = v16 + 2;
        if (v18 >= v29)
        {
LABEL_30:
          result = swift_release_n();
          v1 = v0;
          goto LABEL_32;
        }
        v17 = *(_QWORD *)(v6 + 8 * v18);
        v11 = v18;
        if (!v17)
          break;
      }
    }
LABEL_20:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_21:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_1C87C8BF8();
    swift_bridgeObjectRetain();
    sub_1C87C8A84();
    result = sub_1C87C8C04();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_33;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_30;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_20;
  }
LABEL_34:
  __break(1u);
  return result;
}

id _s21DeviceDiscoveryUICore17MeContactProviderV8contactsSaySo9CNContactCGyF_0()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;
  void *v17;
  void *v19;
  id v20[5];

  v20[4] = *(id *)MEMORY[0x1E0C80C00];
  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97298]), sel_init);
  sub_1C87C8A30();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8F8340);
  v1 = (void *)sub_1C87C8AC0();
  swift_bridgeObjectRelease();
  v20[0] = 0;
  v2 = objc_msgSend(v0, sel__crossPlatformUnifiedMeContactWithKeysToFetch_error_, v1, v20);

  if (v2)
  {
    v3 = v20[0];
    objc_msgSend(v2, sel_mutableCopy);
    sub_1C87C8B74();
    swift_unknownObjectRelease();
    sub_1C87C848C(0, &qword_1EF8F81A8);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B0);
    v4 = (void *)sub_1C87C8AC0();
    objc_msgSend(v19, sel_setAddressingGrammars_, v4);

    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81D8);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1C87CA1E0;
    *(_QWORD *)(v5 + 32) = v19;
    v20[0] = (id)v5;
    sub_1C87C8AD8();
    v6 = v20[0];

  }
  else
  {
    v7 = v20[0];
    v8 = (void *)sub_1C87C8A0C();

    swift_willThrow();
    if (qword_1EF8F8520 != -1)
      swift_once();
    v9 = sub_1C87C8A54();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EF8F8528);
    v10 = v8;
    v11 = v8;
    v12 = sub_1C87C8A3C();
    v13 = sub_1C87C8B2C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v14 = 138412290;
      v16 = v8;
      v17 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v20[0] = v17;
      sub_1C87C8B50();
      *v15 = v17;

      _os_log_impl(&dword_1C87B2000, v12, v13, "Could not fetch me card: %@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B8);
      swift_arrayDestroy();
      MEMORY[0x1CAA340F0](v15, -1, -1);
      MEMORY[0x1CAA340F0](v14, -1, -1);
    }
    else
    {

    }
    return (id)MEMORY[0x1E0DEE9D8];
  }
  return v6;
}

uint64_t sub_1C87C7484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v20[2];

  v20[1] = *(id *)MEMORY[0x1E0C80C00];
  v0 = sub_1C87C8A60();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C87C848C(0, &qword_1EF8F82D0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF540], v0);
  v4 = (void *)sub_1C87C8B44();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CA6E38]), sel_initWithQueue_, v4);

  v20[0] = 0;
  v6 = objc_msgSend(v5, sel_getUserDefaultVoiceSubscriptionContext_, v20);
  v7 = v20[0];
  if (!v6)
  {
    v15 = v20[0];
    v16 = (void *)sub_1C87C8A0C();

    swift_willThrow();
LABEL_6:

    return 0;
  }
  v8 = v6;
  v20[0] = 0;
  v9 = v7;
  v10 = objc_msgSend(v5, sel_getPhoneNumber_error_, v8, v20);
  if (!v10)
  {
    v17 = v20[0];
    v16 = (void *)sub_1C87C8A0C();

    swift_willThrow();
    goto LABEL_6;
  }
  v11 = v10;
  v12 = v20[0];
  v13 = objc_msgSend(v11, sel_displayPhoneNumber);

  v14 = sub_1C87C8A78();
  return v14;
}

id sub_1C87C769C()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id result;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (!v0)
    return 0;
  v1 = v0;
  v2 = objc_msgSend(v0, sel_aa_primaryAppleAccount);
  if (!v2)
  {

    return 0;
  }
  v3 = v2;
  result = objc_msgSend(v2, sel_username);
  if (!result)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v5 = result;
  v6 = sub_1C87C8A78();
  v8 = v7;

  swift_bridgeObjectRelease();
  v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  if (!v9)
  {

    return 0;
  }
  v10 = sub_1C87C7484();
  if (v11)
  {
    v12 = v10;
    v13 = v11;
    v14 = objc_msgSend(v3, sel_userFullName);
    if (v14)
    {
      v15 = v14;
      sub_1C87C8A78();
      v17 = v16;

    }
    else
    {
      v17 = 0;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81D0);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_1C87CA1F0;
    *(_QWORD *)(v23 + 32) = v12;
    *(_QWORD *)(v23 + 40) = v13;
    result = objc_msgSend(v3, sel_username);
    if (result)
    {
      v24 = result;
      v25 = sub_1C87C8A78();
      v27 = v26;

      *(_QWORD *)(v23 + 48) = v25;
      *(_QWORD *)(v23 + 56) = v27;
      if (v17)
      {
        v28 = (void *)sub_1C87C8A6C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v28 = 0;
      }
      v29 = (void *)sub_1C87C8AC0();
      swift_bridgeObjectRelease();
      v18 = objc_msgSend((id)objc_opt_self(), sel_contactWithDisplayName_handleStrings_, v28, v29);

      return v18;
    }
    goto LABEL_29;
  }
  v19 = objc_msgSend(v3, sel_userFullName);
  if (v19)
  {
    v20 = v19;
    sub_1C87C8A78();
    v22 = v21;

  }
  else
  {
    v22 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81D0);
  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_1C87CA1D0;
  result = objc_msgSend(v3, sel_username);
  if (result)
  {
    v31 = result;
    v32 = sub_1C87C8A78();
    v34 = v33;

    *(_QWORD *)(v30 + 32) = v32;
    *(_QWORD *)(v30 + 40) = v34;
    if (v22)
    {
      v35 = (void *)sub_1C87C8A6C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v35 = 0;
    }
    v36 = (void *)sub_1C87C8AC0();
    swift_bridgeObjectRelease();
    v18 = objc_msgSend((id)objc_opt_self(), sel_contactWithDisplayName_handleStrings_, v35, v36);

    return v18;
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_1C87C79B8(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  os_log_type_t v27;
  uint8_t *v28;
  NSObject *oslog;

  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (!v2)
  {
LABEL_13:
    sub_1C87C7484();
    if (!v18)
    {
      if (qword_1EF8F8520 != -1)
        swift_once();
      v26 = sub_1C87C8A54();
      __swift_project_value_buffer(v26, (uint64_t)qword_1EF8F8528);
      oslog = sub_1C87C8A3C();
      v27 = sub_1C87C8B2C();
      if (os_log_type_enabled(oslog, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1C87B2000, oslog, v27, "Unable to find NameDrop handles from iCloud or SIM", v28, 2u);
        MEMORY[0x1CAA340F0](v28, -1, -1);
      }
      goto LABEL_19;
    }
LABEL_14:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81D8);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1C87CA1E0;
    v20 = objc_allocWithZone(MEMORY[0x1E0C97398]);
    v21 = (void *)sub_1C87C8A6C();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v20, sel_initWithStringValue_, v21);

    v23 = objc_allocWithZone(MEMORY[0x1E0C97338]);
    v24 = (void *)sub_1C87C8A6C();
    v25 = objc_msgSend(v23, sel_initWithLabel_value_, v24, v22);

    *(_QWORD *)(v19 + 32) = v25;
    sub_1C87C8AD8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B0);
    oslog = sub_1C87C8AC0();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setPhoneNumbers_, oslog);
LABEL_19:

    return;
  }
  v3 = v2;
  v4 = objc_msgSend(v2, sel_aa_primaryAppleAccount);
  if (!v4)
  {
LABEL_12:

    goto LABEL_13;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_username);
  if (!v6)
  {
    v7 = v5;
LABEL_11:

    v3 = v7;
    goto LABEL_12;
  }
  v7 = v6;
  v8 = sub_1C87C8A78();
  v10 = v9;
  swift_bridgeObjectRelease();
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v8 & 0xFFFFFFFFFFFFLL;
  if (!v11)
  {

    v3 = v5;
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81D8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1C87CA1E0;
  v13 = objc_allocWithZone(MEMORY[0x1E0C97338]);
  v14 = (void *)sub_1C87C8A6C();
  v15 = objc_msgSend(v13, sel_initWithLabel_value_, v14, v7);

  *(_QWORD *)(v12 + 32) = v15;
  sub_1C87C8AD8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8F81B0);
  v16 = (void *)sub_1C87C8AC0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setEmailAddresses_, v16);

  sub_1C87C7484();
  if (v17)
    goto LABEL_14;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1C87C7D54(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *i;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  v2 = 0;
  v3 = result + 40;
  v4 = -(uint64_t)v1;
  v5 = MEMORY[0x1E0DEE9D8];
  v15 = result + 40;
  v16 = *(_QWORD *)(result + 16);
  do
  {
    if (v2 <= v1)
      v6 = v1;
    else
      v6 = v2;
    v7 = -(uint64_t)v6;
    for (i = (uint64_t *)(v3 + 16 * v2++); ; i += 2)
    {
      if (v7 + v2 == 1)
      {
        __break(1u);
        return result;
      }
      v10 = *(i - 1);
      v9 = *i;
      swift_bridgeObjectRetain_n();
      v11 = sub_1C87C66EC(&v17, v10, v9);
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        break;
      result = swift_bridgeObjectRelease();
      ++v2;
      if (v4 + v2 == 1)
        return v5;
    }
    result = swift_isUniquelyReferenced_nonNull_native();
    v18 = v5;
    if ((result & 1) == 0)
    {
      result = sub_1C87C6568(0, *(_QWORD *)(v5 + 16) + 1, 1);
      v5 = v18;
    }
    v13 = *(_QWORD *)(v5 + 16);
    v12 = *(_QWORD *)(v5 + 24);
    if (v13 >= v12 >> 1)
    {
      result = sub_1C87C6568(v12 > 1, v13 + 1, 1);
      v5 = v18;
    }
    *(_QWORD *)(v5 + 16) = v13 + 1;
    v14 = v5 + 16 * v13;
    *(_QWORD *)(v14 + 32) = v10;
    *(_QWORD *)(v14 + 40) = v9;
    v3 = v15;
    v1 = v16;
  }
  while (v4 + v2);
  return v5;
}

uint64_t sub_1C87C7EBC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1C87C8BD4();
  __break(1u);
  return result;
}

uint64_t sub_1C87C7FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t i;
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v4 = 0;
  for (i = a1 + 40; ; i += 16)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0C97398]);
    swift_bridgeObjectRetain();
    v7 = sub_1C87C8A6C();
    v8 = objc_msgSend(v6, sel_initWithStringValue_, v7);

    LOBYTE(v7) = objc_msgSend(v8, sel_isLikePhoneNumber_, a2);
    swift_bridgeObjectRelease();

    if ((v7 & 1) != 0)
      break;
    if (v2 == ++v4)
      return 0;
  }
  return v4;
}

uint64_t sub_1C87C8098(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *i;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v4 = 0;
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v7 = *(i - 1);
      v6 = *i;
      swift_bridgeObjectRetain();
      v8 = objc_msgSend(a2, sel_username);
      if (v8)
      {
        v9 = v8;
        v10 = sub_1C87C8A78();
        v12 = v11;

        if (v10 == v7 && v12 == v6)
        {
          swift_bridgeObjectRelease_n();
          return v4;
        }
        v14 = sub_1C87C8BE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v14 & 1) != 0)
          return v4;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if (v2 == ++v4)
        return 0;
    }
  }
  return 0;
}

unint64_t sub_1C87C81B0()
{
  unint64_t result;

  result = qword_1EF8F81C8;
  if (!qword_1EF8F81C8)
  {
    result = MEMORY[0x1CAA34078](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF8F81C8);
  }
  return result;
}

uint64_t sub_1C87C81F4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t type metadata accessor for NameDropIdentity()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for MeContactProvider()
{
  return &type metadata for MeContactProvider;
}

uint64_t *initializeBufferWithCopyOfBuffer for vCardContactProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_1C87C82A4(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_1C87C82A4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t destroy for vCardContactProvider(uint64_t a1)
{
  return sub_1C87C81F4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *assignWithCopy for vCardContactProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_1C87C82A4(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1C87C81F4(v5, v6);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for vCardContactProvider(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1C87C81F4(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for vCardContactProvider(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for vCardContactProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for vCardContactProvider()
{
  return &type metadata for vCardContactProvider;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1C87C844C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C87C848C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void DDUIEndpointPairingBrowsingTransportForOptions_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C87B2000, a2, a3, "DDUIEndpointPairingBrowsingTransportForOptions -- invalid options given, returning nil! {options: %lu}", a5, a6, a7, a8, 0);
}

void DDUIEndpointPairingListeningTransportForOptions_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C87B2000, a2, a3, "DDUIEndpointPairingListeningTransportForOptions -- invalid options given, returning nil! {options: %lu}", a5, a6, a7, a8, 0);
}

void DDUIDeviceTypeForModelString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1C87B2000, a2, OS_LOG_TYPE_FAULT, "Unable to determine a device type for model %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1C87C8A0C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C87C8A18()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1C87C8A24()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C87C8A30()
{
  return MEMORY[0x1E0D13C30]();
}

uint64_t sub_1C87C8A3C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C87C8A48()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1C87C8A54()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C87C8A60()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1C87C8A6C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C87C8A78()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C87C8A84()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C87C8A90()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C87C8A9C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C87C8AA8()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1C87C8AB4()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1C87C8AC0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1C87C8ACC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C87C8AD8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C87C8AE4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1C87C8AF0()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1C87C8AFC()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1C87C8B08()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1C87C8B14()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1C87C8B20()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1C87C8B2C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C87C8B38()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C87C8B44()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1C87C8B50()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C87C8B5C()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C87C8B68()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1C87C8B74()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C87C8B80()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1C87C8B8C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1C87C8B98()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C87C8BA4()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C87C8BB0()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C87C8BBC()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C87C8BC8()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C87C8BD4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C87C8BE0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C87C8BEC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1C87C8BF8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C87C8C04()
{
  return MEMORY[0x1E0DEDF40]();
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1E0D1A970]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

uint64_t CNIsChineseJapaneseKoreanString()
{
  return MEMORY[0x1E0D13808]();
}

uint64_t CNSNaPWallpaperEnabled()
{
  return MEMORY[0x1E0C970E0]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x1E0D1AE00]();
}

uint64_t SFDeviceClassCodeGet()
{
  return MEMORY[0x1E0D97500]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

