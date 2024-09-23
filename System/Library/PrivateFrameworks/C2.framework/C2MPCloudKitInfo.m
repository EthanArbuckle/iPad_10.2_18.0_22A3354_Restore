@implementation C2MPCloudKitInfo

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientProcessVersion;
  NSString *clientBundleId;
  NSString *container;
  NSString *environment;
  void *v9;
  NSString *containerScopedUserIdentifier;
  NSString *containerScopedDeviceIdentifier;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  NSString *databaseScope;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char has;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientProcessVersion = self->_clientProcessVersion;
  if (clientProcessVersion)
    objc_msgSend(v3, "setObject:forKey:", clientProcessVersion, CFSTR("client_process_version"));
  clientBundleId = self->_clientBundleId;
  if (clientBundleId)
    objc_msgSend(v4, "setObject:forKey:", clientBundleId, CFSTR("client_bundle_id"));
  container = self->_container;
  if (container)
    objc_msgSend(v4, "setObject:forKey:", container, CFSTR("container"));
  environment = self->_environment;
  if (environment)
    objc_msgSend(v4, "setObject:forKey:", environment, CFSTR("environment"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_anonymous);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("anonymous"));

  }
  containerScopedUserIdentifier = self->_containerScopedUserIdentifier;
  if (containerScopedUserIdentifier)
    objc_msgSend(v4, "setObject:forKey:", containerScopedUserIdentifier, CFSTR("containerScopedUserIdentifier"));
  containerScopedDeviceIdentifier = self->_containerScopedDeviceIdentifier;
  if (containerScopedDeviceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", containerScopedDeviceIdentifier, CFSTR("containerScopedDeviceIdentifier"));
  applicationBundleIdentifierOverrideForContainerAccess = self->_applicationBundleIdentifierOverrideForContainerAccess;
  if (applicationBundleIdentifierOverrideForContainerAccess)
    objc_msgSend(v4, "setObject:forKey:", applicationBundleIdentifierOverrideForContainerAccess, CFSTR("applicationBundleIdentifierOverrideForContainerAccess"));
  applicationBundleIdentifierOverrideForNetworkAttribution = self->_applicationBundleIdentifierOverrideForNetworkAttribution;
  if (applicationBundleIdentifierOverrideForNetworkAttribution)
    objc_msgSend(v4, "setObject:forKey:", applicationBundleIdentifierOverrideForNetworkAttribution, CFSTR("applicationBundleIdentifierOverrideForNetworkAttribution"));
  databaseScope = self->_databaseScope;
  if (databaseScope)
    objc_msgSend(v4, "setObject:forKey:", databaseScope, CFSTR("database_scope"));
  if (-[NSMutableArray count](self->_operationGroups, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_operationGroups, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v16 = self->_operationGroups;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("operation_group"));
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_reportOperationGroupFrequency);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("report_operation_group_frequency"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_reportOperationGroupFrequencyBase);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("report_operation_group_frequency_base"));

  }
  if (-[NSMutableArray count](self->_clientOperations, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_clientOperations, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v26 = self->_clientOperations;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v36);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("client_operation"));
  }
  v32 = (char)self->_has;
  if ((v32 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_reportClientOperationFrequency);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("report_client_operation_frequency"));

    v32 = (char)self->_has;
  }
  if ((v32 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_reportClientOperationFrequencyBase);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("report_client_operation_frequency_base"));

  }
  return v4;
}

- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_reportOperationGroupFrequencyBase = a3;
}

- (void)setReportOperationGroupFrequency:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_reportOperationGroupFrequency = a3;
}

- (void)setReportClientOperationFrequencyBase:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reportClientOperationFrequencyBase = a3;
}

- (void)setReportClientOperationFrequency:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reportClientOperationFrequency = a3;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void)setDatabaseScope:(id)a3
{
  objc_storeStrong((id *)&self->_databaseScope, a3);
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (void)setClientProcessVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientProcessVersion, a3);
}

- (void)setClientBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleId, a3);
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, a3);
}

- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, a3);
}

- (void)setAnonymous:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_anonymous = a3;
}

- (void)setContainerScopedUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerScopedUserIdentifier, a3);
}

