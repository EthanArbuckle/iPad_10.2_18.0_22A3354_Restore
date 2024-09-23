@implementation BWCoreAnalyticsReporter

- (void)sendEvent:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend(a3, "eventDictionary");
  v6 = objc_msgSend(a3, "eventName");
  v7 = -[BWCoreAnalyticsReporter _sanitizePayloadDictionary:eventName:]((uint64_t)self, v5);
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[BWCoreAnalyticsReporter _sendAutoFocusROIEventToBiome:]((uint64_t)self, v8);
      else
        AnalyticsSendEvent();
    }
  }
}

- (void)_sanitizePayloadDictionary:(uint64_t)a1 eventName:(void *)a2
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  float v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(a2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "floatValue");
          objc_msgSend(v9, "floatValue");
          if (fabsf(v10) == INFINITY)
            objc_msgSend(v3, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  if (objc_msgSend(v3, "count"))
  {
    a2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a2);
    objc_msgSend(a2, "removeObjectsForKeys:", v3);
  }
  return a2;
}

+ (id)sharedInstance
{
  if (sharedInstance_checkBWCoreAnalyticsReporterOnceToken != -1)
    dispatch_once(&sharedInstance_checkBWCoreAnalyticsReporterOnceToken, &__block_literal_global_76);
  return (id)sharedInstance_sSharedCoreAnalyticsReporter;
}

+ (void)initialize
{
  objc_opt_class();
}

BWCoreAnalyticsReporter *__41__BWCoreAnalyticsReporter_sharedInstance__block_invoke()
{
  BWCoreAnalyticsReporter *result;

  result = objc_alloc_init(BWCoreAnalyticsReporter);
  sharedInstance_sSharedCoreAnalyticsReporter = (uint64_t)result;
  return result;
}

- (uint64_t)_sendAutoFocusROIEventToBiome:(uint64_t)result
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  if (result)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3052000000;
    v21 = __Block_byref_object_copy__27;
    v22 = __Block_byref_object_dispose__27;
    v3 = (objc_class *)getBMCameraCaptureAutoFocusROIClass_softClass;
    v23 = getBMCameraCaptureAutoFocusROIClass_softClass;
    if (!getBMCameraCaptureAutoFocusROIClass_softClass)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __getBMCameraCaptureAutoFocusROIClass_block_invoke;
      v17[3] = &unk_1E491EC40;
      v17[4] = &v18;
      __getBMCameraCaptureAutoFocusROIClass_block_invoke((uint64_t)v17);
      v3 = (objc_class *)v19[5];
    }
    _Block_object_dispose(&v18, 8);
    v4 = [v3 alloc];
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("portType"));
    v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("focusRegionType")), "intValue")+ 1;
    v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("focusRegionX"));
    v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("focusRegionY"));
    v9 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("focusRegionWidth"));
    v10 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("focusRegionHeight"));
    v11 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("luxLevel"));
    v12 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("subjectDistance"));
    LODWORD(v16) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("clientIDType")), "intValue");
    v13 = (id)objc_msgSend(v4, "initWithPortType:focusRegionType:topLeftCornerRow:topLeftCornerColumn:width:height:luxLevel:subjectDistance:clientApplicationIDType:", v5, v6, v7, v8, v9, v10, v11, v12, v16);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v14 = getBiomeLibrarySymbolLoc_ptr;
    v21 = (void (*)(uint64_t, uint64_t))getBiomeLibrarySymbolLoc_ptr;
    if (!getBiomeLibrarySymbolLoc_ptr)
    {
      v15 = (void *)BiomeLibraryLibrary();
      v14 = dlsym(v15, "BiomeLibrary");
      v19[3] = (uint64_t)v14;
      getBiomeLibrarySymbolLoc_ptr = v14;
    }
    _Block_object_dispose(&v18, 8);
    if (!v14)
      -[BWCoreAnalyticsReporter _sendAutoFocusROIEventToBiome:].cold.1();
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)((uint64_t (*)(void))v14)(), "CameraCapture"), "AutoFocusROI"), "source"), "sendEvent:", v13);
  }
  return result;
}

