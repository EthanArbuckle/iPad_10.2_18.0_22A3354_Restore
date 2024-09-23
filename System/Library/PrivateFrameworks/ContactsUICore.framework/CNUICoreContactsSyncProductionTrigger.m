@implementation CNUICoreContactsSyncProductionTrigger

- (void)fireSyncRequest
{
  objc_msgSend(MEMORY[0x1E0C971B0], "requestAccountSyncWithDefaultOptions");
}

@end
