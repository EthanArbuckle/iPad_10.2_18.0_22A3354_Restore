@implementation HMDSnapshotCacheEntry

- (HMDSnapshotCacheEntry)initWithSnapshotCharacteristicEventUUID:(id)a3 snapshotFile:(id)a4 timer:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDSnapshotCacheEntry *v12;
  HMDSnapshotCacheEntry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDSnapshotCacheEntry;
  v12 = -[HMDSnapshotCacheEntry init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_snapshotCharacteristicEventUUID, a3);
    objc_storeStrong((id *)&v13->_snapshotFile, a4);
    objc_storeStrong((id *)&v13->_timer, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDSnapshotCacheEntry snapshotCharacteristicEventUUID](self, "snapshotCharacteristicEventUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSnapshotCacheEntry snapshotFile](self, "snapshotFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Snapshot-Characteristic-EventUUID %@, Snapshot-File %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDSnapshotFile)snapshotFile
{
  return self->_snapshotFile;
}

- (NSString)snapshotCharacteristicEventUUID
{
  return self->_snapshotCharacteristicEventUUID;
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (id)snapshotRequestCompletion
{
  return self->_snapshotRequestCompletion;
}

- (void)setSnapshotRequestCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_snapshotRequestCompletion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_snapshotCharacteristicEventUUID, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
}

@end
