@implementation SetupController

+ (void)initialize
{
  BFFIsiPad(a1, a2);
}

- (SetupController)init
{
  BYConcreteEnvironment *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  BuddyEnrollmentCoordinator *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BuddyEnrollmentCoordinator *v17;
  BuddyMiscState *v18;
  BuddySystemTimeUpdateManager *v19;
  id v20;
  BuddyNetworkProvider *v21;
  BuddyButtonMonitor *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  objc_class *v28;
  NSObject *v29;
  os_log_type_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  id v34;
  BuddySetupMethod *v35;
  BuddyExistingSettings *v36;
  BuddyDisplayZoomExecutor *v37;
  BuddyPendingRestoreState *v38;
  id v39;
  id v40;
  BuddyPendingRestoreState *v41;
  BuddyBetaEnrollmentStateManager *v42;
  id v43;
  BYSoftwareUpdateCache *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  BuddyActivationRecord *v49;
  BuddyCombinedTermsProvider *v50;
  BuddyEmergencyExecutor *v51;
  BuddyActivationState *v52;
  id v53;
  id v54;
  _TtC5Setup22AppearanceModeProvider *v55;
  id v56;
  _TtC5Setup22AppearanceModeProvider *v57;
  _TtC5Setup28SetupUserDispositionProvider *v58;
  id v59;
  BuddyFlowItemDispositionProvider *v60;
  id v61;
  id v62;
  BuddyFlowItemDispositionProvider *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  id v69;
  _TtC5Setup19LockdownModeManager *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  BuddyChildSetupPresenter *v75;
  _TtC5Setup19IntelligenceManager *v76;
  id v77;
  _TtC5Setup19IntelligenceManager *v78;
  id v79;
  id v80;
  id v81;
  unsigned __int8 v82;
  NSObject *v83;
  os_log_type_t v84;
  id v85;
  id v86;
  NSObject *v87;
  os_log_type_t v88;
  id v89;
  id v90;
  BuddyInactivityTimer *v91;
  void *v92;
  NSNotificationCenter *v93;
  uint64_t v94;
  NSOperationQueue *v95;
  id v96;
  void *v97;
  NSObject *v98;
  SetupController *v99;
  id *v101;
  id *v102;
  id *v103;
  id *v104;
  void **block;
  int v106;
  int v107;
  void (*v108)(uint64_t);
  void *v109;
  id v110;
  void **v111;
  int v112;
  int v113;
  void (*v114)(id *, void *);
  void *v115;
  id v116;
  uint8_t v117[7];
  os_log_type_t v118;
  os_log_t v119;
  uint8_t v120[15];
  os_log_type_t v121;
  os_log_t v122;
  void **v123;
  int v124;
  int v125;
  void (*v126)(id *);
  void *v127;
  id v128;
  uint8_t v129[7];
  os_log_type_t v130;
  os_log_t v131;
  uint8_t v132[15];
  os_log_type_t v133;
  os_log_t v134;
  id v135;
  os_log_type_t v136;
  os_log_t oslog;
  id v138;
  void **v139;
  int v140;
  int v141;
  void (*v142)(id *);
  void *v143;
  id v144;
  void **v145;
  int v146;
  int v147;
  void (*v148)(uint64_t, char);
  void *v149;
  id v150;
  void **v151;
  int v152;
  int v153;
  void (*v154)(id *);
  void *v155;
  id v156;
  void **v157;
  int v158;
  int v159;
  void (*v160)(id *);
  void *v161;
  id v162;
  void **v163;
  int v164;
  int v165;
  uint64_t (*v166)(id *);
  void *v167;
  id v168;
  void **v169;
  int v170;
  int v171;
  void (*v172)(id *);
  void *v173;
  id v174;
  void **v175;
  int v176;
  int v177;
  void (*v178)(id *);
  void *v179;
  id v180;
  void **v181;
  int v182;
  int v183;
  void (*v184)(id *);
  void *v185;
  id v186;
  id from;
  objc_super v188;
  SEL v189;
  id location;
  uint8_t buf[16];

  v189 = a2;
  location = 0;
  v188.receiver = self;
  v188.super_class = (Class)SetupController;
  location = -[SetupController init](&v188, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc_init(BYConcreteEnvironment);
    v3 = (void *)*((_QWORD *)location + 28);
    *((_QWORD *)location + 28) = v2;

    v4 = objc_alloc_init((Class)BuddyFeatureFlags);
    objc_msgSend(*((id *)location + 28), "setFeatureFlags:", v4);

    v5 = +[BYDevice currentDevice](BYDevice, "currentDevice");
    objc_msgSend(*((id *)location + 28), "setDeviceProvider:", v5);

    v6 = objc_alloc((Class)BYPasscodeCacheManager);
    v7 = objc_msgSend(location, "environment");
    v8 = objc_msgSend(v7, "featureFlags");
    v9 = objc_msgSend(v6, "initWithFeatureFlags:", v8);
    objc_msgSend(*((id *)location + 28), "setPasscodeCacheManager:", v9);

    v10 = +[BYPreferencesController buddyPreferences](BYPreferencesController, "buddyPreferences");
    objc_msgSend(*((id *)location + 28), "setBuddyPreferences:", v10);

    v11 = +[BYPreferencesController buddyPreferencesExcludedFromBackup](BYPreferencesController, "buddyPreferencesExcludedFromBackup");
    objc_msgSend(*((id *)location + 28), "setBuddyPreferencesExcludedFromBackup:", v11);

    v12 = [BuddyEnrollmentCoordinator alloc];
    v13 = objc_msgSend(*((id *)location + 28), "passcodeCacheManager");
    v14 = objc_msgSend(*((id *)location + 28), "buddyPreferences");
    v15 = objc_msgSend(location, "environment");
    v16 = objc_msgSend(v15, "featureFlags");
    v17 = -[BuddyEnrollmentCoordinator initWithPasscodeCacheManager:buddyPreferences:featureFlags:](v12, "initWithPasscodeCacheManager:buddyPreferences:featureFlags:", v13, v14, v16);
    objc_msgSend(*((id *)location + 28), "setEnrollmentCoordinator:", v17);

    v18 = objc_alloc_init(BuddyMiscState);
    objc_msgSend(*((id *)location + 28), "setMiscState:", v18);

    v19 = objc_alloc_init(BuddySystemTimeUpdateManager);
    objc_msgSend(*((id *)location + 28), "setSystemTimeUpdateManager:", v19);

    objc_initWeak(&from, location);
    v181 = _NSConcreteStackBlock;
    v182 = -1073741824;
    v183 = 0;
    v184 = sub_100038A0C;
    v185 = &unk_1002806B8;
    objc_copyWeak(&v186, &from);
    objc_msgSend(*((id *)location + 28), "setMenuButtonPressedBlock:", &v181);
    v175 = _NSConcreteStackBlock;
    v176 = -1073741824;
    v177 = 0;
    v178 = sub_100038A4C;
    v179 = &unk_1002806B8;
    objc_copyWeak(&v180, &from);
    objc_msgSend(*((id *)location + 28), "setShowModalWiFiSettingsBlock:", &v175);
    v169 = _NSConcreteStackBlock;
    v170 = -1073741824;
    v171 = 0;
    v172 = sub_100038A8C;
    v173 = &unk_1002806B8;
    objc_copyWeak(&v174, &from);
    objc_msgSend(*((id *)location + 28), "setWriteGreenInformedDefaultPlistIfNecessaryBlock:", &v169);
    v163 = _NSConcreteStackBlock;
    v164 = -1073741824;
    v165 = 0;
    v166 = sub_100038ACC;
    v167 = &unk_1002807A8;
    objc_copyWeak(&v168, &from);
    objc_msgSend(*((id *)location + 28), "setDoesRestartFlowCauseEraseBlock:", &v163);
    v157 = _NSConcreteStackBlock;
    v158 = -1073741824;
    v159 = 0;
    v160 = sub_100038B1C;
    v161 = &unk_1002806B8;
    objc_copyWeak(&v162, &from);
    objc_msgSend(*((id *)location + 28), "setPrepareForCloudRestoreRebootBlock:", &v157);
    v151 = _NSConcreteStackBlock;
    v152 = -1073741824;
    v153 = 0;
    v154 = sub_100038B5C;
    v155 = &unk_1002806B8;
    v104 = &v156;
    objc_copyWeak(&v156, &from);
    objc_msgSend(*((id *)location + 28), "setExitBuddyForDemoSetUpBlock:", &v151);
    v145 = _NSConcreteStackBlock;
    v146 = -1073741824;
    v147 = 0;
    v148 = sub_100038B9C;
    v149 = &unk_1002807D0;
    v103 = &v150;
    objc_copyWeak(&v150, &from);
    objc_msgSend(*((id *)location + 28), "setPrepareForDeviceMigrationBlock:", &v145);
    v139 = _NSConcreteStackBlock;
    v140 = -1073741824;
    v141 = 0;
    v142 = sub_100038BE8;
    v143 = &unk_1002806B8;
    v102 = &v144;
    objc_copyWeak(&v144, &from);
    objc_msgSend(*((id *)location + 28), "setStartDeviceMigrationBlock:", &v139);
    v20 = objc_alloc_init((Class)BYSeedProgramManager);
    objc_msgSend(*((id *)location + 28), "setSeedProgramManager:", v20);

    v21 = objc_alloc_init(BuddyNetworkProvider);
    objc_msgSend(*((id *)location + 28), "setNetworkProvider:", v21);

    v22 = objc_alloc_init(BuddyButtonMonitor);
    objc_msgSend(*((id *)location + 28), "setButtonMonitor:", v22);

    v23 = objc_msgSend(*((id *)location + 28), "buddyPreferences");
    v138 = objc_msgSend(v23, "objectForKey:", BYChronicleKey);

    v24 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v138, v24) & 1) != 0)
    {
      v25 = objc_msgSend(objc_alloc((Class)BYChronicle), "initWithDictionary:", v138);
      objc_msgSend(*((id *)location + 28), "setChronicle:", v25);

    }
    else if (v138)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility();
      v136 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class(v138);
        v135 = NSStringFromClass(v28);
        sub_100038C28((uint64_t)buf, (uint64_t)v135);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v136, "Unable to read chronicle data; found %@, expected NSDictionary!",
          buf,
          0xCu);

        objc_storeStrong(&v135, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v134 = (os_log_t)(id)_BYLoggingFacility();
      v133 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v134;
        v30 = v133;
        sub_100038C3C(v132);
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Creating new chronicle as a fallback...", v132, 2u);
      }
      objc_storeStrong((id *)&v134, 0);
      v31 = objc_alloc_init((Class)BYChronicle);
      objc_msgSend(*((id *)location + 28), "setChronicle:", v31);

    }
    else
    {
      v131 = (os_log_t)(id)_BYLoggingFacility();
      v130 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
      {
        v32 = v131;
        v33 = v130;
        sub_100038C3C(v129);
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Creating new chronicle...", v129, 2u);
      }
      objc_storeStrong((id *)&v131, 0);
      v34 = objc_alloc_init((Class)BYChronicle);
      objc_msgSend(*((id *)location + 28), "setChronicle:", v34);

    }
    if ((BYSetupAssistantHasCompletedInitialRun(v26, v27) & 1) == 0)
    {
      v35 = objc_alloc_init(BuddySetupMethod);
      objc_msgSend(*((id *)location + 28), "setSetupMethod:", v35);

    }
    v36 = objc_alloc_init(BuddyExistingSettings);
    objc_msgSend(*((id *)location + 28), "setExistingSettings:", v36);

    v37 = objc_alloc_init(BuddyDisplayZoomExecutor);
    objc_msgSend(*((id *)location + 28), "setDisplayZoomExecutor:", v37);

    v38 = [BuddyPendingRestoreState alloc];
    v39 = objc_msgSend(*((id *)location + 28), "existingSettings");
    v40 = objc_msgSend(*((id *)location + 28), "setupMethod");
    v41 = -[BuddyPendingRestoreState initWithExistingSettings:setupMethod:](v38, "initWithExistingSettings:setupMethod:", v39, v40);
    objc_msgSend(*((id *)location + 28), "setPendingRestoreState:", v41);

    v123 = _NSConcreteStackBlock;
    v124 = -1073741824;
    v125 = 0;
    v126 = sub_100038C44;
    v127 = &unk_1002806B8;
    v101 = &v128;
    objc_copyWeak(&v128, &from);
    objc_msgSend(*((id *)location + 28), "setWillPerformSoftwareUpdateBlock:", &v123);
    v42 = objc_alloc_init(BuddyBetaEnrollmentStateManager);
    objc_msgSend(*((id *)location + 28), "setBetaEnrollmentStateManager:", v42);

    v43 = objc_alloc_init((Class)BYCapabilities);
    objc_msgSend(*((id *)location + 28), "setCapabilities:", v43);

    v44 = objc_alloc_init(BYSoftwareUpdateCache);
    objc_msgSend(*((id *)location + 28), "setSoftwareUpdateCache:", v44);

    v45 = objc_alloc_init((Class)BFFSettingsManager);
    objc_msgSend(*((id *)location + 28), "setSettingsManager:", v45);

    v46 = objc_alloc_init((Class)BYRunState);
    objc_msgSend(*((id *)location + 28), "setRunState:", v46);

    v47 = objc_alloc_init((Class)BYAnalyticsManager);
    objc_msgSend(*((id *)location + 28), "setAnalyticsManager:", v47);

    v48 = objc_alloc_init((Class)MCProfileConnection);
    objc_msgSend(*((id *)location + 28), "setManagedConfiguration:", v48);

    v49 = objc_alloc_init(BuddyActivationRecord);
    objc_msgSend(*((id *)location + 28), "setActivationRecord:", v49);

    v50 = objc_alloc_init(BuddyCombinedTermsProvider);
    objc_msgSend(*((id *)location + 28), "setCombinedTermsProvider:", v50);

    v51 = objc_alloc_init(BuddyEmergencyExecutor);
    objc_msgSend(*((id *)location + 28), "setEmergencyExecutor:", v51);

    v52 = objc_alloc_init(BuddyActivationState);
    objc_msgSend(*((id *)location + 28), "setActivationState:", v52);

    v53 = objc_alloc_init((Class)BYFlowSkipController);
    objc_msgSend(*((id *)location + 28), "setFlowSkipController:", v53);

    v54 = objc_alloc_init((Class)sub_100038C84());
    objc_msgSend(*((id *)location + 28), "setMdmReturnToServiceController:", v54);

    v55 = [_TtC5Setup22AppearanceModeProvider alloc];
    v56 = objc_msgSend(*((id *)location + 28), "displayZoomExecutor");
    v57 = -[AppearanceModeProvider initWithDisplayZoomExecutor:](v55, "initWithDisplayZoomExecutor:", v56);
    objc_msgSend(*((id *)location + 28), "setAppearanceModeProvider:", v57);

    v58 = objc_alloc_init(_TtC5Setup28SetupUserDispositionProvider);
    objc_msgSend(*((id *)location + 28), "setUserDispositionProvider:", v58);

    v59 = +[BYDeviceConfiguration currentConfiguration](BYDeviceConfiguration, "currentConfiguration");
    objc_msgSend(*((id *)location + 28), "setDeviceConfiguration:", v59);

    v60 = [BuddyFlowItemDispositionProvider alloc];
    v61 = objc_msgSend(*((id *)location + 28), "setupMethod");
    v62 = objc_msgSend(*((id *)location + 28), "runState");
    v63 = -[BuddyFlowItemDispositionProvider initWithSetupMethod:runState:](v60, "initWithSetupMethod:runState:", v61, v62);
    objc_msgSend(*((id *)location + 28), "setFlowItemDispositionProvider:", v63);

    v64 = objc_alloc((Class)BYPaneFeatureAnalyticsManager);
    v65 = objc_msgSend(*((id *)location + 28), "analyticsManager");
    v66 = objc_msgSend(*((id *)location + 28), "runState");
    v67 = BYPaneFeatureAnalyticsHostSetupAssistant;
    v68 = objc_msgSend(*((id *)location + 28), "flowItemDispositionProvider");
    v69 = objc_msgSend(v64, "initWithAnalyticsManager:runState:host:flowItemDispositionProvider:", v65, v66, v67, v68);
    objc_msgSend(*((id *)location + 28), "setPaneFeatureAnalyticsManager:", v69);

    v70 = objc_alloc_init(_TtC5Setup19LockdownModeManager);
    objc_msgSend(*((id *)location + 28), "setLockdownModeProvider:", v70);

    v71 = objc_alloc((Class)BYAnalyticsEventAppearance);
    v72 = objc_msgSend(*((id *)location + 28), "analyticsManager");
    v73 = objc_msgSend(*((id *)location + 28), "buddyPreferencesExcludedFromBackup");
    v74 = objc_msgSend(v71, "initWithAnalyticsManager:buddyPreferencesExcludedFromBackup:", v72, v73);
    objc_msgSend(*((id *)location + 28), "setAnalyticsEventAppearance:", v74);

    v75 = objc_alloc_init(BuddyChildSetupPresenter);
    objc_msgSend(*((id *)location + 28), "setChildSetupPresenter:", v75);

    v76 = [_TtC5Setup19IntelligenceManager alloc];
    v77 = objc_msgSend(*((id *)location + 28), "featureFlags");
    v78 = -[IntelligenceManager initWithFeatureFlags:](v76, "initWithFeatureFlags:", v77);
    objc_msgSend(*((id *)location + 28), "setIntelligenceProvider:", v78);

    v79 = objc_msgSend(*((id *)location + 28), "runState");
    LOBYTE(v77) = objc_msgSend(v79, "hasCompletedInitialRun") ^ 1;

    if ((v77 & 1) != 0)
    {
      v80 = +[BYSetupUserDisposition current](BYSetupUserDisposition, "current", &v128, &v144, &v150, &v156);
      v81 = objc_msgSend(v80, "isChild");
      v82 = objc_msgSend(v81, "BOOLValue");

      if ((v82 & 1) != 0)
      {
        v122 = (os_log_t)(id)_BYLoggingFacility();
        v121 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
        {
          v83 = v122;
          v84 = v121;
          sub_100038C3C(v120);
          _os_log_impl((void *)&_mh_execute_header, v83, v84, "Assuming default intent as child...", v120, 2u);
        }
        objc_storeStrong((id *)&v122, 0);
        v85 = objc_msgSend(*((id *)location + 28), "setupMethod");
        objc_msgSend(v85, "setIntent:", 2);

        v86 = objc_msgSend(*((id *)location + 28), "flowItemDispositionProvider");
        objc_msgSend(v86, "setPreferredDispositions:", 16);

      }
      else if ((objc_msgSend(location, "shouldBeginRestore") & 1) != 0
             || (objc_msgSend(location, "shouldBeginMigration") & 1) != 0)
      {
        v119 = (os_log_t)(id)_BYLoggingFacility();
        v118 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
        {
          v87 = v119;
          v88 = v118;
          sub_100038C3C(v117);
          _os_log_impl((void *)&_mh_execute_header, v87, v88, "Assuming default intent as self...", v117, 2u);
        }
        objc_storeStrong((id *)&v119, 0);
        v89 = objc_msgSend(*((id *)location + 28), "setupMethod");
        objc_msgSend(v89, "setIntent:", 1);

        v90 = objc_msgSend(*((id *)location + 28), "flowItemDispositionProvider");
        objc_msgSend(v90, "setPreferredDispositions:", 4);

      }
    }
    v91 = objc_alloc_init(BuddyInactivityTimer);
    v92 = (void *)*((_QWORD *)location + 39);
    *((_QWORD *)location + 39) = v91;

    v93 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    v94 = MCCloudConfigurationDidChangeNotification;
    v95 = +[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue");
    v111 = _NSConcreteStackBlock;
    v112 = -1073741824;
    v113 = 0;
    v114 = sub_100038D70;
    v115 = &unk_1002807F8;
    v116 = location;
    v96 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](v93, "addObserverForName:object:queue:usingBlock:", v94, 0, v95, &v111);
    v97 = (void *)*((_QWORD *)location + 22);
    *((_QWORD *)location + 22) = v96;

    v98 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    v106 = -1073741824;
    v107 = 0;
    v108 = sub_100038DC4;
    v109 = &unk_100280730;
    v110 = location;
    dispatch_async(v98, &block);

    objc_storeStrong(&v110, 0);
    objc_storeStrong(&v116, 0);
    objc_destroyWeak(v101);
    objc_storeStrong(&v138, 0);
    objc_destroyWeak(v102);
    objc_destroyWeak(v103);
    objc_destroyWeak(v104);
    objc_destroyWeak(&v162);
    objc_destroyWeak(&v168);
    objc_destroyWeak(&v174);
    objc_destroyWeak(&v180);
    objc_destroyWeak(&v186);
    objc_destroyWeak(&from);
  }
  v99 = (SetupController *)location;
  objc_storeStrong(&location, 0);
  return v99;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  SetupController *v5;

  v5 = self;
  v4 = a2;
  -[BuddyLanguageChangeObserver stopObservingLanguageChanges](self->_languageObserver, "stopObservingLanguageChanges");
  if (v5->_cloudConfigurationChangeNotificationObserver)
  {
    v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5->_cloudConfigurationChangeNotificationObserver);

  }
  if (v5->_sbAlertItemsSuppressionAssertion)
  {
    CFRelease(v5->_sbAlertItemsSuppressionAssertion);
    v5->_sbAlertItemsSuppressionAssertion = 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)SetupController;
  -[SetupController dealloc](&v3, "dealloc");
}

- (BuddyMiscState)miscState
{
  BYEnvironment *v2;
  id v3;

  v2 = -[SetupController environment](self, "environment", a2, self);
  v3 = -[BYEnvironment miscState](v2, "miscState");

  return (BuddyMiscState *)v3;
}

- (BOOL)isFirstRunWithoutCloudConfiguration
{
  char HasCompletedInitialRun;
  char v3;
  char v5;
  id v6;
  BOOL v7;

  HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun(self, a2);
  v5 = 0;
  v3 = 0;
  if ((HasCompletedInitialRun & 1) == 0)
  {
    v6 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
    v5 = 1;
    v3 = objc_msgSend(v6, "hasCloudConfiguration") ^ 1;
  }
  v7 = v3 & 1;
  if ((v5 & 1) != 0)

  return v7;
}

- (id)navigationController
{
  return self->_nav;
}

- (BOOL)_hasLocaleAndLanguage
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  int v6;
  id location[3];
  char v8;
  id v9;
  id v10;

  location[2] = self;
  location[1] = (id)a2;
  v10 = (id)CFPreferencesCopyAppValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication);
  location[0] = v10;
  if (location[0]
    && (v2 = objc_opt_class(NSString), (objc_opt_isKindOfClass(location[0], v2) & 1) != 0)
    && objc_msgSend(location[0], "length"))
  {
    v9 = (id)CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), kCFPreferencesAnyApplication);
    v5 = v9;
    if (v5
      && (v3 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v5, v3) & 1) != 0)
      && objc_msgSend(v5, "count"))
    {
      v8 = 1;
      v6 = 1;
    }
    else
    {
      v8 = 0;
      v6 = 1;
    }
    objc_storeStrong(&v5, 0);
  }
  else
  {
    v8 = 0;
    v6 = 1;
  }
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (BOOL)_isBackInBuddyForActivationOnly
{
  id v2;
  id v3;
  uint64_t v4;
  char HasCompletedInitialRun;

  v2 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration", a2, self);
  v3 = objc_msgSend(v2, "isActivated");
  HasCompletedInitialRun = 0;
  if ((v3 & 1) == 0)
    HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun(v3, v4);

  return HasCompletedInitialRun & 1;
}

- (BOOL)_isBackInBuddyAfterRestoreFromBackup:(BOOL)a3
{
  unsigned __int8 v3;
  unsigned __int8 v4;

  v3 = 0;
  if (a3)
  {
    v4 = -[SetupController _restoreFromBackupJustFinished](self, "_restoreFromBackupJustFinished");
    v3 = 0;
    if ((v4 & 1) != 0)
      v3 = -[SetupController _hasLocaleAndLanguage](self, "_hasLocaleAndLanguage");
  }
  return v3 & 1;
}

- (void)_preflightDispositionValidationWithControllerClass:(Class)a3
{
  BYEnvironment *v3;
  id v4;
  id v5;
  BYEnvironment *v6;
  id v7;
  BYEnvironment *v8;
  id v9;
  id location;
  os_log_type_t v11;
  os_log_t oslog;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  Class aClass;
  SEL v17;
  SetupController *v18;
  uint8_t buf[24];

  v18 = self;
  v17 = a2;
  aClass = a3;
  if ((os_variant_has_internal_ui("com.apple.purplebuddy", a2) & 1) == 0)
  {
    v3 = -[SetupController environment](v18, "environment");
    v4 = -[BYEnvironment flowItemDispositionProvider](v3, "flowItemDispositionProvider");
    v5 = objc_msgSend(v4, "dispositions");

    v15 = (unint64_t)v5;
    if ((v5 & 2) == 2
      && (-[objc_class conformsToProtocol:](aClass, "conformsToProtocol:", &OBJC_PROTOCOL___BFFFlowItem) & 1) != 0)
    {
      v14 = (unint64_t)-[objc_class applicableDispositions](aClass, "applicableDispositions");
      v13 = (v14 & v15) != 0;
      if ((v14 & v15) == 0)
      {
        oslog = (os_log_t)(id)_BYLoggingFacility();
        v11 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          location = NSStringFromClass(aClass);
          sub_100039500((uint64_t)buf, (uint64_t)location);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, v11, "Fixing unexpected disposition for initialFlowItemClass %{public}@", buf, 0xCu);

          objc_storeStrong(&location, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        v6 = -[SetupController environment](v18, "environment");
        v7 = -[BYEnvironment setupMethod](v6, "setupMethod");
        objc_msgSend(v7, "setIntent:", 1);

        v8 = -[SetupController environment](v18, "environment");
        v9 = -[BYEnvironment flowItemDispositionProvider](v8, "flowItemDispositionProvider");
        objc_msgSend(v9, "setPreferredDispositions:", 4);

      }
    }
  }
}

