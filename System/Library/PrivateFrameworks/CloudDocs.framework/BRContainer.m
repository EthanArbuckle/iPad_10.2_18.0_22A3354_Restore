@implementation BRContainer

+ (id)localizedNameForDefaultCloudDocsContainer
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat(CFSTR("iCloud Drive"), CFSTR("Localizable"), v2, v3, v4, v5, v6, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)classesForDecoding
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

+ (BOOL)versionOfBundle:(id)a3 changedFromVersion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  int v19;
  NSObject *v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:]", 1731);
    v8 = objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      +[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:].cold.1();
    goto LABEL_12;
  }
  objc_msgSend(v5, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bundleIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:]", 1739);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412802;
      v20 = v8;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_19CBF0000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid version '%@' or identifier '%@'%@", (uint8_t *)&v19, 0x20u);
    }

LABEL_12:
    v14 = 0;
    goto LABEL_18;
  }
  brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:]", 1744);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138413058;
    v20 = v10;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_19CBF0000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] bundle %@ has version %@, minimum version is %@%@", (uint8_t *)&v19, 0x2Au);
  }

  if (v6)
    v14 = objc_msgSend(v6, "compare:options:", v8, 64) == -1;
  else
    v14 = 1;
LABEL_18:

  return v14;
}

+ (void)initialize
{
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___BRContainer;
  objc_msgSendSuper2(&v4, sel_initialize);
  v2 = (void *)BRContainerFormatVersionNumberValue;
  BRContainerFormatVersionNumberValue = (uint64_t)&unk_1E3DC2AC8;

  v3 = (void *)BRContainerIconGeneratorVersionNumberValue;
  BRContainerIconGeneratorVersionNumberValue = (uint64_t)&unk_1E3DC2AE0;

}

void __39__BRContainer_accessPropertiesInBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;

  if (a2)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a2, 0, 0, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (!v3)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer accessPropertiesInBlock:]_block_invoke", 456);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
        __39__BRContainer_accessPropertiesInBlock___block_invoke_cold_1((uint64_t)v4);

    }
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __33__BRContainer_initWithMangledID___block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("cloudocs.container.workloop");
  v1 = (void *)containerWorkloop;
  containerWorkloop = (uint64_t)v0;

}

void __32__BRContainer_bundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_bundleIDsWithProperties:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

}

void __31__BRContainer_bundleIDVersions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_bundleIDVersionsWithProperties:mangledID:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v4;

}

void __28__BRContainer_localizedName__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_localizedNameWithProperties:mangledID:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __28__BRContainer__pathForPlist__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (!a2)
  {
    +[BRContainer _URLForPlistOfMangledID:](BRContainer, "_URLForPlistOfMangledID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *personaID;
  const char *v13;
  BRContainer *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("apps:{"));
  v15 = self;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[BRContainer bundleIDVersions](self, "bundleIDVersions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = "";
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BRContainerVersionNumber"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR("%s%@:%@"), v7, v9, v11);

        v7 = "; ";
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v7 = "; ";
    }
    while (v5);
  }
  objc_msgSend(v16, "appendString:", CFSTR("}"));
  personaID = self->_personaID;
  if (personaID && !-[NSString isEqualToString:](personaID, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    objc_msgSend(v16, "appendFormat:", CFSTR("%spersona:%@"), " ", self->_personaID);
  v13 = " ";
  if (-[BRContainer isDocumentScopePublic](v15, "isDocumentScopePublic"))
  {
    objc_msgSend(v16, "appendFormat:", CFSTR("%sDocumentScopePublic"), " ");
    v13 = "|";
    if (-[BRContainer isInInitialState](v15, "isInInitialState"))
      objc_msgSend(v16, "appendFormat:", CFSTR("%sInInitialState"), "|");
  }
  if (-[BRContainer isInCloudDocsZone](v15, "isInCloudDocsZone"))
  {
    objc_msgSend(v16, "appendFormat:", CFSTR("%sInCloudDocsZone"), v13);
    v13 = "|";
  }
  if (-[BRContainer isCloudSyncTCCDisabled](v15, "isCloudSyncTCCDisabled"))
    objc_msgSend(v16, "appendFormat:", CFSTR("%sTCCDisabled"), v13);

  return v16;
}

- (void)accessDataRepresentationInBlock:(id)a3
{
  void (**v4)(id, id);
  BRContainer *v5;
  NSPurgeableData *purgeableDataRepresentation;
  id v7;
  NSPurgeableData *v8;
  NSPurgeableData *v9;
  NSPurgeableData *v10;
  void *v11;
  uint64_t v12;
  NSPurgeableData *v13;
  void *v14;
  NSObject *v15;
  BRContainer *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_shouldUsePurgeableData)
  {
    purgeableDataRepresentation = v5->_purgeableDataRepresentation;
    if (purgeableDataRepresentation)
    {
      if ((-[NSPurgeableData beginContentAccess](purgeableDataRepresentation, "beginContentAccess") & 1) != 0)
      {
        v7 = 0;
LABEL_18:
        v8 = v5->_purgeableDataRepresentation;
        v9 = v5->_purgeableDataRepresentation;

        goto LABEL_19;
      }
      v10 = v5->_purgeableDataRepresentation;
    }
    else
    {
      v10 = 0;
    }
    v5->_purgeableDataRepresentation = 0;

    -[BRContainer _pathForPlist](v5, "_pathForPlist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x1E0CB38D0], "dataWithContentsOfFile:options:error:", v11, 8, &v17);
      v12 = objc_claimAutoreleasedReturnValue();
      v7 = v17;
      v13 = v5->_purgeableDataRepresentation;
      v5->_purgeableDataRepresentation = (NSPurgeableData *)v12;

    }
    else
    {
      v7 = 0;
    }
    if (!v5->_purgeableDataRepresentation
      && (objc_msgSend(v7, "br_isCocoaErrorCode:", 4) & 1) == 0
      && (objc_msgSend(v7, "br_isCocoaErrorCode:", 260) & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) accessDataRepresentationInBlock:]", 1647);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v7;
        v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] can't open plist path: %@%@", buf, 0x16u);
      }

    }
    goto LABEL_18;
  }
  v8 = v5->_dataRepresentation;
  v9 = 0;
LABEL_19:
  objc_sync_exit(v5);

  v4[2](v4, v8);
  v16 = v5;
  objc_sync_enter(v16);
  -[NSPurgeableData endContentAccess](v9, "endContentAccess");
  -[NSPurgeableData discardContentIfPossible](v9, "discardContentIfPossible");
  objc_sync_exit(v16);

}

- (void)setIsCloudSyncTCCDisabled:(BOOL)a3
{
  self->_isCloudSyncTCCDisabled = a3;
}

- (NSString)localizedName
{
  BRContainer *v2;
  NSString *localizedName;
  NSString *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  localizedName = v2->_localizedName;
  if (!localizedName)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __28__BRContainer_localizedName__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    localizedName = v2->_localizedName;
  }
  v4 = localizedName;
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)isInInitialState
{
  return self->_isInInitialState;
}

- (BOOL)isInCloudDocsZone
{
  return self->_isInCloudDocsZone;
}

- (BOOL)isDocumentScopePublic
{
  BRContainer *v2;
  NSNumber *isDocumentScopePublicAsNumber;
  BOOL v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  isDocumentScopePublicAsNumber = v2->_isDocumentScopePublicAsNumber;
  if (!isDocumentScopePublicAsNumber)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__BRContainer_isDocumentScopePublic__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    isDocumentScopePublicAsNumber = v2->_isDocumentScopePublicAsNumber;
  }
  v4 = -[NSNumber BOOLValue](isDocumentScopePublicAsNumber, "BOOLValue");
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)isCloudSyncTCCDisabled
{
  return self->_isCloudSyncTCCDisabled;
}

- (BRContainer)initWithMangledID:(id)a3
{
  id v5;
  BRContainer *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *observationSetupQueueForDefaultConnection;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *observationSetupQueueForSecondaryConnection;
  void *v17;
  uint64_t v18;
  NSString *personaID;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRContainer;
  v6 = -[BRContainer init](&v21, sel_init);
  if (v6)
  {
    if (initWithMangledID__onceToken != -1)
      dispatch_once(&initWithMangledID__onceToken, &__block_literal_global_27);
    objc_storeStrong((id *)&v6->_mangledID, a3);
    v6->_shouldUsePurgeableData = 1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = containerWorkloop;
    dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2("clouddocs.container.default", v9, v8);

    observationSetupQueueForDefaultConnection = v6->_observationSetupQueueForDefaultConnection;
    v6->_observationSetupQueueForDefaultConnection = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = containerWorkloop;
    dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create_with_target_V2("clouddocs.container.secondary", v14, v13);

    observationSetupQueueForSecondaryConnection = v6->_observationSetupQueueForSecondaryConnection;
    v6->_observationSetupQueueForSecondaryConnection = (OS_dispatch_queue *)v15;

    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "br_currentPersonaID");
    v18 = objc_claimAutoreleasedReturnValue();
    personaID = v6->_personaID;
    v6->_personaID = (NSString *)v18;

  }
  return v6;
}

- (BRContainer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BRMangledID *v6;
  BRContainer *v7;
  uint64_t v8;
  NSNumber *isDocumentScopePublicAsNumber;
  uint64_t v10;
  NSData *dataRepresentation;
  uint64_t v12;
  NSString *personaID;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", v5);
  v7 = -[BRContainer initWithMangledID:](self, "initWithMangledID:", v6);
  if (v7)
  {
    v7->_isCloudSyncTCCDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BRContainerIsCloudSyncTCCDisabledKey"));
    v7->_isInInitialState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BRContainerIsInInitialState"));
    v7->_isInCloudDocsZone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BRContainerIsInCloudDocsZone"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BRContainerIsDocumentScopePublic")));
    v8 = objc_claimAutoreleasedReturnValue();
    isDocumentScopePublicAsNumber = v7->_isDocumentScopePublicAsNumber;
    v7->_isDocumentScopePublicAsNumber = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BRContainerDataKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    dataRepresentation = v7->_dataRepresentation;
    v7->_dataRepresentation = (NSData *)v10;

    v7->_shouldUsePurgeableData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BRContainerShouldUsePurgeableDataKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BRContainerPersonaID"));
    v12 = objc_claimAutoreleasedReturnValue();
    personaID = v7->_personaID;
    v7->_personaID = (NSString *)v12;

  }
  return v7;
}

- (NSString)identifier
{
  return -[BRMangledID appLibraryOrZoneName](self->_mangledID, "appLibraryOrZoneName");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;

  v4 = a3;
  -[BRMangledID appLibraryOrZoneName](self->_mangledID, "appLibraryOrZoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_isCloudSyncTCCDisabled, CFSTR("BRContainerIsCloudSyncTCCDisabledKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isInInitialState, CFSTR("BRContainerIsInInitialState"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isInCloudDocsZone, CFSTR("BRContainerIsInCloudDocsZone"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BRContainer isDocumentScopePublic](self, "isDocumentScopePublic"), CFSTR("BRContainerIsDocumentScopePublic"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_personaID, CFSTR("BRContainerPersonaID"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString((NSString *)CFSTR("BRCClientPrivilegesDescriptor"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    if ((objc_msgSend(v8, "hasAuditToken") & 1) == 0)
      goto LABEL_12;
    if (v8)
    {
      objc_msgSend(v8, "auditToken");
      goto LABEL_11;
    }
  }
  else
  {
    v8 = 0;
    if ((objc_msgSend(0, "hasAuditToken") & 1) == 0)
      goto LABEL_12;
  }
  v8 = 0;
  v14 = 0u;
  v15 = 0u;
LABEL_11:
  -[BRContainer _pathForPlist](self, "_pathForPlist");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v9, "fileSystemRepresentation");
  v10 = sandbox_check_by_audit_token();

  if (!v10)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("BRContainerShouldUsePurgeableDataKey"), v11);
    goto LABEL_13;
  }
LABEL_12:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __31__BRContainer_encodeWithCoder___block_invoke;
  v12[3] = &unk_1E3DA6CB8;
  v13 = v4;
  -[BRContainer accessDataRepresentationInBlock:](self, "accessDataRepresentationInBlock:", v12);

LABEL_13:
}

- (NSSet)bundleIdentifiers
{
  BRContainer *v2;
  NSSet *bundleIDs;
  NSSet *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  bundleIDs = v2->_bundleIDs;
  if (!bundleIDs)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__BRContainer_bundleIdentifiers__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    bundleIDs = v2->_bundleIDs;
  }
  v4 = bundleIDs;
  objc_sync_exit(v2);

  return v4;
}

- (id)bundleIDVersions
{
  BRContainer *v2;
  NSDictionary *bundleIDVersions;
  NSDictionary *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  bundleIDVersions = v2->_bundleIDVersions;
  if (!bundleIDVersions)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __31__BRContainer_bundleIDVersions__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    bundleIDVersions = v2->_bundleIDVersions;
  }
  v4 = bundleIDVersions;
  objc_sync_exit(v2);

  return v4;
}

- (void)accessPropertiesInBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__BRContainer_accessPropertiesInBlock___block_invoke;
  v6[3] = &unk_1E3DA6CE0;
  v7 = v4;
  v5 = v4;
  -[BRContainer accessDataRepresentationInBlock:](self, "accessDataRepresentationInBlock:", v6);

}

