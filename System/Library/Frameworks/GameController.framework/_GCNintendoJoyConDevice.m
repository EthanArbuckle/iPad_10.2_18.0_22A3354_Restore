@implementation _GCNintendoJoyConDevice

- (_GCNintendoJoyConDevice)initWithHIDDevice:(id)a3 manager:(id)a4 type:(unsigned __int8)a5
{
  id v9;
  id v10;
  _GCNintendoJoyConDevice *v11;
  _GCNintendoJoyConDevice *v12;
  uint64_t v13;
  NSObject *identifier;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSMapTable *clients;
  uint64_t v19;
  NSMapTable *clientPlayerIndicatorEndpoints;
  GCDeviceBattery *v21;
  double v22;
  uint64_t v23;
  GCDeviceBattery *battery;
  uint64_t v25;
  NSMapTable *clientBatteryEndpoints;
  NSObject *v28;
  NSObject *v29;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)_GCNintendoJoyConDevice;
  v11 = -[_GCNintendoJoyConDevice init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceInfo, a3);
    objc_storeWeak((id *)&v12->_manager, v10);
    v12->_type = a5;
    objc_msgSend(v9, "stringPropertyForKey:", CFSTR("SerialNumber"));
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = v13;

    if (!v12->_identifier)
    {
      +[NSUUID UUID](&off_254DEEE48, "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v12->_identifier;
      v12->_identifier = v15;

      if (gc_isInternalBuild())
      {
        getGCLogger();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v12->_identifier;
          *(_DWORD *)buf = 138412546;
          v32 = v9;
          v33 = 2112;
          v34 = v29;
          _os_log_impl(&dword_215181000, v28, OS_LOG_TYPE_DEFAULT, "Could not fetch identifier for service: %@.  Using temporary identifier: %@", buf, 0x16u);
        }

      }
    }
    +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    clients = v12->_clients;
    v12->_clients = (NSMapTable *)v17;

    v12->_indicatedPlayerIndex = -1;
    +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    clientPlayerIndicatorEndpoints = v12->_clientPlayerIndicatorEndpoints;
    v12->_clientPlayerIndicatorEndpoints = (NSMapTable *)v19;

    v21 = [GCDeviceBattery alloc];
    LODWORD(v22) = 0;
    v23 = -[GCDeviceBattery initWithLevel:batteryState:](v21, "initWithLevel:batteryState:", -1, v22);
    battery = v12->_battery;
    v12->_battery = (GCDeviceBattery *)v23;

    +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
    v25 = objc_claimAutoreleasedReturnValue();
    clientBatteryEndpoints = v12->_clientBatteryEndpoints;
    v12->_clientBatteryEndpoints = (NSMapTable *)v25;

  }
  return v12;
}