- (void)_createNavigationController
{
  id v2;
  id v3;
  BFFNavigationController *v4;
  BFFNavigationController *nav;
  BYEnvironment *v6;
  id v7;
  _BOOL8 v8;
  const __CFString *v9;
  const __CFString *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BuddyFlowDiverter *v15;
  BuddyFlowDiverter *v16;
  uint64_t v17;
  BOOL v18;
  BuddyTestFundamentalFlow *v19;
  BuddyFundamentalFlow *v20;
  SetupController *v21;
  BuddyFundamentalFlow *v22;
  BuddyFlowProducer *v23;
  BuddyNavigationFlowController *v24;
  SetupController *v25;
  BFFNavigationController *v26;
  BuddyFlowDiverter *v27;
  BYEnvironment *v28;
  BuddyNavigationFlowController *v29;
  SetupController *v30;
  BuddyNavigationFlowController *v31;
  SetupController *v32;
  BuddyNavigationFlowController *v33;
  BYEnvironment *v34;
  id v35;
  BuddyNavigationFlowController *v36;
  BuddyFlowProducer *v37;
  BuddyNavigationFlowController *v38;
  BYEnvironment *v39;
  id v40;
  BuddyNavigationFlowController *v41;
  BYEnvironment *v42;
  id v43;
  BuddyNavigationFlowController *v44;
  id v45;
  BOOL v46;
  char v47;
  id v48;
  BYEnvironment *v49;
  id v50;
  unsigned __int8 v51;
  BuddyNavigationFlowController *v52;
  id v53;
  unsigned __int8 v54;
  id v55;
  id v56;
  const __CFString *v57;
  const __CFString *v58;
  uint64_t v59;
  NSNumber *v60;
  id v61;
  unsigned __int8 v62;
  uint64_t v63;
  const __CFString *v64;
  BYEnvironment *v65;
  id v66;
  id v67;
  BuddyBackgroundViewController *v68;
  BFFWindow *window;
  UIViewController *v70;
  double v71;
  double v72;
  BFFNavigationController *v73;
  UIViewController *v74;
  UIApplication *v75;
  NSSet *v76;
  uint64_t v77;
  id v78;
  UIViewController *v79;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  void **v85;
  int v86;
  int v87;
  void (*v88)(uint64_t, char);
  void *v89;
  SetupController *v90;
  os_log_type_t v91;
  os_log_t v92;
  char v93;
  os_log_type_t v94;
  os_log_t v95;
  os_log_type_t v96;
  os_log_t v97;
  char v98;
  id v99;
  char v100;
  void **v101;
  int v102;
  int v103;
  id (*v104)(uint64_t);
  void *v105;
  SetupController *v106;
  id v107;
  char v108;
  BOOL v109;
  char v110;
  os_log_type_t v111;
  os_log_t oslog;
  BOOL v113;
  id v114;
  id v115;
  id v116;
  void **v117;
  int v118;
  int v119;
  void (*v120)(uint64_t, uint64_t);
  void *v121;
  id v122;
  id from;
  char v124;
  id v125;
  os_log_type_t v126;
  id location;
  char v128;
  SEL v129;
  SetupController *v130;
  uint8_t v131[16];
  uint8_t v132[16];
  uint8_t v133[32];
  uint8_t v134[32];
  uint8_t buf[24];

  v130 = self;
  v129 = a2;
  -[SetupController _refreshLanguage](self, "_refreshLanguage");
  v2 = objc_alloc((Class)BFFNavigationController);
  v3 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v4 = (BFFNavigationController *)objc_msgSend(v2, "initIgnoringDismissals:", objc_msgSend(v3, "type") == (id)1);
  nav = v130->_nav;
  v130->_nav = v4;

  +[BFFViewControllerSpinnerManager configureWithNavigationController:](BFFViewControllerSpinnerManager, "configureWithNavigationController:", v130->_nav);
  v6 = -[SetupController environment](v130, "environment");
  v7 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v6, "buddyPreferencesExcludedFromBackup");
  LOBYTE(v3) = objc_msgSend(v7, "BOOLForKey:", CFSTR("PushWithoutDeferringTransitionsWhileInBackground"));

  v128 = v3 & 1;
  v8 = -[SetupController launchedForMigration](v130, "launchedForMigration");
  if (v8 || (v128 & 1) != 0)
  {
    location = (id)_BYLoggingFacility(v8);
    v126 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      if (-[SetupController launchedForMigration](v130, "launchedForMigration"))
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      if ((v128 & 1) != 0)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      sub_10003A6BC((uint64_t)buf, (uint64_t)v9, (uint64_t)v10);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)location, v126, "Will push without deferring transitions because launchedForMigration was: %{public}@, shouldPushWithoutDeferringTransitionsWhileInBackground was: %{public}@", buf, 0x16u);
    }
    objc_storeStrong(&location, 0);
    -[BFFNavigationController setPushWithoutDeferringTransitionsWhileInBackground:](v130->_nav, "setPushWithoutDeferringTransitionsWhileInBackground:", 1);
  }
  -[SetupController _setupAnalytics](v130, "_setupAnalytics");
  v11 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  objc_msgSend(v11, "applyThemeToNavigationController:", v130->_nav);

  v12 = -[BFFNavigationController view](v130->_nav, "view");
  v13 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v14 = objc_msgSend(v13, "backgroundColor");
  objc_msgSend(v12, "setBackgroundColor:", v14);

  v15 = [BuddyFlowDiverter alloc];
  v16 = -[BuddyFlowDiverter initWithEnvironment:](v15, "initWithEnvironment:", v130->_environment);
  -[SetupController setFlowDiverter:](v130, "setFlowDiverter:", v16);

  v124 = 0;
  v18 = 0;
  if ((os_variant_has_internal_ui("com.apple.purplebuddy", v17) & 1) != 0)
  {
    v125 = +[BuddyTestFundamentalFlow allowedFlowItems](BuddyTestFundamentalFlow, "allowedFlowItems");
    v124 = 1;
    v18 = objc_msgSend(v125, "count") != 0;
  }
  if ((v124 & 1) != 0)

  if (v18)
  {
    v19 = objc_alloc_init(BuddyTestFundamentalFlow);
    -[SetupController setFundamentalFlow:](v130, "setFundamentalFlow:", v19);
  }
  else
  {
    v20 = [BuddyFundamentalFlow alloc];
    v21 = v130;
    v19 = (BuddyTestFundamentalFlow *)objc_alloc_init((Class)BuddyFeatureFlags);
    v22 = -[BuddyFundamentalFlow initWithFlowProvider:featureFlags:](v20, "initWithFlowProvider:featureFlags:", v21, v19);
    -[SetupController setFundamentalFlow:](v130, "setFundamentalFlow:", v22);

  }
  objc_initWeak(&from, v130);
  v117 = _NSConcreteStackBlock;
  v118 = -1073741824;
  v119 = 0;
  v120 = sub_10003A6DC;
  v121 = &unk_100280880;
  objc_copyWeak(&v122, &from);
  v23 = -[SetupController fundamentalFlow](v130, "fundamentalFlow");
  -[BuddyFlowProducer setWillSupplyInitialFlowItemClass:](v23, "setWillSupplyInitialFlowItemClass:", &v117);

  v24 = [BuddyNavigationFlowController alloc];
  v25 = v130;
  v26 = v130->_nav;
  v27 = -[SetupController flowDiverter](v130, "flowDiverter");
  v28 = -[SetupController environment](v130, "environment");
  v29 = -[BuddyNavigationFlowController initWithNavigationController:usingRestoreProvider:usingFlowDiverter:environment:](v24, "initWithNavigationController:usingRestoreProvider:usingFlowDiverter:environment:", v26, v25, v27, v28);
  -[SetupController setNavigationFlowController:](v130, "setNavigationFlowController:", v29);

  v30 = v130;
  v31 = -[SetupController navigationFlowController](v130, "navigationFlowController");
  -[BuddyNavigationFlowController setFlowDelegate:](v31, "setFlowDelegate:", v30);

  v32 = v130;
  v33 = -[SetupController navigationFlowController](v130, "navigationFlowController");
  -[BuddyNavigationFlowController setLifecycleDelegate:](v33, "setLifecycleDelegate:", v32);

  v34 = -[SetupController environment](v130, "environment");
  v35 = -[BYEnvironment proximitySetupController](v34, "proximitySetupController");
  v36 = -[SetupController navigationFlowController](v130, "navigationFlowController");
  -[BuddyNavigationFlowController setProximitySetupController:](v36, "setProximitySetupController:", v35);

  v37 = -[SetupController fundamentalFlow](v130, "fundamentalFlow");
  v38 = -[SetupController navigationFlowController](v130, "navigationFlowController");
  -[BuddyNavigationFlowController setFlowProducer:](v38, "setFlowProducer:", v37);

  v39 = -[SetupController environment](v130, "environment");
  v40 = -[BYEnvironment buddyPreferences](v39, "buddyPreferences");
  v41 = -[SetupController navigationFlowController](v130, "navigationFlowController");
  -[BuddyNavigationFlowController setBuddyPreferences:](v41, "setBuddyPreferences:", v40);

  v42 = -[SetupController environment](v130, "environment");
  v43 = -[BYEnvironment analyticsManager](v42, "analyticsManager");
  v44 = -[SetupController navigationFlowController](v130, "navigationFlowController");
  -[BuddyNavigationFlowController setAnalyticsManager:](v44, "setAnalyticsManager:", v43);

  v116 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v115 = objc_msgSend(v116, "stringForKey:", CFSTR("Language"));
  v45 = objc_msgSend(v116, "objectForKey:", CFSTR("LockdownSetLanguage"));
  v114 = v45;
  v113 = 0;
  v46 = 1;
  if (!v115)
    v46 = v114 != 0;
  v113 = v46;
  oslog = (os_log_t)(id)_BYLoggingFacility(v45);
  v111 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003A724((uint64_t)v134, v113, (uint64_t)v115, (uint64_t)v114);
    _os_log_impl((void *)&_mh_execute_header, oslog, v111, "Language set (%d): %{public}@ %{public}@", v134, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v110 = objc_msgSend(v116, "BOOLForKey:", CFSTR("AnimateLanguageChoice")) & 1;
  v47 = 0;
  if (v113)
    v47 = v110;
  v130->_shouldAnimateLocaleScreen = v47 & 1;
  v48 = +[BYLocationController sharedBuddyLocationController](BYLocationController, "sharedBuddyLocationController");
  objc_msgSend(v48, "setFakeMode:", v130->_shouldAnimateLocaleScreen);

  v49 = -[SetupController environment](v130, "environment");
  v50 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v49, "buddyPreferencesExcludedFromBackup");
  v51 = objc_msgSend(v50, "BOOLForKey:", CFSTR("DisplayZoomRestart"));
  -[SetupController setShouldProceedFromAppearancePane:](v130, "setShouldProceedFromAppearancePane:", v51 & 1);

  v52 = -[SetupController navigationFlowController](v130, "navigationFlowController");
  v101 = _NSConcreteStackBlock;
  v102 = -1073741824;
  v103 = 0;
  v104 = sub_10003A74C;
  v105 = &unk_1002808A8;
  v106 = v130;
  v108 = v110 & 1;
  v109 = v113;
  v107 = v116;
  -[BuddyNavigationFlowController setupInitialFlowWithCompletion:](v52, "setupInitialFlowWithCompletion:", &v101);

  v53 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  v54 = objc_msgSend(v53, "isMultiUser");

  v100 = v54 & 1;
  v55 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v99 = objc_msgSend(v55, "aa_primaryAppleAccount");

  v56 = objc_msgSend(v99, "aa_isManagedAppleID");
  v98 = v56 & 1;
  v97 = (os_log_t)(id)_BYLoggingFacility(v56);
  v96 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    if ((v100 & 1) != 0)
      v57 = CFSTR("YES");
    else
      v57 = CFSTR("NO");
    if ((v98 & 1) != 0)
      v58 = CFSTR("YES");
    else
      v58 = CFSTR("NO");
    sub_10003AA38((uint64_t)v133, (uint64_t)v57, (uint64_t)v99, (uint64_t)v58);
    _os_log_impl((void *)&_mh_execute_header, v97, v96, "isMultiUser: %{public}@, account %p isManagedAppleID: %{public}@", v133, 0x20u);
  }
  objc_storeStrong((id *)&v97, 0);
  v95 = (os_log_t)(id)_BYLoggingFacility(v59);
  v94 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    v60 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[BYLicenseAgreement versionOfAcceptedAgreement](BYLicenseAgreement, "versionOfAcceptedAgreement"));
    sub_100039500((uint64_t)v132, (uint64_t)v60);
    _os_log_impl((void *)&_mh_execute_header, v95, v94, "Version of newest accepted iOS SLA: %{public}@", v132, 0xCu);

  }
  objc_storeStrong((id *)&v95, 0);
  v61 = +[BYSetupStateManager sharedManager](BYSetupStateManager, "sharedManager");
  v62 = objc_msgSend(v61, "didRestoreFromBackup");

  v93 = v62 & 1;
  v92 = (os_log_t)(id)_BYLoggingFacility(v63);
  v91 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    if ((v93 & 1) != 0)
      v64 = CFSTR("YES");
    else
      v64 = CFSTR("NO");
    sub_100039500((uint64_t)v131, (uint64_t)v64);
    _os_log_impl((void *)&_mh_execute_header, v92, v91, "Restored from Backup from RestoreState: %{public}@", v131, 0xCu);
  }
  objc_storeStrong((id *)&v92, 0);
  v65 = -[SetupController environment](v130, "environment");
  v66 = -[BYEnvironment proximitySetupController](v65, "proximitySetupController");
  v85 = _NSConcreteStackBlock;
  v86 = -1073741824;
  v87 = 0;
  v88 = sub_10003AA64;
  v89 = &unk_1002808D0;
  v90 = v130;
  objc_msgSend(v66, "needsToResume:", &v85);

  v67 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  LOBYTE(v66) = objc_msgSend(v67, "type") == (id)1;

  if ((v66 & 1) != 0)
  {
    v68 = objc_alloc_init(BuddyBackgroundViewController);
    -[SetupController setBackgroundViewController:](v130, "setBackgroundViewController:", v68);

    window = v130->_window;
    v70 = -[SetupController backgroundViewController](v130, "backgroundViewController");
    -[BFFWindow setRootViewController:](window, "setRootViewController:", v70);

    -[BFFNavigationController setModalPresentationStyle:](v130->_nav, "setModalPresentationStyle:", 2);
    -[BFFNavigationController setModalInPresentation:](v130->_nav, "setModalInPresentation:", 1);
    +[OBWelcomeController preferredContentSize](OBWelcomeController, "preferredContentSize");
    *(double *)&v84 = v71;
    *((double *)&v84 + 1) = v72;
    v73 = v130->_nav;
    v83 = v84;
    -[BFFNavigationController setForcedPreferredContentSize:](v73, "setForcedPreferredContentSize:", v71, v72);
    -[BFFWindow makeKeyAndVisible](v130->_window, "makeKeyAndVisible");
    v74 = -[SetupController backgroundViewController](v130, "backgroundViewController");
    -[UIViewController presentViewController:animated:completion:](v74, "presentViewController:animated:completion:", v130->_nav, 1, 0);

    v75 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
    v76 = -[UIApplication connectedScenes](v75, "connectedScenes");
    v82 = -[NSSet anyObject](v76, "anyObject");

    v77 = objc_opt_class(UIWindowScene);
    if ((objc_opt_isKindOfClass(v82, v77) & 1) != 0)
    {
      v78 = v82;
      objc_msgSend(v78, "_setBackgroundStyle:", 3, v78);
      objc_storeStrong(&v81, 0);
    }
    v79 = -[SetupController backgroundViewController](v130, "backgroundViewController");
    -[BYEnvironment setBuddyBackgroundViewController:](v130->_environment, "setBuddyBackgroundViewController:", v79);

    objc_storeStrong(&v82, 0);
  }
  else
  {
    -[BFFWindow setRootViewController:](v130->_window, "setRootViewController:", v130->_nav);
    -[BFFWindow makeKeyAndVisible](v130->_window, "makeKeyAndVisible");
  }
  if (v113)
  {
    v80 = +[BuddySIMManager sharedManager](BuddySIMManager, "sharedManager");
    objc_msgSend(v80, "allowSIMUnlock");

  }
  objc_storeStrong((id *)&v90, 0);
  objc_storeStrong(&v99, 0);
  objc_storeStrong(&v107, 0);
  objc_storeStrong((id *)&v106, 0);
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_destroyWeak(&v122);
  objc_destroyWeak(&from);
}

