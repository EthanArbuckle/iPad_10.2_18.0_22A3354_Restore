@implementation PFCloudKitMetadataMigrationContext

- (PFCloudKitMetadataMigrationContext)init
{
  PFCloudKitMetadataMigrationContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitMetadataMigrationContext;
  v2 = -[PFCloudKitMetadataMigrationContext init](&v4, sel_init);
  if (v2)
  {
    v2->_migrationStatements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_sqlEntitiesToCreate = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_WORD *)&v2->_hasWorkToDo = 0;
    v2->_constrainedEntitiesToPreflight = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_migrationStatements = 0;
  self->_sqlEntitiesToCreate = 0;

  self->_currentModel = 0;
  self->_sqlModel = 0;

  self->_storeMetadataModel = 0;
  self->_storeSQLModel = 0;

  self->_storeMetadataVersionHashes = 0;
  self->_storeMetadataVersion = 0;

  self->_storeMetadataVersionHashes = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitMetadataMigrationContext;
  -[PFCloudKitMetadataMigrationContext dealloc](&v3, sel_dealloc);
}

- (void)addConstrainedEntityToPreflight:(id)a3
{
  -[NSMutableSet addObject:](self->_constrainedEntitiesToPreflight, "addObject:", a3);
}

@end
