@implementation HPSDeviceAnalytics

- (HPSDeviceAnalytics)init
{
  NSObject *v3;
  HPSDeviceAnalytics *v4;
  HPSDeviceAnalytics *v5;
  objc_super v7;
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Headphone Configs: init Analytics", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)HPSDeviceAnalytics;
  v4 = -[HPSDeviceAnalytics init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[HPSDeviceAnalytics resetAnalyticDict](v4, "resetAnalyticDict");
    -[HPSDeviceAnalytics resetAnalyticDictV2](v5, "resetAnalyticDictV2");
    -[HPSDeviceAnalytics resetAnalyticDictFitTest](v5, "resetAnalyticDictFitTest");
  }
  return v5;
}

- (void)updateProductID:(unsigned int)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDict, "setObject:forKeyedSubscript:", v4, CFSTR("ProductID"));

  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableDictionary valueForKey:](self->_analyticDict, "valueForKey:", CFSTR("ProductID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Product ID: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)updateEntryPoint:(int)a3
{
  const __CFString *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 != 1)
      goto LABEL_6;
    v4 = CFSTR("iOS_Info_Button");
  }
  else
  {
    v4 = CFSTR("iOS_Top_Level");
  }
  -[NSMutableDictionary setValue:forKey:](self->_analyticDict, "setValue:forKey:", v4, CFSTR("EntryPoint"));
LABEL_6:
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableDictionary valueForKey:](self->_analyticDict, "valueForKey:", CFSTR("EntryPoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Entry Point: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)updateFeatureChangeCount:(int)a3
{
  const __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3 > 0x36)
    v4 = &stru_1EA29D890;
  else
    v4 = off_1EA29B160[a3];
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Feature: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_analyticDict, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDict, "setObject:forKeyedSubscript:", v8, v4);

}