+ (int)clientApplicationIDType:(id)a3
{
  if (!a3)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D4D8) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D4F8) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D718) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D618) & 1) != 0)
    return 10;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D5B8) & 1) != 0)
    return 23;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D778) & 1) != 0)
    return 27;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D738) & 1) != 0)
    return 28;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D838) & 1) != 0)
    return 33;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D538) & 1) != 0)
    return 34;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D558) & 1) != 0)
    return 35;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D7B8) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", 0x1E493D7D8) & 1) != 0)
  {
    return 44;
  }
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D6B8) & 1) != 0)
    return 45;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D698) & 1) != 0)
    return 46;
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("net.whatsapp.WhatsApp")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("desktop.WhatsApp")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("net.whatsapp.WhatsAppSMB")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("WhatsApp")) & 1) != 0)
  {
    return 6;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.facebook.Messenger")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.skype.skype")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.skype.SkypeForiPad")) & 1) != 0)
  {
    return 8;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.tencent.xin")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.tencent.xinWeChat")) & 1) != 0)
  {
    return 9;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.burbn.instagram")) & 1) != 0)
    return 11;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.toyopagroup.picaboo")) & 1) != 0)
    return 12;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.zhiliaoapp.musically")) & 1) != 0)
    return 13;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.webex.meeting")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.webex.meetingmanager")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.cisco.squared")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.cisco.squared.intune")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.cisco.webexcalling")) & 1) != 0)
  {
    return 14;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("us.zoom.videomeetings")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("us.zoom.xos")) & 1) != 0)
  {
    return 15;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.google.hangouts")) & 1) != 0)
    return 16;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.bluejeansnet.Blue-Jeans")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.bluejeansnet.Huddle")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.bluejeansnet.Blue")) & 1) != 0)
  {
    return 17;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.logmein.gotomeeting")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.logmein.GoToMeeting")) & 1) != 0)
  {
    return 18;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.logmein.joinme")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.logmein.join.me")) & 1) != 0)
  {
    return 19;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.herzick.houseparty")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.herzick.mac")) & 1) != 0)
  {
    return 20;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.cisco.jabberIM")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.cisco.jabberIMintune")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.cisco.JabberGuest")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.cisco.jabberIMbb")) & 1) != 0)
  {
    return 21;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.microsoft.skype.teams")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.microsoft.teams")) & 1) != 0)
  {
    return 22;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.meetinone.meetinone")) & 1) != 0)
    return 24;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.google.meetings")) & 1) != 0)
    return 25;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.tinyspeck.slackmacgap")) & 1) != 0)
    return 26;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.tencent.tencentmeeting")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.tencent.meeting")) & 1) != 0)
  {
    return 29;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.hnc.Discord")) & 1) != 0)
    return 30;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.obsproject.obs-studio")) & 1) != 0)
    return 31;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.alibaba.DingTalkMac")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("com.alibaba.DingTalkMacLite")) & 1) != 0)
  {
    return 32;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.brave.Browser")) & 1) != 0)
    return 36;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.google.Chrome")) & 1) != 0)
    return 37;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.microsoft.edgemac")) & 1) != 0)
    return 38;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("org.mozilla.firefox")) & 1) != 0)
    return 39;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ru.keepcoder.Telegram")) & 1) != 0)
    return 30;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("jp.naver.line.mac")) & 1) != 0)
    return 41;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("com.ecamm.EcammLive")) & 1) != 0)
    return 42;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.reincubate.macos.cam")))
    return 43;
  return 1;
}

+ (id)shallowDepthOfFieldEffectStatusToString:(int)a3
{
  if (a3 > 0xF)
    return CFSTR("Invalid");
  else
    return off_1E4923D30[a3];
}

+ (id)geometricDistortionCorrectionSourceToShortString:(int)a3
{
  if (a3 > 3)
    return CFSTR("Invalid");
  else
    return off_1E4923DB0[a3];
}

- (void)_sendAutoFocusROIEventToBiome:.cold.1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BMRootLibrary> BWBMLibrary(void)"), CFSTR("BWCoreAnalyticsReporter.m"), 29, CFSTR("%s"), dlerror());
  __break(1u);
}

@end
