@implementation HMDSnapshotRemoteSession

- (HMDSnapshotRemoteSession)initWithSessionID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 streamingTierType:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9
{
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDSnapshotRemoteSession;
  v10 = 0;
  return -[HMDSnapshotSession initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:snapshotForNotification:](&v11, sel_initWithSessionID_accessory_snapshotGetter_message_waitPeriod_streamingTierType_cameraLocallyReachable_snapshotForNotification_, a3, a4, a5, a6, a8, a9, a7, v10);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v6.receiver = self;
  v6.super_class = (Class)HMDSnapshotRemoteSession;
  -[HMDSnapshotSession description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Snapshot-Remote-Session: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
