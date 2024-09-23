@implementation CKDAssetCacheTableGroup

+ (BOOL)rebootShouldClearData
{
  return 1;
}

+ (double)expirationTime
{
  return 28800.0;
}

- (id)createTables:(id *)a3
{
  CKDAssetHandleTable *v4;
  const char *v5;
  CKDAssetHandleTable *v6;
  CKDAssetHandleTable *assetHandleTable;
  CKDAssetVolumeTable *v8;
  const char *v9;
  CKDAssetVolumeTable *v10;
  CKDAssetVolumeTable *assetVolumeTable;
  CKDAssetHandleTable *v12;
  const char *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = [CKDAssetHandleTable alloc];
  v6 = (CKDAssetHandleTable *)objc_msgSend_initWithLogicalTableName_(v4, v5, (uint64_t)CFSTR("AssetHandle"));
  assetHandleTable = self->_assetHandleTable;
  self->_assetHandleTable = v6;

  v8 = [CKDAssetVolumeTable alloc];
  v10 = (CKDAssetVolumeTable *)objc_msgSend_initWithLogicalTableName_(v8, v9, (uint64_t)CFSTR("AssetVolume"));
  assetVolumeTable = self->_assetVolumeTable;
  self->_assetVolumeTable = v10;

  v12 = self->_assetHandleTable;
  v15[0] = self->_assetVolumeTable;
  v15[1] = v12;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)v15, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CKDAssetHandleTable)assetHandleTable
{
  return self->_assetHandleTable;
}

- (CKDAssetVolumeTable)assetVolumeTable
{
  return self->_assetVolumeTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVolumeTable, 0);
  objc_storeStrong((id *)&self->_assetHandleTable, 0);
}

@end
