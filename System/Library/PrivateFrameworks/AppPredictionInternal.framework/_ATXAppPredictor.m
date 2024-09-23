@implementation _ATXAppPredictor

- (id)appIntentMonitor
{
  ATXAppIntentMonitor *appIntentMonitor;

  if (-[_ATXAppPredictor _initAppLaunchAndInstallMonitors](self, "_initAppLaunchAndInstallMonitors"))
    appIntentMonitor = self->_appIntentMonitor;
  else
    appIntentMonitor = 0;
  return appIntentMonitor;
}

- (BOOL)_initAppLaunchAndInstallMonitors
{
  unsigned __int8 v2;
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];

  v2 = atomic_load((unsigned __int8 *)&self->_appLaunchAndInstallMonitorsInitialized);
  if ((v2 & 1) != 0)
    return 1;
  if (!objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52___ATXAppPredictor__initAppLaunchAndInstallMonitors__block_invoke;
    block[3] = &unk_1E82E00B0;
    block[4] = self;
    dispatch_sync(queue, block);
    return 1;
  }
  __atxlog_handle_app_prediction();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[_ATXAppPredictor _initAppLaunchAndInstallMonitors].cold.1();

  return 0;
}

+ (id)sharedInstance
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  pthread_mutex_lock(&sharedInstanceLock);
  v2 = (void *)sharedInstance;
  if (!sharedInstance)
  {
    v3 = -[_ATXAppPredictor initInternal]([_ATXAppPredictor alloc], "initInternal");
    v4 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v3;

    v2 = (void *)sharedInstance;
  }
  v5 = v2;
  pthread_mutex_unlock(&sharedInstanceLock);
  return v5;
}

- (id)_allDayZeroApps
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CF8D28], "dayZeroBundleIdsAndScoresFromDayZeroParameters:", self->_dayZeroParameters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v3);

  return v4;
}

- (id)_appPredictionsSeedAppsGivenSBAppList:(id)a3 consumerSubType:(unsigned __int8)a4 minimumDesiredApps:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = objc_alloc(MEMORY[0x1E0C99E20]);
  if (v7)
    v9 = v7;
  else
    v9 = (id)MEMORY[0x1E0C9AA60];
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);
  -[_ATXRecentInstallCache allRecentlyInstalledApplications](self->_recentInstallCache, "allRecentlyInstalledApplications");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v11);

  -[_ATXAppPredictor _allDayZeroApps](self, "_allDayZeroApps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppInfoManager allAppsLaunchedOrInstalledWithin30Days](self->_appInfoManager, "allAppsLaunchedOrInstalledWithin30Days");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unionSet:", v13);

  objc_msgSend(v10, "intersectSet:", v12);
  if (objc_msgSend(v10, "count") < a5)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v9);
    objc_msgSend(v14, "minusSet:", v10);
    +[_ATXAppPredictor _arrayFromSet:upToSize:](_ATXAppPredictor, "_arrayFromSet:upToSize:", v14, a5 - objc_msgSend(v10, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v15);

  }
  return v10;
}

+ (id)_arrayFromSet:(id)a3 upToSize:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (objc_msgSend(v5, "count") <= a4)
  {
    objc_msgSend(v5, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subarrayWithRange:", 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_appsToPredictWithConsumerSubType:(unsigned __int8)a3 intent:(id)a4 candidateBundleIdentifiers:(id)a5 allSBApps:(id)a6 appPredictionBlacklist:(id)a7 digitalHealthBlacklist:(id)a8
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;

  v11 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (objc_msgSend(v13, "count"))
  {
    if (v13)
      v17 = v13;
    else
      v17 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_ATXAppPredictor _appPredictionsSeedAppsGivenSBAppList:consumerSubType:minimumDesiredApps:](self, "_appPredictionsSeedAppsGivenSBAppList:consumerSubType:minimumDesiredApps:", v14, v11, 40);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  v20 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", v11);
  if (v20 <= 0xF && ((1 << v20) & 0xC006) != 0 && v15)
    objc_msgSend(v19, "minusSet:", v15);
  if (v16)
    objc_msgSend(v19, "minusSet:", v16);

  return v19;
}

- (vector<ATXPredictionItem,)_evalFeaturesForAppForAllIntents:(_ATXAppPredictor *)self scoreLogger:(SEL)a3 context:(id)a4
{
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  unint64_t v41;
  double v42;
  void *v43;
  id v44;
  uint64_t i;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  _ATXAppLaunchLocation *appLaunchLocation;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  ATXPredictionItem *v96;
  void *v97;
  NSString *key;
  id v99;
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *result;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v110;
  void *v111;
  id v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  _DWORD v125[824];

  v120 = a4;
  v101 = a5;
  v113 = a6;
  objc_msgSend(v113, "timeContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v120, "count");
  std::vector<ATXPredictionItem>::vector(retstr, v10);
  objc_msgSend(v113, "deviceStateContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v11, "inAirplaneMode");

  objc_msgSend(v113, "userContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastUnlockDate");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v113, "deviceStateContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wifiSSID");
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v113, "locationMotionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "motionType");

  objc_msgSend(MEMORY[0x1E0D80E00], "getMotionStringFromMotionType:", v15);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "locationMotionContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentLOI");
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "histogramForLaunchType:", 16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "histogramForLaunchType:", 19);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "histogramForLaunchType:", 25);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "histogramForLaunchType:", 28);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "histogramForLaunchType:", 22);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "categoricalHistogramForLaunchType:", 31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "categoricalHistogramForLaunchType:", 39);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "categoricalHistogramForLaunchType:", 33);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "categoricalHistogramForLaunchType:", 34);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entropy");
  v108 = v21;
  objc_msgSend(v19, "entropy");
  v107 = v22;
  objc_msgSend(v19, "entropyForDate:", v9);
  v106 = v23;
  objc_msgSend(v123, "entropy");
  v105 = v24;
  v121 = v19;
  objc_msgSend(v20, "entropy");
  v26 = v25;
  v104 = v15;
  objc_msgSend(v20, "entropyForCategory:", v122);
  if (v10 >= 1)
  {
    v28 = v27;
    v29 = 0;
    v30 = 0.0;
    v31 = 0.0;
    v32 = 0.0;
    do
    {
      objc_msgSend(v120, "objectAtIndexedSubscript:", v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "overallLaunchPopularityForBundleId:", v33);
      v35 = v34;
      objc_msgSend(v19, "relativeLaunchPopularityWithBundleId:date:", v33, v9);
      v37 = v36;
      objc_msgSend(v123, "relativeLaunchPopularityWithBundleId:date:", v33, v9);
      v39 = v38;
      objc_msgSend(v20, "relativeLaunchPopularityWithBundleId:category:", v33, v122);
      v32 = v32 + vabdd_f64(v35, v37);
      v31 = v31 + vabdd_f64(v35, v39);
      v30 = v30 + vabdd_f64(v35, v40);

      ++v29;
    }
    while (v10 != v29);
    v103 = v10;
    v41 = 0;
    v42 = (double)v10;
    do
    {
      v43 = (void *)MEMORY[0x1CAA48B6C]();
      objc_msgSend(v120, "objectAtIndexedSubscript:", v41);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v124 = v44;
      *(float *)&v125[819] = -31337.0;
      LOWORD(v125[820]) = 0;
      for (i = 4; i != 821; ++i)
        *(float *)&v125[i - 2] = -31337.0;
      objc_msgSend(v18, "overallLaunchPopularityForBundleId:", v44);
      *(float *)&v47 = ATXSetInput((uint64_t)&v124, 0x9DuLL, v46);
      objc_msgSend(v18, "launchPopularityWithBundleId:date:", v44, v9, v47);
      *(float *)&v49 = ATXSetInput((uint64_t)&v124, 0xA7uLL, v48);
      objc_msgSend(v18, "relativeLaunchPopularityWithBundleId:date:", v44, v9, v49);
      ATXSetInput((uint64_t)&v124, 0x9EuLL, v50);
      LODWORD(v51) = 1036831949;
      objc_msgSend(v18, "relativeLaunchPopularityWithBundleId:date:distanceScale:", v44, v9, v51);
      *(float *)&v53 = ATXSetInput((uint64_t)&v124, 0xA0uLL, v52);
      objc_msgSend(v18, "totalLaunches", v53);
      *(float *)&v55 = ATXSetInput((uint64_t)&v124, 0x98uLL, v54);
      objc_msgSend(v121, "launchPopularityWithBundleId:date:", v44, v9, v55);
      *(float *)&v57 = ATXSetInput((uint64_t)&v124, 0xA8uLL, v56);
      objc_msgSend(v121, "relativeLaunchPopularityWithBundleId:date:", v44, v9, v57);
      *(float *)&v59 = ATXSetInput((uint64_t)&v124, 0x9FuLL, v58);
      if (v114)
      {
        objc_msgSend(v9, "timeIntervalSinceDate:", v114, v59);
        if (v60 >= 0.0)
        {
          HIDWORD(v61) = 1085021696;
          if (v60 >= 3600.0)
            v60 = 3599.0;
          LODWORD(v61) = 1.0;
          objc_msgSend(v102, "relativeLaunchPopularityWithBundleId:elapsedTime:distanceScale:", v44, v60, v61);
          ATXSetInput((uint64_t)&v124, 0xA1uLL, v62);
        }
      }
      v63 = 0.0;
      if (v115)
        objc_msgSend(v111, "overallLaunchPopularityForBundleId:", v44, 0.0);
      ATXSetInput((uint64_t)&v124, 0xA2uLL, v63);
      v64 = 0.0;
      if (v115)
        objc_msgSend(v111, "totalLaunches", 0.0);
      *(float *)&v65 = ATXSetInput((uint64_t)&v124, 0x99uLL, v64);
      objc_msgSend(v123, "overallLaunchPopularityForBundleId:", v44, v65);
      *(float *)&v67 = ATXSetInput((uint64_t)&v124, 0xA5uLL, v66);
      objc_msgSend(v123, "totalLaunches", v67);
      *(float *)&v69 = ATXSetInput((uint64_t)&v124, 0x9CuLL, v68);
      objc_msgSend(v20, "overallLaunchPopularityForBundleId:category:", v44, v122, v69);
      *(float *)&v71 = ATXSetInput((uint64_t)&v124, 0xA3uLL, v70);
      objc_msgSend(v20, "totalLaunchesForCategory:", v122, v71);
      *(float *)&v73 = ATXSetInput((uint64_t)&v124, 0x9AuLL, v72);
      objc_msgSend(v118, "overallLaunchPopularityForBundleId:category:", v44, v119, v73);
      *(float *)&v75 = ATXSetInput((uint64_t)&v124, 0xA4uLL, v74);
      objc_msgSend(v118, "totalLaunchesForCategory:", v119, v75);
      *(float *)&v77 = ATXSetInput((uint64_t)&v124, 0x9BuLL, v76);
      appLaunchLocation = self->_appLaunchLocation;
      objc_msgSend(v113, "locationMotionContext", v77);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "currentLOI");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ATXAppLaunchLocation launchProbabilityAtLOI:appForAllIntentsBundleId:](appLaunchLocation, "launchProbabilityAtLOI:appForAllIntentsBundleId:", v80, v44);
      ATXSetInput((uint64_t)&v124, 0xA6uLL, v81);

      ATXSetInput((uint64_t)&v124, 0xA9uLL, v108);
      ATXSetInput((uint64_t)&v124, 0xAAuLL, v107);
      *(float *)&v82 = ATXSetInput((uint64_t)&v124, 0xABuLL, v106);
      objc_msgSend(v121, "entropyForBundleId:", v44, v82);
      ATXSetInput((uint64_t)&v124, 0xACuLL, v83);
      ATXSetInput((uint64_t)&v124, 0xB2uLL, v32);
      ATXSetInput((uint64_t)&v124, 0xADuLL, v105);
      ATXSetInput((uint64_t)&v124, 0xB3uLL, v31);
      ATXSetInput((uint64_t)&v124, 0xAEuLL, v26);
      *(float *)&v84 = ATXSetInput((uint64_t)&v124, 0xAFuLL, v28);
      objc_msgSend(v20, "entropyForBundleId:", v44, v84);
      ATXSetInput((uint64_t)&v124, 0xB0uLL, v85);
      ATXSetInput((uint64_t)&v124, 0xB1uLL, v30);
      *(float *)&v86 = ATXSetInput((uint64_t)&v124, 0x97uLL, v42);
      objc_msgSend(v117, "totalLaunchesForBundleId:", v44, v86);
      *(float *)&v88 = ATXSetInput((uint64_t)&v124, 0xB4uLL, v87);
      objc_msgSend(v116, "totalLaunchesForBundleId:", v44, v88);
      *(float *)&v90 = ATXSetInput((uint64_t)&v124, 0xB5uLL, v89);
      objc_msgSend(v117, "totalLaunches", v90);
      *(float *)&v92 = ATXSetInput((uint64_t)&v124, 0xB6uLL, v91);
      objc_msgSend(v116, "totalLaunches", v92);
      *(float *)&v94 = ATXSetInput((uint64_t)&v124, 0xB7uLL, v93);
      *(float *)&v95 = ATXSetInput((uint64_t)&v124, 0x178uLL, (double)+[ATXAWDUtils awdMotionTypeWithMotionType:](ATXAWDUtils, "awdMotionTypeWithMotionType:", v104, v94));
      if (v110)
        ATXSetInput((uint64_t)&v124, 0x179uLL, (double)+[ATXAWDUtils awdLOITypeWithRTLOI:](ATXAWDUtils, "awdLOITypeWithRTLOI:", objc_msgSend(v110, "type", v95)));
      else
        v125[379] = 0;
      if (0xDAB7EC1DD3431B57 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) <= v41)
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      v96 = &retstr->__begin_[v41];
      v97 = v124;
      key = v96->key;
      v96->key = (NSString *)v124;
      v99 = v97;

      memcpy(&v96->actionHash, v125, 0xCD2uLL);
      objc_autoreleasePoolPop(v43);
      ++v41;
    }
    while (v41 != v103);
  }

  return result;
}

