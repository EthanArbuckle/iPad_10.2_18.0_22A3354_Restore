@implementation HKDeletedObject(HDCodingSupport)

+ (uint64_t)createWithCodable:()HDCodingSupport
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKObject+HDCodingSupport.m"), 1391, CFSTR("HKDeletedObjects don't use HDCodingSupport, deleted objects from codable is handled in HDDatatSyncEntity's _insertObjectsFromCodableObjectCollection:syncStore:profile:error:"));

  return 0;
}

- (uint64_t)codableRepresentationForSync
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return 0;
}

@end