- (void)setContainerScopedDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerScopedDeviceIdentifier, a3);
}

- (unint64_t)operationGroupsCount
{
  return -[NSMutableArray count](self->_operationGroups, "count");
}

- (NSString)container
{
  return self->_container;
}

- (NSMutableArray)operationGroups
{
  return self->_operationGroups;
}

- (void)addOperationGroup:(id)a3
{
  id v4;
  NSMutableArray *operationGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  operationGroups = self->_operationGroups;
  v8 = v4;
  if (!operationGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_operationGroups;
    self->_operationGroups = v6;

    v4 = v8;
    operationGroups = self->_operationGroups;
  }
  -[NSMutableArray addObject:](operationGroups, "addObject:", v4);

}

- (void)addClientOperation:(id)a3
{
  id v4;
  NSMutableArray *clientOperations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clientOperations = self->_clientOperations;
  v8 = v4;
  if (!clientOperations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clientOperations;
    self->_clientOperations = v6;

    v4 = v8;
    clientOperations = self->_clientOperations;
  }
  -[NSMutableArray addObject:](clientOperations, "addObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroups, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_databaseScope, 0);
  objc_storeStrong((id *)&self->_containerScopedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_containerScopedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_clientProcessVersion, 0);
  objc_storeStrong((id *)&self->_clientOperations, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_clientProcessVersion)
    PBDataWriterWriteStringField();
  if (self->_clientBundleId)
    PBDataWriterWriteStringField();
  if (self->_container)
    PBDataWriterWriteStringField();
  if (self->_environment)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_containerScopedUserIdentifier)
    PBDataWriterWriteStringField();
  if (self->_containerScopedDeviceIdentifier)
    PBDataWriterWriteStringField();
  if (self->_applicationBundleIdentifierOverrideForContainerAccess)
    PBDataWriterWriteStringField();
  if (self->_applicationBundleIdentifierOverrideForNetworkAttribution)
    PBDataWriterWriteStringField();
  if (self->_databaseScope)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_operationGroups;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteUint64Field();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_clientOperations;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = (char)self->_has;
  if ((v16 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0)
    PBDataWriterWriteUint64Field();

}

- (BOOL)hasClientProcessVersion
{
  return self->_clientProcessVersion != 0;
}

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0;
}

- (BOOL)hasContainer
{
  return self->_container != 0;
}

- (BOOL)hasEnvironment
{
  return self->_environment != 0;
}

- (void)setHasAnonymous:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAnonymous
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasContainerScopedUserIdentifier
{
  return self->_containerScopedUserIdentifier != 0;
}

- (BOOL)hasContainerScopedDeviceIdentifier
{
  return self->_containerScopedDeviceIdentifier != 0;
}

- (BOOL)hasApplicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess != 0;
}

- (BOOL)hasApplicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution != 0;
}

- (BOOL)hasDatabaseScope
{
  return self->_databaseScope != 0;
}

- (void)clearOperationGroups
{
  -[NSMutableArray removeAllObjects](self->_operationGroups, "removeAllObjects");
}

- (id)operationGroupAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_operationGroups, "objectAtIndex:", a3);
}

+ (Class)operationGroupType
{
  return (Class)objc_opt_class();
}

- (void)setHasReportOperationGroupFrequency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReportOperationGroupFrequency
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasReportOperationGroupFrequencyBase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReportOperationGroupFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearClientOperations
{
  -[NSMutableArray removeAllObjects](self->_clientOperations, "removeAllObjects");
}

- (unint64_t)clientOperationsCount
{
  return -[NSMutableArray count](self->_clientOperations, "count");
}

- (id)clientOperationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clientOperations, "objectAtIndex:", a3);
}

+ (Class)clientOperationType
{
  return (Class)objc_opt_class();
}

