@implementation ICDevice

- (ICDevice)init
{
  return -[ICDevice initWithDictionary:](self, "initWithDictionary:", 0);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (ICDevice)initWithDictionary:(id)a3
{
  id v4;
  ICDevice *v5;
  ICDevice *v6;
  uint64_t v7;
  NSMutableDictionary *userData;
  uint64_t v9;
  NSNumber *deviceRef;
  uint64_t v11;
  NSNumber *connectionID;
  uint64_t v13;
  NSNumber *deviceID;
  uint64_t v15;
  NSNumber *procID;
  uint64_t v17;
  NSString *productKind;
  uint64_t v19;
  NSMutableSet *deviceCapabilities;
  uint64_t v21;
  NSString *name;
  void *v23;
  uint64_t v24;
  NSString *UUIDString;
  uint64_t v26;
  NSString *persistentIDString;
  uint64_t v28;
  NSString *serialNumberString;
  void *v30;
  NSString *modulePath;
  NSString *moduleVersion;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  NSObject *v42;
  uint64_t v43;
  ICDevice *v44;
  objc_super v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)ICDevice;
  v5 = -[ICDevice init](&v46, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_sessionState = -1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    userData = v6->_userData;
    v6->_userData = (NSMutableDictionary *)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICADeviceBrowserDeviceRefKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    deviceRef = v6->_deviceRef;
    v6->_deviceRef = (NSNumber *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICAConnectionIDKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    connectionID = v6->_connectionID;
    v6->_connectionID = (NSNumber *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objectID"));
    v13 = objc_claimAutoreleasedReturnValue();
    deviceID = v6->_deviceID;
    v6->_deviceID = (NSNumber *)v13;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", ++_sProcID);
    v15 = objc_claimAutoreleasedReturnValue();
    procID = v6->_procID;
    v6->_procID = (NSNumber *)v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productKind"));
    v17 = objc_claimAutoreleasedReturnValue();
    productKind = v6->_productKind;
    v6->_productKind = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    deviceCapabilities = v6->_deviceCapabilities;
    v6->_deviceCapabilities = (NSMutableSet *)v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v21 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v21;

    v6->_softwareInstallPercentDone = 0.0;
    v6->_canCancelSoftwareInstallation = 1;
    v23 = 0;
    if (!-[ICDevice isRemote](v6, "isRemote"))
    {
      if ((-[ICDevice type](v6, "type") & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capa"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
    }
    -[ICDevice updateCapabilities:](v6, "updateCapabilities:", v23);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUIDString"));
    v24 = objc_claimAutoreleasedReturnValue();
    UUIDString = v6->_UUIDString;
    v6->_UUIDString = (NSString *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("persistentIDString"));
    v26 = objc_claimAutoreleasedReturnValue();
    persistentIDString = v6->_persistentIDString;
    v6->_persistentIDString = (NSString *)v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICADeviceSerialNumberString"));
    v28 = objc_claimAutoreleasedReturnValue();
    serialNumberString = v6->_serialNumberString;
    v6->_serialNumberString = (NSString *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICAAutoLaunchedDevice"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      v6->_autolaunchDevice = 1;
    modulePath = v6->_modulePath;
    v6->_modulePath = (NSString *)CFSTR("/System/Library/Image Capture/Devices/PTPCamera.app");

    moduleVersion = v6->_moduleVersion;
    v6->_moduleVersion = (NSString *)CFSTR("1.0");

    __ICOSLogCreate();
    v33 = CFSTR("ICDevice");
    if ((unint64_t)objc_msgSend(CFSTR("ICDevice"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("ICDevice"), "substringWithRange:", 0, 18);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringByAppendingString:", CFSTR(".."));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v35 = (void *)MEMORY[0x1E0CB3940];
    -[ICDevice deviceRef](v6, "deviceRef");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "intValue");
    -[ICDevice persistentIDString](v6, "persistentIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR(" +++ Creating [0x%x]:%@"), v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_retainAutorelease(v33);
      v42 = v40;
      v43 = -[__CFString UTF8String](v41, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v48 = v43;
      v49 = 2114;
      v50 = v39;
      _os_log_impl(&dword_1B98FC000, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v44 = v6;

  }
  return v6;
}

- (BOOL)updateProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *iconPath;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  NSString *systemSymbolName;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *serialNumberString;
  NSString *v19;
  NSString *v20;
  void *v21;
  NSString *UUIDString;
  NSString *v23;
  NSString *v24;
  void *v25;
  NSString *persistentIDString;
  NSString *v27;
  NSString *v28;
  BOOL v29;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIconPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    iconPath = self->_iconPath;
    if (iconPath)
    {
      if (-[NSString isEqualToString:](iconPath, "isEqualToString:", v6))
        goto LABEL_6;
      v8 = self->_iconPath;
      self->_iconPath = 0;

    }
    v9 = (NSString *)objc_msgSend(v6, "copy");
    v10 = self->_iconPath;
    self->_iconPath = v9;

    -[ICDevice setIcon:](self, "setIcon:", 0);
    objc_msgSend(v5, "addObject:", CFSTR("icon"));
    objc_msgSend(v5, "addObject:", CFSTR("iconPath"));
  }
LABEL_6:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemSymbolName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    systemSymbolName = self->_systemSymbolName;
    if (!systemSymbolName)
    {
LABEL_10:
      v14 = (NSString *)objc_msgSend(v11, "copy");
      v15 = self->_systemSymbolName;
      self->_systemSymbolName = v14;

      objc_msgSend(v5, "addObject:", CFSTR("icon"));
      objc_msgSend(v5, "addObject:", CFSTR("systemSymbolName"));
      goto LABEL_11;
    }
    if (!-[NSString isEqualToString:](systemSymbolName, "isEqualToString:", v11))
    {
      v13 = self->_systemSymbolName;
      self->_systemSymbolName = 0;

      goto LABEL_10;
    }
  }
LABEL_11:
  if (!-[ICDevice isRemote](self, "isRemote") && (-[ICDevice type](self, "type") & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capa"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  -[ICDevice updateCapabilities:](self, "updateCapabilities:", v16);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICADeviceSerialNumberString"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    serialNumberString = self->_serialNumberString;
    if (!serialNumberString
      || !-[NSString isEqualToString:](serialNumberString, "isEqualToString:", v17)
      || !self->_serialNumberString)
    {
      v19 = (NSString *)objc_msgSend(v17, "copy");
      v20 = self->_serialNumberString;
      self->_serialNumberString = v19;

      objc_msgSend(v5, "addObject:", CFSTR("serialNumberString"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUIDString"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    UUIDString = self->_UUIDString;
    if (!UUIDString || !-[NSString isEqualToString:](UUIDString, "isEqualToString:", v21) || !self->_UUIDString)
    {
      v23 = (NSString *)objc_msgSend(v21, "copy");
      v24 = self->_UUIDString;
      self->_UUIDString = v23;

      objc_msgSend(v5, "addObject:", CFSTR("UUIDString"));
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("persistentIDString"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    persistentIDString = self->_persistentIDString;
    if (!persistentIDString
      || !-[NSString isEqualToString:](persistentIDString, "isEqualToString:", v25)
      || !self->_persistentIDString)
    {
      v27 = (NSString *)objc_msgSend(v25, "copy");
      v28 = self->_persistentIDString;
      self->_persistentIDString = v27;

      objc_msgSend(v5, "addObject:", CFSTR("persistentIDString"));
    }
  }
  v29 = objc_msgSend(v5, "count") != 0;

  return v29;
}

- (void)notifyObservers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ICDevice *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__ICDevice_notifyObservers___block_invoke;
  v6[3] = &unk_1E70C71C0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  ICPerformBlockOnMainThread(v6);

}

void __28__ICDevice_notifyObservers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "willChangeValueForKey:", v7, (_QWORD)v8);
        objc_msgSend(*(id *)(a1 + 40), "didChangeValueForKey:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)setSessionState:(int64_t)a3
{
  if (self->_sessionState != a3)
  {
    self->_sessionState = a3;
    if (a3)
    {
      -[ICDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hasOpenSession"));
      -[ICDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hasOpenSession"));
    }
  }
}

- (BOOL)hasOpenSession
{
  return -[ICDevice sessionState](self, "sessionState") == 1;
}

- (void)setPreferred:(BOOL)a3
{
  self->_preferred = a3;
  -[ICDevice notifyObservers:](self, "notifyObservers:", &unk_1E70DC698);
}

- (void)setIconPath:(id)a3
{
  void *v4;
  NSString *iconPath;
  NSString *v6;
  NSString *v7;
  id v8;

  v8 = a3;
  -[ICDevice iconPath](self, "iconPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    iconPath = self->_iconPath;
    self->_iconPath = 0;

  }
  v6 = (NSString *)objc_msgSend(v8, "copy");
  v7 = self->_iconPath;
  self->_iconPath = v6;

}

- (CGImageRef)icon
{
  return 0;
}

- (BOOL)isRemote
{
  void *v2;
  char v3;

  -[ICDevice transportType](self, "transportType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ICTransportTypeTCPIP"));

  return v3;
}

- (BOOL)isAppleDevice
{
  return -[ICDevice usbVendorID](self, "usbVendorID") == 1452;
}

- (id)description
{
  void *v3;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("class"));
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%p>"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("delegate"));

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice deviceRef](self, "deviceRef");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("0x%08x"), objc_msgSend(v8, "unsignedIntValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceRef"));

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice connectionID](self, "connectionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("0x%08x"), objc_msgSend(v11, "unsignedIntValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("connectionID"));

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice deviceID](self, "deviceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("0x%08x"), objc_msgSend(v14, "unsignedIntValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("deviceID"));

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice name](self, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("name"));

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice locationDescription](self, "locationDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("locationDescription"));

  v22 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice iconPath](self, "iconPath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("iconPath"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%08lx"), -[ICDevice type](self, "type"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("type"));

  v26 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice UUIDString](self, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("UUIDString"));

  v29 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice persistentIDString](self, "persistentIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("persistentIDString"));

  -[ICDevice capabilities](self, "capabilities");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    -[ICDevice capabilities](self, "capabilities");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("capabilities"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "NO");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("shared"));

  v36 = (void *)MEMORY[0x1E0CB3940];
  -[ICDevice transportType](self, "transportType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("transportType"));

  -[ICDevice transportType](self, "transportType");
  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v39 == CFSTR("ICTransportTypeUSB"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%08x"), -[ICDevice usbLocationID](self, "usbLocationID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("usbLocationID"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%04x"), -[ICDevice usbProductID](self, "usbProductID"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("usbProductID"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%04x"), -[ICDevice usbVendorID](self, "usbVendorID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("usbVendorID"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%02x"), -[ICDevice usbIntefaceClass](self, "usbIntefaceClass"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("usbIntefaceClass"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%02x"), -[ICDevice usbInterfaceSubClass](self, "usbInterfaceSubClass"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("usbInterfaceSubClass"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%02x"), -[ICDevice usbInterfaceProtocol](self, "usbInterfaceProtocol"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("usbInterfaceProtocol"));
  }
  else
  {
    -[ICDevice transportType](self, "transportType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "description");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (void)setDelegate:(id)delegate
{
  id v4;
  objc_class *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = delegate;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __ICOSLogCreate();
  v7 = CFSTR("Delegate Updated");
  if ((unint64_t)objc_msgSend(CFSTR("Delegate Updated"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("Delegate Updated"), "substringWithRange:", 0, 18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(".."));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v9 = CFSTR("< not set >");
  if (v6)
    v9 = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v7);
    v13 = v11;
    *(_DWORD *)buf = 136446466;
    v15 = -[__CFString UTF8String](v12, "UTF8String");
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1B98FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_storeWeak(&self->_deviceDelegate, v4);

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_deviceDelegate);
}

- (void)requestEject
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __24__ICDevice_requestEject__block_invoke;
  v2[3] = &unk_1E70C7150;
  v2[4] = self;
  -[ICDevice requestEjectWithCompletion:](self, "requestEjectWithCompletion:", v2);
}

void __24__ICDevice_requestEject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__ICDevice_requestEject__block_invoke_2;
    block[3] = &unk_1E70C7630;
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    v10 = v3;
    ICPerformBlockOnMainThread(block);

  }
}

id __24__ICDevice_requestEject__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), sel_device_didEjectWithError_, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)requestEjectWithCompletion:(void *)completion
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = completion;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ICDevice_requestEjectWithCompletion___block_invoke;
  block[3] = &unk_1E70C7658;
  v6 = v3;
  v4 = v3;
  ICPerformBlockOnMainThread(block);

}

void __39__ICDevice_requestEjectWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -21346, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSArray)capabilities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[ICDevice deviceCapabilities](self, "deviceCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDevice modulePath](self, "modulePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PTPCamera")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("PTPIPCamera")))
  {
    objc_msgSend(v6, "addObject:", CFSTR("ICCameraDeviceCanAcceptPTPCommands"));
  }

  return (NSArray *)v6;
}

- (void)addCapability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _QWORD block[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ICDevice capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "isEqualToString:", v4) & 1) != 0)
        {

          goto LABEL_15;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v8)
        continue;
      break;
    }
  }

  __ICOSLogCreate();
  v11 = CFSTR("                   ∆");
  if ((unint64_t)objc_msgSend(CFSTR("                   ∆"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("                   ∆"), "substringWithRange:", 0, 18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v11);
    v16 = v14;
    v17 = -[__CFString UTF8String](v15, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v25 = v17;
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1B98FC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  -[ICDevice deviceCapabilities](self, "deviceCapabilities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v4);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__ICDevice_addCapability___block_invoke;
  block[3] = &unk_1E70C7198;
  block[4] = self;
  ICPerformBlockOnMainThread(block);
LABEL_15:

}

void __26__ICDevice_addCapability___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t);
  void *v8;
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("capabilities"));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __26__ICDevice_addCapability___block_invoke_2;
    v8 = &unk_1E70C71C0;
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 32);
    v9 = v3;
    v10 = v4;
    ICPerformBlockOnMainThread(&v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("capabilities"), v5, v6, v7, v8);

}

