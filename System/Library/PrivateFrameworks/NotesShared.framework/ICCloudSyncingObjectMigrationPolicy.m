@implementation ICCloudSyncingObjectMigrationPolicy

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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)ICCloudSyncingObjectMigrationPolicy;
  v13 = -[NSEntityMigrationPolicy createDestinationInstancesForSourceInstance:entityMapping:manager:error:](&v33, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_, v10, v11, v12, a6);
  if (v13)
  {
    objc_msgSend(v11, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destinationInstancesForEntityMappingNamed:sourceInstances:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "valueForKey:", CFSTR("serverRecord"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "propertiesByName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("serverShare"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v10, "valueForKey:", CFSTR("serverShare"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v10, "entity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "propertiesByName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("userSpecificServerRecord"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v10, "valueForKey:", CFSTR("userSpecificServerRecord"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C95048], "ic_systemFieldsValueTransformer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v18)
    {
      objc_msgSend(v27, "transformedValue:", v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forKey:", v29, CFSTR("serverRecordData"));

    }
    if (v22)
    {
      objc_msgSend(v28, "transformedValue:", v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forKey:", v30, CFSTR("serverShareData"));

    }
    if (v26)
    {
      objc_msgSend(v28, "transformedValue:", v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forKey:", v31, CFSTR("userSpecificServerRecordData"));

    }
  }

  return v13;
}

@end
