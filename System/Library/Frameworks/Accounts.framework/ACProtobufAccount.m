@implementation ACProtobufAccount

- (BOOL)hasCredential
{
  return self->_credential != 0;
}

- (BOOL)hasAccountDescription
{
  return self->_accountDescription != 0;
}

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (void)clearProperties
{
  -[NSMutableArray removeAllObjects](self->_properties, "removeAllObjects");
}

- (void)addProperties:(id)a3
{
  id v4;
  NSMutableArray *properties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  properties = self->_properties;
  v8 = v4;
  if (!properties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_properties;
    self->_properties = v6;

    v4 = v8;
    properties = self->_properties;
  }
  -[NSMutableArray addObject:](properties, "addObject:", v4);

}

- (unint64_t)propertiesCount
{
  return -[NSMutableArray count](self->_properties, "count");
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_properties, "objectAtIndex:", a3);
}

+ (Class)propertiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLastCredentialRenewalRejectionDate
{
  return self->_lastCredentialRenewalRejectionDate != 0;
}

- (void)clearDataclassProperties
{
  -[NSMutableArray removeAllObjects](self->_dataclassProperties, "removeAllObjects");
}

- (void)addDataclassProperties:(id)a3
{
  id v4;
  NSMutableArray *dataclassProperties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dataclassProperties = self->_dataclassProperties;
  v8 = v4;
  if (!dataclassProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dataclassProperties;
    self->_dataclassProperties = v6;

    v4 = v8;
    dataclassProperties = self->_dataclassProperties;
  }
  -[NSMutableArray addObject:](dataclassProperties, "addObject:", v4);

}

- (unint64_t)dataclassPropertiesCount
{
  return -[NSMutableArray count](self->_dataclassProperties, "count");
}

- (id)dataclassPropertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dataclassProperties, "objectAtIndex:", a3);
}

+ (Class)dataclassPropertiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasObjectID
{
  return self->_objectID != 0;
}

- (BOOL)hasParentAccount
{
  return self->_parentAccount != 0;
}

- (void)clearEnabledDataclasses
{
  -[NSMutableArray removeAllObjects](self->_enabledDataclasses, "removeAllObjects");
}

- (void)addEnabledDataclasses:(id)a3
{
  id v4;
  NSMutableArray *enabledDataclasses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  enabledDataclasses = self->_enabledDataclasses;
  v8 = v4;
  if (!enabledDataclasses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_enabledDataclasses;
    self->_enabledDataclasses = v6;

    v4 = v8;
    enabledDataclasses = self->_enabledDataclasses;
  }
  -[NSMutableArray addObject:](enabledDataclasses, "addObject:", v4);

}

- (unint64_t)enabledDataclassesCount
{
  return -[NSMutableArray count](self->_enabledDataclasses, "count");
}

- (id)enabledDataclassesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_enabledDataclasses, "objectAtIndex:", a3);
}

+ (Class)enabledDataclassesType
{
  return (Class)objc_opt_class();
}

- (void)clearProvisionedDataclasses
{
  -[NSMutableArray removeAllObjects](self->_provisionedDataclasses, "removeAllObjects");
}

- (void)addProvisionedDataclasses:(id)a3
{
  id v4;
  NSMutableArray *provisionedDataclasses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  provisionedDataclasses = self->_provisionedDataclasses;
  v8 = v4;
  if (!provisionedDataclasses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_provisionedDataclasses;
    self->_provisionedDataclasses = v6;

    v4 = v8;
    provisionedDataclasses = self->_provisionedDataclasses;
  }
  -[NSMutableArray addObject:](provisionedDataclasses, "addObject:", v4);

}

- (unint64_t)provisionedDataclassesCount
{
  return -[NSMutableArray count](self->_provisionedDataclasses, "count");
}

- (id)provisionedDataclassesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_provisionedDataclasses, "objectAtIndex:", a3);
}

+ (Class)provisionedDataclassesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAuthenticationType
{
  return self->_authenticationType != 0;
}

- (BOOL)hasCredentialType
{
  return self->_credentialType != 0;
}

- (BOOL)hasDate
{
  return self->_date != 0;
}

- (BOOL)hasOwningBundleID
{
  return self->_owningBundleID != 0;
}

- (void)clearDirtyProperties
{
  -[NSMutableArray removeAllObjects](self->_dirtyProperties, "removeAllObjects");
}

- (void)addDirtyProperties:(id)a3
{
  id v4;
  NSMutableArray *dirtyProperties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  v8 = v4;
  if (!dirtyProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  -[NSMutableArray addObject:](dirtyProperties, "addObject:", v4);

}

- (unint64_t)dirtyPropertiesCount
{
  return -[NSMutableArray count](self->_dirtyProperties, "count");
}

- (id)dirtyPropertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dirtyProperties, "objectAtIndex:", a3);
}

+ (Class)dirtyPropertiesType
{
  return (Class)objc_opt_class();
}

