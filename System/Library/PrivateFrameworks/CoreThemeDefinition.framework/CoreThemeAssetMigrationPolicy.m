@implementation CoreThemeAssetMigrationPolicy

- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreThemeAssetMigrationPolicy;
  return -[NSEntityMigrationPolicy createDestinationInstancesForSourceInstance:entityMapping:manager:error:](&v7, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_, a3, a4, a5, a6);
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  BOOL v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)CoreThemeAssetMigrationPolicy;
  v9 = -[NSEntityMigrationPolicy createRelationshipsForDestinationInstance:entityMapping:manager:error:](&v15, sel_createRelationshipsForDestinationInstance_entityMapping_manager_error_, a3, a4, a5, a6);
  v10 = objc_msgSend(a4, "name");
  v16[0] = a3;
  v11 = (void *)objc_msgSend((id)objc_msgSend(a5, "sourceInstancesForEntityMappingNamed:destinationInstances:", v10, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1)), "objectAtIndex:", 0);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "entity"), "propertiesByName"), "allKeys"), "containsObject:", CFSTR("template")))
  {
    v12 = objc_msgSend((id)objc_msgSend(v11, "valueForKey:", CFSTR("template")), "BOOLValue");
    v13 = (void *)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("RenderingMode"));
    objc_msgSend(v13, "setPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier = %d"), v12 ^ 1u));
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "destinationContext"), "executeFetchRequest:error:", v13, 0), "firstObject"), CFSTR("templateRenderingMode"));
  }
  return v9;
}

- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

@end
