@implementation CoreThemeAlignmentMigrationPolicy

- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  objc_super v22;
  _QWORD v23[2];
  NSRect v24;
  NSRect v25;

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)CoreThemeAlignmentMigrationPolicy;
  v9 = -[NSEntityMigrationPolicy createDestinationInstancesForSourceInstance:entityMapping:manager:error:](&v22, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_, a3, a4, a5, a6);
  v10 = objc_msgSend(a4, "name");
  v23[0] = a3;
  v11 = (void *)objc_msgSend((id)objc_msgSend(a5, "destinationInstancesForEntityMappingNamed:sourceInstances:", v10, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1)), "firstObject");
  v12 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("production"));
  if (objc_msgSend((id)objc_msgSend(v12, "entity"), "isKindOfEntity:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sourceModel"), "entitiesByName"), "objectForKey:", CFSTR("SimpleArtworkElementProduction"))))
  {
    v13 = (NSString *)objc_msgSend(v12, "valueForKey:", CFSTR("alignmentRectString"));
    v14 = (void *)MEMORY[0x24BDD1968];
    v24 = NSRectFromString(v13);
    v15 = v14;
  }
  else
  {
    v16 = *MEMORY[0x24BDD1408];
    v17 = *(double *)(MEMORY[0x24BDD1408] + 8);
    v18 = *(double *)(MEMORY[0x24BDD1408] + 16);
    v19 = *(double *)(MEMORY[0x24BDD1408] + 24);
    v25.origin.x = *(CGFloat *)MEMORY[0x24BDD1408];
    v25.origin.y = v17;
    v25.size.width = v18;
    v25.size.height = v19;
    v13 = NSStringFromRect(v25);
    v15 = (void *)MEMORY[0x24BDD1968];
    v24.origin.x = v16;
    v24.origin.y = v17;
    v24.size.width = v18;
    v24.size.height = v19;
  }
  v20 = objc_msgSend(v15, "valueWithRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
  objc_msgSend(v11, "setValue:forKey:", v13, CFSTR("alignmentRectString"));
  objc_msgSend(v11, "setValue:forKey:", v20, CFSTR("alignmentRect"));
  return v9;
}

- (BOOL)createRelationshipsForDestinationInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreThemeAlignmentMigrationPolicy;
  return -[NSEntityMigrationPolicy createRelationshipsForDestinationInstance:entityMapping:manager:error:](&v7, sel_createRelationshipsForDestinationInstance_entityMapping_manager_error_, a3, a4, a5, a6);
}

- (BOOL)performCustomValidationForEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return 1;
}

@end
