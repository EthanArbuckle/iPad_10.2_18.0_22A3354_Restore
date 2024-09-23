@implementation SlowNetworkCondition

+ (id)descriptionWithProfileParamsForProfile:(id)a3
{
  id v3;
  SlowNetworkUtil *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
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

  v3 = a3;
  v4 = objc_alloc_init(SlowNetworkUtil);
  -[SlowNetworkUtil readInProfile:](v4, "readInProfile:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SlowNetworkUtil loadProfile:](v4, "loadProfile:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[SlowNetworkUtil profileName](v4, "profileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Name: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  -[SlowNetworkUtil downlinkBandwidth](v4, "downlinkBandwidth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[SlowNetworkUtil downlinkBandwidth](v4, "downlinkBandwidth");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Downlink Bandwidth: %g Mbps"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

  }
  -[SlowNetworkUtil downlinkDelay](v4, "downlinkDelay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    -[SlowNetworkUtil downlinkDelay](v4, "downlinkDelay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Downlink Latency: %lu ms"), objc_msgSend(v17, "unsignedLongValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v18);

  }
  -[SlowNetworkUtil downlinkPacketLossRatio](v4, "downlinkPacketLossRatio");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    -[SlowNetworkUtil downlinkPacketLossRatio](v4, "downlinkPacketLossRatio");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Downlink Packet Loss Ratio: %g%%"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v23);

  }
  -[SlowNetworkUtil uplinkBandwidth](v4, "uplinkBandwidth");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    -[SlowNetworkUtil uplinkBandwidth](v4, "uplinkBandwidth");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Uplink Bandwidth: %g Mbps"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v28);

  }
  -[SlowNetworkUtil uplinkDelay](v4, "uplinkDelay");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = (void *)MEMORY[0x24BDD17C8];
    -[SlowNetworkUtil downlinkDelay](v4, "downlinkDelay");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Uplink Latency: %lu ms"), objc_msgSend(v31, "unsignedLongValue"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v32);

  }
  -[SlowNetworkUtil uplinkPacketLossRatio](v4, "uplinkPacketLossRatio");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = (void *)MEMORY[0x24BDD17C8];
    -[SlowNetworkUtil downlinkPacketLossRatio](v4, "downlinkPacketLossRatio");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    objc_msgSend(v34, "stringWithFormat:", CFSTR("Uplink Packet Loss Ratio: %g%%"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v37);

  }
  -[SlowNetworkUtil excludeLoopback](v4, "excludeLoopback");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = (void *)MEMORY[0x24BDD17C8];
    -[SlowNetworkUtil excludeLoopback](v4, "excludeLoopback");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("Exclude Loopback: %lu"), objc_msgSend(v40, "unsignedLongValue"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v41);

  }
  -[SlowNetworkUtil dnsDelayValue](v4, "dnsDelayValue");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = (void *)MEMORY[0x24BDD17C8];
    -[SlowNetworkUtil dnsDelayValue](v4, "dnsDelayValue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("DNS Delay: %lu ms"), objc_msgSend(v44, "unsignedLongValue"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v45);

  }
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (id)identifierName
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;

  v8 = 0;
  v2 = CFSTR("SlowNetworkCondition");
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("SlowNetworkCondition"), &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ConditionIdentifierName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
    v2 = v4;

  return v2;
}

- (id)userFriendlyName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("SlowNetworkCondition"), &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("ConditionUserFriendlyName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isDestructive
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("SlowNetworkCondition"), &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForKey:", CFSTR("ConditionIsDestructive"));

  }
  return 1;
}

- (BOOL)isInternalOnly
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = 0;
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", CFSTR("SlowNetworkCondition"), &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "valueForKey:", CFSTR("ConditionIsInternalOnly"));

  }
  return 1;
}

- (SlowNetworkCondition)initWithProfile:(id)a3
{
  id v5;
  SlowNetworkUtil *v6;
  SlowNetworkUtil *util;
  NSDictionary *v8;
  NSDictionary *profileData;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SlowNetworkCondition *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_profile, a3);
  v6 = objc_alloc_init(SlowNetworkUtil);
  util = self->_util;
  self->_util = v6;

  -[SlowNetworkUtil readInProfile:](self->_util, "readInProfile:", v5);
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  profileData = self->_profileData;
  self->_profileData = v8;

  -[SlowNetworkUtil loadProfile:](self->_util, "loadProfile:", self->_profileData);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkUtil profileName](self->_util, "profileName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "name";
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Configured %s = %@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkUtil downlinkDelay](self->_util, "downlinkDelay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "DownlinkDelay";
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkUtil downlinkPacketLossRatio](self->_util, "downlinkPacketLossRatio");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "DownlinkPacketLossRatio";
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkUtil downlinkBandwidth](self->_util, "downlinkBandwidth");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "DownlinkBandwidth";
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkUtil uplinkDelay](self->_util, "uplinkDelay");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "UplinkDelay";
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkUtil uplinkPacketLossRatio](self->_util, "uplinkPacketLossRatio");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "UplinkPacketLossRatio";
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkUtil uplinkBandwidth](self->_util, "uplinkBandwidth");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "UplinkBandwidth";
    v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkUtil dnsDelayValue](self->_util, "dnsDelayValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "DNSDelayValue";
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkUtil excludeLoopback](self->_util, "excludeLoopback");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "ExcludeLoopback";
    v24 = 2112;
    v25 = v18;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Set profile", buf, 2u);
  }
  v21.receiver = self;
  v21.super_class = (Class)SlowNetworkCondition;
  v19 = -[COCondition init](&v21, sel_init);
  if (v19 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "SlowNetworkCondition Init passed", buf, 2u);
  }

  return v19;
}

