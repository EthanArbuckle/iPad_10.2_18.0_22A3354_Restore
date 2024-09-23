@implementation CARPrototypePref

+ (NSArray)prototypePrefs
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CARPrototypePref_prototypePrefs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (prototypePrefs_onceToken != -1)
    dispatch_once(&prototypePrefs_onceToken, block);
  return (NSArray *)(id)prototypePrefs__prototypePrefs;
}

void __34__CARPrototypePref_prototypePrefs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "contentSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "showPrototypeApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)prototypePrefs__prototypePrefs;
  prototypePrefs__prototypePrefs = v4;

}

+ (BOOL)showTrustedLockout
{
  if (showTrustedLockout_onceToken != -1)
    dispatch_once(&showTrustedLockout_onceToken, &__block_literal_global_10);
  return objc_msgSend((id)showTrustedLockout__trustedLockoutPref, "state");
}

void __38__CARPrototypePref_showTrustedLockout__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("ShowTrustedLockout"), 0, 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showTrustedLockout__trustedLockoutPref;
  showTrustedLockout__trustedLockoutPref = v0;

}

+ (id)_qaModeLockout
{
  if (_qaModeLockout_onceToken != -1)
    dispatch_once(&_qaModeLockout_onceToken, &__block_literal_global_47);
  return (id)_qaModeLockout__qaModeLockout;
}

void __34__CARPrototypePref__qaModeLockout__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("QAModeLockout"), 0, 0, &__block_literal_global_51);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_qaModeLockout__qaModeLockout;
  _qaModeLockout__qaModeLockout = v0;

}

uint64_t __34__CARPrototypePref__qaModeLockout__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "BOOLValue");
  if ((_DWORD)result)
    return +[CARPrototypePref setConfirmedSafe:](CARPrototypePref, "setConfirmedSafe:", 1);
  return result;
}

+ (BOOL)qaModeLockout
{
  void *v2;
  void *v3;
  char v4;

  +[CARPrototypePref _qaModeLockout](CARPrototypePref, "_qaModeLockout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueOrDefault");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (void)setQaModeLockout:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[CARPrototypePref _qaModeLockout](CARPrototypePref, "_qaModeLockout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setState:", v3);

}

+ (id)_confirmedSafe
{
  if (_confirmedSafe_onceToken != -1)
    dispatch_once(&_confirmedSafe_onceToken, &__block_literal_global_53);
  return (id)_confirmedSafe__confirmedSafe;
}

void __34__CARPrototypePref__confirmedSafe__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypePref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("lockoutConfirmedSafe"), 0, MEMORY[0x1E0C9AAB0], &__block_literal_global_56);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_confirmedSafe__confirmedSafe;
  _confirmedSafe__confirmedSafe = v0;

}

void __34__CARPrototypePref__confirmedSafe__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LODWORD(a2) = objc_msgSend(a2, "BOOLValue");
  if ((_DWORD)a2 != objc_msgSend(v4, "BOOLValue"))
  {
    if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
    {
      v22 = 0uLL;
      v23 = 0uLL;
      *((_QWORD *)&v20 + 1) = 0;
      v21 = 0uLL;
      +[CARPrototypePref prototypePrefs](CARPrototypePref, "prototypePrefs", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v21 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v10, "cachedValue");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              objc_msgSend(v10, "cachedValue");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValue:", v12);

            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v7);
      }
    }
    else
    {
      v26 = 0uLL;
      v27 = 0uLL;
      v24 = 0uLL;
      v25 = 0uLL;
      +[CARPrototypePref prototypePrefs](CARPrototypePref, "prototypePrefs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
            objc_msgSend(v18, "value");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setCachedValue:", v19);

            objc_msgSend(v18, "setState:", 0);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v15);
      }

      +[CARPrototypePref _qaModeLockout](CARPrototypePref, "_qaModeLockout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setState:", 0);
    }

  }
}

+ (BOOL)confirmedSafe
{
  void *v2;
  void *v3;
  char v4;

  +[CARPrototypePref _confirmedSafe](CARPrototypePref, "_confirmedSafe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueOrDefault");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (void)setConfirmedSafe:(BOOL)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypePref _confirmedSafe](CARPrototypeBoolPref, "_confirmedSafe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:", v4);

}

