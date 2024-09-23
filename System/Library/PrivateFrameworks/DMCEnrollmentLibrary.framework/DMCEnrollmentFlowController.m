@implementation DMCEnrollmentFlowController

+ (id)enrollmentFlowControllerWithPresenter:(id)a3 managedConfigurationHelper:(id)a4
{
  id v5;
  id v6;
  DMCEnrollmentFlowController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[DMCEnrollmentFlowController initWithPresenter:managedConfigurationHelper:]([DMCEnrollmentFlowController alloc], "initWithPresenter:managedConfigurationHelper:", v6, v5);

  return v7;
}

- (DMCEnrollmentFlowController)init
{
  DMCEnrollmentFlowController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DMCEnrollmentFlowController;
  result = -[DMCEnrollmentFlowControllerBase init](&v3, sel_init);
  if (result)
    result->_cleanupIfFail = 1;
  return result;
}

- (DMCEnrollmentFlowController)initWithPresenter:(id)a3 managedConfigurationHelper:(id)a4
{
  id v7;
  id v8;
  DMCEnrollmentFlowController *v9;
  DMCEnrollmentFlowController *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[DMCEnrollmentFlowController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    objc_storeStrong((id *)&v10->_managedConfigurationHelper, a4);
    -[DMCEnrollmentFlowController _addNotification](v10, "_addNotification");
  }

  return v10;
}

- (void)_cleanupDirtyState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  uint64_t v49;
  NSObject *v50;
  void *v51;
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
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219D1D000, v5, OS_LOG_TYPE_INFO, "Cleaning up dirty state...", buf, 2u);
  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v4, "dirtyPersonaIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v75;
    *(_QWORD *)&v8 = 138543362;
    v52 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v75 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
        v14 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v52;
          v83 = v13;
          _os_log_impl(&dword_219D1D000, v14, OS_LOG_TYPE_INFO, "Removing dirty persona %{public}@...", buf, 0xCu);
        }
        v73 = 0;
        objc_msgSend(MEMORY[0x24BE2A838], "removePersona:error:", v13, &v73, v52);
        v15 = v73;
        if (!v15)
        {
          objc_msgSend(v4, "removeDirtyPersonaID:", v13);
          v10 = 1;
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v4, "dirtyProfileIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v70;
    *(_QWORD *)&v18 = 138543362;
    v53 = v18;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v70 != v20)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j);
        v23 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v53;
          v83 = v22;
          _os_log_impl(&dword_219D1D000, v23, OS_LOG_TYPE_INFO, "Uninstalling MDM profile %{public}@...", buf, 0xCu);
        }
        -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper", v53);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeProfileWithIdentifier:async:", v22, 1);

        objc_msgSend(v4, "removeDirtyProfileIdentifier:", v22);
      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v19);
    v10 = 1;
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v4, "dirtyAltDISDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v66;
    *(_QWORD *)&v27 = 138543362;
    v54 = v27;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v66 != v29)
          objc_enumerationMutation(v25);
        v31 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k);
        v32 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v54;
          v83 = v31;
          _os_log_impl(&dword_219D1D000, v32, OS_LOG_TYPE_INFO, "Cleaning up dirty account with altDSID %{public}@...", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x24BDB4398], "defaultStore", v54);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "dmc_removeMAIDRelatedAccountsWithAltDSID:asynchronous:", v31, 1);

        objc_msgSend(v4, "removeDirtyAltDSID:", v31);
      }
      v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
    }
    while (v28);
    v10 = 1;
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v4, "dirtyRMAccounts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
  if (v35)
  {
    v37 = v35;
    v38 = *(_QWORD *)v62;
    *(_QWORD *)&v36 = 138543362;
    v55 = v36;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v62 != v38)
          objc_enumerationMutation(v34);
        v40 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * m);
        v41 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v55;
          v83 = v40;
          _os_log_impl(&dword_219D1D000, v41, OS_LOG_TYPE_INFO, "Cleaning up RM account with identifier %{public}@...", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x24BDB4398], "defaultStore", v55);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "dmc_removeAccountWithIdentifier:asynchronous:", v40, 1);

        objc_msgSend(v4, "removeDirtyRMAccount:", v40);
      }
      v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
    }
    while (v37);
    v10 = 1;
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v4, "dirtyBundleIDs");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
  if (v44)
  {
    v46 = v44;
    v47 = *(_QWORD *)v58;
    *(_QWORD *)&v45 = 138543362;
    v56 = v45;
    do
    {
      for (n = 0; n != v46; ++n)
      {
        if (*(_QWORD *)v58 != v47)
          objc_enumerationMutation(v43);
        v49 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * n);
        v50 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v56;
          v83 = v49;
          _os_log_impl(&dword_219D1D000, v50, OS_LOG_TYPE_INFO, "Cleaning up dirty application with bundle ID %{public}@...", buf, 0xCu);
        }
        -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper", v56);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "removeApplicationWithBundleID:completionHandler:", v49, 0);

        objc_msgSend(v4, "removeDirtyBundleID:", v49);
      }
      v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
    }
    while (v46);

    goto LABEL_57;
  }

  if ((v10 & 1) != 0)
LABEL_57:
    -[DMCEnrollmentFlowController _writeDirtyStateToDisk:](self, "_writeDirtyStateToDisk:", v4);

}

+ (id)enrollmentFlowController
{
  return (id)objc_opt_new();
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[DMCEnrollmentFlowController dealloc]";
    _os_log_impl(&dword_219D1D000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _unblockAppInstallsIfNecessaryWithCaller:](self, "_unblockAppInstallsIfNecessaryWithCaller:", v5);

  v6.receiver = self;
  v6.super_class = (Class)DMCEnrollmentFlowController;
  -[DMCEnrollmentFlowController dealloc](&v6, sel_dealloc);
}

- (DMCServiceDiscoveryHelper)serviceDiscoveryHelper
{
  DMCServiceDiscoveryHelper *serviceDiscoveryHelper;
  DMCServiceDiscoveryHelper *v4;
  DMCServiceDiscoveryHelper *v5;

  serviceDiscoveryHelper = self->_serviceDiscoveryHelper;
  if (!serviceDiscoveryHelper)
  {
    v4 = (DMCServiceDiscoveryHelper *)objc_opt_new();
    v5 = self->_serviceDiscoveryHelper;
    self->_serviceDiscoveryHelper = v4;

    serviceDiscoveryHelper = self->_serviceDiscoveryHelper;
  }
  return serviceDiscoveryHelper;
}

- (DMCEnrollmentDirtyState)dirtyState
{
  DMCEnrollmentDirtyState *dirtyState;
  DMCEnrollmentDirtyState *v4;
  void *v5;
  DMCEnrollmentDirtyState *v6;
  DMCEnrollmentDirtyState *v7;

  dirtyState = self->_dirtyState;
  if (!dirtyState)
  {
    v4 = [DMCEnrollmentDirtyState alloc];
    -[DMCEnrollmentFlowController _readDirtyStateFromDisk](self, "_readDirtyStateFromDisk");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DMCEnrollmentDirtyState initWithDictionary:](v4, "initWithDictionary:", v5);
    v7 = self->_dirtyState;
    self->_dirtyState = v6;

    dirtyState = self->_dirtyState;
  }
  return dirtyState;
}

- (DMCObliterationShelter)obliterationShelter
{
  DMCObliterationShelter *obliterationShelter;
  DMCObliterationShelter *v4;
  DMCObliterationShelter *v5;
  DMCObliterationShelter *v6;
  uint64_t v8;

  obliterationShelter = self->_obliterationShelter;
  if (!obliterationShelter)
  {
    v4 = (DMCObliterationShelter *)objc_opt_new();
    v5 = self->_obliterationShelter;
    self->_obliterationShelter = v4;

    v6 = self->_obliterationShelter;
    v8 = 0;
    -[DMCObliterationShelter retrieveWithError:](v6, "retrieveWithError:", &v8);
    obliterationShelter = self->_obliterationShelter;
  }
  return obliterationShelter;
}

- (void)setEnrollmentType:(unint64_t)a3
{
  void *v5;
  char v6;
  id v7;

  if (self->_enrollmentType != a3)
  {
    self->_enrollmentType = a3;
    -[DMCEnrollmentFlowController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[DMCEnrollmentFlowController delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enrollmentFlowController:didUpdateEnrollmentType:", self, a3);

    }
  }
}

+ (id)chooseServerFromUAORGOServers:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = *(NSObject **)DMCLogObjects();
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = v7;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_219D1D000, v8, OS_LOG_TYPE_DEBUG, "Chosen server: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_ERROR, "Invalid servers list to choose from: no servers listed.", buf, 2u);
    }
    if (a4)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BE2A578];
      DMCErrorArray();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v11, 15004, v12, 0, *MEMORY[0x24BE2A588], 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (void)cleanUpDirtyState
{
  id v3;

  -[DMCEnrollmentFlowController dirtyState](self, "dirtyState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _cleanupDirtyState:](self, "_cleanupDirtyState:", v3);

}

- (void)startInBuddyEnrollmentFlowRestartIfFail:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  v7 = -[DMCEnrollmentFlowController _shouldDoReturnToService](self, "_shouldDoReturnToService");
  v8 = *(NSObject **)DMCLogObjects();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v8, OS_LOG_TYPE_DEFAULT, "Starting Return to Service Enrollment...", buf, 2u);
    }
    -[DMCEnrollmentFlowController setIsReturnToService:](self, "setIsReturnToService:", 1);
  }
  else if (v9)
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_219D1D000, v8, OS_LOG_TYPE_DEFAULT, "Starting in Buddy Enrollment...", v11, 2u);
  }
  if (v4)
    v10 = -[DMCEnrollmentFlowController isReturnToService](self, "isReturnToService") ^ 1;
  else
    v10 = 0;
  -[DMCEnrollmentFlowController _startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:](self, "_startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:", 9, 0, v10, v6);

}

- (void)startORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_219D1D000, v13, OS_LOG_TYPE_DEFAULT, "Starting ORGO enrollment flow...", v14, 2u);
  }
  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v12);

  -[DMCEnrollmentFlowController _startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:](self, "_startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:", 1, v11, v6, v10);
}

- (void)startUAORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_219D1D000, v13, OS_LOG_TYPE_DEFAULT, "Starting UAORGO enrollment flow...", v14, 2u);
  }
  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v12);

  -[DMCEnrollmentFlowController setIsPostBuddy:](self, "setIsPostBuddy:", 1);
  -[DMCEnrollmentFlowController _startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:](self, "_startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:", 3, v11, v6, v10);

}

- (void)startPostBuddyORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", a3);
  -[DMCEnrollmentFlowController setIsPostBuddy:](self, "setIsPostBuddy:", 1);
  -[DMCEnrollmentFlowController _startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:](self, "_startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:", 1, v11, v6, v10);

}

- (void)startMacBuddyORGOEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_219D1D000, v13, OS_LOG_TYPE_DEFAULT, "Starting ORGO enrollment flow for MacBuddy...", v14, 2u);
  }
  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v12);

  -[DMCEnrollmentFlowController _startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:](self, "_startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:", 2, v11, v6, v10);
}

- (void)startWatchEnrollmentFlowWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_219D1D000, v13, OS_LOG_TYPE_DEFAULT, "Starting Watch enrollment flow...", v14, 2u);
  }
  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v12);

  -[DMCEnrollmentFlowController _startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:](self, "_startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:", 8, v11, v6, v10);
}

- (void)renewORGOEnrollmentWithServiceURL:(id)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 cleanupIfFail:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint8_t v16[16];

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_219D1D000, v15, OS_LOG_TYPE_DEFAULT, "Renewing ORGO enrollment flow...", v16, 2u);
  }
  -[DMCEnrollmentFlowController setIsRenewalFlow:](self, "setIsRenewalFlow:", 1);
  -[DMCEnrollmentFlowController setCleanupIfFail:](self, "setCleanupIfFail:", v7);
  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v14);

  -[DMCEnrollmentFlowController setIsPostBuddy:](self, "setIsPostBuddy:", 1);
  -[DMCEnrollmentFlowController _startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:](self, "_startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:", 1, v13, v8, v12);

}

- (void)restartORGOEnrollmentWithServiceURL:(id)a3 anchorCertificates:(id)a4 isPostRestoration:(BOOL)a5 restartIfFail:(BOOL)a6 cleanupIfFail:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint8_t v18[16];

  v8 = a7;
  v9 = a6;
  v10 = a5;
  v14 = a8;
  v15 = a4;
  v16 = a3;
  v17 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_219D1D000, v17, OS_LOG_TYPE_DEFAULT, "Restarting ORGO enrollment flow...", v18, 2u);
  }
  -[DMCEnrollmentFlowController setIsRenewalFlow:](self, "setIsRenewalFlow:", 1);
  -[DMCEnrollmentFlowController setCleanupIfFail:](self, "setCleanupIfFail:", v8);
  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v16);

  -[DMCEnrollmentFlowController setIsPostRestoration:](self, "setIsPostRestoration:", v10);
  -[DMCEnrollmentFlowController _startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:](self, "_startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:", 1, v15, v9, v14);

}

- (void)startBYODEnrollmentFlowRestartIfFail:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v6 = a4;
  v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_DEFAULT, "Starting BYOD enrollment flow...", v8, 2u);
  }
  -[DMCEnrollmentFlowController setIsPostBuddy:](self, "setIsPostBuddy:", 1);
  -[DMCEnrollmentFlowController _startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:](self, "_startEnrollmentFlowWithType:anchorCertificates:restartIfFail:completionHandler:", 4, 0, v4, v6);

}

- (void)continueMacBuddyORGOEnrollmentFlowWithAuthenticationResults:(id)a3 serviceURL:(id)a4 bearerToken:(id)a5 profileData:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", 2);
  -[DMCEnrollmentFlowController setEnrollmentMethod:](self, "setEnrollmentMethod:", 1);
  -[DMCEnrollmentFlowController setEnrollmentCompletionHandler:](self, "setEnrollmentCompletionHandler:", v13);

  -[DMCEnrollmentFlowController setRestartIfFail:](self, "setRestartIfFail:", 0);
  -[DMCEnrollmentFlowController setAuthenticationResults:](self, "setAuthenticationResults:", v16);

  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v15);
  v24 = *MEMORY[0x24BE60CF0];
  v25[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController setAuthTokens:](self, "setAuthTokens:", v17);

  -[DMCEnrollmentFlowController setProfileData:](self, "setProfileData:", v14);
  -[DMCEnrollmentFlowController profileData](self, "profileData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  LOBYTE(v16) = -[DMCEnrollmentFlowController _extractAndVerifyPropertiesFromProfileData:enrollmentMethod:isESSO:essoAppITunesStoreID:error:](self, "_extractAndVerifyPropertiesFromProfileData:enrollmentMethod:isESSO:essoAppITunesStoreID:error:", v18, -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"), 0, 0, &v23);
  v19 = v23;

  if ((v16 & 1) != 0)
  {
    -[DMCEnrollmentFlowControllerBase workerQueue](self, "workerQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __144__DMCEnrollmentFlowController_continueMacBuddyORGOEnrollmentFlowWithAuthenticationResults_serviceURL_bearerToken_profileData_completionHandler___block_invoke;
    v22[3] = &unk_24DBE3370;
    v22[4] = self;
    objc_msgSend(v20, "queueBlock:", v22);

    -[DMCEnrollmentFlowController _ORGO_MACBuddy_secondPartSteps](self, "_ORGO_MACBuddy_secondPartSteps");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowControllerBase _appendSteps:](self, "_appendSteps:", v21);

    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }
  else
  {
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v19, 0);
  }

}

void __144__DMCEnrollmentFlowController_continueMacBuddyORGOEnrollmentFlowWithAuthenticationResults_serviceURL_bearerToken_profileData_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stepQueue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)reauthBYODEnrollmentFlowRestartIfFail:(BOOL)a3 rmAccountIdentifier:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  uint8_t buf[8];
  _QWORD v25[2];
  _QWORD v26[3];

  v6 = a3;
  v26[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219D1D000, v10, OS_LOG_TYPE_DEFAULT, "Re-authenticate BYOD", buf, 2u);
  }
  -[DMCEnrollmentFlowController setCleanupIfFail:](self, "setCleanupIfFail:", 0);
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dmc_remoteManagementAccountForIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "dmc_bearerReauthURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v12, "dmc_bearerReauthParams");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v15 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219D1D000, v15, OS_LOG_TYPE_DEBUG, "Synthesizing re-authenticate parameters", buf, 2u);
        }
        v25[0] = *MEMORY[0x24BE60CE0];
        objc_msgSend(MEMORY[0x24BE60D50], "authenticationMethod");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = *MEMORY[0x24BE60CF8];
        v26[0] = v16;
        v26[1] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", 4);
      -[DMCEnrollmentFlowController setEnrollmentMethod:](self, "setEnrollmentMethod:", objc_msgSend(v12, "dmc_enrollmentMethod"));
      -[DMCEnrollmentFlowController setEnrollmentCompletionHandler:](self, "setEnrollmentCompletionHandler:", v9);
      objc_msgSend(v12, "dmc_personaIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController setPersonaID:](self, "setPersonaID:", v17);

      -[DMCEnrollmentFlowController setRmAccountIdentifier:](self, "setRmAccountIdentifier:", v8);
      -[DMCEnrollmentFlowController setRestartIfFail:](self, "setRestartIfFail:", v6);
      -[DMCEnrollmentFlowController setAuthParams:](self, "setAuthParams:", v14);
      objc_msgSend(v12, "dmc_signInUserIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController setUsername:](self, "setUsername:", v18);

      -[DMCEnrollmentFlowController setNoCompletionScene:](self, "setNoCompletionScene:", 1);
      -[DMCEnrollmentFlowControllerBase workerQueue](self, "workerQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __107__DMCEnrollmentFlowController_reauthBYODEnrollmentFlowRestartIfFail_rmAccountIdentifier_completionHandler___block_invoke;
      v23[3] = &unk_24DBE3370;
      v23[4] = self;
      objc_msgSend(v19, "queueBlock:", v23);

      -[DMCEnrollmentFlowController _ADxE_reauthSteps](self, "_ADxE_reauthSteps");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowControllerBase _appendSteps:](self, "_appendSteps:", v20);

      -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
    }
    else
    {
      v22 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219D1D000, v22, OS_LOG_TYPE_ERROR, "Failed: RM account not set to re-authenticate", buf, 2u);
      }
      +[DMCEnrollmentFlowController _createMissingRMAccountError](DMCEnrollmentFlowController, "_createMissingRMAccountError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v14);
    }

  }
  else
  {
    v21 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v21, OS_LOG_TYPE_ERROR, "Failed: missing RM account to re-authenticate", buf, 2u);
    }
    +[DMCEnrollmentFlowController _createMissingRMAccountError](DMCEnrollmentFlowController, "_createMissingRMAccountError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v13);
  }

}

void __107__DMCEnrollmentFlowController_reauthBYODEnrollmentFlowRestartIfFail_rmAccountIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stepQueue");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)updateMDMUserEnrollmentWithManagedAppleID:(id)a3 profileIdentifier:(id)a4 organizationName:(id)a5 personaID:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a5;
  v17 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543874;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    v22 = 2114;
    v23 = v14;
    _os_log_impl(&dword_219D1D000, v17, OS_LOG_TYPE_DEFAULT, "Update MDM User Enrollment managedAppleID: %{public}@, profileIdentifier: %{public}@, personaID: %{public}@", (uint8_t *)&v18, 0x20u);
  }
  -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", 6);
  -[DMCEnrollmentFlowController setEnrollmentMethod:](self, "setEnrollmentMethod:", 4);
  -[DMCEnrollmentFlowController setEnrollmentCompletionHandler:](self, "setEnrollmentCompletionHandler:", v15);

  -[DMCEnrollmentFlowController setRestartIfFail:](self, "setRestartIfFail:", 0);
  -[DMCEnrollmentFlowController setManagedAppleID:](self, "setManagedAppleID:", v12);
  -[DMCEnrollmentFlowController setProfileIdentifier:](self, "setProfileIdentifier:", v13);
  -[DMCEnrollmentFlowController setOrganizationName:](self, "setOrganizationName:", v16);

  -[DMCEnrollmentFlowController setPersonaID:](self, "setPersonaID:", v14);
  -[DMCEnrollmentFlowController _resetToInitialSteps](self, "_resetToInitialSteps");
  -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");

}

- (void)updateSharediPadUserChannelWithManagedAppleID:(id)a3 profileIdentifier:(id)a4 organizationName:(id)a5 enrollmentURL:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138544130;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    v22 = 2114;
    v23 = v14;
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_219D1D000, v17, OS_LOG_TYPE_DEFAULT, "Update Shared iPad User Channel managedAppleID: %{public}@, profileIdentifier: %{public}@, organizationName: %{public}@, enrollmentURL: %{public}@", (uint8_t *)&v18, 0x2Au);
  }
  -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", 7);
  -[DMCEnrollmentFlowController setEnrollmentMethod:](self, "setEnrollmentMethod:", 3);
  -[DMCEnrollmentFlowController setEnrollmentCompletionHandler:](self, "setEnrollmentCompletionHandler:", v16);

  -[DMCEnrollmentFlowController setRestartIfFail:](self, "setRestartIfFail:", 0);
  -[DMCEnrollmentFlowController setManagedAppleID:](self, "setManagedAppleID:", v12);
  -[DMCEnrollmentFlowController setProfileIdentifier:](self, "setProfileIdentifier:", v13);
  -[DMCEnrollmentFlowController setOrganizationName:](self, "setOrganizationName:", v14);
  -[DMCEnrollmentFlowController setEnrollmentURL:](self, "setEnrollmentURL:", v15);
  -[DMCEnrollmentFlowController _resetToInitialSteps](self, "_resetToInitialSteps");
  -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");

}

- (void)terminateEnrollmentFlow
{
  -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", 0, 1);
}

- (void)_startEnrollmentFlowWithType:(unint64_t)a3 anchorCertificates:(id)a4 restartIfFail:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  BOOL v17;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", a3);
  -[DMCEnrollmentFlowController setEnrollmentCompletionHandler:](self, "setEnrollmentCompletionHandler:", v11);
  if (a3 - 1 >= 6 && a3 - 8 > 1)
  {
    v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)a3;
      _os_log_impl(&dword_219D1D000, v12, OS_LOG_TYPE_ERROR, "Failed: %lu feature is not supported", (uint8_t *)location, 0xCu);
    }
    +[DMCEnrollmentFlowController _createUnsupportedFeatureError](DMCEnrollmentFlowController, "_createUnsupportedFeatureError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v13, 0);

  }
  else
  {
    objc_initWeak(location, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __111__DMCEnrollmentFlowController__startEnrollmentFlowWithType_anchorCertificates_restartIfFail_completionHandler___block_invoke;
    v14[3] = &unk_24DBE3398;
    objc_copyWeak(v16, location);
    v16[1] = (id)a3;
    v17 = a5;
    v15 = v10;
    -[DMCEnrollmentFlowController _enrollmentTypeAuthorizedBySDP:completion:](self, "_enrollmentTypeAuthorizedBySDP:completion:", a3, v14);

    objc_destroyWeak(v16);
    objc_destroyWeak(location);
  }

}

void __111__DMCEnrollmentFlowController__startEnrollmentFlowWithType_anchorCertificates_restartIfFail_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v6 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 48);
        v10 = 134217984;
        v11 = v7;
        _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_ERROR, "Failed: %lu feature is not supported while SDP is unauthorized", (uint8_t *)&v10, 0xCu);
      }
      objc_msgSend((id)objc_opt_class(), "_createEnrollmentNotAllowedDuringSDPError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_flowTerminatedWithError:canceled:", v8, 1);

    }
    else
    {
      objc_msgSend(WeakRetained, "setRestartIfFail:", *(unsigned __int8 *)(a1 + 56));
      certificatesFromDERCertificateDataArray();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAnchorCertificateRefs:", v9);

      objc_msgSend(v5, "_resetToInitialSteps");
      objc_msgSend(v5, "_pollNextStep");
    }
  }

}

