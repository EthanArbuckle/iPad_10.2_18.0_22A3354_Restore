@implementation ULWiFiAssociatedState

- (ULWiFiAssociatedState)initWithChannel:(id)a3 BSSID:(id)a4 RSSI:(int64_t)a5 time:(id)a6
{
  id v10;
  id v11;
  id v12;
  ULWiFiAssociatedState *v13;
  ULWiFiAssociatedState *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ULWiFiAssociatedState;
  v13 = -[ULWiFiAssociatedState init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    -[ULWiFiAssociatedState setChannel:](v13, "setChannel:", v10);
    -[ULWiFiAssociatedState setBSSID:](v14, "setBSSID:", v11);
    -[ULWiFiAssociatedState setRSSI:](v14, "setRSSI:", a5);
    -[ULWiFiAssociatedState setTime:](v14, "setTime:", v12);
    -[ULWiFiAssociatedState channel](v14, "channel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[ULWiFiAssociatedState BSSID](v14, "BSSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 != 0;

    }
    else
    {
      v18 = 0;
    }
    -[ULWiFiAssociatedState setIsAssociated:](v14, "setIsAssociated:", v18);
  }

  return v14;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  -[ULWiFiAssociatedState channel](self, "channel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", channel: %@"), v7);

  -[ULWiFiAssociatedState BSSID](self, "BSSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", BSSID: %@"), v8);

  -[ULWiFiAssociatedState time](self, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", time: %@"), v9);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (ULWiFiScanChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
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

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (BOOL)isAssociated
{
  return self->_isAssociated;
}

- (void)setIsAssociated:(BOOL)a3
{
  self->_isAssociated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
