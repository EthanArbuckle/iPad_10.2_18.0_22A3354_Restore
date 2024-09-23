@implementation BLJaliscoServerInfo

- (id)initIntoManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BLJaliscoServerInfo *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x24BDBB658];
  v5 = a3;
  objc_msgSend(v4, "entityForName:inManagedObjectContext:", CFSTR("BLJaliscoServerInfo"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)BLJaliscoServerInfo;
  v7 = -[BLJaliscoServerInfo initWithEntity:insertIntoManagedObjectContext:](&v9, sel_initWithEntity_insertIntoManagedObjectContext_, v6, v5);

  return v7;
}

@end