id __26__ICDevice_addCapability___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), sel_cameraDeviceDidChangeCapability_, *(_QWORD *)(a1 + 40));
}

- (void)removeCapability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICDevice capabilities](self, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", v4))
        {
          -[ICDevice deviceCapabilities](self, "deviceCapabilities");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", v11);

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __29__ICDevice_removeCapability___block_invoke;
          block[3] = &unk_1E70C7198;
          block[4] = self;
          ICPerformBlockOnMainThread(block);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }

LABEL_11:
}

void __29__ICDevice_removeCapability___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t);
  void *v8;
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("capabilities"));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __29__ICDevice_removeCapability___block_invoke_2;
    v8 = &unk_1E70C71C0;
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 32);
    v9 = v3;
    v10 = v4;
    ICPerformBlockOnMainThread(&v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("capabilities"), v5, v6, v7, v8);

}

id __29__ICDevice_removeCapability___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), sel_cameraDeviceDidChangeCapability_, *(_QWORD *)(a1 + 40));
}

- (void)imageCaptureEventNotification:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICADeviceBrowserDeviceRefKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");
  -[ICDevice deviceID](self, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v9 == v11)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__ICDevice_imageCaptureEventNotification_completion___block_invoke;
    block[3] = &unk_1E70C7680;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    ICPerformBlockOnMainThread(block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9922, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);

  }
}