- (id)_pathForPlist
{
  NSString *personaID;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  personaID = self->_personaID;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__BRContainer__pathForPlist__block_invoke;
  v5[3] = &unk_1E3DA63F0;
  v5[4] = self;
  v5[5] = &v6;
  BRPerformWithPersonaAndError(personaID, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)containersRepositoryURL
{
  void *v2;
  void *v3;

  +[BRDaemonConnection cloudDocsAppSupportURL](BRDaemonConnection, "cloudDocsAppSupportURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("session/containers"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bundleIdentifiersEnumeratorForProperties:(id)a3
{
  id v3;
  BRContainerBundleIdentifiersEnumerator *v4;

  v3 = a3;
  v4 = -[BRContainerBundleIdentifiersEnumerator initWithContainerPlist:]([BRContainerBundleIdentifiersEnumerator alloc], "initWithContainerPlist:", v3);

  return v4;
}

+ (id)_localizedNameWithProperties:(id)a3 mangledID:(id)a4 preferredLanguages:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  NSObject *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isCloudDocsMangledID"))
  {
    objc_msgSend((id)objc_opt_class(), "localizedNameForDefaultCloudDocsContainer");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  if (objc_msgSend(v9, "isDesktopMangledID"))
  {
    objc_msgSend((id)objc_opt_class(), "localizedNameForDesktopContainer");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  if (objc_msgSend(v9, "isDocumentsMangledID"))
  {
    objc_msgSend((id)objc_opt_class(), "localizedNameForDocumentsContainer");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(a1, "bundleIdentifiersEnumeratorForProperties:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (!v13)
  {

    goto LABEL_61;
  }
  v14 = v13;
  v52 = a1;
  v54 = v9;
  v60 = 0;
  v61 = *(_QWORD *)v67;
  v57 = v10;
  v58 = v8;
  v56 = v12;
  do
  {
    v15 = 0;
    v53 = v14;
    do
    {
      if (*(_QWORD *)v67 != v61)
        objc_enumerationMutation(v12);
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v15), v52);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v40 = v16;
          brc_bread_crumbs((uint64_t)"+[BRContainer _localizedNameWithProperties:mangledID:preferredLanguages:]", 1092);
          v41 = objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v72 = v43;
            v73 = 2112;
            v74 = v41;
            v44 = v43;
            _os_log_impl(&dword_19CBF0000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] bundleProperties should be a dictionary (kind: %@)%@", buf, 0x16u);

          }
LABEL_50:

LABEL_51:
          goto LABEL_52;
        }
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BRContainerLocalizedNames"));
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_opt_class();
        v59 = v16;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v55 = v15;
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BRContainerFormatVersionNumber"));
          v19 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v20 = v19;
          if ((objc_opt_isKindOfClass() & 1) != 0 && (int)-[NSObject intValue](v19, "intValue") <= 6)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("en"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
              goto LABEL_21;
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BRContainerName"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v24 = (void *)objc_msgSend(v18, "mutableCopy");
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BRContainerName"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("en"));

              v21 = v18;
              v18 = v24;
LABEL_21:

            }
          }
          v26 = (void *)MEMORY[0x1E0CB34D0];
          objc_msgSend(v18, "allKeys");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "preferredLocalizationsFromArray:forPreferences:", v27, v10);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v29 = v28;
          v30 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
          v31 = v20;
          if (v30)
          {
            v32 = v30;
            v33 = *(_QWORD *)v63;
            do
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v63 != v33)
                  objc_enumerationMutation(v29);
                objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (v35)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    if (objc_msgSend(v35, "length"))
                    {

                      v10 = v57;
                      v8 = v58;
                      v9 = v54;
                      goto LABEL_63;
                    }
                  }
                  else
                  {
                    brc_bread_crumbs((uint64_t)"+[BRContainer _localizedNameWithProperties:mangledID:preferredLanguages:]", 1147);
                    v36 = objc_claimAutoreleasedReturnValue();
                    brc_default_log(1);
                    v37 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      v38 = (void *)objc_opt_class();
                      *(_DWORD *)buf = 138412546;
                      v72 = v38;
                      v73 = 2112;
                      v74 = v36;
                      v39 = v38;
                      _os_log_impl(&dword_19CBF0000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] localizedName should be a string (kind: %@)%@", buf, 0x16u);

                    }
                    v31 = v20;
                  }
                }

              }
              v32 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
            }
            while (v32);
          }

          v10 = v57;
          v8 = v58;
          v15 = v55;
          v12 = v56;
          v14 = v53;
        }
        else
        {
          brc_bread_crumbs((uint64_t)"+[BRContainer _localizedNameWithProperties:mangledID:preferredLanguages:]", 1152);
          v31 = objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v45 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v72 = v45;
            v73 = 2112;
            v74 = v31;
            v46 = v45;
            _os_log_impl(&dword_19CBF0000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] localizedNames should be a dictionary (kind: %@)%@", buf, 0x16u);

          }
        }

        v16 = v59;
      }
      if (v60)
        goto LABEL_53;
      v40 = v16;
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BRContainerName"));
      v41 = objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          brc_bread_crumbs((uint64_t)"+[BRContainer _localizedNameWithProperties:mangledID:preferredLanguages:]", 1161);
          v42 = objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v72 = v48;
            v73 = 2112;
            v74 = v42;
            v49 = v48;
            _os_log_impl(&dword_19CBF0000, v47, OS_LOG_TYPE_DEFAULT, "[WARNING] fallbackName should be a string (kind: %@)%@", buf, 0x16u);

          }
          v60 = 0;
          goto LABEL_50;
        }
      }
      if (!-[NSObject length](v41, "length"))
      {
        v60 = 0;
        goto LABEL_51;
      }
      v60 = v41;
LABEL_52:
      v16 = v40;
LABEL_53:

      ++v15;
    }
    while (v15 != v14);
    v50 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    v14 = v50;
  }
  while (v50);

  v9 = v54;
  a1 = v52;
  v35 = v60;
  if (!v60)
  {
LABEL_61:
    objc_msgSend(a1, "_sanitizedContainerFallbackNameForMangledID:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_62:
    v35 = (void *)v11;
  }
LABEL_63:

  return v35;
}

+ (id)_localizedNameWithProperties:(id)a3 mangledID:(id)a4
{
  return (id)objc_msgSend(a1, "_localizedNameWithProperties:mangledID:preferredLanguages:", a3, a4, 0);
}

+ (id)_containerRepositoryURLForMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "containersRepositoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLibraryOrZoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_bundleIDsWithProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "bundleIdentifiersEnumeratorForProperties:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_bundleIDVersionsWithProperties:(id)a3 mangledID:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  NSObject *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v27 = 0;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a1, "bundleIdentifiersEnumeratorForProperties:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (!v7)
    goto LABEL_24;
  v8 = v7;
  v9 = *(_QWORD *)v29;
  v26 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v29 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_msgSend(v5, "objectForKeyedSubscript:", v11, v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        brc_bread_crumbs((uint64_t)"+[BRContainer _bundleIDVersionsWithProperties:mangledID:]", 1032);
        v13 = objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v35 = v11;
          v36 = 2112;
          v37 = v16;
          v38 = 2112;
          v39 = v13;
          v17 = v16;
          _os_log_impl(&dword_19CBF0000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving bundle properties for %@: unexpected kind of class (expected: NSDictionary, actual: %@)%@", buf, 0x20u);

        }
      }
      else
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("BRContainerFormatVersionNumber"));
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_22;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("BRContainerVersionNumber"));
          v14 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32[0] = CFSTR("BRContainerFormatVersionNumber");
            v32[1] = CFSTR("BRContainerVersionNumber");
            v33[0] = v13;
            v33[1] = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v15, v11);
          }
          else
          {
            v20 = v5;
            v21 = v6;
            brc_bread_crumbs((uint64_t)"+[BRContainer _bundleIDVersionsWithProperties:mangledID:]", 1053);
            v15 = objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v35 = v11;
              v36 = 2112;
              v37 = v23;
              v38 = 2112;
              v39 = v15;
              v24 = v23;
              _os_log_impl(&dword_19CBF0000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving bundle version for %@: unexpected kind of class (expected: NSString, actual: %@)%@", buf, 0x20u);

            }
            v6 = v21;
            v5 = v20;
            v9 = v26;
          }
        }
        else
        {
          brc_bread_crumbs((uint64_t)"+[BRContainer _bundleIDVersionsWithProperties:mangledID:]", 1046);
          v14 = objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v18 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v35 = v11;
            v36 = 2112;
            v37 = v18;
            v38 = 2112;
            v39 = v14;
            v19 = v18;
            _os_log_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving format version for %@: unexpected kind of class (expected: NSNumber, actual: %@)%@", buf, 0x20u);

          }
        }

      }
LABEL_22:

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  }
  while (v8);
LABEL_24:

LABEL_26:
  return v27;
}

+ (id)_URLForPlistOfMangledID:(id)a3
{
  void *v3;
  void *v4;

  +[BRContainer _containerRepositoryURLForMangledID:](BRContainer, "_containerRepositoryURLForMangledID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BRContainer)initWithDocsOrDesktopContainerID:(id)a3
{
  id v4;
  BRMangledID *v5;
  BRContainer *v6;
  BRContainer *v7;
  NSNumber *isDocumentScopePublicAsNumber;

  v4 = a3;
  v5 = -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", v4);

  v6 = -[BRContainer initWithMangledID:](self, "initWithMangledID:", v5);
  v7 = v6;
  if (v6)
  {
    isDocumentScopePublicAsNumber = v6->_isDocumentScopePublicAsNumber;
    v6->_isDocumentScopePublicAsNumber = (NSNumber *)MEMORY[0x1E0C9AAB0];

    v7->_isInCloudDocsZone = 1;
  }

  return v7;
}

- (BRContainer)initWithMangledID:(id)a3 dataRepresentation:(id)a4
{
  id v6;
  id v7;
  BRContainer *v8;
  BRContainer *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer initWithMangledID:dataRepresentation:]", 320);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRContainer initWithMangledID:dataRepresentation:].cold.2();

  }
  v8 = -[BRContainer initWithMangledID:](self, "initWithMangledID:", v6);
  v9 = v8;
  if (v8)
  {
    v8->_shouldUsePurgeableData = 0;
    if (!v7)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer initWithMangledID:dataRepresentation:]", 325);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[BRContainer initWithMangledID:dataRepresentation:].cold.1((uint64_t)v6);

    }
    -[BRContainer _replaceDataRepresentationWithData:](v9, "_replaceDataRepresentationWithData:", v7);
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  BRMangledID *mangledID;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  mangledID = self->_mangledID;
  -[BRContainer shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p id:%@ %@>"), v4, self, mangledID, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __31__BRContainer_encodeWithCoder___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "encodeObject:forKey:", a2, CFSTR("BRContainerDataKey"));
  return result;
}

- (id)computedProperties
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__9;
  v9 = __Block_byref_object_dispose__9;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__BRContainer_computedProperties__block_invoke;
  v4[3] = &unk_1E3DA6D08;
  v4[4] = &v5;
  -[BRContainer accessPropertiesInBlock:](self, "accessPropertiesInBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __33__BRContainer_computedProperties__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __36__BRContainer_isDocumentScopePublic__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_isDocumentScopePublicAsNumberWithProperties:mangledID:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v4;

}

+ (id)localizedNameForDesktopContainer
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat(CFSTR("Desktop"), CFSTR("Localizable"), v2, v3, v4, v5, v6, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)localizedNameForDocumentsContainer
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat(CFSTR("Documents"), CFSTR("Localizable"), v2, v3, v4, v5, v6, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedNameWithPreferredLanguages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BRMangledID *mangledID;
  int v14;
  BRMangledID *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRContainer computedProperties](self, "computedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v6
    || (objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("purgeableData"), 0),
        (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend((id)objc_opt_class(), "_localizedNameWithProperties:mangledID:preferredLanguages:", v6, self->_mangledID, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)v8;
    brc_bread_crumbs((uint64_t)"-[BRContainer localizedNameWithPreferredLanguages:]", 550);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      mangledID = self->_mangledID;
      v14 = 138412802;
      v15 = mangledID;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_debug_impl(&dword_19CBF0000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] failed parsing plist for container %@: %@%@", (uint8_t *)&v14, 0x20u);
    }

    v7 = 0;
  }

  return v7;
}

- (NSString)supportedFolderLevels
{
  return (NSString *)CFSTR("Any");
}

- (NSSet)documentsTypes
{
  BRContainer *v2;
  NSSet *documentsTypes;
  NSSet *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  documentsTypes = v2->_documentsTypes;
  if (!documentsTypes)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __29__BRContainer_documentsTypes__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    documentsTypes = v2->_documentsTypes;
  }
  v4 = documentsTypes;
  objc_sync_exit(v2);

  return v4;
}

void __29__BRContainer_documentsTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_documentsTypesWithProperties:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v4;

}

- (NSSet)exportedTypes
{
  BRContainer *v2;
  NSSet *exportedTypes;
  NSSet *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  exportedTypes = v2->_exportedTypes;
  if (!exportedTypes)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __28__BRContainer_exportedTypes__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    exportedTypes = v2->_exportedTypes;
  }
  v4 = exportedTypes;
  objc_sync_exit(v2);

  return v4;
}

void __28__BRContainer_exportedTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_exportedTypesWithProperties:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v4;

}

- (NSSet)importedTypes
{
  BRContainer *v2;
  NSSet *importedTypes;
  NSSet *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  importedTypes = v2->_importedTypes;
  if (!importedTypes)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __28__BRContainer_importedTypes__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    importedTypes = v2->_importedTypes;
  }
  v4 = importedTypes;
  objc_sync_exit(v2);

  return v4;
}

void __28__BRContainer_importedTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_importedTypesWithProperties:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v4;

}

- (id)iconMetadata
{
  BRContainer *v2;
  NSDictionary *iconMetadata;
  NSDictionary *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  iconMetadata = v2->_iconMetadata;
  if (!iconMetadata)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__BRContainer_iconMetadata__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    iconMetadata = v2->_iconMetadata;
  }
  v4 = iconMetadata;
  objc_sync_exit(v2);

  return v4;
}

void __27__BRContainer_iconMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_iconMetadataWithProperties:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v4;

}

- (id)iconGeneratorVersion
{
  BRContainer *v2;
  NSNumber *iconGeneratorVersion;
  NSNumber *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  iconGeneratorVersion = v2->_iconGeneratorVersion;
  if (!iconGeneratorVersion)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__BRContainer_iconGeneratorVersion__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    iconGeneratorVersion = v2->_iconGeneratorVersion;
  }
  v4 = iconGeneratorVersion;
  objc_sync_exit(v2);

  return v4;
}

void __35__BRContainer_iconGeneratorVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_iconGeneratorVersionWithProperties:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v4;

}

