@implementation MBBackup

- (MBBackup)initWithBackupUDID:(id)a3 backupUUID:(id)a4 deviceClass:(id)a5 productType:(id)a6 hardwareModel:(id)a7 marketingName:(id)a8 snapshots:(id)a9 restoreSystemFiles:(BOOL)a10 isMBSBackup:(BOOL)a11 isBackupEnabled:(BOOL)a12 hasBackupEnabledState:(BOOL)a13
{
  MBBackup *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MBBackup;
  v19 = -[MBBackup init](&v21, sel_init);
  if (v19)
  {
    v19->_backupUDID = (NSString *)objc_msgSend(a3, "copy");
    v19->_backupUUID = (NSString *)objc_msgSend(a4, "copy");
    v19->_deviceClass = (NSString *)objc_msgSend(a5, "copy");
    v19->_productType = (NSString *)objc_msgSend(a6, "copy");
    v19->_hardwareModel = (NSString *)objc_msgSend(a7, "copy");
    v19->_marketingName = (NSString *)objc_msgSend(a8, "copy");
    v19->_snapshots = (NSArray *)a9;
    v19->_restoreSystemFiles = a10;
    v19->_isMBSBackup = a11;
    v19->_isBackupEnabled = a12;
    v19->_hasBackupEnabledState = a13;
  }
  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBBackup)initWithCoder:(id)a3
{
  MBBackup *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MBBackup;
  v4 = -[MBBackup init](&v8, sel_init);
  if (v4)
  {
    v4->_backupUDID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupUDID"));
    v4->_backupUUID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupUUID"));
    v4->_deviceClass = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceClass"));
    v4->_productType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v4->_hardwareModel = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hardwareModel"));
    v4->_marketingName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("marketingName"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_snapshots = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("snapshots"));
    v4->_restoreSystemFiles = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restoreSystemFiles")), "BOOLValue");
    v4->_isMBSBackup = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isMBSBackup")), "BOOLValue");
    v4->_isBackupEnabled = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBackupEnabled")), "BOOLValue");
    v4->_hasBackupEnabledState = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasBackupEnabledState")), "BOOLValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backupUDID, CFSTR("backupUDID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_backupUUID, CFSTR("backupUUID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_hardwareModel, CFSTR("hardwareModel"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_marketingName, CFSTR("marketingName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_snapshots, CFSTR("snapshots"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_restoreSystemFiles), CFSTR("restoreSystemFiles"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMBSBackup), CFSTR("isMBSBackup"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBackupEnabled), CFSTR("isBackupEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasBackupEnabledState), CFSTR("hasBackupEnabledState"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBBackup;
  -[MBBackup dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LODWORD(v6) = *(_DWORD *)&self->_restoreSystemFiles;
  return (id)objc_msgSend(v4, "initWithBackupUDID:backupUUID:deviceClass:productType:hardwareModel:marketingName:snapshots:restoreSystemFiles:isMBSBackup:isBackupEnabled:hasBackupEnabledState:", self->_backupUDID, self->_backupUUID, self->_deviceClass, self->_productType, self->_hardwareModel, self->_marketingName, self->_snapshots, v6);
}

- (BOOL)isEqual:(id)a3
{
  return -[NSString isEqualToString:](self->_backupUDID, "isEqualToString:", objc_msgSend(a3, "backupUDID"))
      || -[NSString isEqualToString:](self->_backupUDID, "isEqualToString:", objc_msgSend(a3, "backupUUID"))
      || -[NSString isEqualToString:](self->_backupUUID, "isEqualToString:", objc_msgSend(a3, "backupUUID"));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; deviceUDID=%@, deviceUUID=%@, device=\"%@/%@/%@\", restoreSysFiles=%d, snapshots=%@>"),
               NSStringFromClass(v4),
               self,
               self->_backupUDID,
               self->_backupUUID,
               self->_productType,
               self->_hardwareModel,
               self->_marketingName,
               self->_restoreSystemFiles,
               self->_snapshots);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *snapshots;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_backupUDID, CFSTR("UDID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_backupUUID, CFSTR("UUID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_productType, CFSTR("productType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_hardwareModel, CFSTR("hardwareModel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_marketingName, CFSTR("marketingName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_restoreSystemFiles), CFSTR("restoreSystemFiles"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMBSBackup), CFSTR("isMBSBackup"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBackupEnabled), CFSTR("isBackupEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasBackupEnabledState), CFSTR("hasBackupEnabledState"));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  snapshots = self->_snapshots;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](snapshots, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(snapshots);
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "dictionaryRepresentation"));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](snapshots, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("snapshots"));
  return v3;
}

- (NSString)backupUDID
{
  return self->_backupUDID;
}

- (NSString)backupUUID
{
  return self->_backupUUID;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (NSString)marketingName
{
  return self->_marketingName;
}

- (NSArray)snapshots
{
  return self->_snapshots;
}

- (BOOL)canRestoreSystemFiles
{
  return self->_restoreSystemFiles;
}

- (BOOL)isMBSBackup
{
  return self->_isMBSBackup;
}

- (BOOL)isBackupEnabled
{
  return self->_isBackupEnabled;
}

- (BOOL)hasBackupEnabledState
{
  return self->_hasBackupEnabledState;
}

@end
