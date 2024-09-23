@implementation DMFControlGroupIdentifier(CRKAdditions)

+ (id)crk_managedXPCGroupIdentifier
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BE2C7E8]);
  objc_msgSend(MEMORY[0x24BDD1880], "crk_zerosUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithOrganizationUUID:groupID:", v1, 0);

  return v2;
}

+ (id)crk_adHocXPCGroupIdentifier
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BE2C7E8]);
  objc_msgSend(MEMORY[0x24BDD1880], "crk_zerosUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithOrganizationUUID:groupID:", v1, 1);

  return v2;
}

+ (id)crk_asmXPCGroupIdentifier
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BE2C7E8]);
  objc_msgSend(MEMORY[0x24BDD1880], "crk_zerosUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithOrganizationUUID:groupID:", v1, 2);

  return v2;
}

@end