+ (CARPrototypeBoolPref)showInternalApps
{
  if (showInternalApps_onceToken != -1)
    dispatch_once(&showInternalApps_onceToken, &__block_literal_global_58);
  return (CARPrototypeBoolPref *)(id)showInternalApps__showInternalApps;
}

void __36__CARPrototypePref_showInternalApps__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CRLocalizedStringForKey(CFSTR("INTERNAL_APPS"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("showInternalApps"), v2, 0, &__block_literal_global_63);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showInternalApps__showInternalApps;
  showInternalApps__showInternalApps = v0;

}

void __36__CARPrototypePref_showInternalApps__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.CarPlay.internal.refreshApps"), 0, 0, 1u);
}

+ (CARPrototypeBoolPref)showDisclaimerLabel
{
  if (showDisclaimerLabel_onceToken != -1)
    dispatch_once(&showDisclaimerLabel_onceToken, &__block_literal_global_66);
  return (CARPrototypeBoolPref *)(id)showDisclaimerLabel__showDisclaimerLabel;
}

void __39__CARPrototypePref_showDisclaimerLabel__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CRLocalizedStringForKey(CFSTR("DISCLAIMER_LABEL"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("showDisclaimerLabel"), v2, 0, &__block_literal_global_71);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showDisclaimerLabel__showDisclaimerLabel;
  showDisclaimerLabel__showDisclaimerLabel = v0;

}

void __39__CARPrototypePref_showDisclaimerLabel__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.CarPlay.internal.showDisclaimer"), 0, 0, 1u);
}

+ (CARPrototypeBoolPref)showSerialNumber
{
  if (showSerialNumber_onceToken != -1)
    dispatch_once(&showSerialNumber_onceToken, &__block_literal_global_74);
  return (CARPrototypeBoolPref *)(id)showSerialNumber__showSerialNumber;
}

void __36__CARPrototypePref_showSerialNumber__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CRLocalizedStringForKey(CFSTR("SERIAL_LABEL"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("showSerialNumber"), v2, 0, &__block_literal_global_79);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showSerialNumber__showSerialNumber;
  showSerialNumber__showSerialNumber = v0;

}

void __36__CARPrototypePref_showSerialNumber__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.CarPlay.internal.showDisclaimer"), 0, 0, 1u);
}

+ (CARPrototypeBoolPref)allowUnlimitedConnectionEvents
{
  if (allowUnlimitedConnectionEvents_onceToken != -1)
    dispatch_once(&allowUnlimitedConnectionEvents_onceToken, &__block_literal_global_80);
  return (CARPrototypeBoolPref *)(id)allowUnlimitedConnectionEvents__allowUnlimitedConnectionEvents;
}

void __50__CARPrototypePref_allowUnlimitedConnectionEvents__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("allowUnlimitedConnectionEvents"), 0, MEMORY[0x1E0C9AAA0], &__block_literal_global_83);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowUnlimitedConnectionEvents__allowUnlimitedConnectionEvents;
  allowUnlimitedConnectionEvents__allowUnlimitedConnectionEvents = v0;

}

+ (CARPrototypeBoolPref)allowSessionDurationRecordingEvents
{
  if (allowSessionDurationRecordingEvents_onceToken != -1)
    dispatch_once(&allowSessionDurationRecordingEvents_onceToken, &__block_literal_global_84);
  return (CARPrototypeBoolPref *)(id)allowSessionDurationRecordingEvents__allowSessionDurationRecordingEvents;
}

void __55__CARPrototypePref_allowSessionDurationRecordingEvents__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("allowSessionDurationRecordingEvents"), 0, MEMORY[0x1E0C9AAA0], &__block_literal_global_87);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowSessionDurationRecordingEvents__allowSessionDurationRecordingEvents;
  allowSessionDurationRecordingEvents__allowSessionDurationRecordingEvents = v0;

}

+ (CARPrototypeBoolPref)allowAutomaticConnectionDurationTTR
{
  if (allowAutomaticConnectionDurationTTR_onceToken != -1)
    dispatch_once(&allowAutomaticConnectionDurationTTR_onceToken, &__block_literal_global_88);
  return (CARPrototypeBoolPref *)(id)allowAutomaticConnectionDurationTTR__allowAutomaticConnectionDurationTTR;
}

