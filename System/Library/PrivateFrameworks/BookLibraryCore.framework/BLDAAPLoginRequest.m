@implementation BLDAAPLoginRequest

- (BLDAAPLoginRequest)initWithDSID:(id)a3 reason:(int64_t)a4
{
  BLDAAPLoginRequest *v4;
  BLDAAPLoginRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLDAAPLoginRequest;
  v4 = -[BLDAAPURLRequest initWithDSID:reason:](&v7, sel_initWithDSID_reason_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[BLDAAPURLRequest setDaapURL:](v4, "setDaapURL:", CFSTR("login"));
    -[BLDAAPURLRequest setContentType:](v5, "setContentType:", 0);
  }
  return v5;
}

@end
