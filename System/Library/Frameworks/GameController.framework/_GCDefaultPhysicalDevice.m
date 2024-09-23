@implementation _GCDefaultPhysicalDevice

- (_GCDefaultPhysicalDevice)initWithHIDDevice:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  _GCDefaultPhysicalDevice *v9;
  _GCDefaultPhysicalDevice *v10;
  uint64_t v11;
  NSObject *identifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCDefaultPhysicalDevice;
  v9 = -[_GCDefaultPhysicalDevice init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceInfo, a3);
    objc_storeWeak((id *)&v10->_manager, v8);
    objc_msgSend((id)objc_opt_class(), "identifierForService:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = v11;

    v10->_cachedIntentEvent = -1;
    v10->_cachedGlyphFlags = 0;
    -[_GCDefaultPhysicalDevice _workaround_backbone_97462229:](v10, "_workaround_backbone_97462229:", v7);
  }

  return v10;
}

- (void)_workaround_backbone_97462229:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "numberPropertyForKey:", CFSTR("VendorID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberPropertyForKey:", CFSTR("ProductID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "intValue") == 5901 && objc_msgSend(v6, "intValue") == 1359
    || objc_msgSend(v5, "intValue") == 13706)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "Backbone detected, deploying external accessory glyph workaround...", v9, 2u);
      }

    }
    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_eaAccessoriesDidChange, *MEMORY[0x24BDC7BC8], 0);

    +[GCEAAccessoryManagerWrapper registerForLocalNotificationsWithObserver:](GCEAAccessoryManagerWrapper, "registerForLocalNotificationsWithObserver:", self);
  }

}

- (_GCDefaultPhysicalDevice)init
{
  -[_GCDefaultPhysicalDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  __CFDictionary *powerSourceProperties;
  void *v4;
  objc_super v5;

  powerSourceProperties = self->_powerSourceProperties;
  if (powerSourceProperties)
  {
    CFRelease(powerSourceProperties);
    self->_powerSourceProperties = 0;
  }
  if (self->_powerSourceID)
  {
    IOPSReleasePowerSource();
    self->_powerSourceID = 0;
  }
  +[GCEAAccessoryManagerWrapper unregisterForLocalNotificationsWithObserver:](GCEAAccessoryManagerWrapper, "unregisterForLocalNotificationsWithObserver:", self);
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDC7BC8], 0);

  v5.receiver = self;
  v5.super_class = (Class)_GCDefaultPhysicalDevice;
  -[_GCDefaultPhysicalDevice dealloc](&v5, sel_dealloc);
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  NSObject *v8;
  unsigned int v9;
  objc_super v10;
  objc_super v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (&unk_254DCFBE0 == v4 && gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11.receiver = self;
      v11.super_class = (Class)_GCDefaultPhysicalDevice;
      v9 = -[_GCDefaultPhysicalDevice conformsToProtocol:](&v11, sel_conformsToProtocol_, v4);
      *(_DWORD *)buf = 67109120;
      v13 = v9;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "RECEIVED PROTOCOL. IS CONFORMED? %d", buf, 8u);
    }

  }
  if (&unk_254DCA028 == v4)
  {
    v5 = -[_GCDefaultPhysicalDevice supportsGamepad](self, "supportsGamepad");
  }
  else if (&unk_254DCA0C0 == v4)
  {
    v5 = -[_GCDefaultPhysicalDevice supportsPlayerIndicator](self, "supportsPlayerIndicator");
  }
  else if (&unk_254DCF840 == v4)
  {
    v5 = -[_GCDefaultPhysicalDevice supportsLight](self, "supportsLight");
  }
  else if (&unk_254DCF9B0 == v4)
  {
    v5 = -[_GCDefaultPhysicalDevice supportsAdaptiveTriggers](self, "supportsAdaptiveTriggers");
  }
  else if (&unk_254DCA250 == v4)
  {
    v5 = -[_GCDefaultPhysicalDevice supportsHapticCapabilities](self, "supportsHapticCapabilities");
  }
  else if (&unk_254DCF790 == v4)
  {
    v5 = -[_GCDefaultPhysicalDevice supportsMotion](self, "supportsMotion");
  }
  else if (&unk_254DCA1D8 == v4)
  {
    v5 = -[_GCDefaultPhysicalDevice supportsBattery](self, "supportsBattery");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_GCDefaultPhysicalDevice;
    v5 = -[_GCDefaultPhysicalDevice conformsToProtocol:](&v10, sel_conformsToProtocol_, v4);
  }
  v6 = v5;

  return v6;
}