- (id)imageRepresentationsAvailable
{
  void *v2;
  void *v3;

  -[BRContainer iconMetadata](self, "iconMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setUrlRoot:(id)a3
{
  BRContainer *v4;
  void *v5;
  uint64_t v6;
  NSURL *url;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[BRMangledID mangledIDString](v4->_mangledID, "mangledIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  url = v4->_url;
  v4->_url = (NSURL *)v6;

  objc_sync_exit(v4);
}

- (NSURL)url
{
  BRContainer *v2;
  NSURL *url;
  NSString *personaID;
  NSURL *v5;
  _QWORD v7[5];

  v2 = self;
  objc_sync_enter(v2);
  url = v2->_url;
  if (!url)
  {
    personaID = v2->_personaID;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __18__BRContainer_url__block_invoke;
    v7[3] = &unk_1E3DA47F0;
    v7[4] = v2;
    BRPerformWithPersonaAndError(personaID, v7);
    url = v2->_url;
  }
  v5 = url;
  objc_sync_exit(v2);

  return v5;
}

void __18__BRContainer_url__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[BRDaemonConnection mobileDocumentsURLForPersonaID:needsPersonaSwitch:](BRDaemonConnection, "mobileDocumentsURLForPersonaID:needsPersonaSwitch:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184), a2 != 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mangledIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v3, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

}

- (NSURL)documentsURL
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[BRMangledID isCloudDocsMangledID](self->_mangledID, "isCloudDocsMangledID");
  -[BRContainer url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Documents"), 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return (NSURL *)v5;
}

- (NSURL)trashURL
{
  void *v3;
  void *v4;

  if (!-[BRMangledID isDesktopMangledID](self->_mangledID, "isDesktopMangledID"))
    -[BRMangledID isDocumentsMangledID](self->_mangledID, "isDocumentsMangledID");
  -[BRContainer documentsURL](self, "documentsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR(".Trash"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (id)trashRestoreStringForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRContainer documentsURL](self, "documentsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer trashRestoreStringForURL:]", 670);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v11;
      v14 = "[WARNING] Can't find the put back relative URL of %@%@";
      v15 = v12;
      v16 = 22;
      goto LABEL_7;
    }
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "br_realpath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_realpath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "br_pathRelativeToPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer trashRestoreStringForURL:]", 675);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v13;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v11;
      v14 = "[WARNING] Can't find the put back relative URL of %@ to %@%@";
      v15 = v12;
      v16 = 32;
LABEL_7:
      _os_log_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v16);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

+ (id)allContainersByContainerID
{
  void *v2;
  void *v3;

  +[BRContainerCache containerCache](BRContainerCache, "containerCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allContainersByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allContainers
{
  return (id)objc_msgSend(a1, "allContainersBlockIfNeeded:", 1);
}

+ (id)allContainersBlockIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[BRContainerCache containerCache](BRContainerCache, "containerCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allContainersBlockIfNeeded:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)documentContainers
{
  void *v2;
  void *v3;

  +[BRContainerCache containerCache](BRContainerCache, "containerCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)imageDataForSize:(CGSize)a3 scale:(int64_t)a4
{
  return -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:](self, "_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:", a4, 0, 0, a3.width, a3.height);
}

- (id)imageDataForSize:(CGSize)a3 scale:(int64_t)a4 isiOSIcon:(BOOL *)a5
{
  return -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:](self, "_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:", a4, a5, 0, a3.width, a3.height);
}

- (id)imageDataForSize:(CGSize)a3 scale:(int64_t)a4 shouldTransformToAppIcon:(BOOL *)a5
{
  return -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:](self, "_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:", a4, 0, a5, a3.width, a3.height);
}

- (id)_imageDataForSize:(CGSize)a3 scale:(int64_t)a4 isiOSIcon:(BOOL *)a5 shouldTransformToAppIcon:(BOOL *)a6
{
  double height;
  double width;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  char v19;
  BOOL v20;
  void *v21;
  NSObject *v22;
  void *v23;
  BOOL v24;
  void *v25;
  NSObject *v26;
  BRMangledID *mangledID;
  id v30;
  _QWORD v31[3];
  uint8_t buf[4];
  NSObject *v33;
  __int16 v34;
  BRMangledID *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  height = a3.height;
  width = a3.width;
  v44 = *MEMORY[0x1E0C80C00];
  memset(v31, 0, sizeof(v31));
  __brc_create_section(0, (uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 741, v31);
  brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 741);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)buf = 134219266;
    v33 = v31[0];
    v34 = 2112;
    v35 = mangledID;
    v36 = 2048;
    v37 = width;
    v38 = 2048;
    v39 = height;
    v40 = 2048;
    v41 = a4;
    v42 = 2112;
    v43 = v11;
    _os_log_debug_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx requesting image for %@ (size:%.1fx%.1f@%ld)%@", buf, 0x3Eu);
  }

  BRContainerIconNameForSizeAndScale(width, height, (double)a4);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[BRContainer _pathForIconName:](self, "_pathForIconName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 751);
      v15 = objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v13;
        v34 = 2112;
        v35 = (BRMangledID *)v15;
        _os_log_impl(&dword_19CBF0000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] can't construct a path for imageName=%@%@", buf, 0x16u);
      }
      v16 = 0;
      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v15, 0, &v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v30;
    v18 = v17;
    if (v16)
    {
      v19 = -[NSObject hasSuffix:](v13, "hasSuffix:", CFSTR("iOS"));
      v20 = v19;
      if (a5)
      {
        *a5 = v19;
        brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 767);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:].cold.4(a5);

      }
      if (!a6)
        goto LABEL_29;
      -[BRContainer iconGeneratorVersion](self, "iconGeneratorVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "longLongValue") < 1 && v20;
      *a6 = v24;

      brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 771);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:].cold.3(a6);
    }
    else if ((-[NSObject br_isCocoaErrorCode:](v17, "br_isCocoaErrorCode:", 4) & 1) != 0
           || -[NSObject br_isCocoaErrorCode:](v18, "br_isCocoaErrorCode:", 260))
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 759);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:].cold.2();
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 761);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v33 = v15;
        v34 = 2112;
        v35 = (BRMangledID *)v18;
        v36 = 2112;
        v37 = *(double *)&v25;
        _os_log_impl(&dword_19CBF0000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] can't create NSData with contents of '%@'; %@%@",
          buf,
          0x20u);
      }
    }

LABEL_29:
    goto LABEL_30;
  }
  brc_bread_crumbs((uint64_t)"-[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:]", 744);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[BRContainer _imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:].cold.1();
  v16 = 0;
LABEL_30:

  __brc_leave_section((uint64_t)v31);
  return v16;
}

+ (BOOL)canMoveFilesWithoutDownloadingFromContainer:(id)a3 toContainer:(id)a4
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
    goto LABEL_8;
  if (!v6)
    goto LABEL_9;
  v8 = v5[23];
  if (v8 | v7[23])
  {
    if (!objc_msgSend((id)v8, "isEqualToString:"))
      goto LABEL_9;
  }
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v11 & 1) != 0
    || objc_msgSend(v5, "isInCloudDocsZone") && (objc_msgSend(v7, "isInCloudDocsZone") & 1) != 0)
  {
LABEL_8:
    v12 = 1;
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (void)forceRefreshWithCompletion:(id)a3
{
  id v4;
  NSString *personaID;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  personaID = self->_personaID;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__BRContainer_forceRefreshWithCompletion___block_invoke;
  v7[3] = &unk_1E3DA57F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  BRPerformWithPersonaAndError(personaID, v7);

}

void __42__BRContainer_forceRefreshWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__BRContainer_forceRefreshWithCompletion___block_invoke_2;
    v9[3] = &unk_1E3DA48F8;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __42__BRContainer_forceRefreshWithCompletion___block_invoke_3;
    v7[3] = &unk_1E3DA48F8;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "forceSyncWithBarrierContainerID:timeout:reply:", v6, 0, v7);

  }
}

uint64_t __42__BRContainer_forceRefreshWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__BRContainer_forceRefreshWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)forceRefreshAllContainersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[BRContainer allContainersBlockIfNeeded:](BRContainer, "allContainersBlockIfNeeded:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__BRContainer_forceRefreshAllContainersWithCompletion___block_invoke;
  v7[3] = &unk_1E3DA48F8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "forceRefreshContainers:completion:", v5, v7);

}

void __55__BRContainer_forceRefreshAllContainersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer forceRefreshAllContainersWithCompletion:]_block_invoke", 863);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __55__BRContainer_forceRefreshAllContainersWithCompletion___block_invoke_cold_1((uint64_t)v3);

  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

+ (id)bundlePropertyEnumerator:(id)a3 valuesOfClass:(Class)a4 forProperties:(id)a5
{
  id v7;
  id v8;
  BRContainerBundlePropertyEnumerator *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[BRContainerBundlePropertyEnumerator initWithContainerPlist:propertyKey:valuesOfClass:]([BRContainerBundlePropertyEnumerator alloc], "initWithContainerPlist:propertyKey:valuesOfClass:", v7, v8, a4);

  return v9;
}

- (void)_replaceDataRepresentationWithData:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  BRContainer *v8;
  NSPurgeableData *purgeableDataRepresentation;
  NSSet *bundleIDs;
  NSDictionary *bundleIDVersions;
  NSString *localizedName;
  NSNumber *isDocumentScopePublicAsNumber;
  NSSet *documentsTypes;
  NSSet *exportedTypes;
  NSSet *importedTypes;
  NSDictionary *iconMetadata;
  NSDictionary *iconURLs;
  BRMangledID *mangledID;
  _QWORD v20[3];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  BRMangledID *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRContainer _replaceDataRepresentationWithData:]", 884, v20);
  brc_bread_crumbs((uint64_t)"-[BRContainer _replaceDataRepresentationWithData:]", 884);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)buf = 134218498;
    v22 = v20[0];
    v23 = 2112;
    v24 = mangledID;
    v25 = 2112;
    v26 = v6;
    _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Replace data for container %@%@", buf, 0x20u);
  }

  v8 = self;
  objc_sync_enter(v8);
  if (!v8->_shouldUsePurgeableData)
    objc_storeStrong((id *)&v8->_dataRepresentation, a3);
  purgeableDataRepresentation = v8->_purgeableDataRepresentation;
  v8->_purgeableDataRepresentation = 0;

  bundleIDs = v8->_bundleIDs;
  v8->_bundleIDs = 0;

  bundleIDVersions = v8->_bundleIDVersions;
  v8->_bundleIDVersions = 0;

  localizedName = v8->_localizedName;
  v8->_localizedName = 0;

  isDocumentScopePublicAsNumber = v8->_isDocumentScopePublicAsNumber;
  v8->_isDocumentScopePublicAsNumber = 0;

  documentsTypes = v8->_documentsTypes;
  v8->_documentsTypes = 0;

  exportedTypes = v8->_exportedTypes;
  v8->_exportedTypes = 0;

  importedTypes = v8->_importedTypes;
  v8->_importedTypes = 0;

  iconMetadata = v8->_iconMetadata;
  v8->_iconMetadata = 0;

  iconURLs = v8->_iconURLs;
  v8->_iconURLs = 0;

  objc_sync_exit(v8);
  if (+[BRContainerCache hasDaemonicParts](BRContainerCache, "hasDaemonicParts"))
    +[BRContainer postContainerListUpdateNotification](BRContainer, "postContainerListUpdateNotification");
  __brc_leave_section((uint64_t)v20);

}

- (id)_containerRepositoryURL
{
  NSString *personaID;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  personaID = self->_personaID;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__BRContainer__containerRepositoryURL__block_invoke;
  v5[3] = &unk_1E3DA63F0;
  v5[4] = self;
  v5[5] = &v6;
  BRPerformWithPersonaAndError(personaID, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__BRContainer__containerRepositoryURL__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (!a2)
  {
    +[BRContainer _containerRepositoryURLForMangledID:](BRContainer, "_containerRepositoryURLForMangledID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)_pathForIconName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[BRContainer _containerRepositoryURL](self, "_containerRepositoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("png"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_pathForIconName:(id)a3 mangledID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "_containerRepositoryURLForMangledID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("png"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_performWhileAccessingSecurityScopedContainer:(id)a3
{
  void (**v4)(_QWORD);
  NSData *imageSandboxExtension;
  int v6;
  void *v7;
  NSObject *v8;
  NSData *v9;
  int v10;
  NSData *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  imageSandboxExtension = self->_imageSandboxExtension;
  if (!imageSandboxExtension)
  {
LABEL_7:
    v4[2](v4);
    goto LABEL_8;
  }
  -[NSData bytes](imageSandboxExtension, "bytes");
  if (sandbox_extension_consume() < 0)
  {
    v6 = *__error();
    brc_bread_crumbs((uint64_t)"-[BRContainer _performWhileAccessingSecurityScopedContainer:]", 963);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v9 = self->_imageSandboxExtension;
      v10 = 138412802;
      v11 = v9;
      v12 = 1024;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] Failed to consume extension %@ %{errno}d%@", (uint8_t *)&v10, 0x1Cu);
    }

    *__error() = v6;
    goto LABEL_7;
  }
  v4[2](v4);
  sandbox_extension_release();
LABEL_8:

}

+ (id)_isDocumentScopePublicAsNumberWithProperties:(id)a3 mangledID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isCloudDocsMangledID") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0C9AAB0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistentDomainForName:", CFSTR("com.apple.bird"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "appLibraryOrZoneName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("BRContainerIsDocumentScopePublic"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if ((v14 & 1) != 0)
    {
      v8 = (void *)MEMORY[0x1E0C9AAB0];
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", CFSTR("BRContainerIsDocumentScopePublic"), objc_opt_class(), v6, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v16)
      {
        v17 = 0;
        v18 = *(_QWORD *)v22;
        while (2)
        {
          v19 = 0;
          v17 += v16;
          do
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19), "BOOLValue"))
            {

              v8 = (void *)MEMORY[0x1E0C9AAA0];
              goto LABEL_16;
            }
            ++v19;
          }
          while (v16 != v19);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v16)
            continue;
          break;
        }
        v16 = v17 > 0;
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_16:

  }
  return v8;
}

+ (id)_sanitizedContainerFallbackNameForMangledID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  int v14;
  __CFString *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  objc_msgSend(v3, "aliasTargetContainerString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "br_pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v3, "isPassbookMangledID");
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _BRLocalizedStringWithFormat(CFSTR("PASSBOOK_APP"), CFSTR("Localizable"), v6, v7, v8, v9, v10, v11, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "length"))
    {
      v13 = objc_msgSend(v5, "characterAtIndex:", 0);
      if (v13 > 0x7F)
        v14 = __maskrune(v13, 0x1000uLL);
      else
        v14 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v13 + 60) & 0x1000;
      if (v14)
      {
        objc_msgSend(v5, "substringToIndex:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uppercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", 0, 1, v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v19;
      }
      v15 = v5;
      v5 = v15;
    }
    else
    {
      v15 = CFSTR("Documents");
    }
    v12 = v15;
  }

  return v12;
}

