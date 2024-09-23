@implementation IRSystemStateDO

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestPickerChoiceDate, 0);
  objc_storeStrong((id *)&self->_predictedOutputDeviceName, 0);
  objc_storeStrong((id *)&self->_outputDeviceName, 0);
  objc_storeStrong((id *)&self->_mediaRouteGroupLeaderOutputDeviceID, 0);
  objc_storeStrong((id *)&self->_avInitialRouteSharingPolicy, 0);
  objc_storeStrong((id *)&self->_iCloudId, 0);
  objc_storeStrong((id *)&self->_locationSemanticLoiIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceWiFiSSID, 0);
  objc_storeStrong((id *)&self->_appInFocusBundleID, 0);
}

- (NSString)appInFocusBundleID
{
  return self->_appInFocusBundleID;
}

- (id)copyWithReplacementAppInFocusBundleID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v9) = self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = (void *)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", v4, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementAvInitialRouteSharingPolicy:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v9) = self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = (void *)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, v4, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementAppInFocusWindowValid:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, v3, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementAppInFocusWindowScreenUnlockEvent:(BOOL)a3
{
  id v5;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isContinuityDisplay;
  BYTE1(v7) = self->_pdrFenceActive;
  LOBYTE(v7) = a3;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (NSString)avInitialRouteSharingPolicy
{
  return self->_avInitialRouteSharingPolicy;
}

- (unint64_t)predictedOutputDeviceType
{
  return self->_predictedOutputDeviceType;
}

- (unint64_t)predictedOutputDeviceSubType
{
  return self->_predictedOutputDeviceSubType;
}

- (NSString)predictedOutputDeviceName
{
  return self->_predictedOutputDeviceName;
}

- (BOOL)pdrFenceActive
{
  return self->_pdrFenceActive;
}

- (unint64_t)outputDeviceType
{
  return self->_outputDeviceType;
}

- (unint64_t)outputDeviceSubType
{
  return self->_outputDeviceSubType;
}

- (NSString)outputDeviceName
{
  return self->_outputDeviceName;
}

- (NSString)mediaRouteGroupLeaderOutputDeviceID
{
  return self->_mediaRouteGroupLeaderOutputDeviceID;
}

- (int)locationSemanticUserSpecificPlaceType
{
  return self->_locationSemanticUserSpecificPlaceType;
}

- (NSString)locationSemanticLoiIdentifier
{
  return self->_locationSemanticLoiIdentifier;
}

- (NSString)iCloudId
{
  return self->_iCloudId;
}

- (NSString)deviceWiFiSSID
{
  return self->_deviceWiFiSSID;
}

- (BOOL)appInFocusWindowValid
{
  return self->_appInFocusWindowValid;
}

- (BOOL)appInFocusWindowScreenUnlockEvent
{
  return self->_appInFocusWindowScreenUnlockEvent;
}

- (int64_t)timeZoneSeconds
{
  return self->_timeZoneSeconds;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  int64_t v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  NSUInteger v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = -[NSString hash](self->_appInFocusBundleID, "hash");
  v4 = self->_appInFocusWindowValid - v3 + 32 * v3;
  v5 = -[NSString hash](self->_deviceWiFiSSID, "hash");
  v6 = self->_locationSemanticUserSpecificPlaceType - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  v7 = -[NSString hash](self->_locationSemanticLoiIdentifier, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_iCloudId, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_avInitialRouteSharingPolicy, "hash") - v8 + 32 * v8;
  v10 = -[NSString hash](self->_mediaRouteGroupLeaderOutputDeviceID, "hash");
  v11 = self->_timeZoneSeconds - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  v12 = -[NSString hash](self->_outputDeviceName, "hash");
  v13 = self->_outputDeviceType - (v12 - v11 + 32 * v11) + 32 * (v12 - v11 + 32 * v11);
  v14 = self->_outputDeviceSubType - v13 + 32 * v13;
  v15 = -[NSString hash](self->_predictedOutputDeviceName, "hash");
  v16 = self->_predictedOutputDeviceType - (v15 - v14 + 32 * v14) + 32 * (v15 - v14 + 32 * v14);
  v17 = self->_appInFocusWindowScreenUnlockEvent
      - (self->_predictedOutputDeviceSubType
       - v16
       + 32 * v16)
      + 32 * (self->_predictedOutputDeviceSubType - v16 + 32 * v16);
  v18 = self->_pdrFenceActive - v17 + 32 * v17;
  v19 = -[NSDate hash](self->_latestPickerChoiceDate, "hash");
  return self->_isContinuityDisplay - (v19 - v18 + 32 * v18) + 32 * (v19 - v18 + 32 * v18);
}

- (id)exportAsDictionary
{
  id v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[IRSystemStateDO appInFocusBundleID](self, "appInFocusBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[IRSystemStateDO appInFocusBundleID](self, "appInFocusBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appInFocusBundleID"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("appInFocusBundleID"));
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRSystemStateDO appInFocusWindowValid](self, "appInFocusWindowValid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appInFocusWindowValid"));

  -[IRSystemStateDO deviceWiFiSSID](self, "deviceWiFiSSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IRSystemStateDO deviceWiFiSSID](self, "deviceWiFiSSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceWiFiSSID"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("deviceWiFiSSID"));
  }

  IRLocationSemanticUserSpecificPlaceTypeToString(-[IRSystemStateDO locationSemanticUserSpecificPlaceType](self, "locationSemanticUserSpecificPlaceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("locationSemanticUserSpecificPlaceType"));

  -[IRSystemStateDO locationSemanticLoiIdentifier](self, "locationSemanticLoiIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[IRSystemStateDO locationSemanticLoiIdentifier](self, "locationSemanticLoiIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("locationSemanticLoiIdentifier"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("locationSemanticLoiIdentifier"));
  }

  -[IRSystemStateDO avInitialRouteSharingPolicy](self, "avInitialRouteSharingPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[IRSystemStateDO avInitialRouteSharingPolicy](self, "avInitialRouteSharingPolicy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("avInitialRouteSharingPolicy"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("avInitialRouteSharingPolicy"));
  }

  -[IRSystemStateDO iCloudId](self, "iCloudId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[IRSystemStateDO iCloudId](self, "iCloudId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("iCloudId"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("iCloudId"));
  }

  -[IRSystemStateDO mediaRouteGroupLeaderOutputDeviceID](self, "mediaRouteGroupLeaderOutputDeviceID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[IRSystemStateDO mediaRouteGroupLeaderOutputDeviceID](self, "mediaRouteGroupLeaderOutputDeviceID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("mediaRouteGroupLeaderOutputDeviceID"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("mediaRouteGroupLeaderOutputDeviceID"));
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[IRSystemStateDO timeZoneSeconds](self, "timeZoneSeconds"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("timeZoneSeconds"));

  -[IRSystemStateDO outputDeviceName](self, "outputDeviceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("outputDeviceName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[IRSystemStateDO outputDeviceType](self, "outputDeviceType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("outputDeviceType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[IRSystemStateDO outputDeviceSubType](self, "outputDeviceSubType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("outputDeviceSubType"));

  -[IRSystemStateDO predictedOutputDeviceName](self, "predictedOutputDeviceName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("predictedOutputDeviceName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[IRSystemStateDO predictedOutputDeviceType](self, "predictedOutputDeviceType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("predictedOutputDeviceType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[IRSystemStateDO predictedOutputDeviceSubType](self, "predictedOutputDeviceSubType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("predictedOutputDeviceSubType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[IRSystemStateDO appInFocusWindowScreenUnlockEvent](self, "appInFocusWindowScreenUnlockEvent"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("appInFocusWindowScreenUnlockEvent"));

  return v3;
}

- (BOOL)isHeadphonesRoutedOrPredicted
{
  return -[IRSystemStateDO outputDeviceType](self, "outputDeviceType") == 1
      && (-[IRSystemStateDO outputDeviceSubType](self, "outputDeviceSubType") == 3
       || -[IRSystemStateDO outputDeviceSubType](self, "outputDeviceSubType") == 2)
      || -[IRSystemStateDO predictedOutputDeviceType](self, "predictedOutputDeviceType") == 1;
}

- (BOOL)isMiLoSupportedLocation
{
  int v3;

  v3 = -[IRSystemStateDO locationSemanticUserSpecificPlaceType](self, "locationSemanticUserSpecificPlaceType");
  if (v3 != 1)
    LOBYTE(v3) = -[IRSystemStateDO locationSemanticUserSpecificPlaceType](self, "locationSemanticUserSpecificPlaceType") == 5;
  return v3;
}

- (id)overrideSystemStateIfNeeded:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  IRSystemStateDO *v29;
  IRSystemStateDO *v30;
  id v31;

  v31 = a3;
  v29 = [IRSystemStateDO alloc];
  -[IRSystemStateDO appInFocusBundleID](self, "appInFocusBundleID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[IRSystemStateDO appInFocusWindowValid](self, "appInFocusWindowValid");
  -[IRSystemStateDO deviceWiFiSSID](self, "deviceWiFiSSID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[IRSystemStateDO locationSemanticUserSpecificPlaceType](self, "locationSemanticUserSpecificPlaceType");
  -[IRSystemStateDO locationSemanticLoiIdentifier](self, "locationSemanticLoiIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSystemStateDO iCloudId](self, "iCloudId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSystemStateDO avInitialRouteSharingPolicy](self, "avInitialRouteSharingPolicy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSystemStateDO mediaRouteGroupLeaderOutputDeviceID](self, "mediaRouteGroupLeaderOutputDeviceID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[IRSystemStateDO timeZoneSeconds](self, "timeZoneSeconds");
  -[IRSystemStateDO outputDeviceName](self, "outputDeviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IRSystemStateDO outputDeviceType](self, "outputDeviceType");
  v6 = -[IRSystemStateDO outputDeviceSubType](self, "outputDeviceSubType");
  -[IRSystemStateDO predictedOutputDeviceName](self, "predictedOutputDeviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IRSystemStateDO predictedOutputDeviceType](self, "predictedOutputDeviceType");
  v9 = -[IRSystemStateDO predictedOutputDeviceSubType](self, "predictedOutputDeviceSubType");
  v10 = -[IRSystemStateDO appInFocusWindowScreenUnlockEvent](self, "appInFocusWindowScreenUnlockEvent");
  v11 = -[IRSystemStateDO pdrFenceActive](self, "pdrFenceActive");
  -[IRSystemStateDO latestPickerChoiceDate](self, "latestPickerChoiceDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = -[IRSystemStateDO isContinuityDisplay](self, "isContinuityDisplay");
  BYTE1(v18) = v11;
  LOBYTE(v18) = v10;
  v30 = -[IRSystemStateDO initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:](v29, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", v28, v27, v26, v25, v24, v23, v22, v21, v20, v4, v5, v6, v7, v8,
          v9,
          v18,
          v12,
          v19);

  if (v31)
  {
    if (objc_msgSend(v31, "overrideAppInFocusWindow"))
    {
      v13 = -[IRSystemStateDO copyWithReplacementAppInFocusWindowValid:](v30, "copyWithReplacementAppInFocusWindowValid:", 1);

    }
    else
    {
      v13 = v30;
    }
    objc_msgSend(v31, "overrideBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v31, "overrideBundleId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "copyWithReplacementAppInFocusBundleID:", v15);

      v13 = (id)v16;
    }
  }
  else
  {
    v13 = v30;
  }

  return v13;
}

- (IRSystemStateDO)initWithAppInFocusBundleID:(id)a3 appInFocusWindowValid:(BOOL)a4 deviceWiFiSSID:(id)a5 locationSemanticUserSpecificPlaceType:(int)a6 locationSemanticLoiIdentifier:(id)a7 iCloudId:(id)a8 avInitialRouteSharingPolicy:(id)a9 mediaRouteGroupLeaderOutputDeviceID:(id)a10 timeZoneSeconds:(int64_t)a11 outputDeviceName:(id)a12 outputDeviceType:(unint64_t)a13 outputDeviceSubType:(unint64_t)a14 predictedOutputDeviceName:(id)a15 predictedOutputDeviceType:(unint64_t)a16 predictedOutputDeviceSubType:(unint64_t)a17 appInFocusWindowScreenUnlockEvent:(BOOL)a18 pdrFenceActive:(BOOL)a19 latestPickerChoiceDate:(id)a20 isContinuityDisplay:(BOOL)a21
{
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  IRSystemStateDO *v31;
  IRSystemStateDO *v32;
  id obj;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v41 = a3;
  obj = a5;
  v26 = a5;
  v37 = a7;
  v27 = a7;
  v40 = a8;
  v39 = a9;
  v38 = a10;
  v28 = a12;
  v29 = a15;
  v30 = a20;
  v42.receiver = self;
  v42.super_class = (Class)IRSystemStateDO;
  v31 = -[IRSystemStateDO init](&v42, sel_init);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_appInFocusBundleID, a3);
    v32->_appInFocusWindowValid = a4;
    objc_storeStrong((id *)&v32->_deviceWiFiSSID, obj);
    v32->_locationSemanticUserSpecificPlaceType = a6;
    objc_storeStrong((id *)&v32->_locationSemanticLoiIdentifier, v37);
    objc_storeStrong((id *)&v32->_iCloudId, a8);
    objc_storeStrong((id *)&v32->_avInitialRouteSharingPolicy, a9);
    objc_storeStrong((id *)&v32->_mediaRouteGroupLeaderOutputDeviceID, a10);
    v32->_timeZoneSeconds = a11;
    objc_storeStrong((id *)&v32->_outputDeviceName, a12);
    v32->_outputDeviceType = a13;
    v32->_outputDeviceSubType = a14;
    objc_storeStrong((id *)&v32->_predictedOutputDeviceName, a15);
    v32->_predictedOutputDeviceType = a16;
    v32->_predictedOutputDeviceSubType = a17;
    v32->_appInFocusWindowScreenUnlockEvent = a18;
    v32->_pdrFenceActive = a19;
    objc_storeStrong((id *)&v32->_latestPickerChoiceDate, a20);
    v32->_isContinuityDisplay = a21;
  }

  return v32;
}

+ (IRSystemStateDO)systemStateDOWithAppInFocusBundleID:(id)a3 appInFocusWindowValid:(BOOL)a4 deviceWiFiSSID:(id)a5 locationSemanticUserSpecificPlaceType:(int)a6 locationSemanticLoiIdentifier:(id)a7 iCloudId:(id)a8 avInitialRouteSharingPolicy:(id)a9 mediaRouteGroupLeaderOutputDeviceID:(id)a10 timeZoneSeconds:(int64_t)a11 outputDeviceName:(id)a12 outputDeviceType:(unint64_t)a13 outputDeviceSubType:(unint64_t)a14 predictedOutputDeviceName:(id)a15 predictedOutputDeviceType:(unint64_t)a16 predictedOutputDeviceSubType:(unint64_t)a17 appInFocusWindowScreenUnlockEvent:(BOOL)a18 pdrFenceActive:(BOOL)a19 latestPickerChoiceDate:(id)a20 isContinuityDisplay:(BOOL)a21
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v39;

  v39 = a4;
  v25 = a20;
  v26 = a15;
  v27 = a12;
  v28 = a10;
  v29 = a9;
  v30 = a8;
  v31 = a7;
  v32 = a5;
  v33 = a3;
  LOBYTE(v37) = a21;
  LOWORD(v36) = __PAIR16__(a19, a18);
  v34 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", v33, v39, v32, a6, v31, v30, v29, v28, a11, v27, a13, a14, v26,
                  a16,
                  a17,
                  v36,
                  v25,
                  v37);

  return (IRSystemStateDO *)v34;
}

- (id)copyWithReplacementDeviceWiFiSSID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v9) = self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = (void *)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, v4, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementLocationSemanticUserSpecificPlaceType:(int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, v3, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementLocationSemanticLoiIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v9) = self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = (void *)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, v4, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementICloudId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v9) = self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = (void *)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, v4, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementMediaRouteGroupLeaderOutputDeviceID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v9) = self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = (void *)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, v4, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementTimeZoneSeconds:(int64_t)a3
{
  id v5;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, a3, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementOutputDeviceName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v9) = self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = (void *)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, v4, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementOutputDeviceType:(unint64_t)a3
{
  id v5;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, a3, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementOutputDeviceSubType:(unint64_t)a3
{
  id v5;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, a3, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementPredictedOutputDeviceName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v9) = self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = (void *)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, v4,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 self->_latestPickerChoiceDate,
                 v9);

  return v6;
}

- (id)copyWithReplacementPredictedOutputDeviceType:(unint64_t)a3
{
  id v5;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               a3,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementPredictedOutputDeviceSubType:(unint64_t)a3
{
  id v5;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isContinuityDisplay;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               a3,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementPdrFenceActive:(BOOL)a3
{
  id v5;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_isContinuityDisplay;
  BYTE1(v7) = a3;
  LOBYTE(v7) = self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (id)copyWithReplacementLatestPickerChoiceDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v9) = self->_isContinuityDisplay;
  LOWORD(v8) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  v6 = (void *)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
                 self->_predictedOutputDeviceType,
                 self->_predictedOutputDeviceSubType,
                 v8,
                 v4,
                 v9);

  return v6;
}

- (id)copyWithReplacementIsContinuityDisplay:(BOOL)a3
{
  id v5;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = a3;
  LOWORD(v7) = *(_WORD *)&self->_appInFocusWindowScreenUnlockEvent;
  return (id)objc_msgSend(v5, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", self->_appInFocusBundleID, self->_appInFocusWindowValid, self->_deviceWiFiSSID, self->_locationSemanticUserSpecificPlaceType, self->_locationSemanticLoiIdentifier, self->_iCloudId, self->_avInitialRouteSharingPolicy, self->_mediaRouteGroupLeaderOutputDeviceID, self->_timeZoneSeconds, self->_outputDeviceName, self->_outputDeviceType, self->_outputDeviceSubType, self->_predictedOutputDeviceName,
               self->_predictedOutputDeviceType,
               self->_predictedOutputDeviceSubType,
               v7,
               self->_latestPickerChoiceDate,
               v8);
}

- (BOOL)isEqualToSystemStateDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *appInFocusBundleID;
  void *v10;
  int v11;
  int appInFocusWindowValid;
  int v13;
  void *v14;
  int v15;
  NSString *deviceWiFiSSID;
  void *v17;
  int v18;
  int locationSemanticUserSpecificPlaceType;
  int v20;
  void *v21;
  int v22;
  NSString *locationSemanticLoiIdentifier;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  NSString *iCloudId;
  void *v30;
  int v31;
  int v32;
  void *v33;
  int v34;
  NSString *avInitialRouteSharingPolicy;
  void *v36;
  int v37;
  int v38;
  void *v39;
  int v40;
  NSString *mediaRouteGroupLeaderOutputDeviceID;
  void *v42;
  int v43;
  int64_t timeZoneSeconds;
  int v45;
  void *v46;
  int v47;
  NSString *outputDeviceName;
  void *v49;
  int v50;
  unint64_t outputDeviceType;
  unint64_t outputDeviceSubType;
  int v53;
  void *v54;
  int v55;
  NSString *predictedOutputDeviceName;
  void *v57;
  int v58;
  unint64_t predictedOutputDeviceType;
  unint64_t predictedOutputDeviceSubType;
  int appInFocusWindowScreenUnlockEvent;
  int pdrFenceActive;
  int v63;
  void *v64;
  int v65;
  NSDate *latestPickerChoiceDate;
  void *v67;
  int v68;
  int isContinuityDisplay;
  BOOL v70;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_39;
  v6 = self->_appInFocusBundleID != 0;
  objc_msgSend(v4, "appInFocusBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_39;
  appInFocusBundleID = self->_appInFocusBundleID;
  if (appInFocusBundleID)
  {
    objc_msgSend(v5, "appInFocusBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](appInFocusBundleID, "isEqual:", v10);

    if (!v11)
      goto LABEL_39;
  }
  appInFocusWindowValid = self->_appInFocusWindowValid;
  if (appInFocusWindowValid != objc_msgSend(v5, "appInFocusWindowValid"))
    goto LABEL_39;
  v13 = self->_deviceWiFiSSID != 0;
  objc_msgSend(v5, "deviceWiFiSSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_39;
  deviceWiFiSSID = self->_deviceWiFiSSID;
  if (deviceWiFiSSID)
  {
    objc_msgSend(v5, "deviceWiFiSSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](deviceWiFiSSID, "isEqual:", v17);

    if (!v18)
      goto LABEL_39;
  }
  locationSemanticUserSpecificPlaceType = self->_locationSemanticUserSpecificPlaceType;
  if (locationSemanticUserSpecificPlaceType != objc_msgSend(v5, "locationSemanticUserSpecificPlaceType"))
    goto LABEL_39;
  v20 = self->_locationSemanticLoiIdentifier != 0;
  objc_msgSend(v5, "locationSemanticLoiIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (v20 == v22)
    goto LABEL_39;
  locationSemanticLoiIdentifier = self->_locationSemanticLoiIdentifier;
  if (locationSemanticLoiIdentifier)
  {
    objc_msgSend(v5, "locationSemanticLoiIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[NSString isEqual:](locationSemanticLoiIdentifier, "isEqual:", v24);

    if (!v25)
      goto LABEL_39;
  }
  v26 = self->_iCloudId != 0;
  objc_msgSend(v5, "iCloudId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (v26 == v28)
    goto LABEL_39;
  iCloudId = self->_iCloudId;
  if (iCloudId)
  {
    objc_msgSend(v5, "iCloudId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[NSString isEqual:](iCloudId, "isEqual:", v30);

    if (!v31)
      goto LABEL_39;
  }
  v32 = self->_avInitialRouteSharingPolicy != 0;
  objc_msgSend(v5, "avInitialRouteSharingPolicy");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 == 0;

  if (v32 == v34)
    goto LABEL_39;
  avInitialRouteSharingPolicy = self->_avInitialRouteSharingPolicy;
  if (avInitialRouteSharingPolicy)
  {
    objc_msgSend(v5, "avInitialRouteSharingPolicy");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[NSString isEqual:](avInitialRouteSharingPolicy, "isEqual:", v36);

    if (!v37)
      goto LABEL_39;
  }
  v38 = self->_mediaRouteGroupLeaderOutputDeviceID != 0;
  objc_msgSend(v5, "mediaRouteGroupLeaderOutputDeviceID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39 == 0;

  if (v38 == v40)
    goto LABEL_39;
  mediaRouteGroupLeaderOutputDeviceID = self->_mediaRouteGroupLeaderOutputDeviceID;
  if (mediaRouteGroupLeaderOutputDeviceID)
  {
    objc_msgSend(v5, "mediaRouteGroupLeaderOutputDeviceID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[NSString isEqual:](mediaRouteGroupLeaderOutputDeviceID, "isEqual:", v42);

    if (!v43)
      goto LABEL_39;
  }
  timeZoneSeconds = self->_timeZoneSeconds;
  if (timeZoneSeconds != objc_msgSend(v5, "timeZoneSeconds"))
    goto LABEL_39;
  v45 = self->_outputDeviceName != 0;
  objc_msgSend(v5, "outputDeviceName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46 == 0;

  if (v45 == v47)
    goto LABEL_39;
  outputDeviceName = self->_outputDeviceName;
  if (outputDeviceName)
  {
    objc_msgSend(v5, "outputDeviceName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[NSString isEqual:](outputDeviceName, "isEqual:", v49);

    if (!v50)
      goto LABEL_39;
  }
  outputDeviceType = self->_outputDeviceType;
  if (outputDeviceType != objc_msgSend(v5, "outputDeviceType"))
    goto LABEL_39;
  outputDeviceSubType = self->_outputDeviceSubType;
  if (outputDeviceSubType != objc_msgSend(v5, "outputDeviceSubType"))
    goto LABEL_39;
  v53 = self->_predictedOutputDeviceName != 0;
  objc_msgSend(v5, "predictedOutputDeviceName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54 == 0;

  if (v53 == v55)
    goto LABEL_39;
  predictedOutputDeviceName = self->_predictedOutputDeviceName;
  if (predictedOutputDeviceName)
  {
    objc_msgSend(v5, "predictedOutputDeviceName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[NSString isEqual:](predictedOutputDeviceName, "isEqual:", v57);

    if (!v58)
      goto LABEL_39;
  }
  predictedOutputDeviceType = self->_predictedOutputDeviceType;
  if (predictedOutputDeviceType != objc_msgSend(v5, "predictedOutputDeviceType"))
    goto LABEL_39;
  predictedOutputDeviceSubType = self->_predictedOutputDeviceSubType;
  if (predictedOutputDeviceSubType != objc_msgSend(v5, "predictedOutputDeviceSubType"))
    goto LABEL_39;
  appInFocusWindowScreenUnlockEvent = self->_appInFocusWindowScreenUnlockEvent;
  if (appInFocusWindowScreenUnlockEvent != objc_msgSend(v5, "appInFocusWindowScreenUnlockEvent"))
    goto LABEL_39;
  pdrFenceActive = self->_pdrFenceActive;
  if (pdrFenceActive != objc_msgSend(v5, "pdrFenceActive"))
    goto LABEL_39;
  v63 = self->_latestPickerChoiceDate != 0;
  objc_msgSend(v5, "latestPickerChoiceDate");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64 == 0;

  if (v63 == v65)
    goto LABEL_39;
  latestPickerChoiceDate = self->_latestPickerChoiceDate;
  if (!latestPickerChoiceDate
    || (objc_msgSend(v5, "latestPickerChoiceDate"),
        v67 = (void *)objc_claimAutoreleasedReturnValue(),
        v68 = -[NSDate isEqual:](latestPickerChoiceDate, "isEqual:", v67),
        v67,
        v68))
  {
    isContinuityDisplay = self->_isContinuityDisplay;
    v70 = isContinuityDisplay == objc_msgSend(v5, "isContinuityDisplay");
  }
  else
  {
LABEL_39:
    v70 = 0;
  }

  return v70;
}

- (BOOL)isEqual:(id)a3
{
  IRSystemStateDO *v4;
  IRSystemStateDO *v5;
  BOOL v6;

  v4 = (IRSystemStateDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRSystemStateDO isEqualToSystemStateDO:](self, "isEqualToSystemStateDO:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRSystemStateDO)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IRSystemStateDO *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  uint64_t v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  objc_class *v39;
  void *v40;
  void *v42;
  objc_class *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  uint64_t v49;
  objc_class *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_class *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  const __CFString **v63;
  uint64_t *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  objc_class *v68;
  objc_class *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  const __CFString **v74;
  uint64_t *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  BOOL v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const __CFString *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  const __CFString *v113;
  uint64_t v114;
  const __CFString *v115;
  uint64_t v116;
  const __CFString *v117;
  uint64_t v118;
  const __CFString *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  const __CFString *v123;
  uint64_t v124;
  const __CFString *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  const __CFString *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  const __CFString *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  const __CFString *v143;
  uint64_t v144;
  _QWORD v145[3];

  v145[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appInFocusBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRSystemStateDO key \"appInFocusBundleID\" (expected %@, decoded %@)"), v7, v9, 0);
      v144 = *MEMORY[0x24BDD0FC8];
      v145[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v145, &v144, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);

LABEL_4:
      v13 = 0;
LABEL_39:

      goto LABEL_40;
    }
  }
  else
  {
    objc_msgSend(v4, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_12;
  }
  v15 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("appInFocusWindowValid"));
  if (v15)
    goto LABEL_7;
  objc_msgSend(v4, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("appInFocusWindowValid")) & 1) == 0)
    {
      v142 = *MEMORY[0x24BDD0FC8];
      v143 = CFSTR("Missing serialized value for IRSystemStateDO.appInFocusWindowValid");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 1, v7);
      objc_msgSend(v4, "failWithError:", v9);
      goto LABEL_4;
    }
LABEL_7:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceWiFiSSID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRSystemStateDO key \"deviceWiFiSSID\" (expected %@, decoded %@)"), v9, v18, 0);
        v140 = *MEMORY[0x24BDD0FC8];
        v141 = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 3, v20);
        objc_msgSend(v4, "failWithError:", v21);

LABEL_10:
        v13 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_21;
    }
    v24 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("locationSemanticUserSpecificPlaceType"));
    if ((_DWORD)v24)
      goto LABEL_15;
    objc_msgSend(v4, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("locationSemanticUserSpecificPlaceType")) & 1) == 0)
      {
        v138 = *MEMORY[0x24BDD0FC8];
        v139 = CFSTR("Missing serialized value for IRSystemStateDO.locationSemanticUserSpecificPlaceType");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 1, v9);
        objc_msgSend(v4, "failWithError:", v18);
        goto LABEL_10;
      }
LABEL_15:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationSemanticLoiIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v107 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRSystemStateDO key \"locationSemanticLoiIdentifier\" (expected %@, decoded %@)"), v18, v107, 0);
          v136 = *MEMORY[0x24BDD0FC8];
          v137 = v27;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 3, v28);
          objc_msgSend(v4, "failWithError:", v29);
LABEL_33:
          v13 = 0;
LABEL_34:

          v37 = (void *)v107;
LABEL_35:

LABEL_36:
LABEL_37:

          goto LABEL_38;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
          goto LABEL_4;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iCloudId"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v33;
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRSystemStateDO key \"iCloudId\" (expected %@, decoded %@)"), v33, v27, 0);
          v134 = *MEMORY[0x24BDD0FC8];
          v135 = v28;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 3, v29);
          objc_msgSend(v4, "failWithError:", v35);
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
          goto LABEL_10;
      }
      v100 = v24;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avInitialRouteSharingPolicy"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v105 = objc_claimAutoreleasedReturnValue();
          v107 = (uint64_t)v37;
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRSystemStateDO key \"avInitialRouteSharingPolicy\" (expected %@, decoded %@)"), v105, v28, 0);
          v132 = *MEMORY[0x24BDD0FC8];
          v133 = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 3, v35);
          objc_msgSend(v4, "failWithError:", v40);

          v27 = (void *)v105;
          goto LABEL_32;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v13 = 0;
          goto LABEL_37;
        }
      }
      v107 = (uint64_t)v37;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaRouteGroupLeaderOutputDeviceID"));
      v106 = objc_claimAutoreleasedReturnValue();
      if (v106)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (objc_class *)objc_opt_class();
          NSStringFromClass(v44);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRSystemStateDO key \"mediaRouteGroupLeaderOutputDeviceID\" (expected %@, decoded %@)"), v28, v29, 0);
          v130 = *MEMORY[0x24BDD0FC8];
          v131 = v101;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 3, v45);
          objc_msgSend(v4, "failWithError:", v46);

          v27 = (void *)v106;
          goto LABEL_33;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v13 = 0;
          v27 = 0;
          goto LABEL_36;
        }
      }
      v96 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timeZoneSeconds"));
      if (!v96)
      {
        objc_msgSend(v4, "error");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          v13 = 0;
          v27 = (void *)v106;
          goto LABEL_36;
        }
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("timeZoneSeconds")) & 1) == 0)
        {
          v128 = *MEMORY[0x24BDD0FC8];
          v129 = CFSTR("Missing serialized value for IRSystemStateDO.timeZoneSeconds");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 1, v28);
          objc_msgSend(v4, "failWithError:", v29);
          v13 = 0;
          v27 = (void *)v106;
          goto LABEL_34;
        }
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputDeviceName"));
      v99 = objc_claimAutoreleasedReturnValue();
      if (v99)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v48 = (objc_class *)objc_opt_class();
          NSStringFromClass(v48);
          v49 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v99;
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v102 = objc_claimAutoreleasedReturnValue();
          v95 = v49;
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRSystemStateDO key \"outputDeviceName\" (expected %@, decoded %@)"), v49, v102, 0);
          v126 = *MEMORY[0x24BDD0FC8];
          v127 = v51;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 3, v52);
          objc_msgSend(v4, "failWithError:", v53);

          v54 = (void *)v102;
