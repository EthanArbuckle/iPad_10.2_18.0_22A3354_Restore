@implementation GKHasSlowerGraphicsHardware

void __GKHasSlowerGraphicsHardware_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  GKHasSlowerGraphicsHardware_processorCount = objc_msgSend(v0, "processorCount");

}

void __GKHasSlowerGraphicsHardware_block_invoke_0()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  GKHasSlowerGraphicsHardware_processorCount_0 = objc_msgSend(v0, "processorCount");

}

@end