+ (id)_documentsTypesWithProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", CFSTR("BRContainerDocumentTypes"), objc_opt_class(), v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
      v11 = v5;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_exportedTypesWithProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", CFSTR("BRContainerExportedTypes"), objc_opt_class(), v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
      v11 = v5;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_importedTypesWithProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", CFSTR("BRContainerImportedTypes"), objc_opt_class(), v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
      v11 = v5;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_iconMetadataWithProperties:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  id obj;
  double v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BRContainerIcons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BRContainerIcons"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
          v17 = 0.0;
          v18 = 0;
          v17 = BRContainerIconSizeForName(v9);
          v18 = v10;
          v23[0] = CFSTR("size");
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v17, "{CGSize=dd}");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v23[1] = CFSTR("scale");
          v24[0] = v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", BRContainerIconScaleForName(v9));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v24[1] = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v6);
    }

    v3 = v15;
  }

  return v4;
}

+ (id)_iconGeneratorVersionWithProperties:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "bundlePropertyEnumerator:valuesOfClass:forProperties:", CFSTR("BRContainerIconGeneratorVersionNumber"), objc_opt_class(), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = &unk_1E3DC2AF8;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "longLongValue");
          if (v12 > objc_msgSend(v9, "longLongValue"))
          {
            v13 = v11;

            v9 = v13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }
    else
    {
      v9 = &unk_1E3DC2AF8;
    }

  }
  else
  {
    v9 = &unk_1E3DC2AF8;
  }

  return v9;
}

+ (id)_iconURLsWithProperties:(id)a3 mangledID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BRContainerIcons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BRContainerIcons"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(a1, "_pathForIconName:mangledID:", v13, v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v13);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
  return v8;
}

- (void)setIsInInitialState:(BOOL)a3
{
  self->_isInInitialState = a3;
}

- (void)setIsInCloudDocsZone:(BOOL)a3
{
  self->_isInCloudDocsZone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_observationSetupQueueForSecondaryConnection, 0);
  objc_storeStrong((id *)&self->_observationSetupQueueForDefaultConnection, 0);
  objc_storeStrong((id *)&self->_purgeableDataRepresentation, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
  objc_storeStrong((id *)&self->_imageSandboxExtension, 0);
  objc_storeStrong((id *)&self->_lastServerUpdate, 0);
  objc_storeStrong((id *)&self->_isDocumentScopePublicAsNumber, 0);
  objc_storeStrong((id *)&self->_iconGeneratorVersion, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_iconMetadata, 0);
  objc_storeStrong((id *)&self->_importedTypes, 0);
  objc_storeStrong((id *)&self->_exportedTypes, 0);
  objc_storeStrong((id *)&self->_documentsTypes, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleIDVersions, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_mangledID, 0);
}

- (NSDate)lastServerUpdate
{
  OS_dispatch_queue *observationSetupQueueForSecondaryConnection;
  BOOL *p_isObservingLastServerUpdate;
  uint64_t v5;
  void (*v6)(uint64_t);
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t block;
  uint64_t p_block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  BOOL *v23;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  observationSetupQueueForSecondaryConnection = self->_observationSetupQueueForSecondaryConnection;
  p_isObservingLastServerUpdate = &self->_isObservingLastServerUpdate;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke;
  v11[3] = &unk_1E3DA6D80;
  v11[4] = self;
  v11[5] = &v12;
  v6 = v11;
  block = v5;
  p_block = 3221225472;
  v20 = (uint64_t)__brc_block_perform_once_and_set_block_invoke;
  v21 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E3DA7130;
  v22 = v6;
  v23 = p_isObservingLastServerUpdate;
  v7 = observationSetupQueueForSecondaryConnection;
  dispatch_sync(v7, &block);

  if (v13[5])
  {
    -[BRContainer setLastServerUpdate:](self, "setLastServerUpdate:");
    v8 = (id)v13[5];
  }
  else
  {
    block = 0;
    p_block = (uint64_t)&block;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__9;
    v22 = __Block_byref_object_dispose__9;
    v23 = 0;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke_308;
    v10[3] = &unk_1E3DA5708;
    v10[4] = self;
    v10[5] = &block;
    dispatch_async_and_wait((dispatch_queue_t)containerWorkloop, v10);
    v8 = *(id *)(p_block + 40);
    _Block_object_dispose(&block, 8);

  }
  _Block_object_dispose(&v12, 8);

  return (NSDate *)v8;
}

void __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  uint64_t v14;
  id v15;

  +[BRContainerCache containerCache](BRContainerCache, "containerCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscribeToContainerStatusUpdate");

  +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newSyncProxy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aliasTargetContainerString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke_2;
  v13 = &unk_1E3DA6D58;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v6 = v4;
  objc_msgSend(v6, "getContainerLastServerUpdateWithID:reply:", v5, &v10);

  objc_msgSend(v6, "result", v10, v11, v12, v13, v14);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRXcodeAdditions) lastServerUpdate]_block_invoke_2", 1317);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = 138412802;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] unable to retrieve last server updated for container %@; %@%@",
        (uint8_t *)&v10,
        0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "setObjResult:error:", v5, v6);

}

void __49__BRContainer_BRXcodeAdditions__lastServerUpdate__block_invoke_308(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

- (unsigned)currentStatus
{
  OS_dispatch_queue *observationSetupQueueForSecondaryConnection;
  BOOL *p_isObservingCurrentStatus;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t block;
  uint64_t p_block;
  uint64_t v21;
  void *v22;
  id v23;
  BOOL *v24;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  observationSetupQueueForSecondaryConnection = self->_observationSetupQueueForSecondaryConnection;
  p_isObservingCurrentStatus = &self->_isObservingCurrentStatus;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke;
  v12[3] = &unk_1E3DA6D80;
  v12[4] = self;
  v12[5] = &v13;
  v6 = v12;
  block = v5;
  p_block = 3221225472;
  v21 = (uint64_t)__brc_block_perform_once_and_set_block_invoke;
  v22 = &unk_1E3DA7130;
  v23 = v6;
  v24 = p_isObservingCurrentStatus;
  v7 = observationSetupQueueForSecondaryConnection;
  dispatch_sync(v7, &block);

  v8 = (void *)v14[5];
  if (v8)
  {
    -[BRContainer setCurrentStatus:](self, "setCurrentStatus:", objc_msgSend(v8, "unsignedIntegerValue"));
    v9 = objc_msgSend((id)v14[5], "unsignedIntegerValue");
  }
  else
  {
    block = 0;
    p_block = (uint64_t)&block;
    v21 = 0x2020000000;
    LODWORD(v22) = 0;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke_310;
    v11[3] = &unk_1E3DA5708;
    v11[4] = self;
    v11[5] = &block;
    dispatch_async_and_wait((dispatch_queue_t)containerWorkloop, v11);
    v9 = *(_DWORD *)(p_block + 24);
    _Block_object_dispose(&block, 8);
  }
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  uint64_t v14;
  id v15;

  +[BRContainerCache containerCache](BRContainerCache, "containerCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscribeToContainerStatusUpdate");

  +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newSyncProxy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aliasTargetContainerString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke_2;
  v13 = &unk_1E3DA6DA8;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v6 = v4;
  objc_msgSend(v6, "getContainerStatusWithID:reply:", v5, &v10);

  objc_msgSend(v6, "result", v10, v11, v12, v13, v14);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRXcodeAdditions) currentStatus]_block_invoke_2", 1351);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = 138412802;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_19CBF0000, v7, (os_log_type_t)0x90u, "[ERROR] unable to retrieve status for container %@; %@%@",
        (uint8_t *)&v11,
        0x20u);
    }

  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObjResult:error:", v9, v5);

}

uint64_t __46__BRContainer_BRXcodeAdditions__currentStatus__block_invoke_310(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 132);
  return result;
}

- (void)setLastServerUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BRContainer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lastServerUpdate"));
  v5 = containerWorkloop;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__BRContainer_BRXcodeInternalAdditions__setLastServerUpdate___block_invoke;
  block[3] = &unk_1E3DA4A70;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(v5, block);
  -[BRContainer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lastServerUpdate"));

}

void __61__BRContainer_BRXcodeInternalAdditions__setLastServerUpdate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
}

- (void)setCurrentStatus:(unsigned int)a3
{
  _QWORD v5[5];
  unsigned int v6;

  -[BRContainer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentStatus"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__BRContainer_BRXcodeInternalAdditions__setCurrentStatus___block_invoke;
  v5[3] = &unk_1E3DA6DD0;
  v5[4] = self;
  v6 = a3;
  dispatch_async_and_wait((dispatch_queue_t)containerWorkloop, v5);
  -[BRContainer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentStatus"));
}

uint64_t __58__BRContainer_BRXcodeInternalAdditions__setCurrentStatus___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 132) = *(_DWORD *)(result + 40);
  return result;
}

+ (id)documentsContainersInBackupHomeAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  BRMangledID *v27;
  BRContainer *v28;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  objc_msgSend(v32, "URLByAppendingPathComponent:", CFSTR("Library/Application Support/CloudDocs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("session/containers"));
  v6 = objc_claimAutoreleasedReturnValue();

  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v6;
  objc_msgSend(v30, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, 0, 5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    v11 = CFSTR("plist");
    v34 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v13, "pathExtension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v11);

        if (v15)
        {
          v35 = 0;
          objc_msgSend(a1, "containerInRepositoryURL:createIfMissing:error:", v13, 0, &v35);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v35;
          if (v16)
          {
            if (objc_msgSend(v16, "isDocumentScopePublic"))
            {
              objc_msgSend(v16, "documentsURL");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
                objc_msgSend(v33, "addObject:", v16);
            }
          }
          else
          {
            v19 = v11;
            v20 = v7;
            v21 = a1;
            brc_bread_crumbs((uint64_t)"+[BRContainer(BRFinderAdditions) documentsContainersInBackupHomeAtURL:error:]", 1431);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(0);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
            {
              objc_msgSend(v13, "path");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v41 = v24;
              v42 = 2112;
              v43 = v17;
              v44 = 2112;
              v45 = v22;
              _os_log_error_impl(&dword_19CBF0000, v23, (os_log_type_t)0x90u, "[ERROR] can't extract container at %@: %@%@", buf, 0x20u);

            }
            a1 = v21;
            v7 = v20;
            v11 = v19;
            v10 = v34;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v9);
  }

  BRContainerIfDirectoryInHomeURLIsSynced(v32, (uint64_t)CFSTR("Documents"), CFSTR("com.apple.Documents"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v33, "addObject:", v25);
  BRContainerIfDirectoryInHomeURLIsSynced(v32, (uint64_t)CFSTR("Desktop"), CFSTR("com.apple.Desktop"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    objc_msgSend(v33, "addObject:", v26);
  v27 = -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", CFSTR("com.apple.CloudDocs"));
  v28 = -[BRContainer initWithMangledID:]([BRContainer alloc], "initWithMangledID:", v27);
  objc_msgSend(v33, "addObject:", v28);

  return v33;
}

+ (id)containerInRepositoryURL:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  BRMangledID *v10;
  void *v11;
  id v12;
  void *v13;
  BRContainer *v14;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  char *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "brc_stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BRMangledID initWithAppLibraryName:]([BRMangledID alloc], "initWithAppLibraryName:", v9);
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 1, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  v13 = v12;
  if (!v12)
    goto LABEL_4;
  if ((objc_msgSend(v12, "br_isCocoaErrorCode:", 260) & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]", 1471);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "path");
      v22 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v25 = (const char *)v10;
      v26 = 2112;
      v27 = v22;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v16;
      _os_log_debug_impl(&dword_19CBF0000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] failed reading data for container %@ at '%@': %@%@", buf, 0x2Au);

    }
    v18 = v13;
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]", 1472);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, (os_log_type_t)0x90u))
      goto LABEL_14;
    v21 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v25 = "+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]";
    v26 = 2080;
    if (!a5)
      v21 = "(ignored by caller)";
    goto LABEL_20;
  }
  if (a4)
  {
LABEL_4:
    v14 = -[BRContainer initWithMangledID:dataRepresentation:]([BRContainer alloc], "initWithMangledID:dataRepresentation:", v10, v11);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAppLibraryNotFound:", v9);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]", 1475);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
LABEL_14:

      goto LABEL_15;
    }
    v21 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v25 = "+[BRContainer(BRFinderAdditions) containerInRepositoryURL:createIfMissing:error:]";
    v26 = 2080;
    if (!a5)
      v21 = "(ignored by caller)";
LABEL_20:
    v27 = v21;
    v28 = 2112;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    _os_log_error_impl(&dword_19CBF0000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_14;
  }
LABEL_15:
  if (a5)
    *a5 = objc_retainAutorelease(v18);

  v14 = 0;
LABEL_5:

  return v14;
}

+ (id)containerInRepositoryURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "containerInRepositoryURL:createIfMissing:error:", a3, 0, a4);
}

+ (id)containerForItemAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(v5, "br_cloudDocsContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)deleteAllContentsOnClientAndServer:(id *)a3
{
  return -[BRContainer deleteAllContentsOnClientAndServer:error:](self, "deleteAllContentsOnClientAndServer:error:", 0, a3);
}

- (BOOL)deleteAllContentsOnClientAndServer:(BOOL)a3 error:(id *)a4
{
  NSString *personaID;
  BOOL v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v11;
  _QWORD v12[7];
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9;
  v18 = __Block_byref_object_dispose__9;
  v19 = 0;
  personaID = self->_personaID;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke;
  v12[3] = &unk_1E3DA6DF8;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &v20;
  v13 = a3;
  BRPerformWithPersonaAndError(personaID, v12);
  if (*((_BYTE *)v21 + 24))
  {
    v6 = 1;
  }
  else
  {
    v7 = (id)v15[5];
    if (v7)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRFinderInternalAdditions) deleteAllContentsOnClientAndServer:error:]", 1539);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        v11 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v25 = "-[BRContainer(BRFinderInternalAdditions) deleteAllContentsOnClientAndServer:error:]";
        v26 = 2080;
        if (!a4)
          v11 = "(ignored by caller)";
        v27 = v11;
        v28 = 2112;
        v29 = v7;
        v30 = 2112;
        v31 = v8;
        _os_log_error_impl(&dword_19CBF0000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v7);

    v6 = *((_BYTE *)v21 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v6;
}

void __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void *v27;
  id v28;
  id obj;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRFinderInternalAdditions) deleteAllContentsOnClientAndServer:error:]_block_invoke", 1519);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_cold_2(a1);

    if (objc_msgSend(*(id *)(a1 + 32), "isInCloudDocsZone")
      && (objc_msgSend(*(id *)(a1 + 32), "identifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudDocs")),
          v7,
          (v8 & 1) == 0))
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRFinderInternalAdditions) deleteAllContentsOnClientAndServer:error:]_block_invoke", 1522);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v18, v19);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "documentsURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v22 + 40);
      v23 = objc_msgSend(v20, "removeItemAtURL:error:", v21, &obj);
      objc_storeStrong((id *)(v22 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23;

    }
    else
    {
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "newSyncProxy");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appLibraryOrZoneName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(unsigned __int8 *)(a1 + 56);
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_342;
      v27 = &unk_1E3DA47F0;
      v28 = v10;
      v13 = v10;
      objc_msgSend(v13, "deleteAllContentsOfContainerID:onClient:onServer:wait:reply:", v11, 1, 1, v12, &v24);

      v14 = (id)objc_msgSend(v13, "result", v24, v25, v26, v27);
      objc_msgSend(v13, "error");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                             + 40) == 0;

    }
  }

}

