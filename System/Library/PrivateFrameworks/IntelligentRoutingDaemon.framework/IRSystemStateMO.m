@implementation IRSystemStateMO

+ (void)setPropertiesOfSystemStateMO:(id)a3 withSystemState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v5 = a4;
  v16 = a3;
  objc_msgSend(v5, "appInFocusBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAppInFocusBundleID:", v6);

  objc_msgSend(v16, "setAppInFocusWindowValid:", objc_msgSend(v5, "appInFocusWindowValid"));
  objc_msgSend(v5, "deviceWiFiSSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDeviceWiFiSSID:", v7);

  objc_msgSend(v16, "setLocationSemanticUserSpecificPlaceType:", objc_msgSend(v5, "locationSemanticUserSpecificPlaceType"));
  objc_msgSend(v5, "iCloudId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setICloudId:", v8);

  objc_msgSend(v5, "locationSemanticLoiIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLocationSemanticLoiIdentifier:", v9);

  objc_msgSend(v5, "avInitialRouteSharingPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAvInitialRouteSharingPolicy:", v10);

  objc_msgSend(v5, "mediaRouteGroupLeaderOutputDeviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMediaRouteGroupLeaderOutputDeviceID:", v11);

  objc_msgSend(v16, "setTimeZoneSeconds:", objc_msgSend(v5, "timeZoneSeconds"));
  objc_msgSend(v5, "outputDeviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOutputDeviceName:", v12);

  objc_msgSend(v16, "setOutputDeviceType:", objc_msgSend(v5, "outputDeviceType"));
  objc_msgSend(v16, "setOutputDeviceSubType:", objc_msgSend(v5, "outputDeviceSubType"));
  objc_msgSend(v5, "predictedOutputDeviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredictedOutputDeviceName:", v13);

  objc_msgSend(v16, "setPredictedOutputDeviceType:", objc_msgSend(v5, "predictedOutputDeviceType"));
  objc_msgSend(v16, "setPredictedOutputDeviceSubType:", objc_msgSend(v5, "predictedOutputDeviceSubType"));
  objc_msgSend(v16, "setAppInFocusWindowScreenUnlockEvent:", objc_msgSend(v5, "appInFocusWindowScreenUnlockEvent"));
  objc_msgSend(v16, "setPdrFenceActive:", objc_msgSend(v5, "pdrFenceActive"));
  objc_msgSend(v5, "latestPickerChoiceDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLatestPickerChoiceDate:", v14);

  v15 = objc_msgSend(v5, "isContinuityDisplay");
  objc_msgSend(v16, "setIsContinuityDisplay:", v15);

}

+ (id)systemStateMOWithSystemStateDO:(id)a3 replayEventMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRSystemStateMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRSystemStateMO initWithContext:]([IRSystemStateMO alloc], "initWithContext:", v7);

  -[IRSystemStateMO setReplayEvent:](v10, "setReplayEvent:", v8);
  +[IRSystemStateMO setPropertiesOfSystemStateMO:withSystemState:](IRSystemStateMO, "setPropertiesOfSystemStateMO:withSystemState:", v10, v9);

  return v10;
}

+ (id)systemStateMOWithSystemStateDO:(id)a3 historyEventMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRSystemStateMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRSystemStateMO initWithContext:]([IRSystemStateMO alloc], "initWithContext:", v7);

  -[IRSystemStateMO setHistoryEvent:](v10, "setHistoryEvent:", v8);
  +[IRSystemStateMO setPropertiesOfSystemStateMO:withSystemState:](IRSystemStateMO, "setPropertiesOfSystemStateMO:withSystemState:", v10, v9);

  return v10;
}

- (id)convert
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  void *v24;

  -[IRSystemStateMO appInFocusBundleID](self, "appInFocusBundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[IRSystemStateMO appInFocusWindowValid](self, "appInFocusWindowValid");
  -[IRSystemStateMO deviceWiFiSSID](self, "deviceWiFiSSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IRSystemStateMO locationSemanticUserSpecificPlaceType](self, "locationSemanticUserSpecificPlaceType");
  -[IRSystemStateMO locationSemanticLoiIdentifier](self, "locationSemanticLoiIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSystemStateMO iCloudId](self, "iCloudId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSystemStateMO avInitialRouteSharingPolicy](self, "avInitialRouteSharingPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSystemStateMO mediaRouteGroupLeaderOutputDeviceID](self, "mediaRouteGroupLeaderOutputDeviceID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IRSystemStateMO timeZoneSeconds](self, "timeZoneSeconds");
  -[IRSystemStateMO outputDeviceName](self, "outputDeviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IRSystemStateMO outputDeviceType](self, "outputDeviceType");
  v5 = -[IRSystemStateMO outputDeviceSubType](self, "outputDeviceSubType");
  -[IRSystemStateMO predictedOutputDeviceName](self, "predictedOutputDeviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IRSystemStateMO predictedOutputDeviceType](self, "predictedOutputDeviceType");
  v8 = -[IRSystemStateMO predictedOutputDeviceSubType](self, "predictedOutputDeviceSubType");
  v9 = -[IRSystemStateMO appInFocusWindowScreenUnlockEvent](self, "appInFocusWindowScreenUnlockEvent");
  v10 = -[IRSystemStateMO pdrFenceActive](self, "pdrFenceActive");
  -[IRSystemStateMO latestPickerChoiceDate](self, "latestPickerChoiceDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = -[IRSystemStateMO isContinuityDisplay](self, "isContinuityDisplay");
  BYTE1(v14) = v10;
  LOBYTE(v14) = v9;
  +[IRSystemStateDO systemStateDOWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:](IRSystemStateDO, "systemStateDOWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", v24, v23, v22, v21, v20, v19, v18, v17, v16, v3, v4, v5, v6, v7,
    v8,
    v14,
    v11,
    v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRSystemStateMO"));
}

@end
