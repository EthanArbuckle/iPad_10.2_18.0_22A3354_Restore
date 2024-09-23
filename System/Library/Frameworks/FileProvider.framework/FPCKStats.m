@implementation FPCKStats

- (FPCKStats)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPCKStats;
  return -[FPCKStats init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t numberOfFilesChecked;
  id v5;

  numberOfFilesChecked = self->_numberOfFilesChecked;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", numberOfFilesChecked, CFSTR("_numberOfFilesChecked"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfBrokenFilesInFSAndFSSnapshotCheck, CFSTR("_numberOfBrokenFilesInFSAndFSSnapshotCheck"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck, CFSTR("_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfBrokenFilesInReconciliationTableCheck, CFSTR("_numberOfBrokenFilesInReconciliationTableCheck"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfBrokenFilesInBackupManifestCheck, CFSTR("_numberOfBrokenFilesInBackupManifestCheck"));

}

- (FPCKStats)initWithCoder:(id)a3
{
  id v4;
  FPCKStats *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPCKStats;
  v5 = -[FPCKStats init](&v7, sel_init);
  if (v5)
  {
    v5->_numberOfFilesChecked = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfFilesChecked"));
    v5->_numberOfBrokenFilesInFSAndFSSnapshotCheck = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfBrokenFilesInFSAndFSSnapshotCheck"));
    v5->_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck"));
    v5->_numberOfBrokenFilesInReconciliationTableCheck = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfBrokenFilesInReconciliationTableCheck"));
    v5->_numberOfBrokenFilesInBackupManifestCheck = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfBrokenFilesInBackupManifestCheck"));
  }

  return v5;
}

- (int64_t)numberOfFilesChecked
{
  return self->_numberOfFilesChecked;
}

- (void)setNumberOfFilesChecked:(int64_t)a3
{
  self->_numberOfFilesChecked = a3;
}

- (int64_t)numberOfBrokenFilesInFSAndFSSnapshotCheck
{
  return self->_numberOfBrokenFilesInFSAndFSSnapshotCheck;
}

- (void)setNumberOfBrokenFilesInFSAndFSSnapshotCheck:(int64_t)a3
{
  self->_numberOfBrokenFilesInFSAndFSSnapshotCheck = a3;
}

- (int64_t)numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck
{
  return self->_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck;
}

- (void)setNumberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck:(int64_t)a3
{
  self->_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck = a3;
}

- (int64_t)numberOfBrokenFilesInBackupManifestCheck
{
  return self->_numberOfBrokenFilesInBackupManifestCheck;
}

- (void)setNumberOfBrokenFilesInBackupManifestCheck:(int64_t)a3
{
  self->_numberOfBrokenFilesInBackupManifestCheck = a3;
}

- (int64_t)numberOfBrokenFilesInReconciliationTableCheck
{
  return self->_numberOfBrokenFilesInReconciliationTableCheck;
}

- (void)setNumberOfBrokenFilesInReconciliationTableCheck:(int64_t)a3
{
  self->_numberOfBrokenFilesInReconciliationTableCheck = a3;
}

@end
