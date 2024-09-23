void sub_218A949A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_218A94ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXRDeviceRemoteActionsForCurrentDevice()
{
  void *v0;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x24BDAC8D0];
  if (AXDeviceIsAudioAccessory())
  {
    AXRDeviceRemoteActionsForMediaForCurrentDevice();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2[0] = CFSTR("Home");
    v2[1] = CFSTR("AppSwitcher");
    v2[2] = CFSTR("NotificationCenter");
    v2[3] = CFSTR("ControlCenter");
    v2[4] = CFSTR("Siri");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 5);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

id AXRDeviceRemoteActionsForMediaForCurrentDevice()
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("MediaPlayPause");
  v1[1] = CFSTR("MediaPreviousTrack");
  v1[2] = CFSTR("MediaNextTrack");
  v1[3] = CFSTR("MediaVolumeUp");
  v1[4] = CFSTR("MediaVolumeDown");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id AXRDeviceRemoteActionsForSwitchControlForCurrentDevice()
{
  _QWORD v1[8];

  v1[7] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("SwitchControlCommandMovePrevious");
  v1[1] = CFSTR("SwitchControlCommandMoveNext");
  v1[2] = CFSTR("SwitchControlCommandSelect");
  v1[3] = CFSTR("SwitchControlCommandMenu");
  v1[4] = CFSTR("SwitchControlCommandStartScanning");
  v1[5] = CFSTR("SwitchControlCommandStopScanning");
  v1[6] = CFSTR("SwitchControlCommandActivate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

id AXRDeviceRemoteActionsForVoiceOverForCurrentDevice()
{
  _QWORD v1[12];

  v1[11] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("VoiceOverCommandPreviousElement");
  v1[1] = CFSTR("VoiceOverCommandNextElement");
  v1[2] = CFSTR("VoiceOverCommandSimpleTap");
  v1[3] = CFSTR("VoiceOverCommandPreviousRotorOption");
  v1[4] = CFSTR("VoiceOverCommandNextRotorOption");
  v1[5] = CFSTR("VoiceOverCommandPreviousRotorItem");
  v1[6] = CFSTR("VoiceOverCommandNextRotorItem");
  v1[7] = CFSTR("VoiceOverCommandScrollUpPage");
  v1[8] = CFSTR("VoiceOverCommandScrollDownPage");
  v1[9] = CFSTR("VoiceOverCommandScrollLeftPage");
  v1[10] = CFSTR("VoiceOverCommandScrollRightPage");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

id AXRDevicePreferredRemoteActionsForCurrentDevice()
{
  void *v0;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x24BDAC8D0];
  if (AXDeviceIsAudioAccessory())
  {
    v2[0] = CFSTR("MediaPreviousTrack");
    v2[1] = CFSTR("MediaNextTrack");
    v2[2] = CFSTR("MediaPlayPause");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 3);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (_AXSAssistiveTouchScannerEnabled())
  {
    AXRDeviceRemoteActionsForSwitchControlForCurrentDevice();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (_AXSVoiceOverTouchEnabled() && (AXDeviceIsTV() & 1) == 0)
  {
    AXRDeviceRemoteActionsForVoiceOverForCurrentDevice();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXRDeviceRemoteActionsForCurrentDevice();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

id AXRDeviceRemoteActionsPayloadForCurrentDevice()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCEB8];
  v26[0] = CFSTR("title");
  AXRLocalizedStringForKey(CFSTR("REMOTE_ACTION_SECTION_SYSTEM"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v1;
  v27[1] = &unk_24D99CCA0;
  v26[1] = CFSTR("preferredContextType");
  v26[2] = CFSTR("actionsList");
  AXRDeviceRemoteActionsForCurrentDevice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    v24[0] = CFSTR("title");
    AXRLocalizedStringForKey(CFSTR("REMOTE_ACTION_SECTION_MEDIA_CONTROL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v6;
    v25[1] = &unk_24D99CCB8;
    v24[1] = CFSTR("preferredContextType");
    v24[2] = CFSTR("actionsList");
    AXRDeviceRemoteActionsForMediaForCurrentDevice();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    if (_AXSAssistiveTouchScannerEnabled())
    {
      v22[0] = CFSTR("title");
      AXRLocalizedStringForKey(CFSTR("REMOTE_ACTION_SECTION_SWITCH_CONTROL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v9;
      v23[1] = &unk_24D99CCD0;
      v22[1] = CFSTR("preferredContextType");
      v22[2] = CFSTR("actionsList");
      AXRDeviceRemoteActionsForSwitchControlForCurrentDevice();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

    }
    if (_AXSVoiceOverTouchEnabled())
    {
      v16 = CFSTR("title");
      AXRLocalizedStringForKey(CFSTR("REMOTE_ACTION_SECTION_VOICEOVER"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v12;
      v20 = &unk_24D99CCE8;
      v17 = CFSTR("preferredContextType");
      v18 = CFSTR("actionsList");
      AXRDeviceRemoteActionsForVoiceOverForCurrentDevice();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v16, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v14, v16, v17, v18, v19, v20);

    }
  }
  return v5;
}

id AXRLocalizedStringForRemoteAction(void *a1)
{
  id v1;
  uint64_t Type;
  void *v3;

  v1 = a1;
  Type = AXDeviceGetType();
  AXRLocalizedStringForRemoteActionWithDeviceType(v1, Type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXRLocalizedStringForRemoteActionWithDeviceType(void *a1, uint64_t a2)
{
  id v3;
  __CFString *v4;
  id v5;
  void *v6;

  v3 = a1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_NONE");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Home")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_HOME");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppSwitcher")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_APP_SWITCHER");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotificationCenter")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_NOTIFICATION_CENTER");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ControlCenter")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_CONTROL_CENTER");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Siri")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_SIRI");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TVMenu")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_TV_MENU");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TVSelect")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_TV_SELECT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchControlCommandActivate")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_SWITCH_CONTROL_ACTIVATE");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchControlCommandMenu")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_SWITCH_CONTROL_MENU");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchControlCommandStartScanning")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_SWITCH_CONTROL_START_SCANNING");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchControlCommandSelect")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_SWITCH_CONTROL_SELECT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchControlCommandMoveNext")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_SWITCH_CONTROL_MOVE_NEXT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchControlCommandMovePrevious")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_SWITCH_CONTROL_MOVE_PREVIOUS");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchControlCommandStopScanning")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_SWITCH_CONTROL_STOP_SCANNING");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandSimpleTap")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_SIMPLE_TAP");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandNextElement")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_NEXT_ELEMENT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandPreviousElement")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_PREVIOUS_ELEMENT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandNextRotorOption")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_NEXT_ROTOR_OPTION");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandPreviousRotorOption")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_PREVIOUS_ROTOR_OPTION");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandNextRotorItem")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_NEXT_ROTOR_ITEM");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandPreviousRotorItem")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_PREVIOUS_ROTOR_ITEM");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandScrollUpPage")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_SCROLL_PAGE_UP");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandScrollDownPage")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_SCROLL_PAGE_DOWN");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandScrollLeftPage")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_SCROLL_PAGE_LEFT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceOverCommandScrollRightPage")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_VOICEOVER_SCROLL_PAGE_RIGHT");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaPlayPause")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_MEDIA_PLAY_PAUSE");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaNextTrack")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_MEDIA_NEXT_TRACK");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaPreviousTrack")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_MEDIA_PREVIOUS_TRACK");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaVolumeUp")) & 1) != 0)
  {
    v4 = CFSTR("REMOTE_ACTION_MEDIA_VOLUME_UP");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("MediaVolumeDown")))
    {
      v5 = v3;
      goto LABEL_64;
    }
    v4 = CFSTR("REMOTE_ACTION_MEDIA_VOLUME_DOWN");
  }
  AXRLocalizedStringForKeyWithDeviceType(v4, a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_64:
  v6 = v5;

  return v6;
}

