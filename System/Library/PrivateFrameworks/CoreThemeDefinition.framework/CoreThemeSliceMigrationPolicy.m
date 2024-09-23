@implementation CoreThemeSliceMigrationPolicy

- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  BOOL v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[2];
  NSRect v17;

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)CoreThemeSliceMigrationPolicy;
  v9 = -[NSEntityMigrationPolicy createDestinationInstancesForSourceInstance:entityMapping:manager:error:](&v15, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_, a3, a4, a5, a6);
  v10 = objc_msgSend(a4, "name");
  v16[0] = a3;
  v11 = (void *)objc_msgSend((id)objc_msgSend(a5, "destinationInstancesForEntityMappingNamed:sourceInstances:", v10, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1)), "firstObject");
  v12 = (NSString *)objc_msgSend(a3, "valueForKey:", CFSTR("sliceRectString"));
  v13 = (void *)MEMORY[0x24BDD1968];
  v17 = NSRectFromString(v12);
  objc_msgSend(v11, "setValue:forKey:", objc_msgSend(v13, "valueWithRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height), CFSTR("sliceRect"));
  return v9;
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreThemeSliceMigrationPolicy;
  return -[NSEntityMigrationPolicy createRelationshipsForDestinationInstance:entityMapping:manager:error:](&v7, sel_createRelationshipsForDestinationInstance_entityMapping_manager_error_, a3, a4, a5, a6);
}

- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

@end
