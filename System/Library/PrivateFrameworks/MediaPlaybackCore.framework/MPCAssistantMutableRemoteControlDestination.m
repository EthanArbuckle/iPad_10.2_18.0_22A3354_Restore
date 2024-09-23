@implementation MPCAssistantMutableRemoteControlDestination

- (void)setAppBundleID:(id)a3
{
  NSString *v4;
  NSString *appBundleID;

  if (self->super._appBundleID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    appBundleID = self->super._appBundleID;
    self->super._appBundleID = v4;

  }
}

- (void)setPlayerID:(id)a3
{
  NSString *v4;
  NSString *playerID;

  if (self->super._playerID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    playerID = self->super._playerID;
    self->super._playerID = v4;

  }
}

- (void)setOrigin:(void *)a3
{
  void *origin;
  void *v6;

  origin = self->super._origin;
  if (origin != a3)
  {
    if (origin)
      CFRelease(origin);
    if (a3)
      v6 = (void *)CFRetain(a3);
    else
      v6 = 0;
    self->super._origin = v6;
  }
}

- (void)setOutputDeviceUIDs:(id)a3
{
  NSArray *v4;
  NSArray *outputDeviceUIDs;

  if (self->super._outputDeviceUIDs != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    outputDeviceUIDs = self->super._outputDeviceUIDs;
    self->super._outputDeviceUIDs = v4;

  }
}

- (void)setHashedOutputDeviceUIDs:(id)a3
{
  NSArray *v4;
  NSArray *hashedOutputDeviceUIDs;

  if (self->super._hashedOutputDeviceUIDs != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    hashedOutputDeviceUIDs = self->super._hashedOutputDeviceUIDs;
    self->super._hashedOutputDeviceUIDs = v4;

  }
}

- (void)setOutputGroups:(id)a3
{
  NSArray *v4;
  NSArray *outputGroups;

  if (self->super._outputGroups != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    outputGroups = self->super._outputGroups;
    self->super._outputGroups = v4;

  }
}

- (void)setOutputGroupID:(id)a3
{
  NSString *v4;
  NSString *outputGroupID;

  if (self->super._outputGroupID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    outputGroupID = self->super._outputGroupID;
    self->super._outputGroupID = v4;

  }
}

- (void)setOriginatingOutputDeviceUID:(id)a3
{
  NSString *v4;
  NSString *originatingOutputDeviceUID;

  if (self->super._originatingOutputDeviceUID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    originatingOutputDeviceUID = self->super._originatingOutputDeviceUID;
    self->super._originatingOutputDeviceUID = v4;

  }
}

- (void)setSingleGroup:(BOOL)a3
{
  if (self->super._singleGroup != a3)
    self->super._singleGroup = a3;
}

- (void)setOriginatingDeviceControl:(BOOL)a3
{
  if (self->super._originatingDeviceControl != a3)
    self->super._originatingDeviceControl = a3;
}

@end
