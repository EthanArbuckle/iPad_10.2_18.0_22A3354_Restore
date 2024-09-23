@implementation NSMigrationManager

- (NSMigrationManager)initWithSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel
{
  NSMigrationManager *v6;
  NSMigrationManager *v7;
  NSManagedObjectModel *v8;
  NSManagedObjectModel *v9;
  const __CFString *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSMigrationManager;
  v6 = -[NSMigrationManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!sourceModel || !destinationModel)
    {

      if (sourceModel)
        v11 = CFSTR("Cannot create an NSMigrationManager with a nil destination model");
      else
        v11 = CFSTR("Cannot create an NSMigrationManager with a nil source model");
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0));
    }
    v8 = (NSManagedObjectModel *)-[NSManagedObjectModel copy](sourceModel, "copy");
    v7->_sourceModel = v8;
    if ((*(_BYTE *)&sourceModel->_managedObjectModelFlags & 0x10) != 0 && v8)
    {
      *(_DWORD *)&v8->_managedObjectModelFlags |= 0x10u;
      v8 = v7->_sourceModel;
    }
    v7->_sourceEntitiesByVersionHash = (NSDictionary *)-[NSManagedObjectModel _entitiesByVersionHash](v8);
    -[NSManagedObjectModel _stripForMigration](v7->_sourceModel, "_stripForMigration");
    v9 = (NSManagedObjectModel *)-[NSManagedObjectModel copy](destinationModel, "copy");
    v7->_destinationModel = v9;
    v7->_destinationEntitiesByVersionHash = (NSDictionary *)-[NSManagedObjectModel _entitiesByVersionHash](v9);
    -[NSManagedObjectModel _stripForMigration](v7->_destinationModel, "_stripForMigration");
    v7->_migrationManagerFlags = (_migrationManagerFlags)(*(_DWORD *)&v7->_migrationManagerFlags & 0xFFFFFFFC | (2 * BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88)));
    v7->_destinationConfigurationForCloudKitValidation = 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMigrationManager _doCleanupOnFailure:]((id *)&self->super.isa);

  self->_sourceModel = 0;
  self->_sourceEntitiesByVersionHash = 0;

  self->_destinationModel = 0;
  self->_destinationEntitiesByVersionHash = 0;

  self->_userInfo = 0;
  self->_destinationConfigurationForCloudKitValidation = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSMigrationManager;
  -[NSMigrationManager dealloc](&v3, sel_dealloc);
}

- (void)_doCleanupOnFailure:(id *)a1
{
  if (a1)
  {

    a1[6] = 0;
    a1[7] = 0;

    a1[8] = 0;
    a1[5] = 0;

    a1[13] = 0;
  }
}

+ (BOOL)_canMigrateWithMappingModel:(id)a3
{
  return 0;
}

- (BOOL)migrateStoreFromURL:(NSURL *)sourceURL type:(NSString *)sStoreType options:(NSDictionary *)sOptions withMappingModel:(NSMappingModel *)mappings toDestinationURL:(NSURL *)dURL destinationType:(NSString *)dStoreType destinationOptions:(NSDictionary *)dOptions error:(NSError *)error
{
  uint64_t v16;
  id v17;
  void *v18;
  char v19;
  char v20;
  void *v21;
  NSManagedObjectModel *v22;
  uint64_t v23;
  char v24;
  NSPersistentStoreCoordinator *v25;
  NSManagedObjectContext *v26;
  NSDictionary *v27;
  id v28;
  NSDictionary *v29;
  NSPersistentStoreCoordinator *v30;
  NSManagedObjectContext *v31;
  id v32;
  void *v33;
  NSDictionary *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t i;
  NSEntityMigrationPolicy *v47;
  NSEntityMigrationPolicy *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  NSEntityMigrationPolicy *v58;
  NSEntityMigrationPolicy *v59;
  id *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  id v65;
  int v66;
  int v67;
  int v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSEntityMigrationPolicy *v76;
  char v77;
  NSEntityMigrationPolicy *v78;
  char v79;
  int v80;
  NSEntityMigrationPolicy *v81;
  char v82;
  id v83;
  id v84;
  id v85;
  void *v87;
  uint64_t v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  NSArray *v100;
  id v102;
  NSMigrationManager *v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  _QWORD v114[8];
  uint64_t v115;
  char v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id v121;
  char v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v104 = 0;
  v97 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Schema migration (manager)"), &v104);
  v103 = self;
  v16 = objc_opt_class();
  if (v16 == objc_opt_class()
    && -[NSMigrationManager usesStoreSpecificMigrationManager](self, "usesStoreSpecificMigrationManager")
    && -[NSString isEqualToString:](sStoreType, "isEqualToString:", dStoreType))
  {
    v17 = -[NSDictionary objectForKey:](+[NSPersistentStoreCoordinator registeredStoreTypes](NSPersistentStoreCoordinator, "registeredStoreTypes"), "objectForKey:", sStoreType);
    if ((id)objc_opt_class() != v17)
    {
      if (!objc_msgSend(v17, "isNSValue"))
        goto LABEL_21;
      v17 = (id)objc_msgSend(v17, "pointerValue");
    }
    if (v17)
    {
      v18 = (void *)objc_msgSend(v17, "migrationManagerClass");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = objc_msgSend(v18, "_canMigrateWithMappingModel:", mappings);
        if (v18)
          v20 = v19;
        else
          v20 = 0;
        if ((v20 & 1) == 0)
          goto LABEL_21;
      }
      else if (!v18)
      {
        goto LABEL_21;
      }
      if (v18 != (void *)objc_opt_class())
      {
        v21 = (void *)objc_msgSend(objc_alloc((Class)v18), "initWithSourceModel:destinationModel:", -[NSMigrationManager sourceModel](self, "sourceModel"), -[NSMigrationManager destinationModel](self, "destinationModel"));
        objc_msgSend(v21, "setDestinationConfigurationForCloudKitValidation:", -[NSMigrationManager destinationConfigurationForCloudKitValidation](self, "destinationConfigurationForCloudKitValidation"));
        v22 = -[NSMigrationManager sourceModel](self, "sourceModel");
        if (v22)
        {
          if ((*(_BYTE *)&v22->_managedObjectModelFlags & 0x10) != 0)
          {
            v23 = objc_msgSend(v21, "sourceModel");
            if (v23)
              *(_DWORD *)(v23 + 64) |= 0x10u;
          }
        }
        v24 = objc_msgSend(v21, "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:", sourceURL, sStoreType, sOptions, mappings, dURL, dStoreType, dOptions, error);

        goto LABEL_146;
      }
    }
  }