- (vector<ATXPredictionItem,)_evalFeaturesForAppIntents:(_ATXAppPredictor *)self scoreLogger:(SEL)a3 context:(id)a4
{
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _UNKNOWN **v48;
  unint64_t v49;
  double v50;
  unint64_t v51;
  uint64_t i;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  _ATXAppLaunchLocation *appLaunchLocation;
  void *v105;
  void *v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  unint64_t v147;
  ATXPredictionItem *v148;
  void *v149;
  NSString *key;
  id v151;
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *result;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  double v163;
  double v164;
  void *v165;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *context;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  id v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  id v187;
  void *v188;
  void *v189;
  void *v190;
  id v191;
  id v192;
  float v193[824];

  v179 = a4;
  v153 = a5;
  v187 = a6;
  objc_msgSend(v187, "timeContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v179, "count");
  std::vector<ATXPredictionItem>::vector(retstr, v11);
  objc_msgSend(v187, "deviceStateContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "inAirplaneMode");

  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "userContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastUnlockDate");
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v187, "deviceStateContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "wifiSSID");
  v185 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D80E00];
  objc_msgSend(v187, "locationMotionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "getMotionStringFromMotionType:", objc_msgSend(v17, "motionType"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v184, "totalSlotsInDatastore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v164 = v19;

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "histogramForLaunchType:", 14);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "histogramForLaunchType:", 17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "histogramForLaunchType:", 23);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "histogramForLaunchType:", 26);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "histogramForLaunchType:", 20);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "categoricalHistogramForLaunchType:", 29);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "categoricalHistogramForLaunchType:", 38);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "categoricalHistogramForLaunchType:", 40);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "categoricalHistogramForLaunchType:", 41);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "userContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastAppActionLaunch");
  v22 = objc_claimAutoreleasedReturnValue();

  v155 = (void *)v22;
  if (v22)
  {
    +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "launchSequenceForAppAction:", v22);
    v169 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v169 = 0;
  }
  objc_msgSend(v187, "userContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "secondMostRecentAppLaunch");
  v25 = objc_claimAutoreleasedReturnValue();

  v162 = v10;
  v154 = (void *)v25;
  if (v25)
  {
    +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:#AppLaunched"), v25, v153);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "launchSequenceForAppAction:", v27);
    v168 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v168 = 0;
  }
  objc_msgSend(v156, "categoricalHistogramForLaunchType:", 33);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "categoricalHistogramForLaunchType:", 34);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "entropy");
  v163 = v28;
  objc_msgSend(v20, "entropy");
  v161 = v29;
  objc_msgSend(v20, "entropyForDate:", v10);
  v160 = v30;
  objc_msgSend(v186, "entropy");
  v159 = v31;
  objc_msgSend(v189, "entropy");
  v33 = v32;
  objc_msgSend(v189, "entropyForCategory:", v185);
  v35 = v34;
  if (v11 < 1)
  {
    v39 = 0.0;
    v38 = 0.0;
    v37 = 0.0;
  }
  else
  {
    v36 = 0;
    v37 = 0.0;
    v38 = 0.0;
    v39 = 0.0;
    do
    {
      objc_msgSend(v179, "objectAtIndexedSubscript:", v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "overallLaunchPopularityForBundleId:", v40);
      v42 = v41;
      objc_msgSend(v20, "relativeLaunchPopularityWithBundleId:date:", v40, v10);
      v44 = v43;
      objc_msgSend(v186, "relativeLaunchPopularityWithBundleId:date:", v40, v10);
      v46 = v45;
      objc_msgSend(v189, "relativeLaunchPopularityWithBundleId:category:", v40, v185);
      v39 = v39 + vabdd_f64(v42, v44);
      v38 = v38 + vabdd_f64(v42, v46);
      v37 = v37 + vabdd_f64(v42, v47);

      ++v36;
    }
    while (v11 != v36);
  }
  v48 = &off_1E82D9000;
  +[_ATXActionUtils partOfWeekStringForDate:](_ATXActionUtils, "partOfWeekStringForDate:", v10);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 >= 1)
  {
    v49 = 0;
    v50 = (double)v11;
    v158 = v11;
    v188 = v20;
    do
    {
      context = (void *)MEMORY[0x1CAA48B6C]();
      v51 = v49;
      objc_msgSend(v179, "objectAtIndexedSubscript:", v49);
      v191 = (id)objc_claimAutoreleasedReturnValue();
      v192 = v191;
      v193[819] = -31337.0;
      LOWORD(v193[820]) = 0;
      for (i = 4; i != 821; ++i)
        v193[i - 2] = -31337.0;
      *(float *)&v53 = ATXSetInput((uint64_t)&v192, 0x66uLL, v164);
      objc_msgSend(v190, "overallLaunchPopularityForBundleId:", v191, v53);
      *(float *)&v55 = ATXSetInput((uint64_t)&v192, 0x6FuLL, v54);
      objc_msgSend(v190, "launchPopularityWithBundleId:date:", v191, v10, v55);
      *(float *)&v57 = ATXSetInput((uint64_t)&v192, 0x7CuLL, v56);
      objc_msgSend(v190, "relativeLaunchPopularityWithBundleId:date:", v191, v10, v57);
      ATXSetInput((uint64_t)&v192, 0x71uLL, v58);
      LODWORD(v59) = 1036831949;
      objc_msgSend(v190, "relativeLaunchPopularityWithBundleId:date:distanceScale:", v191, v10, v59);
      *(float *)&v61 = ATXSetInput((uint64_t)&v192, 0x72uLL, v60);
      objc_msgSend(v190, "totalLaunches", v61);
      *(float *)&v63 = ATXSetInput((uint64_t)&v192, 0x67uLL, v62);
      objc_msgSend(v188, "launchPopularityWithBundleId:date:", v191, v10, v63);
      *(float *)&v65 = ATXSetInput((uint64_t)&v192, 0x7DuLL, v64);
      objc_msgSend(v188, "relativeLaunchPopularityWithBundleId:date:", v191, v10, v65);
      *(float *)&v67 = ATXSetInput((uint64_t)&v192, 0x73uLL, v66);
      if (v170)
      {
        objc_msgSend(v10, "timeIntervalSinceDate:", v170, v67);
        if (v67 >= 0.0)
        {
          HIDWORD(v68) = 1085021696;
          if (v67 >= 3600.0)
            v67 = 3599.0;
          LODWORD(v68) = 1.0;
          objc_msgSend(v157, "relativeLaunchPopularityWithBundleId:elapsedTime:distanceScale:", v191, v67, v68);
          *(float *)&v67 = ATXSetInput((uint64_t)&v192, 0x74uLL, v69);
        }
      }
      objc_msgSend(v184, "lastAppActionLaunchDateForActionKey:", v191, v67);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "timeContext");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "date");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      ATXSetInputAge((uint64_t)&v192, 0x7EuLL, v70, v72);

      objc_msgSend(v184, "averageSecondsBetweenAppActionsForActionKey:", v191);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      if (v181)
      {
        objc_msgSend(v181, "doubleValue");
        *(float *)&v73 = ATXSetInput((uint64_t)&v192, 0x7FuLL, v74);
      }
      objc_msgSend(v184, "medianSecondsBetweenAppActionsForActionKey:", v191, v73);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      if (v180)
      {
        objc_msgSend(v180, "doubleValue");
        *(float *)&v75 = ATXSetInput((uint64_t)&v192, 0x80uLL, v76);
      }
      objc_msgSend(v167, "overallLaunchPopularityForBundleId:", v191, v75);
      if (!v13)
        v77 = 0.0;
      ATXSetInput((uint64_t)&v192, 0x77uLL, v77);
      v78 = 0.0;
      if (v13)
        objc_msgSend(v167, "totalLaunches", 0.0);
      *(float *)&v79 = ATXSetInput((uint64_t)&v192, 0x68uLL, v78);
      objc_msgSend(v186, "overallLaunchPopularityForBundleId:", v191, v79);
      *(float *)&v81 = ATXSetInput((uint64_t)&v192, 0x70uLL, v80);
      objc_msgSend(v186, "totalLaunches", v81);
      *(float *)&v83 = ATXSetInput((uint64_t)&v192, 0x6BuLL, v82);
      objc_msgSend(v189, "overallLaunchPopularityForBundleId:category:", v191, v185, v83);
      *(float *)&v85 = ATXSetInput((uint64_t)&v192, 0x75uLL, v84);
      objc_msgSend(v189, "totalLaunchesForCategory:", v185, v85);
      *(float *)&v87 = ATXSetInput((uint64_t)&v192, 0x69uLL, v86);
      objc_msgSend(v177, "overallLaunchPopularityForBundleId:category:", v191, v178, v87);
      *(float *)&v89 = ATXSetInput((uint64_t)&v192, 0x76uLL, v88);
      objc_msgSend(v177, "totalLaunchesForCategory:", v178, v89);
      *(float *)&v91 = ATXSetInput((uint64_t)&v192, 0x6AuLL, v90);
      objc_msgSend(v176, "launchPopularityWithBundleId:category:", v191, v175, v91);
      *(float *)&v93 = ATXSetInput((uint64_t)&v192, 0x4FuLL, v92);
      objc_msgSend(v176, "relativeLaunchPopularityWithBundleId:category:", v191, v175, v93);
      *(float *)&v95 = ATXSetInput((uint64_t)&v192, 0x50uLL, v94);
      objc_msgSend(v187, "ambientLightContext", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v96, "ambientLightType");

      if ((_DWORD)v97 != 7)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "stringValue");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "launchPopularityWithBundleId:category:", v191, v99);
        ATXSetInput((uint64_t)&v192, 0x188uLL, v100);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v97);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "stringValue");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "relativeLaunchPopularityWithBundleId:category:", v191, v102);
        ATXSetInput((uint64_t)&v192, 0x187uLL, v103);

      }
      appLaunchLocation = self->_appLaunchLocation;
      objc_msgSend(v187, "locationMotionContext");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "currentLOI");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ATXAppLaunchLocation launchProbabilityAtLOI:appIntent:](appLaunchLocation, "launchProbabilityAtLOI:appIntent:", v106, v191);
      ATXSetInput((uint64_t)&v192, 0x78uLL, v107);

      -[ATXAppLaunchMicroLocation popularityAtCurrentMicroLocationForActionKey:](self->_microLocation, "popularityAtCurrentMicroLocationForActionKey:", v191);
      *(float *)&v109 = ATXSetInput((uint64_t)&v192, 0x79uLL, v108);
      -[NSDictionary objectForKeyedSubscript:](self->_dayZeroIntentParameters, "objectForKeyedSubscript:", CFSTR("dayZero"), v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("dayZeroBumps"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "objectForKeyedSubscript:", v191);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v112, "doubleValue");
      *(float *)&v114 = ATXSetInput((uint64_t)&v192, 0x81uLL, v113);
      -[NSDictionary objectForKeyedSubscript:](self->_dayZeroIntentParameters, "objectForKeyedSubscript:", CFSTR("staticPenalties"), v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "objectForKeyedSubscript:", v191);
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v116, "doubleValue");
      *(float *)&v118 = ATXSetInput((uint64_t)&v192, 0x82uLL, v117);
      -[NSDictionary objectForKeyedSubscript:](self->_dayZeroIntentParameters, "objectForKeyedSubscript:", CFSTR("valueScores"), v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "objectForKeyedSubscript:", v191);
      v120 = (void *)objc_claimAutoreleasedReturnValue();

      v183 = v120;
      objc_msgSend(v120, "doubleValue");
      *(float *)&v122 = ATXSetInput((uint64_t)&v192, 0x83uLL, v121);
      -[NSDictionary objectForKeyedSubscript:](self->_dayZeroIntentParameters, "objectForKeyedSubscript:", CFSTR("intentCategories"), v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48[65], "getActionTypeFromActionKey:", v191);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "objectForKeyedSubscript:", v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();

      *(float *)&v126 = ATXSetInput((uint64_t)&v192, 0x85uLL, (double)(int)objc_msgSend(v125, "intValue"));
      -[NSDictionary objectForKeyedSubscript:](self->_dayZeroIntentParameters, "objectForKeyedSubscript:", CFSTR("actionKeyCategories"), v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = v112;
      objc_msgSend(v127, "objectForKeyedSubscript:", v191);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      *(float *)&v129 = ATXSetInput((uint64_t)&v192, 0x86uLL, (double)(int)objc_msgSend(v128, "intValue"));
      if (v169)
      {
        objc_msgSend(v169, "likelihoodForLaunch:", v191, v129);
        *(float *)&v129 = ATXSetInput((uint64_t)&v192, 0x7AuLL, v130);
      }
      if (v168)
      {
        objc_msgSend(v168, "likelihoodForLaunch:", v191, v129);
        ATXSetInput((uint64_t)&v192, 0x7BuLL, v131);
      }
      ATXSetInput((uint64_t)&v192, 0x88uLL, v163);
      ATXSetInput((uint64_t)&v192, 0x89uLL, v161);
      *(float *)&v132 = ATXSetInput((uint64_t)&v192, 0x8AuLL, v160);
      objc_msgSend(v188, "entropyForBundleId:", v191, v132);
      ATXSetInput((uint64_t)&v192, 0x8BuLL, v133);
      ATXSetInput((uint64_t)&v192, 0x90uLL, v39);
      ATXSetInput((uint64_t)&v192, 0x8CuLL, v159);
      ATXSetInput((uint64_t)&v192, 0x91uLL, v38);
      ATXSetInput((uint64_t)&v192, 0x8DuLL, v33);
      *(float *)&v134 = ATXSetInput((uint64_t)&v192, 0x8EuLL, v35);
      objc_msgSend(v189, "entropyForBundleId:", v191, v134);
      ATXSetInput((uint64_t)&v192, 0x8FuLL, v135);
      ATXSetInput((uint64_t)&v192, 0x92uLL, v37);
      *(float *)&v136 = ATXSetInput((uint64_t)&v192, 0x65uLL, v50);
      v171 = v128;
      +[_ATXActionUtils getBundleIdFromActionKey:](_ATXActionUtils, "getBundleIdFromActionKey:", v191, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v191);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "totalLaunchesForBundleId:category:", v137, v138);
      *(float *)&v140 = ATXSetInput((uint64_t)&v192, 0x93uLL, v139);
      objc_msgSend(v173, "totalLaunchesForBundleId:category:", v137, v138, v140);
      *(float *)&v142 = ATXSetInput((uint64_t)&v192, 0x94uLL, v141);
      objc_msgSend(v174, "totalLaunches", v142);
      *(float *)&v144 = ATXSetInput((uint64_t)&v192, 0x95uLL, v143);
      objc_msgSend(v173, "totalLaunches", v144);
      ATXSetInput((uint64_t)&v192, 0x96uLL, v145);
      v146 = v125;
      if (0xDAB7EC1DD3431B57 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) <= v51)
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      v147 = v51;
      v148 = &retstr->__begin_[v51];
      v149 = v192;
      key = v148->key;
      v148->key = (NSString *)v192;
      v151 = v149;

      memcpy(&v148->actionHash, v193, 0xCD2uLL);
      objc_autoreleasePoolPop(context);
      v49 = v147 + 1;
      v10 = v162;
      v20 = v188;
      v48 = &off_1E82D9000;
    }
    while (v49 != v158);
  }

  return result;
}