uint64_t __53__ICDevice_imageCaptureEventNotification_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleImageCaptureEventNotification:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)handleCommandCompletion:(id)a3
{
  return 0;
}

- (void)updateCapabilities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (!v7)
      goto LABEL_32;
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "unsignedIntValue", v17);
        if (v12 > 1701471586)
        {
          if (v12 > 1819238755)
          {
            if (v12 == 1819238756)
            {
              v13 = CFSTR("ICCameraDeviceCanReceiveFile");
            }
            else
            {
              if (v12 != 1935895659)
                goto LABEL_30;
              v13 = CFSTR("ICCameraDeviceCanSyncClock");
            }
          }
          else
          {
            v14 = CFSTR("ICDeviceCanEjectOrDisconnect");
            if (v12 == 1701471587)
              goto LABEL_28;
            if (v12 != 1751476582)
            {
LABEL_30:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringFromOSType:", objc_msgSend(v11, "unsignedIntValue"));
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_27;
            }
            v13 = CFSTR("ICCameraDeviceSupportsHEIF");
          }
        }
        else if (v12 > 1684368432)
        {
          if (v12 == 1684368433)
          {
            v13 = CFSTR("ICCameraDeviceCanDeleteOneFile");
          }
          else
          {
            if (v12 != 1684368481)
              goto LABEL_30;
            v13 = CFSTR("ICCameraDeviceCanDeleteAllFiles");
          }
        }
        else if (v12 == 1667460658)
        {
          v13 = CFSTR("ICCameraDeviceCanTakePictureUsingShutterReleaseOnCamera");
        }
        else
        {
          if (v12 != 1667460713)
            goto LABEL_30;
          v13 = CFSTR("ICCameraDeviceCanTakePicture");
        }
        v15 = v13;