LABEL_21:
  if (!self)
    goto LABEL_131;
  if ((+[NSMigrationManager _performSanityCheckForMapping:fromSourceModel:toDestinationModel:]((uint64_t)NSMigrationManager, mappings, -[NSMigrationManager sourceModel](self, "sourceModel"), -[NSMigrationManager destinationModel](self, "destinationModel")) & 1) == 0)
  {
    v90 = (void *)MEMORY[0x1E0C99DA0];
    v91 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", -[NSMigrationManager sourceModel](self, "sourceModel"), CFSTR("sourceModel"), -[NSMigrationManager destinationModel](self, "destinationModel"), CFSTR("destinationModel"), mappings, CFSTR("mappingModel"), 0);
    objc_exception_throw((id)objc_msgSend(v90, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Mismatch between mapping and source/destination models"), v91));
  }
  self->_mappingModel = mappings;
  self->_migrationContext = -[NSMigrationContext initWithMigrationManager:]([NSMigrationContext alloc], "initWithMigrationManager:", self);
  v115 = 0;
  v25 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", -[NSMigrationManager sourceModel](self, "sourceModel"));
  v26 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
  self->_sourceManagedObjectContext = v26;
  -[NSManagedObjectContext setPersistentStoreCoordinator:](v26, "setPersistentStoreCoordinator:", v25);
  -[NSManagedObjectContext setUndoManager:](self->_sourceManagedObjectContext, "setUndoManager:", 0);

  if (!sOptions)
  {
    v28 = objc_alloc(MEMORY[0x1E0C99D80]);
    v27 = (NSDictionary *)objc_msgSend(v28, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSReadOnlyPersistentStoreOption"), 0);
    goto LABEL_27;
  }
  if (-[NSDictionary objectForKey:](sOptions, "objectForKey:", CFSTR("NSReadOnlyPersistentStoreOption")))
  {
    v27 = sOptions;
LABEL_27:
    v29 = v27;
    goto LABEL_29;
  }
  v29 = (NSDictionary *)-[NSDictionary mutableCopy](sOptions, "mutableCopy");
  -[NSDictionary setObject:forKey:](v29, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSReadOnlyPersistentStoreOption"));
LABEL_29:
  v98 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v25, "addPersistentStoreWithType:configuration:URL:options:error:", sStoreType, 0, sourceURL, v29, &v115);

  if (!v98)
  {
    if (error)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Can't add source store"), CFSTR("reason"), v115, *MEMORY[0x1E0CB3388], 0);
LABEL_129:
      *error = (NSError *)objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134110, v36);
    }
LABEL_130:
    -[NSMigrationManager _doCleanupOnFailure:]((id *)&self->super.isa);
    goto LABEL_131;
  }
  v30 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", -[NSMigrationManager destinationModel](self, "destinationModel"));
  v31 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
  self->_destinationManagedObjectContext = v31;
  -[NSManagedObjectContext setPersistentStoreCoordinator:](v31, "setPersistentStoreCoordinator:", v30);
  -[NSManagedObjectContext setUndoManager:](self->_destinationManagedObjectContext, "setUndoManager:", 0);

  if (dOptions)
  {
    v32 = -[NSDictionary objectForKey:](dOptions, "objectForKey:", CFSTR("NSSQLitePragmasOption"));
    v33 = v32;
    if (v32)
    {
      if (objc_msgSend(v32, "objectForKey:", CFSTR("journal_mode]")))
      {
        v34 = dOptions;
      }
      else
      {
        v34 = (NSDictionary *)-[NSDictionary mutableCopy](dOptions, "mutableCopy");
        v41 = (void *)objc_msgSend(v33, "mutableCopy");
        objc_msgSend(v41, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("journal_mode"));
        -[NSDictionary setObject:forKey:](v34, "setObject:forKey:", v41, CFSTR("NSSQLitePragmasOption"));

      }
    }
    else
    {
      v34 = (NSDictionary *)-[NSDictionary mutableCopy](dOptions, "mutableCopy");
      v39 = objc_alloc(MEMORY[0x1E0C99D80]);
      v40 = (void *)objc_msgSend(v39, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("journal_mode"), 0);
      -[NSDictionary setObject:forKey:](v34, "setObject:forKey:", v40, CFSTR("NSSQLitePragmasOption"));

    }
  }
  else
  {
    v37 = objc_alloc(MEMORY[0x1E0C99D80]);
    v38 = (void *)objc_msgSend(v37, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("journal_mode"), 0);
    v34 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v38, CFSTR("NSSQLitePragmasOption"), 0);

  }
  v94 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v30, "addPersistentStoreWithType:configuration:URL:options:error:", dStoreType, 0, dURL, v34, &v115);

  if (!v94)
  {
    if (error)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Can't add destination store"), CFSTR("reason"), v115, *MEMORY[0x1E0CB3388], 0);
      goto LABEL_129;
    }
    goto LABEL_130;
  }
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __148__NSMigrationManager_InternalMethods___migrateStoreFromURL_type_options_withMappingModel_toDestinationURL_destinationType_destinationOptions_error___block_invoke;
  v114[3] = &unk_1E1EDE7A8;
  v114[4] = v30;
  v114[5] = v98;
  v114[6] = v94;
  v114[7] = self;
  -[NSPersistentStoreCoordinator performBlockAndWait:](v30, "performBlockAndWait:", v114);
  v42 = -[NSMappingModel entityMappings](mappings, "entityMappings");
  v113 = 0;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
  v100 = v42;
  if (!v43)
    goto LABEL_72;
  v44 = *(_QWORD *)v110;
  v92 = *MEMORY[0x1E0CB28A8];
  v45 = 0x1E0CB3000uLL;
  do
  {
    for (i = 0; i != v43; ++i)
    {
      if (*(_QWORD *)v110 != v44)
        objc_enumerationMutation(v42);
      v47 = *(NSEntityMigrationPolicy **)(*((_QWORD *)&v109 + 1) + 8 * i);
      v102 = objc_alloc_init(*(Class *)(v45 + 1192));
      v48 = -[NSEntityMapping _migrationPolicy](v47);
      if (!-[NSEntityMigrationPolicy beginEntityMapping:manager:error:](v48, "beginEntityMapping:manager:error:", v47, self, &v113))
      {
        v54 = 0;
LABEL_60:
        LOBYTE(v117) = 0;
        v55 = 1;
        goto LABEL_65;
      }
      if ((*(_BYTE *)&self->_migrationManagerFlags & 1) != 0)
      {
        v54 = 1;
        v113 = self->_migrationCancellationError;
        goto LABEL_60;
      }
      -[NSMigrationContext setCurrentEntityMapping:]((uint64_t)self->_migrationContext, v47);
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
      objc_msgSend(v49, "setValue:forKey:", self, CFSTR("manager"));
      objc_msgSend(v49, "setValue:forKey:", v47, CFSTR("entityMapping"));
      objc_msgSend(v49, "setValue:forKey:", v48, CFSTR("entityPolicy"));
      v50 = (void *)objc_msgSend((id)-[NSEntityMigrationPolicy sourceExpression](v47, "sourceExpression"), "expressionValueWithObject:context:", 0, v49);

      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
      if (v51)
      {
        v52 = *(_QWORD *)v124;
        while (2)
        {
          for (j = 0; j != v51; ++j)
          {
            if (*(_QWORD *)v124 != v52)
              objc_enumerationMutation(v50);
            if (!-[NSEntityMigrationPolicy createDestinationInstancesForSourceInstance:entityMapping:manager:error:](v48, "createDestinationInstancesForSourceInstance:entityMapping:manager:error:", *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * j), v47, self, &v113))
            {
              v54 = 0;
              LOBYTE(v117) = 0;
              v55 = 1;
              v42 = v100;
              goto LABEL_64;
            }
            if ((*(_BYTE *)&self->_migrationManagerFlags & 1) != 0)
            {
              v42 = v100;
              v113 = self->_migrationCancellationError;
              LOBYTE(v117) = 0;
              v55 = 1;
              v54 = 1;
              goto LABEL_64;
            }
          }
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
          v42 = v100;
          if (v51)
            continue;
          break;
        }
      }
      v54 = -[NSEntityMigrationPolicy endInstanceCreationForEntityMapping:manager:error:](v48, "endInstanceCreationForEntityMapping:manager:error:", v47, self, &v113);
      if ((*(_BYTE *)&self->_migrationManagerFlags & 1) != 0)
      {
        v113 = self->_migrationCancellationError;
        LOBYTE(v117) = 0;
        v55 = 1;
      }
      else
      {
        v55 = 0;
      }
LABEL_64:
      v45 = 0x1E0CB3000;
LABEL_65:

      if ((v55 | 2) == 2)
      {
        if (!v54)
          goto LABEL_134;
      }
      else if ((v117 & 1) == 0)
      {
LABEL_134:
        v83 = v113;
        goto LABEL_136;
      }
      v115 = 0;
      if (!-[NSManagedObjectContext save:](self->_destinationManagedObjectContext, "save:", &v115))
      {
        v113 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v92, 134110, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to save new store after first pass of migration."), CFSTR("reason"), v115, *MEMORY[0x1E0CB3388], 0));
        goto LABEL_136;
      }
      objc_msgSend(v102, "drain");
    }
    v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
  }
  while (v43);