uint64_t __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_342(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", 0, a2);
}

- (id)versionNumberForBundleIdentifier:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  int v16;
  NSObject *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v12 = 0;
    goto LABEL_17;
  }
  -[BRContainer bundleIDVersions](self, "bundleIDVersions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BRContainerFormatVersionNumber"));
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) versionNumberForBundleIdentifier:]", 1561);
      v9 = objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        v12 = 0;
        goto LABEL_16;
      }
      v16 = 138412802;
      v17 = v4;
      v18 = 2112;
      v19 = (id)objc_opt_class();
      v20 = 2112;
      v21 = v9;
      v13 = v19;
      _os_log_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving format version for %@: unexpected kind of class (expected: NSNumber, actual: %@)%@", (uint8_t *)&v16, 0x20u);
LABEL_14:

      goto LABEL_15;
    }
  }
  v8 = -[NSObject intValue](v7, "intValue");
  if (v8 < (int)objc_msgSend((id)BRContainerFormatVersionNumberValue, "intValue"))
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) versionNumberForBundleIdentifier:]", 1565);
    v9 = objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138413058;
      v17 = v7;
      v18 = 2112;
      v19 = (id)BRContainerFormatVersionNumberValue;
      v20 = 2112;
      v21 = v4;
      v22 = 2112;
      v23 = v9;
      _os_log_debug_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] overwriting old plist from version %@ to %@ for %@%@", (uint8_t *)&v16, 0x2Au);
    }
    goto LABEL_15;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BRContainerVersionNumber"));
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) versionNumberForBundleIdentifier:]", 1572);
      v10 = objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412802;
        v17 = v4;
        v18 = 2112;
        v19 = (id)objc_opt_class();
        v20 = 2112;
        v21 = v10;
        v14 = v19;
        _os_log_impl(&dword_19CBF0000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] failed retrieving  version for %@: unexpected kind of class (expected: NSString, actual: %@)%@", (uint8_t *)&v16, 0x20u);

      }
      goto LABEL_14;
    }
  }
  v9 = v9;
  v12 = v9;
LABEL_16:

LABEL_17:
  return v12;
}

- (BOOL)hasIconWithName:(id)a3
{
  id v4;
  BRContainer *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[BRContainer iconMetadata](v5, "iconMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

    objc_sync_exit(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)iconURLs
{
  BRContainer *v2;
  NSDictionary *iconURLs;
  NSDictionary *v4;
  _QWORD v6[5];

  v2 = self;
  objc_sync_enter(v2);
  iconURLs = v2->_iconURLs;
  if (!iconURLs)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__BRContainer_BRInternalAdditions__iconURLs__block_invoke;
    v6[3] = &unk_1E3DA6D30;
    v6[4] = v2;
    -[BRContainer accessPropertiesInBlock:](v2, "accessPropertiesInBlock:", v6);
    iconURLs = v2->_iconURLs;
  }
  v4 = iconURLs;
  objc_sync_exit(v2);

  return v4;
}

void __44__BRContainer_BRInternalAdditions__iconURLs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_iconURLsWithProperties:mangledID:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v4;

}

- (id)bestFittingImageDataForSize:(CGSize)a3 shouldTransformToAppIcon:(BOOL *)a4
{
  double width;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  width = a3.width;
  v25 = *MEMORY[0x1E0C80C00];
  -[BRContainer imageDataForSize:scale:shouldTransformToAppIcon:](self, "imageDataForSize:scale:shouldTransformToAppIcon:", 1, a4, a3.width, a3.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[BRContainer imageRepresentationsAvailable](self, "imageRepresentationsAvailable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v19 = 0.0;
          objc_msgSend(v13, "objectForKey:", CFSTR("size"), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "getValue:", &v18);

          objc_msgSend(v13, "objectForKey:", CFSTR("scale"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "integerValue");

          if (v18 * (double)v16 >= width)
          {
            -[BRContainer imageDataForSize:scale:shouldTransformToAppIcon:](self, "imageDataForSize:scale:shouldTransformToAppIcon:", v16, a4, v18, v19);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_12:

  }
  return v7;
}

- (id)copyDataRepresentation
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__9;
  v9 = __Block_byref_object_dispose__9;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__BRContainer_BRInternalAdditions__copyDataRepresentation__block_invoke;
  v4[3] = &unk_1E3DA6E20;
  v4[4] = &v5;
  -[BRContainer accessDataRepresentationInBlock:](self, "accessDataRepresentationInBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __58__BRContainer_BRInternalAdditions__copyDataRepresentation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)containerForMangledID:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    +[BRContainer _URLForPlistOfMangledID:](BRContainer, "_URLForPlistOfMangledID:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[BRContainer containerInRepositoryURL:createIfMissing:error:](BRContainer, "containerInRepositoryURL:createIfMissing:error:", v3, 1, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)isDocumentScopePublicWithProperties:(id)a3 mangledID:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a1, "_isDocumentScopePublicAsNumberWithProperties:mangledID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (void)forceRefreshContainers:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_group_create();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        dispatch_group_enter(v7);
        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = __70__BRContainer_BRInternalAdditions__forceRefreshContainers_completion___block_invoke;
        v24[3] = &unk_1E3DA57A8;
        v25 = v6;
        v26 = v14;
        v27 = v7;
        objc_msgSend(v14, "forceRefreshWithCompletion:", v24);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_queue_create("force-refresh-container", v16);

  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __70__BRContainer_BRInternalAdditions__forceRefreshContainers_completion___block_invoke_2;
  block[3] = &unk_1E3DA6E48;
  v22 = v6;
  v23 = v20;
  v18 = v20;
  v19 = v6;
  dispatch_group_notify(v7, v17, block);

}

void __70__BRContainer_BRInternalAdditions__forceRefreshContainers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __70__BRContainer_BRInternalAdditions__forceRefreshContainers_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *(_QWORD *)(a1 + 32);
    v7 = CFSTR("BRPartialErrorsByContainerIDKey");
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 21, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

}

+ (void)postContainerListUpdateNotification
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;

  if (!+[BRContainerCache hasDaemonicParts](BRContainerCache, "hasDaemonicParts"))
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) postContainerListUpdateNotification]", 1786);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[BRContainer(BRInternalAdditions) postContainerListUpdateNotification].cold.2();

  }
  brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) postContainerListUpdateNotification]", 1788);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[BRContainer(BRInternalAdditions) postContainerListUpdateNotification].cold.1();

  if (postContainerListUpdateNotification_once != -1)
    dispatch_once(&postContainerListUpdateNotification_once, &__block_literal_global_372);
  br_pacer_signal((void *)postContainerListUpdateNotification_pacer);
}

void __71__BRContainer_BRInternalAdditions__postContainerListUpdateNotification__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("container-update", v0);

  v2 = (void *)postContainerListUpdateNotification_queue;
  postContainerListUpdateNotification_queue = (uint64_t)v1;

  br_pacer_create("container-update", (void *)postContainerListUpdateNotification_queue, 1.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)postContainerListUpdateNotification_pacer;
  postContainerListUpdateNotification_pacer = v3;

  br_pacer_set_event_handler((void *)postContainerListUpdateNotification_pacer, &__block_literal_global_374);
  br_pacer_resume((unsigned __int8 *)postContainerListUpdateNotification_pacer);
}

void __71__BRContainer_BRInternalAdditions__postContainerListUpdateNotification__block_invoke_2()
{
  id v0;

  objc_msgSend(CFSTR("BRContainerCacheDidChangeDistributedNotification"), "br_libnotifyPerUserNotificationName");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  brc_notify_post((char *)objc_msgSend(v0, "UTF8String"));

}

+ (void)postContainerStatusChangeNotificationWithID:(id)a3 key:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) postContainerStatusChangeNotificationWithID:key:value:]", 1811);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_debug_impl(&dword_19CBF0000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] broadcasting to framework clients container %@ change %@=%@%@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "appLibraryOrZoneName", BRContainerIDKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v8;
    v17[0] = v13;
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "postNotificationName:object:userInfo:", BRContainerDidChangeStatusDistributedNotification, 0, v14);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) postContainerStatusChangeNotificationWithID:key:value:]", 1813);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      +[BRContainer(BRInternalAdditions) postContainerStatusChangeNotificationWithID:key:value:].cold.1();

  }
}

- (BOOL)_updateMetadataOnDiskWithProperties:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  BRMangledID *mangledID;
  BRMangledID *v15;
  BRMangledID *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  BRMangledID *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  if (v5)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:]", 1828);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      mangledID = self->_mangledID;
      *(_DWORD *)buf = 138412802;
      v21 = mangledID;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = (uint64_t)v6;
      _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] failed plist serialization for container %@: %@%@", buf, 0x20u);
    }

    v8 = 0;
  }
  else
  {
    -[BRContainer _pathForPlist](self, "_pathForPlist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BRMangledID isCloudDocsMangledID](self->_mangledID, "isCloudDocsMangledID"))
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:]", 1835);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:].cold.1();

    }
    v8 = objc_msgSend(v4, "writeToFile:atomically:", v6, 1);
    if ((v8 & 1) != 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:]", 1846);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v15 = self->_mangledID;
        *(_DWORD *)buf = 138413314;
        v21 = v15;
        v22 = 2112;
        v23 = v6;
        v24 = 2112;
        v25 = BRContainerFormatVersionNumberValue;
        v26 = 2112;
        v27 = BRContainerIconGeneratorVersionNumberValue;
        v28 = 2112;
        v29 = v9;
        _os_log_debug_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] wrote plist for container %@ at '%@' {\n  formatVersion = %@,\n  iconGenerationVersion = %@\n}%@", buf, 0x34u);
      }

      -[BRContainer _replaceDataRepresentationWithData:](self, "_replaceDataRepresentationWithData:", v4);
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) _updateMetadataOnDiskWithProperties:]", 1838);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v16 = self->_mangledID;
        *(_DWORD *)buf = 138412802;
        v21 = v16;
        v22 = 2112;
        v23 = v6;
        v24 = 2112;
        v25 = (uint64_t)v11;
        _os_log_error_impl(&dword_19CBF0000, v12, (os_log_type_t)0x90u, "[ERROR] can't write metadata for container %@ at '%@'%@", buf, 0x20u);
      }

    }
  }

  return v8;
}

- (BOOL)updateMetadataWithExtractorProperties:(id)a3 iconPaths:(id)a4 bundleID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  int v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  __int128 v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v51;
  NSObject *v52;
  int v53;
  id v54;
  int v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  BRMangledID *mangledID;
  char v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  const std::__fs::filesystem::path *v71;
  id v72;
  const std::__fs::filesystem::path *v73;
  std::error_code *v74;
  int v75;
  void *v76;
  NSObject *v77;
  int v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  id v85;
  void *v86;
  NSObject *v87;
  id v89;
  void *v90;
  NSObject *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  NSObject *v97;
  __int128 v98;
  char v99;
  BOOL v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  id v107;
  uint64_t obj;
  id obja;
  void *v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  id v118;
  id v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[6];
  _QWORD v130[3];
  uint8_t buf[4];
  id v132;
  __int16 v133;
  id v134;
  __int16 v135;
  _QWORD v136[3];
  _BYTE v137[128];
  _BYTE v138[128];
  uint8_t v139[128];
  _BYTE v140[24];
  uint64_t (*v141)(uint64_t, uint64_t);
  __int128 v142;
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v107 = a4;
  v8 = a5;
  v110 = v7;
  if (!v7)
  {
    v89 = v8;
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1853);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT))
      -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.8();

    v8 = v89;
  }
  v111 = (uint64_t (*)(uint64_t, uint64_t))v8;
  if (!v8)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1854);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
      -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.7();

  }
  memset(v130, 0, sizeof(v130));
  __brc_create_section(0, (uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1856, v130);
  brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1856);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)v140 = 134218754;
    *(_QWORD *)&v140[4] = v130[0];
    *(_WORD *)&v140[12] = 2112;
    *(_QWORD *)&v140[14] = mangledID;
    *(_WORD *)&v140[22] = 2112;
    v141 = v111;
    LOWORD(v142) = 2112;
    *(_QWORD *)((char *)&v142 + 2) = v9;
    _os_log_debug_impl(&dword_19CBF0000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Update metadata with extractor properties %@ for %@%@", v140, 0x2Au);
  }

  -[BRContainer _containerRepositoryURL](self, "_containerRepositoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v111, "isEqualToString:", CFSTR("com.apple.bird")))
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1865);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
      -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.6();

  }
  *(_QWORD *)v140 = 0;
  *(_QWORD *)&v140[8] = v140;
  *(_QWORD *)&v140[16] = 0x3032000000;
  v141 = __Block_byref_object_copy__9;
  *(_QWORD *)&v142 = __Block_byref_object_dispose__9;
  *((_QWORD *)&v142 + 1) = 0;
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __93__BRContainer_BRInternalAdditions__updateMetadataWithExtractorProperties_iconPaths_bundleID___block_invoke;
  v129[3] = &unk_1E3DA6EB0;
  v129[4] = self;
  v129[5] = v140;
  -[BRContainer accessDataRepresentationInBlock:](self, "accessDataRepresentationInBlock:", v129);
  v12 = 0;
  v105 = 0;
  v100 = 1;
  if (!v111)
    goto LABEL_100;
  v13 = *(void **)(*(_QWORD *)&v140[8] + 40);
  if (!v13)
    goto LABEL_100;
  if (v107)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BRContainerIcons"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "allKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v16);

      objc_msgSend(v15, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v107, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(*(_QWORD *)&v140[8] + 40), "setObject:forKeyedSubscript:", v17, CFSTR("BRContainerIcons"));

    v13 = *(void **)(*(_QWORD *)&v140[8] + 40);
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", v111);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(*(_QWORD *)&v140[8] + 40), "objectForKeyedSubscript:", v111);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v110, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v22, "isEqualToSet:", v101) & 1) == 0)
    {
      objc_msgSend(v22, "setByAddingObject:", CFSTR("BRContainerIconGeneratorVersionNumber"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToSet:", v101);

      if (!v26)
        goto LABEL_71;
    }
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)&v140[8] + 40), "objectForKeyedSubscript:", v111);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
    if (v29)
    {
      obj = *(_QWORD *)v126;
      v30 = 1;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v126 != obj)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v31);
          objc_msgSend(*(id *)(*(_QWORD *)&v140[8] + 40), "objectForKeyedSubscript:", v111);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v110, "objectForKeyedSubscript:", v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v32, "isEqual:", CFSTR("BRContainerVersionNumber")) & 1) != 0
            || objc_msgSend(v32, "isEqual:", CFSTR("BRContainerIconGeneratorVersionNumber")))
          {
            v36 = objc_msgSend(v35, "isEqual:", v34);
            v30 &= v36;
            v28 |= v36 ^ 1;
          }
          else if (v34 && !v35 || v35 && (!v34 || (objc_msgSend(v35, "isEqual:", v34) & 1) == 0))
          {

            v30 = 0;
            v28 = 0;
            goto LABEL_37;
          }

          ++v31;
        }
        while (v29 != v31);
        v37 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v125, v139, 16);
        v29 = v37;
      }
      while (v37);
    }
    else
    {
      v30 = 1;
    }
