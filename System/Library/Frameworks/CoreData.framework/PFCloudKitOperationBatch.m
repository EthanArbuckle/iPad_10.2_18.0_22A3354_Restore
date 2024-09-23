@implementation PFCloudKitOperationBatch

- (PFCloudKitOperationBatch)init
{
  PFCloudKitOperationBatch *v2;
  PFCloudKitOperationBatch *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFCloudKitOperationBatch;
  v2 = -[PFCloudKitOperationBatch init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sizeInBytes = 0;
    v2->_recordTypeToDeletedRecordID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_records = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_deletedRecordIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3->_recordIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_recordTypeToDeletedRecordID = 0;
  self->_records = 0;

  self->_deletedRecordIDs = 0;
  self->_recordIDs = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitOperationBatch;
  -[PFCloudKitOperationBatch dealloc](&v3, sel_dealloc);
}

- (uint64_t)addRecord:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    *(_QWORD *)(result + 40) += objc_msgSend(a2, "size");
    objc_msgSend(*(id *)(v3 + 24), "addObject:", a2);
    return objc_msgSend(*(id *)(v3 + 32), "addObject:", objc_msgSend(a2, "recordID"));
  }
  return result;
}

- (void)addDeletedRecordID:(uint64_t)a3 forRecordOfType:
{
  id v6;
  id v7;
  id v8;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "addObject:", a2);
    *(_QWORD *)(a1 + 40) += +[PFCloudKitSerializer estimateByteSizeOfRecordID:]((uint64_t)PFCloudKitSerializer, a2);
    v6 = (id)objc_msgSend(*(id *)(a1 + 16), "objectForKey:", a3);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v7, a3);
      v6 = v7;
    }
    v8 = v6;
    objc_msgSend(v6, "addObject:", a2);

  }
}

@end
