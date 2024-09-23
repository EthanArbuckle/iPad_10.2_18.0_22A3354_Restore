@implementation CBPeripheral

- (CBPeripheral)initWithCentralManager:(id)a3 info:(id)a4
{
  id v6;
  CBPeripheral *v7;
  uint64_t v8;
  NSString *name;
  void *v10;
  void *v11;
  NSNumber *RSSI;
  NSArray *services;
  NSMutableDictionary *v14;
  NSMutableDictionary *attributes;
  void *v16;
  uint64_t v17;
  NSHashTable *l2capChannels;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *stableIdentifier;
  uint64_t v24;
  NSString *remoteControllerId;
  objc_super v27;

  v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CBPeripheral;
  v7 = -[CBPeer initWithInfo:manager:](&v27, sel_initWithInfo_manager_, v6, a3);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAdvertisementData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBAdvDataAppearance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_appearance = objc_msgSend(v11, "unsignedShortValue");

    RSSI = v7->_RSSI;
    v7->_RSSI = 0;

    v7->_state = 0;
    services = v7->_services;
    v7->_services = 0;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributes = v7->_attributes;
    v7->_attributes = v14;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isConnectedToSystem = objc_msgSend(v16, "BOOLValue");

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    l2capChannels = v7->_l2capChannels;
    v7->_l2capChannels = (NSHashTable *)v17;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAncsAuthorization"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_ancsAuthorized = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("kCBMsgArgVisibleInSettings"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgVisibleInSettings"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_visibleInSettings = objc_msgSend(v21, "BOOLValue");

    }
    else
    {
      v7->_visibleInSettings = 1;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgWhbStableIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    stableIdentifier = v7->_stableIdentifier;
    v7->_stableIdentifier = (NSString *)v22;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgWhbRemoteControllerId"));
    v24 = objc_claimAutoreleasedReturnValue();
    remoteControllerId = v7->_remoteControllerId;
    v7->_remoteControllerId = (NSString *)v24;

    -[CBPeripheral addObserver:forKeyPath:options:context:](v7, "addObserver:forKeyPath:options:context:", v7, CFSTR("delegate"), 0, 0);
    -[CBPeripheral updateFindMyInfo:](v7, "updateFindMyInfo:", v6);
  }

  return v7;
}

