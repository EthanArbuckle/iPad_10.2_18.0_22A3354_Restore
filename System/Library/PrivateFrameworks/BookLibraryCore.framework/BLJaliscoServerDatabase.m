@implementation BLJaliscoServerDatabase

- (id)initIntoManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BLJaliscoServerDatabase *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x24BDBB658];
  v5 = a3;
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("BLJaliscoServerDatabase"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)BLJaliscoServerDatabase;
  v7 = -[BLJaliscoServerDatabase initWithEntity:insertIntoManagedObjectContext:](&v9, sel_initWithEntity_insertIntoManagedObjectContext_, v6, v5);

  return v7;
}

@end