- (void)checkMiniBuddyBreadcrumbs
{
  uint64_t v2;
  id v3;
  BYEnvironment *v4;
  id v5;
  BYEnvironment *v6;
  id v7;
  unsigned __int8 v8;
  BYEnvironment *v9;
  id v10;
  char v11;
  NSObject *v12;
  os_log_type_t v13;
  BYEnvironment *v14;
  id v15;
  BYEnvironment *v16;
  id v17;
  BYEnvironment *v18;
  id v19;
  BYEnvironment *v20;
  id v21;
  unsigned __int8 v22;
  BuddyMiscState *v23;
  BYEnvironment *v24;
  id v25;
  uint8_t v26[15];
  os_log_type_t v27;
  os_log_t v28;
  char v29;
  id v30;
  char v31;
  id v32;
  id location;
  os_log_type_t v34;
  os_log_t oslog;
  unsigned __int8 v36;
  Boolean v37;
  Boolean v38;
  Boolean v39;
  Boolean v40;
  Boolean v41;
  Boolean v42;
  Boolean v43;
  Boolean AppBooleanValue;
  SEL v45;
  SetupController *v46;
  uint8_t buf[72];

  v46 = self;
  v45 = a2;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(BYBuddyRunKeychainSyncMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v43 = CFPreferencesGetAppBooleanValue(BYBuddyRunMesaMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v42 = CFPreferencesGetAppBooleanValue(BYBuddyRunPaymentMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v41 = CFPreferencesGetAppBooleanValue(BYBuddyRunDiagnosticsMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v40 = CFPreferencesGetAppBooleanValue(BYBuddyRunCombinedDiagnosticsMismatchMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v39 = CFPreferencesGetAppBooleanValue(BYBuddyRunHSA2MiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v46->_inMiniBuddyFromPostDemoRestoreBreadcrumb = CFPreferencesGetAppBooleanValue(BYBuddyRunPostDemoRestoreMiniBuddy, BYBuddyNotBackedUpIdentifier, 0) != 0;
  v38 = CFPreferencesGetAppBooleanValue(BYBuddyRunStolenDeviceProtectionMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v37 = CFPreferencesGetAppBooleanValue(BYBuddyRunStandardMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v2 = CFPreferencesGetAppBooleanValue(BYBuddyRunRestoreSIMSetupMiniBuddy, BYBuddyNotBackedUpIdentifier, 0);
  v36 = v2;
  oslog = (os_log_t)(id)_BYLoggingFacility(v2);
  v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003B460((uint64_t)buf, AppBooleanValue, v43, v42, v41, v40, v39, v46->_inMiniBuddyFromPostDemoRestoreBreadcrumb, v38, v37, v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v34, "Run with breadcrumbs: keychain=%d, touchid=%d, payment=%d, diagnostics=%d, combined diagnostics mismatch=%d, hsa2=%d, post demo restore=%d, stolen device protection=%d, standard=%d, restore SIMSetup: %d", buf, 0x3Eu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (AppBooleanValue
    || v43
    || v42
    || v41
    || v40
    || v39
    || v46->_inMiniBuddyFromPostDemoRestoreBreadcrumb
    || v38
    || v37
    || v36)
  {
    v46->_inMiniBuddyFromBreadcrumb = 1;
    location = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    objc_msgSend(location, "setBool:forKey:", 0, BYBuddyDoneKey);
    if (AppBooleanValue)
    {
      objc_msgSend(location, "setBool:forKey:", 0, CFSTR("AppleIDPB10Presented"));
      objc_msgSend(location, "setBool:forKey:", 0, CFSTR("KeychainSync3Presented"));
    }
    objc_msgSend(location, "setBool:forKey:", 0, CFSTR("Passcode4Presented"));
    if (v43)
    {
      objc_msgSend(location, "removeObjectForKey:", CFSTR("Mesa2Presented"));
      objc_msgSend(location, "removeObjectForKey:", CFSTR("MesaPurchasesPresented"));
    }
    if (v42)
    {
      objc_msgSend(location, "removeObjectForKey:", CFSTR("Payment2Presented"));
      objc_msgSend(location, "setBool:forKey:", 1, CFSTR("PaymentMiniBuddy4Ran"));
    }
    if (v41 || v40)
    {
      objc_msgSend(location, "removeObjectForKey:", CFSTR("PBDiagnostics4Presented"));
      v3 = objc_msgSend(location, "removeObjectForKey:", CFSTR("DiagnosticsAutoOptInSet"));
      if (v41)
      {
        v4 = -[SetupController environment](v46, "environment");
        v5 = -[BYEnvironment managedConfiguration](v4, "managedConfiguration");
        objc_msgSend(v5, "removeBoolSetting:", MCFeatureDiagnosticsSubmissionAllowed);

        v6 = -[SetupController environment](v46, "environment");
        v7 = -[BYEnvironment capabilities](v6, "capabilities");
        v8 = objc_msgSend(v7, "eligibleForChlorine");

        if ((v8 & 1) != 0)
        {
          v9 = -[SetupController environment](v46, "environment");
          v10 = -[BYEnvironment managedConfiguration](v9, "managedConfiguration");
          objc_msgSend(v10, "removeBoolSetting:", MCFeatureAppAnalyticsAllowed);

        }
      }
      else
      {
        v31 = 0;
        v29 = 0;
        v11 = 0;
        if (v40)
        {
          v32 = -[SetupController environment](v46, "environment");
          v31 = 1;
          v30 = objc_msgSend(v32, "capabilities");
          v29 = 1;
          v3 = objc_msgSend(v30, "eligibleForChlorine");
          v11 = (char)v3;
        }
        if ((v29 & 1) != 0)

        if ((v31 & 1) != 0)
        if ((v11 & 1) != 0)
        {
          v28 = (os_log_t)(id)_BYLoggingFacility(v3);
          v27 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v12 = v28;
            v13 = v27;
            sub_100038C3C(v26);
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "Combined analytics mismatch detected", v26, 2u);
          }
          objc_storeStrong((id *)&v28, 0);
          v14 = -[SetupController environment](v46, "environment");
          v15 = -[BYEnvironment miscState](v14, "miscState");
          objc_msgSend(v15, "setLaunchedWithCombinedAnalyticsMismatch:", 1);

        }
      }
    }
    if (v39)
    {
      objc_msgSend(location, "removeObjectForKey:", CFSTR("Mesa2Presented"));
      objc_msgSend(location, "removeObjectForKey:", CFSTR("AppleIDPB10Presented"));
      objc_msgSend(location, "setBool:forKey:", 1, CFSTR("HSA2UpgradeMiniBuddy3Ran"));
    }
    if (v38)
    {
      v16 = -[SetupController environment](v46, "environment");
      v17 = -[BYEnvironment miscState](v16, "miscState");
      objc_msgSend(v17, "setLaunchedToShowStolenDeviceProtection:", 1);

    }
    if (v36)
    {
      v18 = -[SetupController environment](v46, "environment");
      v19 = -[BYEnvironment miscState](v18, "miscState");
      objc_msgSend(v19, "setLaunchedToShowSIMSetupAfterRestore:", 1);

    }
    objc_msgSend(location, "synchronize");
    v20 = -[SetupController environment](v46, "environment");
    v21 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v20, "buddyPreferencesExcludedFromBackup");
    v22 = objc_msgSend(v21, "BOOLForKey:", CFSTR("ForcePrimaryAppleIDAuthentication"));

    if ((v22 & 1) != 0)
    {
      v23 = -[SetupController miscState](v46, "miscState");
      -[BuddyMiscState setForcePrimaryAppleIDAuthentication:](v23, "setForcePrimaryAppleIDAuthentication:", 1);

      v24 = -[SetupController environment](v46, "environment");
      v25 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v24, "buddyPreferencesExcludedFromBackup");
      objc_msgSend(v25, "removeObjectForKey:onlyFromMemory:", CFSTR("ForcePrimaryAppleIDAuthentication"), 0);

    }
    CFPreferencesSetAppValue(BYBuddyRunKeychainSyncMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunMesaMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunPaymentMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunDiagnosticsMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunCombinedDiagnosticsMismatchMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunHSA2MiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunStolenDeviceProtectionMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunStandardMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(BYBuddyRunRestoreSIMSetupMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesAppSynchronize(BYBuddyNotBackedUpIdentifier);
    objc_storeStrong(&location, 0);
  }
}

- (void)runWithScene:(id)a3
{
  BuddyInactivityTimer *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  BuddyMenuController *v7;
  BuddyMenuController *menuButtonConsumer;
  NSObject *v9;
  CFRunLoopRef Current;
  NSObject *v11;
  uint64_t Power;
  NSObject *v13;
  os_log_type_t v14;
  CFTypeRef v15;
  CFRunLoopRef v16;
  id v17;
  BFFWindow *v18;
  BFFWindow *window;
  id v20;
  BOOL v21;
  BFFWindow *v22;
  UIColor *v23;
  BFFWindow *v24;
  UIColor *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unsigned __int8 v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  unsigned __int8 v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  id v44;
  int v45;
  id v46;
  nw_path_monitor_t v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  BuddyProximityAutomatedDeviceEnrollmentController *v52;
  SetupController *v53;
  id v54;
  ProximitySetupController *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  ProximitySetupController *v62;
  SetupController *v63;
  id v64;
  UIDevice *v65;
  NSNotificationCenter *v66;
  id v67;
  id v68;
  char v69;
  void *v70;
  id v71;
  id v72;
  BuddyLanguageChangeObserver *v73;
  BuddyLanguageChangeObserver *languageObserver;
  id v75;
  BYEnvironment *v76;
  id v77;
  BFFBackupDeviceController *v78;
  id v79;
  BFFBackupDeviceController *v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  unsigned __int8 v84;
  BuddySuspendTask *v85;
  id v86;
  BYNetworkMonitor *v87;
  id v88;
  SetupController *v89;
  id v90;
  uint64_t v91;
  id v92;
  void **v93;
  uint64_t v94;
  void (*v95)(uint64_t);
  void *v96;
  SetupController *v97;
  void **v98;
  int v99;
  int v100;
  void (*v101)(NSObject *, char);
  void *v102;
  id v103;
  id v104;
  char v105;
  id v106;
  CFNotificationCenterRef center;
  void **update_handler;
  int v109;
  int v110;
  void (*v111)(id *, void *);
  void *v112;
  SetupController *v113;
  os_log_type_t v114;
  os_log_t v115;
  id v116;
  id v117;
  id v118;
  id v119;
  uint8_t v120[7];
  os_log_type_t v121;
  os_log_t v122;
  id v123;
  id v124;
  uint8_t buf[7];
  os_log_type_t v126;
  os_log_t oslog[2];
  id v128;
  CFTypeRef cf;
  void **block;
  int v131;
  int v132;
  void (*v133)(id *);
  void *v134;
  SetupController *v135;
  void **v136;
  int v137;
  int v138;
  void (*v139)(uint64_t);
  void *v140;
  id v141;
  id from;
  id location[2];
  SetupController *v144;
  id v145;
  id v146;
  id v147;
  uint8_t v148[16];

  v144 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SetupController inactivityTimer](v144, "inactivityTimer");
  -[BuddyInactivityTimer start](v3, "start");

  v4 = dispatch_get_global_queue(25, 0);
  dispatch_async(v4, &stru_1002808F0);

  v5 = dispatch_get_global_queue(25, 0);
  dispatch_async(v5, &stru_100280910);

  v6 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  objc_msgSend(v6, "applyThemeToAllTableViews");

  objc_initWeak(&from, v144);
  v136 = _NSConcreteStackBlock;
  v137 = -1073741824;
  v138 = 0;
  v139 = sub_10003CA94;
  v140 = &unk_1002806B8;
  objc_copyWeak(&v141, &from);
  v7 = (BuddyMenuController *)+[BuddyMenuController menuButtonConsumerWithHandler:](BuddyMenuController, "menuButtonConsumerWithHandler:", &v136);
  menuButtonConsumer = v144->_menuButtonConsumer;
  v144->_menuButtonConsumer = v7;

  v9 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v131 = -1073741824;
  v132 = 0;
  v133 = sub_10003CAD8;
  v134 = &unk_100280730;
  v135 = v144;
  dispatch_async(v9, &block);

  cf = (CFTypeRef)WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  if (cf)
  {
    Current = CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop(cf, Current, kCFRunLoopDefaultMode);
    v147 = (id)WiFiManagerClientCopyDevices(cf);
    v128 = v147;
    if (objc_msgSend(v128, "count"))
    {
      v11 = objc_msgSend(v128, "objectAtIndexedSubscript:", 0);

      oslog[1] = v11;
      Power = WiFiDeviceClientGetPower(v11);
      if (!(_BYTE)Power)
      {
        oslog[0] = (os_log_t)(id)_BYLoggingFacility(Power);
        v126 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
        {
          v13 = oslog[0];
          v14 = v126;
          sub_100038C3C(buf);
          _os_log_impl((void *)&_mh_execute_header, v13, v14, " Wifi is off ! turning it on!", buf, 2u);
        }
        objc_storeStrong((id *)oslog, 0);
        WiFiManagerClientSetPower(cf, 1);
      }
    }
    v15 = cf;
    v16 = CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop(v15, v16, kCFRunLoopDefaultMode);
    CFRelease(cf);
    objc_storeStrong(&v128, 0);
  }
  v17 = objc_alloc((Class)BFFWindow);
  v18 = (BFFWindow *)objc_msgSend(v17, "initWithWindowScene:", location[0]);
  window = v144->_window;
  v144->_window = v18;

  v20 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v21 = objc_msgSend(v20, "type") == 0;

  if (v21)
  {
    v22 = v144->_window;
    v23 = +[UIColor blackColor](UIColor, "blackColor");
    -[BFFWindow setBackgroundColor:](v22, "setBackgroundColor:", v23);

  }
  v24 = v144->_window;
  v25 = +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  -[BFFWindow setTintColor:](v24, "setTintColor:", v25);

  -[SetupController checkMiniBuddyBreadcrumbs](v144, "checkMiniBuddyBreadcrumbs");
  v26 = +[BYSetupStateNotifier sharedNotifier](BYSetupStateNotifier, "sharedNotifier");
  objc_msgSend(v26, "notifyStateChangedTo:", 1);

  v27 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v124 = objc_msgSend(v27, "aa_primaryAppleAccount");

  if (!v124)
  {
    v28 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v29 = objc_msgSend(v28, "aa_accountsEnabledForDataclass:", kAccountDataclassDeviceLocator);
    v123 = objc_msgSend(v29, "lastObject");

    if (v123)
    {
      objc_msgSend(v123, "aa_setPrimaryAccount:", 1);
      v30 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
      objc_msgSend(v30, "saveAccount:withCompletionHandler:", v123, 0);

    }
    objc_storeStrong(&v123, 0);
  }
  v31 = +[BYSetupStateManager sharedManager](BYSetupStateManager, "sharedManager");
  v32 = 1;
  if ((objc_msgSend(v31, "didSetupUsingiTunes") & 1) == 0)
  {
    v32 = 1;
    if (!-[SetupController _didRestoreIniTunes](v144, "_didRestoreIniTunes"))
      v32 = +[DMCMultiUserModeUtilities shouldSkipLanguageAndLocaleSetupForNewUsers](DMCMultiUserModeUtilities, "shouldSkipLanguageAndLocaleSetupForNewUsers");
  }

  if ((v32 & 1) != 0)
  {
    v122 = (os_log_t)(id)_BYLoggingFacility(v33);
    v121 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v122;
      v35 = v121;
      sub_100038C3C(v120);
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Setting current current language/locale for our language/locale preferences...", v120, 2u);
    }
    objc_storeStrong((id *)&v122, 0);
    v119 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v146 = (id)CFPreferencesCopyAppValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication);
    v118 = v146;
    if (v118)
    {
      v36 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v118, v36) & 1) != 0)
      {
        if (objc_msgSend(v118, "length"))
          objc_msgSend(v119, "setObject:forKey:", v118, CFSTR("Locale"));
      }
    }
    v145 = (id)CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), kCFPreferencesAnyApplication);
    v117 = v145;
    if (v117)
    {
      v37 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v117, v37) & 1) != 0)
      {
        if (objc_msgSend(v117, "count"))
        {
          v38 = objc_msgSend(v117, "objectAtIndexedSubscript:", 0);
          objc_msgSend(v119, "setObject:forKey:", v38, CFSTR("Language"));

        }
      }
    }
    objc_storeStrong(&v117, 0);
    objc_storeStrong(&v118, 0);
    objc_storeStrong(&v119, 0);
  }
  v116 = -[SetupController environment](v144, "environment");
  v39 = objc_msgSend(v116, "networkProvider");
  v40 = objc_msgSend(v39, "networkReachable");

  if ((v40 & 1) != 0)
  {
    v42 = +[BuddyAppleIDConfigurationManager sharedManager](BuddyAppleIDConfigurationManager, "sharedManager");
    objc_msgSend(v42, "getURLConfigurationWithHandler:", 0);

    v43 = dispatch_get_global_queue(0, 0);
    dispatch_async(v43, &stru_100280930);

  }
  v115 = (os_log_t)(id)_BYLoggingFacility(v41);
  v114 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(v116, "networkProvider");
    v45 = objc_msgSend(v44, "networkReachable") & 1;
    v46 = objc_msgSend(v116, "networkProvider");
    sub_10003CBAC((uint64_t)v148, v45, objc_msgSend(v46, "connectedOverWiFi") & 1);
    _os_log_impl((void *)&_mh_execute_header, v115, v114, "Network reachability at startup: %d isWifi: %d", v148, 0xEu);

  }
  objc_storeStrong((id *)&v115, 0);
  v47 = nw_path_monitor_create();
  -[SetupController setPathMonitor:](v144, "setPathMonitor:", v47);

  v48 = -[SetupController pathMonitor](v144, "pathMonitor");
  v49 = &_dispatch_main_q;
  nw_path_monitor_set_queue(v48, (dispatch_queue_t)v49);

  v50 = -[SetupController pathMonitor](v144, "pathMonitor");
  update_handler = _NSConcreteStackBlock;
  v109 = -1073741824;
  v110 = 0;
  v111 = sub_10003CBCC;
  v112 = &unk_100280958;
  v113 = v144;
  nw_path_monitor_set_update_handler(v50, &update_handler);

  v51 = -[SetupController pathMonitor](v144, "pathMonitor");
  nw_path_monitor_start(v51);

  v52 = objc_alloc_init(BuddyProximityAutomatedDeviceEnrollmentController);
  objc_msgSend(v116, "setProximityAutomatedDeviceEnrollmentController:", v52);

  v53 = v144;
  v54 = objc_msgSend(v116, "proximityAutomatedDeviceEnrollmentController");
  objc_msgSend(v54, "setDelegate:", v53);

  v55 = [ProximitySetupController alloc];
  v56 = objc_msgSend(v116, "miscState");
  v57 = objc_msgSend(v116, "buddyPreferences");
  v58 = objc_msgSend(v116, "buddyPreferencesExcludedFromBackup");
  v59 = objc_msgSend(v116, "featureFlags");
  v60 = objc_msgSend(v116, "analyticsManager");
  v61 = objc_msgSend(v116, "setupMethod");
  v62 = -[ProximitySetupController initWithMiscState:buddyPreferences:buddyPreferencesExcludedFromBackup:featureFlags:analyticsManager:setupMethod:](v55, "initWithMiscState:buddyPreferences:buddyPreferencesExcludedFromBackup:featureFlags:analyticsManager:setupMethod:", v56, v57, v58, v59, v60, v61);
  objc_msgSend(v116, "setProximitySetupController:", v62);

  v63 = v144;
  v64 = objc_msgSend(v116, "proximitySetupController");
  objc_msgSend(v64, "setDelegate:", v63);

  -[SetupController _createNavigationController](v144, "_createNavigationController");
  v65 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  -[UIDevice setBatteryMonitoringEnabled:](v65, "setBatteryMonitoringEnabled:", 1);

  -[SetupController _initializeGreen](v144, "_initializeGreen");
  v66 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v66, "addObserver:selector:name:object:", v144, "_updateLoadingStatus", RUIHTTPRequestLoadingStatusDidChangeNotification, 0);

  center = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(center, v144, (CFNotificationCallback)sub_10003CC18, CFSTR("com.apple.springboard.setupsnapshotremoved"), 0, CFNotificationSuspensionBehaviorCoalesce);
  CFNotificationCenterAddObserver(center, v144, (CFNotificationCallback)sub_10003CC4C, CFSTR("com.apple.purplebuddy.SetupStateChanged"), 0, CFNotificationSuspensionBehaviorCoalesce);
  CFNotificationCenterAddObserver(center, v144, (CFNotificationCallback)sub_10003CC80, CFSTR("AppleDatePreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
  v67 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
  objc_msgSend(v67, "addDelegate:", v144);

  v105 = 0;
  v68 = objc_msgSend(v116, "runState");
  v69 = 0;
  if ((objc_msgSend(v68, "hasCompletedInitialRun") & 1) == 0)
  {
    v106 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
    v105 = 1;
    v69 = objc_msgSend(v106, "isActivated") ^ 1;
  }
  if ((v105 & 1) != 0)

  if ((v69 & 1) != 0)
  {
    v70 = (void *)objc_opt_class(_TtC5Setup20BuddyAppStateManager);
    v71 = objc_msgSend((id)objc_opt_class(_TtC5Setup20BuddyAppStateManager), "currentAppStates");
    v72 = objc_msgSend(v116, "buddyPreferencesExcludedFromBackup");
    objc_msgSend(v70, "persist:to:", v71, v72);

  }
  v73 = objc_alloc_init(BuddyLanguageChangeObserver);
  languageObserver = v144->_languageObserver;
  v144->_languageObserver = v73;

  -[BuddyLanguageChangeObserver setDelegate:](v144->_languageObserver, "setDelegate:");
  -[BuddyLanguageChangeObserver startObservingLanguageChanges](v144->_languageObserver, "startObservingLanguageChanges");
  v75 = +[BYLocationController sharedBuddyLocationController](BYLocationController, "sharedBuddyLocationController");
  v76 = -[SetupController environment](v144, "environment");
  v77 = -[BYEnvironment analyticsManager](v76, "analyticsManager");
  objc_msgSend(v75, "configureForAnalytics:", v77);

  v104 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if ((objc_msgSend(v104, "fileExistsAtPath:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/FirstTime")) & 1) != 0&& ((objc_msgSend(v104, "createFileAtPath:contents:attributes:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowLicense"), 0, 0) & 1) == 0|| (objc_msgSend(v104, "createFileAtPath:contents:attributes:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowMarketing"), 0, 0) & 1) == 0|| (objc_msgSend(v104, "removeItemAtPath:error:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/FirstTime"),
                         0) & 1) == 0))
  {
    objc_msgSend(v104, "removeItemAtPath:error:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowLicense"), 0);
    objc_msgSend(v104, "removeItemAtPath:error:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowMarketing"), 0);
  }
  v78 = [BFFBackupDeviceController alloc];
  v79 = objc_msgSend(v116, "proximitySetupController");
  v80 = -[BFFBackupDeviceController initWithProximitySetupController:](v78, "initWithProximitySetupController:", v79);
  objc_msgSend(v116, "setBackupDeviceController:", v80);

  if ((BYSetupAssistantHasCompletedInitialRun(v81, v82) & 1) == 0)
    -[SetupController startTFDEPPolling](v144, "startTFDEPPolling");
  v83 = objc_msgSend(v116, "buddyPreferencesExcludedFromBackup");
  v84 = +[BuddySuspendTask hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:](BuddySuspendTask, "hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:", v83);

  if ((v84 & 1) != 0)
  {
    v85 = objc_opt_new(BuddySuspendTask);
    objc_msgSend(v116, "setSuspendTask:", v85);

  }
  v86 = +[OBAnalyticsManager sharedManager](OBAnalyticsManager, "sharedManager");
  objc_msgSend(v86, "setShouldStashMetrics:", 1);

  v87 = +[BYNetworkMonitor sharedInstance](BYNetworkMonitor, "sharedInstance");
  v98 = _NSConcreteStackBlock;
  v99 = -1073741824;
  v100 = 0;
  v101 = sub_10003CCB4;
  v102 = &unk_1002808D0;
  v103 = v116;
  -[BYNetworkMonitor withMinimumNetworkType:timeout:runBlock:](v87, "withMinimumNetworkType:timeout:runBlock:", 1, &v98, 30.0);

  v93 = _NSConcreteStackBlock;
  v94 = 3221225472;
  v95 = sub_10003D114;
  v96 = &unk_100280730;
  v97 = v144;
  v88 = objc_msgSend(location[0], "statusBarManager");
  objc_msgSend(v88, "setDebugMenuHandler:", &v93);

  v89 = v144;
  v90 = objc_msgSend(v116, "displayZoomExecutor", _NSConcreteStackBlock, 3221225472, sub_10003D160, &unk_100280730, v89, v93, v94, v95, v96);
  objc_msgSend(v90, "setWillCommit:", &v91);

  objc_storeStrong(&v92, 0);
  objc_storeStrong((id *)&v97, 0);
  objc_storeStrong(&v103, 0);
  objc_storeStrong(&v104, 0);
  objc_storeStrong((id *)&v113, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v124, 0);
  objc_storeStrong((id *)&v135, 0);
  objc_destroyWeak(&v141);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (void)buddyViewControllerDidPressAlternateSetupButton:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_networkPathChanged
{
  int v2;
  BYEnvironment *v3;
  id v4;
  int v5;
  uint64_t v6;
  id v7;
  id v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  unsigned __int8 v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void **block;
  int v29;
  int v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  os_log_type_t v34;
  os_log_t oslog[2];
  id v36;
  uint8_t buf[24];

  v36 = self;
  oslog[1] = (os_log_t)a2;
  v2 = byte_1002EE800 & 1;
  v3 = -[SetupController environment](self, "environment");
  v4 = -[BYEnvironment networkProvider](v3, "networkProvider");
  v5 = objc_msgSend(v4, "networkReachable") & 1;

  if (v2 != v5)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v6);
    v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v36, "environment");
      v8 = objc_msgSend(v7, "networkProvider");
      v9 = objc_msgSend(v8, "networkReachable") & 1;
      v10 = objc_msgSend(v36, "environment");
      v11 = objc_msgSend(v10, "networkProvider");
      sub_10003CBAC((uint64_t)buf, v9, objc_msgSend(v11, "connectedOverWiFi") & 1);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v34, "Network reachability changed: %d isWifi: %d", buf, 0xEu);

    }
    objc_storeStrong((id *)oslog, 0);
    v12 = objc_msgSend(v36, "environment");
    v13 = objc_msgSend(v12, "networkProvider");
    byte_1002EE800 = objc_msgSend(v13, "networkReachable") & 1;

  }
  v14 = objc_msgSend(v36, "environment");
  v15 = objc_msgSend(v14, "networkProvider");
  v16 = objc_msgSend(v15, "networkReachable");

  if ((v16 & 1) != 0)
  {
    v17 = objc_msgSend(v36, "environment");
    v18 = objc_msgSend(v17, "systemTimeUpdateManager");
    objc_msgSend(v18, "updateSystemTime");

    v19 = +[BuddyAppleIDConfigurationManager sharedManager](BuddyAppleIDConfigurationManager, "sharedManager");
    objc_msgSend(v19, "getURLConfigurationWithHandler:", 0);

    v20 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v29 = -1073741824;
    v30 = 0;
    v31 = sub_10003D648;
    v32 = &unk_100280730;
    v33 = v36;
    dispatch_async((dispatch_queue_t)v20, &block);

    objc_storeStrong(&v33, 0);
  }
  v21 = objc_msgSend(v36, "environment");
  v22 = objc_msgSend(v21, "networkProvider");
  v23 = objc_msgSend(v22, "connectedOverWiFi");

  if ((v23 & 1) != 0)
    *((_BYTE *)v36 + 120) = 1;
  v24 = objc_msgSend(v36, "navigationFlowController");
  v25 = objc_msgSend(v24, "wifiController");
  v26 = objc_msgSend(v36, "environment");
  v27 = objc_msgSend(v26, "networkProvider");
  objc_msgSend(v25, "reachabilityChanged:", (unint64_t)objc_msgSend(v27, "networkReachable") & 1);

}

- (void)checkForUpdatedCarrierBundle
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[7];
  os_log_type_t v5;
  os_log_t oslog;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  oslog = (os_log_t)(id)_BYLoggingFacility(location[0]);
  v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog;
    v3 = v5;
    sub_100038C3C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Checking for updated carrier bundles...", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(location[0], "checkForUpdatedBundlesWithAutoInstall:completion:", 1, &stru_1002809D8);
  objc_storeStrong(location, 0);
}

- (void)_refreshLanguage
{
  NSArray *v2;
  NSString *v3;
  NSString *languageAtStartup;
  NSArray *v5;
  NSLocale *v6;
  NSString *v7;
  NSString *localeIdentifierAtStartup;

  v2 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages", a2);
  v3 = (NSString *)-[NSArray firstObject](v2, "firstObject");
  languageAtStartup = self->_languageAtStartup;
  self->_languageAtStartup = v3;

  v5 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
  -[SetupController setPreferredLanguagesAtStartup:](self, "setPreferredLanguagesAtStartup:", v5);

  v6 = +[NSLocale currentLocale](NSLocale, "currentLocale");
  v7 = -[NSLocale localeIdentifier](v6, "localeIdentifier");
  localeIdentifierAtStartup = self->_localeIdentifierAtStartup;
  self->_localeIdentifierAtStartup = v7;

}

- (void)_updateLoadingStatus
{
  unsigned __int8 v2;

  v2 = +[RUIHTTPRequest anyRequestLoading](RUIHTTPRequest, "anyRequestLoading");
  objc_msgSend(UIApp, "setStatusBarShowsProgress:", v2 & 1);
}

- (id)_stringForStartupCause:(unint64_t)a3
{
  id result;
  __CFString *v4;

  switch(a3)
  {
    case 0uLL:
      result = CFSTR("Unknown");
      break;
    case 1uLL:
      result = CFSTR("Post-Language Change");
      break;
    case 2uLL:
      result = CFSTR("Post-Display Zoom Change");
      break;
    case 3uLL:
      result = CFSTR("Activation");
      break;
    case 4uLL:
      result = CFSTR("Post-Restore");
      break;
    case 5uLL:
      result = CFSTR("Post-Software Update");
      break;
    case 6uLL:
      result = CFSTR("Migration");
      break;
    case 7uLL:
      v4 = CFSTR("Post-Demo Restore");
      goto LABEL_10;
    default:
LABEL_10:
      result = v4;
      break;
  }
  return result;
}

- (void)startTFDEPPolling
{
  NSObject *v2;
  os_log_type_t v3;
  NSTimer *v4;
  NSTimer *TFDEPPollTimer;
  _WORD v6[3];
  os_log_type_t v7;
  os_log_t oslog[2];
  SetupController *v9;

  v9 = self;
  oslog[1] = (os_log_t)a2;
  if (!self->_TFDEPPollTimer)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = oslog[0];
      v3 = v7;
      sub_100038C3C(v6);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "TFDEP: starting poll timer", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    v4 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v9, "TFDEPPollTimerFired:", 0, 1, 1.0);
    TFDEPPollTimer = v9->_TFDEPPollTimer;
    v9->_TFDEPPollTimer = v4;

  }
}

- (void)stopTFDEPPolling
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  SetupController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_TFDEPPollTimer)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
    v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = oslog[0];
      v3 = v5;
      sub_100038C3C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "TFDEP: stopping poll timer", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    -[NSTimer invalidate](v7->_TFDEPPollTimer, "invalidate");
    objc_storeStrong((id *)&v7->_TFDEPPollTimer, 0);
  }
}

- (BOOL)isTeslaEnrolled
{
  BYEnvironment *v2;
  id v3;
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v2 = -[SetupController environment](self, "environment");
  v3 = -[BYEnvironment managedConfiguration](v2, "managedConfiguration");
  location[0] = objc_msgSend(v3, "cloudConfigurationDetails");

  v4 = objc_msgSend(location[0], "objectForKeyedSubscript:", kMCCCConfigurationSourceKey);
  LOBYTE(v3) = objc_msgSend(v4, "intValue") == 1;

  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)TFDEPPollTimerFired:(id)a3
{
  BYEnvironment *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  os_log_type_t v7;
  BuddyNavigationFlowController *v8;
  _WORD v9[3];
  os_log_type_t v10;
  os_log_t oslog;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id location[2];
  SetupController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SetupController environment](v20, "environment");
  v18 = -[BYEnvironment managedConfiguration](v3, "managedConfiguration");

  v16 = 0;
  v14 = 0;
  v12 = 0;
  if (-[SetupController isTeslaEnrolled](v20, "isTeslaEnrolled")
    || (v17 = -[SetupController environment](v20, "environment"),
        v16 = 1,
        v15 = objc_msgSend(v17, "mdmReturnToServiceController"),
        v14 = 1,
        v4 = objc_msgSend(v15, "shouldDoReturnToService"),
        v5 = 0,
        (v4 & 1) != 0))
  {
    v4 = objc_msgSend(v18, "installedMDMProfileIdentifier");
    v13 = v4;
    v12 = 1;
    v5 = v4 != 0;
  }
  if ((v12 & 1) != 0)

  if ((v14 & 1) != 0)
  if ((v16 & 1) != 0)

  if (v5)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v10;
      sub_100038C3C(v9);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "TFDEP: We are undergoing tap free setup!", (uint8_t *)v9, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[SetupController stopTFDEPPolling](v20, "stopTFDEPPolling");
    v20->_isTapFreeSetup = 1;
    objc_msgSend(v18, "cloudConfigurationUIDidCompleteWasApplied:", 1);
    v8 = -[SetupController navigationFlowController](v20, "navigationFlowController");
    -[BuddyNavigationFlowController beginTapFreeSetUp](v8, "beginTapFreeSetUp");

  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)doesTapFreeSetupAffectsClass:(Class)a3
{
  char v3;
  unsigned __int8 v4;

  v3 = objc_opt_respondsToSelector(a3, "controllerAffectedByTapFreeSetup");
  v4 = 0;
  if ((v3 & 1) != 0)
    v4 = -[objc_class controllerAffectedByTapFreeSetup](a3, "controllerAffectedByTapFreeSetup");
  return v4 & 1;
}

- (BOOL)shouldTapFreeSetupSkipControllerClass:(Class)a3
{
  BOOL isTapFreeSetup;
  unsigned __int8 v4;

  isTapFreeSetup = self->_isTapFreeSetup;
  v4 = 0;
  if (isTapFreeSetup)
    v4 = -[SetupController doesTapFreeSetupAffectsClass:](self, "doesTapFreeSetupAffectsClass:", a3);
  return v4 & 1;
}

- (void)_setupAndStartReturnToServiceIfNeeded
{
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  BuddyNavigationFlowController *v11;
  _WORD v12[7];
  os_log_type_t v13;
  os_log_t oslog;
  id v15;
  id v16;
  void **block;
  int v18;
  int v19;
  void (*v20)(_QWORD *);
  void *v21;
  id v22;
  uint8_t buf[15];
  os_log_type_t v24;
  id location;
  id v26[2];
  SetupController *v27;

  v27 = self;
  v26[1] = (id)a2;
  v26[0] = -[BYEnvironment mdmReturnToServiceController](self->_environment, "mdmReturnToServiceController");
  v2 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  objc_msgSend(v2, "setMdmReturnToServiceController:", v26[0]);

  v3 = objc_msgSend(v26[0], "shouldDoReturnToService");
  if ((v3 & 1) != 0)
  {
    location = (id)_BYLoggingFacility(v3);
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      v4 = location;
      v5 = v24;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "We are in auto re-enrollment flow. Will push without deferring transitions…", buf, 2u);
    }
    objc_storeStrong(&location, 0);
    -[BFFNavigationController setPushWithoutDeferringTransitionsWhileInBackground:](v27->_nav, "setPushWithoutDeferringTransitionsWhileInBackground:", 1);
    v6 = dispatch_get_global_queue(2, 0);
    block = _NSConcreteStackBlock;
    v18 = -1073741824;
    v19 = 0;
    v20 = sub_10003E37C;
    v21 = &unk_100280730;
    v22 = v26[0];
    dispatch_async(v6, &block);

    v7 = objc_msgSend(v26[0], "languageStrings");
    v16 = objc_msgSend(v7, "firstObject");

    v15 = objc_msgSend(v26[0], "localeString");
    if (objc_msgSend(v16, "length"))
    {
      v8 = objc_msgSend(v15, "length");
      if (v8)
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v8);
        v13 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v9 = oslog;
          v10 = v13;
          sub_100038C3C(v12);
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "Doing auto re-enrollment, setting language & locale...", (uint8_t *)v12, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        -[SetupController userSelectedLanguageWithLocale:countryCode:localePaneScrollOffset:](v27, "userSelectedLanguageWithLocale:countryCode:localePaneScrollOffset:", v16, v15, 0.0);
        v11 = -[SetupController navigationFlowController](v27, "navigationFlowController");
        -[BuddyNavigationFlowController proceedPastLanguageLocalePane](v11, "proceedPastLanguageLocalePane");

      }
    }
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(v26, 0);
}

- (void)didBecomeActive
{
  id v2;
  double v3;
  unint64_t v4;
  BuddyNavigationFlowController *v5;
  BuddyInactivityTimer *v6;
  NSObject *v7;
  BuddyNavigationAnalytics *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  SetupController *v13;
  id v14;
  id location;
  os_log_type_t v16;
  os_log_t v17;
  os_log_type_t v18;
  os_log_t oslog;
  uint64_t v20;
  SEL v21;
  SetupController *v22;
  uint8_t v23[16];
  uint8_t buf[24];

  v22 = self;
  v21 = a2;
  if (self->_lockStartTimestamp)
  {
    v20 = 0;
    v2 = +[BuddyTimestamp intervalSinceTimestamp:](BuddyTimestamp, "intervalSinceTimestamp:", v22->_lockStartTimestamp);
    v20 = *(_QWORD *)&v3;
    v22->_cumulativeLockedDuration = v22->_cumulativeLockedDuration + v3;
    oslog = (os_log_t)(id)_BYLoggingFacility(v2);
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000342B4((uint64_t)buf, v20);
      _os_log_impl((void *)&_mh_execute_header, oslog, v18, "Spent %0.2fs locked/inactive", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v22->_lockStartTimestamp = 0;
  }
  if (!v22->_buddyStartTimestamp)
  {
    v4 = +[BuddyTimestamp currentTimestamp](BuddyTimestamp, "currentTimestamp");
    v22->_buddyStartTimestamp = v4;
    v17 = (os_log_t)(id)_BYLoggingFacility(v4);
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      location = +[NSDate date](NSDate, "date");
      sub_100039500((uint64_t)v23, (uint64_t)location);
      _os_log_impl((void *)&_mh_execute_header, v17, v16, "Buddy UI started at %{public}@", v23, 0xCu);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)&v17, 0);
  }
  v5 = -[SetupController navigationFlowController](v22, "navigationFlowController");
  v14 = -[BuddyNavigationFlowController topFlowItem](v5, "topFlowItem");

  if ((objc_opt_respondsToSelector(v14, "shouldStopInactivityTimer") & 1) != 0
    && (objc_msgSend(v14, "shouldStopInactivityTimer") & 1) != 0)
  {
    v6 = -[SetupController inactivityTimer](v22, "inactivityTimer");
    -[BuddyInactivityTimer stop](v6, "stop");

  }
  v7 = dispatch_get_global_queue(0, 0);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10003E798;
  v12 = &unk_100280730;
  v13 = v22;
  dispatch_async(v7, &v9);

  v8 = -[SetupController navigationAnalytics](v22, "navigationAnalytics", v9, v10, v11, v12);
  -[BuddyNavigationAnalytics didBecomeActive](v8, "didBecomeActive");

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
}

- (void)willResignActive
{
  self->_lockStartTimestamp = +[BuddyTimestamp currentTimestamp](BuddyTimestamp, "currentTimestamp", a2);
  if (self->_buddyDone)
    -[SetupController willMarkBuddyComplete](self, "willMarkBuddyComplete");
}