- (void)_workerQueue_performFlowStep:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  DMCEnrollmentFlowController *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  DMCEnrollmentFlowController *v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  DMCEnrollmentFlowController *v56;
  DMCEnrollmentFlowController *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  _BOOL8 v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[DMCEnrollmentFlowController _nameForStep:](self, "_nameForStep:", a3);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v74 = v7;
    _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_DEFAULT, "Will perform enrollment step: %{public}@", buf, 0xCu);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE2A838], "currentPersonaID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE2A838], "currentPersonaTypeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v74 = "-[DMCEnrollmentFlowController _workerQueue_performFlowStep:]";
    v75 = 1024;
    v76 = 388;
    v77 = 2114;
    v78 = v8;
    v79 = 2114;
    v80 = v9;
    _os_log_impl(&dword_219D1D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", buf, 0x26u);

  }
  -[DMCEnrollmentFlowControllerBase setCurrentStep:](self, "setCurrentStep:", a3);
  -[DMCEnrollmentFlowController _stepsWithUI](self, "_stepsWithUI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if (v12)
    -[DMCEnrollmentFlowController setHasExecutedUIStep:](self, "setHasExecutedUIStep:", 1);
  -[DMCEnrollmentFlowController _postEnrollmentSteps](self, "_postEnrollmentSteps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v15)
  {
    v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v16, OS_LOG_TYPE_DEFAULT, "The core part of the enrollment flow is done. Cleaning up disk values...", buf, 2u);
    }
    -[DMCEnrollmentFlowController _workerQueue_stopMonitorAndEmptyDiskValues](self, "_workerQueue_stopMonitorAndEmptyDiskValues");
  }
  switch(a3)
  {
    case 0uLL:
      -[DMCEnrollmentFlowController _preflightEnrollmentWithEnrollmentType:isRenewalFlow:isPostRestoration:isPostBuddy:](self, "_preflightEnrollmentWithEnrollmentType:isRenewalFlow:isPostRestoration:isPostBuddy:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController isRenewalFlow](self, "isRenewalFlow"), -[DMCEnrollmentFlowController isPostRestoration](self, "isPostRestoration"), -[DMCEnrollmentFlowController isPostBuddy](self, "isPostBuddy"));
      return;
    case 1uLL:
      -[DMCEnrollmentFlowController username](self, "username");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _askForUsernameWithDefaultUsername:](self, "_askForUsernameWithDefaultUsername:", v17);
      goto LABEL_61;
    case 2uLL:
      -[DMCEnrollmentFlowController username](self, "username");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _fetchServerInformationWithUsername:](self, "_fetchServerInformationWithUsername:", v17);
      goto LABEL_61;
    case 3uLL:
      -[DMCEnrollmentFlowController servers](self, "servers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _chooseEnrollmentTypeWithAvailableServers:serverInformationSource:](self, "_chooseEnrollmentTypeWithAvailableServers:serverInformationSource:", v17, -[DMCEnrollmentFlowController serverInformationSource](self, "serverInformationSource"));
      goto LABEL_61;
    case 4uLL:
      -[DMCEnrollmentFlowController serviceURL](self, "serviceURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType");
      v19 = -[DMCEnrollmentFlowController isPostBuddy](self, "isPostBuddy");
      -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "getMachineInfoForEnrollmentType:enrollmentMethod:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController anchorCertificateRefs](self, "anchorCertificateRefs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _detectAuthTypeWithServiceURL:enrollmentType:isPostBuddy:machineInfo:anchorCertificateRefs:](self, "_detectAuthTypeWithServiceURL:enrollmentType:isPostBuddy:machineInfo:anchorCertificateRefs:", v17, v18, v19, v21, v22);

      goto LABEL_52;
    case 5uLL:
      -[DMCEnrollmentFlowController essoDetails](self, "essoDetails");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "configurationProfile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController devicePasscode](self, "devicePasscode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _installESSOConfigurationProfile:devicePasscode:personaID:](self, "_installESSOConfigurationProfile:devicePasscode:personaID:", v23, v24, v25);
      goto LABEL_58;
    case 6uLL:
      -[DMCEnrollmentFlowController essoDetails](self, "essoDetails");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "iTunesStoreID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController essoDetails](self, "essoDetails");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appIDs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _installEnterpriseApplication:debuggingAppIDs:personaID:](self, "_installEnterpriseApplication:debuggingAppIDs:personaID:", v23, v25, v26);
      goto LABEL_57;
    case 7uLL:
      -[DMCEnrollmentFlowController authParams](self, "authParams");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod");
      -[DMCEnrollmentFlowController username](self, "username");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _processAuthServicesWithAuthParams:enrollmentMethod:username:](self, "_processAuthServicesWithAuthParams:enrollmentMethod:username:", v17, v27, v28);
      goto LABEL_27;
    case 8uLL:
      -[DMCEnrollmentFlowController _askForPasscodeIfNeeded](self, "_askForPasscodeIfNeeded");
      return;
    case 9uLL:
      -[DMCEnrollmentFlowController devicePasscode](self, "devicePasscode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController devicePasscodeData](self, "devicePasscodeData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _createEnterprisePersonaWithDevicePasscode:devicePasscodeData:devicePasscodeDataType:](self, "_createEnterprisePersonaWithDevicePasscode:devicePasscodeData:devicePasscodeDataType:", v17, v23, -[DMCEnrollmentFlowController devicePasscodeDataType](self, "devicePasscodeDataType"));
      goto LABEL_60;
    case 0xAuLL:
      -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType");
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v68) = -[DMCEnrollmentFlowController isRenewalFlow](self, "isRenewalFlow");
      v30 = self;
      v31 = v17;
      v32 = v29;
      v33 = v28;
      v34 = 0;
      goto LABEL_24;
    case 0xBuLL:
      -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType");
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v68) = -[DMCEnrollmentFlowController isRenewalFlow](self, "isRenewalFlow");
      v30 = self;
      v31 = v17;
      v32 = v35;
      v33 = v28;
      v34 = 1;
LABEL_24:
      -[DMCEnrollmentFlowController _authenticateMAID:authenticationResults:enrollmentType:personaID:ephemeral:silent:isRenewalFlow:](v30, "_authenticateMAID:authenticationResults:enrollmentType:personaID:ephemeral:silent:isRenewalFlow:", v31, 0, v32, v33, v34, 0, v68);
      goto LABEL_27;
    case 0xCuLL:
      -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController authenticationResults](self, "authenticationResults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType");
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v68) = -[DMCEnrollmentFlowController isRenewalFlow](self, "isRenewalFlow");
      -[DMCEnrollmentFlowController _authenticateMAID:authenticationResults:enrollmentType:personaID:ephemeral:silent:isRenewalFlow:](self, "_authenticateMAID:authenticationResults:enrollmentType:personaID:ephemeral:silent:isRenewalFlow:", v17, v23, v36, v37, 0, 1, v68);
      goto LABEL_37;
    case 0xDuLL:
      -[DMCEnrollmentFlowController authenticationResults](self, "authenticationResults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType");
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _signInMAIDWithAuthenticationResult:enrollmentType:personaID:isRenewalFlow:](self, "_signInMAIDWithAuthenticationResult:enrollmentType:personaID:isRenewalFlow:", v17, v38, v28, -[DMCEnrollmentFlowController isRenewalFlow](self, "isRenewalFlow"));
LABEL_27:

      goto LABEL_61;
    case 0xEuLL:
      -[DMCEnrollmentFlowController username](self, "username");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _createRMAccountIfNeededWithSignInUserIdentifier:assignedMAID:existingRMAccountID:enrollmentType:enrollmentMethod:isRenewalFlow:](self, "_createRMAccountIfNeededWithSignInUserIdentifier:assignedMAID:existingRMAccountID:enrollmentType:enrollmentMethod:isRenewalFlow:", v17, v23, v24, -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"), -[DMCEnrollmentFlowController isRenewalFlow](self, "isRenewalFlow"));
      goto LABEL_59;
    case 0xFuLL:
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController authParams](self, "authParams");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController anchorCertificateRefs](self, "anchorCertificateRefs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _exchangeMAIDForBearerTokenWithRMAccountIdentifier:authParams:anchorCertificateRefs:](self, "_exchangeMAIDForBearerTokenWithRMAccountIdentifier:authParams:anchorCertificateRefs:", v17, v23, v24);
      goto LABEL_59;
    case 0x10uLL:
      -[DMCEnrollmentFlowController serviceURL](self, "serviceURL");
      v71 = objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController authTokens](self, "authTokens");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "getMachineInfoForEnrollmentType:enrollmentMethod:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController anchorCertificateRefs](self, "anchorCertificateRefs");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType");
      v44 = -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod");
      -[DMCEnrollmentFlowController essoDetails](self, "essoDetails");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController essoAppITunesStoreID](self, "essoAppITunesStoreID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v69) = -[DMCEnrollmentFlowController isReturnToService](self, "isReturnToService");
      LOBYTE(v68) = v45 != 0;
      v47 = self;
      v48 = (void *)v71;
      -[DMCEnrollmentFlowController _fetchEnrollmentProfileFromServiceURL:authTokens:machineInfo:anchorCertificateRefs:enrollmentType:enrollmentMethod:isESSO:essoAppITunesStoreID:isReturnToService:](v47, "_fetchEnrollmentProfileFromServiceURL:authTokens:machineInfo:anchorCertificateRefs:enrollmentType:enrollmentMethod:isESSO:essoAppITunesStoreID:isReturnToService:", v71, v39, v41, v42, v43, v44, v68, v46, v69);

      goto LABEL_39;
    case 0x11uLL:
      -[DMCEnrollmentFlowController profileData](self, "profileData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController cloudConfig](self, "cloudConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _askForUserConsentWithProfileData:managedAppleID:cloudConfig:isReturnToService:](self, "_askForUserConsentWithProfileData:managedAppleID:cloudConfig:isReturnToService:", v17, v23, v24, -[DMCEnrollmentFlowController isReturnToService](self, "isReturnToService"));
      goto LABEL_59;
    case 0x12uLL:
      -[DMCEnrollmentFlowController profileData](self, "profileData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _displayManagementDetailsOverviewWithProfileData:managedAppleID:](self, "_displayManagementDetailsOverviewWithProfileData:managedAppleID:", v17, v23);
      goto LABEL_60;
    case 0x13uLL:
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController authenticationResults](self, "authenticationResults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _updateRMAccountWithIdentifier:authenticationResults:enrollmentMethod:](self, "_updateRMAccountWithIdentifier:authenticationResults:enrollmentMethod:", v17, v23, -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"));
      goto LABEL_60;
    case 0x14uLL:
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController authTokens](self, "authTokens");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController profileIdentifier](self, "profileIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController organizationName](self, "organizationName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _updateRMAccountWithIdentifier:authTokens:profileIdentifier:organizationName:personaID:enrollmentMethod:](self, "_updateRMAccountWithIdentifier:authTokens:profileIdentifier:organizationName:personaID:enrollmentMethod:", v17, v23, v24, v25, v26, -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"));
      goto LABEL_57;
    case 0x15uLL:
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController authTokens](self, "authTokens");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _updateRMAccountWithIdentifier:authTokens:personaID:](self, "_updateRMAccountWithIdentifier:authTokens:personaID:", v17, v23, v24);
      goto LABEL_59;
    case 0x16uLL:
      -[DMCEnrollmentFlowController altDSID](self, "altDSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[DMCEnrollmentFlowController isProfileLocked](self, "isProfileLocked");
      -[DMCEnrollmentFlowController organizationName](self, "organizationName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController friendlyName](self, "friendlyName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _correlateMAIDWithAltDSID:withRMAccount:isProfileLocked:organizationName:friendlyName:personaID:](self, "_correlateMAIDWithAltDSID:withRMAccount:isProfileLocked:organizationName:friendlyName:personaID:", v17, v23, v49, v37, v50, v51);

LABEL_37:
      goto LABEL_60;
    case 0x17uLL:
      -[DMCEnrollmentFlowController profileData](self, "profileData");
      v72 = objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController devicePasscode](self, "devicePasscode");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController essoDetails](self, "essoDetails");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController essoAppITunesStoreID](self, "essoAppITunesStoreID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController ESSOConfigurationProfileIdentifier](self, "ESSOConfigurationProfileIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController wifiProfileIdentifier](self, "wifiProfileIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType");
      LOBYTE(v70) = -[DMCEnrollmentFlowController isReturnToService](self, "isReturnToService");
      v56 = self;
      v48 = (void *)v72;
      -[DMCEnrollmentFlowController _installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:isESSO:essoAppITunesStoreID:essoConfigurationProfile:wifiProfileIdentifier:enrollmentType:isReturnToService:](v56, "_installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:isESSO:essoAppITunesStoreID:essoConfigurationProfile:wifiProfileIdentifier:enrollmentType:isReturnToService:", v72, v39, v40, v41, v42 != 0, v52, v53, v54, v55, v70);

LABEL_39:
      return;
    case 0x18uLL:
      -[DMCEnrollmentFlowController appBundleID](self, "appBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController essoDetails](self, "essoDetails");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController organizationName](self, "organizationName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _manageApplicationWithAppBundleID:essoDetails:organization:personaID:](self, "_manageApplicationWithAppBundleID:essoDetails:organization:personaID:", v17, v23, v24, v25);
      goto LABEL_58;
    case 0x19uLL:
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController profileIdentifier](self, "profileIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController organizationName](self, "organizationName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = self;
      v58 = v17;
      v59 = v23;
      v60 = v24;
      v61 = v25;
      v62 = 0;
      v63 = v26;
      goto LABEL_46;
    case 0x1AuLL:
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _reauthenticationCompleteWithRMIdentifier:](self, "_reauthenticationCompleteWithRMIdentifier:", v17);
      goto LABEL_61;
    case 0x1BuLL:
      -[DMCEnrollmentFlowController altDSID](self, "altDSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _promoteiCloudWithAltDSID:](self, "_promoteiCloudWithAltDSID:", v17);
      goto LABEL_61;
    case 0x1CuLL:
      -[DMCEnrollmentFlowController _requestiCloudSignInConfirmation](self, "_requestiCloudSignInConfirmation");
      return;
    case 0x1DuLL:
      -[DMCEnrollmentFlowController rmAccountIdentifier](self, "rmAccountIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController profileIdentifier](self, "profileIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController organizationName](self, "organizationName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController enrollmentURL](self, "enrollmentURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = self;
      v58 = v17;
      v59 = v23;
      v60 = v24;
      v61 = v25;
      v62 = v26;
      v63 = 0;
LABEL_46:
      -[DMCEnrollmentFlowController _updateAccountsWithRMIdentifier:managedAppleID:profileIdentifier:organizationName:enrollmentURL:personaID:](v57, "_updateAccountsWithRMIdentifier:managedAppleID:profileIdentifier:organizationName:enrollmentURL:personaID:", v58, v59, v60, v61, v62, v63);
      goto LABEL_57;
    case 0x1EuLL:
      -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController personaID](self, "personaID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _askForRestoreChoiceWithMAID:personaID:](self, "_askForRestoreChoiceWithMAID:personaID:", v17, v23);
      goto LABEL_60;
    case 0x1FuLL:
      -[DMCEnrollmentFlowController _restoreSetAsideProfiles](self, "_restoreSetAsideProfiles");
      return;
    case 0x20uLL:
      -[DMCEnrollmentFlowController _fetchCloudConfigWithEnrollmentType:isReturnToService:](self, "_fetchCloudConfigWithEnrollmentType:isReturnToService:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController isReturnToService](self, "isReturnToService"));
      return;
    case 0x21uLL:
      -[DMCEnrollmentFlowController cloudConfig](self, "cloudConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _storeCloudConfig:](self, "_storeCloudConfig:", v17);
      goto LABEL_61;
    case 0x22uLL:
      -[DMCEnrollmentFlowController cloudConfig](self, "cloudConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType");
      v65 = -[DMCEnrollmentFlowController isReturnToService](self, "isReturnToService");
      -[DMCEnrollmentFlowController obliterationShelter](self, "obliterationShelter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _analyzeCloudConfig:enrollmentType:isReturnToService:obliterationShelter:](self, "_analyzeCloudConfig:enrollmentType:isReturnToService:obliterationShelter:", v17, v64, v65, v20);
LABEL_52:

      goto LABEL_61;
    case 0x23uLL:
      -[DMCEnrollmentFlowController _askForMDMUsernameAndCredential](self, "_askForMDMUsernameAndCredential");
      return;
    case 0x24uLL:
      -[DMCEnrollmentFlowController serviceURL](self, "serviceURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController username](self, "username");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController password](self, "password");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "getMachineInfoForEnrollmentType:enrollmentMethod:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController anchorCertificateRefs](self, "anchorCertificateRefs");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _fetchEnrollmentProfileFromServiceURL:username:password:machineInfo:anchorCertificateRefs:](self, "_fetchEnrollmentProfileFromServiceURL:username:password:machineInfo:anchorCertificateRefs:", v17, v23, v24, v26, v66);
      goto LABEL_56;
    case 0x25uLL:
      v67 = (void *)MEMORY[0x24BDBCF48];
      -[DMCEnrollmentFlowController cloudConfig](self, "cloudConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE60DF0]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "URLWithString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "getMachineInfoForEnrollmentType:enrollmentMethod:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController anchorCertificateRefs](self, "anchorCertificateRefs");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _fetchEnrollmentProfileFromWebURL:machineInfo:anchorCertificateRefs:](self, "_fetchEnrollmentProfileFromWebURL:machineInfo:anchorCertificateRefs:", v24, v26, v66);
LABEL_56:

LABEL_57:
LABEL_58:

LABEL_59:
      goto LABEL_60;
    case 0x26uLL:
      -[DMCEnrollmentFlowController _waitForDeviceConfiguration](self, "_waitForDeviceConfiguration");
      return;
    case 0x27uLL:
      -[DMCEnrollmentFlowController expectedOSVersion](self, "expectedOSVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController expectedBuildVersion](self, "expectedBuildVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _promptForSoftwareUpdateWithExpectedOSVersion:expectedBuildVersion:](self, "_promptForSoftwareUpdateWithExpectedOSVersion:expectedBuildVersion:", v17, v23);
      goto LABEL_60;
    case 0x28uLL:
      -[DMCEnrollmentFlowController obliterationShelter](self, "obliterationShelter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "wifiProfileData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _ensureWiFiConnectionWithWiFiProfile:](self, "_ensureWiFiConnectionWithWiFiProfile:", v23);
LABEL_60:

LABEL_61:
      break;
    default:
      return;
  }
}

- (void)_resetToInitialSteps
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentFlowController;
  -[DMCEnrollmentFlowControllerBase _resetToInitialSteps](&v4, sel__resetToInitialSteps);
  -[DMCEnrollmentFlowController _commonStepsForEnrollmentType:isReturnToService:](self, "_commonStepsForEnrollmentType:isReturnToService:", -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"), -[DMCEnrollmentFlowController isReturnToService](self, "isReturnToService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowControllerBase _appendSteps:](self, "_appendSteps:", v3);

}

- (void)_workerQueue_stopMonitorAndEmptyDiskValues
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  uint8_t v7[16];

  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219D1D000, v3, OS_LOG_TYPE_DEFAULT, "Clean up local stored stuffs", v7, 2u);
  }
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopEnrollmentFlowMonitor");

  }
  -[DMCEnrollmentFlowController _writeDirtyStateToDisk:](self, "_writeDirtyStateToDisk:", 0);
}

- (void)_workerQueue_flowCompleted
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t v10[16];

  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_219D1D000, v4, OS_LOG_TYPE_DEFAULT, "Enrollment flow completed!", v10, 2u);
  }
  if (-[DMCEnrollmentFlowController isReturnToService](self, "isReturnToService"))
  {
    -[DMCEnrollmentFlowController obliterationShelter](self, "obliterationShelter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clear");

  }
  -[DMCEnrollmentFlowController _workerQueue_stopMonitorAndEmptyDiskValues](self, "_workerQueue_stopMonitorAndEmptyDiskValues");
  -[DMCEnrollmentFlowController _workerQueue_cleanupCachedValues](self, "_workerQueue_cleanupCachedValues");
  if (!-[DMCEnrollmentFlowController noCompletionScene](self, "noCompletionScene"))
  {
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showEnrollmentCompletionScene");

  }
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _unblockAppInstallsIfNecessaryWithCaller:](self, "_unblockAppInstallsIfNecessaryWithCaller:", v7);

  -[DMCEnrollmentFlowController enrollmentCompletionHandler](self, "enrollmentCompletionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DMCEnrollmentFlowController enrollmentCompletionHandler](self, "enrollmentCompletionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, 1, 0, 0);

    -[DMCEnrollmentFlowController setEnrollmentCompletionHandler:](self, "setEnrollmentCompletionHandler:", 0);
  }
}

- (void)_flowTerminatedWithError:(id)a3 canceled:(BOOL)a4
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  DMCEnrollmentFlowController *v12;
  SEL v13;
  BOOL v14;

  v7 = a3;
  -[DMCEnrollmentFlowControllerBase workerQueue](self, "workerQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__DMCEnrollmentFlowController__flowTerminatedWithError_canceled___block_invoke;
  v10[3] = &unk_24DBE33C0;
  v14 = a4;
  v11 = v7;
  v12 = self;
  v13 = a2;
  v9 = v7;
  objc_msgSend(v8, "queueBlock:", v10);

}

void __65__DMCEnrollmentFlowController__flowTerminatedWithError_canceled___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 56);
    v22 = 138543618;
    v23 = v3;
    v24 = 1024;
    v25 = v4;
    _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_DEFAULT, "Enrollment flow terminated with error: %{public}@, canceled: %d", (uint8_t *)&v22, 0x12u);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasExecutedUIStep") && *(_QWORD *)(a1 + 32))
    v5 = objc_msgSend(*(id *)(a1 + 40), "restartIfFail");
  else
    v5 = 0;
  v6 = objc_msgSend(*(id *)(a1 + 40), "cleanupIfFail");
  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "dirtyState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_cleanupDirtyState:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_writeDirtyStateToDisk:", 0);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isReturnToService"))
  {
    objc_msgSend(*(id *)(a1 + 40), "obliterationShelter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clear");

  }
  objc_msgSend(*(id *)(a1 + 40), "_workerQueue_cleanupCachedValues");
  objc_msgSend(*(id *)(a1 + 40), "managedConfigurationHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedConfigurationHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopEnrollmentFlowMonitor");

  }
  if (*(_BYTE *)(a1 + 56)
    || *(_QWORD *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "_convertErrorToHumanReadableError:"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 40), "presenter"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v21, "showEnrollmentFailure:", v20),
        v21,
        v20,
        *(_BYTE *)(a1 + 56)))
  {
    objc_msgSend(*(id *)(a1 + 40), "presenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = objc_msgSend(*(id *)(a1 + 40), "noCompletionScene");

      if ((v14 & 1) != 0)
        goto LABEL_19;
      objc_msgSend(*(id *)(a1 + 40), "presenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dismissEnrollmentScene");
    }

  }
LABEL_19:
  v15 = *(void **)(a1 + 40);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_unblockAppInstallsIfNecessaryWithCaller:", v16);

  v17 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v17, "_resetToInitialSteps");
    objc_msgSend(*(id *)(a1 + 40), "_pollNextStep");
  }
  else
  {
    objc_msgSend(v17, "enrollmentCompletionHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 40), "enrollmentCompletionHandler");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 40), "setEnrollmentCompletionHandler:", 0);
    }
  }
}