- (void)updateFindMyInfo:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *findMyGroupMembers;
  NSString *v7;
  NSString *findMySerialNumberString;
  void *v9;
  void *v10;
  NSUUID *v11;
  NSUUID *findMyBeaconIdentifier;
  NSUUID *v13;
  NSUUID *findMyUserIdentifier;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgFindMyGroupMembers"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  findMyGroupMembers = self->_findMyGroupMembers;
  self->_findMyGroupMembers = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgFindMySerialNumberString"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  findMySerialNumberString = self->_findMySerialNumberString;
  self->_findMySerialNumberString = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgFindMyPartNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_findMyPartIdentifier = objc_msgSend(v9, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgFindMyManaged"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_managedByFindMy = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgFindMyBeaconID"));
  v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  findMyBeaconIdentifier = self->_findMyBeaconIdentifier;
  self->_findMyBeaconIdentifier = v11;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgFindMyUserID"));
  v13 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  findMyUserIdentifier = self->_findMyUserIdentifier;
  self->_findMyUserIdentifier = v13;

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: Forcing disconnection of unused peripheral %@. Did you forget to cancel the connection?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMyUserIdentifier, 0);
  objc_storeStrong((id *)&self->_findMyBeaconIdentifier, 0);
  objc_storeStrong((id *)&self->_findMySerialNumberString, 0);
  objc_storeStrong((id *)&self->_findMyGroupMembers, 0);
  objc_storeStrong((id *)&self->_stableIdentifier, 0);
  objc_storeStrong((id *)&self->_BDAddress, 0);
  objc_storeStrong((id *)&self->_l2capChannels, 0);
  objc_storeStrong((id *)&self->_remoteControllerId, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_RSSI, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (id)description
{
  unint64_t state;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  state = self->_state;
  if (state > 3)
    v4 = 0;
  else
    v4 = off_1E5400A78[state];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[CBPeer identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, identifier = %@, name = %@, mtu = %lu, state = %@>"), v6, self, v8, self->_name, -[CBPeer mtuLength](self, "mtuLength"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)extendedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CBPeripheral description](self, "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = "YES";
  if (self->_visibleInSettings)
    v7 = "YES";
  else
    v7 = "NO";
  if (!self->_managedByFindMy)
    v6 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ visibleInSettings %s findMyPartId:%d findMySerialNum:%@ findMyGroupMembers:%@ _findMyBeaconIdentifier:%@ _findMyUserIdentifier:%@ managedByFindMy:%s "), v4, v7, self->_findMyPartIdentifier, self->_findMySerialNumberString, self->_findMyGroupMembers, self->_findMyBeaconIdentifier, self->_findMyUserIdentifier, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)sendMsg:(int)a3 args:(id)a4
{
  -[CBPeripheral sendMsg:requiresConnected:args:](self, "sendMsg:requiresConnected:args:", *(_QWORD *)&a3, 1, a4);
}

- (void)sendMsg:(int)a3 requiresConnected:(BOOL)a4 args:(id)a5
{
  _BOOL4 v5;
  unsigned __int16 v6;
  id v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[CBPeer manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (self->_state == 2 || !v5)
      goto LABEL_9;
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    {
      -[CBClassicPeer sendMsg:requiresConnected:args:].cold.2();
      if (v8)
        goto LABEL_11;
    }
    else
    {
LABEL_9:
      if (v8)
      {
LABEL_11:
        -[CBPeer identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("kCBMsgArgDeviceUUID"));

        -[CBPeer manager](self, "manager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sendMsg:args:", v6, v8);

LABEL_12:
        return;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    goto LABEL_12;
  -[CBPeripheral sendMsg:requiresConnected:args:].cold.1();

}

- (id)sendSyncMsg:(int)a3 args:(id)a4
{
  unsigned __int16 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CBPeer identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kCBMsgArgDeviceUUID"));

  -[CBPeer manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendSyncMsg:args:", v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)sendMsg:(int)a3 args:(id)a4 withReply:(id)a5
{
  unsigned __int16 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CBPeer identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("kCBMsgArgDeviceUUID"));

  -[CBPeer manager](self, "manager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sendMsg:args:withReply:", v6, v8, v9);

  return v12;
}

- (void)handleMsg:(int)a3 args:(id)a4
{
  uint64_t v4;
  id v6;
  char **v7;
  char **v8;
  objc_super v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = &selRef_handleVisibilityChanged_;
  v8 = &selRef_handleNameUpdated_;
  switch((int)v4)
  {
    case 178:
      goto LABEL_30;
    case 179:
      v7 = &selRef_handleServicesChanged_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 180:
      v7 = &selRef_handleRSSIUpdated_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 181:
      v7 = &selRef_handleServicesDiscovered_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 182:
      v7 = &selRef_handleTimeSyncResponse_;
      goto LABEL_31;
    case 183:
    case 184:
    case 186:
    case 187:
    case 188:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 198:
    case 201:
    case 202:
      goto LABEL_8;
    case 185:
      goto LABEL_31;
    case 189:
      v7 = &selRef_handleServiceIncludedServicesDiscovered_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 190:
      v7 = &selRef_handleServiceCharacteristicsDiscovered_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 196:
      v7 = &selRef_handleCharacteristicValueUpdated_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 197:
      v7 = &selRef_handleCharacteristicValueWritten_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 199:
      v7 = &selRef_handleCharacteristicValueNotifying_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 200:
      v7 = &selRef_handleCharacteristicDescriptorsDiscovered_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 203:
      v7 = &selRef_handleDescriptorValueUpdated_;
      if (self->_state != 2)
        goto LABEL_33;
      goto LABEL_31;
    case 204:
      v8 = &selRef_handleDescriptorValueWritten_;
LABEL_30:
      v7 = v8;
      if (self->_state == 2)
        goto LABEL_31;
      goto LABEL_33;
    default:
      if ((_DWORD)v4 == 23)
      {
        v7 = &selRef_handleL2CAPChannelOpened_;
        if (self->_state != 2)
          goto LABEL_33;
LABEL_31:
        objc_msgSend(self, *v7, v6);

        return;
      }
      if ((_DWORD)v4 != 24)
      {
LABEL_8:
        v9.receiver = self;
        v9.super_class = (Class)CBPeripheral;
        -[CBPeer handleMsg:args:](&v9, sel_handleMsg_args_, v4, v6);
LABEL_9:

        return;
      }
      v7 = &selRef_handleL2CAPChannelClosed_;
      if (self->_state == 2)
        goto LABEL_31;
LABEL_33:
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        goto LABEL_9;
      -[CBPeripheral handleMsg:args:].cold.1();

      return;
  }
}

- (id)attributeForHandle:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", a3);
}

- (void)setAttribute:(id)a3 forHandle:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)removeAttributeForHandle:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_attributes, "removeObjectForKey:", a3);
}

- (void)invalidateAllAttributes
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v3 = self->_services;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidate", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CBPeripheral setServices:](self, "setServices:", 0);
}

- (void)handleSuccessfulConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgATTMTU"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgIsLinkEncrypted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionTransport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgConnectionRole"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBPeer setHostState:](self, "setHostState:", 0);
  -[CBPeer setMtuLength:](self, "setMtuLength:", objc_msgSend(v8, "unsignedIntegerValue"));
  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", objc_msgSend(v5, "BOOLValue"));
  -[CBPeripheral setCanSendWriteWithoutResponse:](self, "setCanSendWriteWithoutResponse:", 1);
  -[CBPeer setConnectedTransport:](self, "setConnectedTransport:", objc_msgSend(v6, "unsignedIntegerValue"));
  if (v7)
    -[CBPeer setRole:](self, "setRole:", objc_msgSend(v7, "unsignedIntegerValue"));
  -[CBPeripheral setState:](self, "setState:", 2);

}

- (void)handleFailedConnection
{
  -[CBPeripheral setState:](self, "setState:", 0);
}