void __55__CARPrototypePref_allowAutomaticConnectionDurationTTR__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CRLocalizedStringForKey(CFSTR("Detect Connection Time Issues"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.internal.carkitd"), CFSTR("allowAutomaticConnectionDurationTTR"), v2, 0, &__block_literal_global_95_0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowAutomaticConnectionDurationTTR__allowAutomaticConnectionDurationTTR;
  allowAutomaticConnectionDurationTTR__allowAutomaticConnectionDurationTTR = v0;

}

void __55__CARPrototypePref_allowAutomaticConnectionDurationTTR__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CarPlayAllowConnectionDurationTTRChangedNotification"), 0, 0, 1u);
}

+ (CARPrototypePref)wirelessConnectionDurationTTRThreshold
{
  if (wirelessConnectionDurationTTRThreshold_onceToken != -1)
    dispatch_once(&wirelessConnectionDurationTTRThreshold_onceToken, &__block_literal_global_98_0);
  return (CARPrototypePref *)(id)wirelessConnectionDurationTTRThreshold__wirelessConnectionDurationTTRThreshold;
}

void __58__CARPrototypePref_wirelessConnectionDurationTTRThreshold__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypePref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.internal.carkitd"), CFSTR("wirelessConnectionDurationTTRThreshold"), CFSTR("Automatic Connection TTR Threshold"), &unk_1E543F5E0, &__block_literal_global_105);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)wirelessConnectionDurationTTRThreshold__wirelessConnectionDurationTTRThreshold;
  wirelessConnectionDurationTTRThreshold__wirelessConnectionDurationTTRThreshold = v0;

}

void __58__CARPrototypePref_wirelessConnectionDurationTTRThreshold__block_invoke_104()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CarPlayAllowConnectionDurationTTRChangedNotification"), 0, 0, 1u);
}

+ (CARPrototypeBoolPref)audioSharingEnabled
{
  if (audioSharingEnabled_onceToken != -1)
    dispatch_once(&audioSharingEnabled_onceToken, &__block_literal_global_106);
  return (CARPrototypeBoolPref *)(id)audioSharingEnabled__audioSharingEnabled;
}

void __39__CARPrototypePref_audioSharingEnabled__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("CARAudioSharingEnabled"), 0, 0, &__block_literal_global_109);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)audioSharingEnabled__audioSharingEnabled;
  audioSharingEnabled__audioSharingEnabled = v0;

}

void __39__CARPrototypePref_audioSharingEnabled__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("CarPlayAudioSharingEnabledDidChangeNotification"), 0, 0, 1u);
}

+ (CARPrototypePref)contentSize
{
  if (contentSize_onceToken != -1)
    dispatch_once(&contentSize_onceToken, &__block_literal_global_112);
  return (CARPrototypePref *)(id)contentSize__contentSize;
}

void __31__CARPrototypePref_contentSize__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypePref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.UIKit"), CFSTR("UICarPlayPreferredContentSizeCategoryName"), 0, CFSTR("UICTContentSizeCategoryL"), &__block_literal_global_119);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contentSize__contentSize;
  contentSize__contentSize = v0;

}

void __31__CARPrototypePref_contentSize__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleCarPlayPreferredContentSizeCategoryChangedNotification"), 0, 0, 1u);
}

+ (CARPrototypePref)interfaceStyle
{
  if (interfaceStyle_onceToken != -1)
    dispatch_once(&interfaceStyle_onceToken, &__block_literal_global_122);
  return (CARPrototypePref *)(id)interfaceStyle__interfaceStyle;
}

void __34__CARPrototypePref_interfaceStyle__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypePref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.UIKit"), CFSTR("CarPlayUserInterfaceStyle"), 0, &unk_1E543F5F8, &__block_literal_global_128);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interfaceStyle__interfaceStyle;
  interfaceStyle__interfaceStyle = v0;

}

void __34__CARPrototypePref_interfaceStyle__block_invoke_127()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carkit.capabilities-changed"), 0, 0, 1u);
}

+ (CARPrototypePref)latestInterfaceStyle
{
  if (latestInterfaceStyle_onceToken != -1)
    dispatch_once(&latestInterfaceStyle_onceToken, &__block_literal_global_131);
  return (CARPrototypePref *)(id)latestInterfaceStyle__interfaceStyle;
}

void __40__CARPrototypePref_latestInterfaceStyle__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypePref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.CarPlayApp"), CFSTR("CarPlayUserInterfaceStyle"), 0, &unk_1E543F5F8, &__block_literal_global_134);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)latestInterfaceStyle__interfaceStyle;
  latestInterfaceStyle__interfaceStyle = v0;

}

