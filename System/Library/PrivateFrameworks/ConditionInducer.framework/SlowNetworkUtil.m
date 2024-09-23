@implementation SlowNetworkUtil

- (SlowNetworkUtil)init
{
  SlowNetworkUtil *v2;
  SlowNetworkUtil *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SlowNetworkUtil;
  v2 = -[SlowNetworkUtil init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SlowNetworkUtil setProfileData:](v2, "setProfileData:", 0);
    *(_OWORD *)&v3->nlcCommand.version = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].downlink_config.qsize_unit = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].downlink_config.bw_unit = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].uplink_config.protocol = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].uplink_config.plr = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].net_config.ifname[8] = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[1].net_config.family = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].downlink_config.protocol = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].downlink_config.plr = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].uplink_config.dst_port = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].uplink_config.latency = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].net_config.ifname[12] = 0u;
    *(_OWORD *)&v3->nlcCommand.nlc_conditions[0].net_config.exclude_loopback = 0u;
    v3->nlcCommand.version = 21;
    v3->sessionCookie = 0;
  }
  return v3;
}

+ (id)loadNetworkProfilesData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("NetworkProfiles"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      +[SlowNetworkUtil loadNetworkProfilesData].cold.2((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[SlowNetworkUtil loadNetworkProfilesData].cold.1();
    v5 = 0;
  }

  return v5;
}

- (id)readInProfile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  +[SlowNetworkUtil loadNetworkProfilesData](SlowNetworkUtil, "loadNetworkProfilesData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[SlowNetworkUtil readInProfile:].cold.2((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SlowNetworkUtil readInProfile:].cold.1();
    v7 = 0;
  }

  return v7;
}

