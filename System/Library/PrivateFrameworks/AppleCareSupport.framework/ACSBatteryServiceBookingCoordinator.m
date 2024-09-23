@implementation ACSBatteryServiceBookingCoordinator

- (ACSBatteryServiceBookingCoordinator)init
{
  ACSBatteryServiceBookingCoordinator *v2;
  uint64_t v3;
  _ACSBatteryServiceBookingCoordinator *coordinator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACSBatteryServiceBookingCoordinator;
  v2 = -[ACSBatteryServiceBookingCoordinator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    coordinator = v2->coordinator;
    v2->coordinator = (_ACSBatteryServiceBookingCoordinator *)v3;

  }
  return v2;
}

- (ACSBatteryServiceBookingCoordinator)initWithOptions:(id)a3
{
  id v4;
  ACSBatteryServiceBookingCoordinator *v5;
  _ACSBatteryServiceBookingCoordinator *v6;
  _ACSBatteryServiceOptions *v7;
  uint64_t v8;
  _ACSBatteryServiceBookingCoordinator *coordinator;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACSBatteryServiceBookingCoordinator;
  v5 = -[ACSBatteryServiceBookingCoordinator init](&v11, sel_init);
  if (v5)
  {
    v6 = [_ACSBatteryServiceBookingCoordinator alloc];
    v7 = -[_ACSBatteryServiceOptions initWithValues:]([_ACSBatteryServiceOptions alloc], "initWithValues:", v4);
    v8 = -[_ACSBatteryServiceBookingCoordinator initWithOptions:](v6, "initWithOptions:", v7);
    coordinator = v5->coordinator;
    v5->coordinator = (_ACSBatteryServiceBookingCoordinator *)v8;

  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->coordinator;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACSBatteryServiceBookingCoordinator;
  if (-[ACSBatteryServiceBookingCoordinator respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->coordinator, 0);
}

@end
