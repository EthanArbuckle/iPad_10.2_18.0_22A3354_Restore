@implementation PrimaryInterfaceUtils

+ (PrimaryInterfaceUtils)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_11);
  return (PrimaryInterfaceUtils *)(id)sharedInstance_primaryInterfaceUtil;
}

void __39__PrimaryInterfaceUtils_sharedInstance__block_invoke()
{
  PrimaryInterfaceUtils *v0;
  void *v1;

  v0 = objc_alloc_init(PrimaryInterfaceUtils);
  v1 = (void *)sharedInstance_primaryInterfaceUtil;
  sharedInstance_primaryInterfaceUtil = (uint64_t)v0;

}

- (PrimaryInterfaceUtils)init
{
  PrimaryInterfaceUtils *v2;
  PrimaryInterfaceUtils *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PrimaryInterfaceUtils;
  v2 = -[PrimaryInterfaceUtils init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hasPrimaryInterface = 0;
    objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v3, CFSTR("path"), 7, 0);

  }
  return v3;
}

- (void)getDefaultPathInfoUsingSecondsSinceChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "status");

  if (v5 == 1)
  {
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    objc_msgSend(v3, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (double)(unint64_t)objc_msgSend(v9, "secondsSinceInterfaceChange");

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v10);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    symptomsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      +[InterfaceUtils stringForInterfaceType:](InterfaceUtils, "stringForInterfaceType:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v14;
      v19 = 2048;
      v20 = *(_QWORD *)&v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "PrimaryInterfaceUtils: Informed that interfaceType %@ became primary %.1fs ago at %@", (uint8_t *)&v17, 0x20u);

    }
    -[PrimaryInterfaceUtils _setHasPrimaryInterface:](self, "_setHasPrimaryInterface:", (v8 & 0xFFFFFFFFFFFFFFFBLL) != 0);
    -[PrimaryInterfaceUtils _setPrimaryInterfaceType:](self, "_setPrimaryInterfaceType:", v8);
    -[PrimaryInterfaceUtils _setInterfaceBecamePrimaryDate:](self, "_setInterfaceBecamePrimaryDate:", v11);
    -[PrimaryInterfaceUtils _setEstimatedInterfaceBecamePrimaryDate:](self, "_setEstimatedInterfaceBecamePrimaryDate:", v12);

  }
  else
  {
    symptomsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 2048;
      v20 = objc_msgSend(v16, "status");
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_INFO, "PrimaryInterfaceUtils: path [%@] not satisfied (%ld)", (uint8_t *)&v17, 0x16u);

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = *MEMORY[0x1E0CB2CB8];
  v11 = a5;
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13 == 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = objc_msgSend(v12, "isEqualToPath:", v13) ^ 1;
  }
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("path")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & v14) == 1)
      -[PrimaryInterfaceUtils getDefaultPathInfoUsingSecondsSinceChange](self, "getDefaultPathInfoUsingSecondsSinceChange");
  }

}

- (void)_setHasPrimaryInterface:(BOOL)a3
{
  _BOOL4 v3;
  PrimaryInterfaceUtils *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_hasPrimaryInterface != v3)
  {
    -[PrimaryInterfaceUtils willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("hasPrimaryInterface"));
    obj->_hasPrimaryInterface = v3;
    -[PrimaryInterfaceUtils didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("hasPrimaryInterface"));
  }
  objc_sync_exit(obj);

}

- (BOOL)hasPrimaryInterface
{
  PrimaryInterfaceUtils *v2;
  BOOL hasPrimaryInterface;

  v2 = self;
  objc_sync_enter(v2);
  hasPrimaryInterface = v2->_hasPrimaryInterface;
  objc_sync_exit(v2);

  return hasPrimaryInterface;
}

- (void)_setPrimaryInterfaceType:(int64_t)a3
{
  PrimaryInterfaceUtils *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_primaryInterfaceType != a3)
  {
    -[PrimaryInterfaceUtils willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("primaryInterfaceType"));
    obj->_primaryInterfaceType = a3;
    -[PrimaryInterfaceUtils didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("primaryInterfaceType"));
  }
  objc_sync_exit(obj);

}

- (int64_t)primaryInterfaceType
{
  PrimaryInterfaceUtils *v2;
  int64_t primaryInterfaceType;

  v2 = self;
  objc_sync_enter(v2);
  primaryInterfaceType = v2->_primaryInterfaceType;
  objc_sync_exit(v2);

  return primaryInterfaceType;
}

- (void)_setInterfaceBecamePrimaryDate:(id)a3
{
  PrimaryInterfaceUtils *v5;
  NSDate *v6;

  v6 = (NSDate *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_interfaceBecamePrimaryDate != v6)
  {
    -[PrimaryInterfaceUtils willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("interfaceBecamePrimaryDate"));
    objc_storeStrong((id *)&v5->_interfaceBecamePrimaryDate, a3);
    -[PrimaryInterfaceUtils didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("interfaceBecamePrimaryDate"));
  }
  objc_sync_exit(v5);

}

- (NSDate)interfaceBecamePrimaryDate
{
  PrimaryInterfaceUtils *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_interfaceBecamePrimaryDate;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setEstimatedInterfaceBecamePrimaryDate:(id)a3
{
  PrimaryInterfaceUtils *v5;
  NSDate *v6;

  v6 = (NSDate *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_estimatedInterfaceBecamePrimaryDate != v6)
  {
    -[PrimaryInterfaceUtils willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("estimatedInterfaceBecamePrimaryDate"));
    objc_storeStrong((id *)&v5->_estimatedInterfaceBecamePrimaryDate, a3);
    -[PrimaryInterfaceUtils didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("estimatedInterfaceBecamePrimaryDate"));
  }
  objc_sync_exit(v5);

}

- (NSDate)estimatedInterfaceBecamePrimaryDate
{
  PrimaryInterfaceUtils *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_estimatedInterfaceBecamePrimaryDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)primaryInterfaceTypeString
{
  return (NSString *)+[InterfaceUtils stringForInterfaceType:](InterfaceUtils, "stringForInterfaceType:", self->_primaryInterfaceType);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedInterfaceBecamePrimaryDate, 0);
  objc_storeStrong((id *)&self->_interfaceBecamePrimaryDate, 0);
}

@end
