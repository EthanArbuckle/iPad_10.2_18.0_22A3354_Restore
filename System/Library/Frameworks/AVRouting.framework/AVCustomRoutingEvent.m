@implementation AVCustomRoutingEvent

- (AVCustomRoutingEvent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingEvent;
  return -[AVCustomRoutingEvent init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  self->_route = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingEvent;
  -[AVCustomRoutingEvent dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  AVCustomRoutingEventReason v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[AVCustomRoutingEvent reason](self, "reason");
  if ((unint64_t)v4 > AVCustomRoutingEventReasonReactivate)
    v5 = CFSTR("?");
  else
    v5 = *(&off_24C3EFD10 + v4);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<reason: %@, route: %@>"), v5, -[AVCustomRoutingEvent route](self, "route"));
}

- (void)setRoute:(id)a3
{

  self->_route = (AVCustomDeviceRoute *)a3;
}

- (AVCustomDeviceRoute)route
{
  return self->_route;
}

- (AVCustomRoutingEventReason)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

@end