void __40__CARPrototypePref_latestInterfaceStyle__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carkit.capabilities-changed"), 0, 0, 1u);
}

+ (CARPrototypeBoolPref)useSceneInterfaceStyle
{
  if (useSceneInterfaceStyle_onceToken != -1)
    dispatch_once(&useSceneInterfaceStyle_onceToken, &__block_literal_global_135);
  return (CARPrototypeBoolPref *)(id)useSceneInterfaceStyle__useSceneInterfaceStyle;
}

void __42__CARPrototypePref_useSceneInterfaceStyle__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.UIKit"), CFSTR("ApplySceneUserInterfaceStyleToCarScreen"), 0, 0, &__block_literal_global_138);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)useSceneInterfaceStyle__useSceneInterfaceStyle;
  useSceneInterfaceStyle__useSceneInterfaceStyle = v0;

}

+ (CARPrototypeBoolPref)disableLocationNightMode
{
  if (disableLocationNightMode_onceToken != -1)
    dispatch_once(&disableLocationNightMode_onceToken, &__block_literal_global_139);
  return (CARPrototypeBoolPref *)(id)disableLocationNightMode__disableLocationNightMode;
}

void __44__CARPrototypePref_disableLocationNightMode__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.CarPlayApp"), CFSTR("kCarPlayAppDisableLocationNightMode"), 0, 0, &__block_literal_global_142);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)disableLocationNightMode__disableLocationNightMode;
  disableLocationNightMode__disableLocationNightMode = v0;

}

+ (CARPrototypeBoolPref)useNightModeTester
{
  if (useNightModeTester_onceToken != -1)
    dispatch_once(&useNightModeTester_onceToken, &__block_literal_global_143);
  return (CARPrototypeBoolPref *)(id)useNightModeTester__useNightModeTester;
}

void __38__CARPrototypePref_useNightModeTester__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.CarPlayApp"), CFSTR("kCarPlayAppUseNightModeTester"), 0, 0, &__block_literal_global_146);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)useNightModeTester__useNightModeTester;
  useNightModeTester__useNightModeTester = v0;

}

+ (CARPrototypeBoolPref)showCarPlayTemplateUIHostInCluster
{
  if (showCarPlayTemplateUIHostInCluster_onceToken != -1)
    dispatch_once(&showCarPlayTemplateUIHostInCluster_onceToken, &__block_literal_global_147);
  return (CARPrototypeBoolPref *)(id)showCarPlayTemplateUIHostInCluster__showCarPlayTemplateUIHostInCluster;
}

void __54__CARPrototypePref_showCarPlayTemplateUIHostInCluster__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.CarPlayApp"), CFSTR("kCarPlayAppShowCarPlayTemplateUIHostInCluster"), 0, 0, &__block_literal_global_150);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showCarPlayTemplateUIHostInCluster__showCarPlayTemplateUIHostInCluster;
  showCarPlayTemplateUIHostInCluster__showCarPlayTemplateUIHostInCluster = v0;

}

+ (CARPrototypeBoolPref)shellCAFDisabled
{
  if (shellCAFDisabled_onceToken != -1)
    dispatch_once(&shellCAFDisabled_onceToken, &__block_literal_global_151);
  return (CARPrototypeBoolPref *)(id)shellCAFDisabled__shellCAFDisabled;
}

void __36__CARPrototypePref_shellCAFDisabled__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.CarPlayApp"), CFSTR("CAFDisabled"), 0, 0, &__block_literal_global_154);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shellCAFDisabled__shellCAFDisabled;
  shellCAFDisabled__shellCAFDisabled = v0;

}

+ (CARPrototypeBoolPref)force3xCluster
{
  if (force3xCluster_onceToken != -1)
    dispatch_once(&force3xCluster_onceToken, &__block_literal_global_155);
  return (CARPrototypeBoolPref *)(id)force3xCluster__force3xCluster;
}

void __34__CARPrototypePref_force3xCluster__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.mediaexperience"), CFSTR("kForce3xCluster"), 0, 0, &__block_literal_global_160);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)force3xCluster__force3xCluster;
  force3xCluster__force3xCluster = v0;

}

