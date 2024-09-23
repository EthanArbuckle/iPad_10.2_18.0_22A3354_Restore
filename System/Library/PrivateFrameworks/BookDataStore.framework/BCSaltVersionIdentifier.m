@implementation BCSaltVersionIdentifier

+ (id)fetchRequest
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], a2, (uint64_t)CFSTR("BCSaltVersionIdentifier"), v2, v3);
}

- (id)initIntoManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  BCSaltVersionIdentifier *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x24BDBB658];
  v5 = a3;
  objc_msgSend_entityForName_inManagedObjectContext_(v4, v6, (uint64_t)CFSTR("BCSaltVersionIdentifier"), (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)BCSaltVersionIdentifier;
  v9 = -[BCSaltVersionIdentifier initWithEntity:insertIntoManagedObjectContext:](&v11, sel_initWithEntity_insertIntoManagedObjectContext_, v8, v5);

  return v9;
}

@end
