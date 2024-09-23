void sub_100003DF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000046C0(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7)
    {
      v9 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100005AD8((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_18;
    }
    objc_msgSend(v6, "setDelegate:", WeakRetained);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_appletAID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appletWithIdentifier:", v17));

    if (v18)
    {
      if (objc_msgSend(v6, "setActiveApplet:", v18))
      {
        if (objc_msgSend(v6, "startCardEmulation"))
        {
          objc_storeStrong((id *)WeakRetained + 6, a2);
          v19 = 1;
LABEL_17:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v19;

LABEL_18:
          dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 1));
          goto LABEL_19;
        }
        v30 = DiagnosticLogHandleForCategory(3);
        v21 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_100005A80();
      }
      else
      {
        v29 = DiagnosticLogHandleForCategory(3);
        v21 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_100005AAC();
      }
    }
    else
    {
      v20 = DiagnosticLogHandleForCategory(3);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_100005A10(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    v19 = 0;
    goto LABEL_17;
  }
LABEL_19:

}

void sub_10000492C(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[objc_class sharedHardwareManager](+[DASoftLinking nearFieldClass:](DASoftLinking, "nearFieldClass:", CFSTR("NFHardwareManager")), "sharedHardwareManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contactlessSession"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contactlessSession"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100004AC0;
      v20[3] = &unk_100008238;
      v20[4] = WeakRetained;
      objc_msgSend(v5, "endSessionWithCompletion:", v20);

    }
    v7 = *(double *)(a1 + 48);
    v6 = a1 + 48;
    v8 = *(NSObject **)(*(_QWORD *)(v6 - 16) + 16);
    v9 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    if (dispatch_semaphore_wait(v8, v9))
    {
      v10 = DiagnosticLogHandleForCategory(3);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100005B68(v6, v11, v12, v13, v14, v15, v16, v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contactlessSession"));
    objc_msgSend(v18, "setDelegate:", 0);

    objc_msgSend(WeakRetained, "setContactlessSession:", 0);
    objc_msgSend(WeakRetained, "setSessionController:", 0);
    -[NSObject invalidateConnection](v3, "invalidateConnection");
  }
  else
  {
    v19 = DiagnosticLogHandleForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100005B3C();
  }

}

intptr_t sub_100004AC0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void sub_100005498(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005504(id a1)
{
  byte_10000CCA8 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit"), "UTF8String"), 1) != 0;
}

void sub_1000055C8(id a1)
{
  byte_10000CCB8 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearField.framework/NearField"), "UTF8String"), 1) != 0;
}

void sub_10000568C(id a1)
{
  byte_10000CCC8 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory"), "UTF8String"), 1) != 0;
}

void sub_100005750(id a1)
{
  byte_10000CCD8 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit"), "UTF8String"), 1) != 0;
}

BOOL isValidSerialNumber(void *a1)
{
  id v1;
  uint64_t v2;
  _BOOL8 v3;

  v1 = a1;
  v2 = objc_opt_class(NSString);
  v3 = (objc_opt_isKindOfClass(v1, v2) & 1) != 0 && (unint64_t)objc_msgSend(v1, "length") > 3;

  return v3;
}

void sub_100005830(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003DF8((void *)&_mh_execute_header, a2, a3, "NSError variable was nil.  New unsaved error: %@", a5, a6, a7, a8, 2u);
}

void sub_100005898(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003DF8((void *)&_mh_execute_header, a2, a3, "NSError variable was previously assigned.  New unsaved error: %@", a5, a6, a7, a8, 2u);
}

void sub_100005900(os_log_t log)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Hardware state error: %u. not supported, dont retry", (uint8_t *)v1, 8u);
  sub_1000054A8();
}

void sub_100005978()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000054B8();
  sub_100005498((void *)&_mh_execute_header, v0, v1, "Timeout occurred trying to start Echo Applet!", v2, v3, v4, v5, v6);
  sub_1000054A8();
}

void sub_1000059A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003DF8((void *)&_mh_execute_header, a1, a3, "Timeout waiting for NFC Hardware init, expect to be ready within %f seconds", a5, a6, a7, a8, 0);
  sub_1000054B0();
}

void sub_100005A10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003DF8((void *)&_mh_execute_header, a1, a3, "Could not find applet: %@!", a5, a6, a7, a8, 2u);
  sub_1000054B0();
}

void sub_100005A80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000054B8();
  sub_100005498((void *)&_mh_execute_header, v0, v1, "Could not start card emulation!", v2, v3, v4, v5, v6);
  sub_1000054A8();
}

void sub_100005AAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000054B8();
  sub_100005498((void *)&_mh_execute_header, v0, v1, "Could not set applet!", v2, v3, v4, v5, v6);
  sub_1000054A8();
}