+ (CARPrototypeBoolPref)showPrototypeApps
{
  if (showPrototypeApps_onceToken != -1)
    dispatch_once(&showPrototypeApps_onceToken, &__block_literal_global_161);
  return (CARPrototypeBoolPref *)(id)showPrototypeApps__showPrototypeApps;
}

void __37__CARPrototypePref_showPrototypeApps__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("showPrototypeApps"), 0, 0, &__block_literal_global_164);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showPrototypeApps__showPrototypeApps;
  showPrototypeApps__showPrototypeApps = v0;

}

void __37__CARPrototypePref_showPrototypeApps__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.CarPlay.internal.refreshApps"), 0, 0, 1u);
}

+ (CARPrototypePref)nowPlayingAlbumArt
{
  if (nowPlayingAlbumArt_onceToken != -1)
    dispatch_once(&nowPlayingAlbumArt_onceToken, &__block_literal_global_165);
  return (CARPrototypePref *)(id)nowPlayingAlbumArt__nowPlayingAlbumArt;
}

void __38__CARPrototypePref_nowPlayingAlbumArt__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CFPreferencesSetAppValue(CFSTR("MusicUIServiceNowPlayingAlbumArt"), 0, CFSTR("com.apple.internal.carkitd"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.internal.carkitd"));
  CRLocalizedStringForKey(CFSTR("INTERNAL_NOW_PLAYING_ALBUM_ART"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypePref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.internal.carkitd"), CFSTR("NowPlayingAlbumArtMode"), v2, &unk_1E543F5F8, &__block_literal_global_172);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nowPlayingAlbumArt__nowPlayingAlbumArt;
  nowPlayingAlbumArt__nowPlayingAlbumArt = v0;

}

void __38__CARPrototypePref_nowPlayingAlbumArt__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.carkit.capabilities-changed"), 0, 0, 1u);
}

+ (CARPrototypeBoolPref)showInternalSettings
{
  if (showInternalSettings_onceToken != -1)
    dispatch_once(&showInternalSettings_onceToken, &__block_literal_global_173);
  return (CARPrototypeBoolPref *)(id)showInternalSettings__showInternalSettings;
}

void __40__CARPrototypePref_showInternalSettings__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CRLocalizedStringForKey(CFSTR("INTERNAL_SETTINGS"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("showInternalSettings"), v2, 0, &__block_literal_global_178);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)showInternalSettings__showInternalSettings;
  showInternalSettings__showInternalSettings = v0;

}

void __40__CARPrototypePref_showInternalSettings__block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.CarPlay.internal.refreshApps"), 0, 0, 1u);
}

+ (CARPrototypeBoolPref)smartWidgetDebugShowScore
{
  if (smartWidgetDebugShowScore_onceToken != -1)
    dispatch_once(&smartWidgetDebugShowScore_onceToken, &__block_literal_global_179);
  return (CARPrototypeBoolPref *)(id)smartWidgetDebugShowScore__smartWidgetDebugShowScore;
}

