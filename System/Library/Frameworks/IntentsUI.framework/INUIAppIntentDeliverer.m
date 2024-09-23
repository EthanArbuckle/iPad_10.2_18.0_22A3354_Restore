@implementation INUIAppIntentDeliverer

- (void)deliverIntentForwardingActionWithResponseHandler:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INUIAppIntentDeliverer;
  -[INAppIntentDeliverer deliverIntentForwardingActionWithResponseHandler:](&v3, sel_deliverIntentForwardingActionWithResponseHandler_, a3);
}

- (void)deliverIntent:(id)a3 reply:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INUIAppIntentDeliverer;
  -[INAppIntentDeliverer deliverIntent:reply:](&v4, sel_deliverIntent_reply_, a3, a4);
}

@end
