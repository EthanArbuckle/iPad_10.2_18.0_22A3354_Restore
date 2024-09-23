@implementation MIBUNetworkInfo

- (MIBUNetworkInfo)init
{
  MIBUNetworkInfo *v2;
  MIBUNetworkInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUNetworkInfo;
  v2 = -[MIBUNetworkInfo init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MIBUNetworkInfo setNetworkName:](v2, "setNetworkName:", 0);
    -[MIBUNetworkInfo setBSSID:](v3, "setBSSID:", 0);
    -[MIBUNetworkInfo setRSSI:](v3, "setRSSI:", 0);
    -[MIBUNetworkInfo setNoise:](v3, "setNoise:", 0);
    -[MIBUNetworkInfo setChannel:](v3, "setChannel:", -1);
    -[MIBUNetworkInfo setChannelWidth:](v3, "setChannelWidth:", 0);
    -[MIBUNetworkInfo setChannelBand:](v3, "setChannelBand:", 0);
    -[MIBUNetworkInfo setPHYMode:](v3, "setPHYMode:", 0);
    -[MIBUNetworkInfo setNumberOfSpatialStreams:](v3, "setNumberOfSpatialStreams:", 0);
    -[MIBUNetworkInfo setMCSIndex:](v3, "setMCSIndex:", 0);
    -[MIBUNetworkInfo setIPV4Address:](v3, "setIPV4Address:", 0);
    -[MIBUNetworkInfo setIPV6Address:](v3, "setIPV6Address:", 0);
  }
  return v3;
}

+ (id)queryNetworkInfo
{
  MIBUNetworkInfo *v2;
  id v3;
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

  v2 = objc_alloc_init(MIBUNetworkInfo);
  v3 = objc_alloc_init(MEMORY[0x24BE29F18]);
  objc_msgSend(v3, "activate");
  objc_msgSend(v3, "networkName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUNetworkInfo setNetworkName:](v2, "setNetworkName:", v4);

  objc_msgSend(v3, "BSSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUNetworkInfo setBSSID:](v2, "setBSSID:", v5);

  -[MIBUNetworkInfo setRSSI:](v2, "setRSSI:", objc_msgSend(v3, "RSSI"));
  -[MIBUNetworkInfo setNoise:](v2, "setNoise:", objc_msgSend(v3, "noise"));
  -[MIBUNetworkInfo setPHYMode:](v2, "setPHYMode:", objc_msgSend(v3, "PHYMode"));
  -[MIBUNetworkInfo setNumberOfSpatialStreams:](v2, "setNumberOfSpatialStreams:", objc_msgSend(v3, "numberOfSpatialStreams"));
  -[MIBUNetworkInfo setMCSIndex:](v2, "setMCSIndex:", objc_msgSend(v3, "MCSIndex"));
  objc_msgSend(v3, "MACAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUNetworkInfo setMACAddress:](v2, "setMACAddress:", v6);

  objc_msgSend(v3, "IPv4Addresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUNetworkInfo setIPV4Address:](v2, "setIPV4Address:", v8);

  objc_msgSend(v3, "IPv6Addresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUNetworkInfo setIPV6Address:](v2, "setIPV6Address:", v10);

  objc_msgSend(v3, "channel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "channel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBUNetworkInfo setChannel:](v2, "setChannel:", objc_msgSend(v12, "channel"));

    objc_msgSend(v3, "channel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBUNetworkInfo setChannelWidth:](v2, "setChannelWidth:", objc_msgSend(v13, "width"));

    objc_msgSend(v3, "channel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBUNetworkInfo setChannelBand:](v2, "setChannelBand:", objc_msgSend(v14, "band"));

  }
  objc_msgSend(v3, "invalidate");

  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
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

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ : \n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[MIBUNetworkInfo networkName](self, "networkName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("\tNetwork Name : %@\n"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  v11 = (void *)MEMORY[0x24BDD17C8];
  -[MIBUNetworkInfo BSSID](self, "BSSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("\tBSSID : %@\n"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v13);

  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MIBUNetworkInfo RSSI](self, "RSSI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("\tRSSI : %@\n"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v16);

  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MIBUNetworkInfo noise](self, "noise"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("\tNoise : %@\n"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v19);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\tPHYMode : 0x%lX\n"), -[MIBUNetworkInfo PHYMode](self, "PHYMode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v20);

  v21 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MIBUNetworkInfo numberOfSpatialStreams](self, "numberOfSpatialStreams"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("\t#SpatialStreams : %@\n"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v23);

  v24 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MIBUNetworkInfo MCSIndex](self, "MCSIndex"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("\tMCSIndex : %@\n"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v26);

  v27 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MIBUNetworkInfo channel](self, "channel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("\tChannel : %@\n"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v29);

  v30 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MIBUNetworkInfo channelWidth](self, "channelWidth"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("\tChannel Width: %@\n"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v32);

  v33 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MIBUNetworkInfo channelBand](self, "channelBand"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("\tChannel Band: %@\n"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v35);

  v36 = (void *)MEMORY[0x24BDD17C8];
  -[MIBUNetworkInfo MACAddress](self, "MACAddress");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("\tMACAddress : %@\n"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v38);

  v39 = (void *)MEMORY[0x24BDD17C8];
  -[MIBUNetworkInfo iPV4Address](self, "iPV4Address");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("\tIPv4 : %@\n"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v41);

  v42 = (void *)MEMORY[0x24BDD17C8];
  -[MIBUNetworkInfo iPV6Address](self, "iPV6Address");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringWithFormat:", CFSTR("\tIPv6 : %@\n"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v44);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(">"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v45);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
  objc_storeStrong((id *)&self->_BSSID, a3);
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_RSSI = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (unint64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unint64_t)a3
{
  self->_channelWidth = a3;
}

- (unint64_t)channelBand
{
  return self->_channelBand;
}

- (void)setChannelBand:(unint64_t)a3
{
  self->_channelBand = a3;
}

- (unint64_t)PHYMode
{
  return self->_PHYMode;
}

- (void)setPHYMode:(unint64_t)a3
{
  self->_PHYMode = a3;
}

- (unint64_t)numberOfSpatialStreams
{
  return self->_numberOfSpatialStreams;
}

- (void)setNumberOfSpatialStreams:(unint64_t)a3
{
  self->_numberOfSpatialStreams = a3;
}

- (unint64_t)MCSIndex
{
  return self->_MCSIndex;
}

- (void)setMCSIndex:(unint64_t)a3
{
  self->_MCSIndex = a3;
}

- (NSString)MACAddress
{
  return self->_MACAddress;
}

- (void)setMACAddress:(id)a3
{
  objc_storeStrong((id *)&self->_MACAddress, a3);
}

- (NSString)iPV4Address
{
  return self->_iPV4Address;
}

- (void)setIPV4Address:(id)a3
{
  objc_storeStrong((id *)&self->_iPV4Address, a3);
}

- (NSString)iPV6Address
{
  return self->_iPV6Address;
}

- (void)setIPV6Address:(id)a3
{
  objc_storeStrong((id *)&self->_iPV6Address, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iPV6Address, 0);
  objc_storeStrong((id *)&self->_iPV4Address, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end