- (unordered_map<NSString)_createMapOfKeyToItemForPredictionItems:()ATXNSStringHash
{
  size_t v6;
  unordered_map<NSString *, const ATXPredictionItem *, ATXNSStringHash, ATXNSStringEqual, std::allocator<std::pair<NSString *const, const ATXPredictionItem *>>> *result;
  id *v8;
  id *v9;
  __int128 v10;

  v6 = 0xDAB7EC1DD3431B57 * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 5);
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::__rehash<true>((uint64_t)retstr, v6);
  v9 = *(id **)a4;
  v8 = (id *)*((_QWORD *)a4 + 1);
  while (v9 != v8)
  {
    *(_QWORD *)&v10 = *v9;
    *((_QWORD *)&v10 + 1) = v9;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem const*>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem const*>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem const*>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem const*>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * {__strong},ATXPredictionItem const*>>((uint64_t)retstr, (id *)&v10, &v10);

    v9 += 412;
  }
  return result;
}

- (void)_copyValidScoreInputsFromPredictionItem:(const ATXPredictionItem *)a3 toPredictionItem:(ATXPredictionItem *)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77___ATXAppPredictor__copyValidScoreInputsFromPredictionItem_toPredictionItem___block_invoke;
  v4[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
  v4[4] = a3;
  v4[5] = a4;
  +[_ATXScoreTypes iterScoreInputsWithBlock:](_ATXScoreTypes, "iterScoreInputsWithBlock:", v4);
}

