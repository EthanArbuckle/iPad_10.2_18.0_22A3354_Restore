@implementation PFCloudKitImportDatabaseContext

- (PFCloudKitImportDatabaseContext)init
{
  PFCloudKitImportDatabaseContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitImportDatabaseContext;
  v2 = -[PFCloudKitImportDatabaseContext init](&v4, sel_init);
  if (v2)
  {
    v2->_changedRecordZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_deletedRecordZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_purgedRecordZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_userResetEncryptedDataZoneIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v2->_updatedChangeToken = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_changedRecordZoneIDs = 0;
  self->_deletedRecordZoneIDs = 0;

  self->_purgedRecordZoneIDs = 0;
  self->_userResetEncryptedDataZoneIDs = 0;

  self->_updatedChangeToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImportDatabaseContext;
  -[PFCloudKitImportDatabaseContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  CKServerChangeToken *updatedChangeToken;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitImportDatabaseContext;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", -[PFCloudKitImportDatabaseContext description](&v6, sel_description));
  updatedChangeToken = self->_updatedChangeToken;
  if (!updatedChangeToken)
    updatedChangeToken = (CKServerChangeToken *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  objc_msgSend(v3, "appendFormat:", CFSTR(" {\nToken: %@"), updatedChangeToken);
  if (-[NSMutableSet count](self->_changedRecordZoneIDs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("\nChanged:\n%@"), self->_changedRecordZoneIDs);
  if (-[NSMutableSet count](self->_deletedRecordZoneIDs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("\nDeleted:\n%@"), self->_deletedRecordZoneIDs);
  if (-[NSMutableSet count](self->_purgedRecordZoneIDs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("\nPurged:\n%@"), self->_purgedRecordZoneIDs);
  if (-[NSMutableSet count](self->_userResetEncryptedDataZoneIDs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("\nReset:\n%@"), self->_userResetEncryptedDataZoneIDs);
  objc_msgSend(v3, "appendString:", CFSTR("\n}"));
  return v3;
}

- (BOOL)hasWorkToDo
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return objc_msgSend(*(id *)(result + 8), "count")
        || objc_msgSend(*(id *)(v1 + 24), "count")
        || objc_msgSend(*(id *)(v1 + 16), "count") != 0;
  }
  return result;
}

@end
