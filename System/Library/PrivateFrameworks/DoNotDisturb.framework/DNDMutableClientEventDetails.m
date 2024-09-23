@implementation DNDMutableClientEventDetails

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->super._identifier;
  self->super._identifier = v4;

}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleIdentifier = self->super._bundleIdentifier;
  self->super._bundleIdentifier = v4;

}

- (void)setPlatform:(unint64_t)a3
{
  self->super._platform = a3;
}

- (void)setType:(unint64_t)a3
{
  self->super._type = a3;
}

- (void)setUrgency:(unint64_t)a3
{
  self->super._urgency = a3;
}

- (void)setSender:(id)a3
{
  DNDContactHandle *v4;
  DNDContactHandle *sender;

  v4 = (DNDContactHandle *)objc_msgSend(a3, "copy");
  sender = self->super._sender;
  self->super._sender = v4;

}

- (void)setThreadIdentifier:(id)a3
{
  NSString *v4;
  NSString *threadIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  threadIdentifier = self->super._threadIdentifier;
  self->super._threadIdentifier = v4;

}

- (void)setFilterCriteria:(id)a3
{
  NSString *v4;
  NSString *filterCriteria;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  filterCriteria = self->super._filterCriteria;
  self->super._filterCriteria = v4;

}

- (void)setNotifyAnyway:(BOOL)a3
{
  self->super._notifyAnyway = a3;
}

- (void)setBehavior:(unint64_t)a3
{
  self->super._behavior = a3;
}

- (void)setForwardingBehavior:(id)a3
{
  DNDClientEventBehavior *v4;
  DNDClientEventBehavior *forwardingBehavior;

  v4 = (DNDClientEventBehavior *)objc_msgSend(a3, "copy");
  forwardingBehavior = self->super._forwardingBehavior;
  self->super._forwardingBehavior = v4;

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->super._title;
  self->super._title = v4;

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subtitle = self->super._subtitle;
  self->super._subtitle = v4;

}

- (void)setBody:(id)a3
{
  NSString *v4;
  NSString *body;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  body = self->super._body;
  self->super._body = v4;

}

- (void)setShouldAlwaysInterrupt:(BOOL)a3
{
  unint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->super._urgency = v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDClientEventDetails _initWithDetails:]([DNDClientEventDetails alloc], "_initWithDetails:", self);
}

@end