void __45__CARPrototypePref_smartWidgetDebugShowScore__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CRLocalizedStringForKey(CFSTR("INTERNAL_SMART_WIDGET_SHOW_SCORE"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.CarPlayApp"), CFSTR("CARSmartWidgetDebugShowScore"), v2, 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)smartWidgetDebugShowScore__smartWidgetDebugShowScore;
  smartWidgetDebugShowScore__smartWidgetDebugShowScore = v0;

}

+ (CARPrototypeBoolPref)smartWidgetDebugGestures
{
  if (smartWidgetDebugGestures_onceToken != -1)
    dispatch_once(&smartWidgetDebugGestures_onceToken, &__block_literal_global_184);
  return (CARPrototypeBoolPref *)(id)smartWidgetDebugGestures__smartWidgetDebugGestures;
}

void __44__CARPrototypePref_smartWidgetDebugGestures__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CRLocalizedStringForKey(CFSTR("INTERNAL_SMART_WIDGET_GESTURES"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.CarPlayApp"), CFSTR("CARSmartWidgetDebugGestures"), v2, 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)smartWidgetDebugGestures__smartWidgetDebugGestures;
  smartWidgetDebugGestures__smartWidgetDebugGestures = v0;

}

+ (CARPrototypeBoolPref)smartWidgetRelaxHomeInRangeCheck
{
  if (smartWidgetRelaxHomeInRangeCheck_onceToken != -1)
    dispatch_once(&smartWidgetRelaxHomeInRangeCheck_onceToken, &__block_literal_global_189);
  return (CARPrototypeBoolPref *)(id)smartWidgetRelaxHomeInRangeCheck__smartWidgetRelaxHomeInRangeCheck;
}

void __52__CARPrototypePref_smartWidgetRelaxHomeInRangeCheck__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CRLocalizedStringForKey(CFSTR("INTERNAL_SMART_WIDGET_RELAXED_INRANGE"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.CarPlayApp"), CFSTR("CARSmartWidgetDebugRelaxHomeInRangeCheck"), v2, 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)smartWidgetRelaxHomeInRangeCheck__smartWidgetRelaxHomeInRangeCheck;
  smartWidgetRelaxHomeInRangeCheck__smartWidgetRelaxHomeInRangeCheck = v0;

}

+ (CARPrototypeBoolPref)fakeNeatlineDashboardSupport
{
  if (fakeNeatlineDashboardSupport_onceToken != -1)
    dispatch_once(&fakeNeatlineDashboardSupport_onceToken, &__block_literal_global_194);
  return (CARPrototypeBoolPref *)(id)fakeNeatlineDashboardSupport__fakeNeatlineDashboardEnabled;
}

void __48__CARPrototypePref_fakeNeatlineDashboardSupport__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("kCarPlayFakeNeatlineDashboard"), CFSTR("Fake Neatline Dashboard"), 0, &__block_literal_global_199);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fakeNeatlineDashboardSupport__fakeNeatlineDashboardEnabled;
  fakeNeatlineDashboardSupport__fakeNeatlineDashboardEnabled = v0;

}

+ (CARPrototypePref)statusBarEdgeOverride
{
  if (statusBarEdgeOverride_onceToken != -1)
    dispatch_once(&statusBarEdgeOverride_onceToken, &__block_literal_global_200);
  return (CARPrototypePref *)(id)statusBarEdgeOverride__statusBarEdgeOverride;
}

void __41__CARPrototypePref_statusBarEdgeOverride__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypePref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("CARStatusBarEdgeOverride"), CFSTR("Status bar edge override"), &unk_1E543F610, &__block_literal_global_207);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)statusBarEdgeOverride__statusBarEdgeOverride;
  statusBarEdgeOverride__statusBarEdgeOverride = v0;

}

+ (CARPrototypePref)statusBarHorizontalThreshold
{
  if (statusBarHorizontalThreshold_onceToken != -1)
    dispatch_once(&statusBarHorizontalThreshold_onceToken, &__block_literal_global_208);
  return (CARPrototypePref *)(id)statusBarHorizontalThreshold__statusBarHorizontalThreshold;
}

void __48__CARPrototypePref_statusBarHorizontalThreshold__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypePref prefWithDomain:key:title:defaultValue:valueChangedBlock:](CARPrototypePref, "prefWithDomain:key:title:defaultValue:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("CARStatusBarHorizontalThreshold"), CFSTR("Status bar horizontal threshold"), &unk_1E543F628, &__block_literal_global_215);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)statusBarHorizontalThreshold__statusBarHorizontalThreshold;
  statusBarHorizontalThreshold__statusBarHorizontalThreshold = v0;

}

+ (CARPrototypeBoolPref)flipDashboardLayout
{
  if (flipDashboardLayout_onceToken != -1)
    dispatch_once(&flipDashboardLayout_onceToken, &__block_literal_global_216);
  return (CARPrototypeBoolPref *)(id)flipDashboardLayout__flipDashboardLayout;
}

void __39__CARPrototypePref_flipDashboardLayout__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CARPrototypeBoolPref prefWithDomain:key:title:invertValueForState:valueChangedBlock:](CARPrototypeBoolPref, "prefWithDomain:key:title:invertValueForState:valueChangedBlock:", CFSTR("com.apple.carplay.internal"), CFSTR("CARFlipDashboardLayout"), CFSTR("Flip Dashboard Layout"), 0, &__block_literal_global_221);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)flipDashboardLayout__flipDashboardLayout;
  flipDashboardLayout__flipDashboardLayout = v0;

}

+ (CARPrototypePref)prefWithDomain:(id)a3 key:(id)a4 title:(id)a5 defaultValue:(id)a6 valueChangedBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init((Class)a1);
  objc_msgSend(v17, "setDomain:", v16);

  objc_msgSend(v17, "setKey:", v15);
  objc_msgSend(v17, "setTitle:", v14);

  objc_msgSend(v17, "setDefaultValue:", v13);
  objc_msgSend(v17, "setValueChangedBlock:", v12);

  return (CARPrototypePref *)v17;
}