- (void)_workerQueue_cleanupCachedValues
{
  -[DMCEnrollmentFlowControllerBase setNextStepIndex:](self, "setNextStepIndex:", 0);
  -[DMCEnrollmentFlowController setDevicePasscode:](self, "setDevicePasscode:", 0);
  -[DMCEnrollmentFlowController setDevicePasscodeData:](self, "setDevicePasscodeData:", 0);
  -[DMCEnrollmentFlowController setManagedAppleID:](self, "setManagedAppleID:", 0);
  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", 0);
  -[DMCEnrollmentFlowController setServers:](self, "setServers:", 0);
  -[DMCEnrollmentFlowController setServerInformationSource:](self, "setServerInformationSource:", 0);
  -[DMCEnrollmentFlowController setAuthTokens:](self, "setAuthTokens:", 0);
  -[DMCEnrollmentFlowController setPersonaID:](self, "setPersonaID:", 0);
  -[DMCEnrollmentFlowController setAuthenticationResults:](self, "setAuthenticationResults:", 0);
  -[DMCEnrollmentFlowController setAltDSID:](self, "setAltDSID:", 0);
  -[DMCEnrollmentFlowController setProfileData:](self, "setProfileData:", 0);
  -[DMCEnrollmentFlowController setProfileIdentifier:](self, "setProfileIdentifier:", 0);
  -[DMCEnrollmentFlowController setRmAccountIdentifier:](self, "setRmAccountIdentifier:", 0);
  -[DMCEnrollmentFlowController setAnchorCertificateRefs:](self, "setAnchorCertificateRefs:", 0);
  -[DMCEnrollmentFlowController setAuthParams:](self, "setAuthParams:", 0);
  -[DMCEnrollmentFlowController setHasExecutedUIStep:](self, "setHasExecutedUIStep:", 0);
  -[DMCEnrollmentFlowController setEnrollmentMethod:](self, "setEnrollmentMethod:", 0);
  -[DMCEnrollmentFlowController setDirtyState:](self, "setDirtyState:", 0);
  -[DMCEnrollmentFlowController setOrganizationName:](self, "setOrganizationName:", 0);
  -[DMCEnrollmentFlowController setFriendlyName:](self, "setFriendlyName:", 0);
  -[DMCEnrollmentFlowController setEssoDetails:](self, "setEssoDetails:", 0);
  -[DMCEnrollmentFlowController setAppBundleID:](self, "setAppBundleID:", 0);
  -[DMCEnrollmentFlowController setESSOConfigurationProfileIdentifier:](self, "setESSOConfigurationProfileIdentifier:", 0);
  -[DMCEnrollmentFlowController setServerCapabilities:](self, "setServerCapabilities:", 0);
  -[DMCEnrollmentFlowController setEssoAppITunesStoreID:](self, "setEssoAppITunesStoreID:", 0);
  -[DMCEnrollmentFlowController setCloudConfig:](self, "setCloudConfig:", 0);
  -[DMCEnrollmentFlowController setPassword:](self, "setPassword:", 0);
  -[DMCEnrollmentFlowController setWifiProfileIdentifier:](self, "setWifiProfileIdentifier:", 0);
  -[DMCEnrollmentFlowController setExpectedOSVersion:](self, "setExpectedOSVersion:", 0);
  -[DMCEnrollmentFlowController setExpectedBuildVersion:](self, "setExpectedBuildVersion:", 0);
  -[DMCEnrollmentFlowController setIsReturnToService:](self, "setIsReturnToService:", 0);
  -[DMCEnrollmentFlowController setObliterationShelter:](self, "setObliterationShelter:", 0);
}

- (void)_preflightEnrollmentWithEnrollmentType:(unint64_t)a3 isRenewalFlow:(BOOL)a4 isPostRestoration:(BOOL)a5 isPostBuddy:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v6 = a5;
  v7 = a4;
  v57 = *MEMORY[0x24BDAC8D0];
  if (!a4)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isDeviceMDMEnrolled");

      if (v13
        && (a6
         || !-[DMCEnrollmentFlowController _canSkipMDMEnrollmentWithEnrollmentType:](self, "_canSkipMDMEnrollmentWithEnrollmentType:", a3)))
      {
        v14 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219D1D000, v14, OS_LOG_TYPE_ERROR, "The device is enrolled in MDM already! Aborting...", buf, 2u);
        }
        v15 = (void *)MEMORY[0x24BDD1540];
        v16 = *MEMORY[0x24BE2A578];
        DMCErrorArray();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *MEMORY[0x24BE2A588];
        v19 = v15;
        v20 = v16;
        v21 = 15010;
LABEL_16:
        objc_msgSend(v19, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, v21, v17, v18, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v28, 0);

        return;
      }
    }
    else
    {

    }
  }
  if (a3 == 4)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isDeviceSupervised");

      if (v24)
      {
        v25 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219D1D000, v25, OS_LOG_TYPE_ERROR, "Trying to start BYOD enrollment on a supervised device!", buf, 2u);
        }
        v26 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BE2A578];
        DMCErrorArray();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *MEMORY[0x24BE2A588];
        v19 = v26;
        v20 = v27;
        v21 = 15012;
        goto LABEL_16;
      }
    }
    else
    {

    }
  }
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_21;
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isDeviceMDMEnrolled");

  if ((v31 & 1) == 0)
  {
    -[DMCEnrollmentFlowController dirtyState](self, "dirtyState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController _cleanupDirtyState:](self, "_cleanupDirtyState:", v29);
LABEL_21:

  }
  if (!v7 || !-[DMCEnrollmentFlowController _isORGOEnrollment:](self, "_isORGOEnrollment:", a3))
    goto LABEL_46;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dmc_visibleRemoteManagementAccounts");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v34 = v33;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v51;
LABEL_26:
    v38 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v37)
        objc_enumerationMutation(v34);
      v39 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v38);
      if (-[DMCEnrollmentFlowController _isORGOEnrollment:](self, "_isORGOEnrollment:", objc_msgSend(v39, "dmc_enrollmentType")))
      {
        break;
      }
      if (v36 == ++v38)
      {
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v36)
          goto LABEL_26;
        goto LABEL_32;
      }
    }
    v40 = v39;

    if (!v40)
      goto LABEL_37;
    v41 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v40;
      _os_log_impl(&dword_219D1D000, v41, OS_LOG_TYPE_ERROR, "Have existing RM Account: %{public}@!", buf, 0xCu);
    }
    objc_msgSend(v40, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController setRmAccountIdentifier:](self, "setRmAccountIdentifier:", v42);

    objc_msgSend(v40, "dmc_signInUserIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController setUsername:](self, "setUsername:", v43);

    objc_msgSend(v40, "username");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController setManagedAppleID:](self, "setManagedAppleID:", v44);

    objc_msgSend(v40, "dmc_altDSID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController setAltDSID:](self, "setAltDSID:", v45);

    -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", objc_msgSend(v40, "dmc_enrollmentType"));
  }
  else
  {
LABEL_32:

LABEL_37:
    if (!v6)
      goto LABEL_45;
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dmc_primaryiCloudAccount");
    v40 = (id)objc_claimAutoreleasedReturnValue();

    v47 = *(NSObject **)DMCLogObjects();
    if (v40)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219D1D000, v47, OS_LOG_TYPE_DEFAULT, "We don't have RM Account but we have Apple Account! Using the information from the Apple Account.", buf, 2u);
      }
      objc_msgSend(v40, "username");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController setUsername:](self, "setUsername:", v48);

      objc_msgSend(v40, "username");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController setManagedAppleID:](self, "setManagedAppleID:", v49);

    }
    else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v47, OS_LOG_TYPE_ERROR, "No Primary AppleAccount after restoration!", buf, 2u);
    }
  }

LABEL_45:
LABEL_46:
  -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
}

- (void)_askForUsernameWithDefaultUsername:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment"))
  {
    objc_msgSend(MEMORY[0x24BE2A7F0], "simulatedMDMAccountDrivenEnrollmentDefaultUsername");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__DMCEnrollmentFlowController__askForUsernameWithDefaultUsername___block_invoke;
  v7[3] = &unk_24DBE3410;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "requestUsernameWithDefaultUsername:completionHandler:", v4, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __66__DMCEnrollmentFlowController__askForUsernameWithDefaultUsername___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  char v11;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__DMCEnrollmentFlowController__askForUsernameWithDefaultUsername___block_invoke_2;
    v9[3] = &unk_24DBE33E8;
    v9[4] = v7;
    v11 = a3;
    v10 = v5;
    objc_msgSend(v8, "queueBlock:", v9);

  }
}

uint64_t __66__DMCEnrollmentFlowController__askForUsernameWithDefaultUsername___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 1)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[DMCEnrollmentFlowController _askForUsernameWithDefaultUsername:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "setUsername:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
}

- (void)_fetchServerInformationWithUsername:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController serviceDiscoveryHelper](self, "serviceDiscoveryHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__DMCEnrollmentFlowController__fetchServerInformationWithUsername___block_invoke;
  v6[3] = &unk_24DBE3460;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "discoverServerForUserIdentifier:anchorCertificateRefs:completionHandler:", v4, 0, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __67__DMCEnrollmentFlowController__fetchServerInformationWithUsername___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__DMCEnrollmentFlowController__fetchServerInformationWithUsername___block_invoke_2;
    v12[3] = &unk_24DBE3438;
    v12[4] = v10;
    v13 = v8;
    v14 = v7;
    v15 = a3;
    objc_msgSend(v11, "queueBlock:", v12);

  }
}

uint64_t __67__DMCEnrollmentFlowController__fetchServerInformationWithUsername___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 2)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[DMCEnrollmentFlowController _fetchServerInformationWithUsername:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    return objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", v3, 0);
  objc_msgSend(*(id *)(a1 + 32), "setServers:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setServerInformationSource:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
}

- (id)_findServerWithVersion:(id)a3 servers:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "responseVersion", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v5);

        if ((v13 & 1) != 0)
        {
          v17 = v11;

          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    v16 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    v25 = 2048;
    v26 = v16;
    _os_log_impl(&dword_219D1D000, v15, OS_LOG_TYPE_INFO, "No %{public}@ server found. Total servers amount: %ld", buf, 0x16u);

  }
  v17 = 0;
LABEL_13:

  return v17;
}

- (void)_chooseEnrollmentTypeWithAvailableServers:(id)a3 serverInformationSource:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DMCEnrollmentFlowController _findServerWithVersion:servers:](self, "_findServerWithVersion:servers:", *MEMORY[0x24BE2A8C8], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _findServerWithVersion:servers:](self, "_findServerWithVersion:servers:", *MEMORY[0x24BE2A8A8], v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _findServerWithVersion:servers:](self, "_findServerWithVersion:servers:", *MEMORY[0x24BE2A8B8], v6);
  v9 = objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _findServerWithVersion:servers:](self, "_findServerWithVersion:servers:", *MEMORY[0x24BE2A8B0], v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _findServerWithVersion:servers:](self, "_findServerWithVersion:servers:", *MEMORY[0x24BE2A8C0], v6);
  v11 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE2A7E8], "isAppleInternal")
    && objc_msgSend(MEMORY[0x24BE2A7D8], "DSLiveOnModeEnabled"))
  {
    v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_219D1D000, v12, OS_LOG_TYPE_DEFAULT, "We are on Apple internal device with DS live on feature enabled.", (uint8_t *)&v26, 2u);
    }
    a4 = 3;
  }
  else if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    goto LABEL_11;
  }
  if (v7)
  {
    v13 = 4;
    v14 = v7;
LABEL_20:
    -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", v13);
    v16 = v14;
LABEL_21:
    v17 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v16, "responseVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v19;
      _os_log_impl(&dword_219D1D000, v18, OS_LOG_TYPE_DEFAULT, "Picked server with version: %{public}@", (uint8_t *)&v26, 0xCu);

    }
    v20 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v16, "responseBaseURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v22);

    goto LABEL_27;
  }
  if (v8)
  {
    v13 = 5;
    v14 = v8;
    goto LABEL_20;
  }
LABEL_11:
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v9 | v11)
    {
      -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", 4);
      if (v9)
        v15 = (void *)v9;
      else
        v15 = (void *)v11;
      v16 = v15;
      if (v16)
        goto LABEL_21;
    }
    else if (v10)
    {
      v13 = 5;
      v14 = v10;
      goto LABEL_20;
    }
  }
  v23 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v26 = 138543362;
    v27 = v6;
    _os_log_impl(&dword_219D1D000, v23, OS_LOG_TYPE_ERROR, "Failed to pick server from: %{public}@", (uint8_t *)&v26, 0xCu);
  }
  -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", 0);
  v16 = 0;
LABEL_27:
  -[DMCEnrollmentFlowController serviceURL](self, "serviceURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }
  else
  {
    +[DMCEnrollmentFlowController _createGeneralError](DMCEnrollmentFlowController, "_createGeneralError");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v25, 0);

  }
}

- (void)_detectAuthTypeWithServiceURL:(id)a3 enrollmentType:(unint64_t)a4 isPostBuddy:(BOOL)a5 machineInfo:(id)a6 anchorCertificateRefs:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17[2];
  BOOL v18;
  id location;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController serviceDiscoveryHelper](self, "serviceDiscoveryHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __122__DMCEnrollmentFlowController__detectAuthTypeWithServiceURL_enrollmentType_isPostBuddy_machineInfo_anchorCertificateRefs___block_invoke;
  v16[3] = &unk_24DBE34B0;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a4;
  v18 = a5;
  objc_msgSend(v15, "determineEnrollmentMethodWithServiceURL:enrollmentType:machineInfo:anchorCertificateRefs:completionHandler:", v12, a4, v13, v14, v16);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

void __122__DMCEnrollmentFlowController__detectAuthTypeWithServiceURL_enrollmentType_isPostBuddy_machineInfo_anchorCertificateRefs___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __122__DMCEnrollmentFlowController__detectAuthTypeWithServiceURL_enrollmentType_isPostBuddy_machineInfo_anchorCertificateRefs___block_invoke_2;
    v17[3] = &unk_24DBE3488;
    v17[4] = v13;
    v15 = v11;
    v16 = *(_QWORD *)(a1 + 40);
    v18 = v15;
    v21 = v16;
    v22 = a2;
    v19 = v10;
    v23 = *(_BYTE *)(a1 + 48);
    v20 = v9;
    objc_msgSend(v14, "queueBlock:", v17);

  }
}

void __122__DMCEnrollmentFlowController__detectAuthTypeWithServiceURL_enrollmentType_isPostBuddy_machineInfo_anchorCertificateRefs___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _BYTE v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 4)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v28 = 136315138;
      *(_QWORD *)&v28[4] = "-[DMCEnrollmentFlowController _detectAuthTypeWithServiceURL:enrollmentType:isPostBuddy:machin"
                           "eInfo:anchorCertificateRefs:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", v28, 0xCu);
    }
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    if (*(_QWORD *)(a1 + 64) == 3 && *(_QWORD *)(a1 + 72) != 1)
    {
      v10 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_219D1D000, v10, OS_LOG_TYPE_ERROR, "Failed: UAORGO is only supported for Apple user authentication", v28, 2u);
      }
      v11 = *(void **)(a1 + 32);
      +[DMCEnrollmentFlowController _createUnsupportedFeatureError](DMCEnrollmentFlowController, "_createUnsupportedFeatureError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_flowTerminatedWithError:canceled:", v5, 0);
      goto LABEL_64;
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60D08]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE60D88], "essoDetailsWithJSONDictionary:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(NSObject **)DMCLogObjects();
      if (!v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v28 = 138543362;
          *(_QWORD *)&v28[4] = v5;
          _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_ERROR, "Invalid ESSO details are present: %{public}@", v28, 0xCu);
        }
        v12 = *(void **)(a1 + 32);
        +[DMCEnrollmentFlowController _createGeneralError](DMCEnrollmentFlowController, "_createGeneralError");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = v6;
        v15 = 0;
LABEL_32:
        objc_msgSend(v13, "_flowTerminatedWithError:canceled:", v14, v15, *(_QWORD *)v28);
        goto LABEL_63;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_DEBUG, "ESSO details are present", v28, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "setEssoDetails:", v6);
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setEnrollmentMethod:", *(_QWORD *)(a1 + 72));
    switch(*(_QWORD *)(a1 + 72))
    {
      case 0:
        v16 = *(NSObject **)DMCLogObjects();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        *(_WORD *)v28 = 0;
        v17 = "Unknown enrollment method!";
        goto LABEL_30;
      case 1:
        switch(*(_QWORD *)(a1 + 64))
        {
          case 0:
            v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              goto LABEL_55;
            *(_WORD *)v28 = 0;
            v21 = "Enrollment type is Unknown!";
            break;
          case 1:
            v22 = *(void **)(a1 + 32);
            if (*(_BYTE *)(a1 + 80))
              goto LABEL_44;
            objc_msgSend(v22, "_ORGO_MAIDEnrollmentSteps");
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_45;
          case 2:
            objc_msgSend(*(id *)(a1 + 32), "_ORGO_MACBuddy_firstPartSteps");
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_45;
          case 3:
            v22 = *(void **)(a1 + 32);
LABEL_44:
            objc_msgSend(v22, "_ORGO_MAIDEnrollmentSteps_orgToken");
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_45;
          case 4:
          case 5:
            objc_msgSend(*(id *)(a1 + 32), "_ADxE_MAID_firstPartSteps");
            v18 = objc_claimAutoreleasedReturnValue();
LABEL_45:
            v19 = (void *)v18;
            goto LABEL_56;
          case 6:
            v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              goto LABEL_55;
            *(_WORD *)v28 = 0;
            v21 = "Enrollment type MDMUserEnrollment is not supported!";
            break;
          case 7:
            v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              goto LABEL_55;
            *(_WORD *)v28 = 0;
            v21 = "Enrollment type SharediPadUserChannel is not supported!";
            break;
          case 8:
            v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              goto LABEL_55;
            *(_WORD *)v28 = 0;
            v21 = "Enrollment type Watch is not supported!";
            break;
          case 9:
            v20 = *(NSObject **)DMCLogObjects();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              goto LABEL_55;
            *(_WORD *)v28 = 0;
            v21 = "Enrollment type ADE is not supported!";
            break;
          default:
            goto LABEL_55;
        }
        _os_log_impl(&dword_219D1D000, v20, OS_LOG_TYPE_ERROR, v21, v28, 2u);
LABEL_55:
        v19 = 0;
LABEL_56:
        objc_msgSend(*(id *)(a1 + 32), "_appendSteps:", v19, *(_QWORD *)v28);
        objc_msgSend(*(id *)(a1 + 32), "managedAppleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (!v24)
        {
          objc_msgSend(*(id *)(a1 + 32), "username");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setManagedAppleID:", v25);

        }
        objc_msgSend(*(id *)(a1 + 32), "setAuthParams:", *(_QWORD *)(a1 + 56));
        goto LABEL_59;
      case 2:
      case 5:
        objc_msgSend(*(id *)(a1 + 32), "setAuthParams:", *(_QWORD *)(a1 + 56));
        v8 = *(void **)(a1 + 32);
        if (v6)
          objc_msgSend(v8, "_ADxE_thirdParty_ESSO_firstPartSteps");
        else
          objc_msgSend(v8, "_ADxE_thirdParty_firstPartSteps");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      case 3:
        v8 = *(void **)(a1 + 32);
        objc_msgSend(v8, "_ORGO_deviceEnrollmentSteps");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_37:
        v19 = (void *)v9;
        objc_msgSend(v8, "_appendSteps:", v9);
LABEL_59:

        goto LABEL_60;
      case 4:
      case 6:
        v16 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v28 = 0;
          v17 = "Unsupported enrollment method!";
LABEL_30:
          _os_log_impl(&dword_219D1D000, v16, OS_LOG_TYPE_ERROR, v17, v28, 2u);
        }
LABEL_31:
        v13 = *(void **)(a1 + 32);
        v14 = 0;
        v15 = 1;
        goto LABEL_32;
      default:
LABEL_60:
        if (!*(_BYTE *)(a1 + 80))
        {
          v26 = *(void **)(a1 + 32);
          objc_msgSend(v26, "_ADE_postEnrollmentSteps");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_appendSteps:", v27);

        }
        objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
        break;
    }
LABEL_63:

LABEL_64:
    return;
  }
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v28 = 138543362;
    *(_QWORD *)&v28[4] = v4;
    _os_log_impl(&dword_219D1D000, v3, OS_LOG_TYPE_ERROR, "Failed to retrieve enrollment method with error: %{public}@", v28, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_processAuthServicesWithAuthParams:(id)a3 enrollmentMethod:(unint64_t)a4 username:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id buf;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    if (a4 == 2 || a4 == 5)
    {
      v10 = (void *)objc_opt_new();
      if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment"))
      {
        v11 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_DEFAULT, "Simulating web auth session.", (uint8_t *)&buf, 2u);
        }
        v20 = *MEMORY[0x24BE60CF0];
        v21[0] = CFSTR("simulated-enrollment");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCEnrollmentFlowController setAuthTokens:](self, "setAuthTokens:", v12);

        -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
      }
      else
      {
        objc_msgSend(v10, "webAuthenticationURLForAuthParams:userIdentifier:", v8, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_initWeak(&buf, self);
          -[DMCEnrollmentFlowController presenter](self, "presenter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = __92__DMCEnrollmentFlowController__processAuthServicesWithAuthParams_enrollmentMethod_username___block_invoke;
          v17[3] = &unk_24DBE3500;
          objc_copyWeak(&v18, &buf);
          objc_msgSend(v14, "requestWebAuthenticationWithWebAuthURL:authenticator:authParams:completionHandler:", v13, v10, v8, v17);

          objc_destroyWeak(&v18);
          objc_destroyWeak(&buf);
        }
        else
        {
          +[DMCEnrollmentFlowController _createGeneralError](DMCEnrollmentFlowController, "_createGeneralError");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v16, 1);

        }
      }
    }
    else
    {
      +[DMCEnrollmentFlowController _createGeneralError](DMCEnrollmentFlowController, "_createGeneralError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v15, 1);

    }
  }
  else
  {
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", 0, 1);
  }

}

void __92__DMCEnrollmentFlowController__processAuthServicesWithAuthParams_enrollmentMethod_username___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __92__DMCEnrollmentFlowController__processAuthServicesWithAuthParams_enrollmentMethod_username___block_invoke_2;
    v12[3] = &unk_24DBE34D8;
    v12[4] = v10;
    v15 = a3;
    v13 = v8;
    v14 = v7;
    objc_msgSend(v11, "queueBlock:", v12);

  }
}

uint64_t __92__DMCEnrollmentFlowController__processAuthServicesWithAuthParams_enrollmentMethod_username___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 7)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[DMCEnrollmentFlowController _processAuthServicesWithAuthParams:enrollmentMethod:username:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v12, 0xCu);
    }
  }
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(void **)(a1 + 32);
    v4 = 0;
    v5 = 1;
    return objc_msgSend(v3, "_flowTerminatedWithError:canceled:", v4, v5);
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)DMCLogObjects();
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(const char **)(a1 + 40);
      v12 = 138543362;
      v13 = v8;
      _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_ERROR, "Web authentication failed with error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 0;
    return objc_msgSend(v3, "_flowTerminatedWithError:canceled:", v4, v5);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(const char **)(a1 + 48);
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_DEBUG, "Web authentication tokens retrieved: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  v11 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setAuthTokens:", v11);

  return objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
}

- (void)_askForPasscodeIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDevicePasscodeSet");

  if (v4)
  {
    objc_initWeak(&location, self);
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __54__DMCEnrollmentFlowController__askForPasscodeIfNeeded__block_invoke;
    v6[3] = &unk_24DBE3410;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "requestDevicePasscodeWithCompletionHandler:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }
}

void __54__DMCEnrollmentFlowController__askForPasscodeIfNeeded__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  char v11;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __54__DMCEnrollmentFlowController__askForPasscodeIfNeeded__block_invoke_2;
    v9[3] = &unk_24DBE33E8;
    v9[4] = v7;
    v11 = a3;
    v10 = v5;
    objc_msgSend(v8, "queueBlock:", v9);

  }
}

uint64_t __54__DMCEnrollmentFlowController__askForPasscodeIfNeeded__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 8)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[DMCEnrollmentFlowController _askForPasscodeIfNeeded]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setNextStepIndex:", objc_msgSend(*(id *)(a1 + 32), "nextStepIndex") - 2);
  else
    objc_msgSend(*(id *)(a1 + 32), "setDevicePasscode:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
}