- (vector<ATXPredictionItem,)_evalFeaturesForActions:(_ATXAppPredictor *)self scoreLogger:(SEL)a3 context:(id)a4 featureCache:(id)a5
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  ATXAppFeaturizer *appFeaturizer;
  unordered_map<NSString *, const ATXPredictionItem *, ATXNSStringHash, ATXNSStringEqual, std::allocator<std::pair<NSString *const, const ATXPredictionItem *>>> *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  ATXPredictionItem *v24;
  uint64_t **v25;
  uint64_t v26;
  unordered_map<NSString *, const ATXPredictionItem *, ATXNSStringHash, ATXNSStringEqual, std::allocator<std::pair<NSString *const, const ATXPredictionItem *>>> *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  ATXPredictionItem *v32;
  uint64_t **v33;
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *result;
  void *v35;
  void *context;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void **v46[5];
  _QWORD v47[4];

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(v12, "count");
  -[_ATXAppPredictor _evalFeaturesForAppIntents:scoreLogger:context:](self, "_evalFeaturesForAppIntents:scoreLogger:context:", v12, v13, v14);
  +[_ATXActionUtils getBundleIdsFromActionKeys:](_ATXActionUtils, "getBundleIdsFromActionKeys:", v12);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1CAA48B6C]();
  appFeaturizer = self->_appFeaturizer;
  if (appFeaturizer)
    -[ATXAppFeaturizer evaluateFeaturesForApps:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:](appFeaturizer, "evaluateFeaturesForApps:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:", v44, 0, 4, 0, v13, v14, v15);
  else
    memset(v47, 0, 24);
  v38 = v15;
  v42 = v14;
  v43 = v13;
  v39 = v12;
  v19 = -[_ATXAppPredictor _createMapOfKeyToItemForPredictionItems:](self, "_createMapOfKeyToItemForPredictionItems:", v47);
  v40 = v16;
  if (v16 >= 1)
  {
    v20 = 0;
    v21 = v16;
    do
    {
      v22 = MEMORY[0x1CAA48B6C](v19);
      if (0xDAB7EC1DD3431B57 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) <= v20)
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      v23 = (void *)v22;
      v24 = &retstr->__begin_[v20];
      +[_ATXActionUtils getBundleIdFromActionKey:](_ATXActionUtils, "getBundleIdFromActionKey:", v24->key);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v25 = std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::find<NSString * {__strong}>(v46, &v45);
      if (!v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("_ATXAppPredictor.mm"), 629, CFSTR("Failed to find bundleId in lookup table"));

      }
      -[_ATXAppPredictor _copyValidScoreInputsFromPredictionItem:toPredictionItem:](self, "_copyValidScoreInputsFromPredictionItem:toPredictionItem:", v25[3], v24);

      objc_autoreleasePoolPop(v23);
      ++v20;
    }
    while (v20 != v21);
  }
  std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::~__hash_table((uint64_t)v46);
  v46[0] = (void **)v47;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](v46);
  objc_autoreleasePoolPop(v17);
  v26 = MEMORY[0x1CAA48B6C]();
  -[_ATXAppPredictor _evalFeaturesForAppForAllIntents:scoreLogger:context:](self, "_evalFeaturesForAppForAllIntents:scoreLogger:context:", v44, v43, v42);
  context = (void *)v26;
  v27 = -[_ATXAppPredictor _createMapOfKeyToItemForPredictionItems:](self, "_createMapOfKeyToItemForPredictionItems:", v47);
  if (v40 >= 1)
  {
    v28 = 0;
    v29 = v40;
    do
    {
      v30 = MEMORY[0x1CAA48B6C](v27);
      if (0xDAB7EC1DD3431B57 * (((char *)retstr->__end_ - (char *)retstr->__begin_) >> 5) <= v28)
        std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
      v31 = (void *)v30;
      v32 = &retstr->__begin_[v28];
      +[_ATXActionUtils getBundleIdFromActionKey:](_ATXActionUtils, "getBundleIdFromActionKey:", v32->key);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v33 = std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::find<NSString * {__strong}>(v46, &v45);
      if (!v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("_ATXAppPredictor.mm"), 649, CFSTR("Failed to find bundleId in lookup table"));

      }
      -[_ATXAppPredictor _copyValidScoreInputsFromPredictionItem:toPredictionItem:](self, "_copyValidScoreInputsFromPredictionItem:toPredictionItem:", v33[3], v32);

      objc_autoreleasePoolPop(v31);
      ++v28;
    }
    while (v28 != v29);
  }
  std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::~__hash_table((uint64_t)v46);
  v46[0] = (void **)v47;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](v46);
  objc_autoreleasePoolPop(context);

  return result;
}

- (vector<ATXPredictionItem,)_getPredictionForItems:(_ATXAppPredictor *)self clipBundleIdsToRank:(SEL)a3 consumerSubType:(id)a4 intent:(id)a5 scoreLogger:(unsigned __int8)a6 context:(id)a7 featureCache:(id)a8
{
  uint64_t v13;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id **v23;
  ATXAppFeaturizer *appFeaturizer;
  id **v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  size_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void **v37;
  void **v38;
  uint64_t v39;
  uint64_t v40;
  id **v41;
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *result;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD block[5];
  id v49;
  id v50;
  id v51;
  uint64_t *v52;
  char v53;
  __int128 v54;
  id *v55;
  uint64_t v56;
  id **v57;
  uint64_t v58;
  __n128 (*v59)(__n128 *, __n128 *);
  void (*v60)(uint64_t);
  void *v61;
  _QWORD v62[3];
  void **v63;
  char v64[16];
  uint64_t v65;

  v13 = a6;
  v65 = *MEMORY[0x1E0C80C00];
  v18 = a4;
  v46 = a5;
  v47 = a7;
  v19 = a8;
  v43 = a9;
  v44 = a10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __atxlog_handle_default();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:].cold.1(v21, (uint64_t)v64, v20);
  }

  sel_getName(a3);
  v45 = (id)os_transaction_create();
  -[_ATXAppPredictor setupScoreLogger:forConsumerSubType:](self, "setupScoreLogger:forConsumerSubType:", v19, v13);
  objc_msgSend(v47, "_className");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v57 = (id **)&v56;
  v58 = 0x4812000000;
  v59 = __Block_byref_object_copy__90;
  v60 = __Block_byref_object_dispose__90;
  v61 = &unk_1C9F35407;
  memset(v62, 0, sizeof(v62));
  if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", v13) == 8)
  {
    -[_ATXAppPredictor _evalFeaturesForActions:scoreLogger:context:featureCache:](self, "_evalFeaturesForActions:scoreLogger:context:featureCache:", v18, v19, v43, v44);
    v23 = v57;
    std::vector<ATXPredictionItem>::__vdeallocate(v57 + 6);
    *((_OWORD *)v23 + 3) = v54;
    v23[8] = v55;
    v55 = 0;
    v54 = 0uLL;
    v63 = (void **)&v54;
  }
  else
  {
    appFeaturizer = self->_appFeaturizer;
    if (appFeaturizer)
    {
      -[ATXAppFeaturizer evaluateFeaturesForApps:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:](appFeaturizer, "evaluateFeaturesForApps:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:", v18, v46, v13, v47, v19, v43, v44);
    }
    else
    {
      v54 = 0uLL;
      v55 = 0;
    }
    v25 = v57;
    std::vector<ATXPredictionItem>::__vdeallocate(v57 + 6);
    *((_OWORD *)v25 + 3) = v54;
    v25[8] = v55;
    v55 = 0;
    v54 = 0uLL;
    v63 = (void **)&v54;
  }
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v63);
  +[ATXScoreInterpreterCache sharedInstance](ATXScoreInterpreterCache, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scoreInterpreterForConsumerSubType:", v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = dispatch_queue_create("prediction-scoring", v28);

  v30 = objc_msgSend(v18, "count");
  v31 = v18;
  v32 = objc_msgSend(v46, "count") + v30;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119___ATXAppPredictor__getPredictionForItems_clipBundleIdsToRank_consumerSubType_intent_scoreLogger_context_featureCache___block_invoke;
  block[3] = &unk_1E82E8240;
  v52 = &v56;
  block[4] = self;
  v33 = v27;
  v49 = v33;
  v53 = v13;
  v34 = v19;
  v50 = v34;
  v35 = v22;
  v51 = v35;
  dispatch_apply(v32, v29, block);
  v36 = (uint64_t)v57[6];
  v37 = v57[7];
  if ((uint64_t)v37 - v36 < 1)
  {
    v38 = 0;
    v40 = 0;
  }
  else
  {
    v38 = (void **)std::get_temporary_buffer[abi:ne180100]<ATXPredictionItem>(0xDAB7EC1DD3431B57 * (((uint64_t)v37 - v36) >> 5));
    v40 = v39;
  }
  std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(v36, v37, 0xDAB7EC1DD3431B57 * (((uint64_t)v37 - v36) >> 5), v38, v40);
  if (v38)
    operator delete(v38);
  v41 = v57;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<ATXPredictionItem>::__init_with_size[abi:ne180100]<ATXPredictionItem*,ATXPredictionItem*>(retstr, v41[6], v41[7], 0xDAB7EC1DD3431B57 * (((char *)v41[7] - (char *)v41[6]) >> 5));

  _Block_object_dispose(&v56, 8);
  *(_QWORD *)&v54 = v62;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);

  return result;
}

- (void)setupScoreLogger:(id)a3 forConsumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[NSArray objectAtIndexedSubscript:](self->_abGroupIdentifiers, "objectAtIndexedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@[%@]"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredictionClass:", v9);
  objc_msgSend(v10, "setConsumerSubType:", v4);

}

- (double)_predictionScoreAndUpdateConfidenceForItem:(ATXPredictionItem *)a3 interpreter:(id)a4 consumerSubType:(unsigned __int8)a5 scoreLogger:(id)a6 intentType:(id)a7
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v21;
  void *v22;

  v9 = a5;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend((id)objc_opt_class(), "inputScoresForPredictionItem:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXAppPredictor.mm"), 730, CFSTR("No interpreter defined for ATXConsumerSubType of '%@'"), v22);

  }
  objc_msgSend(v13, "evaluateWithInputScoreDict:intentType:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppPredictor finalScoreForSubscores:consumerSubType:](self, "finalScoreForSubscores:consumerSubType:", v17, v9);
  v19 = v18;
  if (v14)
    objc_msgSend(v14, "logInputDict:subscores:forBundleId:", v16, v17, a3->key);
  objc_msgSend((id)objc_opt_class(), "updateConfidenceForItem:subscores:", a3, v17);

  return v19;
}

+ (id)inputScoresForPredictionItem:(const ATXPredictionItem *)a3
{
  ATXScoreDict *v4;
  ATXScoreDict *v5;
  _QWORD v7[4];
  ATXScoreDict *v8;
  const ATXPredictionItem *v9;

  v4 = -[ATXScoreDict initWithDefaultValueForScoreTypeKeys]([ATXScoreDict alloc], "initWithDefaultValueForScoreTypeKeys");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49___ATXAppPredictor_inputScoresForPredictionItem___block_invoke;
  v7[3] = &unk_1E82E8268;
  v5 = v4;
  v8 = v5;
  v9 = a3;
  +[_ATXScoreTypes iterScoreInputsWithBlock:](_ATXScoreTypes, "iterScoreInputsWithBlock:", v7);

  return v5;
}

- (double)finalScoreForSubscores:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  double v8;
  double v9;

  v4 = a4;
  v6 = a3;
  -[ATXCurrentABGroupDetails finalSubScoreForConsumerSubType:](self->_currentABGroupDetails, "finalSubScoreForConsumerSubType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scoreForKey:found:", v7, 0);
  v9 = v8;

  return v9;
}

+ (void)updateConfidenceForItem:(ATXPredictionItem *)a3 subscores:(id)a4
{
  double v5;
  double v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "scoreForKey:found:", CFSTR("isMediumConfidenceForBlendingLayer"), 0);
  a3->isMediumConfidenceForBlendingLayer = v5 == 1.0;
  objc_msgSend(v7, "scoreForKey:found:", CFSTR("isHighConfidenceForBlendingLayer"), 0);
  a3->isHighConfidenceForBlendingLayer = v6 == 1.0;

}