- (void)didEnterBackground
{
  const __CFString *v2;
  const __CFString *v3;
  FBSDisplayLayoutMonitor *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  FBSDisplayLayoutMonitor *v8;
  BuddyInactivityTimer *v9;
  BuddyNavigationAnalytics *v10;
  _WORD v11[3];
  char v12;
  os_log_t v13;
  os_log_type_t v14;
  os_log_t oslog[2];
  SetupController *v16;
  uint8_t buf[24];

  v16 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v16->_buddyDone)
      v2 = CFSTR("complete");
    else
      v2 = CFSTR("not complete");
    if ((objc_msgSend(UIApp, "isSuspendedUnderLock") & 1) != 0)
      v3 = CFSTR("locked");
    else
      v3 = CFSTR("not locked");
    sub_10003EB04((uint64_t)buf, (uint64_t)v2, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], v14, "Entered background (setup is %@, device is %@)", buf, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = -[SetupController monitor](v16, "monitor");

  if (v4)
  {
    v13 = (os_log_t)(id)_BYLoggingFacility(v5);
    v12 = 16;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v6 = v13;
      v7 = v12;
      sub_100038C3C(v11);
      _os_log_error_impl((void *)&_mh_execute_header, v6, v7, "Entered background before a display layout update was received; forcing completion...",
        (uint8_t *)v11,
        2u);
    }
    objc_storeStrong((id *)&v13, 0);
    v8 = -[SetupController monitor](v16, "monitor");
    -[FBSDisplayLayoutMonitor invalidate](v8, "invalidate");

    -[SetupController setMonitor:](v16, "setMonitor:", 0);
    -[SetupController markBuddyComplete](v16, "markBuddyComplete");
    -[SetupController didMarkBuddyComplete](v16, "didMarkBuddyComplete");
  }
  if (!v16->_buddyDone || (objc_msgSend(UIApp, "isSuspendedUnderLock") & 1) != 0)
  {
    v9 = -[SetupController inactivityTimer](v16, "inactivityTimer");
    -[BuddyInactivityTimer start](v9, "start");

  }
  else
  {
    -[SetupController terminate](v16, "terminate");
  }
  -[SetupController endAdvertisingProximitySetup](v16, "endAdvertisingProximitySetup");
  v10 = -[SetupController navigationAnalytics](v16, "navigationAnalytics");
  -[BuddyNavigationAnalytics didEnterBackground](v10, "didEnterBackground");

}

- (void)willTerminate
{
  BYEnvironment *v2;
  id v3;

  v2 = -[SetupController environment](self, "environment", a2, self);
  v3 = -[BYEnvironment proximitySetupController](v2, "proximitySetupController");
  objc_msgSend(v3, "setupFinished");

}

- (void)terminate
{
  id v2;
  BYEnvironment *v3;
  id v4;
  id v5;
  id v6;
  BYEnvironment *v7;
  id v8;
  BYEnvironment *v9;
  id v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSRunLoop *v13;
  NSObject *v14;
  os_log_type_t v15;
  UIApplication *v16;
  _WORD v17[7];
  os_log_type_t v18;
  os_log_t oslog;
  id location[2];
  SetupController *v21;

  v21 = self;
  location[1] = (id)a2;
  v2 = +[BYSetupStateNotifier sharedNotifier](BYSetupStateNotifier, "sharedNotifier");
  objc_msgSend(v2, "notifyStateChangedTo:", 3);

  location[0] = 0;
  if (-[SetupController shouldLaunchSuspendTaskURL](v21, "shouldLaunchSuspendTaskURL"))
  {
    v3 = -[SetupController environment](v21, "environment");
    v4 = -[BYEnvironment suspendTask](v3, "suspendTask");
    v5 = objc_msgSend(v4, "launchURL");
    v6 = location[0];
    location[0] = v5;

  }
  v7 = -[SetupController environment](v21, "environment");
  v8 = -[BYEnvironment displayZoomExecutor](v7, "displayZoomExecutor");
  objc_msgSend(v8, "setWillCommit:", 0);

  v9 = -[SetupController environment](v21, "environment");
  v10 = -[BYEnvironment displayZoomExecutor](v9, "displayZoomExecutor");
  v11 = objc_msgSend(v10, "commitIfNeededWithRelaunchURL:transitionWithScreenshot:", location[0], 0);

  if ((v11 & 1) != 0)
  {
    v13 = +[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop");
    -[NSRunLoop run](v13, "run");

  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v12);
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = oslog;
      v15 = v18;
      sub_100038C3C(v17);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Buddy exiting...", (uint8_t *)v17, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v16 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
    -[UIApplication terminateWithSuccess](v16, "terminateWithSuccess");

  }
  objc_storeStrong(location, 0);
}

- (void)willMarkBuddyComplete
{
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  id v5;
  BYEnvironment *v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  os_log_type_t v12;
  FMDFMIPManager *v13;
  uint64_t v14;
  NSString *v15;
  BYEnvironment *v16;
  id v17;
  Boolean keyExistsAndHasValidFormat;
  const __CFString *v19;
  const __CFString *v20;
  char v21;
  id v22;
  char v23;
  id v24;
  os_log_type_t v25;
  os_log_t v26;
  id v27;
  uint8_t v28[15];
  os_log_type_t v29;
  os_log_t oslog;
  char v31;
  id v32;
  char v33;
  id v34;
  char v35;
  BYEnvironment *v36;
  BOOL v37;
  char v38;
  uint8_t buf[7];
  os_log_type_t v40;
  os_log_t location[2];
  SetupController *v42;
  uint8_t v43[24];

  v42 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v40;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Performing any work before marking buddy as complete...", buf, 2u);
  }
  objc_storeStrong((id *)location, 0);
  v4 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v5 = objc_msgSend(v4, "aa_primaryAppleAccount");

  if (v5)
  {
    v6 = -[SetupController environment](v42, "environment");
    v7 = -[BYEnvironment proximitySetupController](v6, "proximitySetupController");
    v8 = objc_msgSend(v7, "hasAppliedSettings");

    v38 = v8 & 1;
    v37 = 0;
    v35 = 0;
    v33 = 0;
    v31 = 0;
    v10 = 0;
    if ((v8 & 1) != 0)
    {
      v36 = -[SetupController environment](v42, "environment");
      v35 = 1;
      v34 = -[BYEnvironment pendingRestoreState](v36, "pendingRestoreState");
      v33 = 1;
      v9 = objc_msgSend(v34, "backupItem");
      v32 = v9;
      v31 = 1;
      v10 = v9 == 0;
    }
    if ((v31 & 1) != 0)

    if ((v33 & 1) != 0)
    if ((v35 & 1) != 0)

    v37 = v10;
    if (v10)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v9);
      v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = oslog;
        v12 = v29;
        sub_100038C3C(v28);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Enabling Find My...", v28, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v13 = +[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance");
      v27 = -[FMDFMIPManager enableFMIPInContext:](v13, "enableFMIPInContext:", 5);

      if (v27)
      {
        v26 = (os_log_t)(id)_BYLoggingFacility(v14);
        v25 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v23 = 0;
          v21 = 0;
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v15 = (NSString *)v27;
          }
          else
          {
            v24 = objc_msgSend(v27, "domain");
            v23 = 1;
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v24, objc_msgSend(v27, "code"));
            v22 = v15;
            v21 = 1;
          }
          sub_100039500((uint64_t)v43, (uint64_t)v15);
          _os_log_error_impl((void *)&_mh_execute_header, v26, v25, "Failed to enable Find My: %{public}@", v43, 0xCu);
          if ((v21 & 1) != 0)

          if ((v23 & 1) != 0)
        }
        objc_storeStrong((id *)&v26, 0);
      }
      objc_storeStrong(&v27, 0);
    }
  }
  v20 = CFSTR("com.apple.WebUI");
  v19 = CFSTR("DefaultValueForPasswordAndCreditCardAutoFill");
  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(CFSTR("DefaultValueForPasswordAndCreditCardAutoFill"), CFSTR("com.apple.WebUI"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
  {
    v16 = -[SetupController environment](v42, "environment");
    v17 = -[BYEnvironment managedConfiguration](v16, "managedConfiguration");
    CFPreferencesSetAppValue(CFSTR("DefaultValueForPasswordAndCreditCardAutoFill"), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)objc_msgSend(v17, "isPasscodeSet") & 1), CFSTR("com.apple.WebUI"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.WebUI"));
  }
}

- (void)markBuddyComplete
{
  SetupController *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BYEnvironment *v8;
  id v9;
  id v10;
  id v11;
  BYEnvironment *v12;
  id v13;
  BYEnvironment *v14;
  id v15;
  BYEnvironment *v16;
  id v17;
  NSUserDefaults *v18;
  NSUserDefaults *v19;
  NSNumber *v20;
  NSUserDefaults *v21;
  NSUserDefaults *v22;
  NSDate *v23;
  BYEnvironment *v24;
  id v25;
  BYEnvironment *v26;
  id v27;
  id v28;
  NSUserDefaults *v29;
  _WORD v30[3];
  os_log_type_t v31;
  os_log_t v32;
  uint8_t buf[15];
  os_log_type_t v34;
  os_log_t oslog;
  char v36;
  SEL v37;
  SetupController *v38;

  v38 = self;
  v37 = a2;
  v2 = self;
  objc_sync_enter(v2);
  v36 = -[SetupController markBuddyCompleteDidRun](v38, "markBuddyCompleteDidRun");
  -[SetupController setMarkBuddyCompleteDidRun:](v38, "setMarkBuddyCompleteDidRun:", 1);
  objc_sync_exit(v2);

  if ((v36 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = oslog;
      v5 = v34;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Already marked buddy as complete.", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    v32 = (os_log_t)(id)_BYLoggingFacility(v3);
    v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v32;
      v7 = v31;
      sub_100038C3C(v30);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Marking buddy as complete...", (uint8_t *)v30, 2u);
    }
    objc_storeStrong((id *)&v32, 0);
    v8 = -[SetupController environment](v38, "environment");
    v9 = -[BYEnvironment buddyPreferences](v8, "buddyPreferences");
    v10 = -[BYEnvironment chronicle](v38->_environment, "chronicle");
    v11 = objc_msgSend(v10, "dictionaryRepresentation");
    objc_msgSend(v9, "setObject:forKey:", v11, BYChronicleKey);

    v12 = -[SetupController environment](v38, "environment");
    v13 = -[BYEnvironment buddyPreferences](v12, "buddyPreferences");
    objc_msgSend(v13, "removeObjectForKey:onlyFromMemory:", CFSTR("DebugFlowItemClassNames"), 0);

    v14 = -[SetupController environment](v38, "environment");
    v15 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v14, "buddyPreferencesExcludedFromBackup");
    objc_msgSend(v15, "removeObjectForKey:", CFSTR("PushWithoutDeferringTransitionsWhileInBackground"));

    v16 = -[SetupController environment](v38, "environment");
    v17 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v16, "buddyPreferencesExcludedFromBackup");
    +[BuddySetupAnalytics removeFromDiskWithPreferences:](BuddySetupAnalytics, "removeFromDiskWithPreferences:", v17);

    +[BYPreferencesController persistEverything](BYPreferencesController, "persistEverything");
    v18 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults setObject:forKey:](v18, "setObject:forKey:", &__kCFBooleanTrue, BYBuddyDoneKey);

    v19 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", BYBuddyIOSCurrentVersion);
    -[NSUserDefaults setObject:forKey:](v19, "setObject:forKey:", v20, BYBuddyIOSVersionKey);

    v21 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults setObject:forKey:](v21, "setObject:forKey:", &__kCFBooleanTrue, BYBuddyFinishedInitialRunKey);

    v22 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v23 = +[NSDate date](NSDate, "date");
    -[NSUserDefaults setObject:forKey:](v22, "setObject:forKey:", v23, BYBuddyLastExitKey);

    v24 = -[SetupController environment](v38, "environment");
    v25 = -[BYEnvironment buddyPreferences](v24, "buddyPreferences");
    +[BuddyRestoreState removeFromPreferences:](BuddyRestoreState, "removeFromPreferences:", v25);

    v26 = -[SetupController environment](v38, "environment");
    v27 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v26, "buddyPreferencesExcludedFromBackup");
    +[BuddyMigrationState removeFromPreferences:](BuddyMigrationState, "removeFromPreferences:", v27);

    v28 = +[BYSetupStateManager sharedManager](BYSetupStateManager, "sharedManager");
    objc_msgSend(v28, "recordSetupUsingBuddy");

    v29 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    -[NSUserDefaults synchronize](v29, "synchronize");

    CFPreferencesSynchronize(BYSetupAssistantBundleIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    CFPreferencesSetAppValue(BYBuddyRunPostDemoRestoreMiniBuddy, kCFBooleanFalse, BYBuddyNotBackedUpIdentifier);
    CFPreferencesSetAppValue(CFSTR("CloudConfigPresented"), kCFBooleanTrue, BYBuddyNotBackedUpIdentifier);
    CFPreferencesAppSynchronize(BYBuddyNotBackedUpIdentifier);
    _CFPreferencesFlushCachesForIdentifier(BYSetupAssistantBundleIdentifier, kCFPreferencesCurrentUser);
    _CFPreferencesFlushCachesForIdentifier(BYBuddyNotBackedUpIdentifier, kCFPreferencesCurrentUser);
    -[SetupController _commitAnalytics](v38, "_commitAnalytics");
  }
}

- (void)didMarkBuddyComplete
{
  NSObject *v2;
  os_log_type_t v3;
  BYEnvironment *v4;
  id v5;
  BYEnvironment *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  __CFNotificationCenter *center;
  uint8_t v13[7];
  os_log_type_t v14;
  os_log_t v15;
  uint8_t buf[7];
  os_log_type_t v17;
  os_log_t oslog[2];
  SetupController *v19;

  v19 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v17;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Performing any work after marking buddy as complete...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  CFPreferencesSetValue(CFSTR("BuddySetupDone"), kCFBooleanTrue, CFSTR("com.apple.keyboard"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFPreferencesSynchronize(CFSTR("com.apple.keyboard"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  -[SetupController checkForUpdatedCarrierBundle](v19, "checkForUpdatedCarrierBundle");
  v4 = -[SetupController environment](v19, "environment");
  v5 = -[BYEnvironment managedConfiguration](v4, "managedConfiguration");
  objc_msgSend(v5, "setupAssistantDidFinish");

  v6 = -[SetupController environment](v19, "environment");
  v7 = -[BYEnvironment mdmReturnToServiceController](v6, "mdmReturnToServiceController");
  objc_msgSend(v7, "returnToServiceFlowCompleted");

  v8 = BYSetLaunchSentinel(0);
  v15 = (os_log_t)(id)_BYLoggingFacility(v8);
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v15;
    v10 = v14;
    sub_100038C3C(v13);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Posting buddy finished...", v13, 2u);
  }
  objc_storeStrong((id *)&v15, 0);
  v11 = +[BYSetupStateNotifier sharedNotifier](BYSetupStateNotifier, "sharedNotifier");
  objc_msgSend(v11, "notifyStateChangedTo:", 2);

  BYObserveFinishSetupTriggers();
  center = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(center, v19);
  -[BuddyLanguageChangeObserver stopObservingLanguageChanges](v19->_languageObserver, "stopObservingLanguageChanges");
}

- (void)_exitBuddyForDemoSetUp
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD v5[3];
  char v6;
  os_log_t oslog[2];
  SetupController *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[SetupController shouldEndLifecycleForCause:](self, "shouldEndLifecycleForCause:", 2);
  if (v2)
  {
    -[SetupController willEndLifecycleDueToCause:allowDismissal:](v8, "willEndLifecycleDueToCause:allowDismissal:", 2, 1);
    -[SetupController endLifecycleDueToCause:](v8, "endLifecycleDueToCause:", 2);
  }
  else
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v2);
    v6 = 16;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      v3 = oslog[0];
      v4 = v6;
      sub_100038C3C(v5);
      _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "Unable to exit buddy for demo setup!", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

- (void)_prepareForCloudRestoreReboot
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD v5[3];
  char v6;
  os_log_t oslog[2];
  SetupController *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[SetupController shouldEndLifecycleForCause:](self, "shouldEndLifecycleForCause:", 3);
  if (v2)
  {
    -[SetupController willEndLifecycleDueToCause:allowDismissal:](v8, "willEndLifecycleDueToCause:allowDismissal:", 3, 0);
    -[SetupController endLifecycleDueToCause:](v8, "endLifecycleDueToCause:", 3);
  }
  else
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v2);
    v6 = 16;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      v3 = oslog[0];
      v4 = v6;
      sub_100038C3C(v5);
      _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "Unable to exit buddy for iCloud restore!", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

- (void)_prepareForMigrationReboot
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD v5[3];
  char v6;
  os_log_t oslog[2];
  SetupController *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[SetupController shouldEndLifecycleForCause:](self, "shouldEndLifecycleForCause:", 4);
  if (v2)
  {
    -[SetupController willEndLifecycleDueToCause:allowDismissal:](v8, "willEndLifecycleDueToCause:allowDismissal:", 4, 0);
    -[SetupController endLifecycleDueToCause:](v8, "endLifecycleDueToCause:", 4);
  }
  else
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v2);
    v6 = 16;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      v3 = oslog[0];
      v4 = v6;
      sub_100038C3C(v5);
      _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "Unable to exit buddy for migration!", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

- (void)_willEndLifecycleForDataTransfer
{
  AALoginPluginManager *v2;
  BYEnvironment *v3;
  id v4;
  BYEnvironment *v5;
  id v6;
  id v7;
  BYEnvironment *v8;
  id v9;
  NSDate *v10;
  BYEnvironment *v11;
  id v12;
  id v13;
  BYEnvironment *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t i;
  BYEnvironment *v20;
  id v21;
  id v22;
  BYEnvironment *v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  BYEnvironment *v29;
  id v30;
  uint8_t buf[15];
  os_log_type_t v32;
  os_log_t oslog;
  _QWORD __b[8];
  uint64_t v35;
  id location[2];
  SetupController *v37;
  id v38;
  _BYTE v39[128];

  v37 = self;
  location[1] = (id)a2;
  -[SetupController _stashAnalytics](self, "_stashAnalytics");
  v2 = +[AALoginPluginManager sharedInstance](AALoginPluginManager, "sharedInstance");
  -[AALoginPluginManager unstashLoginResponse](v2, "unstashLoginResponse");

  v3 = -[SetupController environment](v37, "environment");
  v4 = -[BYEnvironment settingsManager](v3, "settingsManager");
  v5 = -[SetupController environment](v37, "environment");
  v6 = -[BYEnvironment flowSkipController](v5, "flowSkipController");
  v7 = objc_msgSend(v6, "getFlowSkipIdentifiers");
  objc_msgSend(v4, "stashFlowSkipIdentifiers:", v7);

  v8 = -[SetupController environment](v37, "environment");
  v9 = -[BYEnvironment buddyPreferences](v8, "buddyPreferences");
  v10 = +[NSDate date](NSDate, "date");
  objc_msgSend(v9, "setObject:forKey:", v10, BYBuddyLastExitKey);

  v11 = -[SetupController environment](v37, "environment");
  v12 = -[BYEnvironment settingsManager](v11, "settingsManager");
  v38 = (id)_AXSCopySettingsDataBlobForBuddy();
  v13 = v38;
  objc_msgSend(v12, "stashAccessibilityData:", v13);

  v14 = -[SetupController environment](v37, "environment");
  v15 = -[BYEnvironment buddyPreferences](v14, "buddyPreferences");
  location[0] = objc_msgSend(v15, "preferences");

  memset(__b, 0, sizeof(__b));
  v16 = objc_msgSend(location[0], "allKeys");
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
  if (v17)
  {
    v18 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v17; ++i)
      {
        if (*(_QWORD *)__b[2] != v18)
          objc_enumerationMutation(v16);
        v35 = *(_QWORD *)(__b[1] + 8 * i);
        v20 = -[SetupController environment](v37, "environment");
        v21 = -[BYEnvironment settingsManager](v20, "settingsManager");
        v22 = objc_msgSend(location[0], "objectForKeyedSubscript:", v35);
        v23 = -[SetupController environment](v37, "environment");
        v24 = -[BYEnvironment buddyPreferences](v23, "buddyPreferences");
        v25 = objc_msgSend(v24, "domain");
        objc_msgSend(v21, "setObject:forDomain:key:", v22, v25, v35);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v39, 16);
    }
    while (v17);
  }

  oslog = (os_log_t)(id)_BYLoggingFacility(v26);
  v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v27 = oslog;
    v28 = v32;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Stashing settings into the safe haven...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v29 = -[SetupController environment](v37, "environment");
  v30 = -[BYEnvironment settingsManager](v29, "settingsManager");
  objc_msgSend(v30, "hideStashInSafeHaven");

  objc_storeStrong(location, 0);
}

- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5
{
  NSUserDefaults *v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  BYEnvironment *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  NSArray *v17;
  id v18;
  BYEnvironment *v19;
  id v20;
  id v21;
  char v22;
  id v23;
  int v24;
  char v25;
  id v26;
  uint8_t v27[7];
  os_log_type_t v28;
  os_log_t v29;
  uint8_t buf[7];
  os_log_type_t v31;
  os_log_t oslog;
  char v33;
  id v34;
  char v35;
  NSUserDefaults *v36;
  BOOL v37;
  BOOL v38;
  BOOL v39;
  id location[2];
  SetupController *v41;

  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = a4;
  v38 = a5;
  v37 = 0;
  v7 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v8 = -[NSUserDefaults objectForKey:](v7, "objectForKey:", CFSTR("LockdownSetLanguage"));
  v35 = 0;
  v33 = 0;
  v9 = 1;
  if (!v8)
  {
    v36 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v35 = 1;
    v34 = -[NSUserDefaults objectForKey:](v36, "objectForKey:", CFSTR("LockdownSetLocale"));
    v33 = 1;
    v9 = v34 != 0;
  }
  if ((v33 & 1) != 0)

  if ((v35 & 1) != 0)
  v37 = v9;
  if (v9)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v10);
    v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = oslog;
      v12 = v31;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Language observer: Lockdown has overridden values will push without deferring transitions…", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[BFFNavigationController setPushWithoutDeferringTransitionsWhileInBackground:](v41->_nav, "setPushWithoutDeferringTransitionsWhileInBackground:", 1);
    v13 = -[SetupController environment](v41, "environment");
    v14 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v13, "buddyPreferencesExcludedFromBackup");
    objc_msgSend(v14, "setObject:forKey:persistImmediately:", &__kCFBooleanTrue, CFSTR("PushWithoutDeferringTransitionsWhileInBackground"), 1);

  }
  v29 = (os_log_t)(id)_BYLoggingFacility(v10);
  v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v29;
    v16 = v28;
    sub_100038C3C(v27);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Language observer: changed", v27, 2u);
  }
  objc_storeStrong((id *)&v29, 0);
  if (!v39)
    goto LABEL_27;
  v17 = +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
  v26 = -[NSArray firstObject](v17, "firstObject");

  v25 = 0;
  v25 = (objc_msgSend(v26, "isEqualToString:", v41->_languageAtStartup) ^ 1) & 1;
  if (v25)
  {
    -[SetupController respring](v41, "respring");
    v24 = 1;
  }
  else
  {
    v24 = 0;
  }
  objc_storeStrong(&v26, 0);
  if (!v24)
  {
LABEL_27:
    if (!v38)
      goto LABEL_23;
    v23 = (id)CFPreferencesCopyValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    v22 = 0;
    v22 = !-[NSString isEqualToString:](v41->_localeIdentifierAtStartup, "isEqualToString:", v23);
    if (v22)
    {
      v18 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", v23);
      v21 = objc_msgSend(v18, "countryCode");

      -[SetupController _writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:](v41, "_writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:", v21);
      v19 = -[SetupController environment](v41, "environment");
      v20 = -[BYEnvironment capabilities](v19, "capabilities");
      objc_msgSend(v20, "eligibilitySetDeviceLocale:", v21);

      -[SetupController respring](v41, "respring");
      v24 = 1;
      objc_storeStrong(&v21, 0);
    }
    else
    {
      v24 = 0;
    }
    objc_storeStrong(&v23, 0);
    if (!v24)
LABEL_23:
      v24 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)respring
{
  id v2;
  NSSet *v3;
  id location[2];
  SetupController *v5;

  v5 = self;
  location[1] = (id)a2;
  SBSLockDevice(0, 0);
  -[BFFWindow setUserInteractionEnabled:](v5->_window, "setUserInteractionEnabled:", 0);
  location[0] = +[SBSRelaunchAction actionWithReason:options:targetURL:](SBSRelaunchAction, "actionWithReason:options:targetURL:", CFSTR("Language change remotely"), 6, 0);
  v2 = +[FBSSystemService sharedService](FBSSystemService, "sharedService");
  v3 = +[NSSet setWithObject:](NSSet, "setWithObject:", location[0]);
  objc_msgSend(v2, "sendActions:withResult:", v3, 0);

  objc_storeStrong(location, 0);
}

- (BOOL)isAlertPresented:(id)a3
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  id location[2];
  SetupController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SetupController navigationController](v9, "navigationController");
  v4 = objc_msgSend(v3, "topViewController");
  v5 = objc_msgSend(v4, "presentedViewController");
  v6 = v5 == location[0];

  objc_storeStrong(location, 0);
  return v6;
}

