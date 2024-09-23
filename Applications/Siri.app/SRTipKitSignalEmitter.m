@implementation SRTipKitSignalEmitter

+ (void)checkAndEmitSignalsForRequestOptions:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026D18;
  v8[3] = &unk_1001225E8;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  dispatch_async(v6, v8);

}

+ (void)_checkAndEmitHSSignalsWithSource:(id)a3 forRequestOptions:(id)a4
{
  id v5;
  const __CFString *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "isForStark"))
  {
    if (objc_msgSend(v5, "requestSource") == (id)8 || objc_msgSend(v5, "requestSource") == (id)44)
    {
      v6 = CFSTR("com.apple.siri.hs.on.carplay");
LABEL_8:
      v7 = objc_msgSend(objc_alloc((Class)BMDiscoverabilitySignalEvent), "initWithIdentifier:bundleID:context:", v6, CFSTR("com.apple.siri"), 0);
      objc_msgSend(v8, "sendEvent:", v7);

      goto LABEL_9;
    }
    if (objc_msgSend(v5, "requestSource") == (id)10 || objc_msgSend(v5, "requestSource") == (id)43)
    {
      v6 = CFSTR("com.apple.siri.button.on.carplay");
      goto LABEL_8;
    }
  }
LABEL_9:

}

+ (void)_checkAndEmitCarPlayInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 accessoryManager:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  NSObject *v18;
  __CFString *v19;
  uint64_t v20;
  id v21;
  unsigned __int8 v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  NSObject *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "connectedAccessories"));
  v10 = objc_alloc_init((Class)NSData);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v16, "supportsCarPlay", (_QWORD)v30))
        {
          v17 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            v18 = v17;
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "certSerial"));
            *(_DWORD *)buf = 136315394;
            v35 = "+[SRTipKitSignalEmitter _checkAndEmitCarPlayInvocationSourcePerVehicle:forRequestOptions:accessoryManager:]";
            v36 = 2112;
            v37 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s #tipKitSignalEmitter certSerial %@", buf, 0x16u);

          }
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "certSerial"));

          v10 = (id)v20;
          goto LABEL_13;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_13:

  v21 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v21, "setValue:forKey:", v10, CFSTR("certSerial"));
  v22 = objc_msgSend(v8, "isForEyesFree");
  v23 = CFSTR("YES");
  if ((v22 & 1) == 0)
  {
    if (objc_msgSend(v8, "isForBluetoothCar", CFSTR("YES")))
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
  }
  objc_msgSend(v21, "setValue:forKey:", v23, CFSTR("isBluetoothCar"), (_QWORD)v30);
  if (objc_msgSend(v8, "isForStark"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v21, "setValue:forKey:", v24, CFSTR("isCarPlay"));
  if (objc_msgSend(v8, "isForStark"))
  {
    v25 = (uint64_t)objc_msgSend(v8, "requestSource");
    if (v25 > 11)
    {
      switch(v25)
      {
        case 44:
          goto LABEL_29;
        case 43:
          v26 = CFSTR("com.apple.siri.steering.wheel");
          goto LABEL_36;
        case 12:
LABEL_29:
          v26 = CFSTR("com.apple.siri.hs.on.jarvis");
          goto LABEL_36;
      }
    }
    else
    {
      switch(v25)
      {
        case 2:
          v26 = CFSTR("com.apple.siri.lock.button");
          goto LABEL_36;
        case 8:
          v26 = CFSTR("com.apple.siri.hs.on.carplay");
          goto LABEL_36;
        case 10:
          v26 = CFSTR("com.apple.siri.button.on.carplay");
LABEL_36:
          v28 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v35 = "+[SRTipKitSignalEmitter _checkAndEmitCarPlayInvocationSourcePerVehicle:forRequestOptions:accessoryManager:]";
            v36 = 2112;
            v37 = v26;
            v38 = 2112;
            v39 = v21;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s #tipKitSignalEmitter activation source: %@ userInfo: %@", buf, 0x20u);
          }
          v29 = objc_msgSend(objc_alloc((Class)BMDiscoverabilitySignalEvent), "initWithIdentifier:bundleID:context:userInfo:", v26, CFSTR("com.apple.siri"), 0, v21);
          objc_msgSend(v7, "sendEvent:", v29);

          goto LABEL_39;
      }
    }
    v27 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009DEE0(v27);
    v26 = &stru_100125588;
    goto LABEL_36;
  }
LABEL_39:

}

+ (void)_checkAndEmitBluetoothInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 btManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectedDevices", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v16, "ac_isEyesFree") & 1) != 0
          || objc_msgSend(v16, "ac_isBluetoothVehicle"))
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "address"));

          v13 = (void *)v17;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  if (((objc_msgSend(v8, "isForEyesFree") & 1) != 0 || objc_msgSend(v8, "isForBluetoothCar"))&& v13)
  {
    v18 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v18, "setValue:forKey:", v13, CFSTR("btAddress"));
    objc_msgSend(v18, "setValue:forKey:", CFSTR("YES"), CFSTR("isBluetoothCar"));
    objc_msgSend(v18, "setValue:forKey:", CFSTR("NO"), CFSTR("isCarPlay"));
    v19 = (uint64_t)objc_msgSend(v8, "requestSource");
    v20 = &stru_100125588;
    if (v19 > 7)
    {
      if (v19 == 8)
      {
        v20 = CFSTR("com.apple.siri.hs.on.bt");
      }
      else
      {
        if (v19 != 43)
        {
LABEL_24:
          v21 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            sub_10009DF60(v21);
          goto LABEL_28;
        }
        v20 = CFSTR("com.apple.siri.steering.wheel");
      }
    }
    else
    {
      if (v19 != 2)
      {
        if (v19 == 5)
          v20 = CFSTR("com.apple.siri.bt.headset");
        goto LABEL_24;
      }
      v20 = CFSTR("com.apple.siri.lock.button");
    }
LABEL_28:
    v22 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "+[SRTipKitSignalEmitter _checkAndEmitBluetoothInvocationSourcePerVehicle:forRequestOptions:btManager:]";
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s #tipKitSignalEmitter bluetooth car activation source: %@ userInfo: %@", buf, 0x20u);
    }
    v23 = objc_msgSend(objc_alloc((Class)BMDiscoverabilitySignalEvent), "initWithIdentifier:bundleID:context:userInfo:", v20, CFSTR("com.apple.siri"), 0, v18);
    objc_msgSend(v7, "sendEvent:", v23);

  }
}

@end