- (void)_createEnterprisePersonaWithDevicePasscode:(id)a3 devicePasscodeData:(id)a4 devicePasscodeDataType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BE2A838], "enterprisePersonaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_6;
  v11 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_ERROR, "Enterprise persona exists without any MDM enrollment! Cleaning up anyway...", buf, 2u);
  }
  v25 = 0;
  objc_msgSend(MEMORY[0x24BE2A838], "removePersona:error:", v10, &v25);
  v12 = v25;
  if (v12)
  {
    v13 = v12;
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v12, 0);
  }
  else
  {
LABEL_6:
    if (v9)
    {
      v24 = 0;
      v14 = (id *)&v24;
      objc_msgSend(MEMORY[0x24BE2A838], "createEnterprisePersonaWithPasscodeData:passcodeDataType:error:", v9, a5, &v24);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
      v14 = (id *)&v23;
      objc_msgSend(MEMORY[0x24BE2A838], "createEnterprisePersonaWithDevicePasscode:error:", v8, &v23);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    v13 = *v14;
    v17 = *(NSObject **)DMCLogObjects();
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v16;
        _os_log_impl(&dword_219D1D000, v17, OS_LOG_TYPE_DEFAULT, "Enterprise persona created. ID: %{public}@", buf, 0xCu);
      }
      -[DMCEnrollmentFlowController setPersonaID:](self, "setPersonaID:", v16);
      -[DMCEnrollmentFlowController dirtyState](self, "dirtyState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addDirtyPersonaID:", v16);

      -[DMCEnrollmentFlowController dirtyState](self, "dirtyState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowController _writeDirtyStateToDisk:](self, "_writeDirtyStateToDisk:", v19);

      -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "requestEnrollmentFlowMonitorWithPersonaID:", v16);

      }
      -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v13;
        _os_log_impl(&dword_219D1D000, v17, OS_LOG_TYPE_ERROR, "Failed to create enterprise persona with error: %{public}@", buf, 0xCu);
      }
      -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v13, 0);
    }

  }
}

- (void)_authenticateMAID:(id)a3 authenticationResults:(id)a4 enrollmentType:(unint64_t)a5 personaID:(id)a6 ephemeral:(BOOL)a7 silent:(BOOL)a8 isRenewalFlow:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  unsigned int v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  BOOL v46;
  BOOL v47;
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v9 = a8;
  v10 = a7;
  v51 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v42 = a4;
  v16 = a6;
  if (!a9)
  {
    -[DMCEnrollmentFlowController _guardAgainstConflictingAccountsWithUsername:altDSID:](self, "_guardAgainstConflictingAccountsWithUsername:altDSID:", v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      +[DMCEnrollmentAccountUtilities removeOrphanedEnrollmentAccounts](DMCEnrollmentAccountUtilities, "removeOrphanedEnrollmentAccounts");
      -[DMCEnrollmentFlowController _guardAgainstConflictingAccountsWithUsername:altDSID:](self, "_guardAgainstConflictingAccountsWithUsername:altDSID:", v15, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219D1D000, v19, OS_LOG_TYPE_ERROR, "Duplicate account still exists after cleanup. Abort enrollment flow...", buf, 2u);
        }
        -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v18, 0);

        goto LABEL_34;
      }
    }
  }
  if (-[DMCEnrollmentFlowController _isORGOEnrollment:](self, "_isORGOEnrollment:", a5))
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v21 = objc_msgSend(v20, "dmc_hasPrimaryAccount:", &v48);
    v22 = v48;

    if (v22)
    {
      v23 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v22;
        _os_log_impl(&dword_219D1D000, v23, OS_LOG_TYPE_ERROR, "Failed to fetch accounts with error: %{public}@", buf, 0xCu);
      }
      -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v22, 0);
LABEL_12:

      goto LABEL_34;
    }
    if (v21)
    {
      if (!a9)
        goto LABEL_35;
      objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dmc_primaryiCloudAccount");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "username");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", v15);

      if ((v30 & 1) == 0)
      {
LABEL_35:
        v38 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219D1D000, v38, OS_LOG_TYPE_ERROR, "The device already has a primary account! Aborting...", buf, 2u);
        }
        v39 = (void *)MEMORY[0x24BDD1540];
        DMCErrorArray();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A578], 15011, v40, *MEMORY[0x24BE2A588], 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v41, 0);

        goto LABEL_12;
      }
    }
  }
  else if (-[DMCEnrollmentFlowController _isBYODEnrollment:](self, "_isBYODEnrollment:", a5)
         && !objc_msgSend(v16, "length")
         && !v10)
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    DMCErrorArray();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A578], 15019, v25, *MEMORY[0x24BE2A588], 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v26, 0);

    goto LABEL_34;
  }
  objc_initWeak((id *)buf, self);
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __127__DMCEnrollmentFlowController__authenticateMAID_authenticationResults_enrollmentType_personaID_ephemeral_silent_isRenewalFlow___block_invoke;
  v43[3] = &unk_24DBE3550;
  objc_copyWeak(&v45, (id *)buf);
  v46 = a9;
  v47 = v10;
  v15 = v15;
  v44 = v15;
  v31 = (void *)MEMORY[0x2207343C4](v43);
  if (!v15)
  {
    if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment"))
    {
      objc_msgSend(MEMORY[0x24BE2A7F0], "simulatedMDMAccountDrivenEnrollmentDefaultUsername");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  v32 = -[DMCEnrollmentFlowController enrollmentMethod](self, "enrollmentMethod");
  v33 = v32 == 1;
  if (objc_msgSend(MEMORY[0x24BE2A7E8], "isAppleInternal"))
  {
    v34 = objc_msgSend(MEMORY[0x24BE2A7D8], "DSLiveOnModeEnabled");
    if (v32 == 1)
      v33 = 1;
    else
      v33 = v34;
  }
  if (v9)
  {
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "requestSilentMAIDAuthenticationWithAuthenticationResults:personaID:requireAppleMAID:completionHandler:", v42, v16, v33, v31);
  }
  else
  {
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_opt_respondsToSelector();

    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v37 & 1) != 0)
      objc_msgSend(v35, "requestMAIDAuthenticationWithManagedAppleID:personaID:ephemeral:requireAppleMAID:completionHandler:", v15, v16, v10, v33, v31);
    else
      objc_msgSend(v35, "requestMAIDAuthenticationWithManagedAppleID:personaID:ephemeral:completionHandler:", v15, v16, v10, v31);
  }

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)buf);
LABEL_34:

}

void __127__DMCEnrollmentFlowController__authenticateMAID_authenticationResults_enrollmentType_personaID_ephemeral_silent_isRenewalFlow___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  char v16;
  __int16 v17;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __127__DMCEnrollmentFlowController__authenticateMAID_authenticationResults_enrollmentType_personaID_ephemeral_silent_isRenewalFlow___block_invoke_2;
    v12[3] = &unk_24DBE3528;
    v12[4] = v10;
    v16 = a3;
    v13 = v8;
    v14 = v7;
    v17 = *(_WORD *)(a1 + 48);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v11, "queueBlock:", v12);

  }
}

void __127__DMCEnrollmentFlowController__authenticateMAID_authenticationResults_enrollmentType_personaID_ephemeral_silent_isRenewalFlow___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(objc_msgSend(*(id *)(a1 + 32), "currentStep") - 10) >= 3)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[DMCEnrollmentFlowController _authenticateMAID:authenticationResults:enrollmentType:personaID:ephemeral:sil"
            "ent:isRenewalFlow:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  if (!*(_BYTE *)(a1 + 64))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v6 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(const char **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v28 = v7;
        _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_ERROR, "MAID authentication failed with error: %{public}@", buf, 0xCu);
      }
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 0;
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "authenticationResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "authenticationResults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 48));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setAuthenticationResults:", *(_QWORD *)(a1 + 48));
    }
    objc_msgSend(*(id *)(a1 + 32), "authenticationResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DMCAKAuthenticationAlternateDSIDKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "setAltDSID:", v13);
      if (!*(_BYTE *)(a1 + 65))
      {
        objc_msgSend(*(id *)(a1 + 32), "_guardAgainstConflictingAccountsWithUsername:altDSID:", 0, v13);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)v23;
          v25 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219D1D000, v25, OS_LOG_TYPE_ERROR, "Duplicate account exists. Abort enrollment flow...", buf, 2u);
          }
          objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", v24, 0);

          goto LABEL_26;
        }
      }
      if (!*(_BYTE *)(a1 + 66))
      {
        objc_msgSend(*(id *)(a1 + 32), "dirtyState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addDirtyAltDSID:", v13);

        v15 = *(void **)(a1 + 32);
        objc_msgSend(v15, "dirtyState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_writeDirtyStateToDisk:", v16);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "altDSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *(void **)(a1 + 32);
    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
    }
    else
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BE2A578];
      v26 = *(_QWORD *)(a1 + 56);
      DMCErrorArray();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, 15031, v21, *MEMORY[0x24BE2A588], v26, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_flowTerminatedWithError:canceled:", v22, 0);

    }
LABEL_26:

    return;
  }
  v3 = *(void **)(a1 + 32);
  v4 = 0;
  v5 = 1;
LABEL_10:
  objc_msgSend(v3, "_flowTerminatedWithError:canceled:", v4, v5);
}

- (void)_signInMAIDWithAuthenticationResult:(id)a3 enrollmentType:(unint64_t)a4 personaID:(id)a5 isRenewalFlow:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(id *, char, char, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  id location;

  v10 = a3;
  v11 = a5;
  if (a6)
    goto LABEL_4;
  DMCAKAuthenticationUsernameKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  DMCAKAuthenticationAlternateDSIDKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _guardAgainstConflictingAccountsWithUsername:altDSID:](self, "_guardAgainstConflictingAccountsWithUsername:altDSID:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_4:
    objc_initWeak(&location, self);
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __106__DMCEnrollmentFlowController__signInMAIDWithAuthenticationResult_enrollmentType_personaID_isRenewalFlow___block_invoke;
    v24 = &unk_24DBE35A0;
    objc_copyWeak(&v27, &location);
    v17 = v10;
    v25 = v17;
    v18 = v11;
    v26 = v18;
    v19 = (void *)MEMORY[0x2207343C4](&v21);
    -[DMCEnrollmentFlowController presenter](self, "presenter", v21, v22, v23, v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "requestMAIDSignInWithAuthenticationResults:personaID:makeiTunesAccountActive:completionHandler:", v17, v18, a4 - 6 < 0xFFFFFFFFFFFFFFFELL, v19);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v16, 0);

  }
}

void __106__DMCEnrollmentFlowController__signInMAIDWithAuthenticationResult_enrollmentType_personaID_isRenewalFlow___block_invoke(id *a1, char a2, char a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  char v15;
  char v16;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __106__DMCEnrollmentFlowController__signInMAIDWithAuthenticationResult_enrollmentType_personaID_isRenewalFlow___block_invoke_2;
    v11[3] = &unk_24DBE3578;
    v11[4] = v9;
    v15 = a3;
    v16 = a2;
    v12 = v7;
    v13 = a1[4];
    v14 = a1[5];
    objc_msgSend(v10, "queueBlock:", v11);

  }
}

void __106__DMCEnrollmentFlowController__signInMAIDWithAuthenticationResult_enrollmentType_personaID_isRenewalFlow___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 13)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[DMCEnrollmentFlowController _signInMAIDWithAuthenticationResult:enrollmentType:personaID:isRenewalFlow:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v16, 0xCu);
    }
  }
  if (*(_BYTE *)(a1 + 64))
  {
    v3 = *(void **)(a1 + 32);
    v4 = 0;
    v5 = 1;
LABEL_6:
    objc_msgSend(v3, "_flowTerminatedWithError:canceled:", v4, v5);
    return;
  }
  if (!*(_BYTE *)(a1 + 65))
  {
    v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(const char **)(a1 + 40);
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_ERROR, "MAID sign-in failed with error: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    v13 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    if (!v4)
    {
      +[DMCEnrollmentFlowController _createGeneralSignInError](DMCEnrollmentFlowController, "_createGeneralSignInError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_flowTerminatedWithError:canceled:", v15, 0);

      return;
    }
    v3 = *(void **)(a1 + 32);
    v5 = 0;
    goto LABEL_6;
  }
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 48);
  DMCAKAuthenticationAlternateDSIDKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "_verifyAccountsInformationWithAltDSID:personaID:", v9, *(_QWORD *)(a1 + 56));

  v10 = *(void **)(a1 + 32);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v10, "_pollNextStep");
  }
  else
  {
    +[DMCEnrollmentFlowController _createGeneralSignInError](DMCEnrollmentFlowController, "_createGeneralSignInError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_flowTerminatedWithError:canceled:", v14, 0);

  }
}

- (BOOL)_verifyAccountsInformationWithAltDSID:(id)a3 personaID:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v5 = a3;
  v6 = a4;
  v7 = 1;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 1;
    v9 = (void *)MEMORY[0x24BE2A838];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __79__DMCEnrollmentFlowController__verifyAccountsInformationWithAltDSID_personaID___block_invoke;
    v13[3] = &unk_24DBE35C8;
    v10 = v8;
    v14 = v10;
    v15 = v5;
    v16 = v6;
    v17 = &v18;
    v11 = (id)objc_msgSend(v9, "performBlockUnderPersona:block:", v16, v13);
    v7 = *((_BYTE *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }

  return v7;
}

void __79__DMCEnrollmentFlowController__verifyAccountsInformationWithAltDSID_personaID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if ((v4 & 1) == 0)
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v2, "personaIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v16 = 138543874;
      v17 = v7;
      v18 = 2114;
      v19 = v2;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_ERROR, "The persona ID (%{public}@) of the iCloud account (%{public}@) is different from the persona ID (%{public}@) used in this enrollment.", (uint8_t *)&v16, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "dmc_iTunesAccountForRemoteManagingAccountWithAltDSID:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if ((v11 & 1) == 0)
  {
    v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      objc_msgSend(v9, "personaIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      v16 = 138543874;
      v17 = v14;
      v18 = 2114;
      v19 = v9;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_219D1D000, v13, OS_LOG_TYPE_ERROR, "The persona ID (%{public}@) of the iTunes account (%{public}@) is different from the persona ID (%{public}@) used in this enrollment.", (uint8_t *)&v16, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (void)_exchangeMAIDForBearerTokenWithRMAccountIdentifier:(id)a3 authParams:(id)a4 anchorCertificateRefs:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id buf;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment"))
  {
    v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_DEFAULT, "Simulating exchange MAID for bearer token.", (uint8_t *)&buf, 2u);
    }
    v17 = *MEMORY[0x24BE60CF0];
    v18[0] = CFSTR("simulated-enrollment");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController setAuthTokens:](self, "setAuthTokens:", v12);

    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }
  else
  {
    objc_initWeak(&buf, self);
    objc_msgSend(MEMORY[0x24BE60D98], "authenticatorWithAnchorCertificateRefs:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __115__DMCEnrollmentFlowController__exchangeMAIDForBearerTokenWithRMAccountIdentifier_authParams_anchorCertificateRefs___block_invoke;
    v14[3] = &unk_24DBE3618;
    objc_copyWeak(&v15, &buf);
    objc_msgSend(v13, "fetchTokenWithAuthParams:accountID:completionHandler:", v9, v8, v14);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&buf);
  }

}

void __115__DMCEnrollmentFlowController__exchangeMAIDForBearerTokenWithRMAccountIdentifier_authParams_anchorCertificateRefs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "currentStep") != 15)
    {
      v9 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[DMCEnrollmentFlowController _exchangeMAIDForBearerTokenWithRMAccountIdentifier:authParams:anchorCertific"
              "ateRefs:]_block_invoke";
        _os_log_impl(&dword_219D1D000, v9, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
      }
    }
    objc_msgSend(v8, "workerQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __115__DMCEnrollmentFlowController__exchangeMAIDForBearerTokenWithRMAccountIdentifier_authParams_anchorCertificateRefs___block_invoke_58;
    v11[3] = &unk_24DBE35F0;
    v12 = v6;
    v13 = v8;
    v14 = v5;
    objc_msgSend(v10, "queueBlock:", v11);

  }
}

uint64_t __115__DMCEnrollmentFlowController__exchangeMAIDForBearerTokenWithRMAccountIdentifier_authParams_anchorCertificateRefs___block_invoke_58(uint64_t a1)
{
  uint64_t v2;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    return objc_msgSend(*(id *)(a1 + 40), "_flowTerminatedWithError:canceled:", v2, 0);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(*(id *)(a1 + 40), "setAuthTokens:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "_pollNextStep");
}

- (void)_fetchEnrollmentProfileFromServiceURL:(id)a3 authTokens:(id)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 enrollmentType:(unint64_t)a7 enrollmentMethod:(unint64_t)a8 isESSO:(BOOL)a9 essoAppITunesStoreID:(id)a10 isReturnToService:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[16];
  _QWORD v30[4];
  id v31;
  id v32[3];
  BOOL v33;
  id location;

  v28 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a10;
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __192__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_authTokens_machineInfo_anchorCertificateRefs_enrollmentType_enrollmentMethod_isESSO_essoAppITunesStoreID_isReturnToService___block_invoke;
  v30[3] = &unk_24DBE3640;
  objc_copyWeak(v32, &location);
  v32[1] = (id)a8;
  v33 = a9;
  v21 = v20;
  v31 = v21;
  v32[2] = (id)a7;
  v22 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2207343C4](v30);
  if (a11
    && (-[DMCEnrollmentFlowController obliterationShelter](self, "obliterationShelter"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v23, "mdmProfileData"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        v23,
        v24))
  {
    v25 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v25, OS_LOG_TYPE_DEFAULT, "Return to Service: Has local MDM profile.", buf, 2u);
    }
    -[DMCEnrollmentFlowController obliterationShelter](self, "obliterationShelter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mdmProfileData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v27, 0);

  }
  else
  {
    -[DMCEnrollmentFlowController serviceDiscoveryHelper](self, "serviceDiscoveryHelper");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fetchEnrollmentProfileWithServiceURL:authTokens:enrollmentMethod:machineInfo:anchorCertificateRefs:completionHandler:", v28, v17, a8, v18, v19, v22);
  }

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

}

void __192__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_authTokens_machineInfo_anchorCertificateRefs_enrollmentType_enrollmentMethod_isESSO_essoAppITunesStoreID_isReturnToService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __192__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_authTokens_machineInfo_anchorCertificateRefs_enrollmentType_enrollmentMethod_isESSO_essoAppITunesStoreID_isReturnToService___block_invoke_2;
    v14[3] = &unk_24DBE3488;
    v14[4] = v8;
    v15 = v6;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 48);
    v16 = v10;
    v18 = v11;
    v20 = *(_BYTE *)(a1 + 64);
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 56);
    v17 = v12;
    v19 = v13;
    objc_msgSend(v9, "queueBlock:", v14);

  }
}

void __192__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_authTokens_machineInfo_anchorCertificateRefs_enrollmentType_enrollmentMethod_isESSO_essoAppITunesStoreID_isReturnToService___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 16)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[DMCEnrollmentFlowController _fetchEnrollmentProfileFromServiceURL:authTokens:machineInfo:anchorCertificate"
            "Refs:enrollmentType:enrollmentMethod:isESSO:essoAppITunesStoreID:isReturnToService:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  v3 = *(void **)(a1 + 40);
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setProfileData:", *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "profileData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned __int8 *)(a1 + 80);
    v10 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v23 = 0;
    v11 = objc_msgSend(v6, "_extractAndVerifyPropertiesFromProfileData:enrollmentMethod:isESSO:essoAppITunesStoreID:error:", v7, v9, v8, v10, &v23);
    v12 = v23;

    if ((v11 & 1) != 0)
    {
      if ((*(_QWORD *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
LABEL_30:
        objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
        goto LABEL_31;
      }
      objc_msgSend(*(id *)(a1 + 32), "serverCapabilities");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", *MEMORY[0x24BE61440]);

      v15 = *(_QWORD *)(a1 + 64);
      if (v15 == 1)
      {
        v19 = *(void **)(a1 + 32);
        if ((v14 & 1) != 0)
          objc_msgSend(v19, "_ADxE_MAID_secondPartSteps_orgToken");
        else
          objc_msgSend(v19, "_ADxE_MAID_secondPartSteps_default");
        goto LABEL_26;
      }
      if (v15 == 5 || v15 == 2)
      {
        v16 = *(void **)(a1 + 32);
        if (*(_BYTE *)(a1 + 80))
        {
          if ((v14 & 1) != 0)
            objc_msgSend(v16, "_ADxE_thirdParty_ESSO_secondPartSteps_orgToken");
          else
            objc_msgSend(v16, "_ADxE_thirdParty_ESSO_secondPartSteps_default");
        }
        else if ((v14 & 1) != 0)
        {
          objc_msgSend(v16, "_ADxE_thirdParty_secondPartSteps_orgToken");
        }
        else
        {
          objc_msgSend(v16, "_ADxE_thirdParty_secondPartSteps_default");
        }
LABEL_26:
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        objc_msgSend(*(id *)(a1 + 32), "_appendSteps:", v21);

        goto LABEL_30;
      }
      v20 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219D1D000, v20, OS_LOG_TYPE_ERROR, "No next step: unsupported enrollment method", buf, 2u);
      }
      v17 = *(void **)(a1 + 32);
      v18 = 0;
    }
    else
    {
      v17 = *(void **)(a1 + 32);
      v18 = v12;
    }
    objc_msgSend(v17, "_flowTerminatedWithError:canceled:", v18, 0);
LABEL_31:

    return;
  }
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE2A600]);

  if (!v5
    || (objc_msgSend(*(id *)(a1 + 32), "_handleSoftwareUpdateRequiredError:", *(_QWORD *)(a1 + 40)) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "_handleNeedCredentialsError:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", *(_QWORD *)(a1 + 40), 0);
  }
}

- (void)_askForUserConsentWithProfileData:(id)a3 managedAppleID:(id)a4 cloudConfig:(id)a5 isReturnToService:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id buf[2];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v6)
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_219D1D000, v13, OS_LOG_TYPE_DEFAULT, "No need to ask for consent during Return to Service", (uint8_t *)buf, 2u);
    }
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }
  else
  {
    objc_initWeak(buf, self);
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke;
      v18[3] = &unk_24DBE36B8;
      v15 = &v19;
      objc_copyWeak(&v19, buf);
      objc_msgSend(v14, "requestUserConsentWithCloudConfig:completionHandler:", v12, v18);
    }
    else
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_2_64;
      v16[3] = &unk_24DBE36B8;
      v15 = &v17;
      objc_copyWeak(&v17, buf);
      objc_msgSend(v14, "requestUserConsentWithProfileData:managedAppleID:completionHandler:", v10, v11, v16);
    }

    objc_destroyWeak(v15);
    objc_destroyWeak(buf);
  }

}

void __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_2;
    v6[3] = &unk_24DBE3690;
    v6[4] = v4;
    v7 = a2;
    objc_msgSend(v5, "queueBlock:", v6);

  }
}

void __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 17)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[DMCEnrollmentFlowController _askForUserConsentWithProfileData:managedAppleID:cloudConfig:isReturnToService:"
           "]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "managedConfigurationHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_61;
    v5[3] = &unk_24DBE3668;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "markCloudConfigurationAsUICompletedWithCompletionHandler:", v5);

  }
  else
  {
    objc_msgSend(v3, "_flowTerminatedWithError:canceled:", 0, 1);
  }
}

uint64_t __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_61(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "_flowTerminatedWithError:canceled:", a2, 0);
  else
    return objc_msgSend(v2, "_pollNextStep");
}

void __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_2_64(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_3;
    v6[3] = &unk_24DBE3690;
    v6[4] = v4;
    v7 = a2;
    objc_msgSend(v5, "queueBlock:", v6);

  }
}

uint64_t __110__DMCEnrollmentFlowController__askForUserConsentWithProfileData_managedAppleID_cloudConfig_isReturnToService___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 17)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[DMCEnrollmentFlowController _askForUserConsentWithProfileData:managedAppleID:cloudConfig:isReturnToService:"
           "]_block_invoke_3";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(v3, "_pollNextStep");
  else
    return objc_msgSend(v3, "_flowTerminatedWithError:canceled:", 0, 1);
}