- (void)dismissAlert:(id)a3 animated:(BOOL)a4
{
  id location[2];
  SetupController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SetupController dismissAlert:animated:completion:](v6, "dismissAlert:animated:completion:", location[0], a4, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissAlert:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  BOOL v9;
  id location[2];
  SetupController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = 0;
  objc_storeStrong(&v8, a5);
  if (!-[SetupController isAlertPresented:](v11, "isAlertPresented:", location[0])
    || (objc_msgSend(location[0], "isBeingDismissed") & 1) != 0)
  {
    if (v8)
      (*((void (**)(void))v8 + 2))();
  }
  else
  {
    v7 = objc_msgSend(location[0], "presentingViewController");
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v9, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_menuButtonPressed
{
  NSObject *v2;
  os_log_type_t v3;
  BuddyNavigationFlowController *v4;
  char v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  BuddyNavigationFlowController *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  UIAlertController *v20;
  UIAlertController *homeButtonMenuController;
  UIAlertController *v22;
  NSBundle *v23;
  id v24;
  UIAlertAction *v25;
  BOOL v26;
  UIAlertController *v27;
  NSBundle *v28;
  id v29;
  UIAlertAction *v30;
  BYEnvironment *v31;
  id v32;
  BOOL showWiFiInMenu;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  BuddyNavigationFlowController *v38;
  BuddyWiFiController *v39;
  id v40;
  id v41;
  NSBundle *v42;
  id v43;
  id v44;
  id v45;
  NSBundle *v46;
  id v47;
  id v48;
  UIAlertController *v49;
  UIAlertAction *v50;
  unsigned __int8 v51;
  UIAlertController *v52;
  NSBundle *v53;
  id v54;
  UIAlertAction *v55;
  UIAlertController *v56;
  NSBundle *v57;
  id v58;
  UIAlertAction *v59;
  uint64_t v60;
  UIAlertController *v61;
  NSBundle *v62;
  id v63;
  UIAlertAction *v64;
  uint64_t has_internal_ui;
  uint64_t v66;
  id v67;
  unsigned __int8 v68;
  UIAlertController *v69;
  UIAlertAction *v70;
  const __CFString *v71;
  NSBundle *v72;
  UIAlertController *v73;
  UIAlertAction *v74;
  id v75;
  _BOOL8 v76;
  NSObject *v77;
  os_log_type_t v78;
  _WORD v79[7];
  os_log_type_t v80;
  os_log_t oslog;
  void **v82;
  int v83;
  int v84;
  void (*v85)(id *, void *);
  void *v86;
  SetupController *v87;
  id v88;
  void **v89;
  int v90;
  int v91;
  void (*v92)(NSObject *, void *);
  void *v93;
  SetupController *v94;
  void **v95;
  int v96;
  int v97;
  void (*v98)(NSObject *, void *);
  void *v99;
  SetupController *v100;
  char v101;
  id v102;
  char v103;
  void **v104;
  int v105;
  int v106;
  void (*v107)(NSObject *, void *);
  void *v108;
  SetupController *v109;
  char v110;
  id v111;
  id v112;
  void **v113;
  int v114;
  int v115;
  void (*v116)(NSObject *, void *);
  void *v117;
  SetupController *v118;
  id v119;
  char v120;
  id v121;
  char v122;
  id v123;
  id v124;
  void **v125;
  int v126;
  int v127;
  void (*v128)(NSObject *, void *);
  void *v129;
  SetupController *v130;
  char v132;
  id v133;
  char v134;
  NSBundle *v135;
  id v136;
  id v137;
  id v138;
  id v139;
  char v140;
  id v141;
  char v142;
  id v143;
  uint8_t buf[7];
  os_log_type_t v145;
  id location[2];
  SetupController *v147;

  v147 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v145 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v145;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Menu requested", buf, 2u);
  }
  objc_storeStrong(location, 0);
  v4 = -[SetupController navigationFlowController](v147, "navigationFlowController");
  v142 = 0;
  v140 = 0;
  v5 = 0;
  if (!-[BuddyNavigationFlowController isStartOverAllowed](v4, "isStartOverAllowed"))
  {
    v143 = -[SetupController navigationController](v147, "navigationController");
    v142 = 1;
    v141 = objc_msgSend(v143, "topViewController");
    v140 = 1;
    v6 = objc_opt_class(BuddyMesaEnrollmentController);
    v5 = objc_opt_isKindOfClass(v141, v6) ^ 1;
  }
  if ((v140 & 1) != 0)

  if ((v142 & 1) != 0)
  if ((v5 & 1) == 0 && !v147->_emergencyDialer)
  {
    v7 = -[SetupController navigationController](v147, "navigationController");
    v8 = objc_msgSend(v7, "topViewController");
    v139 = objc_msgSend(v8, "presentedViewController");

    v9 = objc_opt_class(UIAlertController);
    if ((objc_opt_isKindOfClass(v139, v9) & 1) != 0)
      v10 = v139;
    else
      v10 = 0;
    objc_storeStrong(&v139, v10);
    if (v147->_homeButtonMenuController)
    {
      -[SetupController dismissAlert:animated:](v147, "dismissAlert:animated:", v147->_homeButtonMenuController, 1);
      -[SetupController _removeSBAlertItemsSupressionAssertion](v147, "_removeSBAlertItemsSupressionAssertion");
      objc_storeStrong((id *)&v147->_homeButtonMenuController, 0);
    }
    else if (!v139)
    {
      if (v147->_buddyDone)
      {
        v76 = -[SetupController allowDismissalForExit](v147, "allowDismissalForExit");
        if (v76)
        {
          -[SetupController endLifecycleDueToCause:](v147, "endLifecycleDueToCause:", 1);
        }
        else
        {
          oslog = (os_log_t)(id)_BYLoggingFacility(v76);
          v80 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            v77 = oslog;
            v78 = v80;
            sub_100038C3C(v79);
            _os_log_impl((void *)&_mh_execute_header, v77, v78, "Preventing lifecycle end as dismissal is not allowed", (uint8_t *)v79, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
      }
      else
      {
        v11 = +[BuddySIMManager sharedManager](BuddySIMManager, "sharedManager");
        objc_msgSend(v11, "disallowSIMUnlock");

        v12 = -[SetupController navigationFlowController](v147, "navigationFlowController");
        v138 = -[BuddyNavigationFlowController topFlowItem](v12, "topFlowItem");

        v137 = 0;
        v13 = objc_opt_respondsToSelector(v138, "displayLanguage");
        if ((v13 & 1) != 0)
        {
          v15 = objc_msgSend(v138, "displayLanguage");
          v16 = v137;
          v137 = v15;

        }
        v134 = 0;
        v132 = 0;
        if ((BFFIsiPad(v13, v14) & 1) != 0)
        {
          v135 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v134 = 1;
          v17 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("SETUP_INCOMPLETE_IPAD"), CFSTR("Localizable"));
          v133 = v17;
          v132 = 1;
        }
        else
        {
          v17 = 0;
        }
        v18 = v17;
        v136 = v18;
        if ((v132 & 1) != 0)

        if ((v134 & 1) != 0)
        v20 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v136, 0, (BFFIsiPad(v18, v19) & 1) != 0);
        homeButtonMenuController = v147->_homeButtonMenuController;
        v147->_homeButtonMenuController = v20;

        if (MGGetBoolAnswer(CFSTR("CellularTelephonyCapability")) & 1)
        {
          v22 = v147->_homeButtonMenuController;
          v23 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v24 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("EMERGENCY_CALL"), CFSTR("Localizable"));
          v125 = _NSConcreteStackBlock;
          v126 = -1073741824;
          v127 = 0;
          v128 = sub_1000418C0;
          v129 = &unk_100280A28;
          v130 = v147;
          v25 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 2, &v125);
          -[UIAlertController addAction:](v22, "addAction:", v25);

          -[SetupController _addSBAlertItemsSupressionAssertion](v147, "_addSBAlertItemsSupressionAssertion");
          objc_storeStrong((id *)&v130, 0);
        }
        v124 = +[BuddyAccessibilityUtilities accessibilityViewController](BuddyAccessibilityUtilities, "accessibilityViewController");
        v122 = 0;
        v120 = 0;
        v26 = 0;
        if (v124)
        {
          v123 = -[SetupController navigationController](v147, "navigationController");
          v122 = 1;
          v121 = objc_msgSend(v123, "presentedViewController");
          v120 = 1;
          v26 = v121 == 0;
        }
        if ((v120 & 1) != 0)

        if ((v122 & 1) != 0)
        if (v26)
        {
          v27 = v147->_homeButtonMenuController;
          v28 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v29 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("ACCESSIBILITY_OPTIONS"), CFSTR("Localizable"));
          v113 = _NSConcreteStackBlock;
          v114 = -1073741824;
          v115 = 0;
          v116 = sub_100041B38;
          v117 = &unk_100280A50;
          v118 = v147;
          v119 = v124;
          v30 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v29, 0, &v113);
          -[UIAlertController addAction:](v27, "addAction:", v30);

          objc_storeStrong(&v119, 0);
          objc_storeStrong((id *)&v118, 0);
        }
        v112 = 0;
        v31 = -[SetupController environment](v147, "environment");
        v32 = -[BYEnvironment networkProvider](v31, "networkProvider");
        v110 = 0;
        showWiFiInMenu = 0;
        if ((objc_msgSend(v32, "supportsWiFi") & 1) != 0)
        {
          v111 = -[BFFNavigationController presentedViewController](v147->_nav, "presentedViewController");
          v110 = 1;
          showWiFiInMenu = 0;
          if (!v111)
            showWiFiInMenu = v147->_showWiFiInMenu;
        }
        if ((v110 & 1) != 0)

        if (showWiFiInMenu)
        {
          v36 = -[SetupController navigationController](v147, "navigationController");
          v37 = objc_msgSend(v36, "topViewController");
          v38 = -[SetupController navigationFlowController](v147, "navigationFlowController");
          v39 = -[BuddyNavigationFlowController wifiController](v38, "wifiController");
          v40 = -[BuddyWiFiController viewController](v39, "viewController");

          if (v37 == v40)
          {
            v41 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("WIFI_SETTINGS"));
            v42 = +[NSBundle mainBundle](NSBundle, "mainBundle");
            v43 = (id)SFLocalizedStringFromTableInBundleForLanguage(v41, CFSTR("Localizable"));
            v44 = v112;
            v112 = v43;

          }
          else if (!v147->_wifiControllerInAdvancedMode)
          {
            v45 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("MORE_WIFI_SETTINGS"));
            v46 = +[NSBundle mainBundle](NSBundle, "mainBundle");
            v47 = (id)SFLocalizedStringFromTableInBundleForLanguage(v45, CFSTR("Localizable"));
            v48 = v112;
            v112 = v47;

          }
        }
        if (v112)
        {
          v49 = v147->_homeButtonMenuController;
          v104 = _NSConcreteStackBlock;
          v105 = -1073741824;
          v106 = 0;
          v107 = sub_100041C68;
          v108 = &unk_100280A28;
          v109 = v147;
          v50 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v112, 0, &v104);
          -[UIAlertController addAction:](v49, "addAction:", v50);

          objc_storeStrong((id *)&v109, 0);
        }
        v103 = 0;
        v101 = 0;
        v51 = 0;
        if ((BYSetupAssistantHasCompletedInitialRun(v34, v35) & 1) == 0)
        {
          v102 = -[SetupController navigationFlowController](v147, "navigationFlowController");
          v101 = 1;
          v51 = objc_msgSend(v102, "isStartOverAllowed");
        }
        if ((v101 & 1) != 0)

        v103 = v51 & 1;
        if ((v51 & 1) != 0)
        {
          v52 = v147->_homeButtonMenuController;
          v53 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v54 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("START_OVER"), CFSTR("Localizable"));
          v95 = _NSConcreteStackBlock;
          v96 = -1073741824;
          v97 = 0;
          v98 = sub_100041D6C;
          v99 = &unk_100280A28;
          v100 = v147;
          v55 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v54, 0, &v95);
          -[UIAlertController addAction:](v52, "addAction:", v55);

          objc_storeStrong((id *)&v100, 0);
        }
        if (+[BuddyMenuController supportsHomeGesture](BuddyMenuController, "supportsHomeGesture"))
        {
          v56 = v147->_homeButtonMenuController;
          v57 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v58 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("SHUT_DOWN"), CFSTR("Localizable"));
          v89 = _NSConcreteStackBlock;
          v90 = -1073741824;
          v91 = 0;
          v92 = sub_100041F5C;
          v93 = &unk_100280A28;
          v94 = v147;
          v59 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v58, 0, &v89);
          -[UIAlertController addAction:](v56, "addAction:", v59);

          objc_storeStrong((id *)&v94, 0);
        }
        if ((+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession") & 1) != 0)
        {
          v61 = v147->_homeButtonMenuController;
          v62 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v63 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("LOG_OUT"), CFSTR("Localizable"));
          v64 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v63, 0, &stru_100280A90);
          -[UIAlertController addAction:](v61, "addAction:", v64);

        }
        has_internal_ui = os_variant_has_internal_ui("com.apple.purplebuddy", v60);
        if ((has_internal_ui & 1) != 0)
        {
          v67 = +[BYPreferencesController buddyPreferencesEphemeral](BYPreferencesController, "buddyPreferencesEphemeral");
          v68 = objc_msgSend(v67, "BOOLForKey:", CFSTR("showInternalUI"));

          v69 = v147->_homeButtonMenuController;
          if ((v68 & 1) != 0)
            v70 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Hide Internal UI"), 0, &stru_100280AD0);
          else
            v70 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Show Internal UI"), 0, &stru_100280AF0);
          -[UIAlertController addAction:](v69, "addAction:", v70);

        }
        if ((BFFIsiPad(has_internal_ui, v66) & 1) != 0)
          v71 = CFSTR("CONTINUE");
        else
          v71 = CFSTR("CANCEL");
        v72 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v88 = (id)SFLocalizedStringFromTableInBundleForLanguage(v71, CFSTR("Localizable"));

        v73 = v147->_homeButtonMenuController;
        v82 = _NSConcreteStackBlock;
        v83 = -1073741824;
        v84 = 0;
        v85 = sub_1000423F0;
        v86 = &unk_100280A28;
        v87 = v147;
        v74 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v88, 1, &v82);
        -[UIAlertController addAction:](v73, "addAction:", v74);

        v75 = -[SetupController navigationController](v147, "navigationController");
        objc_msgSend(v75, "buddy_presentAlertController:", v147->_homeButtonMenuController);

        objc_storeStrong((id *)&v87, 0);
        objc_storeStrong(&v88, 0);
        objc_storeStrong(&v112, 0);
        objc_storeStrong(&v124, 0);
        objc_storeStrong(&v136, 0);
        objc_storeStrong(&v137, 0);
        objc_storeStrong(&v138, 0);
      }
    }
    objc_storeStrong(&v139, 0);
  }
}

- (void)_showModalWiFiSettings
{
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  id v5;
  BuddyNavigationFlowController *v6;
  BuddyWiFiController *v7;
  id v8;
  BuddyNavigationFlowController *v9;
  BuddyWiFiController *v10;
  id v11;
  WFNetworkListController *v12;
  WFNetworkListController *modalWifiManager;
  id v14;
  NSBundle *v15;
  NSString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  double v24;
  BuddyNavigationFlowController *v25;
  id v26;
  id v27;
  void **v28;
  int v29;
  int v30;
  id (*v31)(uint64_t);
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[7];
  os_log_type_t v40;
  id location[2];
  SetupController *v42;

  v42 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v40;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Manage WiFi.", buf, 2u);
  }
  objc_storeStrong(location, 0);
  v4 = -[SetupController navigationController](v42, "navigationController");
  v5 = objc_msgSend(v4, "topViewController");
  v6 = -[SetupController navigationFlowController](v42, "navigationFlowController");
  v7 = -[BuddyNavigationFlowController wifiController](v6, "wifiController");
  v8 = -[BuddyWiFiController viewController](v7, "viewController");

  if (v5 == v8)
  {
    v9 = -[SetupController navigationFlowController](v42, "navigationFlowController");
    v10 = -[BuddyNavigationFlowController wifiController](v9, "wifiController");
    -[BuddyWiFiController setShowNetworkSettings:](v10, "setShowNetworkSettings:", 1);

    v42->_wifiControllerInAdvancedMode = 1;
  }
  else
  {
    v38 = objc_alloc_init((Class)sub_1000428F0());
    objc_msgSend(v38, "setShowNetworkSettings:", 1);
    v11 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
    objc_msgSend(v38, "setSupportsCellularActivation:", objc_msgSend(v11, "supportsCellularActivation"));

    objc_msgSend(v38, "setBuddyDelegate:", v42);
    v12 = (WFNetworkListController *)objc_msgSend(objc_alloc((Class)sub_1000429DC()), "initWithViewController:", v38);
    modalWifiManager = v42->_modalWifiManager;
    v42->_modalWifiManager = v12;

    v14 = objc_alloc((Class)UIBarButtonItem);
    v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_100284738, CFSTR("Localizable"));
    v17 = objc_msgSend(v14, "initWithTitle:style:target:action:", v16, 2, v42, "_modalWifiControllerDone:");
    v18 = -[WFNetworkListController viewController](v42->_modalWifiManager, "viewController");
    v19 = objc_msgSend(v18, "navigationItem");
    objc_msgSend(v19, "setRightBarButtonItem:", v17);

    v37 = objc_msgSend(v38, "buddy_animationController:", CFSTR("WIFI"));
    v20 = objc_alloc((Class)BFFNavigationController);
    v21 = -[WFNetworkListController viewController](v42->_modalWifiManager, "viewController");
    v36 = objc_msgSend(v20, "initWithRootViewController:", v21);

    v22 = -[SetupController navigationController](v42, "navigationController");
    objc_msgSend(v22, "forcedPreferredContentSize");
    *(double *)&v35 = v23;
    *((double *)&v35 + 1) = v24;
    v34 = v35;
    objc_msgSend(v36, "setForcedPreferredContentSize:", v23, v24);

    v25 = -[SetupController navigationFlowController](v42, "navigationFlowController");
    objc_msgSend(v36, "setDelegate:", v25);

    v26 = -[SetupController navigationController](v42, "navigationController");
    objc_msgSend(v36, "setModalPresentationStyle:", objc_msgSend(v26, "modalPresentationStyle"));

    v27 = -[SetupController navigationController](v42, "navigationController");
    v28 = _NSConcreteStackBlock;
    v29 = -1073741824;
    v30 = 0;
    v31 = sub_100042AC8;
    v32 = &unk_100280730;
    v33 = v37;
    objc_msgSend(v27, "presentViewController:animated:completion:", v36, 1, &v28);

    -[WFNetworkListController startScanning](v42->_modalWifiManager, "startScanning");
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
}

- (void)_modalWifiControllerDone:(id)a3
{
  id v3;
  id location[2];
  SetupController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SetupController navigationController](v5, "navigationController");
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_storeStrong(location, 0);
}

- (void)_addSBAlertItemsSupressionAssertion
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  _WORD v5[3];
  os_log_type_t v6;
  os_log_t oslog[2];
  SetupController *v8;

  v8 = self;
  oslog[1] = (os_log_t)a2;
  if (!self->_sbAlertItemsSuppressionAssertion)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
    v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = oslog[0];
      v3 = v6;
      sub_100038C3C(v5);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Adding SBSAlertItemsSuppressionAssertion!", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    v4 = SBSAlertItemsSuppressionAssertionCreate(0, CFSTR("Emergency dialer or Action Sheet up"));
    v8->_sbAlertItemsSuppressionAssertion = (SBSAlertItemsSuppressionAssertion *)v4;
  }
}

- (void)_removeSBAlertItemsSupressionAssertion
{
  NSObject *v2;
  os_log_type_t v3;
  _WORD v4[3];
  os_log_type_t v5;
  os_log_t oslog[2];
  SetupController *v7;

  v7 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_sbAlertItemsSuppressionAssertion)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
    v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = oslog[0];
      v3 = v5;
      sub_100038C3C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Removing SBSAlertItemsSuppressionAssertion!", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    CFRelease(v7->_sbAlertItemsSuppressionAssertion);
    v7->_sbAlertItemsSuppressionAssertion = 0;
  }
}

- (void)dialerDidDismiss:(id)a3
{
  id v3;
  BYEnvironment *v4;
  id v5;
  unsigned __int8 v6;
  BYEnvironment *v7;
  id v8;
  id location[2];
  SetupController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SetupController _removeSBAlertItemsSupressionAssertion](v10, "_removeSBAlertItemsSupressionAssertion");
  objc_storeStrong((id *)&v10->_emergencyDialer, 0);
  v3 = +[BuddySIMManager sharedManager](BuddySIMManager, "sharedManager");
  objc_msgSend(v3, "allowSIMUnlock");

  v4 = -[SetupController environment](v10, "environment");
  v5 = -[BYEnvironment proximitySetupController](v4, "proximitySetupController");
  v6 = objc_msgSend(v5, "shouldEnableProximity");

  if ((v6 & 1) != 0)
  {
    v7 = -[SetupController environment](v10, "environment");
    v8 = -[BYEnvironment proximitySetupController](v7, "proximitySetupController");
    objc_msgSend(v8, "beginAdvertisingProximitySetup");

  }
  objc_storeStrong(location, 0);
}

- (void)_setupSnapshotRemoved
{
  NSObject *v2;
  os_log_type_t v3;
  unsigned __int8 v4;
  dispatch_time_t v5;
  void *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  SetupController *v12;
  char v13;
  uint8_t buf[7];
  os_log_type_t v15;
  os_log_t oslog[2];
  SetupController *v17;

  v17 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v15;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "SpringBoard removed the screen snapshot", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v13 = 0;
  v4 = 1;
  if (!v17->_shouldAnimateLocaleScreen)
    v4 = -[SetupController shouldProceedFromAppearancePane](v17, "shouldProceedFromAppearancePane");
  v13 = v4 & 1;
  if ((v4 & 1) != 0)
  {
    v5 = dispatch_time(0, 1000000000);
    v6 = &_dispatch_main_q;
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_100042F50;
    v11 = &unk_100280730;
    v12 = v17;
    dispatch_after(v5, (dispatch_queue_t)v6, &v7);

    objc_storeStrong((id *)&v12, 0);
  }
}

- (void)_setupStateChanged
{
  NSObject *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  SetupController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1000430B8;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_showMiniAlertWithRestart:(BOOL)a3 withLanguage:(id)a4
{
  NSBundle *v4;
  id v5;
  id v6;
  NSDictionary *v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void **v12;
  int v13;
  int v14;
  id *(*v15)(id *);
  void *v16;
  SetupController *v17;
  BOOL v18;
  id v19[3];
  id v20;
  id v21;
  id v22;
  id obj;
  id location;
  BOOL v25;
  SEL v26;
  SetupController *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSAttributedStringKey v32;
  id v33;

  v27 = self;
  v26 = a2;
  v25 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  obj = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("SETTING_LANGUAGE"), CFSTR("Localizable"));

  v22 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v22, "pointSize");
  v21 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
  v5 = objc_alloc((Class)NSMutableAttributedString);
  v6 = sub_10012A4C4(obj, location);
  v20 = objc_msgSend(v5, "initWithAttributedString:", v6);

  v32 = NSFontAttributeName;
  v33 = v21;
  v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v8 = objc_msgSend(v20, "length");
  v29 = 0;
  v28 = v8;
  v30 = 0;
  v31 = v8;
  v19[2] = v8;
  v19[1] = 0;
  objc_msgSend(v20, "addAttributes:range:", v7, 0, v8);

  v19[0] = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  objc_msgSend(v19[0], "_setAttributedTitle:", v20);
  v9 = -[SetupController navigationController](v27, "navigationController");
  v10 = objc_msgSend(v9, "topViewController");
  v11 = v25;
  v12 = _NSConcreteStackBlock;
  v13 = -1073741824;
  v14 = 0;
  v15 = sub_10004361C;
  v16 = &unk_100280B18;
  v18 = v25;
  v17 = v27;
  objc_msgSend(v10, "presentViewController:animated:completion:", v19[0], v11, &v12);

  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&location, 0);
}

- (void)_languageChangeAlertDone
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v3;
  __CFNotificationCenter *v4;
  id v5;
  NSSet *v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleLanguagePreferencesChangedNotification"), 0, 0, 1u);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v3, CFSTR("com.apple.language.changed"), 0, 0, 1u);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v4, BYSetupAssistantDidCompleteLanguageLocaleNotification, 0, 0, 1u);
  location[0] = +[SBSRelaunchAction actionWithReason:options:targetURL:](SBSRelaunchAction, "actionWithReason:options:targetURL:", CFSTR("Language change in Setup Assistant"), 6, 0);
  v5 = +[FBSSystemService sharedService](FBSSystemService, "sharedService");
  v6 = +[NSSet setWithObject:](NSSet, "setWithObject:", location[0]);
  objc_msgSend(v5, "sendActions:withResult:", v6, 0);

  objc_storeStrong(location, 0);
}

- (void)userDidChooseLanguage
{
  NSObject *v2;
  os_log_type_t v3;
  id location;
  uint8_t buf[7];
  os_log_type_t v6;
  os_log_t oslog[3];

  oslog[2] = &self->super;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v6;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Setting up QR code control center module...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  location = objc_alloc_init((Class)sub_100043828());
  objc_msgSend(location, "setUpQRCodeControlCenterModuleWithCompletionHandler:", &stru_100280B58);
  objc_storeStrong(&location, 0);
}

- (BOOL)_didRestoreIniTunes
{
  id v2;
  BOOL v3;

  v2 = +[BYSetupStateManager sharedManager](BYSetupStateManager, "sharedManager", a2, self);
  v3 = objc_msgSend(v2, "restoreType") == (id)1;

  return v3;
}