void sub_100005AD8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003DF8((void *)&_mh_execute_header, a2, a3, "Error occurred trying to start Contactless Session! %@", a5, a6, a7, a8, 2u);
  sub_1000054B0();
}

void sub_100005B3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000054B8();
  sub_100005498((void *)&_mh_execute_header, v0, v1, "Unable to stop card emulation - failed to preserve self into dispatch_sync", v2, v3, v4, v5, v6);
  sub_1000054A8();
}

void sub_100005B68(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003DF8((void *)&_mh_execute_header, a2, a3, "Timeout (%lfs) occurred trying to stop card emulation!", a5, a6, a7, a8, 0);
  sub_1000054B0();
}

void sub_100005BD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000054B8();
  sub_100005498((void *)&_mh_execute_header, v0, v1, "Unable to capture user NFC Enabled state. Not overriding enablement", v2, v3, v4, v5, v6);
  sub_1000054A8();
}

void sub_100005BFC(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;

  v5 = 134218242;
  v6 = objc_msgSend(a1, "userNfcEnabledState");
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to restore NFC radio state to %ld! Error: %@", (uint8_t *)&v5, 0x16u);
}

void sub_100005C94(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003DF8((void *)&_mh_execute_header, a2, a3, "Failed to retrieve NFC radio state with error: %@", a5, a6, a7, a8, 2u);
  sub_1000054B0();
}

void sub_100005CF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000054B8();
  sub_100005498((void *)&_mh_execute_header, v0, v1, "Could not get reference to secure element when attempting to determine appropriate applet ID", v2, v3, v4, v5, v6);
  sub_1000054A8();
}

void sub_100005D24(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003DF8((void *)&_mh_execute_header, a2, a3, "Could not get applet for SE deviceType 0x%lx", a5, a6, a7, a8, 0);
  sub_1000054B0();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__appletAID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appletAID");
}

id objc_msgSend_appletWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appletWithIdentifier:");
}

id objc_msgSend_checkPresence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkPresence");
}

id objc_msgSend_contactlessSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactlessSession");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_embeddedSecureElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedSecureElement");
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSession");
}

id objc_msgSend_endSessionWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSessionWithCompletion:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_getHwSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHwSupport");
}

id objc_msgSend_getRadioEnabledState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRadioEnabledState:");
}

id objc_msgSend_hwType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hwType");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_invalidateConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateConnection");
}

id objc_msgSend_isBiometricKitFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBiometricKitFrameworkAvailable");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isCoreRepairFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCoreRepairFrameworkAvailable");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInIORegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInIORegistry");
}

id objc_msgSend_isNearFieldAccessoryFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearFieldAccessoryFrameworkAvailable");
}

id objc_msgSend_isNearFieldFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearFieldFrameworkAvailable");
}

id objc_msgSend_isNfcDisabledByProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNfcDisabledByProfile");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_nearField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearField");
}

id objc_msgSend_nearFieldClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearFieldClass:");
}

id objc_msgSend_osdStockholmDidDetectField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osdStockholmDidDetectField");
}

id objc_msgSend_osdStockholmDidEndUnexpectedly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osdStockholmDidEndUnexpectedly");
}

id objc_msgSend_osdStockholmDidSelectEchoApplet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osdStockholmDidSelectEchoApplet");
}

id objc_msgSend_overrideNfcEnabledState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideNfcEnabledState");
}

id objc_msgSend_pingNearField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pingNearField:");
}

id objc_msgSend_pingiPadNearField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pingiPadNearField:");
}

id objc_msgSend_registrationInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registrationInfo");
}

id objc_msgSend_restoreNfcEnabledState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreNfcEnabledState");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_setActiveApplet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveApplet:");
}

id objc_msgSend_setContactlessSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactlessSession:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setError_withCode_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:withCode:format:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRadioEnabledSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRadioEnabledSetting:");
}

id objc_msgSend_setSessionController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionController:");
}

id objc_msgSend_setShouldOverrideUserNFC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldOverrideUserNFC:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setUserNfcEnabledState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserNfcEnabledState:");
}

id objc_msgSend_setUserNfcEnabledStateCaptured_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserNfcEnabledStateCaptured:");
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHardwareManager");
}

id objc_msgSend_sharedRemoteAdminManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedRemoteAdminManager");
}

id objc_msgSend_shouldOverrideUserNFC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldOverrideUserNFC");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_startCardEmulation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCardEmulation");
}

id objc_msgSend_startCardEmulationWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCardEmulationWithTimeout:");
}

id objc_msgSend_startContactlessSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startContactlessSession:");
}

id objc_msgSend_stopCardEmulation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCardEmulation:");
}

id objc_msgSend_updateUserNfcEnabledState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUserNfcEnabledState");
}

id objc_msgSend_userNfcEnabledState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNfcEnabledState");
}

id objc_msgSend_userNfcEnabledStateCaptured(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNfcEnabledStateCaptured");
}