- (void)clearDirtyAccountProperties
{
  -[NSMutableArray removeAllObjects](self->_dirtyAccountProperties, "removeAllObjects");
}

- (void)addDirtyAccountProperties:(id)a3
{
  id v4;
  NSMutableArray *dirtyAccountProperties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dirtyAccountProperties = self->_dirtyAccountProperties;
  v8 = v4;
  if (!dirtyAccountProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dirtyAccountProperties;
    self->_dirtyAccountProperties = v6;

    v4 = v8;
    dirtyAccountProperties = self->_dirtyAccountProperties;
  }
  -[NSMutableArray addObject:](dirtyAccountProperties, "addObject:", v4);

}

- (unint64_t)dirtyAccountPropertiesCount
{
  return -[NSMutableArray count](self->_dirtyAccountProperties, "count");
}

- (id)dirtyAccountPropertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dirtyAccountProperties, "objectAtIndex:", a3);
}

+ (Class)dirtyAccountPropertiesType
{
  return (Class)objc_opt_class();
}

- (void)clearDirtyDataclassProperties
{
  -[NSMutableArray removeAllObjects](self->_dirtyDataclassProperties, "removeAllObjects");
}

- (void)addDirtyDataclassProperties:(id)a3
{
  id v4;
  NSMutableArray *dirtyDataclassProperties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dirtyDataclassProperties = self->_dirtyDataclassProperties;
  v8 = v4;
  if (!dirtyDataclassProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dirtyDataclassProperties;
    self->_dirtyDataclassProperties = v6;

    v4 = v8;
    dirtyDataclassProperties = self->_dirtyDataclassProperties;
  }
  -[NSMutableArray addObject:](dirtyDataclassProperties, "addObject:", v4);

}

- (unint64_t)dirtyDataclassPropertiesCount
{
  return -[NSMutableArray count](self->_dirtyDataclassProperties, "count");
}

- (id)dirtyDataclassPropertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dirtyDataclassProperties, "objectAtIndex:", a3);
}

+ (Class)dirtyDataclassPropertiesType
{
  return (Class)objc_opt_class();
}

- (void)setWarmingUp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_warmingUp = a3;
}