- (BOOL)_restoreFromBackupJustFinished
{
  id v2;
  double v3;
  BOOL v4;
  os_log_t oslog;
  double v7;
  id location;
  id v9;
  id v10[3];
  uint8_t buf[24];

  v10[2] = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init((Class)MBManager);
  v9 = objc_msgSend(v10[0], "restoreInfo");
  location = objc_msgSend(v9, "date");
  v2 = objc_msgSend(location, "timeIntervalSinceNow");
  v7 = v3;
  oslog = (os_log_t)(id)_BYLoggingFacility(v2);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100043C54((uint64_t)buf, (uint64_t)location, COERCE__INT64(v7 * -1.0));
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Last restore date = %{public}@, %lf seconds ago.", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = 0;
  if (location)
  {
    v4 = 0;
    if (v7 < 0.0)
      v4 = v7 > -600.0;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
  return v4;
}

- (void)_localeChanged
{
  id v2;
  BOOL v3;
  NSFileManager *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  NSFileManager *v8;
  os_log_t oslog;
  id location;
  int v11;
  BOOL v12;
  id v13[3];
  uint8_t buf[24];

  v13[2] = self;
  v13[1] = (id)a2;
  v13[0] = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  objc_msgSend(v13[0], "synchronize");
  v2 = objc_msgSend(v13[0], "objectForKey:", CFSTR("LockdownSetLanguage"));
  v3 = v2 != 0;

  v12 = v3;
  if (v3)
  {
    v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v5 = -[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/Warranty.html"));

    if ((v5 & 1) != 0)
    {
      v11 = 1;
    }
    else if ((BYSetupAssistantHasCompletedInitialRun(v6, v7) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      location = +[BuddyWarrantyTCController warrantyFilePath](BuddyWarrantyTCController, "warrantyFilePath");
      oslog = (os_log_t)(id)_BYLoggingFacility(location);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_10003A6BC((uint64_t)buf, (uint64_t)location, (uint64_t)CFSTR("/var/mobile/Media/iTunes_Control/iTunes/Warranty.html"));
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Copying Warranty from %{public}@ to %{public}@", buf, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v8 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
      -[NSFileManager copyItemAtPath:toPath:error:](v8, "copyItemAtPath:toPath:error:", location, CFSTR("/var/mobile/Media/iTunes_Control/iTunes/Warranty.html"), 0);

      objc_storeStrong(&location, 0);
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }
  objc_storeStrong(v13, 0);
}

- (BOOL)updateLanguageLocale:(id)a3
{
  id v3;
  BYEnvironment *v4;
  id v5;
  BYEnvironment *v6;
  id v7;
  id v8;
  id v9;
  NSBundle *v10;
  NSArray *v11;
  BYEnvironment *v12;
  id v13;
  id v14;
  NSArray *v15;
  id v16;
  id v17;
  BYEnvironment *v18;
  id v19;
  id v20;
  id v21;
  NSArray *v22;
  NSString *v23;
  NSString *v24;
  id v25;
  NSLocale *v26;
  NSString *v27;
  id v28;
  NSString *v29;
  NSString *v30;
  id v31;
  id v32;
  BYEnvironment *v33;
  id v34;
  id v35;
  NSBundle *v36;
  NSArray *v37;
  NSBundle *v38;
  NSArray *v39;
  NSArray *v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  id v44;
  char v45;
  id v46;
  BYEnvironment *v47;
  id v48;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v50;
  __CFNotificationCenter *v51;
  BYEnvironment *v52;
  id v53;
  id v54;
  id v55;
  NSNumber *v56;
  id v57;
  BYEnvironment *v58;
  id v59;
  BYEnvironment *v60;
  id v61;
  BYEnvironment *v62;
  id v63;
  CFPropertyListRef v65;
  os_log_type_t v66;
  os_log_t v67;
  int v68;
  id v69;
  os_log_type_t v70;
  os_log_t v71;
  char v72;
  id v73;
  id v74;
  os_log_type_t v75;
  os_log_t v76;
  uint8_t v77[7];
  os_log_type_t v78;
  os_log_t v79;
  os_log_type_t v80;
  os_log_t oslog;
  id v82;
  id v83;
  BOOL v84;
  id v85;
  char v86;
  char v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id location[2];
  SetupController *v96;
  char v97;
  uint8_t v98[32];
  uint8_t v99[32];
  uint8_t v100[32];
  uint8_t buf[32];
  id v102;

  v96 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v94 = (id)CFPreferencesCopyValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  v3 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", v94);
  v93 = objc_msgSend(v3, "countryCode");

  -[SetupController _writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:](v96, "_writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:", v93);
  v4 = -[SetupController environment](v96, "environment");
  v5 = -[BYEnvironment capabilities](v4, "capabilities");
  objc_msgSend(v5, "eligibilitySetDeviceLocale:", v93);

  v92 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v91 = v96->_languageAtStartup;
  v90 = 0;
  v89 = 0;
  v88 = 0;
  v87 = 1;
  v86 = 0;
  v6 = -[SetupController environment](v96, "environment");
  v7 = -[BYEnvironment proximitySetupController](v6, "proximitySetupController");
  v8 = objc_msgSend(v7, "receivedLanguages");
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizations](v10, "localizations");
    v12 = -[SetupController environment](v96, "environment");
    v13 = -[BYEnvironment proximitySetupController](v12, "proximitySetupController");
    v14 = objc_msgSend(v13, "receivedLanguages");
    v15 = +[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v11, v14);
    v16 = -[NSArray firstObject](v15, "firstObject");
    v17 = v90;
    v90 = v16;

    v87 = 0;
    v18 = -[SetupController environment](v96, "environment");
    v19 = -[BYEnvironment proximitySetupController](v18, "proximitySetupController");
    v20 = objc_msgSend(v19, "receivedLanguages");
    v21 = v88;
    v88 = v20;

    v22 = -[SetupController preferredLanguagesAtStartup](v96, "preferredLanguagesAtStartup");
    v86 = (objc_msgSend(v88, "isEqualToArray:", v22) ^ 1) & 1;

  }
  else
  {
    v23 = -[SetupController userSelectedLanguageWithLocale](v96, "userSelectedLanguageWithLocale");

    if (v23)
    {
      v24 = -[SetupController userSelectedLanguageWithLocale](v96, "userSelectedLanguageWithLocale");
      v25 = v90;
      v90 = v24;

      v26 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", v90);
      v27 = -[NSLocale regionCode](v26, "regionCode");
      v28 = v89;
      v89 = v27;

    }
    else
    {
      v29 = -[SetupController userSelectedLanguage](v96, "userSelectedLanguage");

      if (v29)
      {
        v30 = -[SetupController userSelectedLanguage](v96, "userSelectedLanguage");
        v31 = v90;
        v90 = v30;

      }
    }
  }
  if (v90 && !v88)
  {
    v102 = v90;
    v88 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v102, 1);

  }
  if (v90)
    v32 = v90;
  else
    v32 = v91;
  v85 = v32;
  v33 = -[SetupController environment](v96, "environment");
  v34 = -[BYEnvironment buddyPreferences](v33, "buddyPreferences");
  objc_msgSend(v34, "setObject:forKey:", v85, CFSTR("Language"));

  objc_msgSend(v92, "removeObjectForKey:", CFSTR("LockdownSetLanguage"));
  v35 = objc_msgSend(v92, "removeObjectForKey:", CFSTR("LockdownSetLocale"));
  v84 = 1;
  if (v90)
  {
    v35 = objc_msgSend(v91, "isEqualToString:", v90);
    if ((v35 & 1) == 0)
    {
      v36 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v37 = -[NSBundle preferredLocalizations](v36, "preferredLocalizations");
      v83 = -[NSArray firstObject](v37, "firstObject");

      v38 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v39 = -[NSBundle localizations](v38, "localizations");
      v40 = +[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v39, v88);
      v82 = -[NSArray firstObject](v40, "firstObject");

      v41 = objc_msgSend(v83, "length");
      if (v41)
      {
        v41 = objc_msgSend(v82, "length");
        if (v41)
        {
          v41 = objc_msgSend(v82, "isEqualToString:", v83);
          v84 = (v41 & 1) == 0;
        }
      }
      oslog = (os_log_t)(id)_BYLoggingFacility(v41);
      v80 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100044C74((uint64_t)buf, (uint64_t)v83, (uint64_t)v82, v84);
        _os_log_impl((void *)&_mh_execute_header, oslog, v80, "currentBundle: %{public}@; selectedBundle: %{public}@; selectedLanguageLoadsDifferentBundle? %d",
          buf,
          0x1Cu);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_storeStrong(&v82, 0);
      objc_storeStrong(&v83, 0);
    }
  }
  if ((v86 & 1) != 0)
  {
    v79 = (os_log_t)(id)_BYLoggingFacility(v35);
    v78 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v79;
      v43 = v78;
      sub_100038C3C(v77);
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Preferred languages did change (via proximity), will trigger a language restart", v77, 2u);
    }
    objc_storeStrong((id *)&v79, 0);
  }
  if (v90
    && (v35 = objc_msgSend(v91, "isEqualToString:", v90), (v35 & 1) == 0)
    && (v84 || (v86 & 1) != 0))
  {
    v67 = (os_log_t)(id)_BYLoggingFacility(v35);
    v66 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      sub_10003A6BC((uint64_t)v98, (uint64_t)v91, (uint64_t)v90);
      _os_log_impl((void *)&_mh_execute_header, v67, v66, "language changed (%{public}@ to %{public}@), prepping for restart...", v98, 0x16u);
    }
    objc_storeStrong((id *)&v67, 0);
    -[BFFWindow setUserInteractionEnabled:](v96->_window, "setUserInteractionEnabled:", 0);
    if (location[0])
      (*((void (**)(void))location[0] + 2))();
    objc_msgSend(v92, "setObject:forKey:", v85, CFSTR("Language"));
    v55 = v92;
    v56 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
    objc_msgSend(v55, "setObject:forKey:", v56, CFSTR("AnimateLanguageChoice"));

    objc_msgSend(v92, "synchronize");
    if ((v87 & 1) != 0)
      +[NSLocale setPreferredLanguages:](NSLocale, "setPreferredLanguages:", v88);
    if (v89)
    {
      +[IPSettingsUtilities setRegion:changeLanguageVariant:postNotification:](IPSettingsUtilities, "setRegion:changeLanguageVariant:postNotification:", v89, 1, 1);
      v65 = CFPreferencesCopyValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      v57 = +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      objc_msgSend(v57, "setValue:forKey:", v65, 3);

      v58 = -[SetupController environment](v96, "environment");
      v59 = -[BYEnvironment buddyPreferences](v58, "buddyPreferences");
      objc_msgSend(v59, "setObject:forKey:", v65, CFSTR("Locale"));

      objc_storeStrong((id *)&v65, 0);
    }
    -[SetupController userDidChooseLanguage](v96, "userDidChooseLanguage");
    -[SetupController _persistAnalyticsForLanguageReboot](v96, "_persistAnalyticsForLanguageReboot");
    v60 = -[SetupController environment](v96, "environment");
    v61 = -[BYEnvironment proximitySetupController](v60, "proximitySetupController");
    objc_msgSend(v61, "prepareForReboot");

    v62 = -[SetupController environment](v96, "environment");
    v63 = -[BYEnvironment proximitySetupController](v62, "proximitySetupController");
    objc_msgSend(v63, "endAdvertisingProximitySetup");

    -[SetupController _showMiniAlertWithRestart:withLanguage:](v96, "_showMiniAlertWithRestart:withLanguage:", 1, v90);
    v97 = 1;
    v68 = 1;
  }
  else
  {
    v76 = (os_log_t)(id)_BYLoggingFacility(v35);
    v75 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      sub_10003A6BC((uint64_t)v100, (uint64_t)v91, (uint64_t)v90);
      _os_log_impl((void *)&_mh_execute_header, v76, v75, "Language did not change (%{public}@ => %{public}@)!", v100, 0x16u);
    }
    objc_storeStrong((id *)&v76, 0);
    objc_msgSend(v92, "synchronize");
    v74 = objc_msgSend(v92, "objectForKey:", CFSTR("AppleLanguages"));
    v44 = objc_msgSend(v74, "firstObject");
    v73 = v44;
    v72 = 0;
    v45 = 0;
    if (v90)
    {
      v44 = objc_msgSend(v73, "isEqualToString:", v90);
      v45 = v44 ^ 1;
    }
    v72 = v45 & 1;
    v71 = (os_log_t)(id)_BYLoggingFacility(v44);
    v70 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      sub_10003A6BC((uint64_t)v99, (uint64_t)v73, (uint64_t)v90);
      _os_log_impl((void *)&_mh_execute_header, v71, v70, "current default: %{public}@; selected language: %{public}@",
        v99,
        0x16u);
    }
    objc_storeStrong((id *)&v71, 0);
    if ((v72 & 1) != 0 || !v84)
    {
      if ((v87 & 1) != 0)
        +[NSLocale setPreferredLanguages:](NSLocale, "setPreferredLanguages:", v88);
      if (v89)
      {
        +[IPSettingsUtilities setRegion:changeLanguageVariant:postNotification:](IPSettingsUtilities, "setRegion:changeLanguageVariant:postNotification:", v89, 1, 1);
        v69 = (id)CFPreferencesCopyValue(CFSTR("AppleLocale"), kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
        v46 = +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
        objc_msgSend(v46, "setValue:forKey:", v69, 3);

        v47 = -[SetupController environment](v96, "environment");
        v48 = -[BYEnvironment buddyPreferences](v47, "buddyPreferences");
        objc_msgSend(v48, "setObject:forKey:", v69, CFSTR("Locale"));

        objc_storeStrong(&v69, 0);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleLanguagePreferencesChangedNotification"), 0, 0, 1u);
      v50 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v50, CFSTR("com.apple.language.changed"), 0, 0, 1u);
    }
    v51 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v51, BYSetupAssistantDidCompleteLanguageLocaleNotification, 0, 0, 1u);
    -[SetupController userDidChooseLanguage](v96, "userDidChooseLanguage");
    v52 = -[SetupController environment](v96, "environment");
    v53 = -[BYEnvironment proximitySetupController](v52, "proximitySetupController");
    objc_msgSend(v53, "languageChangeCompleted");

    v54 = +[BuddySIMManager sharedManager](BuddySIMManager, "sharedManager");
    objc_msgSend(v54, "allowSIMUnlock");

    v97 = 0;
    v68 = 1;
    objc_storeStrong(&v73, 0);
    objc_storeStrong(&v74, 0);
  }
  objc_storeStrong(&v85, 0);
  objc_storeStrong(&v88, 0);
  objc_storeStrong(&v89, 0);
  objc_storeStrong(&v90, 0);
  objc_storeStrong(&v91, 0);
  objc_storeStrong(&v92, 0);
  objc_storeStrong(&v93, 0);
  objc_storeStrong(&v94, 0);
  objc_storeStrong(location, 0);
  return v97 & 1;
}

- (void)_setupAnalytics
{
  BuddyNavigationAnalytics *v2;
  id v3;
  BuddyNavigationAnalytics *v4;
  BYEnvironment *v5;
  id v6;
  id v7;
  BuddySetupAnalytics *v8;
  BuddySetupAnalytics *v9;
  BYEnvironment *v10;
  id v11;
  BuddySetupAnalytics *v12;
  uint64_t v13;
  uint64_t v14;
  BuddySetupAnalytics *v15;
  BYEnvironment *v16;
  id v17;
  BYEnvironment *v18;
  id v19;
  BuddySetupAnalytics *v20;
  double v21;
  double v22;
  BuddySetupAnalytics *v23;
  id location;
  id v25;
  id v26[2];
  SetupController *v27;

  v27 = self;
  v26[1] = (id)a2;
  v2 = [BuddyNavigationAnalytics alloc];
  v3 = -[SetupController navigationController](v27, "navigationController");
  v4 = -[BuddyNavigationAnalytics initWithNavigationController:](v2, "initWithNavigationController:", v3);
  -[SetupController setNavigationAnalytics:](v27, "setNavigationAnalytics:", v4);

  v5 = -[SetupController environment](v27, "environment");
  v6 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v5, "buddyPreferencesExcludedFromBackup");
  v7 = +[BuddySetupAnalytics loadFromDiskWithPreferences:](BuddySetupAnalytics, "loadFromDiskWithPreferences:", v6);
  -[SetupController setSetupAnalytics:](v27, "setSetupAnalytics:", v7);

  v8 = -[SetupController setupAnalytics](v27, "setupAnalytics");
  LOBYTE(v7) = v8 == 0;

  if ((v7 & 1) != 0)
  {
    v9 = [BuddySetupAnalytics alloc];
    v10 = -[SetupController environment](v27, "environment");
    v11 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v10, "buddyPreferencesExcludedFromBackup");
    v12 = -[BuddySetupAnalytics initWithPreferences:](v9, "initWithPreferences:", v11);
    -[SetupController setSetupAnalytics:](v27, "setSetupAnalytics:", v12);

    LOBYTE(v12) = BYSetupAssistantHasCompletedInitialRun(v13, v14);
    v15 = -[SetupController setupAnalytics](v27, "setupAnalytics");
    -[BuddySetupAnalytics setHasCompletedInitialSetup:](v15, "setHasCompletedInitialSetup:", v12 & 1);

  }
  v16 = -[SetupController environment](v27, "environment");
  v17 = -[BYEnvironment buddyPreferences](v16, "buddyPreferences");
  v26[0] = +[BuddyRestoreState loadFromPreferences:](BuddyRestoreState, "loadFromPreferences:", v17);

  v18 = -[SetupController environment](v27, "environment");
  v19 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v18, "buddyPreferencesExcludedFromBackup");
  v25 = +[BuddyMigrationState loadFromPreferences:](BuddyMigrationState, "loadFromPreferences:", v19);

  if (v26[0] || v25)
  {
    location = objc_msgSend(v26[0], "persistDate");
    if (!location)
    {
      location = objc_msgSend(v25, "persistDate");

    }
    v20 = -[SetupController setupAnalytics](v27, "setupAnalytics");
    -[BuddySetupAnalytics setSoftwareUpdatePerformed:](v20, "setSoftwareUpdatePerformed:", 1);

    objc_msgSend(location, "timeIntervalSinceNow");
    v22 = -v21;
    v23 = -[SetupController setupAnalytics](v27, "setupAnalytics");
    -[BuddySetupAnalytics setOtherDuration:](v23, "setOtherDuration:", v22);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
}

- (void)_preStashAnalytics
{
  BuddyNavigationAnalytics *v2;
  BuddyNavigationAnalytics *v3;
  BYEnvironment *v4;
  id v5;
  BuddySetupAnalytics *v6;
  BYEnvironment *v7;
  id v8;

  -[SetupController _populateSetupAnalytics](self, "_populateSetupAnalytics", a2);
  v2 = -[SetupController navigationAnalytics](self, "navigationAnalytics");
  -[BuddyNavigationAnalytics prepareEventForCurrentViewController](v2, "prepareEventForCurrentViewController");

  v3 = -[SetupController navigationAnalytics](self, "navigationAnalytics");
  v4 = -[SetupController environment](self, "environment");
  v5 = -[BYEnvironment analyticsManager](v4, "analyticsManager");
  -[BuddyNavigationAnalytics addEventsUsingAnalyticsManager:](v3, "addEventsUsingAnalyticsManager:", v5);

  v6 = -[SetupController setupAnalytics](self, "setupAnalytics");
  v7 = -[SetupController environment](self, "environment");
  v8 = -[BYEnvironment analyticsManager](v7, "analyticsManager");
  -[BuddySetupAnalytics addEventUsingAnalyticsManager:](v6, "addEventUsingAnalyticsManager:", v8);

  -[SetupController setSetupAnalytics:](self, "setSetupAnalytics:", 0);
}

- (void)_stashAnalytics
{
  BYEnvironment *v2;
  id v3;
  BYEnvironment *v4;
  id v5;
  BYEnvironment *v6;
  id v7;

  -[SetupController _preStashAnalytics](self, "_preStashAnalytics", a2);
  v2 = -[SetupController environment](self, "environment");
  v3 = -[BYEnvironment analyticsManager](v2, "analyticsManager");
  v4 = -[SetupController environment](self, "environment");
  v5 = -[BYEnvironment settingsManager](v4, "settingsManager");
  objc_msgSend(v3, "stash:", v5);

  v6 = -[SetupController environment](self, "environment");
  v7 = -[BYEnvironment analyticsManager](v6, "analyticsManager");
  objc_msgSend(v7, "reset");

}

- (void)_preCommitAnalytics
{
  BuddyNavigationAnalytics *v2;
  BuddyNavigationAnalytics *v3;
  BYEnvironment *v4;
  id v5;
  BuddySetupAnalytics *v6;
  BYEnvironment *v7;
  id v8;

  -[SetupController _populateSetupAnalytics](self, "_populateSetupAnalytics", a2);
  -[SetupController _populatePowerLogAnalytics](self, "_populatePowerLogAnalytics");
  v2 = -[SetupController navigationAnalytics](self, "navigationAnalytics");
  -[BuddyNavigationAnalytics prepareEventForCurrentViewController](v2, "prepareEventForCurrentViewController");

  v3 = -[SetupController navigationAnalytics](self, "navigationAnalytics");
  v4 = -[SetupController environment](self, "environment");
  v5 = -[BYEnvironment analyticsManager](v4, "analyticsManager");
  -[BuddyNavigationAnalytics addEventsUsingAnalyticsManager:](v3, "addEventsUsingAnalyticsManager:", v5);

  v6 = -[SetupController setupAnalytics](self, "setupAnalytics");
  v7 = -[SetupController environment](self, "environment");
  v8 = -[BYEnvironment analyticsManager](v7, "analyticsManager");
  -[BuddySetupAnalytics addEventUsingAnalyticsManager:](v6, "addEventUsingAnalyticsManager:", v8);

}

- (void)_commitAnalytics
{
  BYEnvironment *v2;
  id v3;

  -[SetupController _preCommitAnalytics](self, "_preCommitAnalytics", a2);
  v2 = -[SetupController environment](self, "environment");
  v3 = -[BYEnvironment analyticsManager](v2, "analyticsManager");
  objc_msgSend(v3, "commit");

}

- (void)_populateSetupAnalytics
{
  BYEnvironment *v2;
  id v3;
  id v4;
  BuddySetupAnalytics *v5;
  BuddySetupAnalytics *v6;
  BYEnvironment *v7;
  id v8;
  BuddySetupAnalytics *v9;
  id v10;
  BuddySetupAnalytics *v11;
  double v12;
  BuddySetupAnalytics *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  BuddySetupAnalytics *v19;
  BYEnvironment *v20;
  id v21;
  id v22;
  id v23;
  BuddySetupAnalytics *v24;

  v2 = -[SetupController environment](self, "environment", a2);
  v3 = -[BYEnvironment setupMethod](v2, "setupMethod");
  v4 = objc_msgSend(v3, "dataTransferMethod");
  v5 = -[SetupController setupAnalytics](self, "setupAnalytics");
  -[BuddySetupAnalytics setDataTransferMethod:](v5, "setDataTransferMethod:", v4);

  v6 = -[SetupController setupAnalytics](self, "setupAnalytics");
  v7 = -[SetupController environment](self, "environment");
  v8 = -[BYEnvironment networkProvider](v7, "networkProvider");
  -[BuddySetupAnalytics setInAppleStore:](v6, "setInAppleStore:", (-[BuddySetupAnalytics inAppleStore](v6, "inAppleStore") | objc_msgSend(v8, "inAppleStore") & 1) != 0);

  v9 = -[SetupController setupAnalytics](self, "setupAnalytics");
  v10 = -[BFFNavigationController viewControllers](self->_nav, "viewControllers");
  -[BuddySetupAnalytics setNumberOfPanesPresented:](v9, "setNumberOfPanesPresented:", (char *)objc_msgSend(v10, "count") + -[BuddySetupAnalytics numberOfPanesPresented](v9, "numberOfPanesPresented"));

  v11 = -[SetupController setupAnalytics](self, "setupAnalytics");
  -[BuddySetupAnalytics backgroundDuration](v11, "backgroundDuration");
  -[BuddySetupAnalytics setBackgroundDuration:](v11, "setBackgroundDuration:", v12 + self->_cumulativeLockedDuration);

  v13 = -[SetupController setupAnalytics](self, "setupAnalytics");
  +[BuddyTimestamp intervalSinceTimestamp:](BuddyTimestamp, "intervalSinceTimestamp:", self->_buddyStartTimestamp);
  v15 = v14 - self->_cumulativeLockedDuration;
  -[BuddySetupAnalytics activeDuration](v13, "activeDuration");
  -[BuddySetupAnalytics setActiveDuration:](v13, "setActiveDuration:", v16 + v15);

  v17 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v18 = objc_msgSend(v17, "aa_primaryAppleAccount");
  v19 = -[SetupController setupAnalytics](self, "setupAnalytics");
  -[BuddySetupAnalytics setIsSignedIntoAppleID:](v19, "setIsSignedIntoAppleID:", v18 != 0);

  v20 = -[SetupController environment](self, "environment");
  v21 = -[BYEnvironment flowSkipController](v20, "flowSkipController");
  v22 = objc_msgSend(v21, "getFlowSkipIdentifiers");
  v23 = objc_msgSend(v22, "count");
  v24 = -[SetupController setupAnalytics](self, "setupAnalytics");
  -[BuddySetupAnalytics setFollowUpItemsCount:](v24, "setFollowUpItemsCount:", v23);

}

- (void)_populatePowerLogAnalytics
{
  id v2;
  id v3;
  double v4;
  double v5;
  BYEnvironment *v6;
  id v7;
  NSNumber *v8;
  BYEnvironment *v9;
  id v10;
  BYEnvironment *v11;
  id v12;
  BYEnvironment *v13;
  id v14;
  NSNumber *v15;

  v2 = objc_alloc_init((Class)BYSetupUserDisposition);
  v3 = objc_msgSend(v2, "date");
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  v6 = -[SetupController environment](self, "environment");
  v7 = -[BYEnvironment analyticsManager](v6, "analyticsManager");
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5);
  objc_msgSend(v7, "addPowerLogEvent:withPayload:", 0, v8);

  v9 = -[SetupController environment](self, "environment");
  v10 = -[BYEnvironment setupMethod](v9, "setupMethod");

  if (v10)
  {
    v11 = -[SetupController environment](self, "environment");
    v12 = -[BYEnvironment analyticsManager](v11, "analyticsManager");
    v13 = -[SetupController environment](self, "environment");
    v14 = -[BYEnvironment setupMethod](v13, "setupMethod");
    v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "dataTransferMethod"));
    objc_msgSend(v12, "addPowerLogEvent:withPayload:", 1, v15);

  }
}

- (void)_persistAnalyticsForLanguageReboot
{
  BuddySetupAnalytics *v2;

  -[SetupController _populateSetupAnalytics](self, "_populateSetupAnalytics", a2);
  v2 = -[SetupController setupAnalytics](self, "setupAnalytics");
  -[BuddySetupAnalytics persist](v2, "persist");

}

- (void)_persistAnalyticsForSoftwareUpdate
{
  BYEnvironment *v2;
  id v3;
  BYEnvironment *v4;
  id v5;
  BuddySetupAnalytics *v6;

  -[SetupController _populateSetupAnalytics](self, "_populateSetupAnalytics", a2);
  v2 = -[SetupController environment](self, "environment");
  v3 = -[BYEnvironment analyticsManager](v2, "analyticsManager");
  v4 = -[SetupController environment](self, "environment");
  v5 = -[BYEnvironment settingsManager](v4, "settingsManager");
  objc_msgSend(v3, "stash:", v5);

  v6 = -[SetupController setupAnalytics](self, "setupAnalytics");
  -[BuddySetupAnalytics persist](v6, "persist");

}

- (void)displayProximityPinCode:(id)a3 language:(id)a4 visual:(BOOL)a5 accessibilitySettings:(id)a6
{
  BuddyProximityPairingController *v9;
  BuddyProximityPairingController *v10;
  void *v11;
  BuddyNavigationFlowController *v12;
  uint64_t (**v13)(id, id);
  BuddyProximityPairingController *v14;
  id v15;
  BuddyNavigationFlowController *v16;
  BuddyProximityPairingController *v17;
  BuddyProximityPairingController *v18;
  id v19;
  BuddyProximityPairingController *v20;
  id v21;
  BuddyProximityPairingController *v22;
  BuddyProximityPairingController *v23;
  id v24;
  id v25;
  id v26;
  NSBundle *v27;
  id v28;
  id v29;
  BuddyProximityPairingController *v30;
  BuddyProximityPairingController *v31;
  BuddyNavigationFlowController *v32;
  BuddyProximityPairingController *v33;
  id v34;
  BOOL v35;
  id v36;
  id location[2];
  SetupController *v38;

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = a5;
  v34 = 0;
  objc_storeStrong(&v34, a6);
  v9 = -[SetupController proximityPairingController](v38, "proximityPairingController");

  if (!v9)
  {
    v10 = objc_alloc_init(BuddyProximityPairingController);
    -[SetupController setProximityPairingController:](v38, "setProximityPairingController:", v10);

    v11 = (void *)_AXSCopySettingsDataBlobForBuddy();
    -[SetupController setDefaultAccessibilitySettings:](v38, "setDefaultAccessibilitySettings:", v11);

    v12 = -[SetupController navigationFlowController](v38, "navigationFlowController");
    v13 = (uint64_t (**)(id, id))-[BuddyNavigationFlowController environmentInjector](v12, "environmentInjector");
    v14 = -[SetupController proximityPairingController](v38, "proximityPairingController");
    v15 = (id)v13[2](v13, v14);

  }
  v16 = -[SetupController navigationFlowController](v38, "navigationFlowController");
  v17 = -[SetupController proximityPairingController](v38, "proximityPairingController");
  -[BuddyProximityPairingController setDelegate:](v17, "setDelegate:", v16);

  v18 = -[SetupController proximityPairingController](v38, "proximityPairingController");
  -[BuddyProximityPairingController setNonUserInitiatedDismissal:](v18, "setNonUserInitiatedDismissal:", 0);

  v19 = location[0];
  v20 = -[SetupController proximityPairingController](v38, "proximityPairingController");
  -[BuddyProximityPairingController setPairingCode:](v20, "setPairingCode:", v19);

  v21 = v36;
  v22 = -[SetupController proximityPairingController](v38, "proximityPairingController");
  -[BuddyProximityPairingController setLanguage:](v22, "setLanguage:", v21);

  if (v35)
  {
    v23 = -[SetupController proximityPairingController](v38, "proximityPairingController");
    -[BuddyProximityPairingController showVisualPairing](v23, "showVisualPairing");
  }
  else
  {
    v23 = -[SetupController proximityPairingController](v38, "proximityPairingController");
    -[BuddyProximityPairingController showPairingCode](v23, "showPairingCode");
  }

  v24 = -[SetupController navigationController](v38, "navigationController");
  v25 = objc_msgSend(v24, "topViewController");
  v26 = objc_msgSend(v25, "navigationItem");
  v27 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v28 = (id)SFLocalizedStringFromTableInBundleForLanguage(CFSTR("BACK"), CFSTR("Localizable"));
  objc_msgSend(v26, "setBackButtonTitle:", v28);

  v29 = -[SetupController navigationController](v38, "navigationController");
  v30 = (BuddyProximityPairingController *)objc_msgSend(v29, "topViewController");
  v31 = -[SetupController proximityPairingController](v38, "proximityPairingController");

  if (v30 != v31)
  {
    if (v34)
      _AXSRestoreSettingsFromDataBlobForBuddy(v34);
    v32 = -[SetupController navigationFlowController](v38, "navigationFlowController");
    v33 = -[SetupController proximityPairingController](v38, "proximityPairingController");
    -[BuddyNavigationFlowController pushFlowItem:animated:](v32, "pushFlowItem:animated:", v33, 1);

  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissProximityPinCode
{
  id v2;
  BuddyProximityPairingController *v3;
  BuddyProximityPairingController *v4;
  BOOL v5;
  NSData *v6;
  BuddyProximityPairingController *v7;
  id v8;
  id v9;

  v2 = -[SetupController navigationController](self, "navigationController", a2);
  v3 = (BuddyProximityPairingController *)objc_msgSend(v2, "topViewController");
  v4 = -[SetupController proximityPairingController](self, "proximityPairingController");
  v5 = 0;
  if (v3 == v4)
    v5 = !-[SetupController applyingProximitySettings](self, "applyingProximitySettings");

  if (v5)
  {
    v6 = -[SetupController defaultAccessibilitySettings](self, "defaultAccessibilitySettings");
    _AXSRestoreSettingsFromDataBlobForBuddy(v6);

    -[SetupController setDefaultAccessibilitySettings:](self, "setDefaultAccessibilitySettings:", 0);
    v7 = -[SetupController proximityPairingController](self, "proximityPairingController");
    -[BuddyProximityPairingController setNonUserInitiatedDismissal:](v7, "setNonUserInitiatedDismissal:", 1);

    v8 = -[SetupController navigationController](self, "navigationController");
    v9 = objc_msgSend(v8, "popViewControllerAnimated:", 1);

    -[SetupController setProximityPairingController:](self, "setProximityPairingController:", 0);
  }
}

- (void)displayIncompatibleProximityPairingFromDeviceClass:(id)a3
{
  NSBundle *v3;
  id v4;
  NSBundle *v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  UIAlertAction *v9;
  id v10;
  UIAlertController *v11;
  id v12;
  id v13;
  id location[2];
  SetupController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[BuddyLocalizationUtilities modelSpecificLocalizedStringKeyForKey:deviceClass:](BuddyLocalizationUtilities, "modelSpecificLocalizedStringKeyForKey:deviceClass:", CFSTR("PROXIMITY_PAIRING_INVALID_TITLE"), location[0]);
  v13 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));

  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROXIMITY_PAIRING_INVALID_MESSAGE"));
  v12 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("Localizable"));

  v11 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v12, 1);
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
  v9 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, 0);
  -[UIAlertController addAction:](v11, "addAction:", v9);

  v10 = -[SetupController navigationController](v15, "navigationController");
  objc_msgSend(v10, "presentViewController:animated:completion:", v11, 1, 0);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)displayUpdateRequiredToMigrate
{
  id v2;
  BuddyProximityPairingController *v3;
  BuddyProximityPairingController *v4;
  id v5;
  id v6;
  NSBundle *v7;
  NSBundle *v8;
  id v9;
  NSBundle *v10;
  NSString *v11;
  UIAlertAction *v12;
  id v13;
  id location;
  id v15;
  id v16[2];
  SetupController *v17;

  v17 = self;
  v16[1] = (id)a2;
  +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("SETUP_CONTROLLER"));
  -[BFFWindow setUserInteractionEnabled:](v17->_window, "setUserInteractionEnabled:", 1);
  v2 = -[SetupController navigationController](v17, "navigationController");
  v3 = (BuddyProximityPairingController *)objc_msgSend(v2, "topViewController");
  v4 = -[SetupController proximityPairingController](v17, "proximityPairingController");

  if (v3 == v4)
  {
    v5 = -[SetupController navigationController](v17, "navigationController");
    v6 = objc_msgSend(v5, "popViewControllerAnimated:", 1);

    -[SetupController setProximityPairingController:](v17, "setProximityPairingController:", 0);
  }
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v16[0] = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("PROXIMITY_PAIRING_UPDATE_REQUIRED_TO_MIGRATE_TITLE"), &stru_100284738, CFSTR("Localizable"));

  v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROXIMITY_PAIRING_UPDATE_REQUIRED_TO_MIGRATE_MESSAGE"));
  v15 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", v9, &stru_100284738, CFSTR("Localizable"));

  location = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v16[0], v15, 1);
  v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("Localizable"));
  v12 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, 0);
  objc_msgSend(location, "addAction:", v12);

  v13 = -[SetupController navigationController](v17, "navigationController");
  objc_msgSend(v13, "presentViewController:animated:completion:", location, 1, 0);

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