id AXRLocalizedSectionTitleForPreferredContextType(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  AXRLocalizedStringForKey(off_24D99AE50[a1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_218A96CE0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_218A970D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_218A97738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218A979B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ax_remote_general_log()
{
  if (ax_remote_general_log_onceToken != -1)
    dispatch_once(&ax_remote_general_log_onceToken, &__block_literal_global_1);
  return (id)ax_remote_general_log___logger;
}

void __ax_remote_general_log_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("remote_%s"), "general");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v0 = os_log_create("com.apple.Accessibility", (const char *)objc_msgSend(v2, "UTF8String"));
  v1 = (void *)ax_remote_general_log___logger;
  ax_remote_general_log___logger = (uint64_t)v0;

}

id ax_remote_connection_log()
{
  if (ax_remote_connection_log_onceToken != -1)
    dispatch_once(&ax_remote_connection_log_onceToken, &__block_literal_global_4);
  return (id)ax_remote_connection_log___logger;
}

void __ax_remote_connection_log_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("remote_%s"), "connection");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v0 = os_log_create("com.apple.Accessibility", (const char *)objc_msgSend(v2, "UTF8String"));
  v1 = (void *)ax_remote_connection_log___logger;
  ax_remote_connection_log___logger = (uint64_t)v0;

}