- (NSString)description
{
  uint64_t v3;
  NSObject *identifier;
  void *v5;
  void *v6;

  v3 = objc_opt_class();
  identifier = self->_identifier;
  -[GCHIDServiceInfo registryID](self->_serviceInfo, "registryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '%@' registryID = %@>"), v3, identifier, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)redactedDescription
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class();
  v4 = -[NSObject hash](self->_identifier, "hash");
  -[GCHIDServiceInfo registryID](self->_serviceInfo, "registryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '#%llx' registryID = %@>"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)debugDescription
{
  objc_class *v3;
  void *v4;
  NSObject *identifier;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  -[GCHIDServiceInfo registryID](self->_serviceInfo, "registryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p '%@' registryID = %@>"), v4, self, identifier, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setFilterConnection:(id)a3
{
  id v5;
  id filterConnectionInvalidationRegistration;
  _GCDeviceDriverConnection *filterConnection;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD activity_block[4];
  id v13;
  _GCDefaultPhysicalDevice *v14;
  id v15;
  id location;
  _QWORD v17[5];

  v5 = a3;
  filterConnectionInvalidationRegistration = self->_filterConnectionInvalidationRegistration;
  self->_filterConnectionInvalidationRegistration = 0;

  filterConnection = self->_filterConnection;
  self->_filterConnection = 0;

  objc_storeStrong((id *)&self->_filterConnection, a3);
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke;
  v17[3] = &unk_24D2B2B20;
  v17[4] = self;
  objc_msgSend(v5, "addInvalidationHandler:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_filterConnectionInvalidationRegistration;
  self->_filterConnectionInvalidationRegistration = v9;

  objc_initWeak(&location, self);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = __48___GCDefaultPhysicalDevice_setFilterConnection___block_invoke_2;
  activity_block[3] = &unk_24D2B3E80;
  v13 = v5;
  v14 = self;
  v11 = v5;
  objc_copyWeak(&v15, &location);
  _os_activity_initiate(&dword_215181000, "Connect Game Intent Service", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
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
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _GCDefaultPhysicalDevice *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _GCDefaultPhysicalDevice *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _GCDefaultPhysicalDevice *v25;
  id v26;
  _QWORD activity_block[4];
  id v28;
  _GCDefaultPhysicalDevice *v29;
  id v30;
  id location;
  _QWORD v32[5];

  v5 = a3;
  driverConnectionInvalidationRegistration = self->_driverConnectionInvalidationRegistration;
  self->_driverConnectionInvalidationRegistration = 0;

  driverConnection = self->_driverConnection;
  self->_driverConnection = 0;

  objc_storeStrong((id *)&self->_driverConnection, a3);
  v8 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke;
  v32[3] = &unk_24D2B2B20;
  v32[4] = self;
  objc_msgSend(v5, "addInvalidationHandler:", v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_driverConnectionInvalidationRegistration;
  self->_driverConnectionInvalidationRegistration = v9;

  objc_initWeak(&location, self);
  activity_block[0] = v8;
  activity_block[1] = 3221225472;
  activity_block[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2;
  activity_block[3] = &unk_24D2B3E80;
  v11 = v5;
  v28 = v11;
  v29 = self;
  objc_copyWeak(&v30, &location);
  _os_activity_initiate(&dword_215181000, "Connect Light Service", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(&v30);

  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_212;
  v23[3] = &unk_24D2B3E80;
  v12 = v11;
  v24 = v12;
  v25 = self;
  objc_copyWeak(&v26, &location);
  _os_activity_initiate(&dword_215181000, "Connect Adaptive Triggers Service", OS_ACTIVITY_FLAG_DEFAULT, v23);
  objc_destroyWeak(&v26);

  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_2_216;
  v19[3] = &unk_24D2B3E80;
  v13 = v12;
  v20 = v13;
  v21 = self;
  objc_copyWeak(&v22, &location);
  _os_activity_initiate(&dword_215181000, "Connect Motion Service", OS_ACTIVITY_FLAG_DEFAULT, v19);
  objc_destroyWeak(&v22);

  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __48___GCDefaultPhysicalDevice_setDriverConnection___block_invoke_219;
  v15[3] = &unk_24D2B3E80;
  v16 = v13;
  v17 = self;
  v14 = v13;
  objc_copyWeak(&v18, &location);
  _os_activity_initiate(&dword_215181000, "Connect Battery Service", OS_ACTIVITY_FLAG_DEFAULT, v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (id)driverConnection
{
  return self->_driverConnection;
}

- (NSSet)components
{
  return +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", self);
}

- (id)propertyForKey:(id)a3
{
  __CFString *v4;
  int v5;
  GCHIDServiceInfo *serviceInfo;
  uint64_t v7;
  void *v8;

  v4 = (__CFString *)a3;
  v5 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("RegistryID"));
  serviceInfo = self->_serviceInfo;
  if (v5)
  {
    -[GCHIDServiceInfo registryID](serviceInfo, "registryID");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (uint64_t)IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)-[GCHIDServiceInfo service](serviceInfo, "service"), v4);
  }
  v8 = (void *)v7;

  return v8;
}

+ (id)identifierForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "stringPropertyForKey:", CFSTR("Transport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringPropertyForKey:", CFSTR("PhysicalDeviceUniqueID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v4, "isEqualToString:", CFSTR("iAP")) & 1) == 0)
  {
    v9 = v5;
  }
  else
  {
    objc_msgSend(v3, "stringPropertyForKey:", CFSTR("SerialNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[NSUUID UUID](&off_254DEEE48, "UUID");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  return v9;
}

- (void)eaAccessoriesDidChange
{
  unint64_t cachedGlyphFlags;
  id v4;

  cachedGlyphFlags = self->_cachedGlyphFlags;
  -[_GCDefaultPhysicalDevice updateGlyphFlags](self, "updateGlyphFlags");
  if (cachedGlyphFlags != self->_cachedGlyphFlags)
  {
    self->_cachedGlyphFlags = cachedGlyphFlags;
    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("GCRefreshPhysicalDeviceConfigurationNotification"), self);

  }
}

- (void)updateGlyphFlags
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  unint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  unint64_t v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  _GCDefaultPhysicalDevice *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[_GCDefaultPhysicalDevice propertyForKey:](self, "propertyForKey:", CFSTR("SerialNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDefaultPhysicalDevice propertyForKey:](self, "propertyForKey:", CFSTR("Transport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Bluetooth"));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  unk_254E00988(&off_254E02638, "sharedAccessoryManager", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
      if ((v5 & 1) != 0)
        objc_msgSend(v12, "macAddress");
      else
        objc_msgSend(v12, "serialNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        if ((objc_msgSend(v3, "isEqual:", v13) & 1) != 0)
          break;
      }

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    v14 = v12;

    if (!v14)
      goto LABEL_23;
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v14;
        v32 = 2112;
        v33 = self;
        _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_INFO, "Found matching accessory %@ for physical device %@", buf, 0x16u);
      }

    }
    objc_msgSend(v14, "protocolStrings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", CFSTR("com.playstation.olp.dualsense"));

    v17 = v16;
    objc_msgSend(v14, "protocolStrings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", CFSTR("com.xbox.licensing.controller"));

    if (v19)
      v17 |= 4uLL;
    objc_msgSend(v14, "protocolStrings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", CFSTR("com.playstation.olp.logobutton"));

    if (v21)
      v17 |= 2uLL;
    objc_msgSend(v14, "protocolStrings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsObject:", CFSTR("com.xbox.licensing.logobutton"));

    v24 = v17 | 8;
    if (!v23)
      v24 = v17;
  }
  else
  {
LABEL_13:

    v14 = 0;
LABEL_23:
    v24 = 0;
  }
  self->_cachedGlyphFlags = v24;

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 128, 1);
}

- (_GCDeviceManager)manager
{
  return (_GCDeviceManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (_GCDefaultPhysicalDeviceDelegate)delegate
{
  return (_GCDefaultPhysicalDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GCAdaptiveTriggersServiceServerInterface)adaptiveTriggersServiceServer
{
  return self->_adaptiveTriggersServiceServer;
}

- (GCLightServiceServerInterface)lightServiceServer
{
  return self->_lightServiceServer;
}

- (GCMotionServiceServerInterface)motionServiceServer
{
  return self->_motionServiceServer;
}

- (GCBatteryServiceServerInterface)batteryServiceServer
{
  return self->_batteryServiceServer;
}

- (GCGameIntentServiceServerInterface)gameIntentServiceServer
{
  return self->_gameIntentServiceServer;
}

- (GCHIDServiceInfo)serviceInfo
{
  return self->_serviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceInfo, 0);
  objc_storeStrong((id *)&self->_gameIntentServiceServer, 0);
  objc_storeStrong((id *)&self->_batteryServiceServer, 0);
  objc_storeStrong((id *)&self->_motionServiceServer, 0);
  objc_storeStrong((id *)&self->_lightServiceServer, 0);
  objc_storeStrong((id *)&self->_adaptiveTriggersServiceServer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_gameIntentComponentGameIntentTriggeredHandler, 0);
  objc_storeStrong(&self->_batteryComponentBatteryUpdatedHandler, 0);
  objc_storeStrong(&self->_batteryComponentServiceConnectedHandler, 0);
  objc_storeStrong(&self->_motionComponentServiceConnectedHandler, 0);
  objc_storeStrong(&self->_adaptiveTriggersComponentStatusUpdatedHandler, 0);
  objc_storeStrong(&self->_adaptiveTriggersComponentServiceConnectedHandler, 0);
  objc_storeStrong(&self->_lightComponentServiceConnectedHandler, 0);
  objc_storeStrong(&self->_filterConnectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_filterConnection, 0);
  objc_storeStrong(&self->_driverConnectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_driverConnection, 0);
}

- (BOOL)supportsGamepad
{
  return 1;
}

- (_GCGamepadEventSourceDescription)gamepadEventSource
{
  _GCCControllerManagerDescription *v3;
  _GCCControllerHIDServiceInfoDescription *v4;
  _GCKeyboardEventHIDAdapterDescription *v5;
  _GCGamepadEventGamepadHIDAdapterDescription *v6;
  void *v7;
  id WeakRetained;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _GCGamepadEventKeyboardEventAdapterDescription *v14;
  _GCGamepadEventFusionConfig *v15;
  uint64_t i;
  _BOOL8 v18;
  _GCGamepadEventFusionDescription *v19;
  void *v20;
  _GCGamepadEventFusionDescription *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(_GCCControllerManagerDescription);
  v4 = -[_GCCControllerHIDServiceInfoDescription initWithServiceInfo:]([_GCCControllerHIDServiceInfoDescription alloc], "initWithServiceInfo:", self->_serviceInfo);
  v5 = -[_GCKeyboardEventHIDAdapterDescription initWithSource:service:]([_GCKeyboardEventHIDAdapterDescription alloc], "initWithSource:service:", v3, v4);
  v6 = -[_GCGamepadEventGamepadHIDAdapterDescription initWithSource:service:]([_GCGamepadEventGamepadHIDAdapterDescription alloc], "initWithSource:service:", v3, v4);
  v7 = (void *)objc_opt_new();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_msgSend(v9, "physicalDeviceUsesACHomeForMenu:", self);

  if (!v10)
  {
LABEL_5:
    objc_msgSend(v7, "mapUsagePage:usage:toGamepadElement:", 12, 547, 22);
    objc_msgSend(v7, "mapUsagePage:usage:toGamepadElement:", 12, 516, 23);
    objc_msgSend(v7, "mapUsagePage:usage:toGamepadElement:", 12, 521, 24);
    v11 = v7;
    v12 = 178;
    v13 = 40;
    goto LABEL_6;
  }
  v11 = v7;
  v12 = 547;
  v13 = 23;
LABEL_6:
  objc_msgSend(v11, "mapUsagePage:usage:toGamepadElement:", 12, v12, v13);
  v14 = -[_GCGamepadEventKeyboardEventAdapterDescription initWithConfiguration:source:]([_GCGamepadEventKeyboardEventAdapterDescription alloc], "initWithConfiguration:source:", v7, v5);
  v15 = -[_GCGamepadEventFusionConfig initWithSourceCount:]([_GCGamepadEventFusionConfig alloc], "initWithSourceCount:", 2);
  for (i = 0; i != 47; ++i)
  {
    v18 = ((i - 24) & 0xFFFFFFFFFFFFFFEFLL) != 0 && (i & 0x7FFFFFFFFFFFFFFELL) != 22;
    -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v15, "setPassRule:forElement:forSourceAtIndex:", 1, i, v18);
  }
  v19 = [_GCGamepadEventFusionDescription alloc];
  v23[0] = v14;
  v23[1] = v6;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_GCGamepadEventFusionDescription initWithConfiguration:sources:](v19, "initWithConfiguration:sources:", v15, v20);

  return (_GCGamepadEventSourceDescription *)v21;
}

- (BOOL)supportsMotion
{
  void *v3;
  char v4;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "physicalDeviceSupportsMotion:", self);
  else
    v4 = 0;

  return v4;
}

- (id)deviceMotionServiceConnectedHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_motionComponentServiceConnectedHandler, a2);
}

- (void)setDeviceMotionServiceConnectedHandler:(id)a3
{
  void *v4;
  id motionComponentServiceConnectedHandler;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  motionComponentServiceConnectedHandler = self->_motionComponentServiceConnectedHandler;
  self->_motionComponentServiceConnectedHandler = v4;

  if (self->_motionComponentServiceConnectedHandler)
  {
    if (self->_motionServiceServer)
    {
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __75___GCDefaultPhysicalDevice_Motion__setDeviceMotionServiceConnectedHandler___block_invoke;
      v6[3] = &unk_24D2B2C50;
      objc_copyWeak(&v7, &location);
      dispatch_async(MEMORY[0x24BDAC9B8], v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (_GCMotionEventSourceDescription)motionEventSource
{
  _GCCControllerManagerDescription *v3;
  _GCCControllerHIDServiceInfoDescription *v4;
  _GCMotionEventHIDAdapterDescription *v5;

  v3 = objc_alloc_init(_GCCControllerManagerDescription);
  v4 = -[_GCCControllerHIDServiceInfoDescription initWithServiceInfo:]([_GCCControllerHIDServiceInfoDescription alloc], "initWithServiceInfo:", self->_serviceInfo);
  v5 = -[_GCMotionEventHIDAdapterDescription initWithSource:service:]([_GCMotionEventHIDAdapterDescription alloc], "initWithSource:service:", v3, v4);

  return (_GCMotionEventSourceDescription *)v5;
}

- (BOOL)sensorsActive
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = dispatch_semaphore_create(0);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49___GCDefaultPhysicalDevice_Motion__sensorsActive__block_invoke;
  v8[3] = &unk_24D2B4D60;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "physicalDevice:getSensorsActiveWithReply:", self, v8);

  v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (void)setSensorsActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicalDevice:setSensorsActive:", self, v3);

}

- (BOOL)supportsPlayerIndicator
{
  void *v2;
  char v3;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_opt_respondsToSelector();
  else
    v3 = 0;

  return v3 & 1;
}

- (int64_t)indicatedPlayerIndex
{
  void *v3;
  int64_t v4;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "physicalDeviceGetIndicatedPlayerIndex:", self);

  return v4;
}

- (void)setIndicatedPlayerIndex:(int64_t)a3
{
  id v5;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicalDevice:setIndicatedPlayerIndex:", self, a3);

}

- (BOOL)supportsLight
{
  void *v2;
  char v3;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_opt_respondsToSelector();
  else
    v3 = 0;

  return v3 & 1;
}

- (id)deviceLightServiceConnectedHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_lightComponentServiceConnectedHandler, a2);
}