- (void)willPerformProximityHandshake
{
  void *v2;
  void **block;
  int v4;
  int v5;
  id (*v6)(uint64_t);
  void *v7;
  id v8[2];
  SetupController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1000464DC;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)willApplyProximitySettingsWithCompletion:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  SetupController *v9;
  id v10;
  id location[2];
  SetupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100046678;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)didApplyProximitySettingsWithWillReboot:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  SetupController *v9;
  id v10;
  id location[2];
  SetupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000467BC;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)unableToApplyProximitySettings
{
  void *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  SetupController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100046A44;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)skippedApplyProximitySettings
{
  void *v2;
  void **block;
  int v4;
  int v5;
  id (*v6)(uint64_t);
  void *v7;
  id v8[2];
  SetupController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100046BEC;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_connectedToWiFiAfterProximity
{
  NSObject *v2;
  os_log_type_t v3;
  BYEnvironment *v4;
  id v5;
  _WORD v6[3];
  os_log_type_t v7;
  os_log_t oslog[2];
  SetupController *v9;

  v9 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v7;
    sub_100038C3C(v6);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Setting Wi-Fi network as connected and reachable as proximity has done the check for us", (uint8_t *)v6, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = -[SetupController environment](v9, "environment");
  v5 = -[BYEnvironment networkProvider](v4, "networkProvider");
  objc_msgSend(v5, "assumeNetworkReachabilityOverWiFi");

}

- (void)endAdvertisingProximitySetup
{
  id v2;
  BuddyProximityPairingController *v3;
  BuddyProximityPairingController *v4;
  BYEnvironment *v5;
  id v6;

  v2 = -[SetupController navigationController](self, "navigationController", a2);
  v3 = (BuddyProximityPairingController *)objc_msgSend(v2, "topViewController");
  v4 = -[SetupController proximityPairingController](self, "proximityPairingController");

  if (v3 != v4)
  {
    v5 = -[SetupController environment](self, "environment");
    v6 = -[BYEnvironment proximitySetupController](v5, "proximitySetupController");
    objc_msgSend(v6, "endAdvertisingProximitySetup");

    -[SetupController dismissProximityPinCode](self, "dismissProximityPinCode");
  }
}

- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  BuddyActivationRecord *v4;
  BYEnvironment *v5;
  void *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  SetupController *v12;
  BOOL v13;
  os_log_type_t v14;
  os_log_t oslog;
  BOOL v16;
  BOOL v17;
  SEL v18;
  SetupController *v19;
  uint8_t buf[8];

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  if (a3)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(self);
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100046FA0(buf, v16);
      _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Activation State Changed, isActivated = %d", buf, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v4 = objc_alloc_init(BuddyActivationRecord);
    v5 = -[SetupController environment](v19, "environment");
    -[BYEnvironment setActivationRecord:](v5, "setActivationRecord:", v4);

    v6 = &_dispatch_main_q;
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_100046FB4;
    v11 = &unk_100280B18;
    v12 = v19;
    v13 = v16;
    dispatch_async((dispatch_queue_t)v6, &v7);

    objc_storeStrong((id *)&v12, 0);
  }
}

- (void)proximityAutomatedDeviceEnrollmentController:(id)a3 wantsToTransitionToPairingWithPin:(id)a4
{
  BuddyProximityAutomatedDeviceEnrollmentPairingController *v5;
  BuddyNavigationFlowController *v6;
  uint64_t (**v7)(id, id);
  id v8;
  BuddyNavigationFlowController *v9;
  BuddyNavigationFlowController *v10;
  id v11;
  id v12;
  id location[2];
  SetupController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v5 = [BuddyProximityAutomatedDeviceEnrollmentPairingController alloc];
  v11 = -[BuddyProximityAutomatedDeviceEnrollmentPairingController initWithPairingCode:](v5, "initWithPairingCode:", v12);
  v6 = -[SetupController navigationFlowController](v14, "navigationFlowController");
  v7 = (uint64_t (**)(id, id))-[BuddyNavigationFlowController environmentInjector](v6, "environmentInjector");
  v8 = (id)v7[2](v7, v11);

  v9 = -[SetupController navigationFlowController](v14, "navigationFlowController");
  objc_msgSend(v11, "setDelegate:", v9);

  v10 = -[SetupController navigationFlowController](v14, "navigationFlowController");
  -[BuddyNavigationFlowController pushFlowItem:animated:](v10, "pushFlowItem:animated:", v11, 1);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_prepareForDeviceMigrationAfterSoftwareUpdate:(BOOL)a3
{
  BYEnvironment *v3;
  id v4;
  id v5;
  BYEnvironment *v6;
  id v7;
  id v8;
  BYEnvironment *v9;
  id v10;
  id v11;
  BYEnvironment *v12;
  id v13;
  id v14;
  unsigned __int8 v15;
  char v16;
  BYEnvironment *v17;
  id v18;
  BYEnvironment *v19;
  id v20;
  BYEnvironment *v21;
  id v22;
  BYEnvironment *v23;
  id v24;
  id v25;
  BYEnvironment *v26;
  id v27;
  id v28;
  BYEnvironment *v29;
  id v30;
  BYEnvironment *v31;
  id v32;
  id v33;
  BYEnvironment *v34;
  id v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  BYEnvironment *v40;
  id v41;
  id v42;
  BOOL v43;
  BYEnvironment *v44;
  id v45;
  id v46;
  BYEnvironment *v47;
  id v48;
  BYEnvironment *v49;
  id v50;
  BYEnvironment *v51;
  id v52;
  id v53;
  BYEnvironment *v54;
  id v55;
  id v56;
  BYEnvironment *v57;
  id v58;
  NSNumber *v59;
  NSNumber *v60;
  NSDictionary *v61;
  id v62;
  BYEnvironment *v63;
  void **v64;
  int v65;
  int v66;
  void (*v67)(NSObject *, void *);
  void *v68;
  SetupController *v69;
  uint8_t buf[15];
  os_log_type_t v71;
  os_log_t oslog;
  void **v73;
  int v74;
  int v75;
  void (*v76)(id *);
  void *v77;
  id v78;
  id from;
  char v80;
  id obj;
  char v82;
  char v83;
  char v84;
  id location;
  BOOL v86;
  SEL v87;
  SetupController *v88;
  _QWORD v89[3];
  _QWORD v90[3];

  v88 = self;
  v87 = a2;
  v86 = a3;
  v3 = -[SetupController environment](self, "environment");
  v4 = -[BYEnvironment miscState](v3, "miscState");
  v5 = objc_msgSend(v4, "migrationManager");

  if (!v5)
  {
    location = 0;
    v84 = 0;
    v83 = +[BuddyMigrationCapability currentDeviceShouldOfferMigration](BuddyMigrationCapability, "currentDeviceShouldOfferMigration");
    v82 = 0;
    v6 = -[SetupController environment](v88, "environment");
    v7 = -[BYEnvironment proximitySetupController](v6, "proximitySetupController");
    v8 = objc_msgSend(v7, "information");
    v9 = -[SetupController environment](v88, "environment");
    v10 = -[BYEnvironment proximitySetupController](v9, "proximitySetupController");
    v11 = objc_msgSend(v10, "productVersion");
    v12 = -[SetupController environment](v88, "environment");
    v13 = -[BYEnvironment proximitySetupController](v12, "proximitySetupController");
    v14 = objc_msgSend(v13, "deviceClass");
    obj = 0;
    v15 = +[BuddyMigrationCapability sourceDeviceSupportsMigration:productVersion:deviceClass:softwareUpdateRequired:reason:](BuddyMigrationCapability, "sourceDeviceSupportsMigration:productVersion:deviceClass:softwareUpdateRequired:reason:", v8, v11, v14, &v84, &obj);
    objc_storeStrong(&location, obj);

    v82 = v15 & 1;
    v80 = 0;
    v16 = 0;
    if ((v83 & 1) != 0)
      v16 = v82;
    v80 = v16;
    if ((v16 & 1) != 0)
    {
      objc_initWeak(&from, v88);
      v17 = -[SetupController environment](v88, "environment");
      v18 = -[BYEnvironment proximitySetupController](v17, "proximitySetupController");
      v73 = _NSConcreteStackBlock;
      v74 = -1073741824;
      v75 = 0;
      v76 = sub_100047E4C;
      v77 = &unk_1002806B8;
      objc_copyWeak(&v78, &from);
      v19 = -[SetupController environment](v88, "environment");
      v20 = -[BYEnvironment passcodeCacheManager](v19, "passcodeCacheManager");
      v21 = -[SetupController environment](v88, "environment");
      v22 = -[BYEnvironment analyticsManager](v21, "analyticsManager");
      v23 = -[SetupController environment](v88, "environment");
      v24 = -[BYEnvironment lockdownModeProvider](v23, "lockdownModeProvider");
      v25 = objc_msgSend(v18, "createTargetDeviceMigrationManagerWithPrepareForMigrationRebootBlock:passcodeCacheManager:analyticsManager:lockdownModeProvider:", &v73, v20, v22, v24);
      v63 = -[SetupController environment](v88, "environment");
      v62 = -[BYEnvironment miscState](v63, "miscState");
      objc_msgSend(v62, "setMigrationManager:", v25);

      LOBYTE(v20) = v84;
      v26 = -[SetupController environment](v88, "environment");
      v27 = -[BYEnvironment miscState](v26, "miscState");
      v28 = objc_msgSend(v27, "migrationManager");
      objc_msgSend(v28, "setRequiresUpdateToMigrate:", v20 & 1);

      v29 = -[SetupController environment](v88, "environment");
      v30 = -[BYEnvironment networkProvider](v29, "networkProvider");
      v31 = -[SetupController environment](v88, "environment");
      v32 = -[BYEnvironment miscState](v31, "miscState");
      v33 = objc_msgSend(v32, "migrationManager");
      objc_msgSend(v33, "setNetworkProvider:", v30);

      v34 = -[SetupController environment](v88, "environment");
      v35 = -[BYEnvironment miscState](v34, "miscState");
      v36 = objc_msgSend(v35, "migrationManager");
      LOBYTE(v31) = objc_msgSend(v36, "requiresUpdateToMigrate");

      if ((v31 & 1) != 0)
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v37);
        v71 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v38 = oslog;
          v39 = v71;
          sub_100038C3C(buf);
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "Migration requires update; not starting any migration operations...",
            buf,
            2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v40 = -[SetupController environment](v88, "environment");
        v41 = -[BYEnvironment miscState](v40, "miscState");
        v42 = objc_msgSend(v41, "migrationManager");
        objc_msgSend(v42, "setWillMigrate:", 1);

      }
      else
      {
        v43 = v86;
        v44 = -[SetupController environment](v88, "environment");
        v45 = -[BYEnvironment miscState](v44, "miscState");
        v46 = objc_msgSend(v45, "migrationManager");
        objc_msgSend(v46, "setSoftwareUpdateDidOccur:", v43);

        v47 = -[SetupController environment](v88, "environment");
        v48 = -[BYEnvironment proximitySetupController](v47, "proximitySetupController");
        objc_msgSend(v48, "beginDeviceToDeviceMigration");

        v49 = -[SetupController environment](v88, "environment");
        v50 = -[BYEnvironment proximitySetupController](v49, "proximitySetupController");
        v51 = -[SetupController environment](v88, "environment");
        v52 = -[BYEnvironment miscState](v51, "miscState");
        v53 = objc_msgSend(v52, "migrationManager");
        objc_msgSend(v50, "addObserver:", v53);

        v54 = -[SetupController environment](v88, "environment");
        v55 = -[BYEnvironment miscState](v54, "miscState");
        v56 = objc_msgSend(v55, "migrationManager");
        v64 = _NSConcreteStackBlock;
        v65 = -1073741824;
        v66 = 0;
        v67 = sub_100047E8C;
        v68 = &unk_100280B80;
        v69 = v88;
        objc_msgSend(v56, "startKeychainDataTransferWithCompletionHandler:", &v64);

        objc_storeStrong((id *)&v69, 0);
      }
      objc_destroyWeak(&v78);
      objc_destroyWeak(&from);
    }
    if (!objc_msgSend(location, "length"))
      objc_storeStrong(&location, CFSTR("none"));
    v57 = -[SetupController environment](v88, "environment");
    v58 = -[BYEnvironment analyticsManager](v57, "analyticsManager");
    v89[0] = CFSTR("targetSupports");
    v59 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v83 & 1);
    v90[0] = v59;
    v89[1] = CFSTR("sourceSupports");
    v60 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v82 & 1);
    v90[1] = v60;
    v89[2] = CFSTR("reason");
    v90[2] = location;
    v61 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
    objc_msgSend(v58, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.migration.ability"), v61, 1);

    objc_storeStrong(&location, 0);
  }
}

- (void)_startDeviceMigration
{
  BYEnvironment *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  id v21;
  void **v22;
  int v23;
  int v24;
  void (*v25)(NSObject *, void *);
  void *v26;
  id v27;
  os_log_type_t v28;
  os_log_t oslog;
  id location[2];
  id v31;
  uint8_t buf[24];

  v31 = self;
  location[1] = (id)a2;
  v2 = -[SetupController environment](self, "environment");
  v3 = -[BYEnvironment buddyPreferences](v2, "buddyPreferences");
  objc_msgSend(v3, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("RestoreChoice"));

  v4 = objc_msgSend(v31, "environment");
  v5 = objc_msgSend(v4, "setupMethod");
  objc_msgSend(v5, "setDataTransferMethod:", 2);

  v6 = objc_msgSend(v31, "environment");
  v7 = objc_msgSend(v6, "proximitySetupController");
  location[0] = objc_msgSend(v7, "backupMetadata");

  oslog = (os_log_t)(id)_BYLoggingFacility(v8);
  v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v28, "Using metadata from source device: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v9 = location[0];
  v10 = objc_msgSend(v31, "environment");
  v11 = objc_msgSend(v10, "existingSettings");
  objc_msgSend(v11, "setBackupMetadata:", v9);

  v12 = objc_msgSend(v31, "environment");
  v13 = objc_msgSend(v12, "miscState");
  v14 = objc_msgSend(v13, "migrationManager");
  objc_msgSend(v14, "setUserChoseMigration:", 1);

  v15 = objc_msgSend(v31, "environment");
  v16 = objc_msgSend(v15, "miscState");
  v17 = objc_msgSend(v16, "migrationManager");
  v18 = objc_msgSend(v17, "requiresUpdateToMigrate") ^ 1;

  if ((v18 & 1) != 0)
  {
    v19 = objc_msgSend(v31, "environment");
    v20 = objc_msgSend(v19, "miscState");
    v21 = objc_msgSend(v20, "migrationManager");
    v22 = _NSConcreteStackBlock;
    v23 = -1073741824;
    v24 = 0;
    v25 = sub_100048334;
    v26 = &unk_100280B80;
    v27 = v31;
    objc_msgSend(v21, "waitForKeychainDataTransfer:", &v22);

    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setNeedsConfigurationUpdate
{
  id v2;

  v2 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager", a2, self);
  objc_msgSend(v2, "cloudConfigMayHaveChanged");

}

- (BOOL)_doesRestartFlowCauseErase
{
  BYEnvironment *v2;
  id v3;
  unint64_t v4;
  id v5;
  id v6;
  BOOL v7;
  BYEnvironment *v8;
  id v9;
  unsigned __int8 v10;
  BYEnvironment *v11;
  id v12;
  id v13;
  unsigned __int8 v14;
  BOOL v15;
  char v17;
  BOOL v18;

  v2 = -[SetupController environment](self, "environment");
  v3 = -[BYEnvironment flowItemDispositionProvider](v2, "flowItemDispositionProvider");
  v4 = (unint64_t)objc_msgSend(v3, "dispositions") & 0x10;

  if (v4 == 16)
    return 0;
  v5 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  v7 = v6 != 0;

  v18 = v7;
  v8 = -[SetupController environment](self, "environment");
  v9 = -[BYEnvironment managedConfiguration](v8, "managedConfiguration");
  v10 = objc_msgSend(v9, "isPasscodeSet");

  v17 = v10 & 1;
  v11 = -[SetupController environment](self, "environment");
  v12 = -[BYEnvironment miscState](v11, "miscState");
  v13 = objc_msgSend(v12, "migrationManager");
  v14 = objc_msgSend(v13, "hasTransferredData");

  v15 = 1;
  if ((v17 & 1) == 0)
  {
    v15 = 1;
    if (!v18)
      return v14 & 1;
  }
  return v15;
}

- (BOOL)willRestartFlowToViewController:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  BFFWindow *window;
  id v6;
  BYEnvironment *v7;
  id v8;
  BYEnvironment *v9;
  id v10;
  id v11;
  id v12;
  id v14;
  int v15;
  id v16;
  BOOL v17;
  id location[2];
  SetupController *v19;
  char v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SetupController _doesRestartFlowCauseErase](v19, "_doesRestartFlowCauseErase");
  v17 = v3;
  if (!v3 || (BYSetupAssistantHasCompletedInitialRun(v3, v4) & 1) != 0)
  {
    if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___OBWelcomeHeaderAnimatable) & 1) != 0)
    {
      v12 = location[0];
      objc_msgSend(v12, "markPaneToAnimateHeaderOnNextAppearance", v12);
      objc_storeStrong(&v14, 0);
    }
    v20 = 1;
    v15 = 1;
  }
  else
  {
    window = v19->_window;
    v6 = -[SetupController navigationController](v19, "navigationController");
    v7 = -[SetupController environment](v19, "environment");
    v8 = -[BYEnvironment proximitySetupController](v7, "proximitySetupController");
    v9 = -[SetupController environment](v19, "environment");
    v10 = -[BYEnvironment analyticsManager](v9, "analyticsManager");
    v16 = +[BuddyEraseAlertController alertControllerWithWindow:navigationController:proximitySetupController:analyticsManager:](BuddyEraseAlertController, "alertControllerWithWindow:navigationController:proximitySetupController:analyticsManager:", window, v6, v8, v10);

    v11 = -[SetupController navigationController](v19, "navigationController");
    objc_msgSend(v11, "buddy_presentAlertController:", v16);

    v20 = 0;
    v15 = 1;
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(location, 0);
  return v20 & 1;
}

- (void)didRestartFlow
{
  BYEnvironment *v2;
  id v3;
  BYEnvironment *v4;
  id v5;
  BYEnvironment *v6;
  id v7;
  BYEnvironment *v8;
  id v9;
  unint64_t v10;
  BYEnvironment *v11;
  id v12;

  v2 = -[SetupController environment](self, "environment", a2);
  v3 = -[BYEnvironment miscState](v2, "miscState");
  objc_msgSend(v3, "setUserSelectedCellularActivation:", 0);

  v4 = -[SetupController environment](self, "environment");
  v5 = -[BYEnvironment pendingRestoreState](v4, "pendingRestoreState");
  objc_msgSend(v5, "clearBackupItem");

  v6 = -[SetupController environment](self, "environment");
  v7 = -[BYEnvironment proximitySetupController](v6, "proximitySetupController");
  objc_msgSend(v7, "startOver");

  v8 = -[SetupController environment](self, "environment");
  v9 = -[BYEnvironment flowItemDispositionProvider](v8, "flowItemDispositionProvider");
  v10 = (unint64_t)objc_msgSend(v9, "dispositions") & 0x10;

  if (v10 != 16)
  {
    v11 = -[SetupController environment](self, "environment");
    v12 = -[BYEnvironment setupMethod](v11, "setupMethod");
    objc_msgSend(v12, "setIntent:", 0);

  }
}

- (void)disableTapFreeSetUp
{
  if (self->_TFDEPPollTimer)
    -[SetupController stopTFDEPPolling](self, "stopTFDEPPolling", a2);
}

- (void)presentWiFiSettingsModally
{
  -[SetupController _showModalWiFiSettings](self, "_showModalWiFiSettings", a2, self);
}

- (BOOL)_canShortCircuitGreen
{
  return 0;
}

- (void)_initializeGreen
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  _WORD v6[3];
  os_log_type_t v7;
  os_log_t oslog[2];
  SetupController *v9;

  v9 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[SetupController _canShortCircuitGreen](self, "_canShortCircuitGreen");
  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v2);
    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog[0];
      v4 = v7;
      sub_100038C3C(v6);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "green short-circuiting initialize", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    v5 = objc_alloc_init((Class)BYGreenController);
    -[SetupController setGreenController:](v9, "setGreenController:", v5);

  }
}

- (void)_writeGreenInformedDefaultPlistIfNecessary
{
  NSLocale *v3;
  NSString *v4;

  v3 = +[NSLocale currentLocale](NSLocale, "currentLocale", a2, self);
  v4 = -[NSLocale countryCode](v3, "countryCode");
  -[SetupController _writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:](self, "_writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:", v4);

}