id ax_remote_daemon_log()
{
  if (ax_remote_daemon_log_onceToken != -1)
    dispatch_once(&ax_remote_daemon_log_onceToken, &__block_literal_global_6);
  return (id)ax_remote_daemon_log___logger;
}

void __ax_remote_daemon_log_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("remote_%s"), "daemon");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v0 = os_log_create("com.apple.Accessibility", (const char *)objc_msgSend(v2, "UTF8String"));
  v1 = (void *)ax_remote_daemon_log___logger;
  ax_remote_daemon_log___logger = (uint64_t)v0;

}

id ax_remote_event_log()
{
  if (ax_remote_event_log_onceToken != -1)
    dispatch_once(&ax_remote_event_log_onceToken, &__block_literal_global_8);
  return (id)ax_remote_event_log___logger;
}

void __ax_remote_event_log_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("remote_%s"), "event");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v0 = os_log_create("com.apple.Accessibility", (const char *)objc_msgSend(v2, "UTF8String"));
  v1 = (void *)ax_remote_event_log___logger;
  ax_remote_event_log___logger = (uint64_t)v0;

}

id _AXRBundle()
{
  if (_AXRBundle_onceToken != -1)
    dispatch_once(&_AXRBundle_onceToken, &__block_literal_global_2);
  return (id)_AXRBundle__AXRBundle;
}

id AXRLocalizedStringForKey(void *a1)
{
  id v1;
  uint64_t Type;
  void *v3;

  v1 = a1;
  Type = AXDeviceGetType();
  AXRLocalizedStringForKeyWithDeviceType(v1, Type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXRLocalizedStringForKeyWithDeviceType(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = v3;
  if ((unint64_t)(a2 - 1) > 5)
    goto LABEL_4;
  objc_msgSend(v3, "stringByAppendingString:", off_24D99B198[a2 - 1]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AXRBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24D99C1A0, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", v5))
  {

LABEL_4:
    _AXRBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_24D99C1A0, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void sub_218A984A0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 128));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t AXDeviceGetType()
{
  return MEMORY[0x24BDFDFC0]();
}

uint64_t AXDeviceIsAudioAccessory()
{
  return MEMORY[0x24BDFDFE0]();
}

uint64_t AXDeviceIsTV()
{
  return MEMORY[0x24BDFE028]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x24BDFE3F8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x24BED2070]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