- (void)_displayManagementDetailsOverviewWithProfileData:(id)a3 managedAppleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __95__DMCEnrollmentFlowController__displayManagementDetailsOverviewWithProfileData_managedAppleID___block_invoke;
  v9[3] = &unk_24DBE36B8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "displayManagementDetailsOverviewWithProfileData:managedAppleID:completionHandler:", v6, v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __95__DMCEnrollmentFlowController__displayManagementDetailsOverviewWithProfileData_managedAppleID___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __95__DMCEnrollmentFlowController__displayManagementDetailsOverviewWithProfileData_managedAppleID___block_invoke_2;
    v6[3] = &unk_24DBE3690;
    v6[4] = v4;
    v7 = a2;
    objc_msgSend(v5, "queueBlock:", v6);

  }
}

uint64_t __95__DMCEnrollmentFlowController__displayManagementDetailsOverviewWithProfileData_managedAppleID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 18)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[DMCEnrollmentFlowController _displayManagementDetailsOverviewWithProfileData:managedAppleID:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(v3, "_pollNextStep");
  else
    return objc_msgSend(v3, "_flowTerminatedWithError:canceled:", 0, 1);
}

- (void)_installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 isESSO:(BOOL)a7 essoAppITunesStoreID:(id)a8 essoConfigurationProfile:(id)a9 wifiProfileIdentifier:(id)a10 enrollmentType:(unint64_t)a11 isReturnToService:(BOOL)a12
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  _BOOL4 v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38[2];
  id location;

  v31 = a7;
  v36 = a3;
  v35 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a8;
  v17 = a9;
  v18 = a10;
  -[DMCEnrollmentFlowController _blockAppInstallsIfNecessary](self, "_blockAppInstallsIfNecessary");
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __210__DMCEnrollmentFlowController__installEnrollmentProfile_devicePasscode_personaID_rmAccountIdentifier_isESSO_essoAppITunesStoreID_essoConfigurationProfile_wifiProfileIdentifier_enrollmentType_isReturnToService___block_invoke;
  v37[3] = &unk_24DBE3708;
  objc_copyWeak(v38, &location);
  v38[1] = (id)a11;
  v19 = (void *)MEMORY[0x2207343C4](v37);
  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_opt_respondsToSelector();

  if ((a6 & 1) != 0)
  {
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "showInstallingEnrollmentProfileScene");

  }
  if (a11 == 4)
  {
    v22 = (id *)MEMORY[0x24BE2A898];
    goto LABEL_9;
  }
  if (a11 == 5)
  {
    v22 = (id *)MEMORY[0x24BE2A890];
LABEL_9:
    v23 = *v22;
    goto LABEL_10;
  }
  if (a12)
  {
    v22 = (id *)MEMORY[0x24BE2A8A0];
    goto LABEL_9;
  }
  v23 = 0;
LABEL_10:
  v24 = (void *)objc_opt_new();
  v25 = v24;
  if (v17)
    objc_msgSend(v24, "addObject:", v17);
  if (v18)
    objc_msgSend(v25, "addObject:", v18);
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_respondsToSelector();

  if (a11 == 1 || (v27 & 1) == 0)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_respondsToSelector();

    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v30 & 1) != 0)
      objc_msgSend(v28, "installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:managedProfileIdentifiers:installationSource:completionHandler:", v36, v35, v34, v33, v25, v23, v19);
    else
      objc_msgSend(v28, "installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:completionHandler:", v36, v35, v34, v33, v19);
  }
  else
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:isESSO:essoAppITunesStoreID:managedProfileIdentifiers:installationSource:completionHandler:", v36, v35, v34, v33, v31, v32, v25, v23, v19);
  }

  objc_destroyWeak(v38);
  objc_destroyWeak(&location);

}

void __210__DMCEnrollmentFlowController__installEnrollmentProfile_devicePasscode_personaID_rmAccountIdentifier_isESSO_essoAppITunesStoreID_essoConfigurationProfile_wifiProfileIdentifier_enrollmentType_isReturnToService___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  char v19;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __210__DMCEnrollmentFlowController__installEnrollmentProfile_devicePasscode_personaID_rmAccountIdentifier_isESSO_essoAppITunesStoreID_essoConfigurationProfile_wifiProfileIdentifier_enrollmentType_isReturnToService___block_invoke_2;
    v14[3] = &unk_24DBE36E0;
    v15 = v8;
    v16 = v10;
    v19 = a3;
    v12 = v7;
    v13 = *(_QWORD *)(a1 + 40);
    v17 = v12;
    v18 = v13;
    objc_msgSend(v11, "queueBlock:", v14);

  }
}

uint64_t __210__DMCEnrollmentFlowController__installEnrollmentProfile_devicePasscode_personaID_rmAccountIdentifier_isESSO_essoAppITunesStoreID_essoConfigurationProfile_wifiProfileIdentifier_enrollmentType_isReturnToService___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v18 = 138543362;
      v19 = v3;
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "profile installation failed with error: %{public}@", (uint8_t *)&v18, 0xCu);
    }
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = 0;
    return objc_msgSend(v4, "_flowTerminatedWithError:canceled:", v5, v6);
  }
  if (*(_BYTE *)(a1 + 64))
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_DEFAULT, "profile installation canceled", (uint8_t *)&v18, 2u);
    }
    v4 = *(void **)(a1 + 40);
    v5 = 0;
    v6 = 1;
    return objc_msgSend(v4, "_flowTerminatedWithError:canceled:", v5, v6);
  }
  objc_msgSend(*(id *)(a1 + 40), "setProfileIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "dirtyState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDirtyProfileIdentifier:", *(_QWORD *)(a1 + 48));

  v10 = *(void **)(a1 + 40);
  objc_msgSend(v10, "dirtyState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_writeDirtyStateToDisk:", v11);

  if ((*(_QWORD *)(a1 + 56) | 8) == 9)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedConfigurationHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "managedConfigurationHelper");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "markStoredProfileAsInstalled");

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "enrollmentFlowController:didInstallEnrollmentProfile:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  return objc_msgSend(*(id *)(a1 + 40), "_pollNextStep");
}

- (void)_createRMAccountIfNeededWithSignInUserIdentifier:(id)a3 assignedMAID:(id)a4 existingRMAccountID:(id)a5 enrollmentType:(unint64_t)a6 enrollmentMethod:(unint64_t)a7 isRenewalFlow:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v8 = a8;
  v29 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (v16 && v8)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accountWithIdentifier:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "dmc_enrollmentType") == a6 && objc_msgSend(v18, "dmc_enrollmentMethod") == a7)
    {
      -[DMCEnrollmentFlowController dirtyState](self, "dirtyState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addDirtyRMAccount:", v16);

      -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
      goto LABEL_12;
    }

  }
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4380], "dmc_createManagementAccountWithStore:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v21;
    _os_log_impl(&dword_219D1D000, v22, OS_LOG_TYPE_INFO, "Will save remote management account: %{public}@", buf, 0xCu);
  }
  objc_msgSend(v21, "setUsername:", v15);
  objc_msgSend(v21, "dmc_setSignInUserIdentifier:", v14);
  objc_msgSend(v21, "dmc_setEnrollmentType:", a6);
  objc_msgSend(v21, "dmc_setEnrollmentMethod:", a7);
  if (a6 == 7)
    objc_msgSend(v21, "dmc_setAccountScheme:", *MEMORY[0x24BE2A558]);
  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __159__DMCEnrollmentFlowController__createRMAccountIfNeededWithSignInUserIdentifier_assignedMAID_existingRMAccountID_enrollmentType_enrollmentMethod_isRenewalFlow___block_invoke;
  v24[3] = &unk_24DBE3730;
  objc_copyWeak(&v26, (id *)buf);
  v23 = v21;
  v25 = v23;
  objc_msgSend(v20, "saveAccount:withCompletionHandler:", v23, v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

LABEL_12:
}

void __159__DMCEnrollmentFlowController__createRMAccountIfNeededWithSignInUserIdentifier_assignedMAID_existingRMAccountID_enrollmentType_enrollmentMethod_isRenewalFlow___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  void *v11;
  id v12;
  char v13;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __159__DMCEnrollmentFlowController__createRMAccountIfNeededWithSignInUserIdentifier_assignedMAID_existingRMAccountID_enrollmentType_enrollmentMethod_isRenewalFlow___block_invoke_2;
    v9[3] = &unk_24DBE34D8;
    v13 = a2;
    v10 = v5;
    v11 = v7;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v8, "queueBlock:", v9);

  }
}

uint64_t __159__DMCEnrollmentFlowController__createRMAccountIfNeededWithSignInUserIdentifier_assignedMAID_existingRMAccountID_enrollmentType_enrollmentMethod_isRenewalFlow___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(NSObject **)DMCLogObjects();
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 48);
      v5 = v3;
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v6;
      _os_log_impl(&dword_219D1D000, v5, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setRmAccountIdentifier:", v7);

    objc_msgSend(*(id *)(a1 + 40), "dirtyState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addDirtyRMAccount:", v9);

    v10 = *(void **)(a1 + 40);
    objc_msgSend(v10, "dirtyState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_writeDirtyStateToDisk:", v11);

    return objc_msgSend(*(id *)(a1 + 40), "_pollNextStep");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 32);
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_219D1D000, v3, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    return objc_msgSend(*(id *)(a1 + 40), "_flowTerminatedWithError:canceled:", *(_QWORD *)(a1 + 32), 0);
  }
}

- (void)_updateRMAccountWithIdentifier:(id)a3 authenticationResults:(id)a4 enrollmentMethod:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  char v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, void *);
  void *v23;
  id v24;
  id v25;
  unint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[DMCEnrollmentFlowController managedAppleID](self, "managedAppleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    DMCAKAuthenticationUsernameKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __101__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authenticationResults_enrollmentMethod___block_invoke;
  v23 = &unk_24DBE3758;
  v15 = v12;
  v24 = v15;
  v16 = v9;
  v25 = v16;
  v26 = a5;
  v17 = objc_msgSend(v14, "dmc_updateAccountWithIdentifier:error:updateBlock:", v8, &v27, &v20);
  v18 = v27;

  v19 = *(NSObject **)DMCLogObjects();
  if ((v17 & 1) != 0)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl(&dword_219D1D000, v19, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", buf, 0xCu);
    }
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep", v20, v21, v22, v23, v24);
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_impl(&dword_219D1D000, v19, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", buf, 0xCu);
    }
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v18, 0, v20, v21, v22, v23, v24);
  }

}

void __101__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authenticationResults_enrollmentMethod___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "setUsername:", a1[4]);
  objc_msgSend(v15, "setAccountDescription:", a1[4]);
  v3 = (void *)a1[5];
  DMCAKAuthenticationAlternateDSIDKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)a1[5];
    DMCAKAuthenticationAlternateDSIDKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dmc_setAltDSID:", v8);

  }
  v9 = (void *)a1[5];
  DMCAKAuthenticationDSIDKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)a1[5];
    DMCAKAuthenticationDSIDKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dmc_setDSID:", v14);

  }
  if (a1[6] == 1)
    objc_msgSend(MEMORY[0x24BE60D40], "stashMAIDShortLivedTokenWithAccount:authenticationResults:", v15, a1[5]);

}

- (void)_updateRMAccountWithIdentifier:(id)a3 authTokens:(id)a4 profileIdentifier:(id)a5 organizationName:(id)a6 personaID:(id)a7 enrollmentMethod:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  DMCEnrollmentFlowController *v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v19 = (void *)MEMORY[0x24BE2A838];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __135__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_profileIdentifier_organizationName_personaID_enrollmentMethod___block_invoke;
  v29[3] = &unk_24DBE37A8;
  v36 = &v39;
  v20 = v14;
  v30 = v20;
  v37 = &v43;
  v21 = v17;
  v31 = v21;
  v32 = self;
  v22 = v15;
  v33 = v22;
  v23 = v16;
  v34 = v23;
  v24 = v18;
  v35 = v24;
  v38 = a8;
  v25 = (id)objc_msgSend(v19, "performBlockUnderPersona:block:", v24, v29);
  if (*((_BYTE *)v40 + 24))
  {
    v26 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v20;
      _os_log_impl(&dword_219D1D000, v26, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", buf, 0xCu);
    }
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }
  else
  {
    v27 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = (void *)v44[5];
      *(_DWORD *)buf = 138543362;
      v50 = v28;
      _os_log_impl(&dword_219D1D000, v27, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", buf, 0xCu);
    }
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v44[5], 0);
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

}

void __135__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_profileIdentifier_organizationName_personaID_enrollmentMethod___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v17 = *(id *)(v3 + 40);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __135__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_profileIdentifier_organizationName_personaID_enrollmentMethod___block_invoke_2;
  v10[3] = &unk_24DBE3780;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 96);
  v15 = v8;
  v16 = v9;
  LOBYTE(v4) = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v4, &v17, v10);
  objc_storeStrong((id *)(v3 + 40), v17);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v4;

}

void __135__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_profileIdentifier_organizationName_personaID_enrollmentMethod___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setAccountDescription:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_updateCredentialForAccount:authTokens:", v3, *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "dmc_setManagementProfileIdentifier:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "dmc_setPersonaIdentifier:", *(_QWORD *)(a1 + 64));
  if (*(_QWORD *)(a1 + 72) == 1)
    objc_msgSend(MEMORY[0x24BE60D40], "removeMAIDShortLivedTokenWithAccount:", v3);

}

- (void)_updateRMAccountWithIdentifier:(id)a3 authTokens:(id)a4 personaID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  DMCEnrollmentFlowController *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v11 = (void *)MEMORY[0x24BE2A838];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_personaID___block_invoke;
  v18[3] = &unk_24DBE37F8;
  v22 = &v24;
  v12 = v8;
  v23 = &v28;
  v19 = v12;
  v20 = self;
  v13 = v9;
  v21 = v13;
  v14 = (id)objc_msgSend(v11, "performBlockUnderPersona:block:", v10, v18);
  if (*((_BYTE *)v25 + 24))
  {
    v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v12;
      _os_log_impl(&dword_219D1D000, v15, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", buf, 0xCu);
    }
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }
  else
  {
    v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)v29[5];
      *(_DWORD *)buf = 138543362;
      v35 = v17;
      _os_log_impl(&dword_219D1D000, v16, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", buf, 0xCu);
    }
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v29[5], 0);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

void __83__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_personaID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(id *)(v3 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __83__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_personaID___block_invoke_2;
  v5[3] = &unk_24DBE37D0;
  v4 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  LOBYTE(v4) = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v4, &v7, v5);
  objc_storeStrong((id *)(v3 + 40), v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;

}

void __83__DMCEnrollmentFlowController__updateRMAccountWithIdentifier_authTokens_personaID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_updateCredentialForAccount:authTokens:", v4, v3);
  objc_msgSend(v4, "dmc_setBearerReauthURL:", 0);
  objc_msgSend(v4, "dmc_setBearerReauthParams:", 0);

}

- (void)_correlateMAIDWithAltDSID:(id)a3 withRMAccount:(id)a4 isProfileLocked:(BOOL)a5 organizationName:(id)a6 friendlyName:(id)a7 personaID:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  BOOL v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  BOOL v77;
  uint8_t buf[4];
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v44 = a8;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v73[0] = MEMORY[0x24BDAC760];
  v73[1] = 3221225472;
  v73[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke;
  v73[3] = &unk_24DBE3820;
  v42 = v15;
  v74 = v42;
  v41 = v14;
  v75 = v41;
  v19 = v16;
  v76 = v19;
  v77 = a5;
  v20 = (void *)MEMORY[0x2207343C4](v73);
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy_;
  v71 = __Block_byref_object_dispose_;
  v72 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 1;
  v21 = (void *)MEMORY[0x24BE2A838];
  v57[0] = v18;
  v57[1] = 3221225472;
  v57[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_2;
  v57[3] = &unk_24DBE3848;
  v61 = &v63;
  v22 = v17;
  v58 = v22;
  v23 = v13;
  v59 = v23;
  v62 = &v67;
  v24 = v20;
  v60 = v24;
  v25 = (id)objc_msgSend(v21, "performBlockUnderPersona:block:", v44, v57);
  if (*((_BYTE *)v64 + 24))
  {
    v26 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v26, OS_LOG_TYPE_DEFAULT, "iCloud Account Saved Successfully.", buf, 2u);
    }
    v27 = (void *)MEMORY[0x24BE2A838];
    v51[0] = v18;
    v51[1] = 3221225472;
    v51[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_81;
    v51[3] = &unk_24DBE3848;
    v55 = &v63;
    v28 = v22;
    v52 = v28;
    v29 = v23;
    v53 = v29;
    v56 = &v67;
    v54 = v24;
    v30 = (id)objc_msgSend(v27, "performBlockUnderPersona:block:", v44, v51);
    if (*((_BYTE *)v64 + 24))
    {
      v31 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219D1D000, v31, OS_LOG_TYPE_DEFAULT, "iTunes Account Saved Successfully.", buf, 2u);
      }
      v32 = (void *)MEMORY[0x24BE2A838];
      v45[0] = v18;
      v45[1] = 3221225472;
      v45[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_82;
      v45[3] = &unk_24DBE3890;
      v48 = &v63;
      v46 = v28;
      v47 = v29;
      v49 = &v67;
      v50 = a5;
      v33 = (id)objc_msgSend(v32, "performBlockUnderPersona:block:", v44, v45);
      if (*((_BYTE *)v64 + 24))
      {
        v34 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219D1D000, v34, OS_LOG_TYPE_DEFAULT, "RM Account Saved Successfully.", buf, 2u);
        }
        -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
      }
      else
      {
        v39 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = v68[5];
          *(_DWORD *)buf = 138543362;
          v79 = v40;
          _os_log_impl(&dword_219D1D000, v39, OS_LOG_TYPE_ERROR, "Error Updating RM Account: %{public}@", buf, 0xCu);
        }
        -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v68[5], 0);
      }

    }
    else
    {
      v37 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = v68[5];
        *(_DWORD *)buf = 138543362;
        v79 = v38;
        _os_log_impl(&dword_219D1D000, v37, OS_LOG_TYPE_ERROR, "Error Updating iTunes Account: %{public}@", buf, 0xCu);
      }
      -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v68[5], 0);
    }

  }
  else
  {
    v35 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = v68[5];
      *(_DWORD *)buf = 138543362;
      v79 = v36;
      _os_log_impl(&dword_219D1D000, v35, OS_LOG_TYPE_ERROR, "Error Updating iCloud Account: %{public}@", buf, 0xCu);
    }
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v68[5], 0);
  }

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);

}

void __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAccountDescription:", v3);
  objc_msgSend(v4, "dmc_setRemoteManagingAccountIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setManagingOwnerIdentifier:", *MEMORY[0x24BE60E28]);
  objc_msgSend(v4, "setManagingSourceName:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE60E20]);
  objc_msgSend(v4, "dmc_setManagementProfileLocked:", *(unsigned __int8 *)(a1 + 56));

}

void __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v2 = *MEMORY[0x24BDB3FD8];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;
}

void __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_81(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v2 = *MEMORY[0x24BDB4180];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;
}

void __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_82(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD v7[4];
  char v8;
  id obj;

  v2 = *MEMORY[0x24BDB4110];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v5 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_2_83;
  v7[3] = &__block_descriptor_33_e19_v16__0__ACAccount_8l;
  v8 = *(_BYTE *)(a1 + 64);
  v6 = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, v7);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
}

uint64_t __127__DMCEnrollmentFlowController__correlateMAIDWithAltDSID_withRMAccount_isProfileLocked_organizationName_friendlyName_personaID___block_invoke_2_83(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dmc_setManagementProfileLocked:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateAccountsWithRMIdentifier:(id)a3 managedAppleID:(id)a4 profileIdentifier:(id)a5 organizationName:(id)a6 enrollmentURL:(id)a7 personaID:(id)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  uint8_t *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  uint64_t *v68;
  uint8_t *v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t *v81;
  uint8_t *v82;
  uint8_t v83[8];
  uint8_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  char v92;
  uint8_t buf[4];
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v54 = a5;
  v55 = a6;
  v56 = a7;
  v57 = a8;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dmc_iCloudAccountWithUsername:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "username");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dmc_altDSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v92 = 1;
    *(_QWORD *)v83 = 0;
    v84 = v83;
    v85 = 0x3032000000;
    v86 = __Block_byref_object_copy_;
    v87 = __Block_byref_object_dispose_;
    v88 = 0;
    v20 = (void *)MEMORY[0x24BE2A838];
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke;
    v72[3] = &unk_24DBE38E0;
    v81 = &v89;
    v52 = v15;
    v21 = v15;
    v73 = v21;
    v22 = v13;
    v74 = v22;
    v82 = v83;
    v23 = v18;
    v75 = v23;
    v76 = v55;
    v24 = v19;
    v77 = v24;
    v25 = v57;
    v78 = v25;
    v79 = v54;
    v80 = v56;
    v26 = (id)objc_msgSend(v20, "performBlockUnderPersona:block:", v25, v72);
    if (*((_BYTE *)v90 + 24))
    {
      v27 = *(NSObject **)DMCLogObjects();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      v29 = MEMORY[0x24BDAC760];
      if (v28)
      {
        *(_DWORD *)buf = 138543362;
        v94 = v22;
        _os_log_impl(&dword_219D1D000, v27, OS_LOG_TYPE_DEFAULT, "Remote Management Account Saved Successfully: %{public}@", buf, 0xCu);
      }
      v70[0] = v29;
      v70[1] = 3221225472;
      v70[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_84;
      v70[3] = &unk_24DBE3908;
      v71 = v22;
      v30 = (void *)MEMORY[0x2207343C4](v70);
      v50 = v13;
      v31 = v23;
      v32 = v14;
      v33 = (void *)MEMORY[0x24BE2A838];
      v64[0] = v29;
      v64[1] = 3221225472;
      v64[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_2_85;
      v64[3] = &unk_24DBE3848;
      v68 = &v89;
      v34 = v21;
      v65 = v34;
      v35 = v24;
      v66 = v35;
      v69 = v83;
      v36 = v30;
      v67 = v36;
      v37 = v33;
      v14 = v32;
      v23 = v31;
      v38 = (id)objc_msgSend(v37, "performBlockUnderPersona:block:", v25, v64);
      if (*((_BYTE *)v90 + 24))
      {
        v39 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219D1D000, v39, OS_LOG_TYPE_DEFAULT, "iCloud Account Saved Successfully.", buf, 2u);
        }
        v40 = (void *)MEMORY[0x24BE2A838];
        v58[0] = MEMORY[0x24BDAC760];
        v58[1] = 3221225472;
        v58[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_86;
        v58[3] = &unk_24DBE3848;
        v62 = &v89;
        v59 = v34;
        v60 = v35;
        v63 = v83;
        v61 = v36;
        v41 = (id)objc_msgSend(v40, "performBlockUnderPersona:block:", v25, v58);
        if (*((_BYTE *)v90 + 24))
        {
          v42 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219D1D000, v42, OS_LOG_TYPE_DEFAULT, "iTunes Account Saved Successfully.", buf, 2u);
          }
          -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep", v50);
        }
        else
        {
          v48 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v49 = (void *)*((_QWORD *)v84 + 5);
            *(_DWORD *)buf = 138543362;
            v94 = v49;
            _os_log_impl(&dword_219D1D000, v48, OS_LOG_TYPE_ERROR, "Error Updating iTunes Account: %{public}@", buf, 0xCu);
          }
          -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", *((_QWORD *)v84 + 5), 0, v50);
        }

      }
      else
      {
        v46 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = (void *)*((_QWORD *)v84 + 5);
          *(_DWORD *)buf = 138543362;
          v94 = v47;
          _os_log_impl(&dword_219D1D000, v46, OS_LOG_TYPE_ERROR, "Error Updating iCloud Account: %{public}@", buf, 0xCu);
        }
        -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", *((_QWORD *)v84 + 5), 0, v50);
      }

      v13 = v51;
    }
    else
    {
      v44 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = (void *)*((_QWORD *)v84 + 5);
        *(_DWORD *)buf = 138543362;
        v94 = v45;
        _os_log_impl(&dword_219D1D000, v44, OS_LOG_TYPE_ERROR, "Error Saving Remote Management Account: %{public}@", buf, 0xCu);
      }
      -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", *((_QWORD *)v84 + 5), 0);
    }

    v15 = v52;
    _Block_object_dispose(v83, 8);

    _Block_object_dispose(&v89, 8);
  }
  else
  {
    v43 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v83 = 0;
      _os_log_impl(&dword_219D1D000, v43, OS_LOG_TYPE_ERROR, "Error Missing Apple Account during User Enrollment", v83, 2u);
    }
    +[DMCEnrollmentFlowController _createMissingAppleAccountForUserEnrollmentError](DMCEnrollmentFlowController, "_createMissingAppleAccountForUserEnrollmentError");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v23, 0);
  }

}

