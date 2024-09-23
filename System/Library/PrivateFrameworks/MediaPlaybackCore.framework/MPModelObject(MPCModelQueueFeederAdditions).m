@implementation MPModelObject(MPCModelQueueFeederAdditions)

+ (uint64_t)mqf_requiredItemPlaybackProperties
{
  void *v4;
  void *v5;

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPCModelQueueFeeder.m"), 1304, CFSTR("Could not discern required properties for %@"), v5);

  }
  return objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
}

+ (uint64_t)mqf_requiredSectionPlaybackProperties
{
  void *v4;
  void *v5;

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPCModelQueueFeeder.m"), 1311, CFSTR("Could not discern required properties for %@"), v5);

  }
  return objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
}

@end
