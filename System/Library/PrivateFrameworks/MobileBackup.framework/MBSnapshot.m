@implementation MBSnapshot

- (MBSnapshot)initWithSnapshotID:(unint64_t)a3 backupUUID:(id)a4 snapshotUUID:(id)a5 commitID:(id)a6 format:(int64_t)a7 deviceName:(id)a8 date:(id)a9 created:(id)a10 modified:(id)a11 state:(int)a12 isCompatible:(BOOL)a13 systemVersion:(id)a14 buildVersion:(id)a15 quotaReserved:(unint64_t)a16 type:(int64_t)a17 backupPolicy:(int64_t)a18 accountType:(int64_t)a19
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  MBSnapshot *v30;
  MBSnapshot *v31;
  uint64_t v32;
  NSString *snapshotUUID;
  uint64_t v34;
  NSString *backupUUID;
  uint64_t v36;
  NSString *deviceName;
  uint64_t v38;
  NSDate *date;
  uint64_t v40;
  NSDate *created;
  uint64_t v42;
  NSDate *modified;
  uint64_t v44;
  NSString *systemVersion;
  uint64_t v46;
  NSString *buildVersion;
  id v50;
  id v51;
  id v52;
  objc_super v53;

  v52 = a4;
  v51 = a5;
  v24 = a6;
  v50 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = a14;
  v29 = a15;
  v53.receiver = self;
  v53.super_class = (Class)MBSnapshot;
  v30 = -[MBSnapshot init](&v53, sel_init);
  v31 = v30;
  if (v30)
  {
    v30->_snapshotID = a3;
    v32 = objc_msgSend(v51, "copy");
    snapshotUUID = v31->_snapshotUUID;
    v31->_snapshotUUID = (NSString *)v32;

    v34 = objc_msgSend(v52, "copy");
    backupUUID = v31->_backupUUID;
    v31->_backupUUID = (NSString *)v34;

    objc_storeStrong((id *)&v31->_commitID, a6);
    v31->_format = a7;
    v36 = objc_msgSend(v50, "copy");
    deviceName = v31->_deviceName;
    v31->_deviceName = (NSString *)v36;

    v38 = objc_msgSend(v25, "copy");
    date = v31->_date;
    v31->_date = (NSDate *)v38;

    v40 = objc_msgSend(v26, "copy");
    created = v31->_created;
    v31->_created = (NSDate *)v40;

    v42 = objc_msgSend(v27, "copy");
    modified = v31->_modified;
    v31->_modified = (NSDate *)v42;

    v31->_state = a12;
    v31->_isCompatible = a13;
    v44 = objc_msgSend(v28, "copy");
    systemVersion = v31->_systemVersion;
    v31->_systemVersion = (NSString *)v44;

    v46 = objc_msgSend(v29, "copy");
    buildVersion = v31->_buildVersion;
    v31->_buildVersion = (NSString *)v46;

    v31->_type = a17;
    v31->_backupPolicy = a18;
    v31->_quotaReserved = a16;
    v31->_estimatedRestoreSize = -1;
    v31->_accountType = a19;
  }

  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBSnapshot)initWithCoder:(id)a3
{
  id v4;
  MBSnapshot *v5;
  void *v6;
  uint64_t v7;
  NSString *snapshotUUID;
  uint64_t v9;
  NSString *backupUUID;
  uint64_t v11;
  NSString *commitID;
  uint64_t v13;
  NSString *deviceName;
  uint64_t v15;
  NSDate *date;
  uint64_t v17;
  NSDate *created;
  uint64_t v19;
  NSDate *modified;
  uint64_t v21;
  NSString *systemVersion;
  uint64_t v23;
  NSString *buildVersion;
  void *v25;
  uint64_t v26;
  NSString *requiredProductVersion;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MBSnapshot;
  v5 = -[MBSnapshot init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snapshotID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_snapshotID = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snapshotUUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    snapshotUUID = v5->_snapshotUUID;
    v5->_snapshotUUID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupUUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    backupUUID = v5->_backupUUID;
    v5->_backupUUID = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commitID"));
    v11 = objc_claimAutoreleasedReturnValue();
    commitID = v5->_commitID;
    v5->_commitID = (NSString *)v11;

    v5->_format = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("format"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v13 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v15 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("created"));
    v17 = objc_claimAutoreleasedReturnValue();
    created = v5->_created;
    v5->_created = (NSDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modified"));
    v19 = objc_claimAutoreleasedReturnValue();
    modified = v5->_modified;
    v5->_modified = (NSDate *)v19;

    v5->_state = objc_msgSend(v4, "decodeIntForKey:", CFSTR("state"));
    v5->_isCompatible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCompatible"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemVersion"));
    v21 = objc_claimAutoreleasedReturnValue();
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildVersion"));
    v23 = objc_claimAutoreleasedReturnValue();
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quotaReserved"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_quotaReserved = objc_msgSend(v25, "longLongValue");

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backupType"));
    v5->_backupPolicy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backupPolicy"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiredProductVersion"));
    v26 = objc_claimAutoreleasedReturnValue();
    requiredProductVersion = v5->_requiredProductVersion;
    v5->_requiredProductVersion = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedRestoreSize"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_estimatedRestoreSize = objc_msgSend(v28, "longLongValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t snapshotID;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  snapshotID = self->_snapshotID;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", snapshotID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("snapshotID"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_snapshotUUID, CFSTR("snapshotUUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_backupUUID, CFSTR("backupUUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_commitID, CFSTR("commitID"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_created, CFSTR("created"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_modified, CFSTR("modified"));
  objc_msgSend(v6, "encodeInt:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isCompatible, CFSTR("isCompatible"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_systemVersion, CFSTR("systemVersion"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_buildVersion, CFSTR("buildVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_quotaReserved);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("quotaReserved"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_type, CFSTR("backupType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_backupPolicy, CFSTR("backupPolicy"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_requiredProductVersion, CFSTR("requiredProductVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_estimatedRestoreSize);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("estimatedRestoreSize"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  BYTE4(v8) = self->_isCompatible;
  LODWORD(v8) = self->_state;
  v5 = (void *)objc_msgSend(v4, "initWithSnapshotID:backupUUID:snapshotUUID:commitID:format:deviceName:date:created:modified:state:isCompatible:systemVersion:buildVersion:quotaReserved:type:backupPolicy:accountType:", self->_snapshotID, self->_backupUUID, self->_snapshotUUID, self->_commitID, self->_format, self->_deviceName, self->_date, self->_created, self->_modified, v8, self->_systemVersion, self->_buildVersion, self->_quotaReserved, self->_type, self->_backupPolicy, self->_accountType);
  -[MBSnapshot requiredProductVersion](self, "requiredProductVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequiredProductVersion:", v6);

  objc_msgSend(v5, "setEstimatedRestoreSize:", -[MBSnapshot estimatedRestoreSize](self, "estimatedRestoreSize"));
  return v5;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; snapshotID=%lu, snapshotUUID=%@, commitID=%@, format=%lld, state=%d, type=%ld, backupPolicy=%ld, deviceName=\"%@\", date=\"%@\", systemVersion=%@, buildVersion=%@, isCompatible=%d/%@, quotaReserved=%llu, estimatedRestoreSize=%lld, accountType=%ld>"),
    v5,
    self,
    self->_snapshotID,
    self->_snapshotUUID,
    self->_commitID,
    self->_format,
    self->_state,
    self->_type,
    self->_backupPolicy,
    self->_deviceName,
    self->_date,
    self->_systemVersion,
    self->_buildVersion,
    self->_isCompatible,
    self->_requiredProductVersion,
    self->_quotaReserved,
    self->_estimatedRestoreSize,
    self->_accountType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_snapshotID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("snapshotID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_format);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("format"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_systemVersion, CFSTR("systemVersion"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_buildVersion, CFSTR("buildVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("snapshotType"));

  objc_msgSend(v4, "stringFromDate:", self->_created);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("created"));

  objc_msgSend(v4, "stringFromDate:", self->_modified);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("modified"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCompatible);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isCompatible"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_backupUUID, CFSTR("backupUUID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_requiredProductVersion, CFSTR("requiredProductVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_estimatedRestoreSize);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("estimatedRestoreSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_backupPolicy);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("backupPolicy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_accountType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("accountType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_quotaReserved);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("quotaReserved"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_state);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("state"));

  objc_msgSend(v4, "stringFromDate:", self->_date);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("date"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_snapshotUUID, CFSTR("UUID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_commitID, CFSTR("commitID"));

  return v3;
}

- (unint64_t)snapshotID
{
  return self->_snapshotID;
}

- (NSString)backupUUID
{
  return self->_backupUUID;
}

- (NSString)snapshotUUID
{
  return self->_snapshotUUID;
}

- (NSString)commitID
{
  return self->_commitID;
}

- (void)setCommitID:(id)a3
{
  objc_storeStrong((id *)&self->_commitID, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSDate)date
{
  return self->_date;
}

- (NSDate)created
{
  return self->_created;
}

- (NSDate)modified
{
  return self->_modified;
}

- (int)state
{
  return self->_state;
}

- (BOOL)isCompatible
{
  return self->_isCompatible;
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)requiredProductVersion
{
  return self->_requiredProductVersion;
}

- (void)setRequiredProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_requiredProductVersion, a3);
}

- (unint64_t)quotaReserved
{
  return self->_quotaReserved;
}

- (int64_t)estimatedRestoreSize
{
  return self->_estimatedRestoreSize;
}

- (void)setEstimatedRestoreSize:(int64_t)a3
{
  self->_estimatedRestoreSize = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)backupPolicy
{
  return self->_backupPolicy;
}

- (void)setBackupPolicy:(int64_t)a3
{
  self->_backupPolicy = a3;
}

- (int64_t)format
{
  return self->_format;
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredProductVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_commitID, 0);
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_backupUUID, 0);
}

@end