- (void)updateFeatureValue:(int)a3 value:(unsigned int)a4 featureValueString:(id)a5
{
  id v8;
  void *v9;
  const __CFString *v10;
  int v11;
  __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  BOOL v20;
  NSObject *v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = v8;
  v10 = &stru_1EA29D890;
  v11 = a3 - 1;
  v12 = &stru_1EA29D890;
  switch(v11)
  {
    case 0:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("AdaptiveTransparencyValue");
      break;
    case 1:
    case 3:
    case 5:
    case 7:
    case 9:
    case 11:
    case 13:
    case 16:
    case 17:
    case 18:
    case 21:
    case 22:
    case 24:
    case 26:
    case 27:
    case 29:
    case 31:
    case 33:
    case 35:
    case 37:
    case 39:
    case 41:
    case 44:
    case 45:
    case 46:
    case 47:
    case 49:
    case 50:
    case 51:
      break;
    case 2:
      if (a4 == 1)
        v12 = CFSTR("On");
      else
        v12 = CFSTR("Off");
      v10 = CFSTR("AdaptiveVolumeValue");
      break;
    case 4:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("CaseSoundValue");
      break;
    case 6:
      v13 = CFSTR("BackToFront");
      v14 = CFSTR("CrownRotationValue");
      v15 = CFSTR("Unknown");
      v16 = CFSTR("CrownRotationValue");
      v17 = CFSTR("FrontToBack");
      v18 = CFSTR("CrownRotationValue");
      goto LABEL_41;
    case 8:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("CycleBetweenLeftBudValue");
      break;
    case 10:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("CycleBetweenRightBudValue");
      break;
    case 12:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("CycleBetweenV2LeftBudValue");
      break;
    case 14:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("CycleBetweenV2RightBudValue");
      break;
    case 15:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("CycleBetweenSingleValue");
      break;
    case 19:
      if (a4 >= 5)
        v12 = CFSTR("Unknown");
      else
        v12 = off_1EA29B318[a4];
      v10 = CFSTR("DoubleTapLeftValue");
      break;
    case 20:
      if (a4 >= 5)
        v12 = CFSTR("Unknown");
      else
        v12 = off_1EA29B318[a4];
      v10 = CFSTR("DoubleTapRightValue");
      break;
    case 23:
      v13 = CFSTR("PressOnce");
      v14 = CFSTR("EndCallValue");
      v15 = CFSTR("Unknown");
      v16 = CFSTR("EndCallValue");
      v19 = CFSTR("EndCallValue");
      goto LABEL_32;
    case 25:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("FindMyNetworkValue");
      break;
    case 28:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("InEarOnHeadDetectionValue");
      break;
    case 30:
      if (a4 - 1 >= 3)
        v12 = CFSTR("Unknown");
      else
        v12 = off_1EA29B340[a4 - 1];
      v10 = CFSTR("ListeningModeValue");
      break;
    case 32:
      if (a4 - 1 >= 4)
        v12 = CFSTR("Unknown");
      else
        v12 = off_1EA29B358[a4 - 1];
      v10 = CFSTR("ListeningModeV2Value");
      break;
    case 34:
      if (a4 == 1)
        v12 = CFSTR("On");
      else
        v12 = CFSTR("Off");
      v10 = CFSTR("MagneticEarbudDetectValue");
      break;
    case 36:
      if (a4 >= 3)
        v12 = CFSTR("Unknown");
      else
        v12 = off_1EA29B378[a4];
      v10 = CFSTR("MicrophoneSwitchValue");
      break;
    case 38:
      v13 = CFSTR("PressOnce");
      v14 = CFSTR("MuteCallValue");
      v15 = CFSTR("Unknown");
      v16 = CFSTR("MuteCallValue");
      v19 = CFSTR("MuteCallValue");
LABEL_32:
      if (a4 == 3)
      {
        v16 = v19;
        v15 = CFSTR("PressTwice");
      }
      v20 = a4 == 2;
      goto LABEL_44;
    case 40:
      v12 = &stru_1EA29D890;
      v10 = CFSTR("OptimizedBatteryChargingValue");
      break;
    case 42:
      if (a4 - 1 >= 7)
        v12 = CFSTR("Unknown");
      else
        v12 = off_1EA29B390[a4 - 1];
      v10 = CFSTR("PressHoldLeftBudValue");
      break;
    case 43:
      if (a4 - 1 >= 7)
        v12 = CFSTR("Unknown");
      else
        v12 = off_1EA29B390[a4 - 1];
      v10 = CFSTR("PressHoldRightBudValue");
      break;
    case 48:
      v13 = CFSTR("Automatic");
      v14 = CFSTR("SmartRoutingValue");
      v15 = CFSTR("Unknown");
      v16 = CFSTR("SmartRoutingValue");
      v17 = CFSTR("LastConnect");
      v18 = CFSTR("SmartRoutingValue");
LABEL_41:
      if (a4 == 2)
      {
        v16 = v18;
        v15 = v17;
      }
      v20 = a4 == 1;
LABEL_44:
      if (v20)
        v10 = v14;
      else
        v10 = v16;
      if (v20)
        v12 = (__CFString *)v13;
      else
        v12 = (__CFString *)v15;
      break;
    case 52:
      if (a4 == 1)
        v12 = CFSTR("On");
      else
        v12 = CFSTR("Off");
      v10 = CFSTR("SpeechDetectionValue");
      break;
    default:
      v12 = &stru_1EA29D890;
      break;
  }
  if (v8)
    v12 = (__CFString *)v8;
  sharedBluetoothSettingsLogComponent();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v10;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1DB30C000, v21, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Feature: %@ Value: %@", (uint8_t *)&v22, 0x16u);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDict, "setObject:forKeyedSubscript:", v12, v10);
}