- (BOOL)isNLCPrefPaneActive
{
  void *v2;
  char v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Preferences/com.apple.network.prefPaneSimulate.plist"));

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/com.apple.network.prefPaneSimulate.plist"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      -[__CFString valueForKey:](v4, "valueForKey:", CFSTR("SimulatorIsRunning"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        -[__CFString removeObjectForKey:](v5, "removeObjectForKey:", CFSTR("Profiles"));
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          v11 = 138412290;
          v12 = v5;
          _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "NLC prefpane plist: %@", (uint8_t *)&v11, 0xCu);
        }
        v8 = objc_msgSend(v7, "BOOLValue");

        goto LABEL_15;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        -[__CFString allKeys](v5, "allKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = CFSTR("SimulatorIsRunning");
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Unable to find value for key %@ in plist: %@", (uint8_t *)&v11, 0x16u);

      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = CFSTR("/var/mobile/Library/Preferences/com.apple.network.prefPaneSimulate.plist");
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Read plist from %@, but it was nil?", (uint8_t *)&v11, 0xCu);
    }
    v8 = 0;
LABEL_15:

    return v8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = CFSTR("/var/mobile/Library/Preferences/com.apple.network.prefPaneSimulate.plist");
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Unable to access the pref pane plist at %@, so we'll take the safe assumption and assume that NLC is not running.", (uint8_t *)&v11, 0xCu);
  }
  return 0;
}

- (BOOL)setUp
{
  void *v3;
  _BOOL4 v4;
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
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[SlowNetworkCondition profile](self, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412546;
    v27 = (const char *)self;
    v28 = 2112;
    v29 = v3;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Starting Setup: %@ Condition -- profile = %@", (uint8_t *)&v26, 0x16u);

  }
  v4 = -[SlowNetworkCondition isNLCPrefPaneActive](self, "isNLCPrefPaneActive");
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SlowNetworkCondition setUp].cold.1();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[SlowNetworkCondition util](self, "util");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "profileName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "name";
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Configuring %s = %@", (uint8_t *)&v26, 0x16u);

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[SlowNetworkCondition util](self, "util");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "downlinkDelay");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "DownlinkDelay";
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[SlowNetworkCondition util](self, "util");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "downlinkPacketLossRatio");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "DownlinkPacketLossRatio";
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[SlowNetworkCondition util](self, "util");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "downlinkBandwidth");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "DownlinkBandwidth";
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[SlowNetworkCondition util](self, "util");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uplinkDelay");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "UplinkDelay";
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[SlowNetworkCondition util](self, "util");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uplinkPacketLossRatio");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "UplinkPacketLossRatio";
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[SlowNetworkCondition util](self, "util");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uplinkBandwidth");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "UplinkBandwidth";
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[SlowNetworkCondition util](self, "util");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dnsDelayValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "DNSDelayValue";
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[SlowNetworkCondition util](self, "util");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "excludeLoopback");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315394;
      v27 = "ExcludeLoopback";
      v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s = %@", (uint8_t *)&v26, 0x16u);

    }
    -[SlowNetworkCondition util](self, "util");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "startNLC");

    -[SlowNetworkCondition setRunning:](self, "setRunning:", 1);
  }
  if (!-[SlowNetworkCondition running](self, "running"))
  {
    -[SlowNetworkCondition util](self, "util");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stopNLC");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Stopped NLC", (uint8_t *)&v26, 2u);
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v26 = 138412290;
    v27 = (const char *)self;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Finished Setup: %@ Condition", (uint8_t *)&v26, 0xCu);
  }
  return !v4;
}

- (void)tearDown
{
  void *v3;
  int v4;
  SlowNetworkCondition *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Starting Teardown: %@ Condition", (uint8_t *)&v4, 0xCu);
  }
  -[SlowNetworkCondition util](self, "util");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopNLC");

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(v4) = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Stopped NLC", (uint8_t *)&v4, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Finished Teardown: %@ Condition", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)description
{
  return CFSTR("Base class SlowNetwork Conditioner: Select another class to impose exact condition");
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (SlowNetworkUtil)util
{
  return self->_util;
}

- (void)setUtil:(id)a3
{
  objc_storeStrong((id *)&self->_util, a3);
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSDictionary)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_profileData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_util, 0);
}

- (void)setUp
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "NLC preference pane is active! Cannot start this condition", v0, 2u);
}

@end
