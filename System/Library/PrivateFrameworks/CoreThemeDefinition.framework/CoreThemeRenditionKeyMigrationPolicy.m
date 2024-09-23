@implementation CoreThemeRenditionKeyMigrationPolicy

- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreThemeRenditionKeyMigrationPolicy;
  return -[NSEntityMigrationPolicy createDestinationInstancesForSourceInstance:entityMapping:manager:error:](&v7, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_, a3, a4, a5, a6);
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  BOOL v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CoreThemeRenditionKeyMigrationPolicy;
  v10 = -[NSEntityMigrationPolicy createRelationshipsForDestinationInstance:entityMapping:manager:error:](&v21, sel_createRelationshipsForDestinationInstance_entityMapping_manager_error_);
  v11 = objc_msgSend(a4, "name");
  v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sourceInstancesForEntityMappingNamed:destinationInstances:", v11, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a3)), "objectAtIndex:", 0), "valueForKey:", CFSTR("tint"));
  if (!v12)
    return 1;
  v13 = objc_msgSend(v12, "integerValue") > 0;
  v14 = (void *)objc_msgSend(a5, "destinationContext");
  v15 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier = %d"), v13);
  v16 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "destinationEntityForEntityMapping:", a4), "relationshipsByName"), "objectForKey:", CFSTR("presentationState")), "destinationEntity");
  v17 = (void *)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", objc_msgSend(v16, "name"));
  objc_msgSend(v17, "setPredicate:", v15);
  v20 = 0;
  v18 = objc_msgSend((id)objc_msgSend(v14, "executeFetchRequest:error:", v17, &v20), "objectAtIndex:", 0);
  if (!v18 || v20)
  {
    v10 = 0;
    if (a6)
      *a6 = v20;
  }
  else
  {
    objc_msgSend(a3, "setValue:forKey:", v18, CFSTR("presentationState"));
  }
  return v10;
}

- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

@end
