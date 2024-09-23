void DNDRegisterLogging()
{
  if (DNDRegisterLogging_onceToken != -1)
    dispatch_once(&DNDRegisterLogging_onceToken, &__block_literal_global_1);
}

const __CFString *DNDStringFromModeAssertionLifetimeType(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("<invalid>");
  else
    return off_1E39B5AD8[a1];
}

const __CFString *DNDStringFromInterruptionSuppressionState(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<unknown>");
  else
    return off_1E39B5DE8[a1];
}

void sub_19ABEE8D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19ABEECE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DNDRemoteMonitorServerInterface()
{
  if (DNDRemoteMonitorServerInterface_monitorOnceToken != -1)
    dispatch_once(&DNDRemoteMonitorServerInterface_monitorOnceToken, &__block_literal_global_39);
  return (id)DNDRemoteMonitorServerInterface___monitorInterface;
}

void sub_19ABEF2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19ABEF448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

__CFString *DNDModeLocalizedNameKeyForSemanticType(unint64_t a1)
{
  if (a1 > 9)
    return 0;
  else
    return off_1E39B58A8[a1];
}

void sub_19ABF0284(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id DNDRemoteServiceServerInterface()
{
  if (DNDRemoteServiceServerInterface_serviceOnceToken != -1)
    dispatch_once(&DNDRemoteServiceServerInterface_serviceOnceToken, &__block_literal_global_133);
  return (id)DNDRemoteServiceServerInterface___serviceInterface;
}

id DNDRemoteAppConfigurationServiceServerInterface()
{
  if (DNDRemoteAppConfigurationServiceServerInterface_serviceOnceToken != -1)
    dispatch_once(&DNDRemoteAppConfigurationServiceServerInterface_serviceOnceToken, &__block_literal_global_17);
  return (id)DNDRemoteAppConfigurationServiceServerInterface___serviceInterface;
}

void sub_19ABF0ABC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
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

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_19ABF1540(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  _Unwind_Resume(exception_object);
}

void sub_19ABF197C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

const __CFString *DNDStringFromModeAssertionScheduleLifetimeBehavior(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<invalid>");
  if (a1 == 1)
    v1 = CFSTR("schedule end");
  if (a1)
    return v1;
  else
    return CFSTR("match schedule");
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19ABF22CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

__CFString *DNDStringFromSupportedAccountFeatures(char a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "addObject:", CFSTR("SilenceLists"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("{ %@ }"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("<none>");
  }

  return v6;
}

const __CFString *DNDStringFromBreakthroughUrgency(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("essential");
  if (a1 == 1)
    v1 = CFSTR("time-sensitive");
  if (a1 == 2)
    return CFSTR("all");
  else
    return v1;
}

const __CFString *DNDStringFromDeviceClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("<unknown>");
  else
    return off_1E39B5630[a1 - 1];
}

uint64_t DNDDeviceClassFromMGDeviceClass(int a1)
{
  if ((a1 - 1) > 0xA)
    return 0;
  else
    return qword_19AC328D8[a1 - 1];
}

const __CFString *DNDModeAssertionInvalidationReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return CFSTR("<unknown>");
  else
    return off_1E39B5660[a1 - 1];
}

const __CFString *DNDStringFromContactType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<unknown>");
  if (a1 == 1)
    v1 = CFSTR("Favorite");
  if (a1)
    return v1;
  else
    return CFSTR("Contact");
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19ABF4B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19ABF5738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

const __CFString *DNDModeSemanticTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 0xA)
    return CFSTR("Unknown");
  else
    return off_1E39B57C0[a1 + 1];
}

const __CFString *DNDSystemImageNameForModeSemanticType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return CFSTR("moon.fill");
  else
    return off_1E39B5818[a1 - 1];
}

const __CFString *DNDSystemColorNameForModeSemanticType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return CFSTR("systemIndigoColor");
  else
    return off_1E39B5860[a1 - 1];
}

