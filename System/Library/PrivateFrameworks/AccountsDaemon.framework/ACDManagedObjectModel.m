@implementation ACDManagedObjectModel

void ___ACDManagedObjectModel_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("accounts"), CFSTR("momd"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v0);
  v2 = (void *)_ACDManagedObjectModel_managedObjectModel;
  _ACDManagedObjectModel_managedObjectModel = v1;

}

@end