LABEL_27:
        v14 = v15;
LABEL_28:
        -[ICDevice addCapability:](self, "addCapability:", v14);

        ++v10;
      }
      while (v8 != v10);
      v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = v16;
      if (!v16)
      {
LABEL_32:

        v5 = v17;
        break;
      }
    }
  }
  if (-[ICDevice systemReportsEjectable](self, "systemReportsEjectable", v17))
    -[ICDevice addCapability:](self, "addCapability:", CFSTR("ICDeviceCanEjectOrDisconnect"));

}

- (NSString)autolaunchApplicationPath
{
  NSString *autolaunchApplicationPath;
  __CFString *v3;

  autolaunchApplicationPath = self->_autolaunchApplicationPath;
  if (autolaunchApplicationPath)
  {
    -[NSString stringByExpandingTildeInPath](autolaunchApplicationPath, "stringByExpandingTildeInPath");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E70C89C0;
  }
  return (NSString *)v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqual:", CFSTR("icon")))
  {
    -[ICDevice icon](self, "icon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)cleanupDeviceWithErrorCode:(id)a3 completionBlock:(id)a4
{
  NSNumber *connectionID;

  connectionID = self->_connectionID;
  self->_connectionID = 0;

}

- (void)removeCapabilities
{
  id v2;

  -[ICDevice deviceCapabilities](self, "deviceCapabilities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)setAutolaunchApplicationPath:(NSString *)autolaunchApplicationPath
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](autolaunchApplicationPath, "copy");
  v5 = self->_autolaunchApplicationPath;
  self->_autolaunchApplicationPath = v4;

}

- (ICDeviceType)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)productKind
{
  return self->_productKind;
}

- (void)setProductKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setIcon:(CGImage *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSString)systemSymbolName
{
  return self->_systemSymbolName;
}

- (void)setSystemSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)locationDescription
{
  return self->_locationDescription;
}

- (void)setLocationDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setHasOpenSession:(BOOL)a3
{
  self->_hasOpenSession = a3;
}

- (NSMutableDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
  objc_storeStrong((id *)&self->_userData, a3);
}

- (NSString)modulePath
{
  return self->_modulePath;
}

- (void)setModulePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)moduleVersion
{
  return self->_moduleVersion;
}