- (void)handleDisconnection
{
  -[CBPeripheral setRSSI:](self, "setRSSI:", 0);
  -[CBPeripheral setState:](self, "setState:", 0);
  -[CBPeer setHostState:](self, "setHostState:", 0);
  -[CBPeer setMtuLength:](self, "setMtuLength:", 23);
  -[CBPeer setIsLinkEncrypted:](self, "setIsLinkEncrypted:", 0);
  -[CBPeripheral setCanSendWriteWithoutResponse:](self, "setCanSendWriteWithoutResponse:", 0);
  -[CBPeer setRole:](self, "setRole:", -1);
  -[CBPeripheral invalidateAllAttributes](self, "invalidateAllAttributes");
  -[CBPeripheral setRemoteControllerId:](self, "setRemoteControllerId:", 0);
}

- (void)handleConnectionStateUpdated:(BOOL)a3
{
  self->_isConnectedToSystem = a3;
}

- (void)setOrphan
{
  -[CBPeer setManager:](self, "setManager:", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id WeakRetained;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  __int16 v34;
  id v35;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("delegate"), a4, a5, a6))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 2;
    else
      v9 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v9;

    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 4;
    else
      v11 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v11;

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 8;
    else
      v13 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFF7 | v13;

    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 16;
    else
      v15 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v15;

    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 32;
    else
      v17 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v17;

    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 64;
    else
      v19 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v19;

    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = 128;
    else
      v21 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v21;

    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = 256;
    else
      v23 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v23;

    v24 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = 512;
    else
      v25 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFDFF | v25;

    v26 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = 1024;
    else
      v27 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFBFF | v27;

    v28 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = 2048;
    else
      v29 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xF7FF | v29;

    v30 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = 4096;
    else
      v31 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xEFFF | v31;

    v32 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v33 = 0x2000;
    else
      v33 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xDFFF | v33;

    v35 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = 0x4000;
    else
      v34 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xBFFF | v34;

  }
}

- (BOOL)isConnected
{
  return self->_state == 2;
}

- (void)readRSSI
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: Reading RSSI for peripheral %@ while delegate is either nil or does not implement peripheral:didReadRSSI:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)discoverServices:(NSArray *)serviceUUIDs
{
  NSArray *v4;
  NSArray *v5;
  void *v6;

  v4 = serviceUUIDs;
  if ((*(_WORD *)&self->_delegateFlags & 0x10) == 0)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBPeripheral discoverServices:].cold.1();
  }
  if (v4)
    v5 = v4;
  else
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("kCBMsgArgUUIDs"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 176, v6);

}

- (void)discoverIncludedServices:(NSArray *)includedServiceUUIDs forService:(CBService *)service
{
  NSArray *v7;
  CBService *v8;
  CBPeripheral *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = includedServiceUUIDs;
  v8 = service;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service != nil"));

  }
  if ((*(_WORD *)&self->_delegateFlags & 0x20) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    -[CBPeripheral discoverIncludedServices:forService:].cold.2();
  }
LABEL_6:
  -[CBService peripheral](v8, "peripheral");
  v9 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    v10 = (void *)MEMORY[0x1E0C99E08];
    if (v7)
      v11 = v7;
    else
      v11 = (NSArray *)MEMORY[0x1E0C9AA60];
    -[CBService startHandle](v8, "startHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBService endHandle](v8, "endHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("kCBMsgArgUUIDs"), v12, CFSTR("kCBMsgArgServiceStartHandle"), v13, CFSTR("kCBMsgArgServiceEndHandle"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 187, v14);

  }
  else
  {
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
LABEL_9:
      -[CBPeripheral discoverIncludedServices:forService:].cold.1();
  }
LABEL_14:

}

- (void)discoverCharacteristics:(NSArray *)characteristicUUIDs forService:(CBService *)service
{
  NSArray *v7;
  CBService *v8;
  CBPeripheral *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = characteristicUUIDs;
  v8 = service;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service != nil"));

  }
  if ((*(_WORD *)&self->_delegateFlags & 0x40) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    -[CBPeripheral discoverCharacteristics:forService:].cold.2();
  }
LABEL_6:
  -[CBService peripheral](v8, "peripheral");
  v9 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    v10 = (void *)MEMORY[0x1E0C99E08];
    if (v7)
      v11 = v7;
    else
      v11 = (NSArray *)MEMORY[0x1E0C9AA60];
    -[CBService startHandle](v8, "startHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBService endHandle](v8, "endHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("kCBMsgArgUUIDs"), v12, CFSTR("kCBMsgArgServiceStartHandle"), v13, CFSTR("kCBMsgArgServiceEndHandle"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 188, v14);

  }
  else
  {
    if (CBLogInitOnce != -1)
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
LABEL_9:
      -[CBPeripheral discoverIncludedServices:forService:].cold.1();
  }
LABEL_14:

}

- (void)readValueForCharacteristic:(CBCharacteristic *)characteristic
{
  CBCharacteristic *v5;
  CBPeripheral *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = characteristic;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 445, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic != nil"));

  }
  if ((*(_WORD *)&self->_delegateFlags & 0x80) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    -[CBPeripheral readValueForCharacteristic:].cold.2();
  }
LABEL_6:
  -[CBCharacteristic peripheral](v5, "peripheral");
  v6 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    -[CBCharacteristic handle](v5, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCharacteristic valueHandle](v5, "valueHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("kCBMsgArgCharacteristicHandle"), v9, CFSTR("kCBMsgArgCharacteristicValueHandle"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 191, v10);

    goto LABEL_11;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
LABEL_9:
    -[CBPeripheral readValueForCharacteristic:].cold.1();
LABEL_11:

}