- (void)setDeviceLightServiceConnectedHandler:(id)a3
{
  void *v4;
  id lightComponentServiceConnectedHandler;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  lightComponentServiceConnectedHandler = self->_lightComponentServiceConnectedHandler;
  self->_lightComponentServiceConnectedHandler = v4;

  if (self->_lightComponentServiceConnectedHandler)
  {
    if (self->_lightServiceServer)
    {
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __73___GCDefaultPhysicalDevice_Light__setDeviceLightServiceConnectedHandler___block_invoke;
      v6[3] = &unk_24D2B2C50;
      objc_copyWeak(&v7, &location);
      dispatch_async(MEMORY[0x24BDAC9B8], v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (GCDeviceLight)light
{
  dispatch_semaphore_t v3;
  void *v4;
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
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40___GCDefaultPhysicalDevice_Light__light__block_invoke;
  v9[3] = &unk_24D2B4D88;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "physicalDevice:getLightWithReply:", self, v9);

  v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (GCDeviceLight *)v7;
}

- (void)setLight:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "physicalDevice:setLight:", self, v4);

}

- (BOOL)supportsAdaptiveTriggers
{
  void *v2;
  char v3;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_opt_respondsToSelector();
  else
    v3 = 0;

  return v3 & 1;
}

- (id)deviceAdaptiveTriggersServiceConnectedHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_adaptiveTriggersComponentServiceConnectedHandler, a2);
}

