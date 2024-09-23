@implementation ULWiFiScanChannel

- (ULWiFiScanChannel)initWithBand:(unint64_t)a3 andChannelNumber:(unint64_t)a4
{
  ULWiFiScanChannel *v6;
  ULWiFiScanChannel *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ULWiFiScanChannel;
  v6 = -[ULWiFiScanChannel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[ULWiFiScanChannel setBand:](v6, "setBand:", a3);
    -[ULWiFiScanChannel setChannelNumber:](v7, "setChannelNumber:", a4);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ULWiFiScanChannel initWithBand:andChannelNumber:]([ULWiFiScanChannel alloc], "initWithBand:andChannelNumber:", -[ULWiFiScanChannel band](self, "band"), -[ULWiFiScanChannel channelNumber](self, "channelNumber"));
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  v7 = -[ULWiFiScanChannel band](self, "band");
  if (v7 > 3)
    v8 = CFSTR("Invalid");
  else
    v8 = off_2511D3758[v7];
  objc_msgSend(v6, "appendFormat:", CFSTR(", band: %@"), v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ULWiFiScanChannel channelNumber](self, "channelNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", channelNumber: %@"), v9);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (unint64_t)band
{
  return self->_band;
}

- (void)setBand:(unint64_t)a3
{
  self->_band = a3;
}

- (unint64_t)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(unint64_t)a3
{
  self->_channelNumber = a3;
}

@end