- (void)setHasReportClientOperationFrequency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReportClientOperationFrequency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReportClientOperationFrequencyBase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportClientOperationFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)C2MPCloudKitInfo;
  -[C2MPCloudKitInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPCloudKitInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPCloudKitInfoReadFrom(self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  char v14;
  _BYTE *v15;

  v4 = a3;
  v15 = v4;
  if (self->_clientProcessVersion)
  {
    objc_msgSend(v4, "setClientProcessVersion:");
    v4 = v15;
  }
  if (self->_clientBundleId)
  {
    objc_msgSend(v15, "setClientBundleId:");
    v4 = v15;
  }
  if (self->_container)
  {
    objc_msgSend(v15, "setContainer:");
    v4 = v15;
  }
  if (self->_environment)
  {
    objc_msgSend(v15, "setEnvironment:");
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[128] = self->_anonymous;
    v4[132] |= 0x10u;
  }
  if (self->_containerScopedUserIdentifier)
    objc_msgSend(v15, "setContainerScopedUserIdentifier:");
  if (self->_containerScopedDeviceIdentifier)
    objc_msgSend(v15, "setContainerScopedDeviceIdentifier:");
  if (self->_applicationBundleIdentifierOverrideForContainerAccess)
    objc_msgSend(v15, "setApplicationBundleIdentifierOverrideForContainerAccess:");
  if (self->_applicationBundleIdentifierOverrideForNetworkAttribution)
    objc_msgSend(v15, "setApplicationBundleIdentifierOverrideForNetworkAttribution:");
  if (self->_databaseScope)
    objc_msgSend(v15, "setDatabaseScope:");
  if (-[C2MPCloudKitInfo operationGroupsCount](self, "operationGroupsCount"))
  {
    objc_msgSend(v15, "clearOperationGroups");
    v5 = -[C2MPCloudKitInfo operationGroupsCount](self, "operationGroupsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[C2MPCloudKitInfo operationGroupAtIndex:](self, "operationGroupAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addOperationGroup:", v8);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v15 + 3) = self->_reportOperationGroupFrequency;
    v15[132] |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_QWORD *)v15 + 4) = self->_reportOperationGroupFrequencyBase;
    v15[132] |= 8u;
  }
  if (-[C2MPCloudKitInfo clientOperationsCount](self, "clientOperationsCount"))
  {
    objc_msgSend(v15, "clearClientOperations");
    v10 = -[C2MPCloudKitInfo clientOperationsCount](self, "clientOperationsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[C2MPCloudKitInfo clientOperationAtIndex:](self, "clientOperationAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addClientOperation:", v13);

      }
    }
  }
  v14 = (char)self->_has;
  if ((v14 & 1) != 0)
  {
    *((_QWORD *)v15 + 1) = self->_reportClientOperationFrequency;
    v15[132] |= 1u;
    v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *((_QWORD *)v15 + 2) = self->_reportClientOperationFrequencyBase;
    v15[132] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  char has;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  char v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientProcessVersion, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  v8 = -[NSString copyWithZone:](self->_clientBundleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_container, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v10;

  v12 = -[NSString copyWithZone:](self->_environment, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v12;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 128) = self->_anonymous;
    *(_BYTE *)(v5 + 132) |= 0x10u;
  }
  v14 = -[NSString copyWithZone:](self->_containerScopedUserIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v14;

  v16 = -[NSString copyWithZone:](self->_containerScopedDeviceIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v16;

  v18 = -[NSString copyWithZone:](self->_applicationBundleIdentifierOverrideForContainerAccess, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  v20 = -[NSString copyWithZone:](self->_applicationBundleIdentifierOverrideForNetworkAttribution, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v20;

  v22 = -[NSString copyWithZone:](self->_databaseScope, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v22;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v24 = self->_operationGroups;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOperationGroup:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v26);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_reportOperationGroupFrequency;
    *(_BYTE *)(v5 + 132) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_reportOperationGroupFrequencyBase;
    *(_BYTE *)(v5 + 132) |= 8u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v31 = self->_clientOperations;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v39);
        objc_msgSend((id)v5, "addClientOperation:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v33);
  }

  v37 = (char)self->_has;
  if ((v37 & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_reportClientOperationFrequency;
    *(_BYTE *)(v5 + 132) |= 1u;
    v37 = (char)self->_has;
  }
  if ((v37 & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_reportClientOperationFrequencyBase;
    *(_BYTE *)(v5 + 132) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientProcessVersion;
  NSString *clientBundleId;
  NSString *container;
  NSString *environment;
  NSString *containerScopedUserIdentifier;
  NSString *containerScopedDeviceIdentifier;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  NSString *databaseScope;
  NSMutableArray *operationGroups;
  char has;
  NSMutableArray *clientOperations;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  clientProcessVersion = self->_clientProcessVersion;
  if ((unint64_t)clientProcessVersion | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](clientProcessVersion, "isEqual:"))
      goto LABEL_52;
  }
  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](clientBundleId, "isEqual:"))
      goto LABEL_52;
  }
  container = self->_container;
  if ((unint64_t)container | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](container, "isEqual:"))
      goto LABEL_52;
  }
  environment = self->_environment;
  if ((unint64_t)environment | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](environment, "isEqual:"))
      goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 0x10) == 0)
      goto LABEL_52;
    if (self->_anonymous)
    {
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 128))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 132) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  containerScopedUserIdentifier = self->_containerScopedUserIdentifier;
  if ((unint64_t)containerScopedUserIdentifier | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](containerScopedUserIdentifier, "isEqual:"))
  {
    goto LABEL_52;
  }
  containerScopedDeviceIdentifier = self->_containerScopedDeviceIdentifier;
  if ((unint64_t)containerScopedDeviceIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](containerScopedDeviceIdentifier, "isEqual:"))
      goto LABEL_52;
  }
  applicationBundleIdentifierOverrideForContainerAccess = self->_applicationBundleIdentifierOverrideForContainerAccess;
  if ((unint64_t)applicationBundleIdentifierOverrideForContainerAccess | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](applicationBundleIdentifierOverrideForContainerAccess, "isEqual:"))
      goto LABEL_52;
  }
  applicationBundleIdentifierOverrideForNetworkAttribution = self->_applicationBundleIdentifierOverrideForNetworkAttribution;
  if ((unint64_t)applicationBundleIdentifierOverrideForNetworkAttribution | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](applicationBundleIdentifierOverrideForNetworkAttribution, "isEqual:"))
      goto LABEL_52;
  }
  databaseScope = self->_databaseScope;
  if ((unint64_t)databaseScope | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](databaseScope, "isEqual:"))
      goto LABEL_52;
  }
  operationGroups = self->_operationGroups;
  if ((unint64_t)operationGroups | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](operationGroups, "isEqual:"))
      goto LABEL_52;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 4) == 0 || self->_reportOperationGroupFrequency != *((_QWORD *)v4 + 3))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 132) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 8) == 0 || self->_reportOperationGroupFrequencyBase != *((_QWORD *)v4 + 4))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 132) & 8) != 0)
  {
    goto LABEL_52;
  }
  clientOperations = self->_clientOperations;
  if ((unint64_t)clientOperations | *((_QWORD *)v4 + 8))
  {
    if (-[NSMutableArray isEqual:](clientOperations, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_43;
    }
LABEL_52:
    v17 = 0;
    goto LABEL_53;
  }
LABEL_43:
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 1) == 0 || self->_reportClientOperationFrequency != *((_QWORD *)v4 + 1))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 132) & 1) != 0)
  {
    goto LABEL_52;
  }
  v17 = (*((_BYTE *)v4 + 132) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 132) & 2) == 0 || self->_reportClientOperationFrequencyBase != *((_QWORD *)v4 + 2))
      goto LABEL_52;
    v17 = 1;
  }
