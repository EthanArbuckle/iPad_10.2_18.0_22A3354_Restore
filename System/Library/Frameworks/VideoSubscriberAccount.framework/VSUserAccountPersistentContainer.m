@implementation VSUserAccountPersistentContainer

- (id)initInMemory:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VSUserAccountPersistentContainer *v9;
  VSUserAccountPersistentContainer *v10;
  objc_super v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B98];
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergedModelFromBundles:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The model parameter must not be nil."));
  v12.receiver = self;
  v12.super_class = (Class)VSUserAccountPersistentContainer;
  v9 = -[NSPersistentCloudKitContainer initWithName:managedObjectModel:](&v12, sel_initWithName_managedObjectModel_, CFSTR("VSPersistentUserAccount"), v8);
  v10 = v9;
  if (v9)
    -[VSUserAccountPersistentContainer configureDescriptonInMemory:](v9, "configureDescriptonInMemory:", v3);

  return v10;
}

- (void)configureDescriptonInMemory:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSPersistentContainer persistentStoreDescriptions](self, "persistentStoreDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [[self persistentStoreDescriptions] firstObject] parameter must not be nil."));
  -[NSPersistentContainer persistentStoreDescriptions](self, "persistentStoreDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v8, "setShouldAddStoreAsynchronously:", 0);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("/dev/null"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setURL:", v9);

    objc_msgSend(v8, "setType:", *MEMORY[0x1E0C97860]);
  }
  else
  {
    objc_msgSend(v8, "setShouldAddStoreAsynchronously:", 1);
    +[VSUserAccountPersistentContainer loadStoreURL](VSUserAccountPersistentContainer, "loadStoreURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setURL:", v10);

    objc_msgSend(v8, "setShouldMigrateStoreAutomatically:", 1);
    objc_msgSend(v8, "setShouldInferMappingModelAutomatically:", 1);
    objc_msgSend(v8, "setType:", *MEMORY[0x1E0C979E8]);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97BC0]), "initWithContainerIdentifier:", CFSTR("com.apple.tv.federated"));
    objc_msgSend(v11, "setApsConnectionMachServiceName:", CFSTR("com.apple.videosubscriptionsd"));
    objc_msgSend(v11, "setOperationMemoryThresholdBytes:", &unk_1E93CC570);
    objc_msgSend(v8, "setCloudKitContainerOptions:", v11);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97AD0]), "initWithContainerIdentifier:", CFSTR("com.apple.tv.federated"));
    objc_msgSend(v12, "setApsConnectionMachServiceName:", CFSTR("com.apple.videosubscriptionsd"));
    objc_msgSend(v8, "setOption:forMirroringKey:", v12, *MEMORY[0x1E0C97950]);

  }
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPersistentCloudKitContainer setPersistentStoreDescriptions:](self, "setPersistentStoreDescriptions:", v13);

}

+ (id)loadStoreURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("videosubscriptionsd"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("VSUserAccounts.sqlite"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [serviceSupportDirectory URLByAppendingPathComponent:@\"VSUserAccounts.sqlite\" isDirectory:__objc_no] parameter must not be nil."));
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("VSUserAccounts.sqlite"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