- (id)initInternal
{
  _ATXAppPredictor *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  _ATXAppPredictor *v10;
  id v11;
  uint64_t v12;
  NSUserDefaults *userDefaults;
  uint64_t v14;
  ATXAppPredictionBlacklist *appPredictionBlacklist;
  uint64_t v16;
  ATXActionPredictionBlacklist *actionPredictionBlacklist;
  id v18;
  NSObject *v19;
  _QWORD v21[4];
  _ATXAppPredictor *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_ATXAppPredictor;
  v2 = -[_ATXAppPredictor init](&v23, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    -[_ATXAppPredictor _updateFromAsset](v2, "_updateFromAsset");
    -[_ATXAppPredictor _updateFromZeroDayAsset](v2, "_updateFromZeroDayAsset");
    -[_ATXAppPredictor _updateFromZeroDayIntentAsset](v2, "_updateFromZeroDayIntentAsset");
    v9 = (void *)MEMORY[0x1E0D81590];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __32___ATXAppPredictor_initInternal__block_invoke;
    v21[3] = &unk_1E82E00B0;
    v10 = v2;
    v22 = v10;
    objc_msgSend(v9, "runBlockWhenDeviceIsClassCUnlocked:", v21);
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      v11 = objc_alloc(MEMORY[0x1E0C99EA0]);
      v12 = objc_msgSend(v11, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
      userDefaults = v10->_userDefaults;
      v10->_userDefaults = (NSUserDefaults *)v12;

      -[NSUserDefaults addObserver:forKeyPath:options:context:](v10->_userDefaults, "addObserver:forKeyPath:options:context:", v10, CFSTR("appPredictionABGroupOverride"), 1, 0);
    }
    +[ATXAppPredictionBlacklist sharedInstance](ATXAppPredictionBlacklist, "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    appPredictionBlacklist = v10->_appPredictionBlacklist;
    v10->_appPredictionBlacklist = (ATXAppPredictionBlacklist *)v14;

    +[ATXActionPredictionBlacklist sharedInstanceWithAppPredictionBlacklist](ATXActionPredictionBlacklist, "sharedInstanceWithAppPredictionBlacklist");
    v16 = objc_claimAutoreleasedReturnValue();
    actionPredictionBlacklist = v10->_actionPredictionBlacklist;
    v10->_actionPredictionBlacklist = (ATXActionPredictionBlacklist *)v16;

    v18 = +[ATXLockscreenBlacklist sharedInstance](ATXLockscreenBlacklist, "sharedInstance");
    __atxlog_handle_default();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[_ATXAppPredictor initInternal].cold.1();

  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  -[_ATXAppPredictor _updateFromAsset](self, "_updateFromAsset");
  __atxlog_handle_app_prediction();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "Updating assets because AppPrediction A/B group override detected: %@", (uint8_t *)&v10, 0xCu);

  }
}

- (void)_updateFromAsset
{
  ATXCurrentABGroupDetails *v3;
  ATXCurrentABGroupDetails *currentABGroupDetails;
  void *v5;
  void *v6;
  id v7;
  NSArray *v8;
  NSArray *abGroupIdentifiers;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  _ATXAppPredictor *v14;
  id v15;

  v3 = (ATXCurrentABGroupDetails *)objc_opt_new();
  currentABGroupDetails = self->_currentABGroupDetails;
  self->_currentABGroupDetails = v3;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 48);
  v6 = (void *)MEMORY[0x1E0CF9508];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __36___ATXAppPredictor__updateFromAsset__block_invoke;
  v13 = &unk_1E82E8290;
  v14 = self;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v6, "iterConsumerSubTypesWithBlock:", &v10);
  v8 = (NSArray *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  abGroupIdentifiers = self->_abGroupIdentifiers;
  self->_abGroupIdentifiers = v8;

}

- (void)_updateFromZeroDayAsset
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, a3, "_ATXAppPredictor dayZero ABGroup set to %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)_addZeroDayAppIntentKeysToBundleIdTable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60___ATXAppPredictor__addZeroDayAppIntentKeysToBundleIdTable___block_invoke;
  v6[3] = &unk_1E82E82B8;
  v7 = v4;
  v5 = v4;
  -[_ATXAppPredictor iterZeroDayAppIntentKeysWithBlock:](self, "iterZeroDayAppIntentKeysWithBlock:", v6);

}

- (void)iterZeroDayAppIntentKeysWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSDictionary objectForKeyedSubscript:](self->_dayZeroIntentParameters, "objectForKeyedSubscript:", CFSTR("dayZero"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dayZeroAppIntents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v6);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_updateFromZeroDayIntentAsset
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, a3, "_ATXAppPredictor dayZero Intent ABGroup set to %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)_initDependencies
{
  unsigned __int8 v2;
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];

  v2 = atomic_load((unsigned __int8 *)&self->_dependenciesAreInitialized);
  if ((v2 & 1) != 0)
    return 1;
  if (!objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37___ATXAppPredictor__initDependencies__block_invoke;
    block[3] = &unk_1E82E00B0;
    block[4] = self;
    dispatch_sync(queue, block);
    return 1;
  }
  __atxlog_handle_app_prediction();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[_ATXAppPredictor _initDependencies].cold.1();

  return 0;
}

- (void)_initFeaturizers
{
  ATXAppFeaturizer *v3;
  NSDictionary *dayZeroIntentParameters;
  NSDictionary *dayZeroParameters;
  uint64_t v6;
  _ATXAppInstallMonitor *appInstallMonitor;
  ATXMediaApplications *mediaApps;
  _ATXAppLaunchLocation *appLaunchLocation;
  _ATXAppDailyDose *appDailyDose;
  _ATXAppInfoManager *appInfoManager;
  ATXMagicalMomentsUpdateMonitor *mmPredictionMonitor;
  void *v13;
  void *v14;
  ATXAppFeaturizer *v15;
  ATXAppFeaturizer *appFeaturizer;
  NSDictionary *v17;
  _ATXAppLaunchLocation *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = [ATXAppFeaturizer alloc];
  dayZeroParameters = self->_dayZeroParameters;
  dayZeroIntentParameters = self->_dayZeroIntentParameters;
  +[_ATXFeedback sharedInstance](_ATXFeedback, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
  v6 = objc_claimAutoreleasedReturnValue();
  appInstallMonitor = self->_appInstallMonitor;
  mediaApps = self->_mediaApps;
  appLaunchLocation = self->_appLaunchLocation;
  appDailyDose = self->_appDailyDose;
  v21 = (void *)v6;
  +[ATXGlobalAppScorePredictor sharedInstance](ATXGlobalAppScorePredictor, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = appLaunchLocation;
  v19 = (void *)objc_opt_new();
  v17 = dayZeroParameters;
  appInfoManager = self->_appInfoManager;
  mmPredictionMonitor = self->_mmPredictionMonitor;
  -[ATXCDNDownloaderTriggerManager server](self->_cdnDownloaderTriggerManager, "server");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXAppFeaturizer initWithDayZeroParameters:dayZeroIntentParameters:feedback:appLaunchHistogramManager:appLaunchSequenceManager:appLaunchLocation:appInstallMontior:mediaApplications:appDailyDose:globalAppScorePredictor:globalSmartSuppression:appInfoManager:magicalMomentsUpdateMonitor:heroAppPredictions:appIconState:appLaunchMicroLocation:notificationManager:](v3, "initWithDayZeroParameters:dayZeroIntentParameters:feedback:appLaunchHistogramManager:appLaunchSequenceManager:appLaunchLocation:appInstallMontior:mediaApplications:appDailyDose:globalAppScorePredictor:globalSmartSuppression:appInfoManager:magicalMomentsUpdateMonitor:heroAppPredictions:appIconState:appLaunchMicroLocation:notificationManager:", v17, dayZeroIntentParameters, v23, v22, v21, v18, appInstallMonitor, mediaApps, appDailyDose, v20, v19, appInfoManager, mmPredictionMonitor, v13, v14,
          self->_microLocation,
          self->_notificationManager);
  appFeaturizer = self->_appFeaturizer;
  self->_appFeaturizer = v15;

}

- (void)dealloc
{
  objc_super v3;

  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    -[NSUserDefaults removeObserver:forKeyPath:](self->_userDefaults, "removeObserver:forKeyPath:", self, CFSTR("appPredictionABGroupOverride"));
  -[_ATXAppLaunchMonitor stop](self->_appLaunchMonitor, "stop");
  -[ATXAppIntentMonitor stop](self->_appIntentMonitor, "stop");
  -[_ATXAppInstallMonitor stop](self->_appInstallMonitor, "stop");
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppPredictor;
  -[_ATXAppPredictor dealloc](&v3, sel_dealloc);
}

- (double)predictionScoreAndUpdateConfidenceForItem:(ATXPredictionItem *)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = a4;
  +[ATXScoreInterpreterCache sharedInstance](ATXScoreInterpreterCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scoreInterpreterForConsumerSubType:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ATXAppPredictor _predictionScoreAndUpdateConfidenceForItem:interpreter:consumerSubType:scoreLogger:intentType:](self, "_predictionScoreAndUpdateConfidenceForItem:interpreter:consumerSubType:scoreLogger:intentType:", a3, v8, v4, 0, 0);
  v10 = v9;

  return v10;
}

+ (id)recreateSharedInstanceWithCurrentABGroup
{
  id v2;
  void *v3;
  id v4;

  pthread_mutex_lock(&sharedInstanceLock);
  v2 = -[_ATXAppPredictor initInternal]([_ATXAppPredictor alloc], "initInternal");
  v3 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v2;

  v4 = (id)sharedInstance;
  pthread_mutex_unlock(&sharedInstanceLock);
  return v4;
}

- (void)_setActionBlacklist:(id)a3
{
  objc_storeStrong((id *)&self->_actionPredictionBlacklist, a3);
}

- (id)recentInstallCache
{
  _ATXRecentInstallCache *recentInstallCache;

  if (-[_ATXAppPredictor _initAppLaunchAndInstallMonitors](self, "_initAppLaunchAndInstallMonitors"))
    recentInstallCache = self->_recentInstallCache;
  else
    recentInstallCache = 0;
  return recentInstallCache;
}

- (id)appLaunchMonitor
{
  _ATXAppLaunchMonitor *appLaunchMonitor;

  if (-[_ATXAppPredictor _initAppLaunchAndInstallMonitors](self, "_initAppLaunchAndInstallMonitors"))
    appLaunchMonitor = self->_appLaunchMonitor;
  else
    appLaunchMonitor = 0;
  return appLaunchMonitor;
}

- (ATXCDNDownloaderTriggerManager)cdnDownloaderTriggerManager
{
  ATXCDNDownloaderTriggerManager *cdnDownloaderTriggerManager;

  if (-[_ATXAppPredictor _initDependencies](self, "_initDependencies"))
    cdnDownloaderTriggerManager = self->_cdnDownloaderTriggerManager;
  else
    cdnDownloaderTriggerManager = 0;
  return cdnDownloaderTriggerManager;
}