void __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v12 = *(id *)(v4 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_2;
  v5[3] = &unk_24DBE38B8;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 80);
  v11 = *(id *)(a1 + 88);
  LOBYTE(v2) = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v3, &v12, v5);
  objc_storeStrong((id *)(v4 + 40), v12);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = (_BYTE)v2;

}

void __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setUsername:", v3);
  objc_msgSend(v4, "setAccountDescription:", a1[5]);
  objc_msgSend(v4, "dmc_setAltDSID:", a1[6]);
  objc_msgSend(v4, "dmc_setPersonaIdentifier:", a1[7]);
  objc_msgSend(v4, "dmc_setManagementProfileIdentifier:", a1[8]);
  objc_msgSend(v4, "dmc_setEnrollmentURL:", a1[9]);

}

uint64_t __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_84(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dmc_setRemoteManagingAccountIdentifier:", *(_QWORD *)(a1 + 32));
}

void __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_2_85(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v2 = *MEMORY[0x24BDB3FD8];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;
}

void __137__DMCEnrollmentFlowController__updateAccountsWithRMIdentifier_managedAppleID_profileIdentifier_organizationName_enrollmentURL_personaID___block_invoke_86(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v2 = *MEMORY[0x24BDB4180];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v3, "dmc_updateAccountWithTypeIdentifier:altDSID:error:updateBlock:", v2, v4, &obj, v5);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;
}

- (void)_reauthenticationCompleteWithRMIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  v7 = *(NSObject **)DMCLogObjects();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_DEBUG, "Reauthentication complete for: %{public}@.", (uint8_t *)&v10, 0xCu);
    }
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reauthenticationComplete");

  }
  else if (v8)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_DEBUG, "Cannot complete reauthentication.", (uint8_t *)&v10, 2u);
  }
  -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");

}

- (void)_requestiCloudSignInConfirmation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__DMCEnrollmentFlowController__requestiCloudSignInConfirmation__block_invoke;
  v4[3] = &unk_24DBE36B8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "requestiCloudSignInConfirmationWithCompletionHandler:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__DMCEnrollmentFlowController__requestiCloudSignInConfirmation__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __63__DMCEnrollmentFlowController__requestiCloudSignInConfirmation__block_invoke_2;
    v6[3] = &unk_24DBE3690;
    v6[4] = v4;
    v7 = a2;
    objc_msgSend(v5, "queueBlock:", v6);

  }
}

uint64_t __63__DMCEnrollmentFlowController__requestiCloudSignInConfirmation__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 28)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[DMCEnrollmentFlowController _requestiCloudSignInConfirmation]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(v3, "_pollNextStep");
  else
    return objc_msgSend(v3, "_flowTerminatedWithError:canceled:", 0, 1);
}

- (void)_promoteiCloudWithAltDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dmc_accountQuotaString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__DMCEnrollmentFlowController__promoteiCloudWithAltDSID___block_invoke;
  v9[3] = &unk_24DBE3930;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "showiCloudPromotionPageWithiCloudQuotaString:completionHandler:", v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __57__DMCEnrollmentFlowController__promoteiCloudWithAltDSID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __57__DMCEnrollmentFlowController__promoteiCloudWithAltDSID___block_invoke_2;
    v4[3] = &unk_24DBE3370;
    v4[4] = v2;
    objc_msgSend(v3, "queueBlock:", v4);

  }
}

uint64_t __57__DMCEnrollmentFlowController__promoteiCloudWithAltDSID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 27)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[DMCEnrollmentFlowController _promoteiCloudWithAltDSID:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
}

- (void)_askForRestoreChoiceWithMAID:(id)a3 personaID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__DMCEnrollmentFlowController__askForRestoreChoiceWithMAID_personaID___block_invoke;
  v9[3] = &unk_24DBE36B8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "suggestRestoreForAccountWithUsername:personaID:completionHandler:", v6, v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __70__DMCEnrollmentFlowController__askForRestoreChoiceWithMAID_personaID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __70__DMCEnrollmentFlowController__askForRestoreChoiceWithMAID_personaID___block_invoke_2;
    v4[3] = &unk_24DBE3370;
    v4[4] = v2;
    objc_msgSend(v3, "queueBlock:", v4);

  }
}

uint64_t __70__DMCEnrollmentFlowController__askForRestoreChoiceWithMAID_personaID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 30)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[DMCEnrollmentFlowController _askForRestoreChoiceWithMAID:personaID:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
}

- (void)_installEnterpriseApplication:(id)a3 debuggingAppIDs:(id)a4 personaID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke;
  v12[3] = &unk_24DBE39F8;
  v12[4] = self;
  v13 = v9;
  v14 = v8;
  v10 = v8;
  v11 = v9;
  -[DMCEnrollmentFlowController _fetchBundleIDsWithiTunesItemID:debuggingAppIDs:completionHandler:](self, "_fetchBundleIDsWithiTunesItemID:debuggingAppIDs:completionHandler:", v10, a4, v12);

}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workerQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2;
  v8[3] = &unk_24DBE3958;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v4, "queueBlock:", v8);

}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  int8x16_t v25;
  _QWORD v26[4];
  int8x16_t v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  const __CFString *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if ((objc_msgSend(MEMORY[0x24BE2A7D8], "ESSOTestModeEnabled") & 1) != 0)
    {
LABEL_16:
      if ((objc_msgSend(MEMORY[0x24BE2A7F0], "allowAnyESSOApplicationEntitlements") & 1) != 0)
      {
        v14 = 0;
      }
      else
      {
        v41 = CFSTR("com.apple.developer.enrollment-sso-capable");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = MEMORY[0x24BDAC760];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_90;
      v31[3] = &unk_24DBE3958;
      v16 = *(id *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(void **)(a1 + 48);
      v32 = v16;
      v33 = v17;
      v34 = v18;
      v19 = v14;
      v35 = v19;
      v20 = (void *)MEMORY[0x2207343C4](v31);
      v21 = (void *)MEMORY[0x24BE2A838];
      v22 = *(_QWORD *)(a1 + 48);
      v26[0] = v15;
      v26[1] = 3221225472;
      v26[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2_91;
      v26[3] = &unk_24DBE39D0;
      v25 = *(int8x16_t *)(a1 + 32);
      v23 = (id)v25.i64[0];
      v27 = vextq_s8(v25, v25, 8uLL);
      v28 = v19;
      v30 = v20;
      v29 = *(id *)(a1 + 56);
      v24 = v20;
      v9 = v19;
      objc_msgSend(v21, "setPersonaIdentifierForApps:personaID:completionHandler:", v23, v22, v26);

    }
    else
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v2 = *(id *)(a1 + 32);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v37;
        while (2)
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v37 != v5)
              objc_enumerationMutation(v2);
            if (!objc_msgSend(*(id *)(a1 + 40), "_appWithBundleIDExists:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v6)))
            {

              goto LABEL_16;
            }
            ++v6;
          }
          while (v4 != v6);
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
          if (v4)
            continue;
          break;
        }
      }

      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_appNameWithBundleID:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v10 = *(void **)(a1 + 40);
      +[DMCEnrollmentFlowController _createEnterpriseApplicationExistsErrorWithAppName:](DMCEnrollmentFlowController, "_createEnterpriseApplicationExistsErrorWithAppName:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_flowTerminatedWithError:canceled:", v11, 0);

    }
  }
  else
  {
    v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v12, OS_LOG_TYPE_ERROR, "No application bundle ID", buf, 2u);
    }
    v13 = *(void **)(a1 + 40);
    +[DMCEnrollmentFlowController _createMissingEnterpriseApplicationBundleIDError](DMCEnrollmentFlowController, "_createMissingEnterpriseApplicationBundleIDError");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_flowTerminatedWithError:canceled:", v9, 0);
  }

}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_90(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v21;
    while (2)
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7);
        v10 = *(void **)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        v12 = *(_QWORD *)(a1 + 56);
        v19 = v8;
        v13 = objc_msgSend(v10, "_validateAndTrackAppWithBundleID:personaID:requiredEntitlements:error:", v9, v11, v12, &v19);
        v5 = v19;

        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 40), "setAppBundleID:", v9);
          v14 = 1;
          goto LABEL_13;
        }
        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }
  v14 = 0;
LABEL_13:

  v15 = *(void **)(a1 + 40);
  objc_msgSend(v15, "dirtyState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_writeDirtyStateToDisk:", v16);

  v17 = *(void **)(a1 + 40);
  if ((v14 & 1) != 0)
  {
    objc_msgSend(v17, "_pollNextStep");
  }
  else if (v5)
  {
    objc_msgSend(v17, "_flowTerminatedWithError:canceled:", v5, 0);
  }
  else
  {
    +[DMCEnrollmentFlowController _createMissingEnterpriseApplicationError](DMCEnrollmentFlowController, "_createMissingEnterpriseApplicationError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_flowTerminatedWithError:canceled:", v18, 0);

  }
}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2_91(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", v3, 0);
  }
  else
  {
    if (objc_msgSend(MEMORY[0x24BE2A7D8], "ESSOTestModeEnabled"))
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "presenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_3;
      v15[3] = &unk_24DBE39A8;
      v7 = &v17;
      objc_copyWeak(&v17, &location);
      v16 = *(id *)(a1 + 64);
      objc_msgSend(v4, "requestDebuggingApplicationsInstallation:requiredEntitlements:completionHandler:", v5, v6, v15);

      v8 = v16;
    }
    else
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "presenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_92;
      v12[3] = &unk_24DBE39A8;
      v7 = &v14;
      objc_copyWeak(&v14, &location);
      v13 = *(id *)(a1 + 64);
      objc_msgSend(v9, "requestESSOApplicationInstallationWithITunesItemID:requiredEntitlements:completionHandler:", v10, v11, v12);

      v8 = v13;
    }

    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }

}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_4;
    v9[3] = &unk_24DBE3980;
    v9[4] = v7;
    v12 = a2;
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v8, "queueBlock:", v9);

  }
}

uint64_t __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  BOOL v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 6)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[DMCEnrollmentFlowController _installEnterpriseApplication:debuggingAppIDs:personaID:]_block_invoke_4";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  if (*(_BYTE *)(a1 + 56))
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 40) == 0;
  if (v3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:");
}

void __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_92(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2_93;
    v9[3] = &unk_24DBE3980;
    v9[4] = v7;
    v12 = a2;
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v8, "queueBlock:", v9);

  }
}

uint64_t __87__DMCEnrollmentFlowController__installEnterpriseApplication_debuggingAppIDs_personaID___block_invoke_2_93(uint64_t a1)
{
  NSObject *v2;
  BOOL v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 6)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[DMCEnrollmentFlowController _installEnterpriseApplication:debuggingAppIDs:personaID:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  if (*(_BYTE *)(a1 + 56))
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 40) == 0;
  if (v3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:");
}

- (BOOL)_validateAndTrackAppWithBundleID:(id)a3 personaID:(id)a4 requiredEntitlements:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v30;
  id v31;
  void *v32;
  id *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v32 = v10;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, a6);
  v14 = v13;
  v33 = a6;
  if (*a6)
  {
    v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *v33;
      *(_DWORD *)buf = 138543618;
      v41 = v10;
      v42 = 2114;
      v43 = v16;
      _os_log_impl(&dword_219D1D000, v15, OS_LOG_TYPE_ERROR, "Failed to load record for app: %{public}@ with error: %{public}@", buf, 0x16u);
    }
    v17 = 0;
  }
  else
  {
    objc_msgSend(v13, "managedPersonas");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "containsObject:", v11))
    {
      v30 = v18;
      v31 = v11;
      -[DMCEnrollmentFlowController dirtyState](self, "dirtyState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addDirtyBundleID:", v10);

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v12;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v36;
        v17 = 1;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v14, "entitlements");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKey:ofClass:", v24, objc_opt_class());
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "BOOLValue");

            if ((v27 & 1) == 0)
            {
              v28 = *(NSObject **)DMCLogObjects();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v41 = v32;
                v42 = 2114;
                v43 = v24;
                _os_log_impl(&dword_219D1D000, v28, OS_LOG_TYPE_ERROR, "Application (%{public}@) doesn't have the required entitlement: %{public}@", buf, 0x16u);
              }
              +[DMCEnrollmentFlowController _createEnterpriseApplicationMissingEntitlementsError](DMCEnrollmentFlowController, "_createEnterpriseApplicationMissingEntitlementsError");
              v17 = 0;
              *v33 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v21);
      }
      else
      {
        v17 = 1;
      }

      v11 = v31;
      v18 = v30;
    }
    else
    {
      v17 = 0;
    }

  }
  return v17 & 1;
}

- (void)_installESSOConfigurationProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = objc_msgSend(v11, "validateESSOConfigurationProfile:error:", v8, &v16);
  v13 = v16;

  if ((v12 & 1) != 0)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __89__DMCEnrollmentFlowController__installESSOConfigurationProfile_devicePasscode_personaID___block_invoke;
    v15[3] = &unk_24DBE3A20;
    v15[4] = self;
    objc_msgSend(v14, "installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:completionHandler:", v8, v9, v10, 0, v15);

  }
  else
  {
    -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v13, 0);
  }

}

void __89__DMCEnrollmentFlowController__installESSOConfigurationProfile_devicePasscode_personaID___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "workerQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __89__DMCEnrollmentFlowController__installESSOConfigurationProfile_devicePasscode_personaID___block_invoke_2;
  v12[3] = &unk_24DBE35F0;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v9;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "queueBlock:", v12);

}

uint64_t __89__DMCEnrollmentFlowController__installESSOConfigurationProfile_devicePasscode_personaID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v3;
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "ESSO configuration profile installation failed with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    return objc_msgSend(*(id *)(a1 + 40), "_flowTerminatedWithError:canceled:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setESSOConfigurationProfileIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "dirtyState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDirtyProfileIdentifier:", *(_QWORD *)(a1 + 48));

    v6 = *(void **)(a1 + 40);
    objc_msgSend(v6, "dirtyState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_writeDirtyStateToDisk:", v7);

    return objc_msgSend(*(id *)(a1 + 40), "_pollNextStep");
  }
}

- (void)_manageApplicationWithAppBundleID:(id)a3 essoDetails:(id)a4 organization:(id)a5 personaID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iTunesStoreID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "associatedDomains");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "associatedDomainsEnableDirectDownloads");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __100__DMCEnrollmentFlowController__manageApplicationWithAppBundleID_essoDetails_organization_personaID___block_invoke;
  v18[3] = &unk_24DBE3668;
  v18[4] = self;
  objc_msgSend(v14, "manageApplicationWithBundleID:iTunesItemID:organization:personaID:associatedDomains:associatedDomainsEnableDirectDownloads:configuration:completionHandler:", v13, v15, v11, v10, v16, v17, 0, v18);

}

uint64_t __100__DMCEnrollmentFlowController__manageApplicationWithAppBundleID_essoDetails_organization_personaID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "_flowTerminatedWithError:canceled:", a2, 0);
  else
    return objc_msgSend(v2, "_pollNextStep");
}

- (void)_restoreSetAsideProfiles
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD v8[5];

  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__DMCEnrollmentFlowController__restoreSetAsideProfiles__block_invoke;
    v8[3] = &unk_24DBE3668;
    v8[4] = self;
    objc_msgSend(v5, "restoreSetAsideCloudConfigAndProfilesWithCompletionHandler:", v8);

  }
  else
  {
    v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_DEFAULT, "Nothing to restore, continue...", v7, 2u);
    }
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }
}

void __55__DMCEnrollmentFlowController__restoreSetAsideProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_219D1D000, v4, OS_LOG_TYPE_ERROR, "Failed to restore set aside profiles with error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");

}

- (void)_fetchCloudConfigWithEnrollmentType:(unint64_t)a3 isReturnToService:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD block[4];
  void (**v17)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[16];
  _QWORD v19[5];
  BOOL v20;

  v4 = a4;
  -[DMCEnrollmentFlowController presenter](self, "presenter", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showFetchingCloudConfigurationScene");

  }
  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __85__DMCEnrollmentFlowController__fetchCloudConfigWithEnrollmentType_isReturnToService___block_invoke;
  v19[3] = &unk_24DBE3A48;
  v19[4] = self;
  v20 = v4;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2207343C4](v19);
  if (v4
    && (-[DMCEnrollmentFlowController obliterationShelter](self, "obliterationShelter"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "cloudConfigurationDetails"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v13, OS_LOG_TYPE_DEFAULT, "Device has local Cloud Config profile from Return to Service, restoring...", buf, 2u);
    }
    ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v12, 0);
  }
  else if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateDEPCommunication"))
  {
    v14 = dispatch_time(0, 1000000000);
    dispatch_get_global_queue(21, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __85__DMCEnrollmentFlowController__fetchCloudConfigWithEnrollmentType_isReturnToService___block_invoke_100;
    block[3] = &unk_24DBE3A70;
    v17 = v10;
    dispatch_after(v14, v15, block);

    v12 = v17;
  }
  else
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchCloudConfigWithCompletionHandler:", v10);
  }

}

void __85__DMCEnrollmentFlowController__fetchCloudConfigWithEnrollmentType_isReturnToService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (!v10)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v7 = *(void **)(a1 + 32);
      if (!v5)
        goto LABEL_3;
      v8 = v5;
      v9 = 0;
    }
    else
    {
      v7 = *(void **)(a1 + 32);
      v9 = v5 == 0;
      v8 = v5;
    }
    objc_msgSend(v7, "_flowTerminatedWithError:canceled:", v8, v9);
    goto LABEL_9;
  }
  v6 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setCloudConfig:", v6);

  v7 = *(void **)(a1 + 32);
LABEL_3:
  objc_msgSend(v7, "_pollNextStep");
LABEL_9:

}

void __85__DMCEnrollmentFlowController__fetchCloudConfigWithEnrollmentType_isReturnToService___block_invoke_100(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE2A7F0], "simulatedCloudConfigProfile");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)_analyzeCloudConfig:(id)a3 enrollmentType:(unint64_t)a4 isReturnToService:(BOOL)a5 obliterationShelter:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  const char *v37;
  uint8_t *v38;
  void *v39;
  void *v40;
  uint8_t v41[16];
  uint8_t v42[2];
  __int16 v43;
  uint8_t v44[16];
  uint8_t v45[16];
  uint8_t v46[16];
  uint8_t buf[16];

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (!v7)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v11, "isSupervised") & 1) == 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE60E10]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
    {
      v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219D1D000, v15, OS_LOG_TYPE_DEFAULT, "Supervision state has changed, continue as non-RTS flow.", buf, 2u);
      }
      -[DMCEnrollmentFlowController setIsReturnToService:](self, "setIsReturnToService:", 0);
      objc_msgSend(v12, "clear");
      goto LABEL_7;
    }
  }
  v16 = 1;
LABEL_9:
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE60E00]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE60DD0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    certificatesFromDERCertificateDataArray();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowController setAnchorCertificateRefs:](self, "setAnchorCertificateRefs:", v22);
    v26 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE60DF0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLWithString:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[DMCEnrollmentFlowController _canSkipMDMEnrollmentWithEnrollmentType:](self, "_canSkipMDMEnrollmentWithEnrollmentType:", a4))
    {
      v28 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_219D1D000, v28, OS_LOG_TYPE_DEFAULT, "The MDM enrollment is done already! Fast forward to AwaitDeviceConfiguration", v46, 2u);
      }
      goto LABEL_34;
    }
    if (v23)
    {
      v30 = *(NSObject **)DMCLogObjects();
      if (v16)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v45 = 0;
          _os_log_impl(&dword_219D1D000, v30, OS_LOG_TYPE_ERROR, "Return to Service: Does not support webURL!", v45, 2u);
        }
        +[DMCEnrollmentFlowController _createUnsupportedFeatureError](DMCEnrollmentFlowController, "_createUnsupportedFeatureError");
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_219D1D000, v30, OS_LOG_TYPE_DEFAULT, "Cloud config has Web URL", v44, 2u);
      }
      -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v23);
      -[DMCEnrollmentFlowController setEnrollmentMethod:](self, "setEnrollmentMethod:", 6);
      -[DMCEnrollmentFlowController _ADE_deviceEnrollment_webURL_steps](self, "_ADE_deviceEnrollment_webURL_steps");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentFlowControllerBase _appendSteps:](self, "_appendSteps:", v34);
      goto LABEL_33;
    }
    v32 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE60DE8]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "URLWithString:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v34);
    -[DMCEnrollmentFlowController setEnrollmentMethod:](self, "setEnrollmentMethod:", 3);
    v35 = *(NSObject **)DMCLogObjects();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (!v36)
      {
LABEL_32:
        -[DMCEnrollmentFlowController _ADE_deviceEnrollment_legacy_steps](self, "_ADE_deviceEnrollment_legacy_steps");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCEnrollmentFlowControllerBase _appendSteps:](self, "_appendSteps:", v39);

LABEL_33:
LABEL_34:
        -[DMCEnrollmentFlowController _ADE_postEnrollmentSteps](self, "_ADE_postEnrollmentSteps");
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      v43 = 0;
      v37 = "Cloud config has traditional configuration URL.";
      v38 = (uint8_t *)&v43;
    }
    else
    {
      if (!v16)
      {
        if (v36)
        {
          *(_WORD *)v41 = 0;
          _os_log_impl(&dword_219D1D000, v35, OS_LOG_TYPE_DEFAULT, "Cloud config doesn't require an enrollment.", v41, 2u);
        }
        goto LABEL_36;
      }
      if (!v36)
        goto LABEL_32;
      *(_WORD *)v42 = 0;
      v37 = "Cloud config has no configuration URL. But we are doing Return to Service!";
      v38 = v42;
    }
    _os_log_impl(&dword_219D1D000, v35, OS_LOG_TYPE_DEFAULT, v37, v38, 2u);
    goto LABEL_32;
  }
  v19 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE60E08]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE60DF8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  certificatesFromDERCertificateDataArray();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[DMCEnrollmentFlowController setAnchorCertificateRefs:](self, "setAnchorCertificateRefs:", v23);
    -[DMCEnrollmentFlowController setServiceURL:](self, "setServiceURL:", v21);
    -[DMCEnrollmentFlowController setEnrollmentType:](self, "setEnrollmentType:", 1);
    -[DMCEnrollmentFlowController _ORGO_pre_enrollment_steps](self, "_ORGO_pre_enrollment_steps");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowControllerBase _appendSteps:](self, "_appendSteps:", v24);

    -[DMCEnrollmentFlowController _ORGO_commonSteps](self, "_ORGO_commonSteps");
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_35:
    v40 = (void *)v25;
    -[DMCEnrollmentFlowControllerBase _appendSteps:](self, "_appendSteps:", v25);

LABEL_36:
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
    goto LABEL_37;
  }
  +[DMCEnrollmentFlowController _createInvalidCloudConfigError](DMCEnrollmentFlowController, "_createInvalidCloudConfigError");
  v29 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v31 = (void *)v29;
  -[DMCEnrollmentFlowController _flowTerminatedWithError:canceled:](self, "_flowTerminatedWithError:canceled:", v29, 0);

LABEL_37:
}

- (void)_storeCloudConfig:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__DMCEnrollmentFlowController__storeCloudConfig___block_invoke;
    v7[3] = &unk_24DBE3A98;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "storeCloudConfig:completionHandler:", v8, v7);

  }
  else
  {
    v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_DEFAULT, "No cloud config to store. Skipping...", buf, 2u);
    }
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }

}

void __49__DMCEnrollmentFlowController__storeCloudConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v3;
      _os_log_impl(&dword_219D1D000, v4, OS_LOG_TYPE_DEFAULT, "Failed to store cloud config. Error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", v3, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enrollmentFlowController:didReceiveCloudConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
  }

}