LABEL_72:
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v56 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v105, &v123, 16);
  if (!v56)
    goto LABEL_105;
  v96 = *(_QWORD *)v106;
  v93 = *MEMORY[0x1E0CB28A8];
  while (2)
  {
    v57 = 0;
    v95 = v56;
    do
    {
      if (*(_QWORD *)v106 != v96)
        objc_enumerationMutation(v42);
      v58 = *(NSEntityMigrationPolicy **)(*((_QWORD *)&v105 + 1) + 8 * v57);
      v102 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v99 = v57;
      v121 = 0;
      v59 = -[NSEntityMapping _migrationPolicy](v58);
      -[NSMigrationContext setCurrentEntityMapping:]((uint64_t)v103->_migrationContext, v58);
      v60 = -[NSMigrationContext destinationInstancesForEntityMapping:sourceInstance:]((id *)&v103->_migrationContext->super.isa, v58, 0);
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
      if (v61)
      {
        v62 = *(_QWORD *)v118;
        while (2)
        {
          for (k = 0; k != v61; ++k)
          {
            if (*(_QWORD *)v118 != v62)
              objc_enumerationMutation(v60);
            v64 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * k);
            v65 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
            if (!-[NSEntityMigrationPolicy createRelationshipsForDestinationInstance:entityMapping:manager:error:](v59, "createRelationshipsForDestinationInstance:entityMapping:manager:error:", v64, v58, v103, &v121))
            {
              v42 = v100;
              v69 = v121;
              v67 = 0;
              goto LABEL_93;
            }
            if ((*(_BYTE *)&v103->_migrationManagerFlags & 1) != 0)
            {
              v42 = v100;
              v121 = v103->_migrationCancellationError;
              v122 = 0;
              v68 = 1;
              goto LABEL_91;
            }
            objc_msgSend(v65, "drain");
          }
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
          if (v61)
            continue;
          break;
        }
      }
      v42 = v100;
      v66 = -[NSEntityMigrationPolicy endRelationshipCreationForEntityMapping:manager:error:](v59, "endRelationshipCreationForEntityMapping:manager:error:", v58, v103, &v121);
      v67 = v66;
      if ((*(_BYTE *)&v103->_migrationManagerFlags & 1) != 0)
      {
        v65 = 0;
        v121 = v103->_migrationCancellationError;
LABEL_93:
        v122 = 0;
        v68 = 1;
      }
      else if ((v66 & 1) != 0)
      {
        v65 = 0;
        v68 = 0;
LABEL_91:
        v67 = 1;
      }
      else
      {
        v72 = v121;
        v65 = 0;
        v68 = 0;
        v67 = 0;
      }

      if (v65)
        objc_msgSend(v65, "drain");
      v113 = v121;
      v70 = v121;
      v71 = 0;
      if ((v68 | 2) == 2)
      {
        if (!v67)
          goto LABEL_134;
      }
      else if ((v122 & 1) == 0)
      {
        goto LABEL_134;
      }
      v115 = 0;
      if (!-[NSManagedObjectContext save:](v103->_destinationManagedObjectContext, "save:", &v115))
      {
        v113 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v93, 134110, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to save new store after second pass of migration."), CFSTR("reason"), v115, *MEMORY[0x1E0CB3388], 0));
LABEL_136:
        -[NSMigrationManager _doCleanupOnFailure:]((id *)&v103->super.isa);
        v116 = 0;
        if (v102)
          objc_msgSend(v102, "drain");
        v82 = 0;
        goto LABEL_139;
      }
      objc_msgSend(v102, "drain");
      ++v57;
    }
    while (v99 + 1 != v95);
    v56 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v105, &v123, 16);
    if (v56)
      continue;
    break;
  }