- (void)loadProfile:(id)a3
{
  NSNumber *downlinkDelay;
  unsigned int v5;
  NSNumber *downlinkPacketLossRatio;
  float v7;
  float v8;
  NSNumber *downlinkBandwidth;
  float v10;
  _BOOL4 v11;
  unsigned int v12;
  int v13;
  NSNumber *uplinkDelay;
  unsigned int v15;
  NSNumber *uplinkPacketLossRatio;
  float v17;
  float v18;
  NSNumber *uplinkBandwidth;
  BOOL v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  uint8_t v24[16];
  __int128 v25;
  unsigned int v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&self->nlcCommand.version = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].downlink_config.qsize_unit = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].downlink_config.bw_unit = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].uplink_config.protocol = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].uplink_config.plr = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].net_config.ifname[8] = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[1].net_config.family = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].downlink_config.protocol = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].downlink_config.plr = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].uplink_config.dst_port = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].uplink_config.latency = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].net_config.ifname[12] = 0u;
  *(_OWORD *)&self->nlcCommand.nlc_conditions[0].net_config.exclude_loopback = 0u;
  self->nlcCommand.version = 21;
  -[SlowNetworkUtil extractProfileSetting:](self, "extractProfileSetting:", a3);
  v27 = 0uLL;
  v25 = 0uLL;
  v26 = 0;
  downlinkDelay = self->downlinkDelay;
  if (downlinkDelay)
    v5 = -[NSNumber unsignedLongValue](downlinkDelay, "unsignedLongValue");
  else
    v5 = 0;
  downlinkPacketLossRatio = self->downlinkPacketLossRatio;
  if (downlinkPacketLossRatio)
  {
    -[NSNumber floatValue](downlinkPacketLossRatio, "floatValue");
    v8 = v7 / 100.0;
  }
  else
  {
    v8 = 0.0;
  }
  downlinkBandwidth = self->downlinkBandwidth;
  if (downlinkBandwidth)
  {
    -[NSNumber floatValue](downlinkBandwidth, "floatValue");
    v11 = v10 >= 1.0;
    if (v10 < 1.0)
      v10 = v10 * 1000.0;
    v12 = v10;
    if (v10)
      goto LABEL_16;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  if (v8 == 0.0 && !v5)
  {
    v13 = 0;
    v12 = 0;
    v11 = 0;
    v8 = 0.0;
    goto LABEL_17;
  }
LABEL_16:
  v25 = 0uLL;
  v13 = 9;
  v26 = 0;
LABEL_17:
  uplinkDelay = self->uplinkDelay;
  if (uplinkDelay)
    v15 = -[NSNumber unsignedLongValue](uplinkDelay, "unsignedLongValue");
  else
    v15 = 0;
  uplinkPacketLossRatio = self->uplinkPacketLossRatio;
  if (uplinkPacketLossRatio)
  {
    -[NSNumber floatValue](uplinkPacketLossRatio, "floatValue");
    v18 = v17 / 100.0;
  }
  else
  {
    v18 = 0.0;
  }
  uplinkBandwidth = self->uplinkBandwidth;
  if (uplinkBandwidth)
    -[NSNumber floatValue](uplinkBandwidth, "floatValue");
  v20 = v18 == 0.0 && v15 == 0;
  if (v20)
    v18 = 0.0;
  else
    v13 |= 5u;
  if (v20)
    v15 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Setting default params", v24, 2u);
  }
  if ((v13 & 1) != 0)
  {
    self->nlcCommand.nlc_conditions[1].flags = v13;
    *(_QWORD *)&self->nlcCommand.nlc_conditions[1].net_config.family = 0x100000000;
    *(_OWORD *)self->nlcCommand.nlc_conditions[1].net_config.ifname = v27;
    *(_QWORD *)&self->nlcCommand.nlc_conditions[1].uplink_config.bandwidth = 0;
    self->nlcCommand.nlc_conditions[1].uplink_config.plr = v18;
    self->nlcCommand.nlc_conditions[1].uplink_config.latency = v15;
    *(_QWORD *)&self->nlcCommand.nlc_conditions[1].uplink_config.qsize = 0;
    *(_QWORD *)&self->nlcCommand.nlc_conditions[1].uplink_config.protocol = 0;
    self->nlcCommand.nlc_conditions[1].uplink_config.src_port = 0;
    self->nlcCommand.nlc_conditions[1].downlink_config.bandwidth = v12;
    self->nlcCommand.nlc_conditions[1].downlink_config.bw_unit = v11;
    self->nlcCommand.nlc_conditions[1].downlink_config.plr = v8;
    self->nlcCommand.nlc_conditions[1].downlink_config.latency = v5;
    *(_OWORD *)&self->nlcCommand.nlc_conditions[1].downlink_config.qsize = v25;
    self->nlcCommand.nlc_conditions[1].downlink_config.src_port = v26;
  }
  if (-[NSNumber intValue](self->dnsDelayValue, "intValue") >= 1)
  {
    v21 = -[NSNumber unsignedLongValue](self->dnsDelayValue, "unsignedLongValue");
    v22 = -[NSNumber unsignedLongValue](self->excludeLoopback, "unsignedLongValue");
    if (v21)
    {
      v25 = 0uLL;
      v26 = 0;
      v27 = 0uLL;
      LODWORD(v23) = 0;
      HIDWORD(v23) = v22;
      self->nlcCommand.nlc_conditions[0].flags = 6;
      *(_QWORD *)&self->nlcCommand.nlc_conditions[0].net_config.family = v23;
      *(_OWORD *)self->nlcCommand.nlc_conditions[0].net_config.ifname = v27;
      *(_QWORD *)&self->nlcCommand.nlc_conditions[0].uplink_config.bw_unit = 0;
      self->nlcCommand.nlc_conditions[0].uplink_config.bandwidth = 0;
      self->nlcCommand.nlc_conditions[0].uplink_config.latency = v21;
      *(_QWORD *)&self->nlcCommand.nlc_conditions[0].uplink_config.qsize = 0;
      *(_QWORD *)&self->nlcCommand.nlc_conditions[0].uplink_config.protocol = 0x3500000011;
      *(_QWORD *)&self->nlcCommand.nlc_conditions[0].downlink_config.bandwidth = 0;
      *(_QWORD *)&self->nlcCommand.nlc_conditions[0].downlink_config.plr = 0;
      self->nlcCommand.nlc_conditions[0].uplink_config.src_port = 0;
      self->nlcCommand.nlc_conditions[0].downlink_config.src_port = v26;
      *(_OWORD *)&self->nlcCommand.nlc_conditions[0].downlink_config.qsize = v25;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Done setting", v24, 2u);
  }
}

