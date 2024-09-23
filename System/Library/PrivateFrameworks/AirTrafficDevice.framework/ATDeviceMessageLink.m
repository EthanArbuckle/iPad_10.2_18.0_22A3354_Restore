@implementation ATDeviceMessageLink

- (ATDeviceMessageLink)initWithSocket:(id)a3
{
  ATDeviceMessageLink *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATDeviceMessageLink;
  v3 = -[ATConcreteMessageLink initWithSocket:](&v6, sel_initWithSocket_, a3);
  if (v3)
  {
    +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATConcreteMessageLink setEndpointType:](v3, "setEndpointType:", objc_msgSend(v4, "isDeviceLinkClient") ^ 1);

  }
  return v3;
}

+ (id)deviceMessageLink
{
  return objc_alloc_init(ATDeviceMessageLink);
}

@end