- (void)resetAnalyticDict
{
  NSMutableDictionary *v3;
  NSMutableDictionary *analyticDict;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("ProductID"), &unk_1EA2B4F58, CFSTR("AdaptiveTransparency"), &stru_1EA29D890, CFSTR("AdaptiveTransparencyValue"), &unk_1EA2B4F58, CFSTR("AdaptiveVolume"), &stru_1EA29D890, CFSTR("AdaptiveVolumeValue"), &unk_1EA2B4F58, CFSTR("CaseSound"), &stru_1EA29D890, CFSTR("CaseSoundValue"), &unk_1EA2B4F58, CFSTR("CrownRotation"), &stru_1EA29D890, CFSTR("CrownRotationValue"),
    &unk_1EA2B4F58,
    CFSTR("CycleBetweenLeftBud"),
    &stru_1EA29D890,
    CFSTR("CycleBetweenLeftBudValue"),
    &unk_1EA2B4F58,
    CFSTR("CycleBetweenRightBud"),
    &stru_1EA29D890,
    CFSTR("CycleBetweenRightBudValue"),
    &unk_1EA2B4F58,
    CFSTR("CycleBetweenV2LeftBud"),
    &stru_1EA29D890,
    CFSTR("CycleBetweenV2LeftBudValue"),
    &unk_1EA2B4F58,
    CFSTR("CycleBetweenV2RightBud"),
    &stru_1EA29D890,
    CFSTR("CycleBetweenV2RightBudValue"),
    &stru_1EA29D890,
    CFSTR("CycleBetweenSingleValue"),
    &unk_1EA2B4F58,
    CFSTR("DeviceName"),
    &unk_1EA2B4F58,
    CFSTR("Disconnect"),
    &unk_1EA2B4F58,
    CFSTR("DoubleTap"),
    &stru_1EA29D890,
    CFSTR("DoubleTapLeftValue"),
    &stru_1EA29D890,
    CFSTR("DoubleTapRightValue"),
    CFSTR("Unknown"),
    CFSTR("EntryPoint"),
    &unk_1EA2B4F58,
    CFSTR("EarTipFitTest"),
    &unk_1EA2B4F58,
    CFSTR("EndCall"),
    &stru_1EA29D890,
    CFSTR("EndCallValue"),
    &unk_1EA2B4F58,
    CFSTR("FindMyNetwork"),
    &stru_1EA29D890,
    CFSTR("FindMyNetworkValue"),
    &unk_1EA2B4F58,
    CFSTR("ForgetDevice"),
    &unk_1EA2B4F58,
    CFSTR("InEarOnHeadDetection"));
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  analyticDict = self->_analyticDict;
  self->_analyticDict = v3;

}

- (void)resetAnalyticDictFitTest
{
  NSMutableDictionary *v3;
  NSMutableDictionary *analyticDictFitTest;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("BudMileage"), &unk_1EA2B4F58, CFSTR("ConfidenceL"), &unk_1EA2B4F58, CFSTR("ConfidenceR"), &unk_1EA2B4F58, CFSTR("FirstTimeUse"), &unk_1EA2B4F58, CFSTR("FitTestType"), &unk_1EA2B4F58, CFSTR("HeadphonePID"), &unk_1EA2B4F58, CFSTR("SealMetricL"), &unk_1EA2B4F58, CFSTR("SealMetricR"), &unk_1EA2B4F58, CFSTR("SessionTime"),
    &unk_1EA2B4F58,
    CFSTR("TestResult"),
    0);
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  analyticDictFitTest = self->_analyticDictFitTest;
  self->_analyticDictFitTest = v3;

}

- (void)resetAnalyticDictV2
{
  NSMutableDictionary *v3;
  NSMutableDictionary *analyticDictV2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("FeatureChangeCount"), &stru_1EA29D890, CFSTR("FeatureName"), &stru_1EA29D890, CFSTR("FeatureValue"), &unk_1EA2B4F58, CFSTR("HeadphonePID"), 0);
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  analyticDictV2 = self->_analyticDictV2;
  self->_analyticDictV2 = v3;

}

- (void)updateFitTestValue:(int)a3 value:(int)a4
{
  uint64_t v4;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = *(_QWORD *)&a4;
  v13 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
    case 3:
      return;
    case 1:
      v6 = CFSTR("ConfidenceL");
      goto LABEL_11;
    case 2:
      v6 = CFSTR("ConfidenceR");
      goto LABEL_11;
    case 4:
      v6 = CFSTR("FitTestType");
      goto LABEL_11;
    case 5:
      v6 = CFSTR("HeadphonePID");
      goto LABEL_11;
    case 6:
      v6 = CFSTR("SealMetricL");
      goto LABEL_11;
    case 7:
      v6 = CFSTR("SealMetricR");
      goto LABEL_11;
    case 8:
      v6 = CFSTR("SessionTime");
      goto LABEL_11;
    case 9:
      v6 = CFSTR("TestResult");
      goto LABEL_11;
    default:
      v6 = &stru_1EA29D890;
LABEL_11:
      sharedBluetoothSettingsLogComponent();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412546;
        v10 = v6;
        v11 = 1024;
        v12 = v4;
        _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Update Feature: %@ Value: %d", (uint8_t *)&v9, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDictFitTest, "setObject:forKeyedSubscript:", v8, v6);

      return;
  }
}