id DNDSystemColorNamesForModeSemanticType(uint64_t a1)
{
  const __CFString *v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("systemIndigoColor");
  v2 = a1 - 1;
  v3 = &unk_1E39C9898;
  switch(v2)
  {
    case 0:
    case 7:
      v1 = CFSTR("systemMintColor");
      goto LABEL_8;
    case 2:
      v1 = CFSTR("systemGreenColor");
      goto LABEL_8;
    case 3:
      v1 = CFSTR("systemTealColor");
      goto LABEL_8;
    case 4:
      v1 = CFSTR("systemPurpleColor");
      goto LABEL_8;
    case 5:
      v1 = CFSTR("systemOrangeColor");
      goto LABEL_8;
    case 6:
      v1 = CFSTR("systemBlueColor");
      goto LABEL_8;
    case 8:
      return v3;
    default:
LABEL_8:
      v5[0] = v1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

id DNDModeLocalizedNameForSemanticType(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 > 9)
    v1 = 0;
  else
    v1 = off_1E39B58A8[a1];
  objc_msgSend(MEMORY[0x1E0CB34D0], "dnd_doNotDisturbLocalizationBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E39B74A8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL DNDSupportedSemanticType(uint64_t a1)
{
  return (unint64_t)(a1 + 1) < 0xB;
}

const __CFString *DNDStringFromConfigurationType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Inclusive");
  if (!a1)
    v1 = CFSTR("Exclusive");
  if (a1 == 2)
    return CFSTR("Unconfigured");
  else
    return v1;
}

unint64_t DNDResolvedHideApplicationBadgesSetting(unint64_t result)
{
  if (result <= 1)
    return 1;
  return result;
}

unint64_t DNDResolvedIntelligentManagementSetting(unint64_t result)
{
  if (result <= 1)
    return 1;
  return result;
}

unint64_t DNDResolvedInterruptionSuppressionMode(unint64_t result)
{
  if (result <= 1)
    return 1;
  return result;
}

void sub_19ABF84B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *DNDMeDeviceStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E39B5948[a1 - 1];
}

const __CFString *DNDEnabledSettingToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<invalid>");
  else
    return off_1E39B5960[a1];
}

const __CFString *DNDInterruptionSuppressionToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<invalid>");
  else
    return off_1E39B5978[a1];
}

const __CFString *DNDStringFromInterruptionSuppression(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<invalid>");
  else
    return off_1E39B5978[a1];
}

unint64_t DNDMostRestrictiveInterruptionSuppression(unint64_t result, unint64_t a2)
{
  if (result <= a2)
    return a2;
  return result;
}

__CFString *DNDStringFromInterruptionSuppressionMode(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 3)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("<invalid: %@>"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E39B5990[a1];
  }
  return v1;
}

const __CFString *DNDModeAssertionInvalidationReasonOverrideToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<unknown>");
  else
    return off_1E39B59A8[a1];
}

uint64_t DNDResolvedModeAssertionInvalidationReason(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = a2 == 1;
  if (a2 == 2)
    v2 = 2;
  if (a2)
    return v2;
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

__CFString *DNDCompatibilityVersionToString(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  switch(a1)
  {
    case 10:
      v1 = CFSTR("Sydney");
      break;
    case 11:
      v1 = CFSTR("SydneyE");
      break;
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
      goto LABEL_6;
    case 15:
      v1 = CFSTR("Dawn");
      break;
    case 20:
      v1 = CFSTR("Crystal");
      break;
    case 21:
      v1 = CFSTR("max");
      break;
    default:
      if (a1 == 2)
      {
        v1 = CFSTR("Sky");
      }
      else if (a1 == 3)
      {
        v1 = CFSTR("SkyF");
      }
      else
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "stringValue");
        v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      break;
  }
  return v1;
}