LABEL_105:
  -[NSManagedObjectModel _restoreValidation](-[NSMigrationManager sourceModel](v103, "sourceModel"), "_restoreValidation");
  -[NSManagedObjectModel _restoreValidation](-[NSMigrationManager destinationModel](v103, "destinationModel"), "_restoreValidation");
  if ((-[NSMigrationManager _validateAllObjectsAfterMigration:](v103, (uint64_t *)&v113) & 1) != 0)
  {
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v73 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
    if (!v73)
    {
      v82 = 1;
      goto LABEL_139;
    }
    v74 = *(_QWORD *)v118;
    while (2)
    {
      v75 = 0;
LABEL_109:
      if (*(_QWORD *)v118 != v74)
        objc_enumerationMutation(v42);
      v76 = *(NSEntityMigrationPolicy **)(*((_QWORD *)&v117 + 1) + 8 * v75);
      v77 = 1;
      v78 = -[NSEntityMapping _migrationPolicy](v76);
      -[NSMigrationContext setCurrentEntityMapping:]((uint64_t)v103->_migrationContext, v76);
      if (-[NSEntityMigrationPolicy performCustomValidationForEntityMapping:manager:error:](v78, "performCustomValidationForEntityMapping:manager:error:", v76, v103, &v113))
      {
        if ((*(_BYTE *)&v103->_migrationManagerFlags & 1) != 0)
        {
          v113 = v103->_migrationCancellationError;
          LOBYTE(v121) = 0;
          v81 = v78;
          v80 = 1;
        }
        else
        {
          v79 = -[NSEntityMigrationPolicy endEntityMapping:manager:error:](v78, "endEntityMapping:manager:error:", v76);
          if ((*(_BYTE *)&v103->_migrationManagerFlags & 1) != 0)
          {
            v113 = v103->_migrationCancellationError;
            LOBYTE(v121) = 0;
            v80 = 1;
          }
          else
          {
            v80 = 0;
          }
          v77 = v79;
LABEL_119:
          v81 = v78;
        }

        if ((v80 | 2) == 2)
        {
          v42 = v100;
          if ((v77 & 1) == 0)
            goto LABEL_148;
        }
        else
        {
          v42 = v100;
          if ((v121 & 1) == 0)
            goto LABEL_148;
        }
        if (v73 == ++v75)
        {
          v73 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
          v82 = 1;
          if (!v73)
            goto LABEL_139;
          continue;
        }
        goto LABEL_109;
      }
      break;
    }
    v77 = 0;
    LOBYTE(v121) = 0;
    v80 = 1;
    goto LABEL_119;
  }
