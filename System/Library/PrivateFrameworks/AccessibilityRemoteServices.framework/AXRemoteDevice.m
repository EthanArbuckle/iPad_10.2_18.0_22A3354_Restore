@implementation AXRemoteDevice

- (AXRemoteDevice)initWithDevice:(id)a3
{
  id v4;
  AXRemoteDevice *v5;
  AXRemoteDevice *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXRemoteDevice;
  v5 = -[AXRemoteDevice init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXRemoteDevice setDevice:](v5, "setDevice:", v4);
    v7 = (void *)objc_opt_new();
    -[AXRemoteDevice setDeviceGestureCustomizations:](v6, "setDeviceGestureCustomizations:", v7);

  }
  return v6;
}

- (NSString)displayName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[AXRemoteDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("<unknown>");
  v5 = v3;

  return v5;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[AXRemoteDevice device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)remoteActionsForPreferredContextType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXRemoteDevice deviceRemoteActions](self, "deviceRemoteActions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = (id)MEMORY[0x24BDBD1A8];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "preferredContextType") == a3)
        {
          objc_msgSend(v10, "remoteActions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
        if (!objc_msgSend(v10, "preferredContextType"))
        {
          objc_msgSend(v10, "remoteActions");
          v11 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v8 = (id)MEMORY[0x24BDBD1A8];
  }

  v8 = v8;
  v12 = v8;
LABEL_15:

  return v12;
}

- (id)customizedRemoteActionForHandGestureEventUsage:(int64_t)a3
{
  const __CFString *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  if ((unint64_t)(a3 - 2) > 2)
    v3 = CFSTR("clench");
  else
    v3 = off_24D99AFA0[a3 - 2];
  -[AXRemoteDevice deviceGestureCustomizations](self, "deviceGestureCustomizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = CFSTR("None");
  if (v5)
    v6 = v5;
  v7 = v6;

  return v7;
}

- (void)_setRemoteAction:(id)a3 forHandGestureEventUsage:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((unint64_t)(a4 - 2) > 2)
    v7 = CFSTR("clench");
  else
    v7 = off_24D99AFA0[a4 - 2];
  -[AXRemoteDevice deviceGestureCustomizations](self, "deviceGestureCustomizations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if ((v10 & 1) == 0)
  {
    -[AXRemoteDevice deviceGestureCustomizations](self, "deviceGestureCustomizations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v7);

    v14 = CFSTR("HandGestureCustomizedActions");
    -[AXRemoteDevice deviceGestureCustomizations](self, "deviceGestureCustomizations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteDevice sendPayload:withEventID:](self, "sendPayload:withEventID:", v13, CFSTR("com.apple.AXRemoteServices.DefaultEventID"));

  }
}

- (void)connectIfNecessary:(id)a3
{
  void (**v4)(id, uint64_t);
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  void (**v11)(id, uint64_t);
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = (void (**)(id, uint64_t))a3;
  if (-[AXRemoteDevice connected](self, "connected"))
  {
    v4[2](v4, 1);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
    objc_msgSend(v5, "setServiceType:", CFSTR("com.apple.accessibility.axremoted.rapportWake"));
    -[AXRemoteDevice device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDestinationDevice:", v6);

    objc_initWeak(&location, self);
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __37__AXRemoteDevice_connectIfNecessary___block_invoke;
    v15[3] = &unk_24D99AC80;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v5, "setDeviceLostHandler:", v15);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __37__AXRemoteDevice_connectIfNecessary___block_invoke_2;
    v13[3] = &unk_24D99AE78;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "setDisconnectHandler:", v13);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __37__AXRemoteDevice_connectIfNecessary___block_invoke_3;
    v9[3] = &unk_24D99AEC8;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    v9[4] = self;
    v8 = v5;
    v10 = v8;
    objc_msgSend(v8, "activateWithCompletion:", v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __37__AXRemoteDevice_connectIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "connected"))
    {
      objc_msgSend(v10, "effectiveIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "device");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "effectiveIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "isEqualToString:", v7);

      if (v8)
      {
        objc_msgSend(v4, "connectionDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "remoteDeviceDidUnexpectedlyDisconnect:", v4);

      }
    }
  }

}

void __37__AXRemoteDevice_connectIfNecessary___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "connected");
    v2 = v5;
    if (v3)
    {
      objc_msgSend(v5, "connectionDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteDeviceDidUnexpectedlyDisconnect:", v5);

      v2 = v5;
    }
  }

}

void __37__AXRemoteDevice_connectIfNecessary___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[3];
  _QWORD v18[3];
  const __CFString *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ax_remote_connection_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(WeakRetained, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_218A93000, v4, OS_LOG_TYPE_INFO, "Connected to device: %@ with error: %@", buf, 0x16u);

  }
  if (v3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v19 = CFSTR("requestsVoiceOverEnabled");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSVoiceOverTouchEnabled());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x24BDBD1C8];
    v17[0] = CFSTR("isConnecting");
    v17[1] = CFSTR("connectingDeviceName");
    objc_msgSend(a1[4], "_deviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v9;
    v17[2] = CFSTR("connectingDeviceOptions");
    v18[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = a1[5];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __37__AXRemoteDevice_connectIfNecessary___block_invoke_6;
    v12[3] = &unk_24D99AEA0;
    objc_copyWeak(&v16, a1 + 7);
    v13 = 0;
    v15 = a1[6];
    v14 = a1[5];
    objc_msgSend(v11, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.AXRemoteServices.ConnectionSetup"), v10, 0, v12);

    objc_destroyWeak(&v16);
  }

}

void __37__AXRemoteDevice_connectIfNecessary___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  AXRDeviceRemoteActionSectionContainer *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  ax_remote_connection_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v49 = v9;
    v50 = 2112;
    v51 = v6;
    v52 = 2112;
    v53 = v10;
    _os_log_impl(&dword_218A93000, v7, OS_LOG_TYPE_INFO, "Requested actions from device: %@, response: %@, error: %@", buf, 0x20u);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("remoteActions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HandGestureCustomizedActions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v36 = v14;
    v37 = v13;
    v38 = v12;
    v40 = a1;
    v41 = v6;
    v42 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v39 = v11;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("preferredContextType"), v36);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("actionsList"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v23 = objc_msgSend(v21, "integerValue");
            AXRLocalizedSectionTitleForPreferredContextType(v23);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = -[AXRDeviceRemoteActionSectionContainer initWithLocalizedTitle:preferredContextType:remoteActions:]([AXRDeviceRemoteActionSectionContainer alloc], "initWithLocalizedTitle:preferredContextType:remoteActions:", v24, v23, v22);
            objc_msgSend(v42, "addObject:", v25);

          }
          else
          {
            ax_remote_connection_log();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v20;
              _os_log_fault_impl(&dword_218A93000, v24, OS_LOG_TYPE_FAULT, "unexpected payload data types: %@", buf, 0xCu);
            }
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v17);
    }

    v12 = v38;
    v26 = objc_msgSend(v38, "integerValue");
    v27 = objc_loadWeakRetained((id *)(v40 + 56));
    objc_msgSend(v27, "setDeviceType:", v26);

    v13 = v37;
    v28 = objc_msgSend(v37, "integerValue");
    v29 = objc_loadWeakRetained((id *)(v40 + 56));
    objc_msgSend(v29, "setContextType:", v28);

    v30 = objc_loadWeakRetained((id *)(v40 + 56));
    objc_msgSend(v30, "setDeviceRemoteActions:", v42);

    v31 = objc_loadWeakRetained((id *)(v40 + 56));
    objc_msgSend(v31, "deviceGestureCustomizations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v36;
    objc_msgSend(v32, "addEntriesFromDictionary:", v36);

    v33 = objc_loadWeakRetained((id *)(v40 + 56));
    objc_msgSend(v33, "setConnected:", 1);

    v34 = *(_QWORD *)(v40 + 40);
    v35 = objc_loadWeakRetained((id *)(v40 + 56));
    objc_msgSend(v35, "setDeviceLinkClient:", v34);

    (*(void (**)(void))(*(_QWORD *)(v40 + 48) + 16))();
    v6 = v41;
    v11 = v39;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)_deviceName
{
  void *v2;

  v2 = (void *)MGGetStringAnswer();
  if (!v2)
    v2 = (void *)MGGetStringAnswer();
  return v2;
}