__CFString *DNDCompatibilityVersionStringify(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  switch(a1)
  {
    case 10:
      v1 = CFSTR("DNDCompatibilityVersionSydney");
      break;
    case 11:
      v1 = CFSTR("DNDCompatibilityVersionSydneyE");
      break;
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
      goto LABEL_6;
    case 15:
      v1 = CFSTR("DNDCompatibilityVersionDawn");
      break;
    case 20:
      v1 = CFSTR("DNDCompatibilityVersionCrystal");
      break;
    case 21:
      v1 = CFSTR("DNDCompatibilityVersionMax");
      break;
    default:
      if (a1 == 2)
      {
        v1 = CFSTR("DNDCompatibilityVersionSky");
      }
      else if (a1 == 3)
      {
        v1 = CFSTR("DNDCompatibilityVersionSkyF");
      }
      else
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "stringValue");
        v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      break;
  }
  return v1;
}

__CFString *DNDStringFromDeviceCapabilities(char a1)
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "addObject:", CFSTR("telephony"));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("<none>");
  }

  return v4;
}

uint64_t DNDWeekdaysFromDay(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 9)
    return 0;
  else
    return qword_19AC329C0[a1 + 2];
}

uint64_t DNDDayForWeekdays(uint64_t result)
{
  if (result > 15)
  {
    if (result <= 63)
    {
      if (result == 16)
        return 6;
      if (result == 32)
        return 7;
    }
    else
    {
      switch(result)
      {
        case 0x40:
          return 1;
        case 0x7FLL:
          return -1;
        case 0xFFFFFFFFLL:
          return -2;
      }
    }
    return 0;
  }
  else
  {
    switch(result)
    {
      case 0:
      case 4:
        return result;
      case 1:
        result = 2;
        break;
      case 2:
        result = 3;
        break;
      case 8:
        result = 5;
        break;
      default:
        return 0;
    }
  }
  return result;
}

uint64_t DNDNextDay(uint64_t a1)
{
  if (a1 == 7)
    return 1;
  else
    return a1 + 1;
}

uint64_t DNDPreviousDay(uint64_t a1)
{
  if (a1 == 1)
    return 7;
  else
    return a1 - 1;
}

uint64_t DNDEnumerateDaysOfWeekStartingOnDay(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  char v10;

  v10 = 0;
  v5 = 7;
  if ((a3 & 1) != 0)
    v6 = 1;
  else
    v6 = 7;
  if ((a3 & 1) != 0)
    v7 = -1;
  else
    v7 = 1;
  if ((a3 & 1) != 0)
    v8 = 7;
  else
    v8 = 1;
  do
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, a1, &v10);
    if (v10)
      break;
    if (a1 == v6)
      a1 = v8;
    else
      a1 += v7;
    --v5;
  }
  while (v5);
  return result;
}

const __CFString *NSStringForDNDDay(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 9)
    return CFSTR("M");
  else
    return off_1E39B59E8[a1 + 2];
}

id DNDIdentifierStringForWeekdays(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  uint64_t v12;
  char v13;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "firstWeekday");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __DNDIdentifierStringForWeekdays_block_invoke;
  v10 = &unk_1E39B59C8;
  v12 = a1;
  v5 = v2;
  v11 = v5;
  v13 = 0;
  v6 = 7;
  do
  {
    ((void (*)(_QWORD *, uint64_t, char *))v9)(v8, v4, &v13);
    if (v13)
      break;
    if (v4 == 7)
      v4 = 1;
    else
      ++v4;
    --v6;
  }
  while (v6);

  return v5;
}

