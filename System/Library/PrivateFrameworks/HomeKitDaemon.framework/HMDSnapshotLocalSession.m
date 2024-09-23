@implementation HMDSnapshotLocalSession

- (HMDSnapshotLocalSession)initWithSessionID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 reachabilityPath:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9 snapshotForNotification:(BOOL)a10
{
  _BOOL8 v10;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  HMDSnapshotLocalSession *v23;
  objc_super v25;

  v10 = a9;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  if (isWatch())
  {
    v21 = 0;
  }
  else if (v10)
  {
    if (isiPadDevice() || isAppleTV())
      v21 = 2;
    else
      v21 = 1;
  }
  else
  {
    v22 = 4;
    if (a8 != 3)
      v22 = 1;
    if (a8 == 2)
      v21 = 3;
    else
      v21 = v22;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMDSnapshotLocalSession;
  v23 = -[HMDSnapshotSession initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:snapshotForNotification:](&v25, sel_initWithSessionID_accessory_snapshotGetter_message_waitPeriod_streamingTierType_cameraLocallyReachable_snapshotForNotification_, v17, v18, v19, v20, v21, v10, a7, a10);

  return v23;
}

- (void)addMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSnapshotSession sessionMessages](self, "sessionMessages");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v6.receiver = self;
  v6.super_class = (Class)HMDSnapshotLocalSession;
  -[HMDSnapshotSession description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Snapshot-Local-Session: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
