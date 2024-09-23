@implementation ComponentSystemAirPods

- (void)bluetoothManagerDidBecomeAvailable
{
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase getPairedAppleAudioDevices](self, "getPairedAppleAudioDevices"));
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "connected", (_QWORD)v16))
        {
          -[ComponentSystemAirPods setDevice:](self, "setDevice:", v8);
          v14 = DiagnosticLogHandleForCategory(6, v13);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v8;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Running System Report for device: %@", buf, 0xCu);
          }

          v12 = v3;
          goto LABEL_15;
        }
      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v5)
        continue;
      break;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  if (!v9)
  {
    v11 = DiagnosticLogHandleForCategory(6, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No Apple Audio Devices are currently connected", buf, 2u);
    }
LABEL_15:

  }
}

- (BOOL)isPresent
{
  ComponentSystemAirPods *v2;
  NSObject *v3;
  dispatch_time_t v4;
  void *v5;

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase btManagerAvailableSemaphore](self, "btManagerAvailableSemaphore"));
  v4 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v3, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](v2, "device"));
  LOBYTE(v2) = v5 != 0;

  return (char)v2;
}

- (void)populateAttributes:(id)a3
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
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  unsigned __int8 v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  unsigned int v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint8_t buf[4];
  void *v75;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("MACAddress"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("name"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "productName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("productName"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "productId")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("prodId"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "connected")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("isConnected"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v15, "isTemporaryPaired")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("isTempPaired"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v17, "inEarDetectEnabled")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("inEarDetectEnabled"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase stringForListeningMode:](self, "stringForListeningMode:", objc_msgSend(v19, "listeningMode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("listeningMode"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase generationStringForProductId:](self, "generationStringForProductId:", objc_msgSend(v21, "productId")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("generation"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods diagnosticsVersion](self, "diagnosticsVersion"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("diagnosticsVersion"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "address"));
  v27 = objc_msgSend(v24, "activeHearingProtectionAvailableForAddress:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  if (objc_msgSend(v28, "getAdaptiveVolumeSupport"))
  {

  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
    v30 = objc_msgSend(v29, "getConversationDetectSupport") | v27;

    if (v30 != 1)
      goto LABEL_5;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase audioOutputForDevice:](self, "audioOutputForDevice:", v31));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("Audio"));

LABEL_5:
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v34 = -[ComponentAirPodsBase spatialAudioSupportedForDevice:](self, "spatialAudioSupportedForDevice:", v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v34));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("spatialAudioSupported"));

  if (v34)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentAirPodsBase spatialAudioEnabled](self, "spatialAudioEnabled")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("spatialAudioEnabled"));

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase inEarStatusForDevice:](self, "inEarStatusForDevice:", v37));

  if (v38 && objc_msgSend(v38, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("inEarStatus"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase budSide:](self, "budSide:", v39));

  if (v40 && objc_msgSend(v40, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("BudSide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "address"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase getBatteryInfoForAddress:](self, "getBatteryInfoForAddress:", v42));

  if (v43 && objc_msgSend(v43, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("batteryInfo"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v45 = objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase getAutoEQStateForDevice:](self, "getAutoEQStateForDevice:", v44));

  v72 = (void *)v45;
  objc_msgSend(v4, "addEntriesFromDictionary:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v47 = objc_msgSend(v46, "isTemporaryPaired");

  v73 = v38;
  if ((v47 & 1) != 0)
  {
    v49 = DiagnosticLogHandleForCategory(6, v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Not surfacing AACPInfo dictionary for this device because it is temp paired", buf, 2u);
    }

  }
  else
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "accessoryInfo"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase aacpInfoFromAccessoryInfo:](self, "aacpInfoFromAccessoryInfo:", v52));

    if (v53)
    {
      objc_msgSend(v4, "addEntriesFromDictionary:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods serialNumberFromAacpInfo:](self, "serialNumberFromAacpInfo:", v53));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, CFSTR("serialNumber"));

    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "accessoryInfo"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase caseInfoFromAccessoryInfo:](self, "caseInfoFromAccessoryInfo:", v56));

    if (v57)
      objc_msgSend(v4, "addEntriesFromDictionary:", v57);

  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase getCBDevices](self, "getCBDevices"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemSerialNumber")));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v60, "isGenuineAirPods")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v61, CFSTR("authPassed"));

  if (v59)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKey:", v59));
    v63 = v62;
    if (v62)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v62, "gapaFlags")));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v64, CFSTR("authErrorCode"));

      v65 = 1;
    }
    else
    {
      v65 = 0;
    }
  }
  else
  {
    v65 = 0;
    v63 = 0;
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
  v67 = objc_msgSend(v66, "connected");

  if (v65 && v67)
  {
    v69 = objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase microphoneCalibrationResultForDevice:](self, "microphoneCalibrationResultForDevice:", v63));
    if (v69)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v69, CFSTR("micCalibration"));
  }
  else
  {
    v70 = DiagnosticLogHandleForCategory(6, v68);
    v69 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSystemAirPods device](self, "device"));
      *(_DWORD *)buf = 138412290;
      v75 = v71;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Device %@ is not connected, not attempting to read micrphone calibration data", buf, 0xCu);

    }
  }

}

- (id)serialNumberFromAacpInfo:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = CFSTR("systemSerialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("systemSerialNumber")));

  if (!v5)
  {
    v4 = CFSTR("leftBudSerialNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("leftBudSerialNumber")));

    if (!v6)
      v4 = CFSTR("rightBudSerialNumber");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  return v7;
}

- (id)diagnosticsVersion
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v10;
  const char *v11;

  v2 = DiagnosticLogHandleForCategory(6, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ComponentSystemAirPods diagnosticsVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString")));
  v7 = stringOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (BluetoothDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