__CFString *NSStringFromDNDWeekdays(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 127)
  {
    v1 = CFSTR("Every Day");
  }
  else
  {
    DNDIdentifierStringForWeekdays(a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

const __CFString *DNDEventSourceTypeToString(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("<invalid>");
  else
    return off_1E39B5AA8[a1];
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19AC01570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

const __CFString *DNDStringFromInterruptionBehaviorSetting(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<invalid>");
  else
    return off_1E39B5B08[a1];
}

uint64_t DNDResolvedInterruptionBehaviorSettingForDevice(uint64_t result, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  if (!result)
  {
    if ((unint64_t)(objc_msgSend(a2, "deviceClass", v2, v3) - 1) >= 3)
      return 1;
    else
      return 2;
  }
  return result;
}

const __CFString *DNDInterruptionBehaviorToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<invalid>");
  else
    return off_1E39B5B08[a1];
}

uint64_t DNDResolvedInterruptionBehaviorSetting(uint64_t a1)
{
  void *v2;
  void *v3;

  +[DNDDevice currentDevice](DNDDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!a1)
  {
    if ((unint64_t)(objc_msgSend(v2, "deviceClass") - 1) >= 3)
      a1 = 1;
    else
      a1 = 2;
  }

  return a1;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19AC04914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC04D30(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC04E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC05094(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC054A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC057CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a21, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC05AA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC05DA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC06090(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC06360(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC06630(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC06978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC06C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC06FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC072FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 128));
  _Unwind_Resume(a1);
}

void sub_19AC07494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC07568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC07830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC07AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC07DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC08128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a21, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC08430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC08728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC08A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 128));
  _Unwind_Resume(a1);
}

void sub_19AC08BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC08C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC08E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC090C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19AC093B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19AC096B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19AC099D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a21, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC09C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC0A3C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_19AC0A588(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19AC0A6D4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19AC0A820(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19AC0A980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC0AB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC0AEFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC0B388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_19AC0B8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

const __CFString *DNDStringFromExceptionType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("None");
  if (a1 == 1)
    v1 = CFSTR("Deny");
  if (a1)
    return v1;
  else
    return CFSTR("Allow");
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19AC0D520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

const __CFString *DNDStateUpdateReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("<unknown>");
  else
    return off_1E39B5D70[a1 - 1];
}

const __CFString *DNDStateUpdateSourceToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("<unknown>");
  else
    return off_1E39B5DA0[a1 - 1];
}

__CFString *DNDStateUpdateOptionsToString(char a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 2) != 0)
    objc_msgSend(v2, "addObject:", CFSTR("ForceStatusUpdate"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("{ %@ }"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("<none>");
  }

  return v6;
}

const __CFString *NSStringFromDNDPlatform(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("iOS");
  else
    return off_1E39B5DB8[a1];
}

uint64_t DNDPlatformForCurrentDevice()
{
  return 1;
}

uint64_t DNDResolvedImmediateBypassEventSourceType(uint64_t a1)
{
  void *v2;

  +[DNDDevice currentDevice](DNDDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a1)
    a1 = 3;

  return a1;
}

uint64_t DNDResolvedImmediateBypassEventSourceTypeForDevice(uint64_t result)
{
  if (!result)
    return 3;
  return result;
}

uint64_t DNDResolvedRepeatEventSourceBehaviorEnabledSetting(uint64_t a1)
{
  void *v2;

  +[DNDDevice currentDevice](DNDDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a1)
    a1 = 2;

  return a1;
}

uint64_t DNDResolvedRepeatEventSourceBehaviorEnabledSettingForDevice(uint64_t result)
{
  if (!result)
    return 2;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19AC11ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

const __CFString *DNDStringFromClientEventType(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("<unknown>");
  else
    return off_1E39B5E68[a1];
}

const __CFString *DNDStringFromClientEventUrgency(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<unknown>");
  else
    return off_1E39B5E90[a1];
}

const __CFString *DNDStringFromResolutionBehavior(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<unknown>");
  if (a1 == 1)
    v1 = CFSTR("Legacy");
  if (a1)
    return v1;
  else
    return CFSTR("Default");
}

id DNDRemoteAvailabilityServiceServerInterface()
{
  if (DNDRemoteAvailabilityServiceServerInterface_serviceOnceToken != -1)
    dispatch_once(&DNDRemoteAvailabilityServiceServerInterface_serviceOnceToken, &__block_literal_global_9);
  return (id)DNDRemoteAvailabilityServiceServerInterface___serviceInterface;
}

uint64_t DNDResolvedImpactsAvailabilitySetting(uint64_t result)
{
  if (!result)
    return 2;
  return result;
}

unint64_t DNDResolvedDimsLockScreenSetting(unint64_t result)
{
  if (result <= 1)
    return 1;
  return result;
}

uint64_t DNDOperatingSystemVersionCompare(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  _BOOL8 v9;

  if (*a1 < *a2)
    return -1;
  if (*a1 > *a2)
    return 1;
  v2 = a1[1];
  v3 = a2[1];
  if (v2 < v3)
    return -1;
  if (v2 > v3)
    return 1;
  v5 = a1[2];
  v6 = a2[2];
  v8 = __OFSUB__(v5, v6);
  v7 = v5 - v6 < 0;
  v9 = v5 > v6;
  if (v7 != v8)
    return -1;
  else
    return v9;
}

void DNDOperatingSystemVersionFromString(void *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *a2 = objc_msgSend(v3, "integerValue");

    }
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      a2[1] = objc_msgSend(v4, "integerValue");

    }
    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      a2[2] = objc_msgSend(v5, "integerValue");

    }
  }
  else
  {
    a2[1] = -1;
    a2[2] = -1;
    *a2 = -1;
  }

}

