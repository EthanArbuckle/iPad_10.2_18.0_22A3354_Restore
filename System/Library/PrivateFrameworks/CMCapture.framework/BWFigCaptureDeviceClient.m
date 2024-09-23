@implementation BWFigCaptureDeviceClient

- (int)clientPriority
{
  return self->_clientPriority;
}

- (BOOL)canStealFromClientsWithSamePriority
{
  return self->_canStealFromClientsWithSamePriority;
}

- (BWFigCaptureDeviceClient)initWithPID:(int)a3 clientApplicationID:(id)a4 clientDescription:(id)a5 clientPriority:(int)a6 canStealFromClientsWithSamePriority:(BOOL)a7 deviceSharingWithOtherClientsAllowed:(BOOL)a8 deviceAvailabilityChangedHandler:(id)a9
{
  BWFigCaptureDeviceClient *v15;
  BWFigCaptureDeviceClient *v16;
  int v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BWFigCaptureDeviceClient;
  v15 = -[BWFigCaptureDeviceClient init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v17 = sNextClientID++;
    v15->_clientID = v17;
    v15->_pid = a3;
    v15->_applicationID = (NSString *)objc_msgSend(a4, "copy");
    v16->_clientDescription = (NSString *)objc_msgSend(a5, "copy");
    v16->_clientPriority = a6;
    v16->_canStealFromClientsWithSamePriority = a7;
    v16->_deviceSharingWithOtherClientsAllowed = a8;
    v16->_deviceAvailabilityChangedHandler = (id)objc_msgSend(a9, "copy");
  }
  return v16;
}

- (int)clientID
{
  return self->_clientID;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFigCaptureDeviceClient;
  -[BWFigCaptureDeviceClient dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v4;

  v4 = -[BWFigCaptureDeviceClient clientID](self, "clientID");
  return v4 == objc_msgSend(a3, "clientID");
}

- (id)debugDescription
{
  uint64_t clientPriority;
  __CFString *v3;

  clientPriority = self->_clientPriority;
  if (clientPriority > 4)
    v3 = 0;
  else
    v3 = off_1E49237E8[clientPriority];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientID: %d, pid: %d, clientApplicationID: %@, clientDescription: %@, clientPriority: %@, canStealFromClientsWithSamePriority: %d, deviceSharingWithOtherClientsAllowed: %d, handler: %p"), self->_clientID, self->_pid, self->_applicationID, self->_clientDescription, v3, self->_canStealFromClientsWithSamePriority, self->_deviceSharingWithOtherClientsAllowed, self->_deviceAvailabilityChangedHandler);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[BWFigCaptureDeviceClient debugDescription](self, "debugDescription"));
}

- (BOOL)canShareRegistrationWithClientPID:(int)a3 deviceAvailabilityChangedHandler:(id)a4
{
  BOOL v4;

  if (self->_pid != a3)
    return 0;
  if (!self->_deviceSharingWithOtherClientsAllowed)
    return 0;
  v4 = 1;
  if (a4)
  {
    if (self->_deviceAvailabilityChangedHandler)
      return 0;
  }
  return v4;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)clientDescription
{
  return self->_clientDescription;
}

- (BOOL)deviceSharingWithOtherClientsAllowed
{
  return self->_deviceSharingWithOtherClientsAllowed;
}

- (id)deviceAvailabilityChangedHandler
{
  return self->_deviceAvailabilityChangedHandler;
}

- (void)setDeviceAvailabilityChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
