@implementation ICServerChangeTokenMigrationPolicy

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ICServerChangeTokenMigrationPolicy;
  v13 = -[NSEntityMigrationPolicy createDestinationInstancesForSourceInstance:entityMapping:manager:error:](&v22, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_, v10, v11, v12, a6);
  if (v13)
  {
    objc_msgSend(v11, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destinationInstancesForEntityMappingNamed:sourceInstances:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "valueForKey:", CFSTR("ckServerChangeToken"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "data");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forKey:", v20, CFSTR("ckServerChangeTokenData"));

    }
  }

  return v13;
}

@end