- (void)setDeviceAdaptiveTriggersServiceConnectedHandler:(id)a3
{
  void *v4;
  id adaptiveTriggersComponentServiceConnectedHandler;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  adaptiveTriggersComponentServiceConnectedHandler = self->_adaptiveTriggersComponentServiceConnectedHandler;
  self->_adaptiveTriggersComponentServiceConnectedHandler = v4;

  if (self->_adaptiveTriggersComponentServiceConnectedHandler)
  {
    if (self->_adaptiveTriggersServiceServer)
    {
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __95___GCDefaultPhysicalDevice_AdaptiveTriggers__setDeviceAdaptiveTriggersServiceConnectedHandler___block_invoke;
      v6[3] = &unk_24D2B2C50;
      objc_copyWeak(&v7, &location);
      dispatch_async(MEMORY[0x24BDAC9B8], v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setAdaptiveTriggersPayload:(id)a3 forIndex:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "physicalDevice:setAdaptiveTriggersPayload:forIndex:", self, v6, v4);

}

- (id)deviceAdaptiveTriggersComponentStatusUpdatedHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_adaptiveTriggersComponentStatusUpdatedHandler, a2);
}

- (void)setDeviceAdaptiveTriggersComponentStatusUpdatedHandler:(id)a3
{
  void *v4;
  id adaptiveTriggersComponentStatusUpdatedHandler;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  adaptiveTriggersComponentStatusUpdatedHandler = self->_adaptiveTriggersComponentStatusUpdatedHandler;
  self->_adaptiveTriggersComponentStatusUpdatedHandler = v4;

}

