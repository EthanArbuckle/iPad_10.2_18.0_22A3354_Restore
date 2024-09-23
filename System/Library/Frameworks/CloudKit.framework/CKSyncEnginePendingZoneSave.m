@implementation CKSyncEnginePendingZoneSave

- (CKSyncEnginePendingZoneSave)initWithZone:(CKRecordZone *)zone
{
  CKRecordZone *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CKSyncEnginePendingZoneSave *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CKRecordZone *v14;
  objc_super v16;

  v4 = zone;
  objc_msgSend_zoneID(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)CKSyncEnginePendingZoneSave;
  v9 = -[CKSyncEnginePendingDatabaseChange initWithZoneID:type:](&v16, sel_initWithZoneID_type_, v8, 0);

  if (v9)
  {
    v13 = objc_msgSend_copy(v4, v10, v11, v12);
    v14 = v9->_zone;
    v9->_zone = (CKRecordZone *)v13;

  }
  return v9;
}

- (id)CKDescriptionClassName
{
  return CFSTR("PendingZoneSave");
}

- (id)zoneID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_zone(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKRecordZone *zone;
  void *v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKSyncEnginePendingZoneSave;
  v4 = a3;
  -[CKSyncEnginePendingDatabaseChange encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  zone = self->_zone;
  NSStringFromSelector(sel_zone);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)zone, (uint64_t)v6, v8.receiver, v8.super_class);

}

- (CKSyncEnginePendingZoneSave)initWithCoder:(id)a3
{
  id v4;
  CKSyncEnginePendingZoneSave *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  CKRecordZone *zone;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSyncEnginePendingZoneSave;
  v5 = -[CKSyncEnginePendingDatabaseChange initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_zone);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue();
    zone = v5->_zone;
    v5->_zone = (CKRecordZone *)v9;

  }
  return v5;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKSyncEnginePendingZoneSave;
  v4 = a3;
  -[CKSyncEnginePendingDatabaseChange CKDescribePropertiesUsing:](&v10, sel_CKDescribePropertiesUsing_, v4);
  objc_msgSend_zone(self, v5, v6, v7, v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("zone"), (uint64_t)v8, 0);

}

- (id)oppositeTypeChange
{
  CKSyncEnginePendingZoneDelete *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v3 = [CKSyncEnginePendingZoneDelete alloc];
  objc_msgSend_zoneID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithZoneID_(v3, v8, (uint64_t)v7, v9);

  return v10;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
}

@end
