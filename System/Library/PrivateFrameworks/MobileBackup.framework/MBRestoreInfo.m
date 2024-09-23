@implementation MBRestoreInfo

- (MBRestoreInfo)initWithDictionaryRepresentation:(id)a3
{
  MBRestoreInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBRestoreInfo;
  v4 = -[MBRestoreInfo init](&v6, sel_init);
  if (v4)
  {
    v4->_date = (NSDate *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RestoreDate")), "copy");
    v4->_wasCloudRestore = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WasCloudRestore")), "BOOLValue");
    v4->_backupBuildVersion = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BackupBuildVersion")), "copy");
    v4->_deviceBuildVersion = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DeviceBuildVersion")), "copy");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBRestoreInfo)initWithCoder:(id)a3
{
  MBRestoreInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBRestoreInfo;
  v4 = -[MBRestoreInfo init](&v6, sel_init);
  if (v4)
  {
    v4->_date = (NSDate *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v4->_wasCloudRestore = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("wasCloudRestore"));
    v4->_backupBuildVersion = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupBuildVersion"));
    v4->_deviceBuildVersion = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceBuildVersion"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_wasCloudRestore, CFSTR("wasCloudRestore"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_backupBuildVersion, CFSTR("backupBuildVersion"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_deviceBuildVersion, CFSTR("deviceBuildVersion"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  MBRestoreInfo *v4;

  v4 = objc_alloc_init(MBRestoreInfo);
  -[MBRestoreInfo setDate:](v4, "setDate:", self->_date);
  -[MBRestoreInfo setWasCloudRestore:](v4, "setWasCloudRestore:", self->_wasCloudRestore);
  -[MBRestoreInfo setDeviceBuildVersion:](v4, "setDeviceBuildVersion:", self->_deviceBuildVersion);
  -[MBRestoreInfo setBackupBuildVersion:](v4, "setBackupBuildVersion:", self->_backupBuildVersion);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBRestoreInfo;
  -[MBRestoreInfo dealloc](&v3, sel_dealloc);
}

- (void)setDate:(id)a3
{
  self->_date = (NSDate *)objc_msgSend(a3, "copy");
}

- (void)setWasCloudRestore:(BOOL)a3
{
  self->_wasCloudRestore = a3;
}

- (void)setDeviceBuildVersion:(id)a3
{
  self->_deviceBuildVersion = (NSString *)objc_msgSend(a3, "copy");
}

- (void)setBackupBuildVersion:(id)a3
{
  self->_backupBuildVersion = (NSString *)objc_msgSend(a3, "copy");
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", self->_date, CFSTR("RestoreDate"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wasCloudRestore), CFSTR("WasCloudRestore"), self->_backupBuildVersion, CFSTR("BackupBuildVersion"), self->_deviceBuildVersion, CFSTR("DeviceBuildVersion"), 0);
}

- (id)description
{
  return (id)objc_msgSend(-[MBRestoreInfo dictionaryRepresentation](self, "dictionaryRepresentation"), "description");
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)wasCloudRestore
{
  return self->_wasCloudRestore;
}

- (NSString)deviceBuildVersion
{
  return self->_deviceBuildVersion;
}

- (NSString)backupBuildVersion
{
  return self->_backupBuildVersion;
}

@end