- (void)_waitForDeviceConfiguration
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id buf[2];

  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isDeviceConfigured");

      if (v7)
      {
        -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
      }
      else
      {
        -[DMCEnrollmentFlowController presenter](self, "presenter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) != 0)
        {
          -[DMCEnrollmentFlowController presenter](self, "presenter");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "showAwaitingDeviceConfigurationScene");

        }
        objc_initWeak(buf, self);
        -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __58__DMCEnrollmentFlowController__waitForDeviceConfiguration__block_invoke;
        v13[3] = &unk_24DBE3930;
        objc_copyWeak(&v14, buf);
        objc_msgSend(v12, "awaitDeviceConfiguredWithCompletionHandler:", v13);

        objc_destroyWeak(&v14);
        objc_destroyWeak(buf);
      }
      return;
    }
  }
  else
  {

  }
  v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_219D1D000, v8, OS_LOG_TYPE_DEFAULT, "Client doesn't support isDeviceConfigured method, returning...", (uint8_t *)buf, 2u);
  }
  -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
}

void __58__DMCEnrollmentFlowController__waitForDeviceConfiguration__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __58__DMCEnrollmentFlowController__waitForDeviceConfiguration__block_invoke_2;
    v4[3] = &unk_24DBE3370;
    v4[4] = v2;
    objc_msgSend(v3, "queueBlock:", v4);

  }
}

uint64_t __58__DMCEnrollmentFlowController__waitForDeviceConfiguration__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 38)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[DMCEnrollmentFlowController _waitForDeviceConfiguration]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
}

- (void)_askForMDMUsernameAndCredential
{
  void *v3;
  char v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62__DMCEnrollmentFlowController__askForMDMUsernameAndCredential__block_invoke;
    v6[3] = &unk_24DBE3AC0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "requestMDMUsernameAndPasswordWithCompletionHandler:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __62__DMCEnrollmentFlowController__askForMDMUsernameAndCredential__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;

  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__DMCEnrollmentFlowController__askForMDMUsernameAndCredential__block_invoke_2;
    v12[3] = &unk_24DBE34D8;
    v12[4] = v10;
    v15 = a4;
    v13 = v7;
    v14 = v8;
    objc_msgSend(v11, "queueBlock:", v12);

  }
}

uint64_t __62__DMCEnrollmentFlowController__askForMDMUsernameAndCredential__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 35)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[DMCEnrollmentFlowController _askForMDMUsernameAndCredential]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v4, 0xCu);
    }
  }
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "setUsername:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPassword:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_pollNextStep");
}

- (void)_fetchEnrollmentProfileFromServiceURL:(id)a3 username:(id)a4 password:(id)a5 machineInfo:(id)a6 anchorCertificateRefs:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController serviceDiscoveryHelper](self, "serviceDiscoveryHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __121__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_username_password_machineInfo_anchorCertificateRefs___block_invoke;
  v18[3] = &unk_24DBE3AE8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v17, "fetchEnrollmentProfileWithServiceURL:username:password:authTokens:enrollmentMethod:machineInfo:anchorCertificateRefs:completionHandler:", v12, v13, v14, 0, 3, v15, v16, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __121__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_username_password_machineInfo_anchorCertificateRefs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __121__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_username_password_machineInfo_anchorCertificateRefs___block_invoke_2;
    v10[3] = &unk_24DBE35F0;
    v10[4] = v8;
    v11 = v6;
    v12 = v5;
    objc_msgSend(v9, "queueBlock:", v10);

  }
}

void __121__DMCEnrollmentFlowController__fetchEnrollmentProfileFromServiceURL_username_password_machineInfo_anchorCertificateRefs___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 36)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[DMCEnrollmentFlowController _fetchEnrollmentProfileFromServiceURL:username:password:machineInfo:anchorCert"
            "ificateRefs:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE2A600]);

    if (!v5
      || (objc_msgSend(*(id *)(a1 + 32), "_handleSoftwareUpdateRequiredError:", *(_QWORD *)(a1 + 40)) & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 32), "_handleNeedCredentialsError:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", *(_QWORD *)(a1 + 40), 0);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setProfileData:", *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "profileData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v8 = objc_msgSend(v6, "_extractAndVerifyPropertiesFromProfileData:enrollmentMethod:isESSO:essoAppITunesStoreID:error:", v7, 3, 0, 0, &v11);
    v9 = v11;

    v10 = *(void **)(a1 + 32);
    if ((v8 & 1) != 0)
      objc_msgSend(v10, "_pollNextStep");
    else
      objc_msgSend(v10, "_flowTerminatedWithError:canceled:", v9, 0);

  }
}

- (BOOL)_handleNeedCredentialsError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE2A600]) & 1) == 0)
  {

    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != 23003)
  {
LABEL_6:
    v14 = 0;
    goto LABEL_9;
  }
  -[DMCEnrollmentFlowControllerBase stepQueue](self, "stepQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _ADE_deviceEnrollment_legacy_additionalNativeAuth_steps](self, "_ADE_deviceEnrollment_legacy_additionalNativeAuth_steps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "indexOfObject:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[DMCEnrollmentFlowController _ADE_deviceEnrollment_legacy_additionalNativeAuth_steps](self, "_ADE_deviceEnrollment_legacy_additionalNativeAuth_steps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowControllerBase stepQueue](self, "stepQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", -[DMCEnrollmentFlowControllerBase nextStepIndex](self, "nextStepIndex"), objc_msgSend(v11, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObjects:atIndexes:", v11, v13);

  }
  else
  {
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "showEnrollmentFailure:", v4);

    -[DMCEnrollmentFlowControllerBase setNextStepIndex:](self, "setNextStepIndex:", v10);
  }
  -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  v14 = 1;
LABEL_9:

  return v14;
}

- (void)_fetchEnrollmentProfileFromWebURL:(id)a3 machineInfo:(id)a4 anchorCertificateRefs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __99__DMCEnrollmentFlowController__fetchEnrollmentProfileFromWebURL_machineInfo_anchorCertificateRefs___block_invoke;
    v14[3] = &unk_24DBE3B10;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v13, "fetchEnrollmentProfileWithWebAuthURL:machineInfo:anchorCertificateRefs:completionHandler:", v8, v9, v10, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __99__DMCEnrollmentFlowController__fetchEnrollmentProfileFromWebURL_machineInfo_anchorCertificateRefs___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __99__DMCEnrollmentFlowController__fetchEnrollmentProfileFromWebURL_machineInfo_anchorCertificateRefs___block_invoke_2;
    v12[3] = &unk_24DBE34D8;
    v12[4] = v10;
    v13 = v8;
    v15 = a3;
    v14 = v7;
    objc_msgSend(v11, "queueBlock:", v12);

  }
}

void __99__DMCEnrollmentFlowController__fetchEnrollmentProfileFromWebURL_machineInfo_anchorCertificateRefs___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 37)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[DMCEnrollmentFlowController _fetchEnrollmentProfileFromWebURL:machineInfo:anchorCertificateRefs:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", buf, 0xCu);
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_handleSoftwareUpdateRequiredError:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56) || v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", v3, *(unsigned __int8 *)(a1 + 56) != 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setProfileData:", *(_QWORD *)(a1 + 48));
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 48);
      v9 = 0;
      v6 = objc_msgSend(v4, "_extractAndVerifyPropertiesFromProfileData:enrollmentMethod:isESSO:essoAppITunesStoreID:error:", v5, 6, 0, 0, &v9);
      v7 = v9;
      v8 = *(void **)(a1 + 32);
      if ((v6 & 1) != 0)
        objc_msgSend(v8, "_pollNextStep");
      else
        objc_msgSend(v8, "_flowTerminatedWithError:canceled:", v7, 0);

    }
  }
}

- (BOOL)_handleSoftwareUpdateRequiredError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE2A600]);
  if (v6)
  {
    v7 = objc_msgSend(v4, "code");

    if (v7 != 23006)
    {
      LOBYTE(v6) = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE2A888]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE2A880]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[DMCEnrollmentFlowController setExpectedOSVersion:](self, "setExpectedOSVersion:", v5);
    -[DMCEnrollmentFlowController setExpectedBuildVersion:](self, "setExpectedBuildVersion:", v10);
    -[DMCEnrollmentFlowController _ADE_deviceEnrollment_softwareUpdate_steps](self, "_ADE_deviceEnrollment_softwareUpdate_steps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentFlowControllerBase stepQueue](self, "stepQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", -[DMCEnrollmentFlowControllerBase nextStepIndex](self, "nextStepIndex"), objc_msgSend(v11, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObjects:atIndexes:", v11, v13);

    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }

LABEL_6:
  return v6;
}

- (void)_ensureWiFiConnectionWithWiFiProfile:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    objc_initWeak(&location, self);
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke;
    v10[3] = &unk_24DBE3B38;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:completionHandler:", v4, 0, 0, 0, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_116;
  v8[3] = &unk_24DBE3B88;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "ensureNetworkConnectionWithCompletionHandler:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;
  char v16;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_2;
    v12[3] = &unk_24DBE34D8;
    v16 = a3;
    v13 = v8;
    v14 = v10;
    v15 = v7;
    objc_msgSend(v11, "queueBlock:", v12);

  }
}

void __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint32_t v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      return;
    v3 = *(_QWORD *)(a1 + 32);
    v14 = 138543362;
    v15 = v3;
    v4 = "Failed to install WiFi profile: %{public}@";
    v5 = v2;
    v6 = OS_LOG_TYPE_ERROR;
    v7 = 12;
LABEL_7:
    _os_log_impl(&dword_219D1D000, v5, v6, v4, (uint8_t *)&v14, v7);
    return;
  }
  v8 = *(unsigned __int8 *)(a1 + 56);
  v9 = *(NSObject **)DMCLogObjects();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v10)
      return;
    LOWORD(v14) = 0;
    v4 = "WiFi profile installation canceled";
    v5 = v9;
    v6 = OS_LOG_TYPE_DEFAULT;
    v7 = 2;
    goto LABEL_7;
  }
  if (v10)
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_219D1D000, v9, OS_LOG_TYPE_DEFAULT, "WiFi profile installed", (uint8_t *)&v14, 2u);
  }
  objc_msgSend(*(id *)(a1 + 40), "setWifiProfileIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "dirtyState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addDirtyProfileIdentifier:", *(_QWORD *)(a1 + 48));

  v12 = *(void **)(a1 + 40);
  objc_msgSend(v12, "dirtyState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_writeDirtyStateToDisk:", v13);

}

void __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_116(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_2_117;
    v7[3] = &unk_24DBE3B60;
    v7[4] = v5;
    v8 = v3;
    objc_msgSend(v6, "queueBlock:", v7);

  }
}

uint64_t __68__DMCEnrollmentFlowController__ensureWiFiConnectionWithWiFiProfile___block_invoke_2_117(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 40)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[DMCEnrollmentFlowController _ensureWiFiConnectionWithWiFiProfile:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v6, 0xCu);
    }
  }
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    return objc_msgSend(v3, "_flowTerminatedWithError:canceled:", v4, 0);
  else
    return objc_msgSend(v3, "_pollNextStep");
}

- (void)_promptForSoftwareUpdateWithExpectedOSVersion:(id)a3 expectedBuildVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __98__DMCEnrollmentFlowController__promptForSoftwareUpdateWithExpectedOSVersion_expectedBuildVersion___block_invoke;
  v9[3] = &unk_24DBE3B88;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "requestSoftwareUpdateWithOSVersion:buildVersion:completionHandler:", v6, v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __98__DMCEnrollmentFlowController__promptForSoftwareUpdateWithExpectedOSVersion_expectedBuildVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __98__DMCEnrollmentFlowController__promptForSoftwareUpdateWithExpectedOSVersion_expectedBuildVersion___block_invoke_2;
    v7[3] = &unk_24DBE3B60;
    v7[4] = v5;
    v8 = v3;
    objc_msgSend(v6, "queueBlock:", v7);

  }
}

uint64_t __98__DMCEnrollmentFlowController__promptForSoftwareUpdateWithExpectedOSVersion_expectedBuildVersion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 39)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[DMCEnrollmentFlowController _promptForSoftwareUpdateWithExpectedOSVersion:expectedBuildVersion:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v7, 0xCu);
    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(const char **)(a1 + 40);
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_219D1D000, v3, OS_LOG_TYPE_ERROR, "Failed to trigger software update due to error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    v5 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_flowTerminatedWithError:canceled:", v5, v5 == 0);
}

- (void)_enrollmentTypeAuthorizedBySDP:(unint64_t)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = v5;
  if (a3 > 9 || ((1 << a3) & 0x38F) != 0)
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  else
    objc_msgSend(MEMORY[0x24BE2A858], "isAuthorizedForOperation:completion:", 1, v5);

}

- (DMCEnrollmentFlowDelegate)delegate
{
  return (DMCEnrollmentFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)rmAccountIdentifier
{
  return self->_rmAccountIdentifier;
}

- (void)setRmAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_rmAccountIdentifier, a3);
}

- (unint64_t)enrollmentType
{
  return self->_enrollmentType;
}

- (void)setDirtyState:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyState, a3);
}

- (DMCEnrollmentFlowPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (DMCEnrollmentFlowMCBridge)managedConfigurationHelper
{
  return self->_managedConfigurationHelper;
}

- (void)setManagedConfigurationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfigurationHelper, a3);
}

- (id)enrollmentCompletionHandler
{
  return self->_enrollmentCompletionHandler;
}

- (void)setEnrollmentCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)restartIfFail
{
  return self->_restartIfFail;
}

- (void)setRestartIfFail:(BOOL)a3
{
  self->_restartIfFail = a3;
}

- (BOOL)cleanupIfFail
{
  return self->_cleanupIfFail;
}

- (void)setCleanupIfFail:(BOOL)a3
{
  self->_cleanupIfFail = a3;
}

- (BOOL)isRenewalFlow
{
  return self->_isRenewalFlow;
}

- (void)setIsRenewalFlow:(BOOL)a3
{
  self->_isRenewalFlow = a3;
}

- (BOOL)isPostRestoration
{
  return self->_isPostRestoration;
}

- (void)setIsPostRestoration:(BOOL)a3
{
  self->_isPostRestoration = a3;
}

- (BOOL)isPostBuddy
{
  return self->_isPostBuddy;
}

- (void)setIsPostBuddy:(BOOL)a3
{
  self->_isPostBuddy = a3;
}

- (void)setServiceDiscoveryHelper:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDiscoveryHelper, a3);
}

- (BOOL)hasExecutedUIStep
{
  return self->_hasExecutedUIStep;
}

- (void)setHasExecutedUIStep:(BOOL)a3
{
  self->_hasExecutedUIStep = a3;
}

- (BOOL)noCompletionScene
{
  return self->_noCompletionScene;
}

- (void)setNoCompletionScene:(BOOL)a3
{
  self->_noCompletionScene = a3;
}

- (NSArray)anchorCertificateRefs
{
  return self->_anchorCertificateRefs;
}

- (void)setAnchorCertificateRefs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)enrollmentMethod
{
  return self->_enrollmentMethod;
}

- (void)setEnrollmentMethod:(unint64_t)a3
{
  self->_enrollmentMethod = a3;
}

- (NSString)devicePasscode
{
  return self->_devicePasscode;
}

- (void)setDevicePasscode:(id)a3
{
  objc_storeStrong((id *)&self->_devicePasscode, a3);
}

- (NSData)devicePasscodeData
{
  return self->_devicePasscodeData;
}

- (void)setDevicePasscodeData:(id)a3
{
  objc_storeStrong((id *)&self->_devicePasscodeData, a3);
}

- (unint64_t)devicePasscodeDataType
{
  return self->_devicePasscodeDataType;
}

- (void)setDevicePasscodeDataType:(unint64_t)a3
{
  self->_devicePasscodeDataType = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_managedAppleID, a3);
}

- (NSArray)servers
{
  return self->_servers;
}

- (void)setServers:(id)a3
{
  objc_storeStrong((id *)&self->_servers, a3);
}

- (unint64_t)serverInformationSource
{
  return self->_serverInformationSource;
}

- (void)setServerInformationSource:(unint64_t)a3
{
  self->_serverInformationSource = a3;
}

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (void)setServiceURL:(id)a3
{
  objc_storeStrong((id *)&self->_serviceURL, a3);
}

- (NSDictionary)authParams
{
  return self->_authParams;
}

- (void)setAuthParams:(id)a3
{
  objc_storeStrong((id *)&self->_authParams, a3);
}

- (NSString)enrollmentURL
{
  return self->_enrollmentURL;
}

- (void)setEnrollmentURL:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentURL, a3);
}

- (NSDictionary)authTokens
{
  return self->_authTokens;
}

- (void)setAuthTokens:(id)a3
{
  objc_storeStrong((id *)&self->_authTokens, a3);
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_storeStrong((id *)&self->_personaID, a3);
}

- (NSMutableDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void)setAuthenticationResults:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationResults, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_profileData, a3);
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (BOOL)isProfileLocked
{
  return self->_isProfileLocked;
}

- (void)setIsProfileLocked:(BOOL)a3
{
  self->_isProfileLocked = a3;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
  objc_storeStrong((id *)&self->_friendlyName, a3);
}

- (NSArray)serverCapabilities
{
  return self->_serverCapabilities;
}

- (void)setServerCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_serverCapabilities, a3);
}

- (MDMESSODetails)essoDetails
{
  return self->_essoDetails;
}

- (void)setEssoDetails:(id)a3
{
  objc_storeStrong((id *)&self->_essoDetails, a3);
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleID, a3);
}

- (NSNumber)essoAppITunesStoreID
{
  return self->_essoAppITunesStoreID;
}

- (void)setEssoAppITunesStoreID:(id)a3
{
  objc_storeStrong((id *)&self->_essoAppITunesStoreID, a3);
}

- (NSString)ESSOConfigurationProfileIdentifier
{
  return self->_ESSOConfigurationProfileIdentifier;
}

- (void)setESSOConfigurationProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ESSOConfigurationProfileIdentifier, a3);
}

- (NSString)wifiProfileIdentifier
{
  return self->_wifiProfileIdentifier;
}

- (void)setWifiProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_wifiProfileIdentifier, a3);
}

- (NSString)expectedOSVersion
{
  return self->_expectedOSVersion;
}

- (void)setExpectedOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_expectedOSVersion, a3);
}

- (NSString)expectedBuildVersion
{
  return self->_expectedBuildVersion;
}

- (void)setExpectedBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_expectedBuildVersion, a3);
}

- (NSDictionary)cloudConfig
{
  return self->_cloudConfig;
}

- (void)setCloudConfig:(id)a3
{
  objc_storeStrong((id *)&self->_cloudConfig, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (void)setObliterationShelter:(id)a3
{
  objc_storeStrong((id *)&self->_obliterationShelter, a3);
}

- (BOOL)isReturnToService
{
  return self->_isReturnToService;
}

- (void)setIsReturnToService:(BOOL)a3
{
  self->_isReturnToService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obliterationShelter, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_cloudConfig, 0);
  objc_storeStrong((id *)&self->_expectedBuildVersion, 0);
  objc_storeStrong((id *)&self->_expectedOSVersion, 0);
  objc_storeStrong((id *)&self->_wifiProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_ESSOConfigurationProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_essoAppITunesStoreID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_essoDetails, 0);
  objc_storeStrong((id *)&self->_serverCapabilities, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_authenticationResults, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_authTokens, 0);
  objc_storeStrong((id *)&self->_enrollmentURL, 0);
  objc_storeStrong((id *)&self->_authParams, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
  objc_storeStrong((id *)&self->_servers, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_devicePasscodeData, 0);
  objc_storeStrong((id *)&self->_devicePasscode, 0);
  objc_storeStrong((id *)&self->_anchorCertificateRefs, 0);
  objc_storeStrong((id *)&self->_serviceDiscoveryHelper, 0);
  objc_storeStrong(&self->_enrollmentCompletionHandler, 0);
  objc_storeStrong((id *)&self->_managedConfigurationHelper, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_dirtyState, 0);
  objc_storeStrong((id *)&self->_rmAccountIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)_commonStepsForEnrollmentType:(unint64_t)a3 isReturnToService:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  switch(a3)
  {
    case 1uLL:
    case 3uLL:
      -[DMCEnrollmentFlowController _ORGO_commonSteps](self, "_ORGO_commonSteps", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[DMCEnrollmentFlowController _ORGO_MACBuddy_commonSteps](self, "_ORGO_MACBuddy_commonSteps", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
    case 5uLL:
      -[DMCEnrollmentFlowController _ADxE_commonSteps](self, "_ADxE_commonSteps", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      -[DMCEnrollmentFlowController _PDUE_UserEnrollment_commonSteps](self, "_PDUE_UserEnrollment_commonSteps", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7uLL:
      -[DMCEnrollmentFlowController _MDM_SharediPad_commonSteps](self, "_MDM_SharediPad_commonSteps", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8uLL:
      -[DMCEnrollmentFlowController _Watch_deviceEnrollmentSteps](self, "_Watch_deviceEnrollmentSteps", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9uLL:
      -[DMCEnrollmentFlowController _ADE_commonSteps](self, "_ADE_commonSteps", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = (void *)MEMORY[0x24BDBD1A8];
      break;
  }
  return v6;
}

- (id)_ORGO_commonSteps
{
  return &unk_24DBE7D08;
}

- (id)_ORGO_deviceEnrollmentSteps
{
  return &unk_24DBE7D20;
}

- (id)_ORGO_MAIDEnrollmentSteps
{
  return &unk_24DBE7D38;
}

- (id)_ORGO_MAIDEnrollmentSteps_orgToken
{
  return &unk_24DBE7D50;
}

- (id)_ORGO_MACBuddy_commonSteps
{
  return &unk_24DBE7D68;
}

- (id)_ORGO_MACBuddy_firstPartSteps
{
  return &unk_24DBE7D80;
}

- (id)_ORGO_MACBuddy_secondPartSteps
{
  return &unk_24DBE7D98;
}

- (id)_ORGO_pre_enrollment_steps
{
  return &unk_24DBE7DB0;
}

- (id)_ADxE_commonSteps
{
  return &unk_24DBE7DC8;
}

- (id)_ADxE_MAID_firstPartSteps
{
  return &unk_24DBE7DE0;
}

- (id)_ADxE_MAID_secondPartSteps_default
{
  return &unk_24DBE7DF8;
}

- (id)_ADxE_MAID_secondPartSteps_orgToken
{
  return &unk_24DBE7E10;
}

- (id)_ADxE_thirdParty_firstPartSteps
{
  return &unk_24DBE7E28;
}

- (id)_ADxE_thirdParty_secondPartSteps_default
{
  return &unk_24DBE7E40;
}

- (id)_ADxE_thirdParty_secondPartSteps_orgToken
{
  return &unk_24DBE7E58;
}

- (id)_ADxE_thirdParty_ESSO_firstPartSteps
{
  return &unk_24DBE7E70;
}

- (id)_ADxE_thirdParty_ESSO_secondPartSteps_default
{
  return &unk_24DBE7E88;
}

- (id)_ADxE_thirdParty_ESSO_secondPartSteps_orgToken
{
  return &unk_24DBE7EA0;
}

- (id)_ADxE_reauthSteps
{
  return &unk_24DBE7EB8;
}

- (id)_ADE_commonSteps
{
  return &unk_24DBE7ED0;
}

- (id)_ADE_RTS_commonSteps
{
  return &unk_24DBE7EE8;
}

- (id)_ADE_deviceEnrollment_legacy_steps
{
  return &unk_24DBE7F00;
}

- (id)_ADE_deviceEnrollment_legacy_additionalNativeAuth_steps
{
  return &unk_24DBE7F18;
}

- (id)_ADE_deviceEnrollment_softwareUpdate_steps
{
  return &unk_24DBE7F30;
}

- (id)_ADE_deviceEnrollment_webURL_steps
{
  return &unk_24DBE7F48;
}

- (id)_ADE_postEnrollmentSteps
{
  return &unk_24DBE7F60;
}

- (id)_PDUE_UserEnrollment_commonSteps
{
  return &unk_24DBE7F78;
}

- (id)_MDM_SharediPad_commonSteps
{
  return &unk_24DBE7F90;
}

- (id)_Watch_deviceEnrollmentSteps
{
  return &unk_24DBE7FA8;
}

- (id)_stepsWithUI
{
  if (_stepsWithUI_onceToken != -1)
    dispatch_once(&_stepsWithUI_onceToken, &__block_literal_global_0);
  return (id)_stepsWithUI_steps;
}

void __53__DMCEnrollmentFlowController_Sequence___stepsWithUI__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DBE7FC0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_stepsWithUI_steps;
  _stepsWithUI_steps = v0;

}

- (id)_postEnrollmentSteps
{
  if (_postEnrollmentSteps_onceToken != -1)
    dispatch_once(&_postEnrollmentSteps_onceToken, &__block_literal_global_101);
  return (id)_postEnrollmentSteps_steps;
}

void __61__DMCEnrollmentFlowController_Sequence___postEnrollmentSteps__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DBE7FD8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_postEnrollmentSteps_steps;
  _postEnrollmentSteps_steps = v0;

}

- (id)_nameForStep:(unint64_t)a3
{
  if (a3 > 0x28)
    return CFSTR("PromptForUsername");
  else
    return off_24DBE3BE8[a3];
}

- (void)_addNotification
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DMCEnrollmentFlowController presenter](self, "presenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[DMCEnrollmentFlowController presenter](self, "presenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationNameForApplicationWillTerminate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__receivedApplicationWillTerminateNotification_, v4, 0);

    }
  }
  else
  {

  }
}

- (void)_receivedApplicationWillTerminateNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219D1D000, v4, OS_LOG_TYPE_DEFAULT, "DMCEnrollmentFlowController: Settings app will be terminated!", v5, 2u);
  }
  -[DMCEnrollmentFlowController terminateEnrollmentFlow](self, "terminateEnrollmentFlow");
}