LABEL_53:
          v13 = 0;
          v27 = (void *)v106;
LABEL_54:

LABEL_55:
          v29 = (void *)v95;
          goto LABEL_34;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
          goto LABEL_70;
      }
      v94 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("outputDeviceType"));
      if (!v94)
      {
        objc_msgSend(v4, "error");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v61)
          goto LABEL_70;
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("outputDeviceType")) & 1) == 0)
        {
          v124 = *MEMORY[0x24BDD0FC8];
          v125 = CFSTR("Missing serialized value for IRSystemStateDO.outputDeviceType");
          v62 = (void *)MEMORY[0x24BDBCE70];
          v63 = &v125;
          v64 = &v124;
          goto LABEL_81;
        }
      }
      v93 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("outputDeviceSubType"));
      if (v93)
        goto LABEL_61;
      objc_msgSend(v4, "error");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v65)
      {
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("outputDeviceSubType")) & 1) != 0)
        {
LABEL_61:
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictedOutputDeviceName"));
          v95 = objc_claimAutoreleasedReturnValue();
          if (v95)
          {
            objc_opt_class();
            v28 = (void *)v99;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v57 = (objc_class *)objc_opt_class();
              NSStringFromClass(v57);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = (objc_class *)objc_opt_class();
              NSStringFromClass(v58);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRSystemStateDO key \"predictedOutputDeviceName\" (expected %@, decoded %@)"), v54, v103, 0);
              v120 = *MEMORY[0x24BDD0FC8];
              v121 = v97;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 3, v59);
              objc_msgSend(v4, "failWithError:", v60);

              goto LABEL_53;
            }
          }
          else
          {
            objc_msgSend(v4, "error");
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = (void *)v99;
            if (v66)
              goto LABEL_90;
          }
          v67 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("predictedOutputDeviceType"));
          if (!v67)
          {
            objc_msgSend(v4, "error");
            v92 = (void *)objc_claimAutoreleasedReturnValue();

            if (v92)
              goto LABEL_90;
            if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("predictedOutputDeviceType")) & 1) == 0)
            {
              v118 = *MEMORY[0x24BDD0FC8];
              v119 = CFSTR("Missing serialized value for IRSystemStateDO.predictedOutputDeviceType");
              v73 = (void *)MEMORY[0x24BDBCE70];
              v74 = &v119;
              v75 = &v118;
              goto LABEL_98;
            }
          }
          v90 = v67;
          v91 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("predictedOutputDeviceSubType"));
          if (!v91)
          {
            objc_msgSend(v4, "error");
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            if (v76)
              goto LABEL_90;
            if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("predictedOutputDeviceSubType")) & 1) == 0)
            {
              v116 = *MEMORY[0x24BDD0FC8];
              v117 = CFSTR("Missing serialized value for IRSystemStateDO.predictedOutputDeviceSubType");
              v73 = (void *)MEMORY[0x24BDBCE70];
              v74 = &v117;
              v75 = &v116;
              goto LABEL_98;
            }
          }
          v89 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("appInFocusWindowScreenUnlockEvent"));
          if (v89)
          {
LABEL_75:
            v88 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("pdrFenceActive"));
            if (!v88)
            {
              objc_msgSend(v4, "error");
              v78 = (void *)objc_claimAutoreleasedReturnValue();

              if (v78)
              {
                v13 = 0;
                v27 = (void *)v106;
                v28 = (void *)v99;
                goto LABEL_55;
              }
              if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("pdrFenceActive")) & 1) == 0)
              {
                v112 = *MEMORY[0x24BDD0FC8];
                v113 = CFSTR("Missing serialized value for IRSystemStateDO.pdrFenceActive");
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 1, v54);
                objc_msgSend(v4, "failWithError:", v83);