- (void)setModuleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)serialNumberString
{
  return self->_serialNumberString;
}

- (void)setSerialNumberString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int)usbLocationID
{
  return self->_usbLocationID;
}

- (void)setUsbLocationID:(int)a3
{
  self->_usbLocationID = a3;
}

- (int)usbProductID
{
  return self->_usbProductID;
}

- (void)setUsbProductID:(int)a3
{
  self->_usbProductID = a3;
}

- (int)usbVendorID
{
  return self->_usbVendorID;
}

- (void)setUsbVendorID:(int)a3
{
  self->_usbVendorID = a3;
}

- (NSString)persistentIDString
{
  return self->_persistentIDString;
}

- (void)setPersistentIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int)moduleExecutableArchitecture
{
  return self->_moduleExecutableArchitecture;
}

- (NSMutableSet)deviceCapabilities
{
  return self->_deviceCapabilities;
}

- (void)setDeviceCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCapabilities, a3);
}

- (int)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(int)a3
{
  self->_sessionID = a3;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (ICDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManager, a3);
}

- (id)deviceDelegate
{
  return objc_loadWeakRetained(&self->_deviceDelegate);
}

- (void)setDeviceDelegate:(id)a3
{
  objc_storeWeak(&self->_deviceDelegate, a3);
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (NSString)internalUUID
{
  return self->_internalUUID;
}

- (void)setInternalUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)deviceHandle
{
  return self->_deviceHandle;
}