- (NSUInteger)maximumWriteValueLengthForType:(CBCharacteristicWriteType)type
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if (type == CBCharacteristicWriteWithResponse)
    return 512;
  if (type != CBCharacteristicWriteWithoutResponse)
    return 0;
  v5 = -[CBPeer mtuLength](self, "mtuLength", v3, v4);
  if (v5 - 3 >= 0x200)
    return 512;
  else
    return v5 - 3;
}

- (void)isReadyForUpdates
{
  unsigned int v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  v3 = -[CBPeripheral writesPending](self, "writesPending");
  -[CBPeripheral setWritesPending:](self, "setWritesPending:", 0);
  -[CBPeripheral setCanSendWriteWithoutResponse:](self, "setCanSendWriteWithoutResponse:", 1);
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "peripheralIsReadyToSendWriteWithoutResponse:", self);

      }
    }
  }
}

- (void)writeValue:(NSData *)data forCharacteristic:(CBCharacteristic *)characteristic type:(CBCharacteristicWriteType)type
{
  NSData *v9;
  CBCharacteristic *v10;
  CBCharacteristic *v11;
  CBPeripheral *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = data;
  v10 = characteristic;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 491, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 492, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic != nil"));

LABEL_3:
  -[CBCharacteristic peripheral](v11, "peripheral");
  v12 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v12 == self)
  {
    if (type == CBCharacteristicWriteWithoutResponse && (-[CBCharacteristic properties](v11, "properties") & 4) == 0)
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        -[CBPeripheral writeValue:forCharacteristic:type:].cold.1();
    }
    v13 = (void *)MEMORY[0x1E0C99E08];
    -[CBCharacteristic handle](v11, "handle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCharacteristic valueHandle](v11, "valueHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", type);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, CFSTR("kCBMsgArgCharacteristicHandle"), v15, CFSTR("kCBMsgArgCharacteristicValueHandle"), v9, CFSTR("kCBMsgArgData"), v16, CFSTR("kCBMsgArgType"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 192, v17);

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBPeripheral readValueForCharacteristic:].cold.1();
  }
  if (type == CBCharacteristicWriteWithoutResponse)
  {
    -[CBPeripheral setWritesPending:](self, "setWritesPending:", -[CBPeripheral writesPending](self, "writesPending") + 1);
    -[CBPeripheral setCanSendWriteWithoutResponse:](self, "setCanSendWriteWithoutResponse:", -[CBPeripheral writesPending](self, "writesPending") == 0);
  }

}

- (void)setBroadcastValue:(BOOL)a3 forCharacteristic:(id)a4
{
  _BOOL8 v4;
  id v7;
  CBPeripheral *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 518, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic != nil"));

  }
  objc_msgSend(v7, "peripheral");
  v8 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v8 == self)
  {
    v9 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v7, "handle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("kCBMsgArgCharacteristicHandle"), v11, CFSTR("kCBMsgArgCharacteristicValueHandle"), v12, CFSTR("kCBMsgArgState"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 193, v13);

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBPeripheral readValueForCharacteristic:].cold.1();
  }

}

- (void)setNotifyValue:(BOOL)enabled forCharacteristic:(CBCharacteristic *)characteristic
{
  _BOOL8 v4;
  CBCharacteristic *v7;
  CBPeripheral *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = enabled;
  v7 = characteristic;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 534, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic != nil"));

  }
  -[CBCharacteristic peripheral](v7, "peripheral");
  v8 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v8 == self)
  {
    v9 = (void *)MEMORY[0x1E0C99E08];
    -[CBCharacteristic handle](v7, "handle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCharacteristic valueHandle](v7, "valueHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("kCBMsgArgCharacteristicHandle"), v11, CFSTR("kCBMsgArgCharacteristicValueHandle"), v12, CFSTR("kCBMsgArgState"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 194, v13);

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBPeripheral readValueForCharacteristic:].cold.1();
  }

}

- (void)discoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic
{
  CBCharacteristic *v5;
  CBPeripheral *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = characteristic;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 550, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic != nil"));

  }
  if ((*(_WORD *)&self->_delegateFlags & 0x400) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    -[CBPeripheral discoverDescriptorsForCharacteristic:].cold.2();
  }
LABEL_6:
  -[CBCharacteristic peripheral](v5, "peripheral");
  v6 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    -[CBCharacteristic handle](v5, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCharacteristic valueHandle](v5, "valueHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("kCBMsgArgCharacteristicHandle"), v9, CFSTR("kCBMsgArgCharacteristicValueHandle"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 195, v10);

    goto LABEL_11;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
LABEL_9:
    -[CBPeripheral readValueForCharacteristic:].cold.1();
LABEL_11:

}

- (void)readValueForDescriptor:(CBDescriptor *)descriptor
{
  CBDescriptor *v5;
  CBPeripheral *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = descriptor;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 569, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor != nil"));

  }
  if ((*(_WORD *)&self->_delegateFlags & 0x800) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
    }
    -[CBPeripheral readValueForDescriptor:].cold.2();
  }
