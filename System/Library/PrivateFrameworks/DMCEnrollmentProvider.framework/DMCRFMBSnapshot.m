@implementation DMCRFMBSnapshot

- (DMCRFMBSnapshot)initWithSnapshot:(id)a3
{
  id v5;
  DMCRFMBSnapshot *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMCRFMBSnapshot;
  v6 = -[DMCRFMBSnapshot init](&v8, sel_init);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v6->_snapshot, a3);
  }

  return v6;
}

+ (id)snapshotIdentifierFromSnapshot:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BE66C58];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "backupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithBackupUUID:snapshotUUID:", v6, v7);
  return v8;
}

- (NSDate)date
{
  void *v2;
  void *v3;

  -[DMCRFMBSnapshot snapshot](self, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)dateCreated
{
  void *v2;
  void *v3;

  -[DMCRFMBSnapshot snapshot](self, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "created");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)dateModified
{
  void *v2;
  void *v3;

  -[DMCRFMBSnapshot snapshot](self, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modified");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSString)deviceName
{
  void *v2;
  void *v3;

  -[DMCRFMBSnapshot snapshot](self, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (DMCRFSnapshotIdentifier)identifier
{
  void *v3;
  void *v4;
  void *v5;
  DMCRFMBSnapshotIdentifier *v6;

  v3 = (void *)objc_opt_class();
  -[DMCRFMBSnapshot snapshot](self, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotIdentifierFromSnapshot:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[DMCRFMBSnapshotIdentifier initWithMBSnapshotIdentifier:]([DMCRFMBSnapshotIdentifier alloc], "initWithMBSnapshotIdentifier:", v5);
  return (DMCRFSnapshotIdentifier *)v6;
}

- (MBSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