- (NSArray)triggerStatuses
{
  dispatch_semaphore_t v3;
  void *v4;
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
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61___GCDefaultPhysicalDevice_AdaptiveTriggers__triggerStatuses__block_invoke;
  v9[3] = &unk_24D2B4DB0;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "physicalDevice:getAdaptiveTriggersStatusesWithReply:", self, v9);

  v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (NSArray *)v7;
}

- (void)updateAdaptiveTriggerStatusWithLeftMode:(unsigned __int8)a3 leftStatus:(unsigned __int8)a4 leftArmPosition:(unsigned __int8)a5 rightMode:(unsigned __int8)a6 rightStatus:(unsigned __int8)a7 rightArmPosition:(unsigned __int8)a8
{
  _QWORD block[4];
  id v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  id location;

  if (self->_adaptiveTriggersComponentStatusUpdatedHandler)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __158___GCDefaultPhysicalDevice_AdaptiveTriggersClient__updateAdaptiveTriggerStatusWithLeftMode_leftStatus_leftArmPosition_rightMode_rightStatus_rightArmPosition___block_invoke;
    block[3] = &unk_24D2B4DD8;
    objc_copyWeak(&v15, &location);
    v16 = a4;
    v17 = a5;
    v18 = a3;
    v19 = a7;
    v20 = a8;
    v21 = a6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (BOOL)supportsBattery
{
  void *v3;
  char v4;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v3, "physicalDeviceSupportsBattery:", self))
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_respondsToSelector();
  }

  return v4 & 1;
}

- (id)deviceBatteryServiceConnectedHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_batteryComponentServiceConnectedHandler, a2);
}

- (void)setDeviceBatteryServiceConnectedHandler:(id)a3
{
  void *v4;
  id batteryComponentServiceConnectedHandler;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  batteryComponentServiceConnectedHandler = self->_batteryComponentServiceConnectedHandler;
  self->_batteryComponentServiceConnectedHandler = v4;

  if (self->_batteryComponentServiceConnectedHandler)
  {
    if (self->_batteryServiceServer)
    {
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __77___GCDefaultPhysicalDevice_Battery__setDeviceBatteryServiceConnectedHandler___block_invoke;
      v6[3] = &unk_24D2B2C50;
      objc_copyWeak(&v7, &location);
      dispatch_async(MEMORY[0x24BDAC9B8], v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
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

- (GCDeviceBattery)battery
{
  dispatch_semaphore_t v3;
  void *v4;
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
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44___GCDefaultPhysicalDevice_Battery__battery__block_invoke;
  v9[3] = &unk_24D2B4E00;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "physicalDevice:getBatteryWithReply:", self, v9);

  v6 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v5, v6);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (GCDeviceBattery *)v7;
}

- (void)createPowerSource
{
  void *v3;
  __CFDictionary *powerSourceProperties;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  _QWORD v16[4];
  id v17;
  id location;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "physicalDeviceShouldPublishPowerSource:", self))
  {
    if (self->_powerSourceID || !IOPSCreatePowerSource() && self->_powerSourceID)
    {
      powerSourceProperties = self->_powerSourceProperties;
      if (powerSourceProperties)
        CFDictionaryRemoveAllValues(powerSourceProperties);
      else
        self->_powerSourceProperties = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      -[_GCDefaultPhysicalDevice propertyForKey:](self, "propertyForKey:", CFSTR("Transport"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Transport Type"), v6);
      -[_GCDefaultPhysicalDevice propertyForKey:](self, "propertyForKey:", CFSTR("Product"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Name"), v7);
      -[_GCDefaultPhysicalDevice propertyForKey:](self, "propertyForKey:", CFSTR("VendorID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Vendor ID"), v8);
      -[_GCDefaultPhysicalDevice propertyForKey:](self, "propertyForKey:", CFSTR("ProductID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Product ID"), v9);
      -[_GCDefaultPhysicalDevice propertyForKey:](self, "propertyForKey:", CFSTR("ModelNumber"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Model Number"), v10);
      -[_GCDefaultPhysicalDevice propertyForKey:](self, "propertyForKey:", CFSTR("SerialNumber"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Accessory Identifier"), v11);
      CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Accessory Category"), CFSTR("Game Controller"));
      CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Is Present"), (const void *)*MEMORY[0x24BDBD270]);
      CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Type"), CFSTR("Accessory Source"));

      CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Is Charging"), (const void *)*MEMORY[0x24BDBD268]);
      CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Power Source State"), CFSTR("Battery Power"));
      CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Max Capacity"), &unk_24D30E170);
      CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Current Capacity"), &unk_24D30E170);
      if (IOPSSetPowerSourceDetails() && gc_isInternalBuild())
      {
        getGCLogger();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[_GCDefaultPhysicalDevice(Battery) createPowerSource].cold.2();

      }
      objc_initWeak(&location, self);
      -[_GCDefaultPhysicalDevice batteryServiceServer](self, "batteryServiceServer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __54___GCDefaultPhysicalDevice_Battery__createPowerSource__block_invoke;
      v16[3] = &unk_24D2B4E28;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v12, "readBatteryWithReply:", v16);

      if (gc_isInternalBuild())
      {
        getGCLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "Created I/O Power Source for game controller.", v15, 2u);
        }

      }
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else if (gc_isInternalBuild())
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[_GCDefaultPhysicalDevice(Battery) createPowerSource].cold.1();

    }
  }

}

- (void)updateBattery:(unsigned __int8)a3 isCharging:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  __CFDictionary *powerSourceProperties;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  char v11;
  BOOL v12;
  id location;

  if (self->_batteryComponentBatteryUpdatedHandler)
  {
    v4 = a4;
    v5 = a3;
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68___GCDefaultPhysicalDevice_BatteryClient__updateBattery_isCharging___block_invoke;
    block[3] = &unk_24D2B4E50;
    objc_copyWeak(&v10, &location);
    v11 = v5;
    v12 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    if (self->_powerSourceID)
    {
      powerSourceProperties = self->_powerSourceProperties;
      if (powerSourceProperties)
      {
        CFDictionarySetValue(powerSourceProperties, CFSTR("Is Charging"), +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", v4));
        CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Max Capacity"), &unk_24D30E188);
        CFDictionarySetValue(self->_powerSourceProperties, CFSTR("Current Capacity"), +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:", v5));
        if (IOPSSetPowerSourceDetails())
        {
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              -[_GCDefaultPhysicalDevice(BatteryClient) updateBattery:isCharging:].cold.1();

          }
        }
      }
    }
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (BOOL)supportsHapticCapabilities
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "physicalDeviceGetHapticCapabilities:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "count") != 0;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)hapticEngines
{
  void *v3;
  void *v4;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "physicalDeviceGetHapticCapabilities:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (GCHapticCapabilityGraph)hapticCapabilityGraph
{
  void *v3;
  void *v4;

  -[_GCDefaultPhysicalDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "physicalDeviceGetHapticCapabilityGraph:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCHapticCapabilityGraph *)v4;
}

- (void)setEnableGlobalGameControllerFunctionality:(BOOL)a3
{
  -[GCGameIntentServiceServerInterface setEnableGlobalGameControllerFunctionality:](self->_gameIntentServiceServer, "setEnableGlobalGameControllerFunctionality:", a3);
}

- (id)deviceGameIntentComponentGameIntentTriggeredHandler
{
  return (id)MEMORY[0x2199DEBB0](self->_gameIntentComponentGameIntentTriggeredHandler, a2);
}

- (void)setDeviceGameIntentComponentGameIntentTriggeredHandler:(id)a3
{
  void *v4;
  id gameIntentComponentGameIntentTriggeredHandler;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  gameIntentComponentGameIntentTriggeredHandler = self->_gameIntentComponentGameIntentTriggeredHandler;
  self->_gameIntentComponentGameIntentTriggeredHandler = v4;

  if (self->_cachedIntentEvent != -1)
  {
    -[_GCDefaultPhysicalDevice triggerGameIntentWithEvent:](self, "triggerGameIntentWithEvent:");
    self->_cachedIntentEvent = -1;
  }
}

- (void)triggerGameIntentWithEvent:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[4];
  id v7[2];
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a3;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "triggerGameIntentWithEvent: %ld", (uint8_t *)location, 0xCu);
    }

  }
  if (self->_gameIntentComponentGameIntentTriggeredHandler)
  {
    objc_initWeak(location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73___GCDefaultPhysicalDevice_GameIntentClient__triggerGameIntentWithEvent___block_invoke;
    v6[3] = &unk_24D2B4E78;
    objc_copyWeak(v7, location);
    v7[1] = (id)a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);
    objc_destroyWeak(v7);
    objc_destroyWeak(location);
  }
  else
  {
    self->_cachedIntentEvent = a3;
  }
}

- (unint64_t)getGlyphFlags
{
  -[_GCDefaultPhysicalDevice updateGlyphFlags](self, "updateGlyphFlags");
  return self->_cachedGlyphFlags;
}

@end
