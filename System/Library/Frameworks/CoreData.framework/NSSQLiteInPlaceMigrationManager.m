@implementation NSSQLiteInPlaceMigrationManager

+ (BOOL)_canMigrateWithMappingModel:(id)a3
{
  return -[NSMappingModel _isInferredMappingModel]((uint64_t)a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NSSQLiteInPlaceMigrationManager;
  -[NSMigrationManager dealloc](&v2, sel_dealloc);
}

- (BOOL)migrateStoreFromURL:(id)a3 type:(id)a4 options:(id)a5 withMappingModel:(id)a6 toDestinationURL:(id)a7 destinationType:(id)a8 destinationOptions:(id)a9 error:(id *)a10
{
  void *v15;
  uint64_t v16;
  unsigned __int8 v17;
  int v18;
  id v19;
  uint64_t v20;
  id v21;
  char v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  _BYTE *v27;
  NSSQLModel *v28;
  int v29;
  id v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  NSPersistentStore *v51;
  NSManagedObjectModel *v52;
  NSSQLModel *v53;
  const char *v54;
  int v55;
  NSString *stageLabel;
  BOOL v57;
  char v58;
  char v59;
  uint64_t v60;
  const __CFString *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  NSPersistentStoreCoordinator *v76;
  objc_super v78;
  id v79;
  stat v80;
  const __CFString *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  const __CFString *v85;
  uint64_t v86;
  const __CFString *v87;
  id v88;
  uint64_t v89;
  _QWORD v90[4];

  v90[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqual:", a7) & 1) == 0)
  {
    if (objc_msgSend(a7, "isFileURL"))
    {
      memset(&v80, 0, sizeof(v80));
      if (!stat((const char *)objc_msgSend((id)objc_msgSend(a7, "path"), "fileSystemRepresentation"), &v80)
        && v80.st_size >= 1)
      {
        if (a10)
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v89 = *MEMORY[0x1E0CB2AA0];
          v90[0] = objc_msgSend(a7, "path");
          v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
          v17 = 0;
          *a10 = (id)objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 516, v16);
        }
        else
        {
          v17 = 0;
        }
        return v17 & 1;
      }
    }
  }
  v74 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v76 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", -[NSMigrationManager sourceModel](self, "sourceModel"));
  -[NSPersistentStoreCoordinator _setIsMigrating:]((uint64_t)v76, 1);
  v18 = objc_msgSend(a3, "isEqual:", a7);
  v79 = 0;
  *(_QWORD *)&v80.st_dev = 0;
  v19 = (id)objc_msgSend(a9, "mutableCopy");
  v20 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v19, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentStoreForceDestroyOption"));
  v73 = v19;
  objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("NSPersistentStoreUnlinkDestroyOption"));
  v21 = a3;
  if ((v18 & 1) != 0
    || (v21 = a7,
        -[NSPersistentStoreCoordinator replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:](v76, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", a7, a9, a3, a5, a4, &v80)))
  {
    v22 = v18 ^ 1;
    if (!objc_msgSend(CFSTR("SQLite"), "isEqualToString:", a4)
      || (objc_msgSend(CFSTR("SQLite"), "isEqualToString:", a8) & 1) == 0)
    {

      v69 = (void *)MEMORY[0x1E0C99DA0];
      v70 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", -[NSMigrationManager sourceModel](self, "sourceModel"), CFSTR("sourceModel"), -[NSMigrationManager destinationModel](self, "destinationModel"), CFSTR("destinationModel"), a6, CFSTR("mappingModel"), 0);
      objc_exception_throw((id)objc_msgSend(v69, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSSQLiteInPlaceMigrationManager requires that the source and destination stores to be NSSQLiteStoreType"), v70));
    }
    if ((-[NSMappingModel _isInferredMappingModel]((uint64_t)a6) & 1) != 0)
    {
      if ((+[NSMigrationManager _performSanityCheckForMapping:fromSourceModel:toDestinationModel:]((uint64_t)NSMigrationManager, a6, -[NSMigrationManager sourceModel](self, "sourceModel"), -[NSMigrationManager destinationModel](self, "destinationModel")) & 1) == 0)
      {
        v71 = (void *)MEMORY[0x1E0C99DA0];
        v72 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", -[NSMigrationManager sourceModel](self, "sourceModel"), CFSTR("sourceModel"), -[NSMigrationManager destinationModel](self, "destinationModel"), CFSTR("destinationModel"), a6, CFSTR("mappingModel"), 0);
        objc_exception_throw((id)objc_msgSend(v71, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Mismatch between mapping and source/destination models"), v72));
      }
      if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") < 1)
      {
        v24 = 0.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v24 = v23;
      }
      if (a9)
      {
        v45 = (void *)objc_msgSend(a9, "objectForKey:", CFSTR("NSSQLitePragmasOption"));
        v46 = (id)objc_msgSend(a9, "mutableCopy");
        if (v45)
        {
          v47 = (id)objc_msgSend(v45, "mutableCopy");
          objc_msgSend(v47, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("journal_mode"));
        }
        else
        {
          v85 = CFSTR("journal_mode");
          v86 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v47 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
        }
        objc_msgSend(v46, "setObject:forKey:", v47, CFSTR("NSSQLitePragmasOption"));

      }
      else
      {
        v83 = CFSTR("NSSQLitePragmasOption");
        v81 = CFSTR("journal_mode");
        v82 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v84 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v46 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      }
      v51 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v76, "addPersistentStoreWithType:configuration:URL:options:error:", CFSTR("SQLite"), 0, v21, v46, &v79);

      if (v51)
      {
        v52 = -[NSMigrationManager destinationModel](self, "destinationModel");
        -[NSManagedObjectModel _setIsEditable:](v52, "_setIsEditable:", 0);
        v53 = -[NSSQLModel initWithManagedObjectModel:configurationName:]([NSSQLModel alloc], "initWithManagedObjectModel:configurationName:", v52, 0);
        if (v53)
        {
          v28 = v53;
          v27 = -[_NSSQLiteStoreMigrator initWithStore:destinationModel:mappingModel:]([_NSSQLiteStoreMigrator alloc], v51, v53, a6);
          objc_msgSend(v27, "setDestinationConfigurationForCloudKitValidation:", -[NSMigrationManager destinationConfigurationForCloudKitValidation](self, "destinationConfigurationForCloudKitValidation"));
          if (self)
          {
            v55 = (*(_BYTE *)&self->super._migrationManagerFlags >> 3) & 1;
            if (!v27)
              goto LABEL_48;
          }
          else
          {
            LOBYTE(v55) = 0;
            if (!v27)
            {
LABEL_48:
              if (self)
              {
                stageLabel = self->super._stageLabel;
                if (!v27)
                {
LABEL_51:
                  v57 = -[_NSSQLiteStoreMigrator performMigration:]((uint64_t)v27, &v79);
                  v58 = v57;
                  if (a10)
                    v59 = v57;
                  else
                    v59 = 1;
                  if ((v59 & 1) == 0)
                  {
                    v60 = objc_msgSend((id)objc_msgSend(v79, "userInfo"), "objectForKey:", CFSTR("reason"));
                    if (v60)
                      v61 = (const __CFString *)objc_msgSend(CFSTR("Cannot migrate store in-place: "), "stringByAppendingString:", v60);
                    else
                      v61 = CFSTR("Cannot migrate store in-place");
                    v67 = (void *)MEMORY[0x1E0CB35C8];
                    v68 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v61, CFSTR("reason"), v79, *MEMORY[0x1E0CB3388], a3, CFSTR("sourceURL"), a3, CFSTR("destinationURL"), 0);
                    *(_QWORD *)&v80.st_dev = objc_msgSend(v67, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134110, v68);
                  }
                  if (self)
                    *(_DWORD *)&self->super._migrationManagerFlags |= 4u;
                  -[_NSSQLiteStoreMigrator _disconnect]((uint64_t)v27);
                  v29 = 0;
                  v17 = 0;
                  v22 = v58;
                  goto LABEL_21;
                }
              }
              else
              {
                stageLabel = 0;
                if (!v27)
                  goto LABEL_51;
              }
              objc_setProperty_nonatomic_copy(v27, v54, stageLabel, 232);
              goto LABEL_51;
            }
          }
          v27[218] = v55;
          goto LABEL_48;
        }
        if (a10)
        {
          v65 = (void *)MEMORY[0x1E0CB35C8];
          v66 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Invalid destination data model"), CFSTR("reason"), 0);
          v64 = objc_msgSend(v65, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134110, v66);
          goto LABEL_61;
        }
      }
      else if (a10)
      {
        v62 = (void *)MEMORY[0x1E0CB35C8];
        v63 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to open the store"), CFSTR("reason"), v79, *MEMORY[0x1E0CB3388], 0);
        v64 = objc_msgSend(v62, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134110, v63);
LABEL_61:
        v27 = 0;
        v28 = 0;
        v17 = 0;
        *(_QWORD *)&v80.st_dev = v64;
        goto LABEL_20;
      }
      v27 = 0;
      v28 = 0;
      v17 = 0;
      goto LABEL_20;
    }
    if (v18)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v87 = CFSTR("sourceStore");
      v88 = a3;
      v26 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
      v22 = 0;
      v27 = 0;
      v28 = 0;
      v17 = 0;
      *(_QWORD *)&v80.st_dev = objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134182, v26);
    }
    else
    {
      v78.receiver = self;
      v78.super_class = (Class)NSSQLiteInPlaceMigrationManager;
      v22 = 1;
      v17 = -[NSMigrationManager migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:](&v78, sel_migrateStoreFromURL_type_options_withMappingModel_toDestinationURL_destinationType_destinationOptions_error_, v21, a4, a5, a6, a7, a8, a9, &v80);
      v27 = 0;
      v28 = 0;
    }
  }
  else
  {
    v22 = 0;
    v27 = 0;
    v28 = 0;
    v17 = 0;
  }
  v24 = 0.0;
LABEL_20:
  v29 = 1;
LABEL_21:
  v30 = *(id *)&v80.st_dev;

  -[NSPersistentStoreCoordinator _removeAllPersistentStores:](v76, "_removeAllPersistentStores:", 0);
  if ((v22 & 1) != 0)
  {
    if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") >= 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) in-place migration completed successfully in %2.2f seconds"), v32, v33, v34, v35, v36, v37, COERCE__INT64(v31 - v24));
    }
  }
  else if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel") < 1)
  {
    if ((objc_msgSend(a3, "isEqual:", a7) & 1) == 0)
    {
      -[NSPersistentStoreCoordinator _destroyPersistentStoreAtURL:withType:options:error:](v76, "_destroyPersistentStoreAtURL:withType:options:error:", a7, CFSTR("SQLite"), v73, 0);
      v44 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      objc_msgSend(v44, "removeItemAtPath:error:", objc_msgSend(a7, "path"), 0);
      objc_msgSend(v44, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(a7, "path"), "stringByAppendingString:", CFSTR("-shm")), 0);
      objc_msgSend(v44, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(a7, "path"), "stringByAppendingString:", CFSTR("-journal")), 0);
      objc_msgSend(v44, "removeItemAtPath:error:", objc_msgSend((id)objc_msgSend(a7, "path"), "stringByAppendingString:", CFSTR("-wal")), 0);
    }
  }
  else
  {
    if (v79)
      objc_msgSend(v79, "description");
    _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) leaving incompletely migrated store on disk after in-place migration error. (%@, %@)"), v38, v39, v40, v41, v42, v43, (uint64_t)a7);
  }

  objc_msgSend(v74, "drain");
  v48 = 0;
  v49 = *(id *)&v80.st_dev;
  if (a10 && *(_QWORD *)&v80.st_dev)
    *a10 = *(id *)&v80.st_dev;
  if ((v29 | 2) == 2)
    v17 = v22;
  return v17 & 1;
}

@end