- (void)extractProfileSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *excludeLoopback;
  NSNumber *v9;
  NSNumber *dnsDelayValue;
  NSNumber *v11;
  NSNumber *downlinkDelay;
  NSNumber *v13;
  NSNumber *downlinkPacketLossRatio;
  NSNumber *v15;
  NSNumber *downlinkBandwidth;
  NSNumber *v17;
  NSNumber *uplinkDelay;
  NSNumber *v19;
  NSNumber *uplinkPacketLossRatio;
  NSNumber *v21;
  NSNumber *uplinkBandwidth;
  NSString *v23;
  NSString *profileName;
  void *v25;
  int v26;
  void *v27;
  double v28;
  NSNumber *v29;
  NSNumber *v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  NSNumber *v35;
  NSNumber *v36;
  id v37;

  v4 = a3;
  if (v4)
  {
    v37 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("UplinkBandwidthUnit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "objectForKey:", CFSTR("DownlinkBandwidthUnit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "valueForKey:", CFSTR("ExcludeLoopback"));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    excludeLoopback = self->excludeLoopback;
    self->excludeLoopback = v7;

    objc_msgSend(v37, "valueForKey:", CFSTR("DNSDelayValue"));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    dnsDelayValue = self->dnsDelayValue;
    self->dnsDelayValue = v9;

    objc_msgSend(v37, "valueForKey:", CFSTR("DownlinkDelay"));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    downlinkDelay = self->downlinkDelay;
    self->downlinkDelay = v11;

    objc_msgSend(v37, "valueForKey:", CFSTR("DownlinkPacketLossRatio"));
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    downlinkPacketLossRatio = self->downlinkPacketLossRatio;
    self->downlinkPacketLossRatio = v13;

    objc_msgSend(v37, "valueForKey:", CFSTR("DownlinkBandwidth"));
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    downlinkBandwidth = self->downlinkBandwidth;
    self->downlinkBandwidth = v15;

    objc_msgSend(v37, "valueForKey:", CFSTR("UplinkDelay"));
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uplinkDelay = self->uplinkDelay;
    self->uplinkDelay = v17;

    objc_msgSend(v37, "valueForKey:", CFSTR("UplinkPacketLossRatio"));
    v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uplinkPacketLossRatio = self->uplinkPacketLossRatio;
    self->uplinkPacketLossRatio = v19;

    objc_msgSend(v37, "valueForKey:", CFSTR("UplinkBandwidth"));
    v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uplinkBandwidth = self->uplinkBandwidth;
    self->uplinkBandwidth = v21;

    objc_msgSend(v37, "objectForKey:", CFSTR("name"));
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    profileName = self->profileName;
    self->profileName = v23;

    if (v5)
    {
      objc_msgSend(v37, "valueForKey:", CFSTR("UplinkBandwidthUnit"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "intValue");

      if (!v26)
      {
        v27 = (void *)MEMORY[0x24BDD16E0];
        -[NSNumber doubleValue](self->uplinkBandwidth, "doubleValue");
        objc_msgSend(v27, "numberWithDouble:", v28 / 1000.0);
        v29 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v30 = self->uplinkBandwidth;
        self->uplinkBandwidth = v29;

      }
    }
    v4 = v37;
    if (v6)
    {
      objc_msgSend(v37, "valueForKey:", CFSTR("DownlinkBandwidthUnit"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "intValue");

      v4 = v37;
      if (!v32)
      {
        v33 = (void *)MEMORY[0x24BDD16E0];
        -[NSNumber doubleValue](self->downlinkBandwidth, "doubleValue");
        objc_msgSend(v33, "numberWithDouble:", v34 / 1000.0);
        v35 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v36 = self->downlinkBandwidth;
        self->downlinkBandwidth = v35;

        v4 = v37;
      }
    }
  }

}

- (void)startNLC
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_21F8CF000, MEMORY[0x24BDACB70], v0, "_nlc_connect failed: (%d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)stopNLC
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_21F8CF000, MEMORY[0x24BDACB70], v0, "_nlc_stop_simulation failed: (%d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (NSNumber)excludeLoopback
{
  return self->excludeLoopback;
}

- (NSNumber)dnsDelayValue
{
  return self->dnsDelayValue;
}

- (NSNumber)uplinkPacketLossRatio
{
  return self->uplinkPacketLossRatio;
}

- (NSNumber)uplinkBandwidth
{
  return self->uplinkBandwidth;
}

- (NSNumber)uplinkDelay
{
  return self->uplinkDelay;
}

- (NSNumber)downlinkPacketLossRatio
{
  return self->downlinkPacketLossRatio;
}

- (NSNumber)downlinkBandwidth
{
  return self->downlinkBandwidth;
}

- (NSNumber)downlinkDelay
{
  return self->downlinkDelay;
}

- (NSString)profileName
{
  return self->profileName;
}

- (NSData)profileData
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
  objc_storeStrong((id *)&self->profileName, 0);
  objc_storeStrong((id *)&self->downlinkDelay, 0);
  objc_storeStrong((id *)&self->downlinkBandwidth, 0);
  objc_storeStrong((id *)&self->downlinkPacketLossRatio, 0);
  objc_storeStrong((id *)&self->uplinkDelay, 0);
  objc_storeStrong((id *)&self->uplinkBandwidth, 0);
  objc_storeStrong((id *)&self->uplinkPacketLossRatio, 0);
  objc_storeStrong((id *)&self->dnsDelayValue, 0);
  objc_storeStrong((id *)&self->excludeLoopback, 0);
}

+ (void)loadNetworkProfilesData
{
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Failed to load profiles from %@", a5, a6, a7, a8, 2u);
}

- (void)readInProfile:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to load any network profiles", v0, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)readInProfile:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Could not read the profile: %@", a5, a6, a7, a8, 2u);
}

@end