LABEL_6:
  -[CBDescriptor peripheral](v5, "peripheral");
  v6 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    -[CBDescriptor handle](v5, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("kCBMsgArgDescriptorHandle"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 201, v9);

    goto LABEL_11;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
LABEL_9:
    -[CBPeripheral readValueForDescriptor:].cold.1();
LABEL_11:

}

- (void)writeValue:(NSData *)data forDescriptor:(CBDescriptor *)descriptor
{
  NSData *v7;
  CBDescriptor *v8;
  CBDescriptor *v9;
  void *v10;
  void *v11;
  int v12;
  CBPeripheral *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = data;
  v8 = descriptor;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 587, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 588, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor != nil"));

LABEL_3:
  -[CBAttribute UUID](v9, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("2902"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 590, CFSTR("Client Characteristic Configuration descriptors must be configured using setNotifyValue:forCharacteristic:"));

  }
  -[CBDescriptor peripheral](v9, "peripheral");
  v13 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();

  if (v13 == self)
  {
    v14 = (void *)MEMORY[0x1E0C99E08];
    -[CBDescriptor handle](v9, "handle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, CFSTR("kCBMsgArgDescriptorHandle"), v7, CFSTR("kCBMsgArgData"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 202, v16);

  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBPeripheral readValueForDescriptor:].cold.1();
  }

}

- (void)setPeripheralName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 608, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    v5 = 0;
  }
  -[CBPeripheral setName:](self, "setName:", v5);
  v6 = (void *)MEMORY[0x1E0C99E08];
  -[CBPeer identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("kCBMsgArgDeviceUUID"), v10, CFSTR("kCBMsgArgName"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 183, v8);

}

- (void)setVisibleInSettings:(BOOL)a3
{
  self->_visibleInSettings = a3;
}

- (void)getTimeSyncData
{
  -[CBPeripheral sendMsg:requiresConnected:args:](self, "sendMsg:requiresConnected:args:", 177, 0, 0);
}

- (void)setHighPriorityStream:(BOOL)a3 duration:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  -[CBPeer identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v10, CFSTR("kCBMsgArgDeviceUUID"), v8, CFSTR("kCBMsgArgSetHighPriorityStream"), v7, CFSTR("kCBMsgArgHighPriorityStreamDuration"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 184, v9);
}

- (void)openL2CAPChannel:(CBL2CAPPSM)PSM
{
  -[CBPeripheral openL2CAPChannel:options:](self, "openL2CAPChannel:options:", PSM, 0);
}

- (void)openL2CAPChannel:(unsigned __int16)a3 priority:(int64_t)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v4 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("kCBL2CAPChannelPriority");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeripheral openL2CAPChannel:options:](self, "openL2CAPChannel:options:", v4, v7);

}

- (void)openL2CAPChannel:(unsigned __int16)a3 options:(id)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = a4;
  if (!(_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBPeripheral.m"), 652, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("psm > 0"));

  }
  v7 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)MEMORY[0x1E0C9AA70];
  if (v12)
    v9 = v12;
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("kCBMsgArgPSM"), v9, CFSTR("kCBMsgArgOptions"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBPeripheral sendMsg:args:](self, "sendMsg:args:", 25, v10);

}

- (id)l2capChannelForPeer:(id)a3 withPsm:(unsigned __int16)a4
{
  int v4;
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_l2capChannels;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      objc_msgSend(v12, "peer", (_QWORD)v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqual:", v6))
      {
        v14 = objc_msgSend(v12, "PSM");

        if (v14 == v4)
        {
          v15 = v12;

          goto LABEL_17;
        }
      }
      else
      {

      }
      if (v9 == ++v11)
      {
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (!v9)
          break;
        goto LABEL_4;
      }
    }
  }

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    -[CBPeripheral l2capChannelForPeer:withPsm:].cold.1();
  v15 = 0;
LABEL_17:

  return v15;
}

- (void)removeAllL2CAPChannels
{
  -[NSHashTable removeAllObjects](self->_l2capChannels, "removeAllObjects");
}

- (void)enableFastLeConnection:(BOOL)a3 withInfo:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  -[CBPeer identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("kCBMsgArgDeviceUUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("kCBMsgArgEnable"));

  if (v8 && objc_msgSend(v8, "length"))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("kCBFastLeConnectionInfoData"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__CBPeripheral_enableFastLeConnection_withInfo_completion___block_invoke;
  v14[3] = &unk_1E53FF618;
  v15 = v9;
  v13 = v9;
  -[CBPeripheral sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 186, v10, v14);

}

void __59__CBPeripheral_enableFastLeConnection_withInfo_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (void)handleNameUpdated:(id)a3
{
  id WeakRetained;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeripheral setName:](self, "setName:");
  if ((*(_WORD *)&self->_delegateFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "peripheralDidUpdateName:", self);

  }
}

- (void)handleServicesChanged:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id WeakRetained;
  id v20;
  CBPeripheral *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceStartHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceEndHandle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = self;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = self->_services;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "endHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedShortValue");
        if (v13 < objc_msgSend(v5, "unsignedShortValue"))
        {

        }
        else
        {
          objc_msgSend(v11, "startHandle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedShortValue");
          v16 = objc_msgSend(v23, "unsignedShortValue");

          if (v15 <= v16)
          {
            objc_msgSend(v11, "invalidate");
            objc_msgSend(v22, "addObject:", v11);
          }
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v22, "count"))
  {
    v17 = (void *)-[NSArray mutableCopy](v21->_services, "mutableCopy");
    objc_msgSend(v17, "removeObjectsInArray:", v22);
    -[CBPeripheral setServices:](v21, "setServices:", v17);

  }
  if ((*(_WORD *)&v21->_delegateFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v21->_delegate);
    objc_msgSend(WeakRetained, "peripheral:didModifyServices:", v21, v22);

    v18 = v20;
  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v18 = v20;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBPeripheral handleServicesChanged:].cold.1();
  }

}