- (void)setHasWarmingUp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWarmingUp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasModificationID
{
  return self->_modificationID != 0;
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
  v8.super_class = (Class)ACProtobufAccount;
  -[ACProtobufAccount description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACProtobufAccount dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ACProtobufAccountType *accountType;
  void *v5;
  ACProtobufAccountCredential *credential;
  void *v7;
  NSString *identifier;
  NSString *accountDescription;
  NSString *username;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  ACProtobufDate *lastCredentialRenewalRejectionDate;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  ACProtobufURL *objectID;
  void *v32;
  ACProtobufAccount *parentAccount;
  void *v34;
  NSMutableArray *enabledDataclasses;
  NSMutableArray *provisionedDataclasses;
  NSString *authenticationType;
  NSString *credentialType;
  ACProtobufDate *date;
  void *v40;
  NSString *owningBundleID;
  NSMutableArray *dirtyProperties;
  NSMutableArray *dirtyAccountProperties;
  NSMutableArray *dirtyDataclassProperties;
  void *v45;
  NSString *modificationID;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accountType = self->_accountType;
  if (accountType)
  {
    -[ACProtobufAccountType dictionaryRepresentation](accountType, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("accountType"));

  }
  credential = self->_credential;
  if (credential)
  {
    -[ACProtobufAccountCredential dictionaryRepresentation](credential, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("credential"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  accountDescription = self->_accountDescription;
  if (accountDescription)
    objc_msgSend(v3, "setObject:forKey:", accountDescription, CFSTR("accountDescription"));
  username = self->_username;
  if (username)
    objc_msgSend(v3, "setObject:forKey:", username, CFSTR("username"));
  if (-[NSMutableArray count](self->_properties, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_properties, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = self->_properties;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v53 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("properties"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_authenticated);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("authenticated"));

  lastCredentialRenewalRejectionDate = self->_lastCredentialRenewalRejectionDate;
  if (lastCredentialRenewalRejectionDate)
  {
    -[ACProtobufDate dictionaryRepresentation](lastCredentialRenewalRejectionDate, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("lastCredentialRenewalRejectionDate"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_active);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("active"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_visible);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("visible"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAuthentication);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("supportsAuthentication"));

  if (-[NSMutableArray count](self->_dataclassProperties, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_dataclassProperties, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v25 = self->_dataclassProperties;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v49 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v48);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("dataclassProperties"));
  }
  objectID = self->_objectID;
  if (objectID)
  {
    -[ACProtobufURL dictionaryRepresentation](objectID, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("objectID"));

  }
  parentAccount = self->_parentAccount;
  if (parentAccount)
  {
    -[ACProtobufAccount dictionaryRepresentation](parentAccount, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("parentAccount"));

  }
  enabledDataclasses = self->_enabledDataclasses;
  if (enabledDataclasses)
    objc_msgSend(v3, "setObject:forKey:", enabledDataclasses, CFSTR("enabledDataclasses"));
  provisionedDataclasses = self->_provisionedDataclasses;
  if (provisionedDataclasses)
    objc_msgSend(v3, "setObject:forKey:", provisionedDataclasses, CFSTR("provisionedDataclasses"));
  authenticationType = self->_authenticationType;
  if (authenticationType)
    objc_msgSend(v3, "setObject:forKey:", authenticationType, CFSTR("authenticationType"));
  credentialType = self->_credentialType;
  if (credentialType)
    objc_msgSend(v3, "setObject:forKey:", credentialType, CFSTR("credentialType"));
  date = self->_date;
  if (date)
  {
    -[ACProtobufDate dictionaryRepresentation](date, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("date"));

  }
  owningBundleID = self->_owningBundleID;
  if (owningBundleID)
    objc_msgSend(v3, "setObject:forKey:", owningBundleID, CFSTR("owningBundleID"));
  dirtyProperties = self->_dirtyProperties;
  if (dirtyProperties)
    objc_msgSend(v3, "setObject:forKey:", dirtyProperties, CFSTR("dirtyProperties"));
  dirtyAccountProperties = self->_dirtyAccountProperties;
  if (dirtyAccountProperties)
    objc_msgSend(v3, "setObject:forKey:", dirtyAccountProperties, CFSTR("dirtyAccountProperties"));
  dirtyDataclassProperties = self->_dirtyDataclassProperties;
  if (dirtyDataclassProperties)
    objc_msgSend(v3, "setObject:forKey:", dirtyDataclassProperties, CFSTR("dirtyDataclassProperties"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_warmingUp);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("warmingUp"));

  }
  modificationID = self->_modificationID;
  if (modificationID)
    objc_msgSend(v3, "setObject:forKey:", modificationID, CFSTR("modificationID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufAccountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteSubmessage();
  if (self->_credential)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteStringField();
  if (self->_accountDescription)
    PBDataWriterWriteStringField();
  if (self->_username)
    PBDataWriterWriteStringField();
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v5 = self->_properties;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v65;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v65 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v7);
  }

  PBDataWriterWriteBOOLField();
  if (self->_lastCredentialRenewalRejectionDate)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v10 = self->_dataclassProperties;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v61;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v61 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v12);
  }

  if (self->_objectID)
    PBDataWriterWriteSubmessage();
  if (self->_parentAccount)
    PBDataWriterWriteSubmessage();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v15 = self->_enabledDataclasses;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v57;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v57 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    }
    while (v17);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v20 = self->_provisionedDataclasses;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v53;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
    }
    while (v22);
  }

  if (self->_authenticationType)
    PBDataWriterWriteStringField();
  if (self->_credentialType)
    PBDataWriterWriteStringField();
  if (self->_date)
    PBDataWriterWriteSubmessage();
  if (self->_owningBundleID)
    PBDataWriterWriteStringField();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v25 = self->_dirtyProperties;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v49;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v49 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
    }
    while (v27);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v30 = self->_dirtyAccountProperties;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v44, v69, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v45;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v45 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteStringField();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v44, v69, 16);
    }
    while (v32);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v35 = self->_dirtyDataclassProperties;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v40, v68, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v41;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v41 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteStringField();
        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v40, v68, 16);
    }
    while (v37);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_modificationID)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  void *v33;
  _BYTE *v34;

  v34 = a3;
  objc_msgSend(v34, "setAccountType:", self->_accountType);
  if (self->_credential)
    objc_msgSend(v34, "setCredential:");
  objc_msgSend(v34, "setIdentifier:", self->_identifier);
  if (self->_accountDescription)
    objc_msgSend(v34, "setAccountDescription:");
  if (self->_username)
    objc_msgSend(v34, "setUsername:");
  if (-[ACProtobufAccount propertiesCount](self, "propertiesCount"))
  {
    objc_msgSend(v34, "clearProperties");
    v4 = -[ACProtobufAccount propertiesCount](self, "propertiesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ACProtobufAccount propertiesAtIndex:](self, "propertiesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addProperties:", v7);

      }
    }
  }
  v8 = v34;
  v34[169] = self->_authenticated;
  if (self->_lastCredentialRenewalRejectionDate)
  {
    objc_msgSend(v34, "setLastCredentialRenewalRejectionDate:");
    v8 = v34;
  }
  v8[168] = self->_active;
  v8[171] = self->_visible;
  v8[170] = self->_supportsAuthentication;
  if (-[ACProtobufAccount dataclassPropertiesCount](self, "dataclassPropertiesCount"))
  {
    objc_msgSend(v34, "clearDataclassProperties");
    v9 = -[ACProtobufAccount dataclassPropertiesCount](self, "dataclassPropertiesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[ACProtobufAccount dataclassPropertiesAtIndex:](self, "dataclassPropertiesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addDataclassProperties:", v12);

      }
    }
  }
  if (self->_objectID)
    objc_msgSend(v34, "setObjectID:");
  if (self->_parentAccount)
    objc_msgSend(v34, "setParentAccount:");
  if (-[ACProtobufAccount enabledDataclassesCount](self, "enabledDataclassesCount"))
  {
    objc_msgSend(v34, "clearEnabledDataclasses");
    v13 = -[ACProtobufAccount enabledDataclassesCount](self, "enabledDataclassesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[ACProtobufAccount enabledDataclassesAtIndex:](self, "enabledDataclassesAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addEnabledDataclasses:", v16);

      }
    }
  }
  if (-[ACProtobufAccount provisionedDataclassesCount](self, "provisionedDataclassesCount"))
  {
    objc_msgSend(v34, "clearProvisionedDataclasses");
    v17 = -[ACProtobufAccount provisionedDataclassesCount](self, "provisionedDataclassesCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[ACProtobufAccount provisionedDataclassesAtIndex:](self, "provisionedDataclassesAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addProvisionedDataclasses:", v20);

      }
    }
  }
  if (self->_authenticationType)
    objc_msgSend(v34, "setAuthenticationType:");
  if (self->_credentialType)
    objc_msgSend(v34, "setCredentialType:");
  if (self->_date)
    objc_msgSend(v34, "setDate:");
  if (self->_owningBundleID)
    objc_msgSend(v34, "setOwningBundleID:");
  if (-[ACProtobufAccount dirtyPropertiesCount](self, "dirtyPropertiesCount"))
  {
    objc_msgSend(v34, "clearDirtyProperties");
    v21 = -[ACProtobufAccount dirtyPropertiesCount](self, "dirtyPropertiesCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[ACProtobufAccount dirtyPropertiesAtIndex:](self, "dirtyPropertiesAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addDirtyProperties:", v24);

      }
    }
  }
  if (-[ACProtobufAccount dirtyAccountPropertiesCount](self, "dirtyAccountPropertiesCount"))
  {
    objc_msgSend(v34, "clearDirtyAccountProperties");
    v25 = -[ACProtobufAccount dirtyAccountPropertiesCount](self, "dirtyAccountPropertiesCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[ACProtobufAccount dirtyAccountPropertiesAtIndex:](self, "dirtyAccountPropertiesAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addDirtyAccountProperties:", v28);

      }
    }
  }
  if (-[ACProtobufAccount dirtyDataclassPropertiesCount](self, "dirtyDataclassPropertiesCount"))
  {
    objc_msgSend(v34, "clearDirtyDataclassProperties");
    v29 = -[ACProtobufAccount dirtyDataclassPropertiesCount](self, "dirtyDataclassPropertiesCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[ACProtobufAccount dirtyDataclassPropertiesAtIndex:](self, "dirtyDataclassPropertiesAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addDirtyDataclassProperties:", v32);

      }
    }
  }
  v33 = v34;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v34[172] = self->_warmingUp;
    v34[176] |= 1u;
  }
  if (self->_modificationID)
  {
    objc_msgSend(v34, "setModificationID:");
    v33 = v34;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSMutableArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ACProtobufAccountType copyWithZone:](self->_accountType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[ACProtobufAccountCredential copyWithZone:](self->_credential, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v10;

  v12 = -[NSString copyWithZone:](self->_accountDescription, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  v14 = -[NSString copyWithZone:](self->_username, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v14;

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v16 = self->_properties;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v100;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v100 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addProperties:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
    }
    while (v18);
  }

  *(_BYTE *)(v5 + 169) = self->_authenticated;
  v22 = -[ACProtobufDate copyWithZone:](self->_lastCredentialRenewalRejectionDate, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v22;

  *(_BYTE *)(v5 + 168) = self->_active;
  *(_BYTE *)(v5 + 171) = self->_visible;
  *(_BYTE *)(v5 + 170) = self->_supportsAuthentication;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v24 = self->_dataclassProperties;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v96;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v96 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v28), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDataclassProperties:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    }
    while (v26);
  }

  v30 = -[ACProtobufURL copyWithZone:](self->_objectID, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v30;

  v32 = -[ACProtobufAccount copyWithZone:](self->_parentAccount, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v32;

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v34 = self->_enabledDataclasses;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v92;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v92 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v38), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEnabledDataclasses:", v39);

        ++v38;
      }
      while (v36 != v38);
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
    }
    while (v36);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v40 = self->_provisionedDataclasses;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v88;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v88 != v43)
          objc_enumerationMutation(v40);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * v44), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addProvisionedDataclasses:", v45);

        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
    }
    while (v42);
  }

  v46 = -[NSString copyWithZone:](self->_authenticationType, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v46;

  v48 = -[NSString copyWithZone:](self->_credentialType, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v48;

  v50 = -[ACProtobufDate copyWithZone:](self->_date, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v50;

  v52 = -[NSString copyWithZone:](self->_owningBundleID, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v52;

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v54 = self->_dirtyProperties;
  v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v84;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v84 != v57)
          objc_enumerationMutation(v54);
        v59 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v58), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDirtyProperties:", v59);

        ++v58;
      }
      while (v56 != v58);
      v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
    }
    while (v56);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v60 = self->_dirtyAccountProperties;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v80;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v80 != v63)
          objc_enumerationMutation(v60);
        v65 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v64), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDirtyAccountProperties:", v65);

        ++v64;
      }
      while (v62 != v64);
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
    }
    while (v62);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v66 = self->_dirtyDataclassProperties;
  v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v75, v103, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v76;
    do
    {
      v70 = 0;
      do
      {
        if (*(_QWORD *)v76 != v69)
          objc_enumerationMutation(v66);
        v71 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v70), "copyWithZone:", a3, (_QWORD)v75);
        objc_msgSend((id)v5, "addDirtyDataclassProperties:", v71);

        ++v70;
      }
      while (v68 != v70);
      v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v75, v103, 16);
    }
    while (v68);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 172) = self->_warmingUp;
    *(_BYTE *)(v5 + 176) |= 1u;
  }
  v72 = -[NSString copyWithZone:](self->_modificationID, "copyWithZone:", a3, (_QWORD)v75);
  v73 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v72;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ACProtobufAccountType *accountType;
  ACProtobufAccountCredential *credential;
  NSString *identifier;
  NSString *accountDescription;
  NSString *username;
  NSMutableArray *properties;
  ACProtobufDate *lastCredentialRenewalRejectionDate;
  NSMutableArray *dataclassProperties;
  ACProtobufURL *objectID;
  ACProtobufAccount *parentAccount;
  NSMutableArray *enabledDataclasses;
  NSMutableArray *provisionedDataclasses;
  NSString *authenticationType;
  NSString *credentialType;
  ACProtobufDate *date;
  NSString *owningBundleID;
  NSMutableArray *dirtyProperties;
  NSMutableArray *dirtyAccountProperties;
  NSMutableArray *dirtyDataclassProperties;
  char v24;
  NSString *modificationID;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_60;
  accountType = self->_accountType;
  if ((unint64_t)accountType | *((_QWORD *)v4 + 2))
  {
    if (!-[ACProtobufAccountType isEqual:](accountType, "isEqual:"))
      goto LABEL_60;
  }
  credential = self->_credential;
  if ((unint64_t)credential | *((_QWORD *)v4 + 4))
  {
    if (!-[ACProtobufAccountCredential isEqual:](credential, "isEqual:"))
      goto LABEL_60;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_60;
  }
  accountDescription = self->_accountDescription;
  if ((unint64_t)accountDescription | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountDescription, "isEqual:"))
      goto LABEL_60;
  }
  username = self->_username;
  if ((unint64_t)username | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](username, "isEqual:"))
      goto LABEL_60;
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](properties, "isEqual:"))
      goto LABEL_60;
  }
  if (self->_authenticated)
  {
    if (!*((_BYTE *)v4 + 169))
      goto LABEL_60;
  }
  else if (*((_BYTE *)v4 + 169))
  {
    goto LABEL_60;
  }
  lastCredentialRenewalRejectionDate = self->_lastCredentialRenewalRejectionDate;
  if ((unint64_t)lastCredentialRenewalRejectionDate | *((_QWORD *)v4 + 13)
    && !-[ACProtobufDate isEqual:](lastCredentialRenewalRejectionDate, "isEqual:"))
  {
    goto LABEL_60;
  }
  if (self->_active)
  {
    if (!*((_BYTE *)v4 + 168))
      goto LABEL_60;
  }
  else if (*((_BYTE *)v4 + 168))
  {
    goto LABEL_60;
  }
  if (self->_visible)
  {
    if (!*((_BYTE *)v4 + 171))
      goto LABEL_60;
  }
  else if (*((_BYTE *)v4 + 171))
  {
    goto LABEL_60;
  }
  if (self->_supportsAuthentication)
  {
    if (!*((_BYTE *)v4 + 170))
      goto LABEL_60;
  }
  else if (*((_BYTE *)v4 + 170))
  {
    goto LABEL_60;
  }
  dataclassProperties = self->_dataclassProperties;
  if ((unint64_t)dataclassProperties | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](dataclassProperties, "isEqual:"))
  {
    goto LABEL_60;
  }
  objectID = self->_objectID;
  if ((unint64_t)objectID | *((_QWORD *)v4 + 15))
  {
    if (!-[ACProtobufURL isEqual:](objectID, "isEqual:"))
      goto LABEL_60;
  }
  parentAccount = self->_parentAccount;
  if ((unint64_t)parentAccount | *((_QWORD *)v4 + 17))
  {
    if (!-[ACProtobufAccount isEqual:](parentAccount, "isEqual:"))
      goto LABEL_60;
  }
  enabledDataclasses = self->_enabledDataclasses;
  if ((unint64_t)enabledDataclasses | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](enabledDataclasses, "isEqual:"))
      goto LABEL_60;
  }
  provisionedDataclasses = self->_provisionedDataclasses;
  if ((unint64_t)provisionedDataclasses | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](provisionedDataclasses, "isEqual:"))
      goto LABEL_60;
  }
  authenticationType = self->_authenticationType;
  if ((unint64_t)authenticationType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](authenticationType, "isEqual:"))
      goto LABEL_60;
  }
  credentialType = self->_credentialType;
  if ((unint64_t)credentialType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](credentialType, "isEqual:"))
      goto LABEL_60;
  }
  date = self->_date;
  if ((unint64_t)date | *((_QWORD *)v4 + 7))
  {
    if (!-[ACProtobufDate isEqual:](date, "isEqual:"))
      goto LABEL_60;
  }
  owningBundleID = self->_owningBundleID;
  if ((unint64_t)owningBundleID | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](owningBundleID, "isEqual:"))
      goto LABEL_60;
  }
  dirtyProperties = self->_dirtyProperties;
  if ((unint64_t)dirtyProperties | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](dirtyProperties, "isEqual:"))
      goto LABEL_60;
  }
  dirtyAccountProperties = self->_dirtyAccountProperties;
  if ((unint64_t)dirtyAccountProperties | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](dirtyAccountProperties, "isEqual:"))
      goto LABEL_60;
  }
  dirtyDataclassProperties = self->_dirtyDataclassProperties;
  if ((unint64_t)dirtyDataclassProperties | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](dirtyDataclassProperties, "isEqual:"))
      goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 176) & 1) == 0)
      goto LABEL_66;