LABEL_104:

                goto LABEL_82;
              }
            }
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestPickerChoiceDate"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v54)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v68 = (objc_class *)objc_opt_class();
                NSStringFromClass(v68);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = (objc_class *)objc_opt_class();
                NSStringFromClass(v69);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRSystemStateDO key \"latestPickerChoiceDate\" (expected %@, decoded %@)"), v98, v104, 0);
                v110 = *MEMORY[0x24BDD0FC8];
                v111 = v70;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 3, v71);
                objc_msgSend(v4, "failWithError:", v72);

LABEL_82:
                v13 = 0;
                v27 = (void *)v106;
                v28 = (void *)v99;
                goto LABEL_54;
              }
            }
            else
            {
              objc_msgSend(v4, "error");
              v79 = (void *)objc_claimAutoreleasedReturnValue();

              if (v79)
                goto LABEL_82;
            }
            v80 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("isContinuityDisplay"));
            if (!v80)
            {
              objc_msgSend(v4, "error");
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              if (v84)
                goto LABEL_82;
              if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("isContinuityDisplay")) & 1) == 0)
              {
                v108 = *MEMORY[0x24BDD0FC8];
                v109 = CFSTR("Missing serialized value for IRSystemStateDO.isContinuityDisplay");
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 1, v83);
                objc_msgSend(v4, "failWithError:", v85);

                goto LABEL_104;
              }
            }
            v81 = v80 != 0;
            v28 = (void *)v99;
            v27 = (void *)v106;
            LOBYTE(v87) = v81;
            BYTE1(v86) = v88 != 0;
            LOBYTE(v86) = v89 != 0;
            self = objc_retain(-[IRSystemStateDO initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:](self, "initWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", v5, v15 != 0, v7, v100, v9, v18, v107, v106, v96, v99, v94, v93,
                       v95,
                       v90,
                       v91,
                       v86,
                       v54,
                       v87));
            v13 = self;
            goto LABEL_54;
          }
          objc_msgSend(v4, "error");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v77)
          {
            if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("appInFocusWindowScreenUnlockEvent")) & 1) != 0)
              goto LABEL_75;
            v114 = *MEMORY[0x24BDD0FC8];
            v115 = CFSTR("Missing serialized value for IRSystemStateDO.appInFocusWindowScreenUnlockEvent");
            v73 = (void *)MEMORY[0x24BDBCE70];
            v74 = &v115;
            v75 = &v114;
