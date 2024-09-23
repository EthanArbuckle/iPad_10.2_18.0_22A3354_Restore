@implementation ATLockdownMessageLink

- (ATLockdownMessageLink)initWithSocket:(id)a3
{
  ATLockdownMessageLink *v3;
  ATLockdownMessageLink *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATLockdownMessageLink;
  v3 = -[ATConcreteMessageLink initWithSocket:](&v6, sel_initWithSocket_, a3);
  v4 = v3;
  if (v3)
    -[ATConcreteMessageLink setEndpointType:](v3, "setEndpointType:", 0);
  return v4;
}

- (BOOL)isWifiConnection
{
  void *v2;
  char v3;

  -[ATConcreteMessageLink socket](self, "socket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWifi");

  return v3;
}

@end
