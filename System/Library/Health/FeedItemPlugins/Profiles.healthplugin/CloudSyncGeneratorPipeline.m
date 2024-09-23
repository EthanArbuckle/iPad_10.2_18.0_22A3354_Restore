@implementation CloudSyncGeneratorPipeline

- (void)didDismissCloudSyncAlert:(id)a3
{
  sub_231DA8DE4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, "Received didDismissCloudSyncAlert notification, updating backoff algorithm", "received didDismissCloudSyncAlert notification but notification publisher is not set up");
}

- (void)didCancelICloudStorageUpgrade:(id)a3
{
  sub_231DA8DE4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, "Received didCancelICloudStorageUpgrade notification, updating backoff algorithm", "received didCancelICloudStorageUpgrade notification but notification publisher is not set up");
}

@end