- (void)handleRSSIUpdated:(id)a3
{
  id v4;
  void *v5;
  __int16 delegateFlags;
  id WeakRetained;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  delegateFlags = (__int16)self->_delegateFlags;
  if ((delegateFlags & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "peripheral:didReadRSSI:error:", self, v8, v5);
LABEL_8:

    goto LABEL_9;
  }
  if (v5)
  {
    if ((delegateFlags & 8) == 0)
      goto LABEL_9;
    goto LABEL_7;
  }
  -[CBPeripheral setRSSI:](self, "setRSSI:", v8);
  if ((*(_WORD *)&self->_delegateFlags & 8) != 0)
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "peripheralDidUpdateRSSI:error:", self, v5);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)handleVisibilityChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCBMsgArgVisibleInSettings"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_visibleInSettings = objc_msgSend(v4, "BOOLValue");

}

- (void)handleTimeSyncResponse:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_delegateFlags & 0x2000) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTimeOfDay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgLocalRefTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRemoteRefTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTimeToSend"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kCBMsgArgGMTDelta"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "peripheral:didReceiveTimeSyncWithReferenceTime:localAbsolute:remoteAbsolute:receiveTime:GMTDelta:error:", self, v6, v7, v8, v9, v10, v4);

  }
}

- (void)handleServicesDiscovered:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CBService *v14;
  void *v15;
  CBPeripheral *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  CBPeripheral *v28;
  __int16 v29;
  CBPeripheral *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v22 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_services);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (!v10)
    {
LABEL_29:

      v21 = (void *)objc_msgSend(v8, "copy");
      -[CBPeripheral setServices:](self, "setServices:", v21);

      v5 = 0;
      v4 = v22;
      if ((*(_WORD *)&self->_delegateFlags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_3;
    }
    v11 = v10;
    v12 = *(_QWORD *)v24;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceStartHandle"));
      v16 = (CBPeripheral *)objc_claimAutoreleasedReturnValue();
      -[CBPeripheral attributeForHandle:](self, "attributeForHandle:", v16);
      v14 = (CBService *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
          goto LABEL_15;
      }
      else
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || objc_msgSend(v18, "length") != 2 && objc_msgSend(v18, "length") != 4 && objc_msgSend(v18, "length") != 16)
        {
          if (CBLogInitOnce != -1)
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          v20 = CBLogComponent;
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v28 = self;
            v29 = 2112;
            v30 = v16;
            _os_log_debug_impl(&dword_1A82A2000, v20, OS_LOG_TYPE_DEBUG, "Data in %@ does not contain a valid UUID for service handle = %@", buf, 0x16u);
          }

          v14 = 0;
          goto LABEL_10;
        }
        v14 = -[CBService initWithPeripheral:dictionary:]([CBService alloc], "initWithPeripheral:dictionary:", self, v15);
        -[CBService startHandle](v14, "startHandle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBPeripheral setAttribute:forHandle:](self, "setAttribute:forHandle:", v14, v19);

        if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
        {
LABEL_15:
          objc_msgSend(v8, "addObject:", v14);
          if (CBLogInitOnce != -1)
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          v17 = CBLogComponent;
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v28 = (CBPeripheral *)v14;
            v29 = 2112;
            v30 = self;
            _os_log_debug_impl(&dword_1A82A2000, v17, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
          }
        }
      }
LABEL_10:

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (!v11)
          goto LABEL_29;
        goto LABEL_8;
      }
    }
  }
  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
LABEL_3:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "peripheral:didDiscoverServices:", self, v5);

  }
LABEL_4:

}

- (void)handleL2CAPChannelOpened:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  CBL2CAPChannel *v8;
  void *v9;

  v4 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v5 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBPeripheral handleL2CAPChannelOpened:].cold.2(v5);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (CBLogInitOnce == -1)
    {
      v7 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v7 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        v8 = 0;
        if ((*(_WORD *)&self->_delegateFlags & 0x4000) == 0)
          goto LABEL_12;
        goto LABEL_11;
      }
    }
    -[CBPeripheral handleL2CAPChannelOpened:].cold.1(v7);
    v8 = 0;
    if ((*(_WORD *)&self->_delegateFlags & 0x4000) == 0)
      goto LABEL_12;
LABEL_11:
    -[CBPeripheral delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "peripheral:didOpenL2CAPChannel:error:", self, v8, v6);

    goto LABEL_12;
  }
  v8 = -[CBL2CAPChannel initWithPeer:info:]([CBL2CAPChannel alloc], "initWithPeer:info:", self, v4);
  -[NSHashTable addObject:](self->_l2capChannels, "addObject:", v8);
  if ((*(_WORD *)&self->_delegateFlags & 0x4000) != 0)
    goto LABEL_11;