LABEL_53:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;

  v19 = -[NSString hash](self->_clientProcessVersion, "hash");
  v18 = -[NSString hash](self->_clientBundleId, "hash");
  v17 = -[NSString hash](self->_container, "hash");
  v16 = -[NSString hash](self->_environment, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v15 = 2654435761 * self->_anonymous;
  else
    v15 = 0;
  v14 = -[NSString hash](self->_containerScopedUserIdentifier, "hash");
  v3 = -[NSString hash](self->_containerScopedDeviceIdentifier, "hash");
  v4 = -[NSString hash](self->_applicationBundleIdentifierOverrideForContainerAccess, "hash");
  v5 = -[NSString hash](self->_applicationBundleIdentifierOverrideForNetworkAttribution, "hash");
  v6 = -[NSString hash](self->_databaseScope, "hash");
  v7 = -[NSMutableArray hash](self->_operationGroups, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v8 = 2654435761u * self->_reportOperationGroupFrequency;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v9 = 2654435761u * self->_reportOperationGroupFrequencyBase;
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_9:
  v10 = -[NSMutableArray hash](self->_clientOperations, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v11 = 2654435761u * self->_reportClientOperationFrequency;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_11;
LABEL_13:
    v12 = 0;
    return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_11:
  v12 = 2654435761u * self->_reportClientOperationFrequencyBase;
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 9))
    -[C2MPCloudKitInfo setClientProcessVersion:](self, "setClientProcessVersion:");
  if (*((_QWORD *)v4 + 7))
    -[C2MPCloudKitInfo setClientBundleId:](self, "setClientBundleId:");
  if (*((_QWORD *)v4 + 10))
    -[C2MPCloudKitInfo setContainer:](self, "setContainer:");
  if (*((_QWORD *)v4 + 14))
    -[C2MPCloudKitInfo setEnvironment:](self, "setEnvironment:");
  if ((*((_BYTE *)v4 + 132) & 0x10) != 0)
  {
    self->_anonymous = *((_BYTE *)v4 + 128);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 12))
    -[C2MPCloudKitInfo setContainerScopedUserIdentifier:](self, "setContainerScopedUserIdentifier:");
  if (*((_QWORD *)v4 + 11))
    -[C2MPCloudKitInfo setContainerScopedDeviceIdentifier:](self, "setContainerScopedDeviceIdentifier:");
  if (*((_QWORD *)v4 + 5))
    -[C2MPCloudKitInfo setApplicationBundleIdentifierOverrideForContainerAccess:](self, "setApplicationBundleIdentifierOverrideForContainerAccess:");
  if (*((_QWORD *)v4 + 6))
    -[C2MPCloudKitInfo setApplicationBundleIdentifierOverrideForNetworkAttribution:](self, "setApplicationBundleIdentifierOverrideForNetworkAttribution:");
  if (*((_QWORD *)v4 + 13))
    -[C2MPCloudKitInfo setDatabaseScope:](self, "setDatabaseScope:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *((id *)v4 + 15);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        -[C2MPCloudKitInfo addOperationGroup:](self, "addOperationGroup:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 132);
  if ((v10 & 4) != 0)
  {
    self->_reportOperationGroupFrequency = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v10 = *((_BYTE *)v4 + 132);
  }
  if ((v10 & 8) != 0)
  {
    self->_reportOperationGroupFrequencyBase = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *((id *)v4 + 8);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[C2MPCloudKitInfo addClientOperation:](self, "addClientOperation:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = *((_BYTE *)v4 + 132);
  if ((v16 & 1) != 0)
  {
    self->_reportClientOperationFrequency = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v16 = *((_BYTE *)v4 + 132);
  }
  if ((v16 & 2) != 0)
  {
    self->_reportClientOperationFrequencyBase = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)clientProcessVersion
{
  return self->_clientProcessVersion;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSString)environment
{
  return self->_environment;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (NSString)containerScopedUserIdentifier
{
  return self->_containerScopedUserIdentifier;
}

- (NSString)containerScopedDeviceIdentifier
{
  return self->_containerScopedDeviceIdentifier;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (NSString)databaseScope
{
  return self->_databaseScope;
}

- (void)setOperationGroups:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroups, a3);
}

- (unint64_t)reportOperationGroupFrequency
{
  return self->_reportOperationGroupFrequency;
}

- (unint64_t)reportOperationGroupFrequencyBase
{
  return self->_reportOperationGroupFrequencyBase;
}

- (NSMutableArray)clientOperations
{
  return self->_clientOperations;
}

- (void)setClientOperations:(id)a3
{
  objc_storeStrong((id *)&self->_clientOperations, a3);
}

- (unint64_t)reportClientOperationFrequency
{
  return self->_reportClientOperationFrequency;
}

- (unint64_t)reportClientOperationFrequencyBase
{
  return self->_reportClientOperationFrequencyBase;
}

@end