LABEL_60:
    v24 = 0;
    goto LABEL_61;
  }
  if ((*((_BYTE *)v4 + 176) & 1) == 0)
    goto LABEL_60;
  if (!self->_warmingUp)
  {
    if (!*((_BYTE *)v4 + 172))
      goto LABEL_66;
    goto LABEL_60;
  }
  if (!*((_BYTE *)v4 + 172))
    goto LABEL_60;
LABEL_66:
  modificationID = self->_modificationID;
  if ((unint64_t)modificationID | *((_QWORD *)v4 + 14))
    v24 = -[NSString isEqual:](modificationID, "isEqual:");
  else
    v24 = 1;
LABEL_61:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 supportsAuthentication;
  unint64_t v18;
  _BOOL4 visible;
  uint64_t v20;
  _BOOL4 active;
  unint64_t v22;
  _BOOL4 authenticated;
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  unint64_t v28;
  unint64_t v29;

  v29 = -[ACProtobufAccountType hash](self->_accountType, "hash");
  v28 = -[ACProtobufAccountCredential hash](self->_credential, "hash");
  v27 = -[NSString hash](self->_identifier, "hash");
  v26 = -[NSString hash](self->_accountDescription, "hash");
  v25 = -[NSString hash](self->_username, "hash");
  v3 = -[NSMutableArray hash](self->_properties, "hash");
  authenticated = self->_authenticated;
  v24 = v3;
  v4 = -[ACProtobufDate hash](self->_lastCredentialRenewalRejectionDate, "hash");
  active = self->_active;
  v22 = v4;
  visible = self->_visible;
  supportsAuthentication = self->_supportsAuthentication;
  v20 = -[NSMutableArray hash](self->_dataclassProperties, "hash");
  v18 = -[ACProtobufURL hash](self->_objectID, "hash");
  v5 = -[ACProtobufAccount hash](self->_parentAccount, "hash");
  v6 = -[NSMutableArray hash](self->_enabledDataclasses, "hash");
  v7 = -[NSMutableArray hash](self->_provisionedDataclasses, "hash");
  v8 = -[NSString hash](self->_authenticationType, "hash");
  v9 = -[NSString hash](self->_credentialType, "hash");
  v10 = -[ACProtobufDate hash](self->_date, "hash");
  v11 = -[NSString hash](self->_owningBundleID, "hash");
  v12 = -[NSMutableArray hash](self->_dirtyProperties, "hash");
  v13 = -[NSMutableArray hash](self->_dirtyAccountProperties, "hash");
  v14 = -[NSMutableArray hash](self->_dirtyDataclassProperties, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v15 = 2654435761 * self->_warmingUp;
  else
    v15 = 0;
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ (2654435761 * authenticated) ^ v22 ^ (2654435761 * active) ^ (2654435761 * visible) ^ (2654435761 * supportsAuthentication) ^ v20 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_modificationID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ACProtobufAccountType *accountType;
  uint64_t v6;
  ACProtobufAccountCredential *credential;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  ACProtobufDate *lastCredentialRenewalRejectionDate;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  ACProtobufURL *objectID;
  uint64_t v22;
  ACProtobufAccount *parentAccount;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  ACProtobufDate *date;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t ii;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t jj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
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
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  accountType = self->_accountType;
  v6 = *((_QWORD *)v4 + 2);
  if (accountType)
  {
    if (v6)
      -[ACProtobufAccountType mergeFrom:](accountType, "mergeFrom:");
  }
  else if (v6)
  {
    -[ACProtobufAccount setAccountType:](self, "setAccountType:");
  }
  credential = self->_credential;
  v8 = *((_QWORD *)v4 + 4);
  if (credential)
  {
    if (v8)
      -[ACProtobufAccountCredential mergeFrom:](credential, "mergeFrom:");
  }
  else if (v8)
  {
    -[ACProtobufAccount setCredential:](self, "setCredential:");
  }
  if (*((_QWORD *)v4 + 12))
    -[ACProtobufAccount setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)v4 + 1))
    -[ACProtobufAccount setAccountDescription:](self, "setAccountDescription:");
  if (*((_QWORD *)v4 + 20))
    -[ACProtobufAccount setUsername:](self, "setUsername:");
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v9 = *((id *)v4 + 18);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v77 != v12)
          objc_enumerationMutation(v9);
        -[ACProtobufAccount addProperties:](self, "addProperties:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v11);
  }

  self->_authenticated = *((_BYTE *)v4 + 169);
  lastCredentialRenewalRejectionDate = self->_lastCredentialRenewalRejectionDate;
  v15 = *((_QWORD *)v4 + 13);
  if (lastCredentialRenewalRejectionDate)
  {
    if (v15)
      -[ACProtobufDate mergeFrom:](lastCredentialRenewalRejectionDate, "mergeFrom:");
  }
  else if (v15)
  {
    -[ACProtobufAccount setLastCredentialRenewalRejectionDate:](self, "setLastCredentialRenewalRejectionDate:");
  }
  self->_active = *((_BYTE *)v4 + 168);
  self->_visible = *((_BYTE *)v4 + 171);
  self->_supportsAuthentication = *((_BYTE *)v4 + 170);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v16 = *((id *)v4 + 6);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v73 != v19)
          objc_enumerationMutation(v16);
        -[ACProtobufAccount addDataclassProperties:](self, "addDataclassProperties:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
    }
    while (v18);
  }

  objectID = self->_objectID;
  v22 = *((_QWORD *)v4 + 15);
  if (objectID)
  {
    if (v22)
      -[ACProtobufURL mergeFrom:](objectID, "mergeFrom:");
  }
  else if (v22)
  {
    -[ACProtobufAccount setObjectID:](self, "setObjectID:");
  }
  parentAccount = self->_parentAccount;
  v24 = *((_QWORD *)v4 + 17);
  if (parentAccount)
  {
    if (v24)
      -[ACProtobufAccount mergeFrom:](parentAccount, "mergeFrom:");
  }
  else if (v24)
  {
    -[ACProtobufAccount setParentAccount:](self, "setParentAccount:");
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v25 = *((id *)v4 + 11);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v69 != v28)
          objc_enumerationMutation(v25);
        -[ACProtobufAccount addEnabledDataclasses:](self, "addEnabledDataclasses:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
    }
    while (v27);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v30 = *((id *)v4 + 19);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v65;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v65 != v33)
          objc_enumerationMutation(v30);
        -[ACProtobufAccount addProvisionedDataclasses:](self, "addProvisionedDataclasses:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * m));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
    }
    while (v32);
  }

  if (*((_QWORD *)v4 + 3))
    -[ACProtobufAccount setAuthenticationType:](self, "setAuthenticationType:");
  if (*((_QWORD *)v4 + 5))
    -[ACProtobufAccount setCredentialType:](self, "setCredentialType:");
  date = self->_date;
  v36 = *((_QWORD *)v4 + 7);
  if (date)
  {
    if (v36)
      -[ACProtobufDate mergeFrom:](date, "mergeFrom:");
  }
  else if (v36)
  {
    -[ACProtobufAccount setDate:](self, "setDate:");
  }
  if (*((_QWORD *)v4 + 16))
    -[ACProtobufAccount setOwningBundleID:](self, "setOwningBundleID:");
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v37 = *((id *)v4 + 10);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v61;
    do
    {
      for (n = 0; n != v39; ++n)
      {
        if (*(_QWORD *)v61 != v40)
          objc_enumerationMutation(v37);
        -[ACProtobufAccount addDirtyProperties:](self, "addDirtyProperties:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * n));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
    }
    while (v39);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v42 = *((id *)v4 + 8);
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v57;
    do
    {
      for (ii = 0; ii != v44; ++ii)
      {
        if (*(_QWORD *)v57 != v45)
          objc_enumerationMutation(v42);
        -[ACProtobufAccount addDirtyAccountProperties:](self, "addDirtyAccountProperties:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * ii));
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
    }
    while (v44);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v47 = *((id *)v4 + 9);
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v52, v80, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v53;
    do
    {
      for (jj = 0; jj != v49; ++jj)
      {
        if (*(_QWORD *)v53 != v50)
          objc_enumerationMutation(v47);
        -[ACProtobufAccount addDirtyDataclassProperties:](self, "addDirtyDataclassProperties:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * jj), (_QWORD)v52);
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v52, v80, 16);
    }
    while (v49);
  }

  if ((*((_BYTE *)v4 + 176) & 1) != 0)
  {
    self->_warmingUp = *((_BYTE *)v4 + 172);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 14))
    -[ACProtobufAccount setModificationID:](self, "setModificationID:");

}

- (ACProtobufAccountType)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
  objc_storeStrong((id *)&self->_accountType, a3);
}

- (ACProtobufAccountCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (void)setAccountDescription:(id)a3
{
  objc_storeStrong((id *)&self->_accountDescription, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (ACProtobufDate)lastCredentialRenewalRejectionDate
{
  return self->_lastCredentialRenewalRejectionDate;
}

- (void)setLastCredentialRenewalRejectionDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastCredentialRenewalRejectionDate, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)supportsAuthentication
{
  return self->_supportsAuthentication;
}

- (void)setSupportsAuthentication:(BOOL)a3
{
  self->_supportsAuthentication = a3;
}

- (NSMutableArray)dataclassProperties
{
  return self->_dataclassProperties;
}

- (void)setDataclassProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dataclassProperties, a3);
}

- (ACProtobufURL)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (ACProtobufAccount)parentAccount
{
  return self->_parentAccount;
}

- (void)setParentAccount:(id)a3
{
  objc_storeStrong((id *)&self->_parentAccount, a3);
}

- (NSMutableArray)enabledDataclasses
{
  return self->_enabledDataclasses;
}

- (void)setEnabledDataclasses:(id)a3
{
  objc_storeStrong((id *)&self->_enabledDataclasses, a3);
}

- (NSMutableArray)provisionedDataclasses
{
  return self->_provisionedDataclasses;
}

- (void)setProvisionedDataclasses:(id)a3
{
  objc_storeStrong((id *)&self->_provisionedDataclasses, a3);
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationType, a3);
}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(id)a3
{
  objc_storeStrong((id *)&self->_credentialType, a3);
}