- (id)value
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  -[CARPrototypePref domain](self, "domain");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(v3);

  -[CARPrototypePref key](self, "key");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref domain](self, "domain");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)CFPreferencesCopyAppValue(v4, v5);

  return v6;
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id value;

  v4 = a3;
  -[CARPrototypePref value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  value = v4;
  -[CARPrototypePref key](self, "key");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref domain](self, "domain");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v6, value, v7);

  -[CARPrototypePref domain](self, "domain");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(v8);

  -[CARPrototypePref valueChangedBlock](self, "valueChangedBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CARPrototypePref valueChangedBlock](self, "valueChangedBlock");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v10)[2](v10, v5, value);

  }
}

- (id)valueOrDefault
{
  void *v3;

  -[CARPrototypePref value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CARPrototypePref value](self, "value");
  else
    -[CARPrototypePref defaultValue](self, "defaultValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)state
{
  void *v2;
  BOOL v3;

  -[CARPrototypePref value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setState:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[CARPrototypePref defaultValue](self, "defaultValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CARPrototypePref setValue:](self, "setValue:", v4);

  }
  else
  {
    -[CARPrototypePref setValue:](self, "setValue:", 0);
  }
}

+ (NSDictionary)prototypePrefCache
{
  void *v3;
  uint64_t v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.carplay.internal"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("PrototypePrefCache"), CFSTR("com.apple.carplay.internal"));
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = objc_opt_new();

    objc_msgSend(a1, "setPrototypePrefCache:", v4);
    v3 = (void *)v4;
  }
  return (NSDictionary *)v3;
}

+ (void)setPrototypePrefCache:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("PrototypePrefCache"), a3, CFSTR("com.apple.carplay.internal"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.carplay.internal"));
}

- (id)cachedValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "prototypePrefCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setCachedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "prototypePrefCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "carMutableDeepCopy");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[CARPrototypePref domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    -[CARPrototypePref domain](self, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v9);

  }
  -[CARPrototypePref domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref key](self, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, v12);

  objc_msgSend((id)objc_opt_class(), "setPrototypePrefCache:", v13);
}

- (id)cachedValueOrDefault
{
  void *v3;

  -[CARPrototypePref cachedValue](self, "cachedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CARPrototypePref cachedValue](self, "cachedValue");
  else
    -[CARPrototypePref defaultValue](self, "defaultValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)cachedState
{
  void *v2;
  BOOL v3;

  -[CARPrototypePref cachedValue](self, "cachedValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setCachedState:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[CARPrototypePref defaultValue](self, "defaultValue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CARPrototypePref setCachedValue:](self, "setCachedValue:", v4);

  }
  else
  {
    -[CARPrototypePref setCachedValue:](self, "setCachedValue:", 0);
  }
}

- (id)internalSettingsValue
{
  if (+[CARPrototypePref confirmedSafe](CARPrototypePref, "confirmedSafe"))
    -[CARPrototypePref value](self, "value");
  else
    -[CARPrototypePref cachedValue](self, "cachedValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setInternalSettingsValue:(id)a3
{
  id v4;

  v4 = a3;
  if (+[CARPrototypePref confirmedSafe](CARPrototypePref, "confirmedSafe"))
    -[CARPrototypePref setValue:](self, "setValue:", v4);
  else
    -[CARPrototypePref setCachedValue:](self, "setCachedValue:", v4);

}

- (BOOL)internalSettingsState
{
  if (+[CARPrototypePref confirmedSafe](CARPrototypePref, "confirmedSafe"))
    return -[CARPrototypePref state](self, "state");
  else
    return -[CARPrototypePref cachedState](self, "cachedState");
}

- (void)setInternalSettingsState:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (+[CARPrototypePref confirmedSafe](CARPrototypePref, "confirmedSafe"))
    -[CARPrototypePref setState:](self, "setState:", v3);
  else
    -[CARPrototypePref setCachedState:](self, "setCachedState:", v3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CARPrototypePref domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARPrototypePref value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@-%@=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)valueChangedBlock
{
  return self->_valueChangedBlock;
}

- (void)setValueChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueChangedBlock, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
