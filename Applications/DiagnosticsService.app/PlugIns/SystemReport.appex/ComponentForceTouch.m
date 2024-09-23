@implementation ComponentForceTouch

- (BOOL)isPresent
{
  uint64_t Default;
  const void *v3;
  char v4;

  Default = MTDeviceCreateDefault(self, a2);
  if (Default)
  {
    v3 = (const void *)Default;
    v4 = MTDeviceSupportsForce();
    CFRelease(v3);
    LOBYTE(Default) = v4;
  }
  return Default;
}

- (void)populateAttributes:(id)a3
{
  OSDGrape *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_alloc_init(OSDGrape);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OSDGrape orbErrorDetected](v3, "orbErrorDetected"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("Errors"));

  }
}

@end