LABEL_12:

}

- (void)handleL2CAPChannelClosed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;
  NSObject *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "errorWithInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kCBMsgArgPSM"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "intValue");
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v9 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBPeripheral handleL2CAPChannelClosed:].cold.1(v8, (uint64_t)v6, v9);
  -[CBPeripheral l2capChannelForPeer:withPsm:](self, "l2capChannelForPeer:withPsm:", self, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable removeObject:](self->_l2capChannels, "removeObject:", v10);

}

- (void)handleAttributeEvent:(id)a3 args:(id)a4 attributeSelector:(SEL)a5 delegateSelector:(SEL)a6 delegateFlag:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id WeakRetained;
  id v18;

  v7 = a7;
  v18 = a4;
  -[CBPeripheral attributeForHandle:](self, "attributeForHandle:", a3);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if (v12)
  {
    v14 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(v14, a5, v18);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    if (v14 && v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, a6, self, v14, v15);

    }
    v13 = v18;
  }

}

- (void)handleServiceEvent:(id)a3 serviceSelector:(SEL)a4 delegateSelector:(SEL)a5 delegateFlag:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a6;
  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgServiceStartHandle"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeripheral handleAttributeEvent:args:attributeSelector:delegateSelector:delegateFlag:](self, "handleAttributeEvent:args:attributeSelector:delegateSelector:delegateFlag:", v11, v10, a4, a5, v6);

}

- (void)handleCharacteristicEvent:(id)a3 characteristicSelector:(SEL)a4 delegateSelector:(SEL)a5 delegateFlag:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a6;
  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCharacteristicHandle"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeripheral handleAttributeEvent:args:attributeSelector:delegateSelector:delegateFlag:](self, "handleAttributeEvent:args:attributeSelector:delegateSelector:delegateFlag:", v11, v10, a4, a5, v6);

}

- (void)handleDescriptorEvent:(id)a3 descriptorSelector:(SEL)a4 delegateSelector:(SEL)a5 delegateFlag:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a6;
  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDescriptorHandle"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CBPeripheral handleAttributeEvent:args:attributeSelector:delegateSelector:delegateFlag:](self, "handleAttributeEvent:args:attributeSelector:delegateSelector:delegateFlag:", v11, v10, a4, a5, v6);

}

- (void)handleServiceIncludedServicesDiscovered:(id)a3
{
  -[CBPeripheral handleServiceEvent:serviceSelector:delegateSelector:delegateFlag:](self, "handleServiceEvent:serviceSelector:delegateSelector:delegateFlag:", a3, sel_handleIncludedServicesDiscovered_, sel_peripheral_didDiscoverIncludedServicesForService_error_, (*(_WORD *)&self->_delegateFlags >> 5) & 1);
}

- (void)handleServiceCharacteristicsDiscovered:(id)a3
{
  -[CBPeripheral handleServiceEvent:serviceSelector:delegateSelector:delegateFlag:](self, "handleServiceEvent:serviceSelector:delegateSelector:delegateFlag:", a3, sel_handleCharacteristicsDiscovered_, sel_peripheral_didDiscoverCharacteristicsForService_error_, (*(_WORD *)&self->_delegateFlags >> 6) & 1);
}

- (void)handleCharacteristicValueUpdated:(id)a3
{
  -[CBPeripheral handleCharacteristicEvent:characteristicSelector:delegateSelector:delegateFlag:](self, "handleCharacteristicEvent:characteristicSelector:delegateSelector:delegateFlag:", a3, sel_handleValueUpdated_, sel_peripheral_didUpdateValueForCharacteristic_error_, (*(_WORD *)&self->_delegateFlags >> 7) & 1);
}

- (void)handleCharacteristicValueWritten:(id)a3
{
  -[CBPeripheral handleCharacteristicEvent:characteristicSelector:delegateSelector:delegateFlag:](self, "handleCharacteristicEvent:characteristicSelector:delegateSelector:delegateFlag:", a3, sel_handleValueWritten_, sel_peripheral_didWriteValueForCharacteristic_error_, HIBYTE(*(_WORD *)&self->_delegateFlags) & 1);
}

- (void)handleCharacteristicValueNotifying:(id)a3
{
  -[CBPeripheral handleCharacteristicEvent:characteristicSelector:delegateSelector:delegateFlag:](self, "handleCharacteristicEvent:characteristicSelector:delegateSelector:delegateFlag:", a3, sel_handleValueNotifying_, sel_peripheral_didUpdateNotificationStateForCharacteristic_error_, (*(_WORD *)&self->_delegateFlags >> 9) & 1);
}

- (void)handleCharacteristicDescriptorsDiscovered:(id)a3
{
  -[CBPeripheral handleCharacteristicEvent:characteristicSelector:delegateSelector:delegateFlag:](self, "handleCharacteristicEvent:characteristicSelector:delegateSelector:delegateFlag:", a3, sel_handleDescriptorsDiscovered_, sel_peripheral_didDiscoverDescriptorsForCharacteristic_error_, (*(_WORD *)&self->_delegateFlags >> 10) & 1);
}

