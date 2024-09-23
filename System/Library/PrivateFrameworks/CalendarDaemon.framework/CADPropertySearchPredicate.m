@implementation CADPropertySearchPredicate

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendar:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  CADPropertySearchPredicate *v11;
  id v13;
  uint64_t v14;

  v6 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (a5)
  {
    v13 = a5;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = a5;
    objc_msgSend(v9, "arrayWithObjects:count:", &v13, 1);
    a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = -[CADPropertySearchPredicate initWithEntityType:filters:calendars:source:](self, "initWithEntityType:filters:calendars:source:", v6, v8, a5, 0, v13, v14);

  return v11;
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 source:(id)a5
{
  return -[CADPropertySearchPredicate initWithEntityType:filters:calendars:source:](self, "initWithEntityType:filters:calendars:source:", *(_QWORD *)&a3, a4, 0, a5);
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5
{
  return -[CADPropertySearchPredicate initWithEntityType:filters:calendars:source:](self, "initWithEntityType:filters:calendars:source:", *(_QWORD *)&a3, a4, a5, 0);
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5 limit:(int64_t)a6 randomize:(BOOL)a7
{
  return -[CADPropertySearchPredicate initWithEntityType:filters:calendars:source:limit:randomize:](self, "initWithEntityType:filters:calendars:source:limit:randomize:", *(_QWORD *)&a3, a4, a5, 0, a6, a7);
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5 source:(id)a6
{
  return -[CADPropertySearchPredicate initWithEntityType:filters:calendars:source:limit:randomize:](self, "initWithEntityType:filters:calendars:source:limit:randomize:", *(_QWORD *)&a3, a4, a5, a6, 0, 0);
}

- (CADPropertySearchPredicate)initWithEntityType:(int)a3 filters:(id)a4 calendars:(id)a5 source:(id)a6 limit:(int64_t)a7 randomize:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  CADPropertySearchPredicate *v17;
  CADPropertySearchPredicate *v18;
  uint64_t v19;
  NSArray *filters;
  CADPropertySearchPredicate *v21;
  objc_super v23;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CADPropertySearchPredicate;
  v17 = -[CADPropertySearchPredicate init](&v23, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_3;
  v17->_entityType = a3;
  v19 = objc_msgSend(v14, "copy");
  filters = v18->_filters;
  v18->_filters = (NSArray *)v19;

  objc_storeStrong((id *)&v18->_sourceID, a6);
  objc_storeStrong((id *)&v18->_calendarIDs, a5);
  v18->_limit = a7;
  v18->_randomize = a8;
  if (!-[CADPropertySearchPredicate validate](v18, "validate"))
    v21 = 0;
  else
LABEL_3:
    v21 = v18;

  return v21;
}

- (BOOL)validate
{
  NSArray *calendarIDs;
  uint64_t v4;
  NSArray *v5;
  CADObjectID *sourceID;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int entityType;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSArray *v17;
  BOOL v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  int v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  NSArray *v30;
  __int16 v31;
  CADObjectID *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  calendarIDs = self->_calendarIDs;
  if (calendarIDs && self->_sourceID)
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v5 = self->_calendarIDs;
      sourceID = self->_sourceID;
      *(_DWORD *)buf = 138412546;
      v30 = v5;
      v31 = 2112;
      v32 = sourceID;
      v7 = "Searching inside both calendars (%@) and source (%@) is not supported.";
      v8 = v4;
      v9 = 22;
LABEL_26:
      _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      return 0;
    }
    return 0;
  }
  entityType = self->_entityType;
  if ((entityType - 2) >= 2 && entityType != 101)
  {
    if (entityType != 1)
    {
      v21 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v22 = self->_entityType;
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v22;
        v7 = "Searching for the entity type: %i is not supported yet.";
        v8 = v21;
        v9 = 8;
        goto LABEL_26;
      }
      return 0;
    }
    if (calendarIDs)
    {
      v11 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v7 = "Searching for calendars inside of calendars is not supported.";
        v8 = v11;
        v9 = 2;
        goto LABEL_26;
      }
      return 0;
    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = self->_filters;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(NSArray **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((-[NSArray applicableToEntityType:](v17, "applicableToEntityType:", self->_entityType, (_QWORD)v24) & 1) == 0)
        {
          v19 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            v20 = self->_entityType;
            *(_DWORD *)buf = 138412546;
            v30 = v17;
            v31 = 1024;
            LODWORD(v32) = v20;
            _os_log_impl(&dword_1B6A18000, v19, OS_LOG_TYPE_ERROR, "Cannot use filter %@ with entity type %i", buf, 0x12u);
          }
          v18 = 0;
          goto LABEL_23;
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_23:

  return v18;
}

- (CADPropertySearchPredicate)initWithCoder:(id)a3
{
  id v4;
  CADPropertySearchPredicate *v5;
  void *v6;
  uint64_t v7;
  NSArray *filters;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *calendarIDs;
  uint64_t v14;
  CADObjectID *sourceID;
  CADPropertySearchPredicate *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CADPropertySearchPredicate;
  v5 = -[CADPropertySearchPredicate initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  v5->_entityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("entityType"));
  _CADPropertySearchPredicateGetAllowedFilterTypes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("filters"));
  v7 = objc_claimAutoreleasedReturnValue();
  filters = v5->_filters;
  v5->_filters = (NSArray *)v7;

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("calendarIDs"));
  v12 = objc_claimAutoreleasedReturnValue();
  calendarIDs = v5->_calendarIDs;
  v5->_calendarIDs = (NSArray *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceID"));
  v14 = objc_claimAutoreleasedReturnValue();
  sourceID = v5->_sourceID;
  v5->_sourceID = (CADObjectID *)v14;

  v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
  v5->_randomize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("randomize"));
  v16 = 0;
  if (-[CADPropertySearchPredicate validate](v5, "validate"))
LABEL_3:
    v16 = v5;

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CADPropertySearchPredicate;
  v4 = a3;
  -[CADPropertySearchPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_entityType, CFSTR("entityType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_filters, CFSTR("filters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_calendarIDs, CFSTR("calendarIDs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceID, CFSTR("sourceID"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_randomize, CFSTR("randomize"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)databasesToQuery
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_sourceID)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CADObjectID databaseID](self->_sourceID, "databaseID"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else
  {
    -[CADPropertySearchPredicate calendarRowIDsByDatabaseID](self, "calendarRowIDsByDatabaseID");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)extendWhereClauseWithEntityTypeLimitation:(id)a3 withValues:(id)a4 andTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  if ((self->_entityType & 0xFFFFFFFE) == 2)
  {
    v9 = a5;
    v10 = a4;
    _CADPropertySearchPredicateExtendWhereClause(v8, 0, CFSTR("entity_type = ?"));
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_entityType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    objc_msgSend(v9, "addObject:", &unk_1E6A506F0);
    v8 = (id)v11;
  }
  return v8;
}

- (id)calendarRowIDsByDatabaseID
{
  NSDictionary *calendarRowIDsByDatabaseID;
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  CADPropertySearchPredicate *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  calendarRowIDsByDatabaseID = self->_calendarRowIDsByDatabaseID;
  if (calendarRowIDsByDatabaseID)
    return calendarRowIDsByDatabaseID;
  if (!self->_calendarIDs)
  {
    calendarRowIDsByDatabaseID = 0;
    return calendarRowIDsByDatabaseID;
  }
  v16 = 16;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = self;
  v5 = self->_calendarIDs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "databaseID", v16));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "entityID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v14 = *(Class *)((char *)&v17->super.super.super.isa + v16);
  *(Class *)((char *)&v17->super.super.super.isa + v16) = (Class)v4;

  return *(id *)((char *)&v17->super.super.super.isa + v16);
}

- (id)extendWhereClauseWithCalendarOrSourceLimitation:(id)a3 withValues:(id)a4 andTypes:(id)a5 forDatabase:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (self->_calendarIDs)
  {
    -[CADPropertySearchPredicate calendarRowIDsByDatabaseID](self, "calendarRowIDsByDatabaseID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("calendar_id IN (%@)"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _CADPropertySearchPredicateExtendWhereClause(v10, 0, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v18;
  }
  else if (self->_sourceID)
  {
    _CADPropertySearchPredicateExtendWhereClause(v10, 0, CFSTR("calendar_id IN (SELECT ROWID FROM Calendar WHERE store_id = ?)"));
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CADObjectID entityID](self->_sourceID, "entityID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v20);

    objc_msgSend(v12, "addObject:", &unk_1E6A506F0);
    v10 = (id)v19;
  }

  return v10;
}

- (id)buildWhereClauseWithValues:(id)a3 andTypes:(id)a4 forDatabase:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CADPropertySearchPredicate extendWhereClauseWithEntityTypeLimitation:withValues:andTypes:](self, "extendWhereClauseWithEntityTypeLimitation:withValues:andTypes:", 0, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADPropertySearchPredicate extendWhereClauseWithCalendarOrSourceLimitation:withValues:andTypes:forDatabase:](self, "extendWhereClauseWithCalendarOrSourceLimitation:withValues:andTypes:forDatabase:", v10, v8, v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_filters;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      v17 = v11;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "extendWhereClause:usingOperation:withValues:andTypes:", v17, 0, v8, v9, (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v16;
        v17 = v11;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v11;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  -[CADPropertySearchPredicate buildWhereClauseWithValues:andTypes:forDatabase:](self, "buildWhereClauseWithValues:andTypes:forDatabase:", v4, v5, CalDatabaseGetAuxilliaryDatabaseID());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)CalDatabaseCopyEntitiesWhere();

  return v7;
}