LABEL_148:
  v89 = v113;
  -[NSMigrationManager _doCleanupOnFailure:]((id *)&v103->super.isa);
  v82 = 0;
  v116 = 0;
LABEL_139:
  v84 = v113;
  if (error && v113)
    *error = (NSError *)v113;
  v85 = v84;
  if ((v82 & 1) == 0)
  {
    v24 = v116;
    goto LABEL_146;
  }
  v115 = 0;
  if (-[NSManagedObjectContext save:](v103->_destinationManagedObjectContext, "save:", &v115))
  {

    v103->_mappingModel = 0;
    -[NSPersistentStoreCoordinator removePersistentStore:error:](-[NSManagedObjectContext persistentStoreCoordinator](v103->_destinationManagedObjectContext, "persistentStoreCoordinator"), "removePersistentStore:error:", v94, 0);
    -[NSPersistentStoreCoordinator removePersistentStore:error:](-[NSManagedObjectContext persistentStoreCoordinator](v103->_sourceManagedObjectContext, "persistentStoreCoordinator"), "removePersistentStore:error:", v98, 0);
    -[NSMigrationManager _doCleanupOnFailure:]((id *)&v103->super.isa);
    v24 = 1;
    goto LABEL_146;
  }
  v87 = (void *)MEMORY[0x1E0CB35C8];
  v88 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to save new store."), CFSTR("reason"), v115, *MEMORY[0x1E0CB3388], 0);
  *error = (NSError *)objc_msgSend(v87, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134110, v88);
  -[NSMigrationManager _doCleanupOnFailure:]((id *)&v103->super.isa);
LABEL_131:
  v24 = 0;
LABEL_146:
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v104, v97);
  return v24 & 1;
}

- (void)reset
{
  -[NSMigrationContext clearAssociationTables]((uint64_t)self->_migrationContext);
}

- (NSMappingModel)mappingModel
{
  return self->_mappingModel;
}

- (NSManagedObjectModel)sourceModel
{
  return self->_sourceModel;
}

- (NSManagedObjectModel)destinationModel
{
  return self->_destinationModel;
}

- (NSManagedObjectContext)sourceContext
{
  return self->_sourceManagedObjectContext;
}

- (NSManagedObjectContext)destinationContext
{
  return self->_destinationManagedObjectContext;
}

- (NSEntityDescription)sourceEntityForEntityMapping:(NSEntityMapping *)mEntity
{
  return (NSEntityDescription *)-[NSDictionary objectForKey:](self->_sourceEntitiesByVersionHash, "objectForKey:", -[NSEntityMapping sourceEntityVersionHash](mEntity, "sourceEntityVersionHash"));
}

- (NSEntityDescription)destinationEntityForEntityMapping:(NSEntityMapping *)mEntity
{
  return (NSEntityDescription *)-[NSDictionary objectForKey:](self->_destinationEntitiesByVersionHash, "objectForKey:", -[NSEntityMapping destinationEntityVersionHash](mEntity, "destinationEntityVersionHash"));
}

- (void)associateSourceInstance:(NSManagedObject *)sourceInstance withDestinationInstance:(NSManagedObject *)destinationInstance forEntityMapping:(NSEntityMapping *)entityMapping
{
  if (!entityMapping)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Manager requires an entity mapping for associations")));
  if (self)
    self = (NSMigrationManager *)self->_migrationContext;
  -[NSMigrationContext associateSourceInstance:withDestinationInstance:forEntityMapping:]((uint64_t)self, sourceInstance, destinationInstance, entityMapping);
}

- (NSArray)destinationInstancesForEntityMappingNamed:(NSString *)mappingName sourceInstances:(NSArray *)sourceInstances
{
  void *v7;
  CFMutableSetRef Mutable;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMigrationContext *migrationContext;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  const void *v25;
  uint64_t v26;
  NSArray *obj;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    sourceInstances = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", sourceInstances);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](sourceInstances, "count"));
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  if (mappingName)
  {
    if (!self
      || (v30 = -[NSDictionary valueForKey:](-[NSMappingModel entityMappingsByName](-[NSMigrationManager mappingModel](self, "mappingModel"), "entityMappingsByName"), "valueForKey:", mappingName)) == 0)
    {

      CFRelease(Mutable);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find mapping for name (%@)."), mappingName), 0));
    }
  }
  else
  {
    v30 = 0;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](sourceInstances, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    obj = sourceInstances;
    v29 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v11);
        if (self)
          migrationContext = self->_migrationContext;
        else
          migrationContext = 0;
        v14 = -[NSMigrationContext destinationInstancesForEntityMapping:sourceInstance:]((id *)&migrationContext->super.isa, v30, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v11));
        if ((unint64_t)objc_msgSend(v14, "count") >= 2
          && +[NSMigrationManager migrationDebugLevel](NSMigrationManager, "migrationDebugLevel") >= 2)
        {
          _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) got more destinations for source than we expected. (%@, %@, %@)"), v15, v16, v17, v18, v19, v20, v12);
        }
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v14);
              v25 = *(const void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              if (!CFSetContainsValue(Mutable, v25))
              {
                objc_msgSend(v7, "addObject:", v25);
                CFSetAddValue(Mutable, v25);
              }
            }
            v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v22);
        }
        ++v11;
      }
      while (v11 != v10);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      v10 = v26;
    }
    while (v26);
  }
  CFRelease(Mutable);
  return (NSArray *)v7;
}