- (void)submitFitTestAnalytics
{
  NSMutableDictionary *v2;
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  uint8_t buf[4];
  NSMutableDictionary *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = self->_analyticDictFitTest;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v2;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Submit Analytics: %@", buf, 0xCu);
  }

  v5 = v2;
  v4 = v2;
  AnalyticsSendEventLazy();

}

id __44__HPSDeviceAnalytics_submitFitTestAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)submitDeviceAnalyticsVer2
{
  NSMutableDictionary *v2;
  NSObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  uint8_t buf[4];
  NSMutableDictionary *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = self->_analyticDictV2;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v2;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Submit Analytics: %@", buf, 0xCu);
  }

  v5 = v2;
  v4 = v2;
  AnalyticsSendEventLazy();

}

id __47__HPSDeviceAnalytics_submitDeviceAnalyticsVer2__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)sendFeatureInfoEvent
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AdaptiveVolume"), CFSTR("CycleBetweenV2LeftBud"), CFSTR("CycleBetweenV2RightBud"), CFSTR("EndCall"), CFSTR("ListeningModeV2"), CFSTR("MuteCall"), CFSTR("SpeechDetection"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_analyticDict;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDictV2, "setObject:forKeyedSubscript:", v10, CFSTR("FeatureChangeCount"));

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDictV2, "setObject:forKeyedSubscript:", v9, CFSTR("FeatureName"));
        objc_msgSend(v9, "stringByAppendingString:", CFSTR("Value"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDictV2, "setObject:forKeyedSubscript:", v12, CFSTR("FeatureValue"));

        -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("ProductID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDictV2, "setObject:forKeyedSubscript:", v13, CFSTR("HeadphonePID"));

        -[HPSDeviceAnalytics submitDeviceAnalyticsVer2](self, "submitDeviceAnalyticsVer2");
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDictV2, "setObject:forKeyedSubscript:", &unk_1EA2B4F58, CFSTR("FeatureChangeCount"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDictV2, "setObject:forKeyedSubscript:", CFSTR("ListeningMode_PersonalizedVolume_ConversationDetect"), CFSTR("FeatureName"));
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("ListeningModeV2Value"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("AdaptiveVolumeValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("SpeechDetectionValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@_%@"), v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDictV2, "setObject:forKeyedSubscript:", v18, CFSTR("FeatureValue"));

  -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("ProductID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_analyticDictV2, "setObject:forKeyedSubscript:", v19, CFSTR("HeadphonePID"));

  -[HPSDeviceAnalytics submitDeviceAnalyticsVer2](self, "submitDeviceAnalyticsVer2");
}

- (void)submitDeviceAnalytics
{
  NSMutableDictionary *v3;
  NSObject *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  uint8_t buf[4];
  NSMutableDictionary *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[HPSDeviceAnalytics sendFeatureInfoEvent](self, "sendFeatureInfoEvent");
  v3 = self->_analyticDict;
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Headphone Configs: Analytics, Submit Analytics: %@", buf, 0xCu);
  }

  v6 = v3;
  v5 = v3;
  AnalyticsSendEventLazy();
  -[HPSDeviceAnalytics resetAnalyticDict](self, "resetAnalyticDict");
  -[HPSDeviceAnalytics resetAnalyticDictV2](self, "resetAnalyticDictV2");

}

id __43__HPSDeviceAnalytics_submitDeviceAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticDictFitTest, 0);
  objc_storeStrong((id *)&self->_analyticDictV2, 0);
  objc_storeStrong((id *)&self->_analyticDict, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end
