@implementation CHManagedCallMigrationPolicy

- (id)addressForManagedCall:(id)a3
{
  return (id)objc_msgSend(a3, "address");
}

@end
