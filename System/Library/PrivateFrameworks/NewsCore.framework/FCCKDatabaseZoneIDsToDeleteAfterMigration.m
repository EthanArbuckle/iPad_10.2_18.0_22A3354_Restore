@implementation FCCKDatabaseZoneIDsToDeleteAfterMigration

id __FCCKDatabaseZoneIDsToDeleteAfterMigration_block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x1E0C95098];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = (void *)objc_msgSend(v4, "initWithZoneName:ownerName:", v3, *MEMORY[0x1E0C94730]);

  return v5;
}

@end