- (void)setDeviceHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (int)usbIntefaceClass
{
  return self->_usbIntefaceClass;
}

- (void)setUsbIntefaceClass:(int)a3
{
  self->_usbIntefaceClass = a3;
}

- (int)usbInterfaceSubClass
{
  return self->_usbInterfaceSubClass;
}

- (void)setUsbInterfaceSubClass:(int)a3
{
  self->_usbInterfaceSubClass = a3;
}

- (int)usbInterfaceProtocol
{
  return self->_usbInterfaceProtocol;
}

- (void)setUsbInterfaceProtocol:(int)a3
{
  self->_usbInterfaceProtocol = a3;
}

- (int64_t)fwGUID
{
  return self->_fwGUID;
}

- (void)setFwGUID:(int64_t)a3
{
  self->_fwGUID = a3;
}

- (BOOL)autolaunchDevice
{
  return self->_autolaunchDevice;
}

- (void)setAutolaunchDevice:(BOOL)a3
{
  self->_autolaunchDevice = a3;
}

- (BOOL)systemReportsEjectable
{
  return self->_systemReportsEjectable;
}

- (void)setSystemReportsEjectable:(BOOL)a3
{
  self->_systemReportsEjectable = a3;
}

- (NSNumber)procID
{
  return self->_procID;
}

- (void)setProcID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)volumePath
{
  return self->_volumePath;
}

- (void)setVolumePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)autoOpenSession
{
  return self->_autoOpenSession;
}

- (void)setAutoOpenSession:(BOOL)a3
{
  self->_autoOpenSession = a3;
}

- (BOOL)openSessionPending
{
  return self->_openSessionPending;
}

- (void)setOpenSessionPending:(BOOL)a3
{
  self->_openSessionPending = a3;
}

- (BOOL)closeSessionPending
{
  return self->_closeSessionPending;
}

- (void)setCloseSessionPending:(BOOL)a3
{
  self->_closeSessionPending = a3;
}

- (NSNumber)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)deviceRef
{
  return self->_deviceRef;
}

- (void)setDeviceRef:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)iconPath
{
  return self->_iconPath;
}

- (BOOL)preferred
{
  return self->_preferred;
}

- (double)softwareInstallPercentDone
{
  return self->_softwareInstallPercentDone;
}

- (BOOL)canCancelSoftwareInstallation
{
  return self->_canCancelSoftwareInstallation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconPath, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_deviceRef, 0);
  objc_storeStrong((id *)&self->_connectionID, 0);
  objc_storeStrong((id *)&self->_volumePath, 0);
  objc_storeStrong((id *)&self->_procID, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);
  objc_storeStrong((id *)&self->_internalUUID, 0);
  objc_destroyWeak(&self->_deviceDelegate);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_deviceCapabilities, 0);
  objc_storeStrong((id *)&self->_persistentIDString, 0);
  objc_storeStrong((id *)&self->_serialNumberString, 0);
  objc_storeStrong((id *)&self->_moduleVersion, 0);
  objc_storeStrong((id *)&self->_modulePath, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_locationDescription, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_systemSymbolName, 0);
  objc_storeStrong((id *)&self->_productKind, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_autolaunchApplicationPath, 0);
}

@end
