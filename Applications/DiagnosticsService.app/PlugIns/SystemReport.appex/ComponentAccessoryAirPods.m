@implementation ComponentAccessoryAirPods

- (void)bluetoothManagerDidBecomeAvailable
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase getPairedAppleAudioDevices](self, "getPairedAppleAudioDevices"));
  -[ComponentAccessoryAirPods setDevices:](self, "setDevices:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase getCBDevices](self, "getCBDevices"));
  -[ComponentAccessoryAirPods setCbDevices:](self, "setCbDevices:", v4);

}

- (BOOL)isPresent
{
  NSObject *v3;
  dispatch_time_t v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase btManagerAvailableSemaphore](self, "btManagerAvailableSemaphore"));
  v4 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v3, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessoryAirPods devices](self, "devices"));
  LOBYTE(v3) = objc_msgSend(v5, "count") != 0;

  return (char)v3;
}

- (void)populateAttributes:(id)a3
{
  void *i;
  void *v5;
  id v6;
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
  unsigned int v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  id obj;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];

  v40 = a3;
  v43 = objc_alloc_init((Class)NSMutableArray);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[ComponentAccessoryAirPods devices](self, "devices"));
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v44)
  {
    v42 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v42)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v6 = objc_alloc_init((Class)NSMutableDictionary);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("MACAddress"));

        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("name"));

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productName"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("productName"));

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "productId")));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("prodId"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "connected")));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("isConnected"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "isTemporaryPaired")));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("isTempPaired"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "inEarDetectEnabled")));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("inEarDetectEnabled"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase inEarStatusForDevice:](self, "inEarStatusForDevice:", v5));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("inEarStatus"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase budSide:](self, "budSide:", v5));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("BudSide"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase generationStringForProductId:](self, "generationStringForProductId:", objc_msgSend(v5, "productId")));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("generation"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase stringForListeningMode:](self, "stringForListeningMode:", objc_msgSend(v5, "listeningMode")));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("listeningMode"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
        v20 = objc_msgSend(v18, "activeHearingProtectionAvailableForAddress:", v19);

        if ((objc_msgSend(v5, "getAdaptiveVolumeSupport") & 1) != 0
          || (objc_msgSend(v5, "getConversationDetectSupport") | v20) == 1)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase audioOutputForDevice:](self, "audioOutputForDevice:", v5));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("Audio"));

        }
        v22 = -[ComponentAirPodsBase spatialAudioSupportedForDevice:](self, "spatialAudioSupportedForDevice:", v5);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v22));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("spatialAudioSupported"));

        if (v22)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentAirPodsBase spatialAudioEnabled](self, "spatialAudioEnabled")));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("spatialAudioEnabled"));

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase getBatteryInfoForAddress:](self, "getBatteryInfoForAddress:", v25));

        if (v26 && objc_msgSend(v26, "count"))
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("batteryInfo"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase getAutoEQStateForDevice:](self, "getAutoEQStateForDevice:", v5));
        objc_msgSend(v6, "addEntriesFromDictionary:", v27);
        if ((objc_msgSend(v5, "isTemporaryPaired") & 1) != 0)
        {
          v28 = DiagnosticLogHandleForCategory(6);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Not surfacing AACPInfo dictionary for this device because it is temp paired", buf, 2u);
          }
        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryInfo"));
          v29 = objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase aacpInfoFromAccessoryInfo:](self, "aacpInfoFromAccessoryInfo:", v30));

          if (v29)
            objc_msgSend(v6, "addEntriesFromDictionary:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryInfo"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase caseInfoFromAccessoryInfo:](self, "caseInfoFromAccessoryInfo:", v31));

          if (v32)
            objc_msgSend(v6, "addEntriesFromDictionary:", v32);

        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemSerialNumber")));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessoryAirPods cbDevices](self, "cbDevices"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v33));

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "isGenuineAirPods")));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("authPassed"));

        if (v33 && v35)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v35, "gapaFlags")));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("authErrorCode"));

        }
        if (objc_msgSend(v5, "connected"))
        {
          v38 = objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase microphoneCalibrationResultForDevice:](self, "microphoneCalibrationResultForDevice:", v35));
          if (v38)
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("micCalibration"));
        }
        else
        {
          v39 = DiagnosticLogHandleForCategory(6);
          v38 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v5;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Device %@ is not connected, not attempting to read micrphone calibration data", buf, 0xCu);
          }
        }

        objc_msgSend(v43, "addObject:", v6);
      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v44);
  }

  objc_msgSend(v40, "setObject:forKeyedSubscript:", v43, CFSTR("AirPods"));
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSDictionary)cbDevices
{
  return self->_cbDevices;
}

- (void)setCbDevices:(id)a3
{
  objc_storeStrong((id *)&self->_cbDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