- (ACProtobufDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)owningBundleID
{
  return self->_owningBundleID;
}

- (void)setOwningBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_owningBundleID, a3);
}

- (NSMutableArray)dirtyProperties
{
  return self->_dirtyProperties;
}

- (void)setDirtyProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyProperties, a3);
}

- (NSMutableArray)dirtyAccountProperties
{
  return self->_dirtyAccountProperties;
}

- (void)setDirtyAccountProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyAccountProperties, a3);
}

- (NSMutableArray)dirtyDataclassProperties
{
  return self->_dirtyDataclassProperties;
}

- (void)setDirtyDataclassProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyDataclassProperties, a3);
}

- (BOOL)warmingUp
{
  return self->_warmingUp;
}

- (NSString)modificationID
{
  return self->_modificationID;
}

- (void)setModificationID:(id)a3
{
  objc_storeStrong((id *)&self->_modificationID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_provisionedDataclasses, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_parentAccount, 0);
  objc_storeStrong((id *)&self->_owningBundleID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_modificationID, 0);
  objc_storeStrong((id *)&self->_lastCredentialRenewalRejectionDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_enabledDataclasses, 0);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_dirtyDataclassProperties, 0);
  objc_storeStrong((id *)&self->_dirtyAccountProperties, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dataclassProperties, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
}

