@implementation CKSyncEnginePendingZoneDelete

- (id)CKDescriptionClassName
{
  return CFSTR("PendingZoneDelete");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKSyncEnginePendingZoneDelete)initWithZoneID:(CKRecordZoneID *)zoneID
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSyncEnginePendingZoneDelete;
  return -[CKSyncEnginePendingDatabaseChange initWithZoneID:type:](&v4, sel_initWithZoneID_type_, zoneID, 1);
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
  v10.super_class = (Class)CKSyncEnginePendingZoneDelete;
  v4 = a3;
  -[CKSyncEnginePendingDatabaseChange CKDescribePropertiesUsing:](&v10, sel_CKDescribePropertiesUsing_, v4);
  objc_msgSend_zoneID(self, v5, v6, v7, v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("zoneID"), (uint64_t)v8, 0);

}

- (id)oppositeTypeChange
{
  CKSyncEnginePendingZoneSave *v3;
  CKRecordZone *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v3 = [CKSyncEnginePendingZoneSave alloc];
  v4 = [CKRecordZone alloc];
  objc_msgSend_zoneID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_initWithZoneID_(v4, v9, (uint64_t)v8, v10);
  v14 = (void *)objc_msgSend_initWithZone_(v3, v12, (uint64_t)v11, v13);

  return v14;
}

@end
