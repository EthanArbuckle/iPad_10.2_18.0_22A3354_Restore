@implementation GTTelemetryRequestUnknown

- (id)initNoRequestID
{
  id v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryRequestUnknown;
  v2 = -[GTTelemetryRequest initNoRequestID](&v6, sel_initNoRequestID);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

@end
