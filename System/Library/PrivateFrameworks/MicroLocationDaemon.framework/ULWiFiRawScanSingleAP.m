@implementation ULWiFiRawScanSingleAP

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  -[ULWiFiRawScanSingleAP SSID](self, "SSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", SSID: %@"), v7);

  -[ULWiFiRawScanSingleAP BSSID](self, "BSSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", BSSID: %@"), v8);

  -[ULWiFiRawScanSingleAP channel](self, "channel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", channel: %@"), v9);

  -[ULWiFiRawScanSingleAP scanTimestamp](self, "scanTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", scanTimestamp: %@"), v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ULWiFiRawScanSingleAP RSSI](self, "RSSI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", RSSI: %@"), v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ULWiFiRawScanSingleAP isRssiInvalid](self, "isRssiInvalid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isRssiInvalid: %@"), v12);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ULWiFiRawScanSingleAP isRssiOffChannel](self, "isRssiOffChannel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isRssiOffChannel: %@"), v13);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_storeStrong((id *)&self->_SSID, a3);
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
  objc_storeStrong((id *)&self->_BSSID, a3);
}

- (ULWiFiScanChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (NSDate)scanTimestamp
{
  return self->_scanTimestamp;
}

- (void)setScanTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_scanTimestamp, a3);
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_RSSI = a3;
}

- (BOOL)isRssiInvalid
{
  return self->_isRssiInvalid;
}

- (void)setIsRssiInvalid:(BOOL)a3
{
  self->_isRssiInvalid = a3;
}

- (BOOL)isRssiOffChannel
{
  return self->_isRssiOffChannel;
}

- (void)setIsRssiOffChannel:(BOOL)a3
{
  self->_isRssiOffChannel = a3;
}

- (BOOL)isPersonalHotSpot
{
  return self->_isPersonalHotSpot;
}

- (void)setIsPersonalHotSpot:(BOOL)a3
{
  self->_isPersonalHotSpot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanTimestamp, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
}

@end
