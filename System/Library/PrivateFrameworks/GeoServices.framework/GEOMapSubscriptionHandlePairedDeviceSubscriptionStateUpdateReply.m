@implementation GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateReply

- (GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateReply *v4;
  GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateReply *v5;
  GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateReply *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateReply;
  v4 = -[GEOXPCReply initWithXPCDictionary:error:](&v8, sel_initWithXPCDictionary_error_, a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (void)encodeToXPCDictionary:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOMapSubscriptionHandlePairedDeviceSubscriptionStateUpdateReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v3, sel_encodeToXPCDictionary_, a3);
}

- (BOOL)isValid
{
  return 1;
}

@end
