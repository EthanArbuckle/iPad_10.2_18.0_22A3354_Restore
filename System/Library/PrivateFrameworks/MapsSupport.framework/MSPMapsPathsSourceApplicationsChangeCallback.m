@implementation MSPMapsPathsSourceApplicationsChangeCallback

void __MSPMapsPathsSourceApplicationsChangeCallback_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("MSPMapsPathsAppContainerURLWasInvalidatedNotification"), 0);

}

@end
