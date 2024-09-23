@implementation CRKASMConcreteRosterProvider

- (void)dealloc
{
  objc_super v3;

  -[CRKASMWorldBuildOperation cancel](self->_worldBuildOperation, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKASMConcreteRosterProvider;
  -[CRKASMConcreteRosterProvider dealloc](&v3, sel_dealloc);
}

- (CRKASMConcreteRosterProvider)initWithConfiguration:(id)a3
{
  id v4;
  CRKASMConcreteRosterProvider *v5;
  CRKASMRosterProviderEnvironment *v6;
  CRKASMRosterProviderEnvironment *environment;
  CRKASMCertificateIngestor *v8;
  CRKASMCertificateIngestor *certificateIngestor;
  CRKClassKitChangeNotifier *v10;
  void *v11;
  uint64_t v12;
  CRKClassKitChangeNotifier *classKitChangeNotifier;
  CRKASMRosterUpdater *v14;
  void *v15;
  uint64_t v16;
  CRKASMRosterUpdater *rosterUpdater;
  NSArray *locationsWithManagePermissions;
  NSArray *v19;
  NSArray *locations;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRKASMConcreteRosterProvider;
  v5 = -[CRKASMConcreteRosterProvider init](&v22, sel_init);
  if (v5)
  {
    v6 = -[CRKASMRosterProviderEnvironment initWithConfiguration:]([CRKASMRosterProviderEnvironment alloc], "initWithConfiguration:", v4);
    environment = v5->_environment;
    v5->_environment = v6;

    v8 = -[CRKASMCertificateIngestor initWithConfiguration:]([CRKASMCertificateIngestor alloc], "initWithConfiguration:", v4);
    certificateIngestor = v5->_certificateIngestor;
    v5->_certificateIngestor = v8;

    v10 = [CRKClassKitChangeNotifier alloc];
    objc_msgSend(v4, "rosterRequirements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CRKClassKitChangeNotifier initWithRequirements:](v10, "initWithRequirements:", v11);
    classKitChangeNotifier = v5->_classKitChangeNotifier;
    v5->_classKitChangeNotifier = (CRKClassKitChangeNotifier *)v12;

    -[CRKClassKitChangeNotifier setDelegate:](v5->_classKitChangeNotifier, "setDelegate:", v5);
    v14 = [CRKASMRosterUpdater alloc];
    objc_msgSend(v4, "rosterRequirements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CRKASMRosterUpdater initWithRequirements:](v14, "initWithRequirements:", v15);
    rosterUpdater = v5->_rosterUpdater;
    v5->_rosterUpdater = (CRKASMRosterUpdater *)v16;

    locationsWithManagePermissions = v5->_locationsWithManagePermissions;
    v19 = (NSArray *)MEMORY[0x24BDBD1A8];
    v5->_locationsWithManagePermissions = (NSArray *)MEMORY[0x24BDBD1A8];

    locations = v5->_locations;
    v5->_locations = v19;

    -[CRKASMConcreteRosterProvider refresh](v5, "refresh");
  }

  return v5;
}

- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CRKASMConcreteRosterProvider certificateIngestor](self, "certificateIngestor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "ingestCertificates:forTrustedUserIdentifier:error:", v9, v8, a5);

  return (char)a5;
}

- (CRKASMUserFetching)userFetcher
{
  CRKASMConcreteUserFetcher *v3;
  void *v4;
  void *v5;
  void *v6;
  CRKASMConcreteUserFetcher *v7;

  v3 = [CRKASMConcreteUserFetcher alloc];
  -[CRKASMConcreteRosterProvider environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rosterRequirements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRKASMConcreteUserFetcher initWithRosterRequirements:](v3, "initWithRosterRequirements:", v6);

  return (CRKASMUserFetching *)v7;
}

- (id)studentDirectoryForLocationIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CRKASMConcreteRosterProvider environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rosterRequirements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKASMConcreteUserDirectory studentDirectoryWithRosterRequirements:locationIDs:](CRKASMConcreteUserDirectory, "studentDirectoryWithRosterRequirements:locationIDs:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)instructorDirectoryForLocationIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CRKASMConcreteRosterProvider environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rosterRequirements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKASMConcreteUserDirectory instructorDirectoryWithRosterRequirements:locationIDs:](CRKASMConcreteUserDirectory, "instructorDirectoryWithRosterRequirements:locationIDs:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CRKASMConcreteRosterProvider rosterUpdater](self, "rosterUpdater");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createClassWithProperties:completion:", v7, v6);

}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CRKASMConcreteRosterProvider rosterUpdater](self, "rosterUpdater");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteRosterProvider roster](self, "roster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeCourseWithIdentifier:roster:completion:", v7, v8, v6);

}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CRKASMConcreteRosterProvider rosterUpdater](self, "rosterUpdater");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteRosterProvider roster](self, "roster");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateCourseWithIdentifier:properties:roster:completion:", v10, v9, v11, v8);

}

