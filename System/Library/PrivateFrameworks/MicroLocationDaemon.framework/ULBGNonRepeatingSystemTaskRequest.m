@implementation ULBGNonRepeatingSystemTaskRequest

- (ULBGNonRepeatingSystemTaskRequest)initWithIdentifier:(id)a3 scheduleAfter:(double)a4 trySchedulingBefore:(double)a5
{
  ULBGNonRepeatingSystemTaskRequest *v7;
  ULBGNonRepeatingSystemTaskRequest *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ULBGNonRepeatingSystemTaskRequest;
  v7 = -[ULBGSystemTaskRequest initWithIdentifier:](&v10, sel_initWithIdentifier_, a3);
  v8 = v7;
  if (v7)
  {
    -[ULBGNonRepeatingSystemTaskRequest setScheduleAfter:](v7, "setScheduleAfter:", a4);
    -[ULBGNonRepeatingSystemTaskRequest setTrySchedulingBefore:](v8, "setTrySchedulingBefore:", a5);
  }
  return v8;
}

- (id)createRequestFromSelf
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE0B710]);
  -[ULBGSystemTaskRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentifier:", v4);

  -[ULBGNonRepeatingSystemTaskRequest scheduleAfter](self, "scheduleAfter");
  objc_msgSend(v5, "setScheduleAfter:");
  -[ULBGNonRepeatingSystemTaskRequest trySchedulingBefore](self, "trySchedulingBefore");
  objc_msgSend(v5, "setTrySchedulingBefore:");
  objc_msgSend(v5, "setPriority:", -[ULBGSystemTaskRequest priority](self, "priority"));
  objc_msgSend(v5, "setRequiresProtectionClass:", -[ULBGSystemTaskRequest requiresProtectionClass](self, "requiresProtectionClass"));
  objc_msgSend(v5, "setResourceIntensive:", -[ULBGSystemTaskRequest resourceIntensive](self, "resourceIntensive"));
  objc_msgSend(v5, "setResources:", -[ULBGSystemTaskRequest resources](self, "resources"));
  objc_msgSend(v5, "setRequiresBuddyComplete:", -[ULBGSystemTaskRequest requiresBuddyComplete](self, "requiresBuddyComplete"));
  objc_msgSend(v5, "setRequiresUserInactivity:", -[ULBGSystemTaskRequest requiresUserInactivity](self, "requiresUserInactivity"));
  objc_msgSend(v5, "setPostInstall:", -[ULBGSystemTaskRequest postInstall](self, "postInstall"));
  return v5;
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
