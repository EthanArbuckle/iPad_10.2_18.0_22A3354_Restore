@implementation DMTSharingBackedRemoteSetupBroadcastingProvider

- (DMTRemoteSetupBroadcasting)broadcaster
{
  DMTSharingBroadcastPrimitives *v2;
  DMTSharingBackedRemoteSetupBroadcaster *v3;

  v2 = -[DMTSharingBroadcastPrimitives initWithLoggingIdentifier:]([DMTSharingBroadcastPrimitives alloc], "initWithLoggingIdentifier:", CFSTR("com.apple.DeviceManagementTools"));
  v3 = -[DMTSharingBackedRemoteSetupBroadcaster initWithPrimitives:]([DMTSharingBackedRemoteSetupBroadcaster alloc], "initWithPrimitives:", v2);

  return (DMTRemoteSetupBroadcasting *)v3;
}

@end