- (_GCNintendoJoyConDevice)init
{
  -[_GCNintendoJoyConDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)setDriverConnection:(id)a3
{
  id v5;
  id driverConnectionInvalidationRegistration;
  _GCDeviceDriverConnection *driverConnection;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _GCNintendoJoyConDevice *v15;
  id v16;
  _QWORD activity_block[4];
  id v18;
  _GCNintendoJoyConDevice *v19;
  id location;
  _QWORD v21[5];

  v5 = a3;
  driverConnectionInvalidationRegistration = self->_driverConnectionInvalidationRegistration;
  self->_driverConnectionInvalidationRegistration = 0;

  driverConnection = self->_driverConnection;
  self->_driverConnection = 0;

  objc_storeStrong((id *)&self->_driverConnection, a3);
  v8 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke;
  v21[3] = &unk_24D2B2B20;
  v21[4] = self;
  objc_msgSend(v5, "addInvalidationHandler:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_driverConnectionInvalidationRegistration;
  self->_driverConnectionInvalidationRegistration = v9;

  objc_initWeak(&location, self);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_2;
  activity_block[3] = &unk_24D2B2B48;
  v11 = v5;
  v18 = v11;
  v19 = self;
  _os_activity_initiate(&dword_215181000, "Connect JoyCon Fusion Gesture Service", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __47___GCNintendoJoyConDevice_setDriverConnection___block_invoke_69;
  v13[3] = &unk_24D2B3E80;
  v14 = v11;
  v15 = self;
  v12 = v11;
  objc_copyWeak(&v16, &location);
  _os_activity_initiate(&dword_215181000, "Connect Battery Service", OS_ACTIVITY_FLAG_DEFAULT, v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

- (unsigned)inputMode
{
  id v2;
  unsigned __int8 v3;

  -[GCHIDServiceInfo stringPropertyForKey:](self->_serviceInfo, "stringPropertyForKey:", CFSTR("JoyConInputMode"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("HID")) & 1) == 0)
  {
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("STANDARD-FULL")))
    {
      v3 = 48;
      goto LABEL_7;
    }
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  v3 = 63;
LABEL_7:

  return v3;
}

- (void)setInputMode:(unsigned __int8)a3
{
  uint64_t v3;
  __IOHIDServiceClient *v4;
  __CFString *v5;
  void *v6;

  v3 = a3;
  v4 = (__IOHIDServiceClient *)-[GCHIDServiceInfo service](self->_serviceInfo, "service");
  if ((_DWORD)v3 == 63)
  {
    v5 = CFSTR("HID");
  }
  else if ((_DWORD)v3 == 48)
  {
    v5 = CFSTR("STANDARD-FULL");
  }
  else
  {
    +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  IOHIDServiceClientSetProperty(v4, CFSTR("JoyConInputMode"), v5);
}

- ($536A88BB5CAE6CA76785073378A79450)bodyColor
{
  void *v2;
  unsigned __int16 v4;
  unsigned __int8 v5;

  -[GCHIDServiceInfo dictionaryPropertyForKey:](self->_serviceInfo, "dictionaryPropertyForKey:", CFSTR("JoyConBodyColorInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0;
  DecodeJoyConRGBColor(v2, &v4);

  return ($536A88BB5CAE6CA76785073378A79450)(v4 | (v5 << 16));
}

- ($536A88BB5CAE6CA76785073378A79450)buttonsColor
{
  void *v2;
  unsigned __int16 v4;
  unsigned __int8 v5;

  -[GCHIDServiceInfo dictionaryPropertyForKey:](self->_serviceInfo, "dictionaryPropertyForKey:", CFSTR("JoyConButtonsColorInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0;
  DecodeJoyConRGBColor(v2, &v4);

  return ($536A88BB5CAE6CA76785073378A79450)(v4 | (v5 << 16));
}

- (NSSet)components
{
  return +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", self);
}

- (id)propertyForKey:(id)a3
{
  GCHIDServiceInfo *serviceInfo;
  __CFString *v4;
  void *v5;

  serviceInfo = self->_serviceInfo;
  v4 = (__CFString *)a3;
  v5 = (void *)IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)-[GCHIDServiceInfo service](serviceInfo, "service"), v4);

  return v5;
}

- (NSSet)underlyingDevices
{
  return +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", self);
}

- (void)activateLogical
{
  -[_GCNintendoJoyConDevice setInputMode:](self, "setInputMode:", 63);
}

- (void)playerIndicatorXPCProxyServerEndpoint:(id)a3 didReceivePlayerIndexChange:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[_GCNintendoJoyConDevice setIndicatedPlayerIndex:](self, "setIndicatedPlayerIndex:", a4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_clientPlayerIndicatorEndpoints, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setPlayerIndex:", a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 104, 1);
}

- (_GCDeviceManager)manager
{
  return (_GCDeviceManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (unsigned)type
{
  return self->_type;
}

- (_GCDeviceDriverConnection)driverConnection
{
  return self->_driverConnection;
}

- (_GCDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (_GCNintendoFusedJoyConDevice)fusionDevice
{
  return (_GCNintendoFusedJoyConDevice *)objc_loadWeakRetained((id *)&self->_fusionDevice);
}

- (void)setFusionDevice:(id)a3
{
  objc_storeWeak((id *)&self->_fusionDevice, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fusionDevice);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientBatteryEndpoints, 0);
  objc_storeStrong((id *)&self->_battery, 0);
  objc_storeStrong((id *)&self->_batteryServiceServer, 0);
  objc_storeStrong(&self->_batteryComponentBatteryUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_clientPlayerIndicatorEndpoints, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong(&self->_driverConnectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_driverConnection, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)_addClient:(id)a3
{
  id v4;
  _GCNintendoJoyConDevice *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id from;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    -[NSMapTable objectForKey:](v5->_clients, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_initWeak(&location, v5);
      objc_initWeak(&from, v4);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __46___GCNintendoJoyConDevice_Client___addClient___block_invoke;
      v9[3] = &unk_24D2B3EA8;
      objc_copyWeak(&v10, &location);
      objc_copyWeak(&v11, &from);
      objc_msgSend(v4, "addInvalidationHandler:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[NSMapTable setObject:forKey:](v5->_clients, "setObject:forKey:", v7, v4);
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            -[_GCNintendoJoyConDevice(Client) _addClient:].cold.1();

        }
      }

      objc_destroyWeak(&v11);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  objc_sync_exit(v5);

}

- (void)_removeClient:(id)a3
{
  id v4;
  _GCNintendoJoyConDevice *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    -[NSMapTable objectForKey:](v5->_clients, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSMapTable removeObjectForKey:](v5->_clientPlayerIndicatorEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientBatteryEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clients, "removeObjectForKey:", v4);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[_GCNintendoJoyConDevice(Client) _removeClient:].cold.1();

      }
    }
  }
  objc_sync_exit(v5);

}

- (id)makeControllerForClient:(id)a3
{
  GCProductInformation *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _GCControllerComponentDescription *v11;
  GCDeviceButtonInputDescription *v12;
  GCDeviceButtonInputDescription *v13;
  GCDeviceButtonInputDescription *v14;
  GCDeviceButtonInputDescription *v15;
  GCDeviceButtonInputDescription *v16;
  GCDeviceButtonInputDescription *v17;
  GCDeviceButtonInputDescription *v18;
  GCDeviceButtonInputDescription *v19;
  GCDeviceDirectionPadDescription *v20;
  _GCDeviceGamepadComponentDescription *v21;
  void *v22;
  void *v23;
  _GCDeviceGamepadComponentDescription *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _GCControllerInputComponentDescription *v52;
  void *v53;
  _GCControllerInputComponentDescription *v54;
  _GCNintendoJoyConDevice *v55;
  GCPlayerIndicatorXPCProxyServerEndpoint *v56;
  GCPlayerIndicatorXPCProxyServerEndpoint *v57;
  void *v58;
  void *v59;
  void *v60;
  id *v61;
  GCBatteryXPCProxyServerEndpoint *v62;
  GCBatteryXPCProxyServerEndpoint *v63;
  void *v64;
  void *v65;
  void *v66;
  GCHapticCapabilities *v67;
  void *v68;
  void *v69;
  GCHapticCapabilities *v70;
  _GCControllerComponentDescription *v71;
  _GCControllerDescription *v72;
  void *v73;
  _GCControllerDescription *v74;
  GCDeviceButtonInputDescription *v76;
  GCDeviceButtonInputDescription *v77;
  void *v78;
  id v79;
  _GCNintendoJoyConDevice *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[9];
  void *v87;
  _QWORD v88[11];

  v88[9] = *MEMORY[0x24BDAC8D0];
  v79 = a3;
  v80 = self;
  -[_GCNintendoJoyConDevice _addClient:](self, "_addClient:");
  +[NSMutableArray array](&off_254DEBB20, "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GCProductInformation initWithIdentifier:]([GCProductInformation alloc], "initWithIdentifier:", CFSTR("ProductInfo"));
  -[GCHIDServiceInfo stringPropertyForKey:](v80->_serviceInfo, "stringPropertyForKey:", CFSTR("Product"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCProductInformation setVendorName:](v5, "setVendorName:", v6);

  v7 = -[_GCNintendoJoyConDevice type](v80, "type");
  if (v7 == 1)
  {
    v8 = CFSTR("Nintendo Switch Joy-Con (L)");
  }
  else if (v7 == 2)
  {
    v8 = CFSTR("Nintendo Switch Joy-Con (R)");
  }
  else
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v80, CFSTR("_GCNintendoJoyConDevice.m"), 231, CFSTR("Unexpected type!"));

    v8 = CFSTR("Nintendo Switch Joy-Con");
  }
  -[GCProductInformation setProductCategory:](v5, "setProductCategory:", v8);
  -[GCProductInformation productCategory](v5, "productCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCProductInformation setDetailedProductCategory:](v5, "setDetailedProductCategory:", v10);

  v11 = -[_GCControllerComponentDescription initWithComponent:bindings:]([_GCControllerComponentDescription alloc], "initWithComponent:bindings:", v5, 0);
  objc_msgSend(v84, "addObject:", v11);

  -[_GCNintendoJoyConDevice gamepadEventSource](v80, "gamepadEventSource");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 4);
  v13 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 5);
  v14 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 6);
  v15 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 7);
  v16 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 8);
  v17 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 9);
  v18 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 23);
  v19 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", 22);
  v20 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:]([GCDeviceDirectionPadDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", 0, 1, 2, 3);
  v21 = [_GCDeviceGamepadComponentDescription alloc];
  v76 = v12;
  v77 = v13;
  v88[0] = v12;
  v88[1] = v13;
  v88[2] = v14;
  v88[3] = v15;
  v88[4] = v16;
  v88[5] = v17;
  v88[6] = v18;
  v88[7] = v19;
  v88[8] = v20;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v88, 9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v82;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v87, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[_GCDevicePhysicalInputComponentDescription initWithIdentifier:elements:bindings:](v21, "initWithIdentifier:elements:bindings:", CFSTR("PhysicalInput"), v22, v23);

  objc_msgSend(v84, "addObject:", v24);
  -[_GCNintendoJoyConDevice gamepadEventSource](v80, "gamepadEventSource");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.a"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setAliases:", v25);

  objc_msgSend(v83, "setLocalizedName:", *MEMORY[0x24BE3A330]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setSymbol:", v26);

  objc_msgSend(v83, "setEventPressedValueField:", 4);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.b"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button B"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setAliases:", v27);

  objc_msgSend(v81, "setLocalizedName:", *MEMORY[0x24BE3A338]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("b.circle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setSymbol:", v28);

  objc_msgSend(v81, "setEventPressedValueField:", 5);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.x"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button X"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAliases:", v30);

  objc_msgSend(v29, "setLocalizedName:", *MEMORY[0x24BE3A3A0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("x.circle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSymbol:", v31);

  objc_msgSend(v29, "setEventPressedValueField:", 6);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.y"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Y"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAliases:", v33);

  objc_msgSend(v32, "setLocalizedName:", *MEMORY[0x24BE3A3A8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("y.circle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setSymbol:", v34);

  objc_msgSend(v32, "setEventPressedValueField:", 7);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.l"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Shoulder"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAliases:", v36);

  objc_msgSend(v35, "setLocalizedName:", *MEMORY[0x24BE3A478]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l1.rectangle.roundedbottom"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setSymbol:", v37);

  objc_msgSend(v35, "setEventPressedValueField:", 8);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.r"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Shoulder"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAliases:", v39);

  objc_msgSend(v38, "setLocalizedName:", *MEMORY[0x24BE3A510]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r1.rectangle.roundedbottom"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSymbol:", v40);

  objc_msgSend(v38, "setEventPressedValueField:", 9);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.start"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAliases:", v42);

  objc_msgSend(v41, "setLocalizedName:", *MEMORY[0x24BE3A378]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("line.horizontal.3.circle"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setSymbol:", v43);

  objc_msgSend(v41, "setEventPressedValueField:", 23);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.home"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Home"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAliases:", v45);

  objc_msgSend(v44, "setLocalizedName:", *MEMORY[0x24BE3A340]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("house.circle"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setSymbol:", v46);

  objc_msgSend(v44, "setEventPressedValueField:", 22);
  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("dpad"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAliases:", v48);

  objc_msgSend(v47, "setLocalizedName:", *MEMORY[0x24BE3A3B0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setSymbol:", v49);

  objc_msgSend(v47, "setAnalog:", 0);
  objc_msgSend(v47, "setEventUpValueField:", 0);
  objc_msgSend(v47, "setEventDownValueField:", 1);
  objc_msgSend(v47, "setEventLeftValueField:", 2);
  objc_msgSend(v47, "setEventRightValueField:", 3);
  v50 = (void *)objc_opt_new();
  v86[0] = v83;
  v86[1] = v81;
  v86[2] = v29;
  v86[3] = v32;
  v86[4] = v35;
  v86[5] = v38;
  v86[6] = v41;
  v86[7] = v44;
  v86[8] = v47;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v86, 9);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setElements:", v51);

  v52 = [_GCControllerInputComponentDescription alloc];
  v85 = v78;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v85, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:](v52, "initWithIdentifier:controllerInputs:bindings:", CFSTR("Input"), v50, v53);

  objc_msgSend(v84, "addObject:", v54);
  v55 = v80;
  objc_sync_enter(v55);
  -[NSMapTable objectForKey:](v55->_clientPlayerIndicatorEndpoints, "objectForKey:", v79);
  v56 = (GCPlayerIndicatorXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
  if (!v56)
  {
    v57 = [GCPlayerIndicatorXPCProxyServerEndpoint alloc];
    +[NSUUID UUID](&off_254DEEE48, "UUID");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[GCPlayerIndicatorXPCProxyServerEndpoint initWithIdentifier:initialValue:](v57, "initWithIdentifier:initialValue:", v58, v55->_indicatedPlayerIndex);

    -[GCPlayerIndicatorXPCProxyServerEndpoint setDelegate:](v56, "setDelegate:", v55);
    -[NSMapTable setObject:forKey:](v55->_clientPlayerIndicatorEndpoints, "setObject:forKey:", v56, v79);
    objc_msgSend(v79, "IPCObjectRegistry");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "registerIPCObject:", v56);

  }
  -[GCPlayerIndicatorXPCProxyServerEndpoint receiverDescription](v56, "receiverDescription");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v60);

  objc_sync_exit(v55);
  v61 = v55;
  objc_sync_enter(v61);
  objc_msgSend(v61[11], "objectForKey:", v79);
  v62 = (GCBatteryXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
  if (!v62)
  {
    v63 = [GCBatteryXPCProxyServerEndpoint alloc];
    +[NSUUID UUID](&off_254DEEE48, "UUID");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[GCBatteryXPCProxyServerEndpoint initWithIdentifier:initialValue:](v63, "initWithIdentifier:initialValue:", v64, v61[10]);

    -[GCBatteryXPCProxyServerEndpoint setDelegate:](v62, "setDelegate:", v61);
    objc_msgSend(v61[11], "setObject:forKey:", v62, v79);
    objc_msgSend(v79, "IPCObjectRegistry");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "registerIPCObject:", v62);

  }
  -[GCBatteryXPCProxyServerEndpoint receiverDescription](v62, "receiverDescription");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "addObject:", v66);

  objc_sync_exit(v61);
  v67 = [GCHapticCapabilities alloc];
  objc_msgSend(v61, "hapticEngines");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "hapticCapabilityGraph");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[GCHapticCapabilities initWithIdentifier:hapticEnginesInfo:hapticCapabilityGraph:](v67, "initWithIdentifier:hapticEnginesInfo:hapticCapabilityGraph:", CFSTR("HapticCapabilities"), v68, v69);

  v71 = -[_GCControllerComponentDescription initWithComponent:bindings:]([_GCControllerComponentDescription alloc], "initWithComponent:bindings:", v70, 0);
  objc_msgSend(v84, "addObject:", v71);

  v72 = [_GCControllerDescription alloc];
  objc_msgSend(v61, "identifier");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[_GCControllerDescription initWithIdentifier:components:](v72, "initWithIdentifier:components:", v73, v84);

  return v74;
}

- (_GCGamepadEventSourceDescription)gamepadEventSource
{
  _GCCControllerManagerDescription *v3;
  _GCCControllerHIDServiceInfoDescription *v4;
  _GCKeyboardEventHIDAdapterDescription *v5;
  _GCGamepadEventGamepadHIDAdapterDescription *v6;
  void *v7;
  _GCGamepadEventKeyboardEventAdapterDescription *v8;
  _GCGamepadEventFusionConfig *v9;
  uint64_t i;
  _BOOL8 v12;
  _GCGamepadEventFusionDescription *v13;
  void *v14;
  _GCGamepadEventFusionDescription *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(_GCCControllerManagerDescription);
  v4 = -[_GCCControllerHIDServiceInfoDescription initWithServiceInfo:]([_GCCControllerHIDServiceInfoDescription alloc], "initWithServiceInfo:", self->_serviceInfo);
  v5 = -[_GCKeyboardEventHIDAdapterDescription initWithSource:service:]([_GCKeyboardEventHIDAdapterDescription alloc], "initWithSource:service:", v3, v4);
  v6 = -[_GCGamepadEventGamepadHIDAdapterDescription initWithSource:service:]([_GCGamepadEventGamepadHIDAdapterDescription alloc], "initWithSource:service:", v3, v4);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "mapUsagePage:usage:toGamepadElement:", 12, 547, 22);
  objc_msgSend(v7, "mapUsagePage:usage:toGamepadElement:", 12, 516, 23);
  objc_msgSend(v7, "mapUsagePage:usage:toGamepadElement:", 12, 521, 24);
  objc_msgSend(v7, "mapUsagePage:usage:toGamepadElement:", 12, 178, 40);
  v8 = -[_GCGamepadEventKeyboardEventAdapterDescription initWithConfiguration:source:]([_GCGamepadEventKeyboardEventAdapterDescription alloc], "initWithConfiguration:source:", v7, v5);
  v9 = -[_GCGamepadEventFusionConfig initWithSourceCount:]([_GCGamepadEventFusionConfig alloc], "initWithSourceCount:", 2);
  for (i = 0; i != 47; ++i)
  {
    v12 = ((i - 24) & 0xFFFFFFFFFFFFFFEFLL) != 0 && (i & 0x7FFFFFFFFFFFFFFELL) != 22;
    -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v9, "setPassRule:forElement:forSourceAtIndex:", 1, i, v12);
  }
  v13 = [_GCGamepadEventFusionDescription alloc];
  v17[0] = v8;
  v17[1] = v6;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_GCGamepadEventFusionDescription initWithConfiguration:sources:](v13, "initWithConfiguration:sources:", v9, v14);

  return (_GCGamepadEventSourceDescription *)v15;
}

- (int64_t)indicatedPlayerIndex
{
  return self->_indicatedPlayerIndex;
}

- (void)setIndicatedPlayerIndex:(int64_t)a3
{
  int64_t v3;
  __IOHIDServiceClient *v4;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  self->_indicatedPlayerIndex = a3;
  v3 = a3 + 1;
  if ((unint64_t)(a3 + 1) <= 8)
  {
    v4 = (__IOHIDServiceClient *)-[GCHIDServiceInfo service](self->_serviceInfo, "service");
    v5 = dword_21526CDE8[v3];
    v17 = CFSTR("LED");
    if (v5 >= 3u)
    {
      +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = off_24D2B3EF0[(char)v5];
    }
    v16[0] = v6;
    if (BYTE1(v5) >= 3u)
    {
      +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = off_24D2B3EF0[SBYTE1(v5)];
    }
    v16[1] = v8;
    if (BYTE2(v5) >= 3u)
    {
      +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = off_24D2B3EF0[SBYTE2(v5)];
    }
    v16[2] = v10;
    if (HIBYTE(v5) >= 3u)
    {
      +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = off_24D2B3EF0[SHIBYTE(v5)];
    }
    v16[3] = v12;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v16, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    IOHIDServiceClientSetProperty(v4, CFSTR("JoyConPlayerLights"), v15);
  }
}

- (id)deviceBatteryComponentBatteryUpdatedHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_batteryComponentBatteryUpdatedHandler, a2);
}

- (void)setDeviceBatteryComponentBatteryUpdatedHandler:(id)a3
{
  void *v4;
  id batteryComponentBatteryUpdatedHandler;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  batteryComponentBatteryUpdatedHandler = self->_batteryComponentBatteryUpdatedHandler;
  self->_batteryComponentBatteryUpdatedHandler = v4;

}

- (id)deviceBatteryServiceConnectedHandler
{
  return 0;
}

- (id)readBattery
{
  dispatch_semaphore_t v3;
  GCBatteryServiceServerInterface *batteryServiceServer;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  batteryServiceServer = self->_batteryServiceServer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50___GCNintendoJoyConDevice_Components__readBattery__block_invoke;
  v9[3] = &unk_24D2B3ED0;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  -[GCBatteryServiceServerInterface readBatteryWithReply:](batteryServiceServer, "readBatteryWithReply:", v9);
  v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)propagateBattery:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[GCDeviceBattery isEqual:](self->_battery, "isEqual:", v5))
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_GCNintendoJoyConDevice(Components) propagateBattery:].cold.1((uint64_t)v5, v11);

    }
    objc_storeStrong((id *)&self->_battery, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMapTable objectEnumerator](self->_clientBatteryEndpoints, "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setBattery:", self->_battery);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    if (self->_batteryComponentBatteryUpdatedHandler)
    {
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __56___GCNintendoJoyConDevice_Components__propagateBattery___block_invoke;
      v12[3] = &unk_24D2B2C50;
      objc_copyWeak(&v13, &location);
      dispatch_async(MEMORY[0x24BDAC9B8], v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

}

- (GCDeviceBattery)battery
{
  return self->_battery;
}

- (NSArray)hapticEngines
{
  int type;
  GCHapticActuator *v3;
  GCHapticActuator **v4;
  void *v5;
  GCHapticActuator *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  type = self->_type;
  if (type == 2)
  {
    v3 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("JoyCon Right"), 1, 1);
    v7 = v3;
    v4 = &v7;
    goto LABEL_5;
  }
  if (type == 1)
  {
    v3 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("JoyCon Left"), 1, 0);
    v8[0] = v3;
    v4 = (GCHapticActuator **)v8;
LABEL_5:
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v5;
  }
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (GCHapticCapabilityGraph)hapticCapabilityGraph
{
  int type;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  GCHapticCapabilityGraph *v6;

  type = self->_type;
  v3 = objc_opt_class();
  if (type == 1)
    v4 = CFSTR("JoyConLeftHapticCapabilityGraph");
  else
    v4 = CFSTR("JoyConRightHapticCapabilityGraph");
  loadNSDictionaryFromJSON(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCHapticCapabilityGraph initWithJSONDictionaryRepresentation:]([GCHapticCapabilityGraph alloc], "initWithJSONDictionaryRepresentation:", v5);

  return v6;
}

- (void)homeButtonLongPressGesture:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62___GCNintendoJoyConDevice_Fusion__homeButtonLongPressGesture___block_invoke;
  v3[3] = &unk_24D2B37E0;
  v3[4] = self;
  v4 = a3;
  _os_activity_initiate(&dword_215181000, "(JoyCon Fusion Gesture Service) Home Button Long Press Gesture", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

- (void)updateBattery:(unsigned __int8)a3 isCharging:(BOOL)a4
{
  GCDeviceBattery *v5;

  v5 = -[GCDeviceBattery initWithLevel:isCharging:]([GCDeviceBattery alloc], "initWithLevel:isCharging:", a3, a4);
  -[_GCNintendoJoyConDevice propagateBattery:](self, "propagateBattery:", v5);

}

- (id)hapticDriver
{
  return (id)-[_GCDeviceDriverConnection remoteProxy](self->_driverConnection, "remoteProxy");
}

@end