- (id)destinationInstancesForSourceRelationshipNamed:(id)a3 sourceInstances:(id)a4
{
  id v7;
  NSEntityMapping *v8;
  id v9;
  NSEntityDescription *v10;
  NSEntityDescription *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  __CFSet *Mutable;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMigrationContext *migrationContext;
  NSMigrationManager *v29;
  id *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v8 = -[NSMigrationManager currentEntityMapping](self, "currentEntityMapping");
  v9 = -[NSMigrationManager currentPropertyMapping](self, "currentPropertyMapping");
  v10 = -[NSMigrationManager sourceEntityForEntityMapping:](self, "sourceEntityForEntityMapping:", v8);
  v11 = -[NSMigrationManager destinationEntityForEntityMapping:](self, "destinationEntityForEntityMapping:", v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a4);
  if (!a3)
  {
    v53 = (void *)MEMORY[0x1E0C99DA0];
    v54 = *MEMORY[0x1E0C99778];
    v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Property mapping %@.%@ missing required relationship name argument to destinationInstancesForSourceRelationshipNamed:sourceInstances:"), -[NSEntityMapping name](v8, "name"), objc_msgSend(v9, "name"));
    v56 = v53;
    v57 = v54;
    goto LABEL_54;
  }
  v60 = v7;
  obj = a4;
  v12 = -[NSEntityDescription _relationshipNamed:](v10, (uint64_t)a3);
  if (!v12)
  {
    v58 = (void *)MEMORY[0x1E0C99DA0];
    v59 = *MEMORY[0x1E0C99778];
    v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find relationship for name (%@) for entity (%@) in source model."), a3, -[NSEntityDescription name](v10, "name"));
    v56 = v58;
    v57 = v59;
LABEL_54:
    objc_exception_throw((id)objc_msgSend(v56, "exceptionWithName:reason:userInfo:", v57, v55, 0));
  }
  v13 = v12;
  v14 = -[NSEntityDescription _relationshipNamed:](v11, objc_msgSend(v9, "name"));
  v15 = objc_msgSend(v13, "destinationEntity");
  v16 = objc_msgSend(v14, "destinationEntity");
  v65 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v17 = -[NSMappingModel entityMappings](-[NSMigrationManager mappingModel](self, "mappingModel"), "entityMappings");
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v81 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
        if (-[NSEntityDescription isKindOfEntity:](-[NSMigrationManager sourceEntityForEntityMapping:](self, "sourceEntityForEntityMapping:", v22), "isKindOfEntity:", v15)&& -[NSEntityDescription isKindOfEntity:](-[NSMigrationManager destinationEntityForEntityMapping:](self, "destinationEntityForEntityMapping:", v22), "isKindOfEntity:", v16))
        {
          objc_msgSend(v65, "addObject:", v22);
        }
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v19);
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  if (v63)
  {
    v62 = *(_QWORD *)v77;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v77 != v62)
          objc_enumerationMutation(obj);
        v64 = v25;
        v26 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v25);
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
        if (v67)
        {
          v66 = *(_QWORD *)v73;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v73 != v66)
                objc_enumerationMutation(v65);
              if (self)
                migrationContext = self->_migrationContext;
              else
                migrationContext = 0;
              v29 = self;
              v30 = -[NSMigrationContext destinationInstancesForEntityMapping:sourceInstance:]((id *)&migrationContext->super.isa, *(void **)(*((_QWORD *)&v72 + 1) + 8 * v27), v26);
              if ((unint64_t)objc_msgSend(v30, "count") >= 2
                && +[NSMigrationManager migrationDebugLevel](NSMigrationManager, "migrationDebugLevel") >= 2)
              {
                _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) got more destinations for source than we expected. (%@, %@, %@)"), v31, v32, v33, v34, v35, v36, v26);
              }
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v37 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
              if (v37)
              {
                v38 = v37;
                v39 = *(_QWORD *)v69;
                do
                {
                  for (j = 0; j != v38; ++j)
                  {
                    if (*(_QWORD *)v69 != v39)
                      objc_enumerationMutation(v30);
                    v41 = *(const void **)(*((_QWORD *)&v68 + 1) + 8 * j);
                    if (!CFSetContainsValue(Mutable, v41))
                    {
                      objc_msgSend(v23, "addObject:", v41);
                      CFSetAddValue(Mutable, v41);
                    }
                  }
                  v38 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                }
                while (v38);
              }
              ++v27;
              self = v29;
            }
            while (v27 != v67);
            v42 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
            v67 = v42;
          }
          while (v42);
        }
        v25 = v64 + 1;
      }
      while (v64 + 1 != v63);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v63);
  }
  if (+[NSMigrationManager migrationDebugLevel](NSMigrationManager, "migrationDebugLevel") >= 2)
  {
    v43 = objc_msgSend(v23, "count");
    if (v43 != objc_msgSend(obj, "count"))
    {
      v44 = objc_msgSend(v23, "count");
      if (v44 <= objc_msgSend(obj, "count"))
        v45 = CFSTR("fewer");
      else
        v45 = CFSTR("more");
      objc_msgSend(v23, "count");
      objc_msgSend(obj, "count");
      _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) got %@ destinations[%lu] for sources[%lu] than we expected. (%@, %@)"), v46, v47, v48, v49, v50, v51, (uint64_t)v45);
    }
  }

  CFRelease(Mutable);
  return v23;
}

