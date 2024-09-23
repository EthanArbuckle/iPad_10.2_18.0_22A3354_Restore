@implementation VPNConnection

- (VPNConnection)initWithServiceID:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  VPNConnection *v9;
  void *v10;
  uint64_t v11;
  NSString *displayName;
  uint64_t v13;
  NSString *bundleID;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *subConnections;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSString *accountName;
  uint64_t v25;
  NSString *server;
  void *v27;
  uint64_t v28;
  NSString *sharedSecret;
  uint64_t v30;
  NSString *password;
  uint64_t v32;
  id certificate;
  void *v34;
  void *v35;
  NSObject *v36;
  id v38[2];
  id location;
  objc_super v40;
  _BYTE buf[22];
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)VPNConnection;
  v9 = -[VPNConnection init](&v40, sel_init);
  if (v9)
  {
    objc_initWeak(&location, v9);
    objc_msgSend(v8, "objectForKey:", CFSTR("VPNEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_enabled = objc_msgSend(v10, "BOOLValue");

    objc_storeStrong((id *)&v9->_serviceID, a3);
    objc_msgSend(v8, "objectForKey:", CFSTR("dispName"));
    v11 = objc_claimAutoreleasedReturnValue();
    displayName = v9->_displayName;
    v9->_displayName = (NSString *)v11;

    objc_msgSend(v8, "objectForKey:", CFSTR("VPNApplicationBundleID"));
    v13 = objc_claimAutoreleasedReturnValue();
    bundleID = v9->_bundleID;
    v9->_bundleID = (NSString *)v13;

    v15 = dispatch_queue_create("VPNConnection", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v15;

    objc_msgSend(v8, "objectForKey:", CFSTR("VPNGrade"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_grade = objc_msgSend(v17, "unsignedIntegerValue");

    if (v9->_grade == 3)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      subConnections = v9->_subConnections;
      v9->_subConnections = v18;

    }
    if (v9->_queue)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      -[NSUUID getUUIDBytes:](v9->_serviceID, "getUUIDBytes:", buf);
      v20 = (void *)ne_session_create();
      v9->_session = v20;
      v9->_session_status = 1;
      v21 = objc_loadWeakRetained(&location);
      updateNEStatus(v21);

      if (v9->_session)
      {
        objc_copyWeak(v38, &location);
        v38[1] = v20;
        ne_session_set_event_handler();
        objc_destroyWeak(v38);
      }
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("VPNType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_vpnConnectionType = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v8, "objectForKey:", CFSTR("authorization"));
    v23 = objc_claimAutoreleasedReturnValue();
    accountName = v9->_accountName;
    v9->_accountName = (NSString *)v23;

    objc_msgSend(v8, "objectForKey:", CFSTR("server"));
    v25 = objc_claimAutoreleasedReturnValue();
    server = v9->_server;
    v9->_server = (NSString *)v25;

    objc_msgSend(v8, "objectForKey:", CFSTR("securID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_useRSASecurID = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v8, "objectForKey:", CFSTR("secret"));
    v28 = objc_claimAutoreleasedReturnValue();
    sharedSecret = v9->_sharedSecret;
    v9->_sharedSecret = (NSString *)v28;

    objc_msgSend(v8, "objectForKey:", CFSTR("password"));
    v30 = objc_claimAutoreleasedReturnValue();
    password = v9->_password;
    v9->_password = (NSString *)v30;

    objc_msgSend(v8, "objectForKey:", CFSTR("VPNCertificate"));
    v32 = objc_claimAutoreleasedReturnValue();
    certificate = v9->_certificate;
    v9->_certificate = (id)v32;

    v9->_isProviderAvailable = 1;
    objc_msgSend(v8, "objectForKey:", CFSTR("VPNOnDemandUserOverrideDisabled"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_onDemandUserOverrideDisabled = objc_msgSend(v34, "BOOLValue");

    objc_msgSend(v8, "objectForKey:", CFSTR("VPNIsPerApp"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isPerApp = objc_msgSend(v35, "BOOLValue");

    objc_destroyWeak(&location);
  }
  v36 = VPNSettingsCopyLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    v42 = 2112;
    v43 = v8;
    _os_log_debug_impl(&dword_226973000, v36, OS_LOG_TYPE_DEBUG, "New VPN service %@ for service %@, options %@", buf, 0x20u);
  }

  return v9;
}

void __43__VPNConnection_initWithServiceID_options___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2 == 2)
  {
    ne_session_release();
  }
  else if (a2 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    updateNEStatus(WeakRetained);

  }
}

- (void)updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *displayName;
  NSString *v8;
  NSString *bundleID;
  NSString *v10;
  NSString *accountName;
  NSString *v12;
  NSString *server;
  void *v14;
  NSString *v15;
  NSString *sharedSecret;
  NSString *v17;
  NSString *password;
  void *v19;
  id certificate;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("VPNEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_enabled = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("dispName"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayName = self->_displayName;
  self->_displayName = v6;

  objc_msgSend(v4, "objectForKey:", CFSTR("VPNApplicationBundleID"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleID = self->_bundleID;
  self->_bundleID = v8;

  objc_msgSend(v4, "objectForKey:", CFSTR("authorization"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountName = self->_accountName;
  self->_accountName = v10;

  objc_msgSend(v4, "objectForKey:", CFSTR("server"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  server = self->_server;
  self->_server = v12;

  objc_msgSend(v4, "objectForKey:", CFSTR("securID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_useRSASecurID = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("secret"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  sharedSecret = self->_sharedSecret;
  self->_sharedSecret = v15;

  objc_msgSend(v4, "objectForKey:", CFSTR("password"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  password = self->_password;
  self->_password = v17;

  objc_msgSend(v4, "objectForKey:", CFSTR("VPNCertificate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  certificate = self->_certificate;
  self->_certificate = v19;

}

- (void)dealloc
{
  objc_super v3;

  if (-[VPNConnection session](self, "session"))
  {
    -[VPNConnection session](self, "session");
    ne_session_cancel();
    -[VPNConnection setSession:](self, "setSession:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)VPNConnection;
  -[VPNConnection dealloc](&v3, sel_dealloc);
}

- (unint64_t)subConnectionCount
{
  NSMutableArray *subConnections;

  subConnections = self->_subConnections;
  if (subConnections)
    return -[NSMutableArray count](subConnections, "count");
  else
    return 1;
}

- (id)ipAddressesForSubConnection:(unint64_t)a3
{
  NSMutableArray *subConnections;
  void *v6;
  void *v7;

  subConnections = self->_subConnections;
  if (subConnections)
  {
    if (-[NSMutableArray count](subConnections, "count") <= a3)
    {
      v7 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_subConnections, "objectAtIndexedSubscript:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", kVPNSubConnectionIPAddress);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[VPNConnection sessionIPAddresses](self, "sessionIPAddresses", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)remoteAddressForSubConnection:(unint64_t)a3
{
  NSMutableArray *subConnections;
  void *v6;
  __CFString *v7;

  subConnections = self->_subConnections;
  if (subConnections)
  {
    if (-[NSMutableArray count](subConnections, "count") <= a3)
    {
      v7 = &stru_24EE4DF70;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_subConnections, "objectAtIndexedSubscript:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", kVPNSubConnectionRemoteAddress);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[VPNConnection sessionRemoteAddress](self, "sessionRemoteAddress", a3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)connectTimeForSubConnection:(unint64_t)a3
{
  NSMutableArray *subConnections;
  void *v6;
  void *v7;

  subConnections = self->_subConnections;
  if (subConnections)
  {
    if (-[NSMutableArray count](subConnections, "count") <= a3)
    {
      v7 = &unk_24EE55010;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_subConnections, "objectAtIndexedSubscript:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", kVPNSubConnectionConnectTime);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[VPNConnection sessionConnectTime](self, "sessionConnectTime", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)interfaceTypeForSubConnection:(unint64_t)a3
{
  NSMutableArray *subConnections;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  __CFString *v15;

  subConnections = self->_subConnections;
  if (subConnections && -[NSMutableArray count](subConnections, "count") > a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_subConnections, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDE07D8]);
    objc_msgSend(v6, "objectForKeyedSubscript:", kVPNSubConnectionInterfaceName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithInterfaceName:", v8);

    v10 = objc_msgSend(v9, "type");
    switch(v10)
    {
      case 3:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("ETHERNET");
        break;
      case 2:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = CFSTR("CELLULAR");
        break;
      case 1:
        if (interfaceTypeForSubConnection__onceToken != -1)
          dispatch_once(&interfaceTypeForSubConnection__onceToken, &__block_literal_global_43);
        v11 = interfaceTypeForSubConnection__isWLAN;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
          v14 = CFSTR("WLAN");
        else
          v14 = CFSTR("WIFI");
        break;
      default:
        v15 = &stru_24EE4DF70;
LABEL_16:

        return v15;
    }
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24EE4DF70, CFSTR("MobileVPN"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v15 = &stru_24EE4DF70;
  return v15;
}

uint64_t __47__VPNConnection_interfaceTypeForSubConnection___block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  interfaceTypeForSubConnection__isWLAN = result;
  return result;
}

- (id)elapsedTimeLocalizedStringForSubConnection:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  -[VPNConnection connectTimeForSubConnection:](self, "connectTimeForSubConnection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VPNConnection elapsedTimeSinceStartTime:](self, "elapsedTimeSinceStartTime:", v4);

  return -[VPNConnection convertTimeToString:](self, "convertTimeToString:", v5);
}

- (id)_fullOptions
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VPNConnection vpnConnectionType](self, "vpnConnectionType");
  -[VPNConnection accountName](self, "accountName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 2)
  {
    objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x24BDF5AC8]);

    -[VPNConnection server](self, "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDF5AB8];
    v10 = v5;
  }
  else
  {
    objc_msgSend(v4, "setObject:forKey:", v7, *MEMORY[0x24BDF5B50]);

    -[VPNConnection server](self, "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDF5B60];
    v10 = v4;
  }
  objc_msgSend(v10, "setObject:forKey:", v8, v9);

  -[VPNConnection password](self, "password");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[VPNConnection password](self, "password");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == 2)
      v14 = v5;
    else
      v14 = v4;
    v15 = (_QWORD *)MEMORY[0x24BDF5AD0];
    if (v6 != 2)
      v15 = (_QWORD *)MEMORY[0x24BDF5B58];
    objc_msgSend(v14, "setValue:forKey:", v13, *v15);

  }
  -[VPNConnection sharedSecret](self, "sharedSecret");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x24BDF5BC8], *MEMORY[0x24BDF5AB0]);
    -[VPNConnection sharedSecret](self, "sharedSecret");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v18, *MEMORY[0x24BDF5AC0]);

  }
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BDF5A18]);
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x24BDF5C30]);

  return v3;
}

- (id)vpnTypeLocalizedString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[VPNConnection grade](self, "grade") != 7 && -[VPNConnection grade](self, "grade") != 8)
  {
    v7 = -[VPNConnection vpnType](self, "vpnType");
    if (!v7)
    {
LABEL_12:
      v6 = v4;
      v4 = v6;
      goto LABEL_13;
    }
    v8 = v7;
    if (CFStringCompare(v7, (CFStringRef)*MEMORY[0x24BDF5A20], 0))
    {
      if (CFStringCompare(v8, (CFStringRef)*MEMORY[0x24BDF5A08], 0))
      {
        v9 = v8;
LABEL_11:

        v4 = v9;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("L2TP_IPSEC");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("PPTP");
    }
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24EE4DF70, CFSTR("MobileVPN"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v4 = v11;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RELAY"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v6;
}

- (__CFString)vpnType
{
  return +[VPNConnectionStore vpnTypeFromConnectionType:](VPNConnectionStore, "vpnTypeFromConnectionType:", -[VPNConnection vpnConnectionType](self, "vpnConnectionType"));
}

- (BOOL)connected
{
  return -[VPNConnection status](self, "status") == 3;
}

- (BOOL)notDisconnectedOrDisconnecting
{
  return -[VPNConnection status](self, "status") != 1 && -[VPNConnection status](self, "status") != 4;
}

- (BOOL)disconnected
{
  return -[VPNConnection status](self, "status") != 3;
}

- (unint64_t)status
{
  int v4;

  if (-[VPNConnection grade](self, "grade") == 7 || -[VPNConnection grade](self, "grade") == 8)
  {
    if (-[VPNConnection enabled](self, "enabled"))
      return 6;
    else
      return 5;
  }
  else if (-[VPNConnection grade](self, "grade") == 2 && !-[VPNConnection enabled](self, "enabled"))
  {
    return 5;
  }
  else
  {
    v4 = -[VPNConnection session_status](self, "session_status");
    if (v4 > 5)
      return 1;
    else
      return qword_226999450[v4];
  }
}

+ (id)statusTextForStatus:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("CONNECTING");
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("CONNECTED");
      break;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("DISCONNECTING");
      break;
    case 5uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("INACTIVE");
      break;
    case 6uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ON");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("NOT_CONNECTED");
      break;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24EE4DF70, CFSTR("MobileVPN"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)alertText
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  int v16;

  -[VPNConnection lastStopCause](self, "lastStopCause");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (-[VPNConnection grade](self, "grade") == 8 || -[VPNConnection grade](self, "grade") == 7)
  {
    switch(v4)
    {
      case 17:
      case 20:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("UNREACHABLE");
        goto LABEL_20;
      case 18:
      case 21:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("SERVER_ERROR");
        goto LABEL_20;
      case 25:
        goto LABEL_19;
      default:
        break;
    }
  }
  if (-[VPNConnection session_status](self, "session_status") != 1)
    goto LABEL_23;
  if (-[VPNConnection isProviderAvailable](self, "isProviderAvailable"))
  {
    -[VPNConnection lastStopCause](self, "lastStopCause");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_23;
    v9 = -[VPNConnection vpnConnectionType](self, "vpnConnectionType");
    -[VPNConnection lastStopCause](self, "lastStopCause");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (v9 == 4)
    {
      if (v11 != 27)
      {
        -[VPNConnection lastStopCause](self, "lastStopCause");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "intValue") == 25)
        {
LABEL_18:

LABEL_19:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          v7 = CFSTR("CERTIFICATE_ERROR");
          goto LABEL_20;
        }
        -[VPNConnection lastStopCause](self, "lastStopCause");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "intValue") == 26)
        {
LABEL_12:

          goto LABEL_18;
        }
        goto LABEL_22;
      }
    }
    else if (v11 != 21)
    {
      -[VPNConnection lastStopCause](self, "lastStopCause");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "intValue") == 13)
        goto LABEL_18;
      -[VPNConnection lastStopCause](self, "lastStopCause");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "intValue") == 20)
        goto LABEL_12;
LABEL_22:
      -[VPNConnection lastStopCause](self, "lastStopCause");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "intValue");

      if (v16 == 24)
        goto LABEL_19;
LABEL_23:
      v14 = &stru_24EE4DF70;
      return v14;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("CERTIFICATE_EXPIRED");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("MISSING_PROVIDER_ALERT");
  }
LABEL_20:
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24EE4DF70, CFSTR("MobileVPN"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)statusText
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = -[VPNConnection grade](self, "grade") == 5 || -[VPNConnection grade](self, "grade") == 6;
  if (-[VPNConnection grade](self, "grade") == 7 || -[VPNConnection grade](self, "grade") == 8)
  {
    v4 = -[VPNConnection enabled](self, "enabled");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v6 = CFSTR("ON");
    else
      v6 = CFSTR("OFF");
  }
  else
  {
    if (-[VPNConnection grade](self, "grade") == 2 && !-[VPNConnection enabled](self, "enabled"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7;
      v6 = CFSTR("INACTIVE");
      goto LABEL_10;
    }
    switch(-[VPNConnection session_status](self, "session_status"))
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
          goto LABEL_20;
        v6 = CFSTR("INACTIVE");
        break;
      case 2:
      case 4:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
          v6 = CFSTR("STARTING");
        else
          v6 = CFSTR("CONNECTING");
        break;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
          v6 = CFSTR("RUNNING");
        else
          v6 = CFSTR("CONNECTED");
        break;
      case 5:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
          v6 = CFSTR("STOPPING");
        else
          v6 = CFSTR("DISCONNECTING");
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
LABEL_20:
          v6 = CFSTR("INVALID");
        else
          v6 = CFSTR("NOT_CONNECTED");
        break;
    }
  }
  v7 = v5;
LABEL_10:
  objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_24EE4DF70, CFSTR("MobileVPN"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)connect
{
  +[VPNConnection cancelPreviousPerformRequestsWithTarget:](VPNConnection, "cancelPreviousPerformRequestsWithTarget:", self);
  -[VPNConnection session](self, "session");
  ne_session_start();
}

- (void)disconnect
{
  -[VPNConnection session](self, "session");
  ne_session_stop();
}

- (id)elapsedTimeLocalizedString
{
  void *v3;
  unint64_t v4;

  -[VPNConnection sessionConnectTime](self, "sessionConnectTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VPNConnection elapsedTimeSinceStartTime:](self, "elapsedTimeSinceStartTime:", v3);

  return -[VPNConnection convertTimeToString:](self, "convertTimeToString:", v4);
}

- (unint64_t)elapsedTimeSinceStartTime:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;

  if (!a3)
    return 0;
  v3 = a3;
  objc_msgSend(v3, "unsignedLongLongValue");
  if (elapsedTimeSinceStartTime__initTimeScale != -1)
    dispatch_once(&elapsedTimeSinceStartTime__initTimeScale, &__block_literal_global_100);
  v4 = (unint64_t)(*(double *)&elapsedTimeSinceStartTime__timeScaleSeconds * (double)mach_absolute_time());
  v5 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4 - v5;
}

double __43__VPNConnection_elapsedTimeSinceStartTime___block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 / 1000.0 / 1000000.0;
    elapsedTimeSinceStartTime__timeScaleSeconds = *(_QWORD *)&result;
  }
  return result;
}

- (id)convertTimeToString:(unint64_t)a3
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  __CFString *v17;
  uint64_t v19;
  uint64_t v20;

  if (!a3)
    goto LABEL_18;
  v3 = a3;
  v4 = a3 % 0x3C;
  v5 = (a3 / 0x3C)
     - 60 * ((unint64_t)((a3 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1);
  v6 = a3 + 3599;
  if ((a3 + 3599) <= 0x1C1E && !(_DWORD)v5)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TIME_S"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v4, v19, v20);
    goto LABEL_16;
  }
  if (v6 <= 0x1C1E && v5 <= 9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v12 = CFSTR("TIME_MS");
LABEL_11:
    objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_24EE4DF70, CFSTR("MobileVPN"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v9, v5, v4, v20);
    goto LABEL_16;
  }
  if (v6 <= 0x1C1E && v5 >= 0xA)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v12 = CFSTR("TIME_MMS");
    goto LABEL_11;
  }
  v13 = ((int)a3 / 3600);
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v3 > 35999)
    v16 = CFSTR("TIME_HHMS");
  else
    v16 = CFSTR("TIME_HMS");
  objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_24EE4DF70, CFSTR("MobileVPN"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v9, v13, v5, v4);
LABEL_16:
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v17, "length"))
  {

LABEL_18:
    v17 = &stru_24EE4DF70;
  }
  return v17;
}

- (id)tunnelType
{
  __CFString *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  if (-[VPNConnection grade](self, "grade") == 1 || !-[VPNConnection grade](self, "grade"))
  {
    v4 = -[VPNConnection isPrimary](self, "isPrimary");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      v7 = CFSTR("FULL_TUNNEL");
    else
      v7 = CFSTR("SPLIT_TUNNEL");
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24EE4DF70, CFSTR("MobileVPN"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = &stru_24EE4DF70;
  }
  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)session
{
  return self->_session;
}

- (void)setSession:(void *)a3
{
  self->_session = a3;
}

- (int)session_status
{
  return self->_session_status;
}

- (void)setSession_status:(int)a3
{
  self->_session_status = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_source)timerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTimerSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)grade
{
  return self->_grade;
}

- (void)setGrade:(unint64_t)a3
{
  self->_grade = a3;
}

- (NSArray)sessionIPAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionIPAddresses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)sessionRemoteAddress
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSessionRemoteAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSNumber)sessionConnectTime
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSessionConnectTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)lastStopCause
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastStopCause:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableArray)matchDomains
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMatchDomains:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (NSMutableArray)subConnections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSubConnections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (id)certificate
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setCertificate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)useRSASecurID
{
  return self->_useRSASecurID;
}