id DNDStringFromOperatingSystemVersion(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@.%@"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

unint64_t DNDResolvedScheduleEnabledSetting(unint64_t result)
{
  if (result <= 1)
    return 1;
  return result;
}

unint64_t DNDResolvedBedtimeBehaviorEnabledSetting(unint64_t result)
{
  if (result <= 1)
    return 1;
  return result;
}

void sub_19AC1AAB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC1AE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19AC1B220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_19AC1B544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19AC1B868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19AC1BB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19AC1BE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19AC1C0E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC1C28C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC1C3E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC1C8DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC1CAD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *DNDStringFromContactHandleType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 2)
    v1 = CFSTR("phone");
  if (a1 == 1)
    return CFSTR("email");
  else
    return v1;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19AC1DC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v9 - 128));
  _Unwind_Resume(a1);
}

void sub_19AC1DCFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC1DFB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_19AC1E078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC1E310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19AC1E750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC1E7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC1E9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC1F290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *DNDModeAssertionReasonToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("<unknown>");
  else
    return off_1E39B6140[a1 - 1];
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19AC1F810(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_19AC1FB1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC1FDE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_19AC200EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC20754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19AC20A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a21, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC20F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_19AC2128C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v7 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC21430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC216CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_19AC21B00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  _Unwind_Resume(exception_object);
}

void sub_19AC21CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_19AC22628(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_19AC22A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19AC23090(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC2345C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC24EA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC256F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19AC25878(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC26324(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC26490(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC26604(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC26770(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC268E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC27458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19AC2761C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19AC277E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_19AC27950(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19AC27D64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *DNDResolutionReasonToString(unint64_t a1)
{
  if (a1 > 0x1A)
    return CFSTR("<invalid>");
  else
    return off_1E39B67D0[a1];
}

const __CFString *DNDIntelligentInterruptionBehaviorToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("unused");
  else
    return off_1E39B68A8[a1 - 1];
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_19AC2AACC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC2AE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC2B0F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_19AC2B430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_19AC2C290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state, char a20)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t sub_19AC2C660()
{
  uint64_t v0;

  v0 = sub_19AC2E534();
  __swift_allocate_value_buffer(v0, qword_1EE3CCDA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE3CCDA0);
  return sub_19AC2E528();
}

uint64_t sub_19AC2C6CC()
{
  uint64_t v0;

  if (qword_1EE3CCD98 != -1)
    swift_once();
  v0 = sub_19AC2E534();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EE3CCDA0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_19AC2C72C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EE3CCD98 != -1)
    swift_once();
  v2 = sub_19AC2E534();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EE3CCDA0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

uint64_t sub_19AC2E528()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_19AC2E534()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1E0D01210]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1E0D01620]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17838]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D17848]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
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

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1E0C867A0](type);
}