LABEL_98:
            objc_msgSend(v73, "dictionaryWithObjects:forKeys:count:", v74, v75, 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 1, v54);
            objc_msgSend(v4, "failWithError:", v82);

            goto LABEL_53;
          }
LABEL_90:
          v13 = 0;
          v27 = (void *)v106;
          goto LABEL_55;
        }
        v122 = *MEMORY[0x24BDD0FC8];
        v123 = CFSTR("Missing serialized value for IRSystemStateDO.outputDeviceSubType");
        v62 = (void *)MEMORY[0x24BDBCE70];
        v63 = &v123;
        v64 = &v122;
LABEL_81:
        objc_msgSend(v62, "dictionaryWithObjects:forKeys:count:", v63, v64, 1);
        v95 = objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRSystemStateDOOCNTErrorDomain"), 1, v95);
        objc_msgSend(v4, "failWithError:", v54);
        goto LABEL_82;
      }
LABEL_70:
      v13 = 0;
      v27 = (void *)v106;
      v28 = (void *)v99;
      goto LABEL_35;
    }
LABEL_21:
    v13 = 0;
LABEL_40:

    goto LABEL_41;
  }
LABEL_12:
  v13 = 0;
LABEL_41:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *appInFocusBundleID;
  NSString *deviceWiFiSSID;
  NSString *locationSemanticLoiIdentifier;
  NSString *iCloudId;
  NSString *avInitialRouteSharingPolicy;
  void *v10;
  NSString *mediaRouteGroupLeaderOutputDeviceID;
  NSString *outputDeviceName;
  NSString *predictedOutputDeviceName;
  NSDate *latestPickerChoiceDate;
  id v15;

  v4 = a3;
  appInFocusBundleID = self->_appInFocusBundleID;
  v15 = v4;
  if (appInFocusBundleID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", appInFocusBundleID, CFSTR("appInFocusBundleID"));
    v4 = v15;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_appInFocusWindowValid, CFSTR("appInFocusWindowValid"));
  deviceWiFiSSID = self->_deviceWiFiSSID;
  if (deviceWiFiSSID)
    objc_msgSend(v15, "encodeObject:forKey:", deviceWiFiSSID, CFSTR("deviceWiFiSSID"));
  objc_msgSend(v15, "encodeInt64:forKey:", self->_locationSemanticUserSpecificPlaceType, CFSTR("locationSemanticUserSpecificPlaceType"));
  locationSemanticLoiIdentifier = self->_locationSemanticLoiIdentifier;
  if (locationSemanticLoiIdentifier)
    objc_msgSend(v15, "encodeObject:forKey:", locationSemanticLoiIdentifier, CFSTR("locationSemanticLoiIdentifier"));
  iCloudId = self->_iCloudId;
  if (iCloudId)
    objc_msgSend(v15, "encodeObject:forKey:", iCloudId, CFSTR("iCloudId"));
  avInitialRouteSharingPolicy = self->_avInitialRouteSharingPolicy;
  v10 = v15;
  if (avInitialRouteSharingPolicy)
  {
    objc_msgSend(v15, "encodeObject:forKey:", avInitialRouteSharingPolicy, CFSTR("avInitialRouteSharingPolicy"));
    v10 = v15;
  }
  mediaRouteGroupLeaderOutputDeviceID = self->_mediaRouteGroupLeaderOutputDeviceID;
  if (mediaRouteGroupLeaderOutputDeviceID)
  {
    objc_msgSend(v15, "encodeObject:forKey:", mediaRouteGroupLeaderOutputDeviceID, CFSTR("mediaRouteGroupLeaderOutputDeviceID"));
    v10 = v15;
  }
  objc_msgSend(v10, "encodeInt64:forKey:", self->_timeZoneSeconds, CFSTR("timeZoneSeconds"));
  outputDeviceName = self->_outputDeviceName;
  if (outputDeviceName)
    objc_msgSend(v15, "encodeObject:forKey:", outputDeviceName, CFSTR("outputDeviceName"));
  objc_msgSend(v15, "encodeInt64:forKey:", self->_outputDeviceType, CFSTR("outputDeviceType"));
  objc_msgSend(v15, "encodeInt64:forKey:", self->_outputDeviceSubType, CFSTR("outputDeviceSubType"));
  predictedOutputDeviceName = self->_predictedOutputDeviceName;
  if (predictedOutputDeviceName)
    objc_msgSend(v15, "encodeObject:forKey:", predictedOutputDeviceName, CFSTR("predictedOutputDeviceName"));
  objc_msgSend(v15, "encodeInt64:forKey:", self->_predictedOutputDeviceType, CFSTR("predictedOutputDeviceType"));
  objc_msgSend(v15, "encodeInt64:forKey:", self->_predictedOutputDeviceSubType, CFSTR("predictedOutputDeviceSubType"));
  objc_msgSend(v15, "encodeInt64:forKey:", self->_appInFocusWindowScreenUnlockEvent, CFSTR("appInFocusWindowScreenUnlockEvent"));
  objc_msgSend(v15, "encodeInt64:forKey:", self->_pdrFenceActive, CFSTR("pdrFenceActive"));
  latestPickerChoiceDate = self->_latestPickerChoiceDate;
  if (latestPickerChoiceDate)
    objc_msgSend(v15, "encodeObject:forKey:", latestPickerChoiceDate, CFSTR("latestPickerChoiceDate"));
  objc_msgSend(v15, "encodeInt64:forKey:", self->_isContinuityDisplay, CFSTR("isContinuityDisplay"));

}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  NSString *predictedOutputDeviceName;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDate *latestPickerChoiceDate;
  void *v12;
  void *v13;
  void *v15;
  NSString *outputDeviceName;
  void *v17;
  NSString *mediaRouteGroupLeaderOutputDeviceID;
  NSString *avInitialRouteSharingPolicy;
  __int128 v20;
  void *v21;
  NSString *deviceWiFiSSID;
  void *v23;
  NSString *appInFocusBundleID;
  id v25;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  appInFocusBundleID = self->_appInFocusBundleID;
  v25 = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_appInFocusWindowValid);
  v4 = objc_claimAutoreleasedReturnValue();
  deviceWiFiSSID = self->_deviceWiFiSSID;
  v23 = (void *)v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_locationSemanticUserSpecificPlaceType);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_OWORD *)&self->_locationSemanticLoiIdentifier;
  mediaRouteGroupLeaderOutputDeviceID = self->_mediaRouteGroupLeaderOutputDeviceID;
  avInitialRouteSharingPolicy = self->_avInitialRouteSharingPolicy;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timeZoneSeconds);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  outputDeviceName = self->_outputDeviceName;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_outputDeviceType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_outputDeviceSubType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  predictedOutputDeviceName = self->_predictedOutputDeviceName;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_predictedOutputDeviceType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_predictedOutputDeviceSubType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_appInFocusWindowScreenUnlockEvent);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pdrFenceActive);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  latestPickerChoiceDate = self->_latestPickerChoiceDate;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isContinuityDisplay);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("<IRSystemStateDO | appInFocusBundleID:%@ appInFocusWindowValid:%@ deviceWiFiSSID:%@ locationSemanticUserSpecificPlaceType:%@ locationSemanticLoiIdentifier:%@ iCloudId:%@ avInitialRouteSharingPolicy:%@ mediaRouteGroupLeaderOutputDeviceID:%@ timeZoneSeconds:%@ outputDeviceName:%@ outputDeviceType:%@ outputDeviceSubType:%@ predictedOutputDeviceName:%@ predictedOutputDeviceType:%@ predictedOutputDeviceSubType:%@ appInFocusWindowScreenUnlockEvent:%@ pdrFenceActive:%@ latestPickerChoiceDate:%@ isContinuityDisplay:%@>"), appInFocusBundleID, v23, deviceWiFiSSID, v21, v20, avInitialRouteSharingPolicy, mediaRouteGroupLeaderOutputDeviceID, v17, outputDeviceName, v15, v5, predictedOutputDeviceName, v7, v8, v9, v10,
                  latestPickerChoiceDate,
                  v12);

  return v13;
}

- (NSDate)latestPickerChoiceDate
{
  return self->_latestPickerChoiceDate;
}

- (BOOL)isContinuityDisplay
{
  return self->_isContinuityDisplay;
}

@end