- (void)setUseRSASecurID:(BOOL)a3
{
  self->_useRSASecurID = a3;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)sharedSecret
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSharedSecret:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (unint64_t)vpnConnectionType
{
  return self->_vpnConnectionType;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (int64_t)onDemandAction
{
  return self->_onDemandAction;
}

- (void)setOnDemandAction:(int64_t)a3
{
  self->_onDemandAction = a3;
}

- (BOOL)isProviderAvailable
{
  return self->_isProviderAvailable;
}

- (void)setIsProviderAvailable:(BOOL)a3
{
  self->_isProviderAvailable = a3;
}

- (BOOL)onDemandUserOverrideDisabled
{
  return self->_onDemandUserOverrideDisabled;
}

- (void)setOnDemandUserOverrideDisabled:(BOOL)a3
{
  self->_onDemandUserOverrideDisabled = a3;
}

- (BOOL)isPerApp
{
  return self->_isPerApp;
}

- (void)setIsPerApp:(BOOL)a3
{
  self->_isPerApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong(&self->_certificate, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_subConnections, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_lastStopCause, 0);
  objc_storeStrong((id *)&self->_sessionConnectTime, 0);
  objc_storeStrong((id *)&self->_sessionRemoteAddress, 0);
  objc_storeStrong((id *)&self->_sessionIPAddresses, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end