- (void)disconnect
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = MEMORY[0x24BDBD1C0];
  v9[0] = CFSTR("isConnecting");
  v9[1] = CFSTR("connectingDeviceName");
  -[AXRemoteDevice _deviceName](self, "_deviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[AXRemoteDevice deviceLinkClient](self, "deviceLinkClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__AXRemoteDevice_disconnect__block_invoke;
  v6[3] = &unk_24D99AEF0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.AXRemoteServices.ConnectionSetup"), v4, 0, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __28__AXRemoteDevice_disconnect__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deviceLinkClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setDeviceLinkClient:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setConnected:", 0);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setContextType:", 0);

}

- (void)sendPayload:(id)a3 withEventID:(id)a4
{
  -[AXRemoteDevice sendPayload:withEventID:withTimeout:completion:](self, "sendPayload:withEventID:withTimeout:completion:", a3, a4, &__block_literal_global_0, 2.0);
}

- (void)sendPayload:(id)a3 withEventID:(id)a4 withTimeout:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  ax_remote_connection_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    v26 = 2048;
    v27 = a5;
    _os_log_impl(&dword_218A93000, v13, OS_LOG_TYPE_INFO, "sending payload: %@, eventID: %@, timeout %.2fs", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke;
  v17[3] = &unk_24D99AF80;
  v14 = v12;
  v20 = v14;
  v21[1] = *(id *)&a5;
  objc_copyWeak(v21, (id *)buf);
  v15 = v11;
  v18 = v15;
  v16 = v10;
  v19 = v16;
  -[AXRemoteDevice connectIfNecessary:](self, "connectIfNecessary:", v17);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);

}