- (void)startNewWorldBuild
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CRKASMWorldBuildOperation *v8;
  void *v9;
  CRKASMWorldBuildOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;
  _QWORD v33[4];
  id v34;
  uint64_t v35;

  -[CRKASMConcreteRosterProvider environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "osTransactionPrimitives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionWithReverseDNSReason:", CFSTR("com.apple.studentd.roster"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKASMConcreteRosterProvider worldBuildOperation](self, "worldBuildOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  v8 = [CRKASMWorldBuildOperation alloc];
  -[CRKASMConcreteRosterProvider environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRKASMWorldBuildOperation initWithEnvironment:](v8, "initWithEnvironment:", v9);
  -[CRKASMConcreteRosterProvider setWorldBuildOperation:](self, "setWorldBuildOperation:", v10);

  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteRosterProvider worldBuildOperation](self, "worldBuildOperation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v12);

  -[CRKASMConcreteRosterProvider environment](self, "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transactionReleaseDelay");
  v16 = v15;

  v17 = MEMORY[0x24BDAC760];
  v18 = (void *)MEMORY[0x24BDD1478];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke;
  v33[3] = &unk_24D9C98F8;
  v35 = v16;
  v19 = v6;
  v34 = v19;
  objc_msgSend(v18, "blockOperationWithBlock:", v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteRosterProvider worldBuildOperation](self, "worldBuildOperation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addDependency:", v21);

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addOperation:", v20);

  objc_initWeak(&location, self);
  -[CRKASMConcreteRosterProvider worldBuildOperation](self, "worldBuildOperation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD1478];
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke_14;
  v29[3] = &unk_24D9C7DC8;
  objc_copyWeak(&v31, &location);
  v25 = v23;
  v30 = v25;
  objc_msgSend(v24, "blockOperationWithBlock:", v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMConcreteRosterProvider worldBuildOperation](self, "worldBuildOperation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addDependency:", v27);

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addOperation:", v26);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _CRKLogASM_14();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    v8 = v3;
    _os_log_impl(&dword_218C99000, v2, OS_LOG_TYPE_INFO, "World build operation finished. Will release OS transaction in %lf seconds.", buf, 0xCu);
  }

  v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke_11;
  block[3] = &unk_24D9C7020;
  v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _CRKLogASM_14();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_218C99000, v2, OS_LOG_TYPE_INFO, "Now ending OS transaction after finishing world build operation.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __50__CRKASMConcreteRosterProvider_startNewWorldBuild__block_invoke_14(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "worldBuildDidFinish:", *(_QWORD *)(a1 + 32));

}

- (void)worldBuildDidFinish:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;

  v7 = a3;
  -[CRKASMConcreteRosterProvider worldBuildOperation](self, "worldBuildOperation");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 == v7)
  {
    -[CRKASMConcreteRosterProvider setWorldBuildOperation:](self, "setWorldBuildOperation:", 0);
    -[CRKASMConcreteRosterProvider processFinishedWorldBuild:](self, "processFinishedWorldBuild:", v7);
    v6 = -[CRKASMConcreteRosterProvider isPopulated](self, "isPopulated");
    v5 = v7;
    if (!v6)
    {
      -[CRKASMConcreteRosterProvider setPopulated:](self, "setPopulated:", 1);
      v5 = v7;
    }
  }

}

- (void)processFinishedWorldBuild:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[15];
  char v14;

  v4 = a3;
  -[CRKASMConcreteRosterProvider logDurationOfOperation:](self, "logDurationOfOperation:", v4);
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _CRKLogASM_14();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRKASMConcreteRosterProvider processFinishedWorldBuild:].cold.1(v5, v6);

  }
  else
  {
    objc_msgSend(v4, "resultObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v14 = 0;
    objc_msgSend(v9, "roster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKASMConcreteRosterProvider updateRoster:outTrustedPersonIDsChanged:](self, "updateRoster:outTrustedPersonIDsChanged:", v10, &v14);

    objc_msgSend(v9, "manageableLocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRKASMConcreteRosterProvider updateManageableLocations:](self, "updateManageableLocations:", v11);
    if (v14)
    {
      _CRKLogASM_14();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_218C99000, v12, OS_LOG_TYPE_INFO, "World building again because the observed trusted person IDs changed", v13, 2u);
      }

      -[CRKASMConcreteRosterProvider startNewWorldBuild](self, "startNewWorldBuild");
    }
  }

}