- (void)_writeGreenInformedDefaultPlistIfNecessaryForLocaleCountryCode:(id)a3
{
  _BOOL8 v3;
  NSObject *v4;
  os_log_type_t v5;
  BYGreenController *v6;
  _WORD v7[7];
  os_log_type_t v8;
  os_log_t oslog;
  id location[2];
  SetupController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SetupController _canShortCircuitGreen](v11, "_canShortCircuitGreen");
  if (v3)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = oslog;
      v5 = v8;
      sub_100038C3C(v7);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "green short-circuiting write informed defaults", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    v6 = -[SetupController greenController](v11, "greenController");
    -[BYGreenController writeInformedDefaultPlistIfNecessaryForLocaleRegionCode:](v6, "writeInformedDefaultPlistIfNecessaryForLocaleRegionCode:", location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)userSelectedLanguage:(id)a3
{
  id location[2];
  SetupController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SetupController setUserSelectedLanguage:](v4, "setUserSelectedLanguage:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)userSelectedLanguageWithLocale:(id)a3 countryCode:(id)a4 localePaneScrollOffset:(double)a5
{
  id v8;
  id location[2];
  SetupController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  -[SetupController setUserSelectedLanguageWithLocale:](v10, "setUserSelectedLanguageWithLocale:", location[0]);
  LOBYTE(a4) = -[SetupController _userSelectedLocale:localePaneScrollOffset:](v10, "_userSelectedLocale:localePaneScrollOffset:", 0, a5);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return a4 & 1;
}

- (BOOL)_userSelectedLocale:(id)a3 localePaneScrollOffset:(double)a4
{
  uint64_t v5;
  id v6;
  BYEnvironment *v7;
  id v8;
  SetupController *v9;
  void **v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16[2];
  os_log_type_t v17;
  os_log_t oslog;
  double v19;
  id location[2];
  SetupController *v21;
  uint8_t buf[24];

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  if (location[0])
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v17, "Setting locale %@...", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v6 = +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    objc_msgSend(v6, "setValue:forKey:", location[0], 3);

    v7 = -[SetupController environment](v21, "environment");
    v8 = -[BYEnvironment buddyPreferences](v7, "buddyPreferences");
    objc_msgSend(v8, "setObject:forKey:", location[0], CFSTR("Locale"));

  }
  v9 = v21;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_100048F48;
  v15 = &unk_100280BA8;
  v16[0] = v21;
  v16[1] = *(id *)&v19;
  LOBYTE(v9) = -[SetupController updateLanguageLocale:](v9, "updateLanguageLocale:", &v11);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (BOOL)shouldEndLifecycleForCause:(unint64_t)a3
{
  id v3;
  unsigned __int8 v4;
  char v5;
  uint64_t v7;
  char v9;

  if (a3)
  {
    if (a3 - 1 < 4)
      v9 = 1;
  }
  else
  {
    v7 = BYSetupAssistantHasCompletedInitialRun(self, a2) & 1;
    v3 = +[BuddyActivationConfiguration currentConfiguration](BuddyActivationConfiguration, "currentConfiguration");
    v4 = objc_msgSend(v3, "hasActivated");

    v5 = 0;
    if ((v7 & 1) != 0)
    {
      v5 = 0;
      if (!self->_inMiniBuddyFromBreadcrumb)
        v5 = v4 & 1;
    }
    v9 = v5 & 1;
  }
  return v9 & 1;
}

- (void)willEndLifecycleDueToCause:(unint64_t)a3 allowDismissal:(BOOL)a4
{
  id v4;
  id v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  NSNumber *v9;
  NSNumber *v10;
  NSNumber *v11;
  uint64_t v12;
  NSNumber *v13;
  NSDictionary *v14;
  id v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  id v23;
  id v24;
  char v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  FBSDisplayLayoutMonitor *v29;
  __CFNotificationCenter *DarwinNotifyCenter;
  void **v31;
  uint64_t v32;
  void (*v33)(NSObject *, void *, void *, void *);
  void *v34;
  id v35;
  id v36;
  uint8_t v37[7];
  os_log_type_t v38;
  os_log_t v39;
  char v40;
  id v41;
  char v42;
  id v43;
  char v44;
  id location;
  uint8_t v46[7];
  os_log_type_t v47;
  os_log_t v48;
  char v49;
  char v50;
  os_log_type_t v51;
  os_log_t v52;
  os_log_type_t v53;
  os_log_t v54;
  os_log_type_t v55;
  os_log_t oslog;
  BOOL v57;
  unint64_t v58;
  SEL v59;
  id v60;
  _QWORD v61[4];
  _QWORD v62[4];
  uint8_t v63[16];
  uint8_t v64[16];
  uint8_t buf[24];

  v60 = self;
  v59 = a2;
  v58 = a3;
  v57 = a4;
  if (self->_buddyDone)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(self);
    v55 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_1000342B4((uint64_t)buf, v58);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v55, "Ignoring request will exit cause %ld request as an exit has already begun", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    if (v57)
    {
      v54 = (os_log_t)(id)_BYLoggingFacility(self);
      v53 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000342B4((uint64_t)v64, v58);
        _os_log_impl((void *)&_mh_execute_header, v54, v53, "Will end lifecycle due to cause %ld with dismissal allowed...", v64, 0xCu);
      }
      objc_storeStrong((id *)&v54, 0);
    }
    else
    {
      v52 = (os_log_t)(id)_BYLoggingFacility(self);
      v51 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000342B4((uint64_t)v63, v58);
        _os_log_impl((void *)&_mh_execute_header, v52, v51, "Will end lifecycle due to cause %ld...", v63, 0xCu);
      }
      objc_storeStrong((id *)&v52, 0);
    }
    v4 = objc_msgSend(v60, "environment");
    v5 = objc_msgSend(v4, "lockdownModeProvider");
    v6 = objc_msgSend(v5, "hasStagedEnablement");

    v50 = v6 & 1;
    if (v58 == 1
      && v57
      && +[BuddyMenuController supportsHomeGesture](BuddyMenuController, "supportsHomeGesture")
      && (v50 & 1) == 0)
    {
      objc_msgSend(*((id *)v60 + 12), "invalidate");
      objc_storeStrong((id *)v60 + 12, 0);
    }
    *((_BYTE *)v60 + 42) = 1;
    objc_msgSend(v60, "setAllowDismissalForExit:", v57);
    v7 = objc_msgSend(v60, "environment");
    v8 = objc_msgSend(v7, "analyticsManager");
    v61[0] = CFSTR("duration");
    +[BuddyTimestamp intervalSinceTimestamp:](BuddyTimestamp, "intervalSinceTimestamp:", *((_QWORD *)v60 + 16));
    v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v62[0] = v9;
    v61[1] = CFSTR("startupCause");
    v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v60, "cachedStartupCause"));
    v62[1] = v10;
    v61[2] = CFSTR("exitCause");
    v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v58);
    v62[2] = v11;
    v61[3] = CFSTR("hasCompletedInitialRun");
    v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", BYSetupAssistantHasCompletedInitialRun(v11, v12));
    v62[3] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 4);
    objc_msgSend(v8, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.duration"), v14, 1);

    if (v58 < 3 || v58 - 3 >= 2)
    {
      v15 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
      v16 = objc_msgSend(v15, "aa_primaryAppleAccount");

      if (v16)
      {
        v17 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
        v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("SkipExpressSettingsUpload"));

        v49 = v18 & 1;
        if ((v18 & 1) != 0)
        {
          v48 = (os_log_t)(id)_BYLoggingFacility(v19);
          v47 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v48;
            v21 = v47;
            sub_100038C3C(v46);
            _os_log_impl((void *)&_mh_execute_header, v20, v21, "Skipping express settings upload due to default", v46, 2u);
          }
          objc_storeStrong((id *)&v48, 0);
        }
        else
        {
          location = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
          objc_msgSend(location, "startExpressSettingsUpload");
          objc_storeStrong(&location, 0);
        }
      }
      v44 = 0;
      v22 = objc_msgSend(v60, "environment");
      v23 = objc_msgSend(v22, "suspendTask");
      v24 = objc_msgSend(v23, "launchURL");
      v42 = 0;
      v40 = 0;
      v25 = 1;
      if (v24)
      {
        v43 = objc_msgSend(v60, "environment");
        v42 = 1;
        v41 = objc_msgSend(v43, "lockdownModeProvider");
        v40 = 1;
        v25 = objc_msgSend(v41, "hasStagedEnablement") ^ 1;
      }
      if ((v40 & 1) != 0)

      if ((v42 & 1) != 0)
      v44 = v25 & 1;
      if ((v25 & 1) != 0)
      {
        v39 = (os_log_t)(id)_BYLoggingFacility(v26);
        v38 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v39;
          v28 = v38;
          sub_100038C3C(v37);
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "Monitoring for display layout changes...", v37, 2u);
        }
        objc_storeStrong((id *)&v39, 0);
        v36 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor");
        v31 = _NSConcreteStackBlock;
        v32 = 3221225472;
        v33 = sub_10004984C;
        v34 = &unk_100280BD0;
        v35 = v60;
        objc_msgSend(v36, "setTransitionHandler:", &v31);
        v29 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v36, v31, v32, v33, v34);
        objc_msgSend(v60, "setMonitor:", v29);

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, BYSetupAssistantUISessionNoLongerExclusiveNotification, 0, 0, 1u);
        objc_storeStrong(&v35, 0);
        objc_storeStrong(&v36, 0);
      }
    }
    else
    {
      objc_msgSend(v60, "_willEndLifecycleForDataTransfer");
    }
  }
}

- (void)endLifecycleDueToCause:(unint64_t)a3
{
  BOOL v3;
  UIApplication *v4;
  BOOL v5;
  id v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  BYEnvironment *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  BYEnvironment *v19;
  id v20;
  unsigned __int8 v21;
  BYEnvironment *v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  BYEnvironment *v26;
  id v27;
  id v28;
  BYEnvironment *v29;
  id v30;
  id v31;
  NSDictionary *v32;
  unsigned __int8 v33;
  uint64_t v34;
  NSString *v35;
  BYEnvironment *v36;
  id v37;
  unsigned __int8 v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  NSObject *v42;
  os_log_type_t v43;
  id v44;
  NSBundle *v45;
  NSString *v46;
  NSDictionary *v47;
  NSObject *v48;
  os_log_type_t v49;
  NSObject *v50;
  os_log_type_t v51;
  UIApplication *v52;
  uint8_t v53[7];
  os_log_type_t v54;
  os_log_t v55;
  uint8_t v56[7];
  os_log_type_t v57;
  os_log_t v58;
  uint8_t v59[7];
  os_log_type_t v60;
  os_log_t v61;
  uint8_t v62[7];
  os_log_type_t v63;
  os_log_t v64;
  char v65;
  id v66;
  char v67;
  id v68;
  os_log_type_t v69;
  os_log_t v70;
  id obj;
  id v72;
  uint8_t v73[15];
  os_log_type_t v74;
  os_log_t oslog;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  uint8_t v81[7];
  os_log_type_t v82;
  id v83;
  id v84;
  BOOL v85;
  char v86;
  BOOL v87;
  BOOL v88;
  os_log_type_t v89;
  id location;
  unint64_t v91;
  SEL v92;
  SetupController *v93;
  uint64_t v94;
  void *v95;
  uint8_t v96[16];
  uint64_t v97;
  void *v98;
  uint8_t buf[24];

  v93 = self;
  v92 = a2;
  v91 = a3;
  location = (id)_BYLoggingFacility(self);
  v89 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)buf, v91);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location, v89, "Ending lifecycle due to cause %ld...", buf, 0xCu);
  }
  objc_storeStrong(&location, 0);
  v88 = 1;
  v87 = 0;
  v3 = 1;
  if (v91 != 3)
    v3 = v91 == 4;
  v87 = v3;
  v86 = 0;
  v4 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  v5 = (id)-[UIApplication applicationState](v4, "applicationState") == (id)2;

  v85 = v5;
  v6 = -[SetupController navigationController](v93, "navigationController");
  v7 = objc_msgSend(v6, "viewControllers");
  v8 = objc_msgSend(v7, "lastObject");
  v9 = objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___BFFFlowItem);

  if ((v9 & 1) != 0)
  {
    v11 = -[SetupController navigationController](v93, "navigationController");
    v12 = objc_msgSend(v11, "viewControllers");
    v84 = objc_msgSend(v12, "lastObject");

    if ((objc_opt_respondsToSelector(v84, "allowedTerminationSources") & 1) != 0)
      v88 = objc_msgSend(v84, "allowedTerminationSources") == 0;
    objc_storeStrong(&v84, 0);
  }
  if (v85 && !v88 && !v87)
  {
    v83 = (id)_BYLoggingFacility(v10);
    v82 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v83;
      v14 = v82;
      sub_100038C3C(v81);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Application state is background when attempting to end lifecycle", v81, 2u);
    }
    objc_storeStrong(&v83, 0);
    v86 = 1;
  }
  switch(v91)
  {
    case 0uLL:
    case 2uLL:
      goto LABEL_42;
    case 1uLL:
      v80 = 0;
      v15 = -[SetupController environment](v93, "environment");
      v16 = -[BYEnvironment suspendTask](v15, "suspendTask");
      v17 = objc_msgSend(v16, "launchURL");
      v78 = 0;
      v76 = 0;
      v18 = 0;
      if (v17)
      {
        v79 = -[SetupController environment](v93, "environment");
        v78 = 1;
        v77 = objc_msgSend(v79, "buddyPreferencesExcludedFromBackup");
        v76 = 1;
        v18 = +[BuddySuspendTask hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:](BuddySuspendTask, "hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:");
      }
      if ((v76 & 1) != 0)

      if ((v78 & 1) != 0)
      v80 = v18 & 1;
      v19 = -[SetupController environment](v93, "environment");
      v20 = -[BYEnvironment lockdownModeProvider](v19, "lockdownModeProvider");
      v21 = objc_msgSend(v20, "hasStagedEnablement");

      if ((v21 & 1) != 0)
      {
        if ((v80 & 1) != 0)
        {
          v22 = -[SetupController environment](v93, "environment");
          v23 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v22, "buddyPreferencesExcludedFromBackup");
          objc_msgSend(v23, "setObject:forKey:", &__kCFBooleanTrue, BYBuddyRunStandardMiniBuddy);

        }
        -[SetupController willMarkBuddyComplete](v93, "willMarkBuddyComplete");
        -[SetupController markBuddyComplete](v93, "markBuddyComplete");
        oslog = (os_log_t)(id)_BYLoggingFacility(-[SetupController didMarkBuddyComplete](v93, "didMarkBuddyComplete"));
        v74 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v24 = oslog;
          v25 = v74;
          sub_100038C3C(v73);
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Enabling lockdown...", v73, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        v26 = -[SetupController environment](v93, "environment");
        v27 = -[BYEnvironment lockdownModeProvider](v26, "lockdownModeProvider");
        objc_msgSend(v27, "enableWithStrategy:completionHandler:", 0, &stru_100280BF0);

      }
      else if ((v80 & 1) != 0)
      {
        -[SetupController setShouldLaunchSuspendTaskURL:](v93, "setShouldLaunchSuspendTaskURL:", 1);
        -[SetupController willMarkBuddyComplete](v93, "willMarkBuddyComplete");
        -[SetupController markBuddyComplete](v93, "markBuddyComplete");
        -[SetupController didMarkBuddyComplete](v93, "didMarkBuddyComplete");
        v72 = 0;
        v28 = +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
        v29 = -[SetupController environment](v93, "environment");
        v30 = -[BYEnvironment suspendTask](v29, "suspendTask");
        v31 = objc_msgSend(v30, "launchURL");
        v97 = SBSOpenApplicationOptionKeyLaunchApplicationAfterSetup;
        v98 = &__kCFBooleanTrue;
        v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
        obj = 0;
        v33 = objc_msgSend(v28, "openURL:withOptions:error:", v31, v32, &obj);
        objc_storeStrong(&v72, obj);

        if (((v33 ^ 1) & 1) != 0)
        {
          v70 = (os_log_t)(id)_BYLoggingFacility(v34);
          v69 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            v67 = 0;
            v65 = 0;
            if ((_BYIsInternalInstall() & 1) != 0)
            {
              v35 = (NSString *)v72;
            }
            else if (v72)
            {
              v68 = objc_msgSend(v72, "domain");
              v67 = 1;
              v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v68, objc_msgSend(v72, "code"));
              v66 = v35;
              v65 = 1;
            }
            else
            {
              v35 = 0;
            }
            sub_100039500((uint64_t)v96, (uint64_t)v35);
            _os_log_error_impl((void *)&_mh_execute_header, v70, v69, "Failed to open suspend task URL: %{public}@", v96, 0xCu);
            if ((v65 & 1) != 0)

            if ((v67 & 1) != 0)
          }
          objc_storeStrong((id *)&v70, 0);
          -[SetupController terminate](v93, "terminate");
        }
        objc_storeStrong(&v72, 0);
      }
      else
      {
LABEL_42:
        if (v88 && v85 && v91 == 1)
        {
          v36 = -[SetupController environment](v93, "environment");
          v37 = -[BYEnvironment managedConfiguration](v36, "managedConfiguration");
          v38 = objc_msgSend(v37, "isPasscodeSet");

          if ((v38 & 1) != 0)
          {
            v64 = (os_log_t)(id)_BYLoggingFacility(v39);
            v63 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              v40 = v64;
              v41 = v63;
              sub_100038C3C(v62);
              _os_log_impl((void *)&_mh_execute_header, v40, v41, "Forcing termination since Setup skipped a terminal pane and cannot unlock to suspend...", v62, 2u);
            }
            objc_storeStrong((id *)&v64, 0);
            -[SetupController willMarkBuddyComplete](v93, "willMarkBuddyComplete");
            -[SetupController markBuddyComplete](v93, "markBuddyComplete");
            -[SetupController didMarkBuddyComplete](v93, "didMarkBuddyComplete");
            -[SetupController terminate](v93, "terminate");
          }
          else
          {
            v61 = (os_log_t)(id)_BYLoggingFacility(v39);
            v60 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              v42 = v61;
              v43 = v60;
              sub_100038C3C(v59);
              _os_log_impl((void *)&_mh_execute_header, v42, v43, "Unlocking device, then suspending...", v59, 2u);
            }
            objc_storeStrong((id *)&v61, 0);
            v44 = +[FBSSystemService sharedService](FBSSystemService, "sharedService");
            v45 = +[NSBundle mainBundle](NSBundle, "mainBundle");
            v46 = -[NSBundle bundleIdentifier](v45, "bundleIdentifier");
            v94 = FBSOpenApplicationOptionKeyUnlockDevice;
            v95 = &__kCFBooleanTrue;
            v47 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
            objc_msgSend(v44, "openApplication:options:withResult:", v46, v47, &stru_100280C10);

          }
        }
        else if ((v86 & 1) != 0)
        {
          v58 = (os_log_t)(id)_BYLoggingFacility(v10);
          v57 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v48 = v58;
            v49 = v57;
            sub_100038C3C(v56);
            _os_log_impl((void *)&_mh_execute_header, v48, v49, "Forcing termination since Setup is in the background...", v56, 2u);
          }
          objc_storeStrong((id *)&v58, 0);
          -[SetupController didMarkBuddyComplete](v93, "didMarkBuddyComplete");
          -[SetupController terminate](v93, "terminate");
        }
        else
        {
          v55 = (os_log_t)(id)_BYLoggingFacility(v10);
          v54 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v50 = v55;
            v51 = v54;
            sub_100038C3C(v53);
            _os_log_impl((void *)&_mh_execute_header, v50, v51, "Suspending...", v53, 2u);
          }
          objc_storeStrong((id *)&v55, 0);
          v52 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
          -[UIApplication suspend](v52, "suspend");

        }
      }
      break;
    case 3uLL:
    case 4uLL:
      -[SetupController willMarkBuddyComplete](v93, "willMarkBuddyComplete");
      -[SetupController markBuddyComplete](v93, "markBuddyComplete");
      break;
    default:
      return;
  }
}

- (unint64_t)intendedRestoreType
{
  BYEnvironment *v2;
  id v3;
  id v4;

  v2 = -[SetupController environment](self, "environment");
  v3 = -[BYEnvironment setupMethod](v2, "setupMethod");
  v4 = objc_msgSend(v3, "intendedDataTransferMethod");

  return v4 == (id)1;
}

- (unint64_t)restoreType
{
  BYEnvironment *v2;
  id v3;
  id v4;

  v2 = -[SetupController environment](self, "environment");
  v3 = -[BYEnvironment setupMethod](v2, "setupMethod");
  v4 = objc_msgSend(v3, "dataTransferMethod");

  return v4 == (id)1;
}

- (void)prepareWithCompletion:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  SetupController *v9;
  id v10;
  id location[2];
  SetupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(2, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10004AB34;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)startupCause
{
  return -[SetupController cachedStartupCause](self, "cachedStartupCause", a2, self);
}

- (BOOL)airplaneModeEnabled
{
  unsigned __int8 v2;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)RadiosPreferences);
  v2 = objc_msgSend(location[0], "airplaneMode");
  objc_storeStrong(location, 0);
  return v2 & 1;
}

- (BOOL)shouldBeginRestore
{
  BYEnvironment *v2;
  id v3;
  BYEnvironment *v4;
  id v5;
  unsigned __int8 v6;

  v2 = -[SetupController environment](self, "environment", a2);
  v3 = -[BYEnvironment pendingRestoreState](v2, "pendingRestoreState");
  v4 = -[SetupController environment](self, "environment");
  v5 = -[BYEnvironment buddyPreferences](v4, "buddyPreferences");
  v6 = +[BuddySoftwareUpdateRestoreFlow controllerNeedsToRunWithPendingRestoreState:buddyPreferences:](BuddySoftwareUpdateRestoreFlow, "controllerNeedsToRunWithPendingRestoreState:buddyPreferences:", v3, v5);

  return v6 & 1;
}

- (BOOL)shouldBeginMigration
{
  BYEnvironment *v2;
  id v3;
  unsigned __int8 v4;

  v2 = -[SetupController environment](self, "environment", a2, self);
  v3 = -[BYEnvironment buddyPreferencesExcludedFromBackup](v2, "buddyPreferencesExcludedFromBackup");
  v4 = +[BuddyUpgradeMigrationFlow controllerNeedsToRunWithPreferences:](BuddyUpgradeMigrationFlow, "controllerNeedsToRunWithPreferences:", v3);

  return v4 & 1;
}

- (BOOL)isLanguageSet
{
  NSUserDefaults *v2;
  NSUserDefaults *v3;
  BOOL v4;
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v2 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  location[0] = -[NSUserDefaults stringForKey:](v2, "stringForKey:", CFSTR("Language"));

  v3 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v6 = -[NSUserDefaults objectForKey:](v3, "objectForKey:", CFSTR("LockdownSetLanguage"));

  v4 = 1;
  if (!location[0])
    v4 = v6 != 0;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (BuddyRestoreProvider)restoreProvider
{
  return self;
}

- (BOOL)hasCloudConfiguration
{
  id v2;
  id v3;
  BOOL v4;

  v2 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager", a2, self);
  v3 = objc_msgSend(v2, "cloudConfigurationDetails");
  v4 = v3 != 0;

  return v4;
}

- (BOOL)willSetUpAsNew
{
  BYEnvironment *v2;
  id v3;
  id v4;
  BOOL v5;
  BYEnvironment *v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  char v10;
  BOOL v12;

  v2 = -[SetupController environment](self, "environment");
  v3 = -[BYEnvironment pendingRestoreState](v2, "pendingRestoreState");
  v4 = objc_msgSend(v3, "backupItem");
  v5 = v4 != 0;

  v12 = v5;
  v6 = -[SetupController environment](self, "environment");
  v7 = -[BYEnvironment miscState](v6, "miscState");
  v8 = objc_msgSend(v7, "migrationManager");
  v9 = objc_msgSend(v8, "migrationInProgressOrCompleted");

  v10 = 1;
  if (!v12)
    v10 = v9 & 1;
  return (v10 ^ 1) & 1;
}

- (BuddyFundamentalFlowStartupProvider)startupProvider
{
  return self;
}

- (BuddyLanguageLocaleSelectionReceiver)languageLocaleReceiver
{
  return self;
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  BYEnvironment *v2;
  id v3;

  v2 = -[SetupController environment](self, "environment", a2, self);
  v3 = -[BYEnvironment flowItemDispositionProvider](v2, "flowItemDispositionProvider");

  return (BuddyFlowItemDispositionProvider *)v3;
}

- (BuddyRemoteManagementProvider)remoteManagementProvider
{
  BYEnvironment *v2;
  id v3;

  v2 = -[SetupController environment](self, "environment", a2, self);
  v3 = -[BYEnvironment enrollmentCoordinator](v2, "enrollmentCoordinator");

  return (BuddyRemoteManagementProvider *)v3;
}

- (void)handleDebugGesture
{
  BuddyNavigationFlowController *v2;

  v2 = -[SetupController navigationFlowController](self, "navigationFlowController", a2, self);
  -[BuddyNavigationFlowController handleDebugGesture](v2, "handleDebugGesture");

}

- (BOOL)launchedForMigration
{
  return self->_launchedForMigration;
}

- (void)setLaunchedForMigration:(BOOL)a3
{
  self->_launchedForMigration = a3;
}

- (BOOL)markBuddyCompleteDidRun
{
  return self->_markBuddyCompleteDidRun;
}

- (void)setMarkBuddyCompleteDidRun:(BOOL)a3
{
  self->_markBuddyCompleteDidRun = a3;
}

- (NSArray)viewControllersToRemoveOnPush
{
  return self->_viewControllersToRemoveOnPush;
}

- (void)setViewControllersToRemoveOnPush:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (UIViewController)topViewControllerForRemoving
{
  return self->_topViewControllerForRemoving;
}

- (void)setTopViewControllerForRemoving:(id)a3
{
  objc_storeStrong((id *)&self->_topViewControllerForRemoving, a3);
}

- (BOOL)shouldRereadCloudConfigurationForControllersToSkip
{
  return self->_shouldRereadCloudConfigurationForControllersToSkip;
}

- (void)setShouldRereadCloudConfigurationForControllersToSkip:(BOOL)a3
{
  self->_shouldRereadCloudConfigurationForControllersToSkip = a3;
}

- (id)cloudConfigurationChangeNotificationObserver
{
  return self->_cloudConfigurationChangeNotificationObserver;
}

- (void)setCloudConfigurationChangeNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_cloudConfigurationChangeNotificationObserver, a3);
}

- (WFNetworkListController)modalWifiManager
{
  return self->_modalWifiManager;
}

- (void)setModalWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_modalWifiManager, a3);
}

- (BuddyNavigationFlowController)navigationFlowController
{
  return self->_navigationFlowController;
}

- (void)setNavigationFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationFlowController, a3);
}

- (BuddyFlowProducer)fundamentalFlow
{
  return self->_fundamentalFlow;
}

- (void)setFundamentalFlow:(id)a3
{
  objc_storeStrong((id *)&self->_fundamentalFlow, a3);
}

- (BuddyProximityPairingController)proximityPairingController
{
  return self->_proximityPairingController;
}

- (void)setProximityPairingController:(id)a3
{
  objc_storeStrong((id *)&self->_proximityPairingController, a3);
}

- (NSData)defaultAccessibilitySettings
{
  return self->_defaultAccessibilitySettings;
}

- (void)setDefaultAccessibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAccessibilitySettings, a3);
}

- (BOOL)applyingProximitySettings
{
  return self->_applyingProximitySettings;
}

- (void)setApplyingProximitySettings:(BOOL)a3
{
  self->_applyingProximitySettings = a3;
}

- (BYEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (NSString)userSelectedLanguage
{
  return self->_userSelectedLanguage;
}

- (void)setUserSelectedLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)userSelectedLanguageWithLocale
{
  return self->_userSelectedLanguageWithLocale;
}

- (void)setUserSelectedLanguageWithLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (unint64_t)cachedStartupCause
{
  return self->_cachedStartupCause;
}

- (void)setCachedStartupCause:(unint64_t)a3
{
  self->_cachedStartupCause = a3;
}

- (BuddyFlowDiverter)flowDiverter
{
  return self->_flowDiverter;
}

- (void)setFlowDiverter:(id)a3
{
  objc_storeStrong((id *)&self->_flowDiverter, a3);
}

- (UIViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (void)setBackgroundViewController:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundViewController, a3);
}

- (NSArray)preferredLanguagesAtStartup
{
  return self->_preferredLanguagesAtStartup;
}

- (void)setPreferredLanguagesAtStartup:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLanguagesAtStartup, a3);
}

- (FBSDisplayLayoutMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (BOOL)shouldLaunchSuspendTaskURL
{
  return self->_shouldLaunchSuspendTaskURL;
}

- (void)setShouldLaunchSuspendTaskURL:(BOOL)a3
{
  self->_shouldLaunchSuspendTaskURL = a3;
}

- (BuddyNavigationAnalytics)navigationAnalytics
{
  return self->_navigationAnalytics;
}

- (void)setNavigationAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_navigationAnalytics, a3);
}

- (BuddySetupAnalytics)setupAnalytics
{
  return self->_setupAnalytics;
}

- (void)setSetupAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_setupAnalytics, a3);
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_pathMonitor, a3);
}

- (BuddyInactivityTimer)inactivityTimer
{
  return self->_inactivityTimer;
}

- (void)setInactivityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_inactivityTimer, a3);
}

- (BOOL)shouldProceedFromAppearancePane
{
  return self->_shouldProceedFromAppearancePane;
}

- (void)setShouldProceedFromAppearancePane:(BOOL)a3
{
  self->_shouldProceedFromAppearancePane = a3;
}

- (BOOL)allowDismissalForExit
{
  return self->_allowDismissalForExit;
}

- (void)setAllowDismissalForExit:(BOOL)a3
{
  self->_allowDismissalForExit = a3;
}

- (BYGreenController)greenController
{
  return self->_greenController;
}

- (void)setGreenController:(id)a3
{
  objc_storeStrong((id *)&self->_greenController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenController, 0);
  objc_storeStrong((id *)&self->_inactivityTimer, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_setupAnalytics, 0);
  objc_storeStrong((id *)&self->_navigationAnalytics, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_preferredLanguagesAtStartup, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_flowDiverter, 0);
  objc_storeStrong((id *)&self->_userSelectedLanguageWithLocale, 0);
  objc_storeStrong((id *)&self->_userSelectedLanguage, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_defaultAccessibilitySettings, 0);
  objc_storeStrong((id *)&self->_proximityPairingController, 0);
  objc_storeStrong((id *)&self->_fundamentalFlow, 0);
  objc_storeStrong((id *)&self->_navigationFlowController, 0);
  objc_storeStrong((id *)&self->_modalWifiManager, 0);
  objc_storeStrong(&self->_cloudConfigurationChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_topViewControllerForRemoving, 0);
  objc_storeStrong((id *)&self->_viewControllersToRemoveOnPush, 0);
  objc_storeStrong((id *)&self->_passcodeFlow, 0);
  objc_storeStrong((id *)&self->_menuButtonConsumer, 0);
  objc_storeStrong((id *)&self->_nav, 0);
  objc_storeStrong((id *)&self->_TFDEPPollTimer, 0);
  objc_storeStrong((id *)&self->_languageObserver, 0);
  objc_storeStrong((id *)&self->_emergencyDialer, 0);
  objc_storeStrong((id *)&self->_localeIdentifierAtStartup, 0);
  objc_storeStrong((id *)&self->_languageAtStartup, 0);
  objc_storeStrong((id *)&self->_homeButtonMenuController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