- (void)handleDescriptorValueUpdated:(id)a3
{
  -[CBPeripheral handleDescriptorEvent:descriptorSelector:delegateSelector:delegateFlag:](self, "handleDescriptorEvent:descriptorSelector:delegateSelector:delegateFlag:", a3, sel_handleValueUpdated_, sel_peripheral_didUpdateValueForDescriptor_error_, (*(_WORD *)&self->_delegateFlags >> 11) & 1);
}

- (void)handleDescriptorValueWritten:(id)a3
{
  -[CBPeripheral handleDescriptorEvent:descriptorSelector:delegateSelector:delegateFlag:](self, "handleDescriptorEvent:descriptorSelector:delegateSelector:delegateFlag:", a3, sel_handleValueWritten_, sel_peripheral_didWriteValueForDescriptor_error_, (*(_WORD *)&self->_delegateFlags >> 12) & 1);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)RSSI
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRSSI:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CBPeripheralState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSArray)services
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)canSendWriteWithoutResponse
{
  return self->_canSendWriteWithoutResponse;
}

- (void)setCanSendWriteWithoutResponse:(BOOL)a3
{
  self->_canSendWriteWithoutResponse = a3;
}

- (BOOL)ancsAuthorized
{
  return self->_ancsAuthorized;
}

- (void)setAncsAuthorized:(BOOL)a3
{
  self->_ancsAuthorized = a3;
}

- (unsigned)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(unsigned __int16)a3
{
  self->_appearance = a3;
}

- (unsigned)writesPending
{
  return self->_writesPending;
}

- (void)setWritesPending:(unsigned int)a3
{
  self->_writesPending = a3;
}

- (NSString)remoteControllerId
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRemoteControllerId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)isConnectedToSystem
{
  return self->_connectedToSystem;
}

- (NSHashTable)l2capChannels
{
  return self->_l2capChannels;
}

- (NSString)BDAddress
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBDAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)visibleInSettings
{
  return self->_visibleInSettings;
}

- (NSString)stableIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStableIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (unsigned)findMyPartIdentifier
{
  return self->_findMyPartIdentifier;
}

- (NSArray)findMyGroupMembers
{
  return self->_findMyGroupMembers;
}

- (NSString)findMySerialNumberString
{
  return self->_findMySerialNumberString;
}

- (NSUUID)findMyBeaconIdentifier
{
  return self->_findMyBeaconIdentifier;
}

- (NSUUID)findMyUserIdentifier
{
  return self->_findMyUserIdentifier;
}

- (BOOL)managedByFindMy
{
  return self->_managedByFindMy;
}

- (void)sendMsg:requiresConnected:args:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "WARNING: %@ is not a valid peripheral", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMsg:args:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_1(&dword_1A82A2000, v0, v1, "%@ is not connected, ignoring message: %u");
  OUTLINED_FUNCTION_1();
}

- (void)discoverServices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: Discovering services for peripheral %@ while delegate is either nil or does not implement peripheral:didDiscoverServices:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)discoverIncludedServices:forService:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A82A2000, v0, v1, "WARNING: %@ is not a valid service for peripheral %@");
  OUTLINED_FUNCTION_1();
}

- (void)discoverIncludedServices:forService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: Discovering included services for peripheral %@ while delegate is either nil or does not implement peripheral:didDiscoverIncludedServicesForService:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)discoverCharacteristics:forService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: Discovering characteristics on peripheral %@ while delegate is either nil or does not implement peripheral:didDiscoverCharacteristicsForService:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)readValueForCharacteristic:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A82A2000, v0, v1, "WARNING: %@ is not a valid characteristic for peripheral %@");
  OUTLINED_FUNCTION_1();
}

- (void)readValueForCharacteristic:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: Reading characteristic value for peripheral %@ while delegate is either nil or does not implement peripheral:didUpdateValueForCharacteristic:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeValue:forCharacteristic:type:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "WARNING: Characteristic %@ does not specify the \"Write Without Response\" property - ignoring response-less write", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)discoverDescriptorsForCharacteristic:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: Discovering characteristic descriptors for peripheral %@ while delegate is either nil or does not implement peripheral:didDiscoverDescriptorsForCharacteristic:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)readValueForDescriptor:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A82A2000, v0, v1, "WARNING: %@ is not a valid descriptor for peripheral %@");
  OUTLINED_FUNCTION_1();
}

- (void)readValueForDescriptor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: Reading descriptor value for peripheral %@ while delegate is either nil or does not implement peripheral:didUpdateValueForDescriptor:error:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)l2capChannelForPeer:withPsm:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1A82A2000, v1, OS_LOG_TYPE_ERROR, "No known channel matching peer %@ with psm %u", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)handleServicesChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "WARNING: The delegate for %@ does not implement -[peripheral:didModifyServices:]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleL2CAPChannelOpened:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A82A2000, log, OS_LOG_TYPE_ERROR, "Failed to open L2CAP channel", v1, 2u);
}

- (void)handleL2CAPChannelOpened:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A82A2000, log, OS_LOG_TYPE_DEBUG, "l2CAP channel opened", v1, 2u);
}

- (void)handleL2CAPChannelClosed:(NSObject *)a3 .cold.1(unsigned __int16 a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a1;
  LOWORD(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_5_1(&dword_1A82A2000, a2, a3, "l2CAP channel closed with psm : %u and result : %@", v3, (_QWORD)v4, HIWORD(a2));
  OUTLINED_FUNCTION_1();
}

@end