- (void)setPropertiesDictionary:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[ACProtobufAccount clearProperties](self, "clearProperties");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ACProtobufAccount_Helpers__setPropertiesDictionary___block_invoke;
  v5[3] = &unk_1E48946C0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __54__ACProtobufAccount_Helpers__setPropertiesDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ACProtobufVariableKeyValuePair *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[ACProtobufVariableKeyValuePair initWithObjectValue:forKey:]([ACProtobufVariableKeyValuePair alloc], "initWithObjectValue:forKey:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "addProperties:", v7);
}

- (NSDictionary)propertiesDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[ACProtobufAccount propertiesCount](self, "propertiesCount"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ACProtobufAccount properties](self, "properties", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (void)setDataclassPropertiesDictionary:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[ACProtobufAccount clearDataclassProperties](self, "clearDataclassProperties");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__ACProtobufAccount_Helpers__setDataclassPropertiesDictionary___block_invoke;
  v5[3] = &unk_1E48946C0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __63__ACProtobufAccount_Helpers__setDataclassPropertiesDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ACProtobufVariableKeyValuePair *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[ACProtobufVariableKeyValuePair initWithObjectValue:forKey:]([ACProtobufVariableKeyValuePair alloc], "initWithObjectValue:forKey:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "addDataclassProperties:", v7);
}

- (NSDictionary)dataclassPropertiesDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[ACProtobufAccount dataclassPropertiesCount](self, "dataclassPropertiesCount"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ACProtobufAccount dataclassProperties](self, "dataclassProperties", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

@end
