@implementation CVACMWiFiData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EF80 != -1)
    dispatch_once(&qword_254A6EF80, &unk_24CA36358);
  return (id)qword_254A6EF78;
}

- (CVACMWiFiData)initWithCoder:(id)a3
{
  id v4;
  CVACMWiFiData *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CVACMWiFiData;
  v5 = -[CVACMWiFiData init](&v9, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("BSSID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACMWiFiData setBSSID:](v5, "setBSSID:", v7);

    -[CVACMWiFiData setRSSI:](v5, "setRSSI:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("RSSI")));
    -[CVACMWiFiData setChannel:](v5, "setChannel:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("channel")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    -[CVACMWiFiData setTimestamp:](v5, "setTimestamp:");
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CVACMWiFiData BSSID](self, "BSSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("BSSID"));

  objc_msgSend(v6, "encodeInt:forKey:", -[CVACMWiFiData RSSI](self, "RSSI"), CFSTR("RSSI"));
  objc_msgSend(v6, "encodeInt:forKey:", -[CVACMWiFiData channel](self, "channel"), CFSTR("channel"));
  -[CVACMWiFiData timestamp](self, "timestamp");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("timestamp"));
  objc_autoreleasePoolPop(v4);

}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
  objc_storeStrong((id *)&self->_BSSID, a3);
}

- (int)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int)a3
{
  self->_RSSI = a3;
}

- (int)channel
{
  return self->_channel;
}

- (void)setChannel:(int)a3
{
  self->_channel = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BSSID, 0);
}

@end