- (void)updateRoster:(id)a3 outTrustedPersonIDsChanged:(BOOL *)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (unint64_t)a3;
  -[CRKASMConcreteRosterProvider roster](self, "roster");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7)
  {
    v8 = (void *)v7;
    -[CRKASMConcreteRosterProvider roster](self, "roster");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v6);

    if ((v10 & 1) == 0)
    {
      _CRKLogASM_14();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v6, "courses");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v12;
        _os_log_impl(&dword_218C99000, v11, OS_LOG_TYPE_INFO, "Updating ASM roster with courses: %{public}@", (uint8_t *)&v19, 0xCu);

      }
      _CRKLogASM_14();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v6, "user");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v14;
        _os_log_impl(&dword_218C99000, v13, OS_LOG_TYPE_INFO, "Updating ASM roster with user: %{public}@", (uint8_t *)&v19, 0xCu);

      }
      _CRKLogASM_14();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v6, "organization");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v16;
        _os_log_impl(&dword_218C99000, v15, OS_LOG_TYPE_INFO, "Updating ASM roster with organization: %{public}@", (uint8_t *)&v19, 0xCu);

      }
      -[CRKASMConcreteRosterProvider setRoster:](self, "setRoster:", v6);
      -[CRKASMConcreteRosterProvider classKitChangeNotifier](self, "classKitChangeNotifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "updateObservedTrustedPersonIDsWithRoster:", v6);

      if (a4)
        *a4 = v18;
    }
  }

}

- (void)updateManageableLocations:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (unint64_t)a3;
  -[CRKASMConcreteRosterProvider locationsWithManagePermissions](self, "locationsWithManagePermissions");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
  {
    v6 = (void *)v5;
    -[CRKASMConcreteRosterProvider locationsWithManagePermissions](self, "locationsWithManagePermissions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v4);

    if ((v8 & 1) == 0)
    {
      _CRKLogASM_14();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 134217984;
        v11 = objc_msgSend((id)v4, "count");
        _os_log_impl(&dword_218C99000, v9, OS_LOG_TYPE_INFO, "Updating Manageable ASM locations. Count: %lu", (uint8_t *)&v10, 0xCu);
      }

      -[CRKASMConcreteRosterProvider setLocationsWithManagePermissions:](self, "setLocationsWithManagePermissions:", v4);
    }
  }

}

- (void)logDurationOfOperation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "finishedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  _CRKLogASM_14();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = v7;
    _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "ASM world build operation took %.2f seconds", (uint8_t *)&v9, 0xCu);
  }

}

- (CRKASMRoster)roster
{
  return self->_roster;
}

- (void)setRoster:(id)a3
{
  objc_storeStrong((id *)&self->_roster, a3);
}

- (BOOL)isPopulated
{
  return self->_populated;
}

- (void)setPopulated:(BOOL)a3
{
  self->_populated = a3;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)locationsWithManagePermissions
{
  return self->_locationsWithManagePermissions;
}

- (void)setLocationsWithManagePermissions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CRKASMCertificateIngestor)certificateIngestor
{
  return self->_certificateIngestor;
}

- (CRKClassKitChangeNotifier)classKitChangeNotifier
{
  return self->_classKitChangeNotifier;
}

- (CRKASMWorldBuildOperation)worldBuildOperation
{
  return self->_worldBuildOperation;
}

- (void)setWorldBuildOperation:(id)a3
{
  objc_storeStrong((id *)&self->_worldBuildOperation, a3);
}

- (CRKASMRosterUpdater)rosterUpdater
{
  return self->_rosterUpdater;
}

- (CRKASMRosterProviderEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_rosterUpdater, 0);
  objc_storeStrong((id *)&self->_worldBuildOperation, 0);
  objc_storeStrong((id *)&self->_classKitChangeNotifier, 0);
  objc_storeStrong((id *)&self->_certificateIngestor, 0);
  objc_storeStrong((id *)&self->_locationsWithManagePermissions, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_roster, 0);
}

- (void)processFinishedWorldBuild:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "ASM world build failed: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
