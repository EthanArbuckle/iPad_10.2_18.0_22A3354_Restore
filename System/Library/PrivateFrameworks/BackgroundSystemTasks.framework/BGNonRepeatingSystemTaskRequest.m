@implementation BGNonRepeatingSystemTaskRequest

- (BGNonRepeatingSystemTaskRequest)initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BGNonRepeatingSystemTaskRequest;
  return -[BGSystemTaskRequest initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BGNonRepeatingSystemTaskRequest;
  v4 = -[BGSystemTaskRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[BGNonRepeatingSystemTaskRequest scheduleAfter](self, "scheduleAfter");
  objc_msgSend(v4, "setScheduleAfter:");
  -[BGNonRepeatingSystemTaskRequest trySchedulingBefore](self, "trySchedulingBefore");
  objc_msgSend(v4, "setTrySchedulingBefore:");
  return v4;
}

- (double)scheduleAfter
{
  return self->_scheduleAfter;
}

- (void)setScheduleAfter:(double)a3
{
  self->_scheduleAfter = a3;
}

- (double)trySchedulingBefore
{
  return self->_trySchedulingBefore;
}

- (void)setTrySchedulingBefore:(double)a3
{
  self->_trySchedulingBefore = a3;
}

@end
