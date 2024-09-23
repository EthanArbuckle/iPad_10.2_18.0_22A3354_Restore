@implementation AMDCoreDataPersistentContainer

+ (id)sharedContainer
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedContainer_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_4);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedContainer_sharedContainer;
}

void __49__AMDCoreDataPersistentContainer_sharedContainer__block_invoke(void *a1)
{
  AMDCoreDataPersistentContainer *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *, void *, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14[3];

  v14[2] = a1;
  v14[1] = a1;
  v1 = objc_alloc_init(AMDCoreDataPersistentContainer);
  v2 = (void *)sharedContainer_sharedContainer;
  sharedContainer_sharedContainer = (uint64_t)v1;

  v14[0] = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaDiscovery"));
  v13 = (id)objc_msgSend(v14[0], "URLForResource:withExtension:", CFSTR("AppleMediaDiscovery"), CFSTR("momd"));
  v3 = objc_alloc(MEMORY[0x1E0C97B98]);
  v12 = (id)objc_msgSend(v3, "initWithContentsOfURL:", v13);
  v4 = (id)objc_msgSend(MEMORY[0x1E0C97BC8], "persistentContainerWithName:managedObjectModel:", CFSTR("recommendation_v9"), v12);
  objc_msgSend((id)sharedContainer_sharedContainer, "set_container:");

  +[AMDPerf startMonitoringEvent:](AMDPerf, "startMonitoringEvent:");
  v5 = (id)objc_msgSend((id)sharedContainer_sharedContainer, "_container");
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __49__AMDCoreDataPersistentContainer_sharedContainer__block_invoke_2;
  v10 = &unk_1EA4B5878;
  v11 = v12;
  objc_msgSend(v5, "loadPersistentStoresWithCompletionHandler:");

  +[AMDPerf endMonitoringEvent:](AMDPerf, "endMonitoringEvent:", CFSTR("LoadCoreData"));
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
}

void __49__AMDCoreDataPersistentContainer_sharedContainer__block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint8_t v21[15];
  os_log_type_t v22;
  id v23;
  os_log_type_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t v31[7];
  char v32;
  id v33;
  os_log_type_t v34;
  id v35;
  os_log_type_t v36;
  id v37[2];
  id v38;
  id location[2];
  uint8_t v40[16];
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t v43[16];
  uint8_t v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v38 = 0;
  objc_storeStrong(&v38, a3);
  v37[1] = a1;
  if (v38)
  {
    v35 = MEMORY[0x1E0C81028];
    v34 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
    {
      v13 = (id)objc_msgSend(v38, "localizedDescription");
      __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)v13);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)v35, v34, "Error loading CoreData: %@", v43, 0xCu);

    }
    objc_storeStrong(&v35, 0);
    v33 = MEMORY[0x1E0C81028];
    v32 = 1;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_INFO))
    {
      v11 = v33;
      v12 = v32;
      __os_log_helper_16_0_0(v31);
      _os_log_impl(&dword_1DC678000, v11, v12, "Attempting a lightweight coredata migration", v31, 2u);
    }
    objc_storeStrong(&v33, 0);
    v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", a1[4]);
    v41[0] = *MEMORY[0x1E0C978D0];
    v42[0] = MEMORY[0x1E0C9AAB0];
    v41[1] = *MEMORY[0x1E0C97868];
    v42[1] = MEMORY[0x1E0C9AAB0];
    v29 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v28 = 0;
    v8 = v30;
    v7 = *MEMORY[0x1E0C979E8];
    v10 = (id)objc_msgSend(location[0], "URL");
    v27 = v28;
    v9 = (id)objc_msgSend(v8, "addPersistentStoreWithType:configuration:URL:options:error:", v7, 0);
    objc_storeStrong(&v28, v27);

    if (v9)
    {
      v23 = MEMORY[0x1E0C81028];
      v22 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
      {
        v3 = v23;
        v4 = v22;
        __os_log_helper_16_0_0(v21);
        _os_log_impl(&dword_1DC678000, v3, v4, "Lightweight CoreData migration was successful", v21, 2u);
      }
      objc_storeStrong(&v23, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", CFSTR("Success"), CFSTR("CoreDataMigration"), 0);
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (id)objc_msgSend(v28, "localizedDescription");
      v26 = (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("Migration failed with error: %@"), v6);

      v25 = MEMORY[0x1E0C81028];
      v24 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v26);
        _os_log_error_impl(&dword_1DC678000, (os_log_t)v25, v24, "%@", v40, 0xCu);
      }
      objc_storeStrong(&v25, 0);
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v26, CFSTR("CoreDataMigrationError"), 0);
      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    v37[0] = MEMORY[0x1E0C81028];
    v36 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v37[0], OS_LOG_TYPE_DEBUG))
    {
      v18 = (id)objc_msgSend(location[0], "URL");
      __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v18);
      _os_log_debug_impl(&dword_1DC678000, (os_log_t)v37[0], v36, "Loaded CoreData from URL: %@", v44, 0xCu);

    }
    objc_storeStrong(v37, 0);
    v15 = (id)objc_msgSend((id)sharedContainer_sharedContainer, "_container");
    v14 = (id)objc_msgSend(v15, "newBackgroundContext");
    objc_msgSend((id)sharedContainer_sharedContainer, "set_moc:");

    v16 = *MEMORY[0x1E0C978C0];
    v17 = (id)objc_msgSend((id)sharedContainer_sharedContainer, "_moc");
    objc_msgSend(v17, "setMergePolicy:", v16);

  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (id)getManagedObjectContext
{
  return -[AMDCoreDataPersistentContainer _moc](self, "_moc", a2, self);
}

- (void)save:(id *)a3
{
  void *v3;
  id v4;
  NSManagedObjectContext *v5;
  id location;
  id v7;
  id *v8;
  SEL v9;
  AMDCoreDataPersistentContainer *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = self;
  v9 = a2;
  v8 = a3;
  v5 = -[AMDCoreDataPersistentContainer _moc](self, "_moc");
  -[NSManagedObjectContext save:](v5, "save:", v8);

  if (*v8)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (id)objc_msgSend(*v8, "localizedDescription");
    v7 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Error saving local MOC: %@"), v4);

    location = MEMORY[0x1E0C81028];
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v11, (uint64_t)v7);
      _os_log_error_impl(&dword_1DC678000, (os_log_t)location, OS_LOG_TYPE_ERROR, "%@", v11, 0xCu);
    }
    objc_storeStrong(&location, 0);
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v7, CFSTR("MOCError"), 0);
    objc_storeStrong(&v7, 0);
  }
}

- (NSPersistentContainer)_container
{
  return self->__container;
}

- (void)set_container:(id)a3
{
  objc_storeStrong((id *)&self->__container, a3);
}

- (NSManagedObjectContext)_moc
{
  return self->__moc;
}

- (void)set_moc:(id)a3
{
  objc_storeStrong((id *)&self->__moc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__moc, 0);
  objc_storeStrong((id *)&self->__container, 0);
}

@end