LABEL_37:

    if (((v30 | v28) & 1) != 0 && ((v30 ^ v28) & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1933);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
        -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.5();

    }
    if ((v30 & 1) != 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1936);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.2();

      v105 = 0;
      v12 = 0;
      v100 = 1;
LABEL_98:

      goto LABEL_100;
    }
    if ((v28 & 1) == 0)
    {
LABEL_71:
      v38 = 1;
LABEL_77:

      goto LABEL_78;
    }
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    obja = v107;
    v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
    if (v41)
    {
      v102 = v41;
      v43 = 0;
      v106 = *(_QWORD *)v122;
      v99 = 1;
      *(_QWORD *)&v42 = 138412802;
      v98 = v42;
LABEL_46:
      v44 = 0;
      while (1)
      {
        if (*(_QWORD *)v122 != v106)
          objc_enumerationMutation(obja);
        v45 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v44);
        v46 = (void *)MEMORY[0x1A1AD841C]();
        objc_msgSend(obja, "objectForKeyedSubscript:", v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v43;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v47, 1, &v120);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v120;

        if (v48 && v49 == 0)
        {
          -[BRContainer _pathForIconName:](self, "_pathForIconName:", v45);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v51, 1, &v119);
          v52 = objc_claimAutoreleasedReturnValue();
          v54 = v119;
          if (!v52 || v54)
          {
            v43 = v54;
            brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1954);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v98;
              v132 = v51;
              v133 = 2112;
              v134 = v43;
              v135 = 2112;
              v136[0] = v56;
              _os_log_impl(&dword_19CBF0000, v57, OS_LOG_TYPE_DEFAULT, "[WARNING] can't read content of file at '%@'; %@%@",
                buf,
                0x20u);
            }

            v53 = 25;
          }
          else
          {
            v43 = 0;
            v55 = objc_msgSend(v48, "isEqualToData:", v52);
            v99 &= v55;
            v53 = v55 ? 0 : 25;
          }
        }
        else
        {
          brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1947);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v98;
            v132 = v47;
            v133 = 2112;
            v134 = v49;
            v135 = 2112;
            v136[0] = v51;
            _os_log_impl(&dword_19CBF0000, v52, OS_LOG_TYPE_DEFAULT, "[WARNING] can't read content of file at '%@'; %@%@",
              buf,
              0x20u);
          }
          v53 = 25;
          v43 = v49;
        }

        objc_autoreleasePoolPop(v46);
        if (v53)
          break;
        if (v102 == ++v44)
        {
          v102 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v121, v138, 16);
          if (v102)
            goto LABEL_46;
          break;
        }
      }

      if ((v99 & 1) == 0)
      {
        brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1969);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.4();
        v38 = 1;
LABEL_76:

        goto LABEL_77;
      }
    }
    else
    {

    }
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1966);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.3();
    v38 = 0;
    goto LABEL_76;
  }
  v38 = 1;
LABEL_78:
  objc_msgSend(*(id *)(*(_QWORD *)&v140[8] + 40), "setObject:forKeyedSubscript:", v110, v111, v98);
  v118 = 0;
  v61 = objc_msgSend(v104, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v103, 1, 0, &v118);
  v105 = v118;
  if ((v61 & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1978);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v132 = v103;
      v133 = 2112;
      v134 = v105;
      v135 = 2112;
      v136[0] = v62;
      _os_log_error_impl(&dword_19CBF0000, v63, (os_log_type_t)0x90u, "[ERROR] unable to create directory at '%@'; %@%@",
        buf,
        0x20u);
    }

  }
  v100 = v38 != 0;
  if (-[BRContainer _updateMetadataOnDiskWithProperties:](self, "_updateMetadataOnDiskWithProperties:", *(_QWORD *)(*(_QWORD *)&v140[8] + 40)))
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v22 = v107;
    v64 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v114, v137, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v115;
      do
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v115 != v65)
            objc_enumerationMutation(v22);
          v67 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRContainer _pathForIconName:](self, "_pathForIconName:", v67);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_retainAutorelease(v68);
          v71 = (const std::__fs::filesystem::path *)objc_msgSend(v70, "fileSystemRepresentation");
          v72 = objc_retainAutorelease(v69);
          v73 = (const std::__fs::filesystem::path *)objc_msgSend(v72, "fileSystemRepresentation");
          rename(v71, v73, v74);
          if (v75 < 0)
          {
            v78 = *__error();
            brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1989);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(0);
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138413058;
              v132 = v70;
              v133 = 2112;
              v134 = v72;
              v135 = 1024;
              LODWORD(v136[0]) = v78;
              WORD2(v136[0]) = 2112;
              *(_QWORD *)((char *)v136 + 6) = v79;
              _os_log_error_impl(&dword_19CBF0000, v80, (os_log_type_t)0x90u, "[ERROR] failed renaming from '%@' to '%@' %{errno}d%@", buf, 0x26u);
            }

            *__error() = v78;
          }
          else
          {
            brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 1991);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v77 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v132 = v70;
              v133 = 2112;
              v134 = v72;
              v135 = 2112;
              v136[0] = v76;
              _os_log_debug_impl(&dword_19CBF0000, v77, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed icon from '%@' to '%@'%@", buf, 0x20u);
            }

          }
        }
        v64 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v114, v137, 16);
      }
      while (v64);
    }
    v12 = 1;
    goto LABEL_98;
  }
  v12 = 0;
LABEL_100:
  objc_msgSend(v107, "allValues");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "firstObject");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "stringByDeletingLastPathComponent");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    v113 = v105;
    v84 = objc_msgSend(v104, "removeItemAtPath:error:", v83, &v113);
    v85 = v113;

    if ((v84 & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 2001);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v132 = v103;
        v133 = 2112;
        v134 = v85;
        v135 = 2112;
        v136[0] = v86;
        _os_log_impl(&dword_19CBF0000, v87, OS_LOG_TYPE_DEFAULT, "[WARNING] failed removing temporary path at '%@'; %@%@",
          buf,
          0x20u);
      }
      goto LABEL_107;
    }
  }
  else
  {
    v85 = v105;
  }
  brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]", 2003);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v87 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    -[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:].cold.1((uint64_t)v103);
LABEL_107:

  _Block_object_dispose(v140, 8);
  __brc_leave_section((uint64_t)v130);

  return v100 & v12;
}

void __93__BRContainer_BRInternalAdditions__updateMetadataWithExtractorProperties_iconPaths_bundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 2, 0, &v19);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v19;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]_block_invoke", 1875);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v17 = objc_msgSend(v3, "length");
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 134218754;
        v21 = v17;
        v22 = 2112;
        v23 = v18;
        v24 = 2112;
        v25 = v5;
        v26 = 2112;
        v27 = v8;
        _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] failed parsing %lu-byte plist for container %@: %@%@", buf, 0x2Au);
      }

    }
  }
  else
  {
    v5 = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]_block_invoke", 1882);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = objc_msgSend(v3, "length");
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)buf = 134218498;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v10;
      _os_log_debug_impl(&dword_19CBF0000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] read %lu-byte plist for container %@%@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithExtractorProperties:iconPaths:bundleID:]_block_invoke", 1880);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __93__BRContainer_BRInternalAdditions__updateMetadataWithExtractorProperties_iconPaths_bundleID___block_invoke_cold_1(a1);
  }

}

- (BOOL)updateMetadataWithRecordData:(id)a3 iconPaths:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  const std::__fs::filesystem::path *v21;
  BRMangledID *v22;
  const std::__fs::filesystem::path *v23;
  std::error_code *v24;
  int v25;
  void *v26;
  NSObject *v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  BOOL v37;
  BRMangledID *mangledID;
  uint64_t v40;
  BRMangledID *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  BRMangledID *v46;
  void *v47;
  void *v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  _QWORD v56[3];
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  BRMangledID *v60;
  __int16 v61;
  _BYTE v62[18];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v47 = v5;
  if (!v5)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2011);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      -[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:].cold.2();

  }
  memset(v56, 0, sizeof(v56));
  __brc_create_section(0, (uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2012, v56);
  brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2012);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    mangledID = self->_mangledID;
    *(_DWORD *)buf = 134218498;
    v58 = v56[0];
    v59 = 2112;
    v60 = mangledID;
    v61 = 2112;
    *(_QWORD *)v62 = v7;
    _os_log_debug_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Update metadata with record data %@%@", buf, 0x20u);
  }

  -[BRContainer _containerRepositoryURL](self, "_containerRepositoryURL");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "path");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  LOBYTE(v9) = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v48, 1, 0, &v55);
  v44 = v10;
  v46 = (BRMangledID *)v55;
  if ((v9 & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2020);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v58 = (uint64_t)v48;
      v59 = 2112;
      v60 = v46;
      v61 = 2112;
      *(_QWORD *)v62 = v11;
      _os_log_error_impl(&dword_19CBF0000, v12, (os_log_type_t)0x90u, "[ERROR] unable to create directory at '%@'; %@%@",
        buf,
        0x20u);
    }

  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v17, v44);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRContainer _pathForIconName:](self, "_pathForIconName:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_retainAutorelease(v18);
        v21 = (const std::__fs::filesystem::path *)objc_msgSend(v20, "fileSystemRepresentation");
        v22 = objc_retainAutorelease(v19);
        v23 = (const std::__fs::filesystem::path *)-[BRMangledID fileSystemRepresentation](v22, "fileSystemRepresentation");
        rename(v21, v23, v24);
        if (v25 < 0)
        {
          v28 = *__error();
          brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2028);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138413058;
            v58 = (uint64_t)v20;
            v59 = 2112;
            v60 = v22;
            v61 = 1024;
            *(_DWORD *)v62 = v28;
            *(_WORD *)&v62[4] = 2112;
            *(_QWORD *)&v62[6] = v29;
            _os_log_error_impl(&dword_19CBF0000, v30, (os_log_type_t)0x90u, "[ERROR] failed renaming from '%@' to '%@' %{errno}d%@", buf, 0x26u);
          }

          *__error() = v28;
        }
        else
        {
          brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2030);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v58 = (uint64_t)v20;
            v59 = 2112;
            v60 = v22;
            v61 = 2112;
            *(_QWORD *)v62 = v26;
            _os_log_debug_impl(&dword_19CBF0000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed icon from '%@' to '%@'%@", buf, 0x20u);
          }

        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v14);
  }

  v50 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v47, 2, 0, &v50);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v50;

  if (!v31)
  {
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2036);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v40 = objc_msgSend(v47, "length");
      v41 = self->_mangledID;
      *(_DWORD *)buf = 134218754;
      v58 = v40;
      v59 = 2112;
      v60 = v41;
      v61 = 2112;
      *(_QWORD *)v62 = v32;
      *(_WORD *)&v62[8] = 2112;
      *(_QWORD *)&v62[10] = v33;
      _os_log_debug_impl(&dword_19CBF0000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] failed parsing %lu-byte plist for container %@: %@%@", buf, 0x2Au);
    }

  }
  if (!v13)
  {
    objc_msgSend(v31, "removeObjectForKey:", CFSTR("BRContainerIcons"));
    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:]", 2046);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[BRContainer(BRInternalAdditions) updateMetadataWithRecordData:iconPaths:].cold.1();

  }
  v37 = -[BRContainer _updateMetadataOnDiskWithProperties:](self, "_updateMetadataOnDiskWithProperties:", v31, v44);

  __brc_leave_section((uint64_t)v56);
  return v37;
}

