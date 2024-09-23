@implementation HMBLocalZoneQueryResultRecursiveModelID

- (HMBLocalZoneQueryResultRecursiveModelID)initWithLocalZone:(id)a3 modelID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  HMBLocalZoneQueryResultRecursiveModelID *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSUUID *parentModelID;
  void *v17;
  uint64_t v18;
  NSMutableOrderedSet *modelStack;
  uint64_t v20;
  NSMutableSet *returnedModels;
  void *v22;
  void *v23;
  HMBLocalZoneQueryResultRecursiveModelID *v25;
  SEL v26;
  sqlite3_stmt *v27;
  id *v28;
  id v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sql");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectAllRecordParentModelIDRows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect");
  v30.receiver = self;
  v30.super_class = (Class)HMBLocalZoneQueryResultRecursiveModelID;
  v11 = -[HMBLocalZoneQueryResult initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:](&v30, sel_initWithLocalZone_statement_initialSequence_arguments_maximumRowsPerSelect_, v6, v9, &unk_1E8947718, MEMORY[0x1E0C9AA70], v10);
  if (!v11)
    goto LABEL_9;
  v29 = 0;
  objc_msgSend(v6, "fetchRecordRowWithModelID:returning:error:", v7, 2, &v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBSQLQueryIterator setCachedResults:](v11, "setCachedResults:", v14);

  if (v12)
  {
    objc_msgSend(v12, "modelID");
    v15 = objc_claimAutoreleasedReturnValue();
    parentModelID = v11->_parentModelID;
    v11->_parentModelID = (NSUUID *)v15;

    -[HMBSQLQueryIterator cachedResults](v11, "cachedResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v12);

  }
  else if (v13)
  {
    -[HMBSQLQueryIterator setError:](v11, "setError:", v13);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v18 = objc_claimAutoreleasedReturnValue();
  modelStack = v11->_modelStack;
  v11->_modelStack = (NSMutableOrderedSet *)v18;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = objc_claimAutoreleasedReturnValue();
  returnedModels = v11->_returnedModels;
  v11->_returnedModels = (NSMutableSet *)v20;

  objc_msgSend(v9, "arguments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hmf_numberForKey:", CFSTR("_parent_uuid"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v11->_parentModelIDOffset = objc_msgSend(v23, "intValue");

LABEL_8:
LABEL_9:

    return v11;
  }
  v25 = (HMBLocalZoneQueryResultRecursiveModelID *)_HMFPreconditionFailure();
  return (HMBLocalZoneQueryResultRecursiveModelID *)-[HMBLocalZoneQueryResultRecursiveModelID bindPropertiesToStatement:error:](v25, v26, v27, v28);
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v7;
  void *v8;
  int v9;
  void *v10;

  v7 = -[HMBLocalZoneQueryResult zoneRowBindOffset](self, "zoneRowBindOffset");
  -[HMBLocalZoneQueryResult localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  hmbBindIntSQLite3(a3, v7, objc_msgSend(v8, "zoneRow"), a4);

  v9 = -[HMBLocalZoneQueryResultRecursiveModelID parentModelIDOffset](self, "parentModelIDOffset");
  -[HMBLocalZoneQueryResultRecursiveModelID parentModelID](self, "parentModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  hmbBindUUIDSQLite3(a3, v9, v10, a4);

  return 1;
}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  while (1)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMBLocalZoneQueryResultRecursiveModelID;
    -[HMBSQLQueryIterator nextObject](&v14, sel_nextObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      break;
    -[HMBLocalZoneQueryResultRecursiveModelID modelStack](self, "modelStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v8, "count");

    if (!v4)
      return v4;
    -[HMBLocalZoneQueryResultRecursiveModelID modelStack](self, "modelStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMBLocalZoneQueryResultRecursiveModelID modelStack](self, "modelStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", 0);

    -[HMBLocalZoneQueryResultRecursiveModelID setParentModelID:](self, "setParentModelID:", v5);
    -[HMBSQLQueryIterator setCurrentSequence:](self, "setCurrentSequence:", &unk_1E8947718);
    -[HMBSQLQueryIterator setCachedResults:](self, "setCachedResults:", 0);
LABEL_6:

  }
  v4 = v3;
  objc_msgSend(v3, "hmbModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZoneQueryResultRecursiveModelID returnedModels](self, "returnedModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {

    goto LABEL_6;
  }
  -[HMBLocalZoneQueryResultRecursiveModelID modelStack](self, "modelStack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v5);

  -[HMBLocalZoneQueryResultRecursiveModelID returnedModels](self, "returnedModels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v5);

  return v4;
}

- (int)parentModelIDOffset
{
  return self->_parentModelIDOffset;
}

- (NSUUID)parentModelID
{
  return self->_parentModelID;
}

- (void)setParentModelID:(id)a3
{
  objc_storeStrong((id *)&self->_parentModelID, a3);
}

- (NSMutableOrderedSet)modelStack
{
  return self->_modelStack;
}

- (NSMutableSet)returnedModels
{
  return self->_returnedModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnedModels, 0);
  objc_storeStrong((id *)&self->_modelStack, 0);
  objc_storeStrong((id *)&self->_parentModelID, 0);
}

@end