- (id)predicateFormat
{
  void *v3;
  uint64_t v4;
  CADObjectID *sourceID;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = objc_opt_new();
  sourceID = self->_sourceID;
  if (sourceID)
  {
    v6 = -[CADObjectID databaseID](sourceID, "databaseID");
  }
  else if (-[NSArray count](self->_calendarIDs, "count"))
  {
    -[NSArray firstObject](self->_calendarIDs, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "databaseID");

  }
  else
  {
    v6 = *MEMORY[0x1E0D0BE78];
  }
  v25 = (void *)v4;
  -[CADPropertySearchPredicate buildWhereClauseWithValues:andTypes:forDatabase:](self, "buildWhereClauseWithValues:andTypes:forDatabase:", v3, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v15 = objc_msgSend(v8, "rangeOfString:", CFSTR("?"));
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = v15;
          v18 = v16;
          objc_msgSend(v14, "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "replaceCharactersInRange:withString:", v17, v18, v19);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  v20 = (void *)MEMORY[0x1E0CB3940];
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@: %@"), v22, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (int)entityType
{
  return self->_entityType;
}

- (NSArray)filters
{
  return self->_filters;
}

- (NSArray)calendarIDs
{
  return self->_calendarIDs;
}

- (CADObjectID)sourceID
{
  return self->_sourceID;
}

- (int64_t)limit
{
  return self->_limit;
}

- (BOOL)randomize
{
  return self->_randomize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_calendarIDs, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_calendarRowIDsByDatabaseID, 0);
}

@end