+ (void)_generateiOSIconsForMangledID:(id)a3 usingBundle:(__CFBundle *)a4 generatedIcons:(id)a5
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  CFURLRef v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t ImageAtIndex;
  const void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  char v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  void *v60;
  Class UIImageClass;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  uint64_t CurrentContext;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  NSObject *v86;
  NSObject *v87;
  uint64_t v88;
  void *v89;
  NSObject *v90;
  NSObject *v91;
  os_log_t log;
  NSObject *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  CFBundleRef bundlea;
  uint64_t v105;
  NSObject *obj;
  id obja;
  NSObject *v108;
  id v109;
  id v110;
  void *v111;
  void *context;
  void *contexta;
  void *v114;
  NSObject *v115;
  NSObject *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  NSObject *v121;
  NSObject *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131;
  _QWORD v132[3];
  uint8_t buf[4];
  uint64_t v134;
  __int16 v135;
  uint64_t v136;
  __int16 v137;
  os_log_t v138;
  __int16 v139;
  NSObject *v140;
  _BYTE v141[128];
  _QWORD v142[2];
  _QWORD v143[2];
  _QWORD v144[2];
  _QWORD v145[2];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v94 = a3;
  v98 = a5;
  memset(v132, 0, sizeof(v132));
  __brc_create_section(0, (uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2146, v132);
  brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2146);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:].cold.6(v132);

  CFBundleGetInfoDictionary(a4);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("CFBundleIcons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CFBundlePrimaryIcon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CFBundleIconFiles"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v97, "count"))
  {
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("CFBundleIconFiles"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "count"))
    {
      brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2162);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:].cold.1();

      goto LABEL_98;
    }
    v97 = v10;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFBundleCopyResourcesDirectoryURL(a4);
  -[__CFURL path](v11, "path");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  v131 = 0;
  objc_msgSend(v96, "contentsOfDirectoryAtPath:error:", v111, &v131);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v131;
  v114 = v12;
  if (!objc_msgSend(v12, "count"))
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2174);
    v115 = objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v134 = (uint64_t)v111;
      v135 = 2112;
      v136 = (uint64_t)v101;
      v137 = 2112;
      v138 = v115;
      _os_log_impl(&dword_19CBF0000, v87, OS_LOG_TYPE_DEFAULT, "[WARNING] unable to list contents of directory at '%@'; %@%@",
        buf,
        0x20u);
    }
    goto LABEL_97;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v115 = objc_claimAutoreleasedReturnValue();
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v13 = v97;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v128;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v128 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1A1AD841C]();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH %@ AND self ENDSWITH[c] '.png'"), v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "filteredArrayUsingPredicate:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObjectsFromArray:](v115, "addObjectsFromArray:", v20);

        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
    }
    while (v14);
  }

  if (!-[NSObject count](v115, "count"))
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2191);
    v88 = objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v108 = v88;
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
      +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:].cold.2();
    goto LABEL_96;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSObject count](v115, "count"));
  v108 = objc_claimAutoreleasedReturnValue();
  v126 = 0u;
  v124 = 0u;
  v125 = 0u;
  v123 = 0u;
  obj = v115;
  v21 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v123, v146, 16);
  if (!v21)
    goto LABEL_39;
  v109 = *(id *)v124;
  do
  {
    v22 = 0;
    context = (void *)v21;
    do
    {
      if (*(id *)v124 != v109)
        objc_enumerationMutation(obj);
      v23 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)v22);
      v24 = (void *)MEMORY[0x1A1AD841C]();
      objc_msgSend(v111, "stringByAppendingPathComponent:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (!v26)
      {
        brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2203);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          v134 = v23;
          v135 = 2112;
          v136 = (uint64_t)v31;
          v36 = v34;
          v37 = "[ERROR] can't find URL for resource %@%@";
          goto LABEL_29;
        }
LABEL_36:

        goto LABEL_37;
      }
      v28 = (const void *)softLinkCGImageSourceCreateWithURL(v26, 0);
      if (!v28)
      {
        brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2210);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          v134 = (uint64_t)v27;
          v135 = 2112;
          v136 = (uint64_t)v31;
          v36 = v34;
          v37 = "[ERROR] can't create image source for %@%@";
LABEL_29:
          _os_log_error_impl(&dword_19CBF0000, v36, (os_log_type_t)0x90u, v37, buf, 0x16u);
        }
        goto LABEL_36;
      }
      getkCGImageSourceShouldCache();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v144[0] = v29;
      v145[0] = MEMORY[0x1E0C9AAA0];
      getkCGImageSourceSkipMetadata();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v144[1] = v30;
      v145[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      ImageAtIndex = softLinkCGImageSourceCreateImageAtIndex((uint64_t)v28, 0, (uint64_t)v31);
      v33 = (const void *)ImageAtIndex;
      if (ImageAtIndex)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", softLinkCGImageGetWidth(ImageAtIndex));
        v34 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject integerValue](v34, "integerValue") <= 0)
        {
          brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2227);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412546;
            v134 = (uint64_t)v27;
            v135 = 2112;
            v136 = (uint64_t)v40;
            _os_log_error_impl(&dword_19CBF0000, v41, (os_log_type_t)0x90u, "[ERROR] can't use image with a width smaller than 1; %@%@",
              buf,
              0x16u);
          }

          CFRelease(v33);
          CFRelease(v28);
        }
        else
        {
          v142[0] = CFSTR("BRIconURL");
          v142[1] = CFSTR("BRIconWidth");
          v143[0] = v27;
          v143[1] = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject insertObject:atIndex:](v108, "insertObject:atIndex:", v35, -[NSObject indexOfObject:inSortedRange:options:usingComparator:](v108, "indexOfObject:inSortedRange:options:usingComparator:", v35, 0, -[NSObject count](v108, "count"), 1024, &__block_literal_global_386));
          CFRelease(v33);
          CFRelease(v28);

        }
        goto LABEL_36;
      }
      brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2219);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412546;
        v134 = (uint64_t)v27;
        v135 = 2112;
        v136 = (uint64_t)v38;
        _os_log_error_impl(&dword_19CBF0000, v39, (os_log_type_t)0x90u, "[ERROR] can't create image for %@%@", buf, 0x16u);
      }

      CFRelease(v28);
LABEL_37:

      objc_autoreleasePoolPop(v24);
      v22 = (char *)v22 + 1;
    }
    while (context != v22);
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v123, v146, 16);
  }
  while (v21);
LABEL_39:

  if (-[NSObject count](v108, "count"))
  {
    objc_msgSend(a1, "_containerRepositoryURLForMangledID:", v94);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "path");
    v93 = objc_claimAutoreleasedReturnValue();

    v122 = v101;
    v43 = objc_msgSend(v96, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v93, 1, 0, &v122);
    v44 = v122;

    if ((v43 & 1) != 0)
    {
      v121 = v44;
      objc_msgSend(v96, "brc_createTemporarySubdirectoryOfItem:withTemplate:error:", v93, CFSTR(".XXXXXX"), &v121);
      v100 = objc_claimAutoreleasedReturnValue();
      v45 = v121;

      if (v100)
      {
        BRContainerIconCKAssetKeys();
        log = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self ENDSWITH %@"), CFSTR("iOS"));
        v91 = objc_claimAutoreleasedReturnValue();
        -[NSObject filteredSetUsingPredicate:](log, "filteredSetUsingPredicate:");
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        bundlea = (CFBundleRef)(id)objc_claimAutoreleasedReturnValue();
        v46 = -[__CFBundle countByEnumeratingWithState:objects:count:](bundlea, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
        if (!v46)
          goto LABEL_77;
        v105 = *(_QWORD *)v118;
        while (1)
        {
          v47 = 0;
          obja = (id)v46;
          do
          {
            if (*(_QWORD *)v118 != v105)
              objc_enumerationMutation(bundlea);
            v48 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)v47);
            contexta = (void *)MEMORY[0x1A1AD841C]();
            BRContainerIconNameForCKAssetKey(v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
            {
              brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2282);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(1);
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v134 = (uint64_t)v49;
                v135 = 2112;
                v136 = (uint64_t)v50;
                _os_log_debug_impl(&dword_19CBF0000, v51, OS_LOG_TYPE_DEBUG, "[DEBUG] generating %@%@", buf, 0x16u);
              }

              objc_msgSend(CFSTR("AppIconMask"), "stringByAppendingString:", v49);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "pathForResource:ofType:", v52, CFSTR("png"));
              v54 = objc_claimAutoreleasedReturnValue();

              -[objc_class imageWithContentsOfFile:](getUIImageClass(), "imageWithContentsOfFile:", v54);
              v110 = (id)objc_claimAutoreleasedReturnValue();
              if (v110)
              {
                v55 = BRContainerIconSizeForName(v49);
                v57 = v56;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v55);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = -[NSObject indexOfObject:inSortedRange:options:usingComparator:](v108, "indexOfObject:inSortedRange:options:usingComparator:", v58, 0, -[NSObject count](v108, "count"), 1280, &__block_literal_global_395);

                -[NSObject objectAtIndexedSubscript:](v108, "objectAtIndexedSubscript:", v59 - (v59 == -[NSObject count](v108, "count")));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                UIImageClass = getUIImageClass();
                objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("BRIconURL"));
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "path");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                -[objc_class imageWithContentsOfFile:](UIImageClass, "imageWithContentsOfFile:", v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v64)
                {
                  brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2345);
                  v69 = objc_claimAutoreleasedReturnValue();
                  brc_default_log(0);
                  v70 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v70, (os_log_type_t)0x90u))
                  {
                    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("BRIconURL"));
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v134 = (uint64_t)v75;
                    v135 = 2112;
                    v136 = (uint64_t)v69;
                    _os_log_error_impl(&dword_19CBF0000, v70, (os_log_type_t)0x90u, "[ERROR] unable to create an image with the contents of %@.%@", buf, 0x16u);

                  }
                  goto LABEL_73;
                }
                brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2350);
                v65 = objc_claimAutoreleasedReturnValue();
                brc_default_log(1);
                v66 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v64, "size");
                  v79 = v78;
                  objc_msgSend(v64, "scale");
                  v81 = v80;
                  objc_msgSend(v64, "size");
                  v83 = v82;
                  objc_msgSend(v64, "scale");
                  *(_DWORD *)buf = 134218498;
                  v134 = (uint64_t)(v79 * v81);
                  v135 = 2048;
                  v136 = (uint64_t)(v83 * v84);
                  v137 = 2112;
                  v138 = v65;
                  _os_log_debug_impl(&dword_19CBF0000, v66, OS_LOG_TYPE_DEBUG, "[DEBUG] best candidate has a size of {%ld, %ld}%@", buf, 0x20u);
                }

                softLinkUIGraphicsBeginImageContextWithOptions(0, v55, v57, 1.0);
                CurrentContext = softLinkUIGraphicsGetCurrentContext();
                v68 = objc_msgSend(objc_retainAutorelease(v110), "CGImage");
                softLinkCGContextClipToMask(CurrentContext, v68, 0.0, 0.0, v55, v57);
                objc_msgSend(v64, "drawInRect:", 0.0, 0.0, v55, v57);
                softLinkUIGraphicsGetImageFromCurrentImageContext();
                v69 = objc_claimAutoreleasedReturnValue();

                softLinkUIGraphicsEndImageContext();
                softLinkUIImagePNGRepresentation(v69);
                v70 = objc_claimAutoreleasedReturnValue();
                if (v70)
                {
                  objc_msgSend(v49, "stringByAppendingPathExtension:", CFSTR("png"));
                  v71 = objc_claimAutoreleasedReturnValue();
                  -[NSObject stringByAppendingPathComponent:](v100, "stringByAppendingPathComponent:", v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();

                  v116 = v45;
                  LOBYTE(v71) = -[NSObject writeToFile:options:error:](v70, "writeToFile:options:error:", v72, 1, &v116);
                  v102 = v116;

                  if ((v71 & 1) != 0)
                  {
                    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2366);
                    v73 = objc_claimAutoreleasedReturnValue();
                    brc_default_log(1);
                    v74 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412802;
                      v134 = (uint64_t)v49;
                      v135 = 2112;
                      v136 = (uint64_t)v72;
                      v137 = 2112;
                      v138 = v73;
                      _os_log_debug_impl(&dword_19CBF0000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] wrote icon data for '%@' to '%@'%@", buf, 0x20u);
                    }

                    objc_msgSend(v98, "setObject:forKeyedSubscript:", v72, v49);
LABEL_72:

                    v45 = v102;
LABEL_73:

LABEL_74:
                    goto LABEL_75;
                  }
                  brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2364);
                  v76 = objc_claimAutoreleasedReturnValue();
                  brc_default_log(0);
                  v77 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v77, (os_log_type_t)0x90u))
                  {
                    *(_DWORD *)buf = 138413058;
                    v134 = (uint64_t)v49;
                    v135 = 2112;
                    v136 = (uint64_t)v72;
                    v137 = 2112;
                    v138 = v102;
                    v139 = 2112;
                    v140 = v76;
                    _os_log_error_impl(&dword_19CBF0000, v77, (os_log_type_t)0x90u, "[ERROR] failed writing icon data for '%@' to '%@', error: '%@'%@", buf, 0x2Au);
                  }

                }
                else
                {
                  brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2370);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log(1);
                  v76 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v134 = (uint64_t)v69;
                    v135 = 2112;
                    v136 = (uint64_t)v72;
                    _os_log_impl(&dword_19CBF0000, v76, OS_LOG_TYPE_DEFAULT, "[WARNING] unable to compute the PNG representation of %@%@", buf, 0x16u);
                  }
                  v102 = v45;
                }

                goto LABEL_72;
              }
              brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2288);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(1);
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v134 = (uint64_t)v52;
                v135 = 2112;
                v136 = (uint64_t)v60;
                _os_log_debug_impl(&dword_19CBF0000, v69, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to find icon mask for %@%@", buf, 0x16u);
              }
              goto LABEL_74;
            }
            brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2279);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v134 = (uint64_t)v48;
              v135 = 2112;
              v136 = (uint64_t)v52;
              _os_log_debug_impl(&dword_19CBF0000, v54, OS_LOG_TYPE_DEBUG, "[DEBUG] unable to retrieve icon name from asset key '%@'%@", buf, 0x16u);
            }
LABEL_75:

            objc_autoreleasePoolPop(contexta);
            v47 = (char *)v47 + 1;
          }
          while (obja != v47);
          v46 = -[__CFBundle countByEnumeratingWithState:objects:count:](bundlea, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
          if (!v46)
          {
LABEL_77:

            brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2373);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
              +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:].cold.4((uint64_t)v98);

            goto LABEL_93;
          }
        }
      }
      brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2268);
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v134 = (uint64_t)v93;
        v135 = 2112;
        v136 = (uint64_t)v45;
        v137 = 2112;
        v138 = log;
        _os_log_error_impl(&dword_19CBF0000, v91, (os_log_type_t)0x90u, "[ERROR] unable to create directory at '%@.XXXXXX'; %@%@",
          buf,
          0x20u);
      }
LABEL_93:

      v44 = v45;
    }
    else
    {
      brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2262);
      v100 = objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v134 = (uint64_t)v93;
        v135 = 2112;
        v136 = (uint64_t)v44;
        v137 = 2112;
        v138 = v100;
        _os_log_error_impl(&dword_19CBF0000, log, (os_log_type_t)0x90u, "[ERROR] unable to create directory at '%@'; %@%@",
          buf,
          0x20u);
      }
    }

    v101 = v44;
  }
  else
  {
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:]", 2255);
    v93 = objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, (os_log_type_t)0x90u))
      +[BRContainer(BRInternalAdditions) _generateiOSIconsForMangledID:usingBundle:generatedIcons:].cold.3((uint64_t)a4);
  }

LABEL_96:
  v87 = v108;
LABEL_97:

LABEL_98:
  __brc_leave_section((uint64_t)v132);

}

