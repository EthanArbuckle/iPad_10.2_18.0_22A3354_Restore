@implementation NSManagedObjectContext(VSAdditions)

- (uint64_t)vs_removeAllPersistentStores
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67__NSManagedObjectContext_VSAdditions__vs_removeAllPersistentStores__block_invoke;
  v2[3] = &unk_1E939EE88;
  v2[4] = a1;
  return objc_msgSend(a1, "performBlockAndWait:", v2);
}

@end
