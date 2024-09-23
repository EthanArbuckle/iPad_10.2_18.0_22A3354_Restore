@implementation BGRepeatingSystemTaskRequest

- (BGRepeatingSystemTaskRequest)initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BGRepeatingSystemTaskRequest;
  return -[BGSystemTaskRequest initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BGRepeatingSystemTaskRequest;
  v4 = -[BGSystemTaskRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[BGRepeatingSystemTaskRequest interval](self, "interval");
  objc_msgSend(v4, "setInterval:");
  -[BGRepeatingSystemTaskRequest minDurationBetweenInstances](self, "minDurationBetweenInstances");
  objc_msgSend(v4, "setMinDurationBetweenInstances:");
  return v4;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)minDurationBetweenInstances
{
  return self->_minDurationBetweenInstances;
}

- (void)setMinDurationBetweenInstances:(double)a3
{
  self->_minDurationBetweenInstances = a3;
}

@end