void __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = MEMORY[0x24BDBD1C8];
    v4 = *MEMORY[0x24BE7CCC0];
    v17[0] = *MEMORY[0x24BE7CCB8];
    v17[1] = v4;
    v18[0] = MEMORY[0x24BDBD1C8];
    v18[1] = MEMORY[0x24BDBD1C8];
    v17[2] = *MEMORY[0x24BE7CD18];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE7CC98];
    v18[2] = v5;
    v18[3] = v3;
    v7 = *MEMORY[0x24BE7CCA0];
    v17[3] = v6;
    v17[4] = v7;
    v18[4] = &unk_24D99CD00;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "deviceLinkClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *MEMORY[0x24BE7CC80];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke_18;
    v15[3] = &unk_24D99AF58;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v10, "sendEventID:event:destinationID:options:completion:", v11, v12, v13, v8, v15);

  }
  else
  {
    ax_remote_connection_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke_cold_1(v14);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ax_remote_connection_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_218A93000, v4, OS_LOG_TYPE_INFO, "event sent with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 == 0);
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int64_t)a3
{
  self->_contextType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (NSArray)deviceRemoteActions
{
  return self->_deviceRemoteActions;
}

- (void)setDeviceRemoteActions:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRemoteActions, a3);
}

- (AXRemoteDeviceConnectionDelegate)connectionDelegate
{
  return (AXRemoteDeviceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_connectionDelegate);
}

- (void)setConnectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_connectionDelegate, a3);
}

- (NSMutableDictionary)deviceGestureCustomizations
{
  return self->_deviceGestureCustomizations;
}

- (void)setDeviceGestureCustomizations:(id)a3
{
  objc_storeStrong((id *)&self->_deviceGestureCustomizations, a3);
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (RPCompanionLinkClient)deviceLinkClient
{
  return self->_deviceLinkClient;
}

- (void)setDeviceLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLinkClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLinkClient, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceGestureCustomizations, 0);
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_deviceRemoteActions, 0);
}

void __65__AXRemoteDevice_sendPayload_withEventID_withTimeout_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218A93000, log, OS_LOG_TYPE_ERROR, "failed to send payload (not connected)", v1, 2u);
}

@end