- (void)resetRecentInstallCache
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___ATXAppPredictor_resetRecentInstallCache__block_invoke;
  block[3] = &unk_1E82E00B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)appInstallMonitor
{
  _ATXAppInstallMonitor *appInstallMonitor;

  if (-[_ATXAppPredictor _initAppLaunchAndInstallMonitors](self, "_initAppLaunchAndInstallMonitors"))
    appInstallMonitor = self->_appInstallMonitor;
  else
    appInstallMonitor = 0;
  return appInstallMonitor;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v11 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_opt_new();
  -[_ATXAppPredictor predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:featureCache:](self, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:featureCache:", a3, v11, v14, v15, v16, v17, 0, 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)predictAndWriteCacheFileWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 path:(id)a9 cacheFileDescriptors:(id)a10 featureCache:(id)a11
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v28;
  _QWORD v29[3];
  void **v30;

  v14 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v28 = v16;
  +[ATXAppBlendingUpdater clientModelIdForConsumerSubType:](ATXAppBlendingUpdater, "clientModelIdForConsumerSubType:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v29, 0, sizeof(v29));
  -[_ATXAppPredictor predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:featureCache:](self, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:featureCache:", a3, v14, v16, v17, v18, v19, 0, v29, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
    -[_ATXAppPredictor logCacheAgeAtRefreshForNonBlendingCachesWithCachePath:consumerSubType:](self, "logCacheAgeAtRefreshForNonBlendingCachesWithCachePath:consumerSubType:", v20, v14);
  v25 = -[_ATXAppPredictor writeCacheFileWithSerializedChunks:path:cacheFileDescriptors:consumerSubType:](self, "writeCacheFileWithSerializedChunks:path:cacheFileDescriptors:consumerSubType:", v24, v20, v21, v14);

  v30 = (void **)v29;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v30);

  return v25;
}

- (void)logCacheAgeAtRefreshForNonBlendingCachesWithCachePath:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[ATXFileUtil cacheAgeForCache:withCurrentTime:](ATXFileUtil, "cacheAgeForCache:withCurrentTime:", v5, CFAbsoluteTimeGetCurrent());
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setCacheName:", v8);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackDistributionForMessage:value:", v9, v7);

  __atxlog_handle_metrics();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v13;
    v16 = 2112;
    v17 = v8;
    v18 = 2048;
    v19 = v7;
    _os_log_debug_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMCacheAgeAtCacheRefreshTracker with cacheName: %@ and cacheAge: %f", (uint8_t *)&v14, 0x20u);

  }
}

- (BOOL)writeCacheFileWithSerializedChunks:(id)a3 path:(id)a4 cacheFileDescriptors:(id)a5 consumerSubType:(unsigned __int8)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  int v25;
  int *v26;
  char *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((objc_msgSend(v13, "intValue") & 0x80000000) != 0)
        goto LABEL_14;
    }
    else
    {
      v16 = objc_retainAutorelease(v10);
      v17 = open_dprotected_np((const char *)objc_msgSend(v16, "UTF8String"), 1537, 3, 0, 420);
      if ((v17 & 0x80000000) != 0)
      {
        __atxlog_handle_default();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v25 = *__error();
          v26 = __error();
          v27 = strerror(*v26);
          *(_DWORD *)buf = 138412802;
          v29 = v16;
          v30 = 1024;
          v31 = v25;
          v32 = 2080;
          v33 = v27;
          _os_log_error_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_ERROR, "Error opening %@: [%i] %s", buf, 0x1Cu);
        }

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v16);

    }
    objc_msgSend(v9, "chunkArray");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = ATXCacheFileWriteChunks();

    if (v20)
    {
      __atxlog_handle_default();
      v21 = objc_claimAutoreleasedReturnValue();
      v15 = 1;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v22;
        _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_INFO, "Updated ATXCache for subtype: %@", buf, 0xCu);

      }
      goto LABEL_17;
    }
LABEL_14:
    __atxlog_handle_default();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[_ATXAppPredictor writeCacheFileWithSerializedChunks:path:cacheFileDescriptors:consumerSubType:].cold.1((uint64_t)v10, v21);
    v15 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 featureCache:(id)a11
{
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;

  v14 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a11;
  -[ATXPredictionContextBuilder predictionContextForCurrentContext](self->_predictionContextBuilder, "predictionContextForCurrentContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppPredictor predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:context:featureCache:](self, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:context:featureCache:", a3, v14, v17, v18, v19, v20, 0, a10, v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 context:(id)a11 featureCache:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  unsigned int v26;

  v26 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a11;
  v21 = a12;
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppPredictor predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:context:datastore:featureCache:](self, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:context:datastore:featureCache:", a3, v26, v16, v17, v18, v19, a9, a10, v20, v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 datastore:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v24;
  id v25;

  v24 = a4;
  v25 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a11;
  -[ATXPredictionContextBuilder predictionContextForCurrentContext](self->_predictionContextBuilder, "predictionContextForCurrentContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  -[_ATXAppPredictor predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:context:datastore:featureCache:](self, "predictWithLimit:consumerSubType:intent:candidateBundleIdentifiers:candidateActiontypes:scoreLogger:predictionItemsToKeep:predictedItemsOutParameter:context:datastore:featureCache:", a3, v24, v25, v16, v17, v18, a9, a10, v20, v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)predictWithLimit:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 intent:(id)a5 candidateBundleIdentifiers:(id)a6 candidateActiontypes:(id)a7 scoreLogger:(id)a8 predictionItemsToKeep:(void *)a9 predictedItemsOutParameter:(void *)a10 context:(id)a11 datastore:(id)a12 featureCache:(id)a13
{
  int v16;
  _QWORD *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  const char *ClassName;
  NSObject *queue;
  id v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD block[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t *v53;
  _QWORD *v54;
  unint64_t v55;
  void *v56;
  SEL v57;
  char v58;
  _QWORD v59[3];
  uint8_t v60[4];
  int v61;
  __int16 v62;
  const char *v63;
  uint8_t buf[8];
  __int128 v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v16 = a4;
  v18 = a10;
  v69 = *MEMORY[0x1E0C80C00];
  v39 = a5;
  v43 = a6;
  v40 = a7;
  v41 = a8;
  v19 = a11;
  v42 = a12;
  v20 = a13;
  memset(v59, 0, sizeof(v59));
  if (!a10)
    v18 = v59;
  -[_ATXAppPredictor appLaunchMonitor](self, "appLaunchMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  if (v19)
  {
    v23 = v39;
    if (v21)
    {
      +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "allInstalledAppsKnownToSpringBoard");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v43, "count") || objc_msgSend(v38, "count"))
      {
        __atxlog_handle_default();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_signpost_id_generate(v25);

        __atxlog_handle_default();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          ClassName = object_getClassName(v39);
          *(_DWORD *)buf = 67240450;
          *(_DWORD *)&buf[4] = v16;
          LOWORD(v65) = 2082;
          *(_QWORD *)((char *)&v65 + 2) = ClassName;
          _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "Predict", "Subtype=%{public,signpost.telemetry:number1}u Intent=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0x12u);
        }

        *(_QWORD *)buf = 0;
        *(_QWORD *)&v65 = buf;
        *((_QWORD *)&v65 + 1) = 0x3032000000;
        v66 = __Block_byref_object_copy__118;
        v67 = __Block_byref_object_dispose__119;
        v68 = 0;
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __200___ATXAppPredictor_predictWithLimit_consumerSubType_intent_candidateBundleIdentifiers_candidateActiontypes_scoreLogger_predictionItemsToKeep_predictedItemsOutParameter_context_datastore_featureCache___block_invoke;
        block[3] = &unk_1E82E8308;
        block[4] = self;
        v58 = v16;
        v31 = v39;
        v45 = v31;
        v46 = v43;
        v47 = v38;
        v48 = v40;
        v49 = v42;
        v54 = v18;
        v50 = v41;
        v51 = v19;
        v55 = a3;
        v56 = a9;
        v52 = v20;
        v53 = buf;
        v57 = a2;
        dispatch_sync(queue, block);
        __atxlog_handle_default();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          v34 = object_getClassName(v31);
          *(_DWORD *)v60 = 67240450;
          v61 = v16;
          v62 = 2082;
          v63 = v34;
          _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v33, OS_SIGNPOST_INTERVAL_END, v26, "Predict", "Subtype=%{public,signpost.telemetry:number1}u Intent=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", v60, 0x12u);
        }

        v22 = *(id *)(v65 + 40);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v22 = 0;
      }

    }
  }
  else
  {
    v23 = v39;
  }
  *(_QWORD *)buf = v59;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v22;
}

+ (id)pruneItemsToRankForConsumerSubType:(unsigned __int8)a3 itemsToRank:(id)a4 datastore:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  id v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v21 = v7;
  if (objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", v6) == 8)
  {
    v22 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          +[_ATXActionUtils getBundleIdFromActionKey:](_ATXActionUtils, "getBundleIdFromActionKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v13);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v14)
            v17 = v15 == 0;
          else
            v17 = 1;
          if (!v17)
          {
            if (objc_msgSend(v8, "actionExistsForBundleId:actionType:", v14, v15))
            {
              objc_msgSend(v22, "addObject:", v13);
            }
            else
            {
              __atxlog_handle_default();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v28 = v13;
                _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "No actions found in _ATXDataStore for %@. Skipping this actionKey.", buf, 0xCu);
              }

            }
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v10);
    }

    v19 = (id)objc_msgSend(v22, "copy");
  }
  else
  {
    v19 = v7;
  }

  return v19;
}

+ (id)getParseTreeForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAssetFileAndSubscoreForConsumerSubType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CF8CF0];
  objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryForResource:ofType:specifiedABGroup:", v6, CFSTR("plist"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getPredictionModelDetailsForConsumerSubType:(unsigned __int8)a3
{
  unsigned int v3;
  void *v5;
  _ATXPredictionModelDetails *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _ATXPredictionModelDetails *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8CF0], "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [_ATXPredictionModelDetails alloc];
  v7 = objc_msgSend(v5, "compatibilityVersion");
  v8 = objc_msgSend(v5, "assetVersion");
  -[NSArray objectAtIndexedSubscript:](self->_abGroupIdentifiers, "objectAtIndexedSubscript:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_ATXPredictionModelDetails initWithAssetCompatibilityVersion:assetVersion:abGroup:](v6, "initWithAssetCompatibilityVersion:assetVersion:abGroup:", v7, v8, v9);

  return v10;
}