- (id)_guardAgainstConflictingAccountsWithUsername:(id)a3 altDSID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v8 = objc_msgSend(v7, "dmc_conflictingAccountsExistWithUsername:error:", v5, &v17);
    v9 = v17;

    if (v9)
      goto LABEL_8;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  if ((v8 & 1) == 0)
  {
    if (!objc_msgSend(v6, "length"))
      goto LABEL_13;
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v8 = objc_msgSend(v10, "dmc_conflictingAccountsExistWithAltDSID:error:", v6, &v16);
    v9 = v16;

  }
LABEL_8:
  if (!v9)
  {
    if (v8)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BE2A578];
      DMCErrorArray();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v13, 15007, v14, 0, *MEMORY[0x24BE2A588], 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v11 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch accounts with error: %{public}@", buf, 0xCu);
  }
LABEL_14:

  return v9;
}

- (void)_updateCredentialForAccount:(id)a3 authTokens:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = objc_msgSend(v9, "dmc_enrollmentMethod");
  if ((unint64_t)(v6 - 1) < 2)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE60CF0]);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    objc_msgSend(v9, "dmc_setBearerToken:", v7);

    goto LABEL_6;
  }
  if (v6 == 5)
  {
    objc_msgSend(MEMORY[0x24BE60DA8], "serializeTokens:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)_appWithBundleIDExists:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v9);
  v5 = v9;
  if (v5)
  {
    v6 = *(NSObject **)DMCLogObjects();
    v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v11 = v3;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_DEFAULT, "Failed to load record for app: %{public}@ with error: %{public}@. This could mean that the app doesn't exist on the device.", buf, 0x16u);
      v7 = 0;
    }
  }
  else
  {
    v7 = v4 != 0;
  }

  return v7;
}

- (id)_appNameWithBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v11);
  v5 = v11;
  if (v5)
  {
    v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v3;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_ERROR, "Failed to load record for app: %{public}@ with error: %{public}@.", buf, 0x16u);
    }
  }
  objc_msgSend(v4, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v3;
  v9 = v7;

  return v9;
}

- (void)_fetchAppAttributesWithITunesItemID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v7 = (void *)getAMSMediaTaskClass_softClass;
  v38 = getAMSMediaTaskClass_softClass;
  v8 = MEMORY[0x24BDAC760];
  if (!getAMSMediaTaskClass_softClass)
  {
    v30 = MEMORY[0x24BDAC760];
    v31 = 3221225472;
    v32 = (uint64_t)__getAMSMediaTaskClass_block_invoke;
    v33 = &unk_24DBE3DE8;
    v34 = &v35;
    __getAMSMediaTaskClass_block_invoke((uint64_t)&v30);
    v7 = (void *)v36[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v35, 8);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2050000000;
  v10 = (void *)getAMSBagClass_softClass;
  v38 = getAMSBagClass_softClass;
  if (!getAMSBagClass_softClass)
  {
    v30 = v8;
    v31 = 3221225472;
    v32 = (uint64_t)__getAMSBagClass_block_invoke;
    v33 = &unk_24DBE3DE8;
    v34 = &v35;
    __getAMSBagClass_block_invoke((uint64_t)&v30);
    v10 = (void *)v36[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v35, 8);
  objc_msgSend(v9, "bagSubProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bagSubProfileVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bagForProfile:profileVersion:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc((Class)v9), "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.apple.devicemanagementclient"), CFSTR("1"), v14);
  v30 = 0;
  v31 = (uint64_t)&v30;
  v32 = 0x2020000000;
  v16 = (id *)getAMSMediaTaskPlatformiPhoneSymbolLoc_ptr;
  v33 = (void *)getAMSMediaTaskPlatformiPhoneSymbolLoc_ptr;
  if (!getAMSMediaTaskPlatformiPhoneSymbolLoc_ptr)
  {
    v17 = (void *)AppleMediaServicesLibrary();
    v16 = (id *)dlsym(v17, "AMSMediaTaskPlatformiPhone");
    *(_QWORD *)(v31 + 24) = v16;
    getAMSMediaTaskPlatformiPhoneSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v30, 8);
  if (!v16)
    -[DMCEnrollmentFlowController(Utilities) _fetchAppAttributesWithITunesItemID:completionHandler:].cold.1();
  v18 = *v16;
  v40 = v18;
  v30 = 0;
  v31 = (uint64_t)&v30;
  v32 = 0x2020000000;
  v19 = (id *)getAMSMediaTaskPlatformiPadSymbolLoc_ptr;
  v33 = (void *)getAMSMediaTaskPlatformiPadSymbolLoc_ptr;
  if (!getAMSMediaTaskPlatformiPadSymbolLoc_ptr)
  {
    v20 = (void *)AppleMediaServicesLibrary();
    v19 = (id *)dlsym(v20, "AMSMediaTaskPlatformiPad");
    *(_QWORD *)(v31 + 24) = v19;
    getAMSMediaTaskPlatformiPadSymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v30, 8);
  if (!v19)
    -[DMCEnrollmentFlowController(Utilities) _fetchAppAttributesWithITunesItemID:completionHandler:].cold.1();
  v41 = *v19;
  v21 = (void *)MEMORY[0x24BDBCE30];
  v22 = v41;
  objc_msgSend(v21, "arrayWithObjects:count:", &v40, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAdditionalPlatforms:", v23);
  objc_msgSend(v5, "stringValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItemIdentifiers:", v25);

  objc_msgSend(v15, "setAdditionalQueryParams:", &unk_24DBE8068);
  objc_msgSend(v15, "perform");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __96__DMCEnrollmentFlowController_Utilities___fetchAppAttributesWithITunesItemID_completionHandler___block_invoke;
  v28[3] = &unk_24DBE3D38;
  v29 = v6;
  v27 = v6;
  objc_msgSend(v26, "resultWithCompletion:", v28);

}

void __96__DMCEnrollmentFlowController_Utilities___fetchAppAttributesWithITunesItemID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_ERROR, "Failed to get app attributes with error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "responseDataItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v10, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, 0);
    }

  }
}

- (BOOL)_isORGOEnrollment:(unint64_t)a3
{
  return a3 == 2 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)_isBYODEnrollment:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

- (BOOL)_validEnrollmentMode:(id)a3 enrollmentMethod:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  char v8;

  v6 = a3;
  switch(-[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType"))
  {
    case 1uLL:
    case 2uLL:
      if (a4 == 3)
        v7 = (_QWORD *)MEMORY[0x24BE60F18];
      else
        v7 = (_QWORD *)MEMORY[0x24BE60F20];
      goto LABEL_9;
    case 3uLL:
      v7 = (_QWORD *)MEMORY[0x24BE60F28];
      goto LABEL_9;
    case 4uLL:
      v7 = (_QWORD *)MEMORY[0x24BE60F10];
      goto LABEL_9;
    case 5uLL:
      v7 = (_QWORD *)MEMORY[0x24BE60F08];
LABEL_9:
      v8 = objc_msgSend(v6, "isEqualToString:", *v7);
      break;
    default:
      v8 = v6 == 0;
      break;
  }

  return v8;
}

- (BOOL)_canSkipMDMEnrollmentWithEnrollmentType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if ((a3 & 0xFFFFFFFFFFFFFFF7) != 1)
    return 0;
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isDeviceSupervised"))
    {
      -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isStoredProfileInstalled");

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_writeDirtyStateToDisk:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MDMDirtyEnrollmentStateFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "DMCWriteToBinaryFile:", v4);
    DMCSetSkipBackupAttributeToItemAtPath();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v7, "removeItemAtPath:error:", v4, &v13);
      v8 = v13;

      if (v8)
      {
        v9 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v15 = v8;
          _os_log_impl(&dword_219D1D000, v9, OS_LOG_TYPE_ERROR, "Failed to remove dirty state file! Error: %{public}@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v8;
        objc_msgSend(v10, "removeItemAtPath:error:", v4, &v12);
        v11 = v12;

      }
    }
  }

}

- (id)_readDirtyStateFromDisk
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  MDMDirtyEnrollmentStateFilePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "DMCDictionaryFromFile:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_extractAndVerifyPropertiesFromProfileData:(id)a3 enrollmentMethod:(unint64_t)a4 isESSO:(BOOL)a5 essoAppITunesStoreID:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  BOOL v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  DMCEnrollmentFlowController *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  unint64_t v71;
  __int16 v72;
  unint64_t v73;
  uint64_t v74;

  v9 = a5;
  v74 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v66 = a6;
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  v65 = v12;
  if ((v14 & 1) == 0)
  {
    v17 = v9;
    v62 = 0;
    v63 = 0;
    v61 = 0;
    v22 = 0;
    v21 = 0;
    v20 = 0;
    v19 = 0;
    v18 = 0;
    v64 = 0;
    goto LABEL_5;
  }
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  objc_msgSend(v15, "detailsFromMDMProfile:error:", v12, &v67);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v67;

  if (v16)
  {
    v17 = v9;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ProfileIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ManagedAppleID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AssignedManagedAppleID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("OrganizationName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("FriendlyName"));
    v62 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("EnrollmentMode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ServerCapabilities"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("RequiredAppID"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    if (-[DMCEnrollmentFlowController _validEnrollmentMode:enrollmentMethod:](self, "_validEnrollmentMode:enrollmentMethod:", v22, a4))
    {
      goto LABEL_9;
    }
    v23 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = v23;
      v25 = -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType");
      *(_DWORD *)buf = 138543874;
      v69 = v22;
      v70 = 2048;
      v71 = v25;
      v72 = 2048;
      v73 = a4;
      _os_log_impl(&dword_219D1D000, v24, OS_LOG_TYPE_ERROR, "Enrollment mode in profile: %{public}@ does not match enrollment type %lu and method %lu", buf, 0x20u);

    }
    if ((objc_msgSend(MEMORY[0x24BE2A7F0], "ignoreEnrollmentMode") & 1) != 0)
    {
LABEL_9:
      if (!v19)
      {
        v34 = a4 == 5 || a4 == 2;
        if (!v34 || v20)
        {
          if (!v66 || !v17 || !v63 || (objc_msgSend(v63, "isEqualToNumber:", v66) & 1) != 0)
          {
            -[DMCEnrollmentFlowController setProfileIdentifier:](self, "setProfileIdentifier:", v18);
            if (a4 == 5 || a4 == 2)
              -[DMCEnrollmentFlowController setManagedAppleID:](self, "setManagedAppleID:", v20);
            -[DMCEnrollmentFlowController setOrganizationName:](self, "setOrganizationName:", v21);
            -[DMCEnrollmentFlowController setFriendlyName:](self, "setFriendlyName:", v62);
            -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_opt_respondsToSelector();

            if ((v52 & 1) != 0)
            {
              -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              -[DMCEnrollmentFlowController setIsProfileLocked:](self, "setIsProfileLocked:", objc_msgSend(v53, "isMDMProfileLocked"));

            }
            v54 = (void *)objc_msgSend(v61, "copy");
            v55 = self;
            v47 = v61;
            -[DMCEnrollmentFlowController setServerCapabilities:](v55, "setServerCapabilities:", v54);

            v19 = 0;
            v44 = 1;
            v45 = v64;
            v46 = (void *)v62;
            goto LABEL_36;
          }
          v56 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219D1D000, v56, OS_LOG_TYPE_ERROR, "Enrollment profile contains a required app ID that is different from the esso app's iTunes store ID. Aborting...", buf, 2u);
          }
          if (a7)
          {
            v57 = (void *)MEMORY[0x24BDD1540];
            v58 = *MEMORY[0x24BE2A578];
            DMCErrorArray();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "DMCErrorWithDomain:code:descriptionArray:errorType:", v58, 15016, v59, *MEMORY[0x24BE2A588], 0);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (v60)
              *a7 = objc_retainAutorelease(v60);

          }
        }
        else
        {
          v35 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219D1D000, v35, OS_LOG_TYPE_ERROR, "3rd party enrollment profile doesn't have the AssignedManagedAppleID key. Aborting...", buf, 2u);
          }
          if (a7)
          {
            v36 = (void *)MEMORY[0x24BDD1540];
            v37 = *MEMORY[0x24BE2A578];
            DMCErrorArray();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "DMCErrorWithDomain:code:descriptionArray:errorType:", v37, 15013, v38, *MEMORY[0x24BE2A588], 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
              *a7 = objc_retainAutorelease(v39);

          }
          v20 = 0;
        }
        v19 = 0;
LABEL_35:
        v44 = 0;
        v45 = v64;
        v47 = v61;
        v46 = (void *)v62;
LABEL_36:
        v48 = v63;
        goto LABEL_37;
      }
      v26 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219D1D000, v26, OS_LOG_TYPE_ERROR, "Enrollment profile must not have the ManagedAppleID key. Aborting...", buf, 2u);
      }
      if (!a7)
        goto LABEL_35;
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BE2A578];
      DMCErrorArray();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *MEMORY[0x24BE2A588];
      v31 = v27;
      v32 = v28;
      v33 = 15018;
    }
    else
    {
      v40 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219D1D000, v40, OS_LOG_TYPE_ERROR, "Enrollment profile has invalid EnrollmentMode key. Aborting...", buf, 2u);
      }
      if (!a7)
        goto LABEL_35;
      v41 = (void *)MEMORY[0x24BDD1540];
      v42 = *MEMORY[0x24BE2A578];
      DMCErrorArray();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *MEMORY[0x24BE2A588];
      v31 = v41;
      v32 = v42;
      v33 = 15017;
    }
    objc_msgSend(v31, "DMCErrorWithDomain:code:descriptionArray:errorType:", v32, v33, v29, v30, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
      *a7 = objc_retainAutorelease(v43);

    goto LABEL_35;
  }
  v44 = 0;
  v48 = 0;
  if (a7)
  {
    v45 = v64;
    if (v64)
    {
      v45 = objc_retainAutorelease(v64);
      v48 = 0;
      v47 = 0;
      v22 = 0;
      v50 = a7;
      v46 = 0;
      v21 = 0;
      v20 = 0;
      v19 = 0;
      v18 = 0;
      v44 = 0;
      *v50 = v45;
    }
    else
    {
      v47 = 0;
      v22 = 0;
      v46 = 0;
      v21 = 0;
      v20 = 0;
      v19 = 0;
      v18 = 0;
    }
  }
  else
  {
    v47 = 0;
    v22 = 0;
    v46 = 0;
    v21 = 0;
    v20 = 0;
    v19 = 0;
    v18 = 0;
    v45 = v64;
  }
LABEL_37:

  return v44;
}

- (id)_convertErrorToHumanReadableError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  char v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowController _trustedErrors](self, "_trustedErrors", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v4, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "containsObject:", v12) & 1) != 0)
    {

LABEL_6:
      objc_msgSend(v4, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    objc_msgSend(v4, "domain");
    v24 = v5;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v14, "containsObject:", &unk_24DBE7508);

    v5 = v24;
    if ((v23 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  -[DMCEnrollmentFlowController _translatedErrorStringForError:](self, "_translatedErrorStringForError:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v22 = 0;
    DMCUnformattedErrorArray();
    v19 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v19;
  }

  v17 = v5;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD1540], "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", *MEMORY[0x24BE2A578], 15022, v17, v4, *MEMORY[0x24BE2A588], v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_trustedErrors
{
  if (_trustedErrors_onceToken != -1)
    dispatch_once(&_trustedErrors_onceToken, &__block_literal_global_1);
  return (id)_trustedErrors_dict;
}

void __56__DMCEnrollmentFlowController_Utilities___trustedErrors__block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  id v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v0 = (id *)getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr;
  v12 = getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr;
  if (!getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getAKAppleIDAuthenticationErrorDomainSymbolLoc_block_invoke;
    v8[3] = &unk_24DBE3DE8;
    v8[4] = &v9;
    __getAKAppleIDAuthenticationErrorDomainSymbolLoc_block_invoke((uint64_t)v8);
    v0 = (id *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v0)
    -[DMCEnrollmentFlowController(Utilities) _fetchAppAttributesWithITunesItemID:completionHandler:].cold.1();
  v13[0] = *v0;
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = v13[0];
  objc_msgSend(v1, "setWithArray:", &unk_24DBE7FF0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *(id *)MEMORY[0x24BE2A578];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DBE8008);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = *(id *)MEMORY[0x24BE2A600];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DBE8020);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_trustedErrors_dict;
  _trustedErrors_dict = v6;

}

- (id)_errorTranslation
{
  if (_errorTranslation_onceToken != -1)
    dispatch_once(&_errorTranslation_onceToken, &__block_literal_global_66);
  return (id)_errorTranslation_dict;
}

void __59__DMCEnrollmentFlowController_Utilities___errorTranslation__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[3];
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE2A578];
  v3[0] = &unk_24DBE7670;
  v3[1] = &unk_24DBE7688;
  v4[0] = CFSTR("DMC_SERVER_RESPONSE_USER_UNAUTHORIZED");
  v4[1] = CFSTR("DEVICE_MISSING_APPLEACCOUNT_NEEDS_ERASE");
  v3[2] = &unk_24DBE76A0;
  v4[2] = CFSTR("DMC_SERVER_RESPONSE_UNEXPECTED_403_UI");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_errorTranslation_dict;
  _errorTranslation_dict = v1;

}

- (id)_translatedErrorStringForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[DMCEnrollmentFlowController _errorTranslation](self, "_errorTranslation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_createGeneralError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15022, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createUnsupportedFeatureError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15008, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createEnrollmentNotAllowedDuringSDPError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15035, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createMissingRMAccountError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15005, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createMissingAppleAccountForUserEnrollmentError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15014, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createMissingEnterpriseApplicationError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15028, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createEnterpriseApplicationExistsErrorWithAppName:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 15030, v5, *MEMORY[0x24BE2A588], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_createEnterpriseApplicationMissingEntitlementsError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15029, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createMissingEnterpriseApplicationBundleIDError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15028, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createGeneralSignInError
{
  void *v2;
  void *v3;

  _os_feature_enabled_impl();
  DMCErrorArray();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A578], 15032, v2, *MEMORY[0x24BE2A588], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_createInvalidCloudConfigError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15034, v4, 0, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_blockAppInstallsIfNecessary
{
  if (-[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType") == 4
    || -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType") == 5)
  {
    -[DMCEnrollmentFlowController _blockAppInstalls](self, "_blockAppInstalls");
  }
}

- (void)_blockAppInstalls
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219D1D000, v3, OS_LOG_TYPE_DEFAULT, "block app installs, enrollment flow controller, blocking begin", buf, 2u);
  }
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "blockAppInstallsWithCompletion:", &__block_literal_global_105);

  }
  else
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_219D1D000, v7, OS_LOG_TYPE_DEFAULT, "block app installs, enrollment flow controller, app blocking not supported, ignoring", v8, 2u);
    }
  }
}

void __59__DMCEnrollmentFlowController_Utilities___blockAppInstalls__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend(v2, "DMCVerboseDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_219D1D000, v4, OS_LOG_TYPE_DEFAULT, "block app installs, enrollment flow controller, blocking end, error: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)_unblockAppInstallsIfNecessaryWithCaller:(id)a3
{
  id v4;

  v4 = a3;
  if (-[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType") == 4
    || -[DMCEnrollmentFlowController enrollmentType](self, "enrollmentType") == 5)
  {
    -[DMCEnrollmentFlowController _unblockAppInstallsWithCaller:](self, "_unblockAppInstallsWithCaller:", v4);
  }

}

- (void)_unblockAppInstallsWithCaller:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v4;
    _os_log_impl(&dword_219D1D000, v5, OS_LOG_TYPE_DEFAULT, "block app installs, unblocking begin (%{public}@)", buf, 0xCu);
  }
  -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[DMCEnrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __72__DMCEnrollmentFlowController_Utilities___unblockAppInstallsWithCaller___block_invoke;
    v10[3] = &unk_24DBE3668;
    v11 = v4;
    objc_msgSend(v8, "unblockAppInstallsWithCompletion:", v10);

  }
  else
  {
    v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v9, OS_LOG_TYPE_DEFAULT, "block app installs, enrollment flow controller, app unblocking not supported, ignoring", buf, 2u);
    }
  }

}

void __72__DMCEnrollmentFlowController_Utilities___unblockAppInstallsWithCaller___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "DMCVerboseDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_DEFAULT, "block app installs, unblocking end (%{public}@), error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)_fetchBundleIDsWithiTunesItemID:(id)a3 debuggingAppIDs:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, void *, _QWORD);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (objc_msgSend(MEMORY[0x24BE2A7D8], "ESSOTestModeEnabled"))
  {
    v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_DEFAULT, "ESSO Test mode is on.", buf, 2u);
    }
    -[DMCEnrollmentFlowController _bundleIDsFromAppIDs:](self, "_bundleIDsFromAppIDs:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12, 0);
  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __108__DMCEnrollmentFlowController_Utilities___fetchBundleIDsWithiTunesItemID_debuggingAppIDs_completionHandler___block_invoke;
    v13[3] = &unk_24DBE3DC0;
    v15 = v10;
    v13[4] = self;
    v14 = v8;
    -[DMCEnrollmentFlowController _fetchAppAttributesWithITunesItemID:completionHandler:](self, "_fetchAppAttributesWithITunesItemID:completionHandler:", v14, v13);

    v12 = v15;
  }

}

void __108__DMCEnrollmentFlowController_Utilities___fetchBundleIDsWithiTunesItemID_debuggingAppIDs_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attributes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ios"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v24[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setEssoAppITunesStoreID:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v14 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attributes"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ios"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_219D1D000, v15, OS_LOG_TYPE_ERROR, "App attributes dictionary does not contain bundleID: %{public}@", (uint8_t *)&v20, 0xCu);

      }
      v13 = 0;
    }
    v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = 138543618;
      v21 = v8;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_219D1D000, v19, OS_LOG_TYPE_DEBUG, "Found application with name: '%{public}@', bundle ID: %{public}@", (uint8_t *)&v20, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (id)_bundleIDsFromAppIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("."), (_QWORD)v16);
          objc_msgSend(v10, "substringFromIndex:", v11 + v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v4, "addObject:", v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v14 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldDoReturnToService
{
  void *v2;
  char v3;

  -[DMCEnrollmentFlowController obliterationShelter](self, "obliterationShelter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasConfigFile");

  return v3;
}

@end