uint64_t __93__BRContainer_BRInternalAdditions___generateiOSIconsForMangledID_usingBundle_generatedIcons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("BRIconWidth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BRIconWidth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  if (v6 < v8)
    return -1;
  else
    return v6 != v8;
}

uint64_t __93__BRContainer_BRInternalAdditions___generateiOSIconsForMangledID_usingBundle_generatedIcons___block_invoke_393(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "integerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BRIconWidth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "integerValue");
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BRIconWidth"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "integerValue");

    v9 = objc_msgSend(v5, "integerValue");
  }
  if (v7 < v9)
    v11 = -1;
  else
    v11 = v7 != v9;

  return v11;
}

+ (id)propertiesForMangledID:(id)a3 usingBundle:(__CFBundle *)a4 minimumBundleVersion:(id)a5 bundleIcons:(id *)a6
{
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  CFBundleRef v48;
  void *v49;
  void *v50;
  const __CFArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  CFURLRef v69;
  void *context;
  NSObject *v71;
  void *v72;
  void *v73;
  id *v74;
  id *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  CFBundleRef bundle;
  NSObject *v86;
  CFArrayRef v87;
  void *v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _QWORD v101[2];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  NSObject *v105;
  __int16 v106;
  id v107;
  __int16 v108;
  void *v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (a4)
  {
    CFBundleGetInfoDictionary(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
    v13 = objc_claimAutoreleasedReturnValue();
    v90 = v12;
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
    {
      brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) propertiesForMangledID:usingBundle:minimumBundleVersion:bundleIcons:]", 2393);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v103 = v15;
        v104 = 2112;
        v105 = v13;
        v106 = 2112;
        v107 = v17;
        _os_log_impl(&dword_19CBF0000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] invalid version %@ or identifier %@%@", buf, 0x20u);
      }
      v19 = 0;
LABEL_81:

      goto LABEL_82;
    }
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) propertiesForMangledID:usingBundle:minimumBundleVersion:bundleIcons:]", 2400);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v103 = v15;
      v104 = 2112;
      v105 = v13;
      v106 = 2112;
      v107 = v11;
      v108 = 2112;
      v109 = v20;
      _os_log_debug_impl(&dword_19CBF0000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] bundle %@ has version %@, minimum version is %@%@", buf, 0x2Au);
    }

    if (v11 && objc_msgSend(v11, "compare:options:", v13, 64) != -1)
    {
      v19 = 0;
LABEL_82:

      goto LABEL_83;
    }
    brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) propertiesForMangledID:usingBundle:minimumBundleVersion:bundleIcons:]", 2406);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v103 = v15;
      v104 = 2112;
      v105 = v10;
      v106 = 2112;
      v107 = v23;
      _os_log_debug_impl(&dword_19CBF0000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] metadata for %@ client of %@ is out of date%@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, CFSTR("BRContainerVersionNumber"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", BRContainerFormatVersionNumberValue, CFSTR("BRContainerFormatVersionNumber"));
    objc_msgSend(v90, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAD0]);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("BRContainerDocumentTypes"));
    objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("UTExportedTypeDeclarations"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, CFSTR("BRContainerExportedTypes"));
    objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("UTImportedTypeDeclarations"));
    v27 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, CFSTR("BRContainerImportedTypes"));
    v88 = (void *)v27;
    v28 = a6;
    objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("NSUbiquitousContainers"));
    v29 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)v25;
    if (v29)
    {
      v30 = (void *)v29;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_30:
        -[NSObject appLibraryOrZoneName](v10, "appLibraryOrZoneName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v30;
        objc_msgSend(v30, "objectForKeyedSubscript:", v31);
        v32 = objc_claimAutoreleasedReturnValue();

        bundle = a4;
        v33 = (void *)v32;
        v80 = a1;
        if (v32)
        {
          objc_opt_class();
          v34 = v28;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v33 = 0;
          }
        }
        else
        {
          v34 = v28;
        }
        v35 = v88;
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("NSUbiquitousContainerName"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v89 = v36;
        v83 = v11;
        v84 = v33;
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v36, "length"))
        {
          v37 = CFSTR("NSUbiquitousContainerName");
        }
        else
        {
          v38 = *MEMORY[0x1E0C9AE88];
          v101[0] = *MEMORY[0x1E0C9AAC8];
          v101[1] = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          v39 = (id)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
          if (v40)
          {
            v41 = v40;
            v72 = v19;
            v74 = v34;
            v76 = v15;
            v78 = v13;
            v42 = *(_QWORD *)v96;
            while (2)
            {
              v43 = 0;
              v44 = v89;
              do
              {
                if (*(_QWORD *)v96 != v42)
                  objc_enumerationMutation(v39);
                v45 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v43);
                objc_msgSend(v90, "objectForKeyedSubscript:", v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v46, "length"))
                {
                  v89 = v46;
                  v37 = v45;
                  goto LABEL_48;
                }
                ++v43;
                v44 = v46;
              }
              while (v41 != v43);
              v89 = v46;
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
              if (v41)
                continue;
              break;
            }
            v37 = 0;
LABEL_48:
            v15 = v76;
            v13 = v78;
            v19 = v72;
            v34 = v74;
          }
          else
          {
            v37 = 0;
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v89, "length"))
          {
            objc_msgSend(a1, "_sanitizedContainerFallbackNameForMangledID:", v10);
            v47 = objc_claimAutoreleasedReturnValue();

            v89 = (void *)v47;
          }

          v33 = v84;
          v35 = v88;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v89, "length"))
        {
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v89, CFSTR("BRContainerName"));
        }
        else
        {

          v37 = 0;
        }
        v48 = bundle;
        v87 = CFBundleCopyBundleLocalizations(bundle);
        if (v37 && -[__CFArray count](v87, "count"))
        {
          v73 = v19;
          v75 = v34;
          v77 = v15;
          v79 = v13;
          v71 = v10;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[__CFArray count](v87, "count"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          context = (void *)MEMORY[0x1A1AD841C]();
          v69 = CFBundleCopyResourceURL(bundle, CFSTR("InfoPlist"), CFSTR("loctable"), 0);
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v69);
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          v51 = v87;
          v52 = -[__CFArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v92;
            do
            {
              for (i = 0; i != v53; ++i)
              {
                if (*(_QWORD *)v92 != v54)
                  objc_enumerationMutation(v51);
                v56 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
                objc_msgSend(v50, "objectForKeyedSubscript:", v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "objectForKeyedSubscript:", v37);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v58, "length"))
                {
                  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v56);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v59, "length"))
                  {
                    v60 = v56;

                    v59 = v60;
                  }
                  objc_msgSend(v49, "setObject:forKeyedSubscript:", v58, v59);

                }
              }
              v53 = -[__CFArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
            }
            while (v53);
          }

          objc_autoreleasePoolPop(context);
          v19 = v73;
          if (objc_msgSend(v49, "count"))
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v49, CFSTR("BRContainerLocalizedNames"));

          v10 = v71;
          v15 = v77;
          v13 = v79;
          v34 = v75;
          v33 = v84;
          v48 = bundle;
          v35 = v88;
        }
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("NSUbiquitousContainerIsDocumentScopePublic"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v61, CFSTR("BRContainerIsDocumentScopePublic"));
          v62 = objc_msgSend(v61, "BOOLValue");
          if (v34)
          {
            if (v62)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v19;
              v65 = MEMORY[0x1A1AD841C]();
              objc_msgSend(v80, "_generateiOSIconsForMangledID:usingBundle:generatedIcons:", v10, v48, v63);
              v66 = (void *)v65;
              v19 = v64;
              objc_autoreleasePoolPop(v66);
              v67 = objc_retainAutorelease(v63);
              *v34 = v67;
              if (objc_msgSend(v67, "count"))
                objc_msgSend(v64, "setObject:forKeyedSubscript:", BRContainerIconGeneratorVersionNumberValue, CFSTR("BRContainerIconGeneratorVersionNumber"));

              v35 = v88;
              v33 = v84;
            }
          }
        }

        v17 = v82;
        v11 = v83;
        v18 = v86;
        goto LABEL_81;
      }

    }
    v30 = 0;
    goto LABEL_30;
  }
  brc_bread_crumbs((uint64_t)"+[BRContainer(BRInternalAdditions) propertiesForMangledID:usingBundle:minimumBundleVersion:bundleIcons:]", 2383);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    +[BRContainer(BRInternalAdditions) versionOfBundle:changedFromVersion:].cold.1();
  v19 = 0;
LABEL_83:

  return v19;
}

- (BOOL)containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:(id)a3 excludedButPreservedExtensions:(id)a4 andStampUploadedAppWithXattr:(BOOL)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  id v25;
  id v26;
  id v27;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  BOOL v34;
  void *v35;
  NSObject *v36;
  void *v38;
  uint64_t v39;
  id v40;
  _BOOL4 v41;
  id v42;
  uint64_t v43;
  int value;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  _QWORD v60[4];

  v41 = a5;
  v60[1] = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v42 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRContainer documentsURL](self, "documentsURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *MEMORY[0x1E0C99A38];
  v60[0] = *MEMORY[0x1E0C99A38];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v9, 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v50;
    v39 = *MEMORY[0x1E0C99B38];
    v15 = v40;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v47 = 0;
        v48 = 0;
        v18 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v48, v43, &v47);
        v19 = v48;
        v20 = v47;
        if (v18 && objc_msgSend(v19, "BOOLValue"))
        {
          if (v41)
          {
            objc_msgSend(v17, "lastPathComponent");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "br_pathExtension");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("app"));

            if (v23)
            {
              v45 = 0;
              v46 = 0;
              v24 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v46, v39, &v45);
              v25 = v46;
              v26 = v45;

              if (v24)
              {
                if (objc_msgSend(v25, "BOOLValue"))
                {
                  value = 7562617;
                  objc_msgSend(v17, "path");
                  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v28 = setxattr((const char *)objc_msgSend(v27, "fileSystemRepresentation"), "com.apple.clouddocs.app-uploaded", &value, 4uLL, 0, 0);

                  if (v28 < 0)
                  {
                    v29 = *__error();
                    brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:excludedButPreservedExtensions:andStampUploadedAppWithXattr:]", 2562);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log(0);
                    v30 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
                    {
                      objc_msgSend(v17, "path");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v54 = v33;
                      v55 = 1024;
                      v56 = v29;
                      v57 = 2112;
                      v58 = v38;
                      _os_log_error_impl(&dword_19CBF0000, v30, (os_log_type_t)0x90u, "[ERROR] can't set uploaded xattr on %@ %{errno}d%@", buf, 0x1Cu);

                    }
                    *__error() = v29;
                  }
                }
              }

              v20 = v26;
            }
            v15 = v40;
          }
        }
        else
        {
          objc_msgSend(v17, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "br_isExcludedButPreservedAtLogOutWithFilenames:extensions:", v15, v42);

          if (v32)
          {
            brc_bread_crumbs((uint64_t)"-[BRContainer(BRInternalAdditions) containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:excludedButPreservedExtensions:andStampUploadedAppWithXattr:]", 2573);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              -[BRContainer(BRInternalAdditions) containsExcludedDocumentsOnTheFSWithExcludedButPreservedFilename:excludedButPreservedExtensions:andStampUploadedAppWithXattr:].cold.1((uint64_t)v17);

            v34 = 1;
            goto LABEL_27;
          }
          objc_msgSend(v11, "skipDescendants");
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v13)
        continue;
      break;
    }
    v34 = 0;
  }
  else
  {
    v34 = 0;
    v15 = v40;
  }
LABEL_27:

  return v34;
}

- (BOOL)registerCurrentProcessAsPriorityHintWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  _QWORD v20[3];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRContainer(BRPriorityHinting) registerCurrentProcessAsPriorityHintWithError:]", 2953, v20);
  brc_bread_crumbs((uint64_t)"-[BRContainer(BRPriorityHinting) registerCurrentProcessAsPriorityHintWithError:]", 2953);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = v20[0];
    -[BRContainer identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx registering current process as a priority hint for %@%@", buf, 0x20u);

  }
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newSyncProxy");

  -[BRContainer identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __80__BRContainer_BRPriorityHinting__registerCurrentProcessAsPriorityHintWithError___block_invoke;
  v18 = &unk_1E3DA7048;
  v10 = v8;
  v19 = v10;
  objc_msgSend(v10, "getContainerURLForID:reply:", v9, &v15);

  objc_msgSend(v10, "error", v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v11)
  {
    objc_msgSend(v10, "error");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  __brc_leave_section((uint64_t)v20);
  return v11 == 0;
}

uint64_t __80__BRContainer_BRPriorityHinting__registerCurrentProcessAsPriorityHintWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a5);
}

+ (void)unregisterCurrentProcessAsPriorityHint
{
  id v2;

  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)initWithMangledID:(uint64_t)a1 dataRepresentation:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] creating container metadata for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)initWithMangledID:dataRepresentation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: mangledID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__BRContainer_accessPropertiesInBlock___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v1, v2, "[ERROR] Can't read data: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] not a synced image size%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_imageDataForSize:scale:isiOSIcon:shouldTransformToAppIcon:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] no image found for the given size%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_imageDataForSize:(_BYTE *)a1 scale:isiOSIcon:shouldTransformToAppIcon:.cold.3(_BYTE *a1)
{
  const __CFString *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = CFSTR("should be transformed to app icon");
  if (!*a1)
    v1 = CFSTR("is an app icon");
  LODWORD(v4) = 138412546;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v2, v3, "[DEBUG] image returned %@%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_1();
}

- (void)_imageDataForSize:(_BYTE *)a1 scale:isiOSIcon:shouldTransformToAppIcon:.cold.4(_BYTE *a1)
{
  const __CFString *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = CFSTR("is");
  if (!*a1)
    v1 = CFSTR("isn't");
  LODWORD(v4) = 138412546;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v2, v3, "[DEBUG] image returned %@ an iOS icon%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_1();
}

void __55__BRContainer_forceRefreshAllContainersWithCompletion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v1, v2, "[ERROR] error forcing refresh on all containers: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "documentsURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, a3, v6, "[DEBUG] this container has been moved to CloudDocs, unlinking the folder at %@%@", v7);

}

void __83__BRContainer_BRFinderInternalAdditions__deleteAllContentsOnClientAndServer_error___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9_3(&dword_19CBF0000, v2, (uint64_t)v2, "[CRIT] asking to delete all contents of %@%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __93__BRContainer_BRInternalAdditions__updateMetadataWithExtractorProperties_iconPaths_bundleID___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] created plist for container %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
