@implementation MBSnapshotIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *backupUUID;
  id v5;

  backupUUID = self->_backupUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", backupUUID, CFSTR("backupUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_snapshotUUID, CFSTR("snapshotUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backupUDID, CFSTR("backupUDID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_snapshotID, CFSTR("snapshotID"));

}

- (MBSnapshotIdentifier)initWithCoder:(id)a3
{
  id v4;
  MBSnapshotIdentifier *v5;
  uint64_t v6;
  NSString *backupUUID;
  uint64_t v8;
  NSString *snapshotUUID;
  uint64_t v10;
  NSString *backupUDID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MBSnapshotIdentifier;
  v5 = -[MBSnapshotIdentifier init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    backupUUID = v5->_backupUUID;
    v5->_backupUUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snapshotUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    snapshotUUID = v5->_snapshotUUID;
    v5->_snapshotUUID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupUDID"));
    v10 = objc_claimAutoreleasedReturnValue();
    backupUDID = v5->_backupUDID;
    v5->_backupUDID = (NSString *)v10;

    v5->_snapshotID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("snapshotID"));
  }

  return v5;
}

- (MBSnapshotIdentifier)initWithBackupUDID:(id)a3 snapshotID:(unint64_t)a4
{
  id v7;
  MBSnapshotIdentifier *v8;
  MBSnapshotIdentifier *v9;
  NSString *backupUUID;
  NSString *snapshotUUID;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MBSnapshotIdentifier;
  v8 = -[MBSnapshotIdentifier init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    backupUUID = v8->_backupUUID;
    v8->_backupUUID = 0;

    snapshotUUID = v9->_snapshotUUID;
    v9->_snapshotUUID = 0;

    objc_storeStrong((id *)&v9->_backupUDID, a3);
    v9->_snapshotID = a4;
  }

  return v9;
}

- (MBSnapshotIdentifier)initWithBackupUUID:(id)a3 snapshotUUID:(id)a4
{
  id v7;
  id v8;
  MBSnapshotIdentifier *v9;
  MBSnapshotIdentifier *v10;
  NSString *backupUDID;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MBSnapshotIdentifier;
  v9 = -[MBSnapshotIdentifier init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backupUUID, a3);
    objc_storeStrong((id *)&v10->_snapshotUUID, a4);
    backupUDID = v10->_backupUDID;
    v10->_backupUDID = 0;

    v10->_snapshotID = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; backupUUID=%@, snapshotUUID=%@, backupUDID=%@, snapshotID=%lu>"),
    v5,
    self,
    self->_backupUUID,
    self->_snapshotUUID,
    self->_backupUDID,
    self->_snapshotID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)backupUUID
{
  return self->_backupUUID;
}

- (NSString)snapshotUUID
{
  return self->_snapshotUUID;
}

- (NSString)backupUDID
{
  return self->_backupUDID;
}

- (void)setBackupUDID:(id)a3
{
  objc_storeStrong((id *)&self->_backupUDID, a3);
}

- (unint64_t)snapshotID
{
  return self->_snapshotID;
}

- (void)setSnapshotID:(unint64_t)a3
{
  self->_snapshotID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupUDID, 0);
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_backupUUID, 0);
}

@end
