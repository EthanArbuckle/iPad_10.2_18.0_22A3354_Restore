@implementation CSVoiceTriggerEnabledPolicyHelper

+ (BOOL)siriInCallPolicy
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  NSObject *v14;
  unint64_t v15;
  os_log_t v16;
  _BOOL4 v17;
  BOOL result;
  const char *v19;
  BOOL v20;
  char v21;
  _BOOL4 v22;
  os_log_t v23;
  _BOOL4 v24;
  NSObject *v25;
  uint32_t v26;
  char v27;
  _BOOL4 v28;
  int v29;
  const char *v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  +[CSHangUpEnabledMonitor sharedInstance](CSHangUpEnabledMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEnabled") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    +[CSSiriInCallEnabledMonitor sharedInstance](CSSiriInCallEnabledMonitor, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEnabled");

  }
  v5 = objc_msgSend(MEMORY[0x1E0D19260], "supportHangUp");
  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "phoneCallState");

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "firstPartyCall");

  +[CSBluetoothWirelessSplitterMonitor sharedInstance](CSBluetoothWirelessSplitterMonitor, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "splitterState");

  v12 = objc_msgSend(MEMORY[0x1E0D19260], "fetchHypotheticalRouteType");
  v13 = (os_log_t *)MEMORY[0x1E0D18F60];
  v14 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v29 = 136315394;
    v30 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
    v31 = 1024;
    v32 = v3;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Hang up toggle: %d", (uint8_t *)&v29, 0x12u);
  }
  v15 = v7 - 5;
  if ((v5 & v3 & 1) == 0 && v15 >= 0xFFFFFFFFFFFFFFFELL)
  {
    v16 = *v13;
    v17 = os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v17)
      return result;
    v29 = 136315138;
    v30 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
    v19 = "%s VoiceTrigger cannot be turned on since we are not in the desired call state";
    goto LABEL_28;
  }
  if (!v5)
    goto LABEL_18;
  v20 = __CFADD__(v15, 2);
  if (v15 < 0xFFFFFFFFFFFFFFFELL)
    v21 = 1;
  else
    v21 = v9;
  if ((v21 & 1) == 0)
  {
    v16 = *v13;
    v22 = os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v22)
      return result;
    v29 = 136315138;
    v30 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
    v19 = "%s VoiceTrigger cannot be turned on since we are in a hang up supported call state but it is not first party.";
    goto LABEL_28;
  }
  if (v20)
  {
    v27 = objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn");
    result = 1;
    if (v12 != 2 && (v27 & 1) == 0)
    {
      v16 = *v13;
      v28 = os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v28)
      {
        v29 = 136315138;
        v30 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
        v19 = "%s VoiceTrigger cannot be turned on since the device is not supporting bargeIn and there is no HS phone ca"
              "ll capable headset connected.";
LABEL_28:
        v25 = v16;
        v26 = 12;
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_18:
    if (v7 != 2 || (unint64_t)(v11 - 2) >= 3 && (unint64_t)(v12 - 3) > 0xFFFFFFFFFFFFFFFDLL)
      return 1;
    v23 = *v13;
    v24 = os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v24)
    {
      v29 = 136315906;
      v30 = "+[CSVoiceTriggerEnabledPolicyHelper siriInCallPolicy]";
      v31 = 1024;
      v32 = v12 == 2;
      v33 = 1024;
      v34 = v12 == 1;
      v35 = 1024;
      v36 = (unint64_t)(v11 - 2) < 3;
      v19 = "%s VoiceTrigger cannot be turned on because we are in a ringtone and hsPhoneCallCapableHeadsetConnected: %d "
            "builtInState: %d isInSplitterMode: %d";
      v25 = v23;
      v26 = 30;
LABEL_29:
      _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v29, v26);
      return 0;
    }
  }
  return result;
}

@end