- (id)getABGroups
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CF8CD0], "sharedInstanceWithMobileAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAssetFileAndSubscoreForConsumerSubType:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF8CF0], "rawDictionaryForResource:ofType:", v4, CFSTR("plplist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)receiveFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 atxResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 context:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *queue;
  id v22;
  id v23;
  id v24;
  id v25;
  ATXAppLaunchLogger *appLaunchLogger;
  void *v27;
  void *v28;
  ATXAppLaunchLogger *v29;
  ATXAppLaunchLogger *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v36;
  uint64_t block;
  uint64_t v38;
  id (*v39)(uint64_t);
  void *v40;
  _ATXAppPredictor *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD *v48;
  unint64_t v49;
  unint64_t v50;
  unsigned __int8 v51;
  _QWORD v52[5];
  id v53;

  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v32 = v16;
  v33 = v15;
  v31 = v18;
  v20 = (void *)os_transaction_create();
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__118;
  v52[4] = __Block_byref_object_dispose__119;
  v53 = 0;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v38 = 3221225472;
  v39 = __161___ATXAppPredictor_receiveFeedbackForConsumerType_consumerSubType_atxResponse_engagementType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_context___block_invoke;
  v40 = &unk_1E82E8330;
  v48 = v52;
  v49 = a3;
  v41 = self;
  v51 = a4;
  v36 = v15;
  v42 = v36;
  v50 = a6;
  v34 = v16;
  v43 = v34;
  v22 = v17;
  v44 = v22;
  v23 = v18;
  v45 = v23;
  v24 = v19;
  v46 = v24;
  v25 = v20;
  v47 = v25;
  dispatch_sync(queue, &block);
  if (a3 == 1)
  {
    if (a6 - 2 < 2)
    {
      appLaunchLogger = self->_appLaunchLogger;
      objc_msgSend(v24, "timeContext", v31, v17, v32, v33, v34, v36, block, v38, v39, v40, v41, v42, v43, v44, v45, v46);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAppLaunchLogger logAppLaunchFrom:at:](appLaunchLogger, "logAppLaunchFrom:at:", 12, v28);
LABEL_9:

      goto LABEL_10;
    }
    if (a6 == 1)
    {
      v30 = self->_appLaunchLogger;
      objc_msgSend(v24, "timeContext", v31, v17, v32, v33, v34, v36, block, v38, v39, v40, v41, v42, v43, v44, v45, v46);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXAppLaunchLogger logAppLaunchFrom:at:](v30, "logAppLaunchFrom:at:", 13, v28);
      goto LABEL_9;
    }
  }
  else if (a3 == 2 && a6 == 1)
  {
    v29 = self->_appLaunchLogger;
    objc_msgSend(v24, "timeContext", v31, v17, v32, v33, v34, v36, block, v38, v39, v40, v41, v42, v43, v44, v45, v46);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppLaunchLogger logAppLaunchFrom:at:](v29, "logAppLaunchFrom:at:", 15, v28);
    goto LABEL_9;
  }
LABEL_10:

  _Block_object_dispose(v52, 8);
}

- (void)train
{
  -[_ATXAppPredictor trainWithActivity:](self, "trainWithActivity:", 0);
}

- (void)trainWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "didDefer"))
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "App prediction training immediately deferred", buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (v4 && (objc_msgSend(v4, "setContinue") & 1) == 0)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_ATXAppPredictor trainWithActivity:].cold.1();
    goto LABEL_9;
  }
  v6 = (void *)MEMORY[0x1E0D81590];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___ATXAppPredictor_trainWithActivity___block_invoke;
  v7[3] = &unk_1E82E82E0;
  v7[4] = self;
  v8 = v4;
  objc_msgSend(v6, "runBlockWhenDeviceIsClassCUnlocked:", v7);

LABEL_10:
}

- (NSArray)abGroupIdentifiers
{
  return self->_abGroupIdentifiers;
}

- (void)setAbGroupIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_abGroupIdentifiers, a3);
}