- (NSArray)sourceInstancesForEntityMappingNamed:(NSString *)mappingName destinationInstances:(NSArray *)destinationInstances
{
  void *v7;
  CFMutableSetRef Mutable;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSMigrationContext *migrationContext;
  id *v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  const void *v25;
  uint64_t v26;
  NSArray *obj;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    destinationInstances = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", destinationInstances);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](destinationInstances, "count"));
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  if (mappingName)
  {
    if (!self
      || (v9 = -[NSDictionary valueForKey:](-[NSMappingModel entityMappingsByName](-[NSMigrationManager mappingModel](self, "mappingModel"), "entityMappingsByName"), "valueForKey:", mappingName)) == 0)
    {
      CFRelease(Mutable);

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find mapping for name (%@)."), mappingName), 0));
    }
  }
  else
  {
    v9 = 0;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = -[NSArray countByEnumeratingWithState:objects:count:](destinationInstances, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v30)
  {
    obj = destinationInstances;
    v29 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v10);
        if (self)
          migrationContext = self->_migrationContext;
        else
          migrationContext = 0;
        v13 = -[NSMigrationContext sourceInstancesForEntityMapping:destinationInstance:]((id *)&migrationContext->super.isa, v9, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v10));
        v14 = v13;
        if (v9
          && (unint64_t)objc_msgSend(v13, "count") >= 2
          && +[NSMigrationManager migrationDebugLevel](NSMigrationManager, "migrationDebugLevel") >= 2)
        {
          _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) got more sources for destination than we expected. (%@, %@, %@)"), v15, v16, v17, v18, v19, v20, v11);
        }
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v14);
              v25 = *(const void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              if (!CFSetContainsValue(Mutable, v25))
              {
                objc_msgSend(v7, "addObject:", v25);
                CFSetAddValue(Mutable, v25);
              }
            }
            v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v22);
        }
        ++v10;
      }
      while (v10 != v30);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      v30 = v26;
    }
    while (v26);
  }
  CFRelease(Mutable);
  return (NSArray *)v7;
}

- (NSEntityMapping)currentEntityMapping
{
  NSString *destinationEntityName;

  if (self)
  {
    destinationEntityName = self->_destinationEntityName;
    if (destinationEntityName)
      return (NSEntityMapping *)destinationEntityName[6].super.isa;
    else
      return 0;
  }
  return self;
}

- (id)currentPropertyMapping
{
  uint64_t v2;

  if (self)
  {
    v2 = *((_QWORD *)self + 8);
    if (v2)
      return *(id *)(v2 + 64);
    else
      return 0;
  }
  return self;
}

- (float)migrationProgress
{
  unint64_t v3;
  double currentStep;
  NSMigrationContext *migrationContext;

  v3 = -[NSArray count](-[NSMappingModel entityMappings](-[NSMigrationManager mappingModel](self, "mappingModel"), "entityMappings"), "count");
  if (!v3)
    return 0.0;
  currentStep = 0.0;
  if (self)
  {
    migrationContext = self->_migrationContext;
    if (migrationContext)
      currentStep = (double)migrationContext->_currentStep;
  }
  return currentStep / ((double)v3 * 3.0);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v3;

  v3 = self->_userInfo;
  if (v3 != userInfo)
  {

    self->_userInfo = userInfo;
  }
}

- (void)cancelMigrationWithError:(NSError *)error
{
  NSError *migrationCancellationError;

  *(_DWORD *)&self->_migrationManagerFlags |= 1u;
  migrationCancellationError = self->_migrationCancellationError;
  if (migrationCancellationError != error)
  {

    self->_migrationCancellationError = error;
  }
}

- (void)setUsesStoreSpecificMigrationManager:(BOOL)usesStoreSpecificMigrationManager
{
  int v3;

  if (usesStoreSpecificMigrationManager)
    v3 = 2;
  else
    v3 = 0;
  self->_migrationManagerFlags = (_migrationManagerFlags)(*(_DWORD *)&self->_migrationManagerFlags & 0xFFFFFFFD | v3);
}

- (BOOL)usesStoreSpecificMigrationManager
{
  return (*(_BYTE *)&self->_migrationManagerFlags >> 1) & 1;
}

- (NSString)destinationConfigurationForCloudKitValidation
{
  return self->_destinationConfigurationForCloudKitValidation;
}

- (void)setDestinationConfigurationForCloudKitValidation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

+ (int)migrationDebugLevel
{
  return +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel");
}

+ (void)setMigrationDebugLevel:(int)a3
{
  +[NSMappingModel setMigrationDebugLevel:](NSMappingModel, "setMigrationDebugLevel:", *(_QWORD *)&a3);
}

- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4 includesSubentities:(BOOL)a5
{
  _BOOL8 v5;
  NSManagedObjectModel *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSFetchRequest *v12;

  v5 = a5;
  v8 = -[NSMigrationManager sourceModel](self, "sourceModel");
  if (!v8 || (v9 = -[NSMutableDictionary objectForKey:](v8->_entities, "objectForKey:", a3)) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find entity named %@ in source model"), a3), 0));
  v10 = v9;
  v11 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", a4);
  v12 = objc_alloc_init(NSFetchRequest);
  -[NSFetchRequest setEntity:](v12, "setEntity:", v10);
  -[NSFetchRequest setPredicate:](v12, "setPredicate:", v11);
  -[NSFetchRequest setIncludesSubentities:](v12, "setIncludesSubentities:", v5);
  return v12;
}

- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4
{
  return -[NSMigrationManager fetchRequestForSourceEntityNamed:predicateString:includesSubentities:](self, "fetchRequestForSourceEntityNamed:predicateString:includesSubentities:", a3, a4, 0);
}

+ (uint64_t)_performSanityCheckForMapping:(void *)a3 fromSourceModel:(void *)a4 toDestinationModel:
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t result;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "entities"), "valueForKey:", CFSTR("versionHash"));
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "entities"), "valueForKey:", CFSTR("versionHash"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (void *)objc_msgSend(a2, "entityMappings", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v10)
    return 1;
  v11 = v10;
  v12 = *(_QWORD *)v19;
LABEL_3:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v19 != v12)
      objc_enumerationMutation(v9);
    v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
    v15 = objc_msgSend(v14, "sourceEntityVersionHash")
        ? objc_msgSend(v7, "containsObject:", objc_msgSend(v14, "sourceEntityVersionHash"))
        : 1;
    v16 = objc_msgSend(v14, "destinationEntityVersionHash")
        ? objc_msgSend(v8, "containsObject:", objc_msgSend(v14, "destinationEntityVersionHash"))
        : 1;
    result = 0;
    if (!v15 || !v16)
      return result;
    if (v11 == ++v13)
    {
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        goto LABEL_3;
      return 1;
    }
  }
}

- (uint64_t)_validateAllObjectsAfterMigration:(void *)a1
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t *v25;
  const __CFString *v26;
  id v27[2];

  v25 = a2;
  v27[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "destinationContext"), "registeredObjects");
  v3 = objc_msgSend(v2, "count");
  v4 = v3;
  if (v3 <= 1)
    v5 = 1;
  else
    v5 = v3;
  if (v3 >= 0x201)
    v6 = 1;
  else
    v6 = v5;
  v7 = (char *)&v25 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x201)
  {
    v7 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(v2, "getObjects:", v7);
  }
  else
  {
    bzero((char *)&v25 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    objc_msgSend(v2, "getObjects:", v7);
    if (!v4)
    {
      v8 = 1;
      return v8 & 1;
    }
  }
  v9 = 0;
  v10 = 0;
  v11 = *MEMORY[0x1E0CB28A8];
  v26 = CFSTR("NSDetailedErrors");
  v8 = 1;
  do
  {
    v12 = *(void **)&v7[8 * v10];
    v27[0] = 0;
    if ((objc_msgSend(v12, "validateForUpdate:", v27) & 1) == 0)
    {
      if (!v9)
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
      if (v27[0])
      {
        if (objc_msgSend((id)objc_msgSend(v27[0], "domain"), "isEqual:", v11)
          && objc_msgSend(v27[0], "code") == 1560)
        {
          v13 = (void *)objc_msgSend(v27[0], "userInfo");
          objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(v13, "objectForKey:", v26));
        }
        else
        {
          v14 = objc_msgSend((id)objc_msgSend(v27[0], "userInfo"), "objectForKey:", CFSTR("NSValidationErrorObject"));
          v15 = v27[0];
          if (v14)
          {
            v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v27[0], "userInfo"));
            objc_msgSend(v16, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("NSValidationErrorObject")), "description"), CFSTR("NSValidationErrorObject"));
            v17 = (void *)MEMORY[0x1E0CB35C8];
            v18 = objc_msgSend(v27[0], "domain");
            v15 = (id)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, objc_msgSend(v27[0], "code"), v16);
            v27[0] = v15;
          }
          objc_msgSend(v9, "addObject:", v15);
        }
      }
      v8 = 0;
    }
    ++v10;
  }
  while (v4 != v10);
  if ((v8 & 1) == 0)
  {
    if (objc_msgSend(v9, "count") == 1)
    {
      if (v25)
      {
        v19 = objc_msgSend(v9, "objectAtIndex:", 0);
        *v25 = v19;
      }
    }
    else
    {
      v20 = objc_msgSend(v9, "count");
      if (v25 && v20 >= 2)
      {
        v21 = objc_alloc(MEMORY[0x1E0C99D80]);
        v22 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v9, v26, 0);
        v23 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, 1560, v22);
        *v25 = v23;

      }
    }
  }

  if (v4 >= 0x201)
    NSZoneFree(0, v7);
  return v8 & 1;
}

void __148__NSMigrationManager_InternalMethods___migrateStoreFromURL_type_options_withMappingModel_toDestinationURL_destinationType_destinationOptions_error___block_invoke(uint64_t a1)
{
  -[NSPersistentStoreCoordinator _copyMetadataFromStore:toStore:migrationManager:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
