@implementation GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.fetchPairedDeviceSubscriptionsSummary"), a3, a4, a5);
}

- (GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest *v4;
  GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest *v5;
  GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest;
  v4 = -[GEOXPCRequest initWithXPCDictionary:error:](&v8, sel_initWithXPCDictionary_error_, a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (void)encodeToXPCDictionary:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v3, sel_encodeToXPCDictionary_, a3);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

@end
