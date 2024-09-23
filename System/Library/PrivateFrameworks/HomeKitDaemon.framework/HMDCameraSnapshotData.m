@implementation HMDCameraSnapshotData

- (HMDCameraSnapshotData)initWithSnapshotData:(id)a3 videoResolution:(id)a4 snapshotDataTrasaction:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCameraSnapshotData *v12;
  HMDCameraSnapshotData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraSnapshotData;
  v12 = -[HMDCameraSnapshotData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_snapshotData, a3);
    objc_storeStrong((id *)&v13->_snapshotDataTrasaction, a5);
    objc_storeStrong((id *)&v13->_videoResolution, a4);
  }

  return v13;
}

- (HMDCameraSnapshotData)initWithSnapshotFile:(id)a3 videoResolution:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCameraSnapshotData *v12;

  v6 = (objc_class *)MEMORY[0x24BE3F200];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithName:", CFSTR("com.apple.homed.snapshot-data"));
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentsAtPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMDCameraSnapshotData initWithSnapshotData:videoResolution:snapshotDataTrasaction:](self, "initWithSnapshotData:videoResolution:snapshotDataTrasaction:", v11, v7, v9);
  return v12;
}

- (void)dealloc
{
  NSData *snapshotData;
  objc_super v4;

  snapshotData = self->_snapshotData;
  self->_snapshotData = 0;

  v4.receiver = self;
  v4.super_class = (Class)HMDCameraSnapshotData;
  -[HMDCameraSnapshotData dealloc](&v4, sel_dealloc);
}

- (NSData)snapshotData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (HMFOSTransaction)snapshotDataTrasaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 16, 1);
}

- (HMDVideoResolution)videoResolution
{
  return (HMDVideoResolution *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoResolution, 0);
  objc_storeStrong((id *)&self->_snapshotDataTrasaction, 0);
  objc_storeStrong((id *)&self->_snapshotData, 0);
}

@end
