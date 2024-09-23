@implementation BLDAAPServerInfoRequest

- (BLDAAPServerInfoRequest)initWithDSID:(id)a3 reason:(int64_t)a4
{
  BLDAAPServerInfoRequest *v4;
  BLDAAPServerInfoRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLDAAPServerInfoRequest;
  v4 = -[BLDAAPURLRequest initWithDSID:reason:](&v7, sel_initWithDSID_reason_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[BLDAAPURLRequest setDaapURL:](v4, "setDaapURL:", CFSTR("server-info"));
    -[BLDAAPURLRequest setRequestMethod:](v5, "setRequestMethod:", 2);
  }
  return v5;
}

@end