- (void)setCdnDownloaderTriggerManager:(id)a3
{
  objc_storeStrong((id *)&self->_cdnDownloaderTriggerManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdnDownloaderTriggerManager, 0);
  objc_storeStrong((id *)&self->_abGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentABGroupDetails, 0);
  objc_storeStrong((id *)&self->_microLocation, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
  objc_storeStrong((id *)&self->_mediaApps, 0);
  objc_storeStrong((id *)&self->_actionPredictionBlacklist, 0);
  objc_storeStrong((id *)&self->_appPredictionBlacklist, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_mmPredictionMonitor, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_appFeaturizer, 0);
  objc_storeStrong((id *)&self->_appLaunchLogger, 0);
  objc_storeStrong((id *)&self->_appInstallMonitor, 0);
  objc_storeStrong((id *)&self->_appIntentMonitor, 0);
  objc_storeStrong((id *)&self->_appLaunchMonitor, 0);
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_recentInstallCache, 0);
  objc_storeStrong((id *)&self->_appDailyDose, 0);
  objc_storeStrong((id *)&self->_appLaunchLocation, 0);
  objc_storeStrong((id *)&self->_dayZeroIntentABGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_dayZeroABGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_dayZeroIntentParameters, 0);
  objc_storeStrong((id *)&self->_dayZeroParameters, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_getPredictionForItems:(unint64_t)a3 clipBundleIdsToRank:(void *)a4 consumerSubType:(uint64_t)a5 intent:scoreLogger:context:featureCache:
{
  void **v6;
  id *v9;
  unint64_t v10;
  float *v11;
  unint64_t v12;
  void **v13;
  id *v14;
  void **v15;
  id *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void **v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id *v26;
  id v27;
  void *v28;
  unint64_t v29;
  void **v30;
  void **v31;

  v30 = a2;
  v31 = (void **)a1;
  if (a3 >= 2)
  {
    v6 = (void **)a1;
    if (a3 == 2)
    {
      v30 = a2 - 412;
      if (*(float *)(a1 + 3284) < *((float *)a2 - 3))
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<ATXPredictionItem *> &,std::__wrap_iter<ATXPredictionItem *> &>(&v31, &v30);
    }
    else if ((uint64_t)a3 <= 0)
    {
      std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>((char *)a1, (char *)a2);
    }
    else
    {
      v9 = a4;
      v10 = a3 >> 1;
      v11 = (float *)(a1 + 3296 * (a3 >> 1));
      v12 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        std::__stable_sort_move<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>((float *)a1, v11, v12, a4);
        v13 = &v9[412 * v10];
        std::__stable_sort_move<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>((float *)&v6[412 * (a3 >> 1)], (float *)a2, a3 - (a3 >> 1), v13);
        v14 = &v9[412 * a3];
        v15 = v13;
        v16 = v9;
        while (v15 != v14)
        {
          if (*((float *)v16 + 821) >= *((float *)v15 + 821))
          {
            v19 = *v16;
            *v16 = 0;
            v20 = *v6;
            *v6 = v19;

            memcpy(v6 + 1, v16 + 1, 0xCD2uLL);
            v16 += 412;
          }
          else
          {
            v17 = *v15;
            *v15 = 0;
            v18 = *v6;
            *v6 = v17;

            memcpy(v6 + 1, v15 + 1, 0xCD2uLL);
            v15 += 412;
          }
          v6 += 412;
          if (v16 == v13)
          {
            if (v15 != v14)
            {
              v21 = 0;
              do
              {
                v22 = &v15[v21];
                v23 = v15[v21];
                v15[v21] = 0;
                v24 = v6[v21];
                v6[v21] = v23;

                memcpy(&v6[v21 + 1], &v15[v21 + 1], 0xCD2uLL);
                v21 += 412;
              }
              while (v22 + 412 != v14);
            }
            goto LABEL_23;
          }
        }
        if (v16 != v13)
        {
          v25 = 0;
          do
          {
            v26 = &v16[v25];
            v27 = v16[v25];
            v16[v25] = 0;
            v28 = v6[v25];
            v6[v25] = v27;

            memcpy(&v6[v25 + 1], &v16[v25 + 1], 0xCD2uLL);
            v25 += 412;
          }
          while (v26 + 412 != v13);
        }
LABEL_23:
        if (v9)
        {
          v29 = a3;
          do
          {

            v9 += 412;
            --v29;
          }
          while (v29);
        }
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(a1, v11, v12, a4, a5);
        std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(&v6[412 * (a3 >> 1)], a2, a3 - (a3 >> 1), v9, a5);
        std::__inplace_merge<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(v6, &v6[412 * (a3 >> 1)], a2, a3 >> 1, a3 - (a3 >> 1), v9, a5);
      }
    }
  }
}

- (float)_getPredictionForItems:(unint64_t)a3 clipBundleIdsToRank:(void *)a4 consumerSubType:intent:scoreLogger:context:featureCache:
{
  void **v4;
  float *v7;
  void *v8;
  float *v9;
  void *v10;
  void **v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  float *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void **v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  float *v34;
  float *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  float *v40;
  void *v41;
  unint64_t v42;
  float *v43;
  void *v44;

  if (a3)
  {
    v4 = a4;
    v7 = result;
    if (a3 == 2)
    {
      v11 = (void **)(a2 - 824);
      v12 = result[821];
      v13 = a4 + 1;
      if (v12 >= *(a2 - 3))
      {
        v31 = *(void **)v7;
        *(_QWORD *)v7 = 0;
        *a4 = v31;
        memcpy(v13, v7 + 2, 0xCD2uLL);
        v32 = *v11;
        *v11 = 0;
        v4[412] = v32;
        v16 = a2 - 822;
        v10 = v4 + 413;
        return (float *)memcpy(v10, v16, 0xCD2uLL);
      }
      v14 = *v11;
      *v11 = 0;
      *a4 = v14;
      memcpy(v13, a2 - 822, 0xCD2uLL);
      v15 = *(void **)v7;
      *(_QWORD *)v7 = 0;
      v9 = v7 + 2;
      v4[412] = v15;
      v10 = v4 + 413;
LABEL_7:
      v16 = v9;
      return (float *)memcpy(v10, v16, 0xCD2uLL);
    }
    if (a3 == 1)
    {
      v8 = *(void **)result;
      *(_QWORD *)result = 0;
      v9 = result + 2;
      *a4 = v8;
      v10 = a4 + 1;
      goto LABEL_7;
    }
    if ((uint64_t)a3 > 8)
    {
      v33 = 3296 * (a3 >> 1);
      v34 = &result[(unint64_t)v33 / 4];
      std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(result, &result[(unint64_t)v33 / 4], a3 >> 1, a4, a3 >> 1);
      result = (float *)std::__stable_sort<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(&v7[(unint64_t)v33 / 4], a2, a3 - (a3 >> 1), &v4[(unint64_t)v33 / 8], a3 - (a3 >> 1));
      v35 = &v7[(unint64_t)v33 / 4];
      while (v35 != a2)
      {
        v36 = v4 + 1;
        if (v7[821] >= v35[821])
        {
          v38 = *(void **)v7;
          *(_QWORD *)v7 = 0;
          *v4 = v38;
          result = (float *)memcpy(v36, v7 + 2, 0xCD2uLL);
          v7 += 824;
        }
        else
        {
          v37 = *(void **)v35;
          *(_QWORD *)v35 = 0;
          *v4 = v37;
          result = (float *)memcpy(v36, v35 + 2, 0xCD2uLL);
          v35 += 824;
        }
        v4 += 412;
        if (v7 == v34)
        {
          if (v35 != a2)
          {
            v39 = 0;
            do
            {
              v40 = &v35[v39 / 4];
              v41 = *(void **)&v35[v39 / 4];
              *(_QWORD *)&v35[v39 / 4] = 0;
              v4[v39 / 8] = v41;
              result = (float *)memcpy(&v4[v39 / 8 + 1], &v35[v39 / 4 + 2], 0xCD2uLL);
              v39 += 3296;
            }
            while (v40 + 824 != a2);
          }
          return result;
        }
      }
      if (v7 != v34)
      {
        v42 = 0;
        do
        {
          v43 = &v7[v42 / 4];
          v44 = *(void **)&v7[v42 / 4];
          *(_QWORD *)&v7[v42 / 4] = 0;
          v4[v42 / 8] = v44;
          result = (float *)memcpy(&v4[v42 / 8 + 1], &v7[v42 / 4 + 2], 0xCD2uLL);
          v42 += 3296;
        }
        while (v43 + 824 != v34);
      }
    }
    else if (result != a2)
    {
      v17 = *(void **)result;
      *(_QWORD *)result = 0;
      *a4 = v17;
      result = (float *)memcpy(a4 + 1, result + 2, 0xCD2uLL);
      v18 = v7 + 824;
      if (v7 + 824 != a2)
      {
        v19 = 0;
        v20 = v4;
        do
        {
          v21 = v18;
          v22 = v20 + 413;
          if (*((float *)v20 + 821) >= v7[1645])
          {
            v30 = (void *)*v18;
            *v21 = 0;
            v20[412] = v30;
          }
          else
          {
            v23 = *v20;
            *v20 = 0;
            v20[412] = v23;
            memcpy(v20 + 413, v20 + 1, 0xCD2uLL);
            v24 = v4;
            if (v20 != v4)
            {
              v25 = v19;
              while (1)
              {
                v24 = (void **)((char *)v4 + v25);
                if (*(float *)((char *)v4 + v25 - 12) >= v7[1645])
                  break;
                v26 = *(v24 - 412);
                *(v24 - 412) = 0;
                v27 = *v24;
                *v24 = v26;

                memcpy(v24 + 1, v24 - 411, 0xCD2uLL);
                v25 -= 3296;
                if (!v25)
                {
                  v24 = v4;
                  break;
                }
              }
            }
            v28 = (void *)*v21;
            *v21 = 0;
            v29 = *v24;
            *v24 = v28;
            v22 = v24 + 1;

          }
          result = (float *)memcpy(v22, v7 + 826, 0xCD2uLL);
          v18 = v21 + 412;
          v19 += 3296;
          v20 += 412;
          v7 = (float *)v21;
        }
        while (v21 + 412 != (_QWORD *)a2);
      }
    }
  }
  return result;
}

- (void)_getPredictionForItems:(void *)a1 clipBundleIdsToRank:(void *)a2 consumerSubType:(void *)a3 intent:(uint64_t)a4 scoreLogger:(uint64_t)a5 context:(id *)a6 featureCache:(uint64_t)a7
{
  id *v7;
  uint64_t v8;
  void **v10;
  void **v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void **v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void **v24;
  float v25;
  void **v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void **v30;
  float v31;
  void **v32;
  void **v33;
  void **v34;
  uint64_t v35;
  uint64_t v36;
  void **v37;
  void **v38;
  uint64_t v39;
  void **v40;
  void **v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void **v49;
  void *v50;
  void **v51;
  id *v52;
  void **v53;
  float v54;
  float v55;
  void **v56;
  void **v57;
  void *v58;
  void *v59;
  void **v60;
  uint64_t v61;
  void **v62;
  void *v63;
  void **v64;
  void **v65;
  id *v66;
  void **v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  void **v73;
  void *v74;
  void *v75;
  void **v77;
  void **v78;

  v77 = a2;
  v78 = a1;
  if (a5)
  {
    v7 = a6;
    v8 = a5;
    v10 = a2;
    v11 = a1;
    v12 = v77;
    while (v8 > a7 && a4 > a7)
    {
      if (!a4)
        goto LABEL_43;
      v13 = 0;
      v14 = -a4;
      while (1)
      {
        v15 = &v11[v13];
        if (*((float *)&v11[v13 + 410] + 1) < *((float *)v10 + 821))
          break;
        v13 += 412;
        if (__CFADD__(v14++, 1))
          goto LABEL_43;
      }
      v78 = &v11[v13];
      v17 = -v14;
      if (-v14 >= v8)
      {
        if (v14 == -1)
        {
          v77 = v12;
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<ATXPredictionItem *> &,std::__wrap_iter<ATXPredictionItem *> &>(&v78, &v77);
          return;
        }
        if (v14 > 0)
          v17 = 1 - v14;
        v27 = v17 >> 1;
        if (a3 == v10)
        {
          v12 = a3;
        }
        else
        {
          v28 = 0xDAB7EC1DD3431B57 * (((char *)a3 - (char *)v10) >> 5);
          v12 = v10;
          do
          {
            v29 = v28 >> 1;
            v30 = &v12[412 * (v28 >> 1)];
            v31 = *((float *)v30 + 821);
            v32 = v30 + 412;
            v28 += ~(v28 >> 1);
            if (*(float *)((char *)&v11[412 * v27 + 410] + v13 * 8 + 4) < v31)
              v12 = v32;
            else
              v28 = v29;
          }
          while (v28);
        }
        v20 = (void **)((char *)&v11[412 * v27] + v13 * 8);
        v19 = 0xDAB7EC1DD3431B57 * (((char *)v12 - (char *)v10) >> 5);
      }
      else
      {
        if (v8 >= 0)
          v18 = v8;
        else
          v18 = v8 + 1;
        v19 = v18 >> 1;
        v20 = v10;
        v21 = (char *)v10 - (char *)v11 - v13 * 8;
        if (v21)
        {
          v22 = 0xDAB7EC1DD3431B57 * (v21 >> 5);
          v20 = &v11[v13];
          do
          {
            v23 = v22 >> 1;
            v24 = &v20[412 * (v22 >> 1)];
            v25 = *((float *)v24 + 821);
            v26 = v24 + 412;
            v22 += ~(v22 >> 1);
            if (v25 < *((float *)&v10[412 * v19 + 410] + 1))
              v22 = v23;
            else
              v20 = v26;
          }
          while (v22);
        }
        v12 = &v10[412 * v19];
        v27 = 0xDAB7EC1DD3431B57 * (((char *)v20 - (char *)v11 - v13 * 8) >> 5);
      }
      if (v20 == v10)
      {
        v38 = v12;
      }
      else if (v10 == v12)
      {
        v38 = v20;
      }
      else
      {
        v33 = v10;
        v34 = a3;
        v35 = a7;
        v36 = v19;
        v37 = std::__rotate_forward[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<ATXPredictionItem *>>(v20, v33, v12);
        v19 = v36;
        a7 = v35;
        a3 = v34;
        v38 = v37;
      }
      a4 = -(v27 + v14);
      v39 = v8 - v19;
      if (v27 + v19 >= v8 - (v27 + v19) - v14)
      {
        v45 = -(v27 + v14);
        v46 = v19;
        a4 = v27;
        v43 = a6;
        v44 = a7;
        std::__inplace_merge<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(v38, v12, a3, v45, v8 - v19);
        v12 = v20;
        v39 = v46;
        a3 = v38;
      }
      else
      {
        v40 = v20;
        v41 = a3;
        v42 = v27;
        v43 = a6;
        v44 = a7;
        std::__inplace_merge<std::_ClassicAlgPolicy,-[_ATXAppPredictor _getPredictionForItems:clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:]::$_0 &,std::__wrap_iter<ATXPredictionItem *>>(v15, v40, v38, v42, v19);
        a3 = v41;
        v78 = v38;
        v15 = v38;
      }
      v10 = v12;
      v11 = v15;
      v8 = v39;
      a7 = v44;
      v7 = v43;
      if (!v39)
      {
LABEL_43:
        v77 = v12;
        return;
      }
    }
    v77 = v12;
    if (a4 <= v8)
    {
      if (v11 == v10)
        return;
      v60 = a3;
      v61 = 0;
      v48 = 0;
      do
      {
        v62 = &v11[v61];
        v63 = v11[v61];
        v11[v61] = 0;
        v7[v61] = v63;
        memcpy(&v7[v61 + 1], &v11[v61 + 1], 0xCD2uLL);
        ++v48;
        v61 += 412;
      }
      while (v62 + 412 != v10);
      if (v61 * 8)
      {
        v64 = &v7[v61];
        v65 = v11;
        v66 = v7;
        v67 = v60;
        while (v10 != v67)
        {
          if (*((float *)v66 + 821) >= *((float *)v10 + 821))
          {
            v70 = *v66;
            *v66 = 0;
            v71 = *v11;
            *v11 = v70;

            memcpy(v11 + 1, v66 + 1, 0xCD2uLL);
            v66 += 412;
          }
          else
          {
            v68 = *v10;
            *v10 = 0;
            v69 = *v11;
            *v11 = v68;

            memcpy(v11 + 1, v10 + 1, 0xCD2uLL);
            v10 += 412;
          }
          v11 += 412;
          v65 += 412;
          v67 = v60;
          if (v64 == v66)
            goto LABEL_79;
        }
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,ATXPredictionItem *,ATXPredictionItem *,std::__wrap_iter<ATXPredictionItem *>,0>(v66, v64, v65);
      }
    }
    else
    {
      if (v10 == a3)
        return;
      v47 = 0;
      v48 = 0;
      do
      {
        v49 = &v10[v47];
        v50 = v10[v47];
        v10[v47] = 0;
        v7[v47] = v50;
        v51 = a3;
        memcpy(&v7[v47 + 1], &v10[v47 + 1], 0xCD2uLL);
        a3 = v51;
        ++v48;
        v47 += 412;
      }
      while (v49 + 412 != v51);
      if (v47 * 8)
      {
        v52 = &v7[v47];
        v53 = v51 - 412;
        while (v10 != v11)
        {
          v54 = *((float *)v10 - 3);
          v55 = *((float *)v52 - 3);
          if (v54 < v55)
            v56 = v10 - 412;
          else
            v56 = v52 - 412;
          if (v54 < v55)
            v57 = v10;
          else
            v57 = v52;
          if (v54 >= v55)
            v52 -= 412;
          else
            v10 -= 412;
          v58 = *v56;
          *v56 = 0;
          v59 = *v53;
          *v53 = v58;

          memcpy(v53 + 1, v57 - 411, 0xCD2uLL);
          v53 -= 412;
          if (v52 == v7)
            goto LABEL_79;
        }
        v72 = 0;
        do
        {
          v73 = &v52[v72 - 412];
          v74 = *v73;
          *v73 = 0;
          v75 = v53[v72];
          v53[v72] = v74;

          memcpy(&v53[v72 + 1], &v52[v72 - 411], 0xCD2uLL);
          v72 -= 412;
        }
        while (&v52[v72] != v7);
      }
    }
LABEL_79:
    if (v7)
    {
      do
      {

        v7 += 412;
        --v48;
      }
      while (v48);
    }
  }
}

- (void)_getPredictionForItems:(NSObject *)a3 clipBundleIdsToRank:consumerSubType:intent:scoreLogger:context:featureCache:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a3, (uint64_t)a3, "Generating new predictions: %@", (uint8_t *)a2);

}

- (void)initInternal
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "_ATXAppPredictor initialized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_initAppLaunchAndInstallMonitors
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Can not initialize app launch and install monitors before first unlock!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_initDependencies
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Can not initialize dependencies before first unlock!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)writeCacheFileWithSerializedChunks:(uint64_t)a1 path:(NSObject *)a2 cacheFileDescriptors:consumerSubType:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Failed to open prediction cache at \"%@\" for write!", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)trainWithActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "App prediction training could not be set to CONTINUE, cancelling", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
