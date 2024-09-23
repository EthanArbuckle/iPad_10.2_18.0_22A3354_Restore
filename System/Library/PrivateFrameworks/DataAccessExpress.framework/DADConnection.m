@implementation DADConnection

- (void)reallyRegisterForInterrogation
{
  NSObject *v3;
  void *v4;
  void *v5;
  _xpc_connection_s *v6;
  uint8_t v7[8];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_statusReportBlock && !-[DADConnection registered](self, "registered"))
  {
    -[DADConnection setRegistered:](self, "setRegistered:", 1);
    DALoggingwithCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B5244000, v3, OS_LOG_TYPE_INFO, "Sending message: kDAERegisterForInterrogation", v7, 2u);
    }

    v8 = CFSTR("kDAEMessageNameKey");
    v9[0] = CFSTR("kDAERegisterForInterrogation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[DADConnection _connection](self, "_connection");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v6, v5);

  }
}

- (id)_init
{
  DADConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *muckingWithConn;
  dispatch_queue_t v5;
  OS_dispatch_queue *muckingWithInFlightCollections;
  uint64_t v7;
  NSMutableSet *accountIdsWithAlreadyResetCerts;
  uint64_t v9;
  NSMutableSet *accountIdsWithAlreadyResetThrottleTimers;
  uint64_t v11;
  NSMutableDictionary *inFlightSearchQueries;
  uint64_t v13;
  NSMutableDictionary *inFlightFolderChanges;
  uint64_t v15;
  NSMutableDictionary *inFlightAttachmentDownloads;
  uint64_t v17;
  NSMutableDictionary *inFlightCalendarAvailabilityRequests;
  uint64_t v19;
  NSMutableDictionary *inFlightGrantedDelegatesListRequests;
  uint64_t v21;
  NSMutableDictionary *inFlightUpdateGrantedDelegatePermissionRequests;
  uint64_t v23;
  NSMutableDictionary *inFlightCalendarDirectorySearches;
  uint64_t v25;
  NSMutableDictionary *inFlightGroupExpansions;
  uint64_t v27;
  NSMutableDictionary *inFlightShareRequests;
  uint64_t v29;
  NSMutableDictionary *inFlightOofSettingsRequests;
  uint64_t v31;
  NSMutableDictionary *inFlightOfficeHoursRequests;
  uint64_t v33;
  NSMutableDictionary *inFlightSubscribedCalendarDownloads;
  uint64_t v35;
  NSMutableDictionary *inFlightSubscribedCalendarJunkChecks;
  uint64_t v37;
  NSMutableDictionary *inFlightHolidayCalendarFetches;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)DADConnection;
  v2 = -[DADConnection init](&v40, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.dataaccess.muckingWithConn", 0);
    muckingWithConn = v2->_muckingWithConn;
    v2->_muckingWithConn = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.dataaccess.muckingWithInFlightCollections", 0);
    muckingWithInFlightCollections = v2->_muckingWithInFlightCollections;
    v2->_muckingWithInFlightCollections = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    accountIdsWithAlreadyResetCerts = v2->_accountIdsWithAlreadyResetCerts;
    v2->_accountIdsWithAlreadyResetCerts = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    accountIdsWithAlreadyResetThrottleTimers = v2->_accountIdsWithAlreadyResetThrottleTimers;
    v2->_accountIdsWithAlreadyResetThrottleTimers = (NSMutableSet *)v9;

    v11 = objc_opt_new();
    inFlightSearchQueries = v2->_inFlightSearchQueries;
    v2->_inFlightSearchQueries = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    inFlightFolderChanges = v2->_inFlightFolderChanges;
    v2->_inFlightFolderChanges = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    inFlightAttachmentDownloads = v2->_inFlightAttachmentDownloads;
    v2->_inFlightAttachmentDownloads = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    inFlightCalendarAvailabilityRequests = v2->_inFlightCalendarAvailabilityRequests;
    v2->_inFlightCalendarAvailabilityRequests = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    inFlightGrantedDelegatesListRequests = v2->_inFlightGrantedDelegatesListRequests;
    v2->_inFlightGrantedDelegatesListRequests = (NSMutableDictionary *)v19;

    v21 = objc_opt_new();
    inFlightUpdateGrantedDelegatePermissionRequests = v2->_inFlightUpdateGrantedDelegatePermissionRequests;
    v2->_inFlightUpdateGrantedDelegatePermissionRequests = (NSMutableDictionary *)v21;

    v23 = objc_opt_new();
    inFlightCalendarDirectorySearches = v2->_inFlightCalendarDirectorySearches;
    v2->_inFlightCalendarDirectorySearches = (NSMutableDictionary *)v23;

    v25 = objc_opt_new();
    inFlightGroupExpansions = v2->_inFlightGroupExpansions;
    v2->_inFlightGroupExpansions = (NSMutableDictionary *)v25;

    v27 = objc_opt_new();
    inFlightShareRequests = v2->_inFlightShareRequests;
    v2->_inFlightShareRequests = (NSMutableDictionary *)v27;

    v29 = objc_opt_new();
    inFlightOofSettingsRequests = v2->_inFlightOofSettingsRequests;
    v2->_inFlightOofSettingsRequests = (NSMutableDictionary *)v29;

    v31 = objc_opt_new();
    inFlightOfficeHoursRequests = v2->_inFlightOfficeHoursRequests;
    v2->_inFlightOfficeHoursRequests = (NSMutableDictionary *)v31;

    v33 = objc_opt_new();
    inFlightSubscribedCalendarDownloads = v2->_inFlightSubscribedCalendarDownloads;
    v2->_inFlightSubscribedCalendarDownloads = (NSMutableDictionary *)v33;

    v35 = objc_opt_new();
    inFlightSubscribedCalendarJunkChecks = v2->_inFlightSubscribedCalendarJunkChecks;
    v2->_inFlightSubscribedCalendarJunkChecks = (NSMutableDictionary *)v35;

    v37 = objc_opt_new();
    inFlightHolidayCalendarFetches = v2->_inFlightHolidayCalendarFetches;
    v2->_inFlightHolidayCalendarFetches = (NSMutableDictionary *)v37;

    -[DADConnection _registerForAppResumedNotification](v2, "_registerForAppResumedNotification");
  }
  return v2;
}

- (void)_registerForAppResumedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_resetTimersAndWarnings, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);

}

void __33__DADConnection_sharedConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[DADConnection _init]([DADConnection alloc], "_init");
  v1 = (void *)sharedConnection_gDADConnection;
  sharedConnection_gDADConnection = (uint64_t)v0;

}

- (void)_tearDownInFlightObjects
{
  NSObject *muckingWithInFlightCollections;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t ii;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t jj;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t kk;
  void *v61;
  void *v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t mm;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t nn;
  void *v76;
  void *v77;
  NSObject *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i1;
  void *v83;
  void *v84;
  id v85;
  NSObject *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i2;
  void *v91;
  void *v92;
  NSObject *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i3;
  void *v98;
  void *v99;
  DADConnection *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[6];
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[6];
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  _QWORD v123[4];
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[6];
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _QWORD v140[6];
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _QWORD v151[6];
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t (*v155)(uint64_t, uint64_t);
  void (*v156)(uint64_t);
  id v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD v162[6];
  uint64_t v163;
  uint64_t *v164;
  uint64_t v165;
  uint64_t (*v166)(uint64_t, uint64_t);
  void (*v167)(uint64_t);
  id v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _QWORD v173[6];
  uint64_t v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t (*v177)(uint64_t, uint64_t);
  void (*v178)(uint64_t);
  id v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  _QWORD v184[6];
  uint64_t v185;
  uint64_t *v186;
  uint64_t v187;
  uint64_t (*v188)(uint64_t, uint64_t);
  void (*v189)(uint64_t);
  id v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _QWORD v195[6];
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t (*v199)(uint64_t, uint64_t);
  void (*v200)(uint64_t);
  id v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  _QWORD v206[6];
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  uint64_t (*v210)(uint64_t, uint64_t);
  void (*v211)(uint64_t);
  id v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _QWORD v217[6];
  uint64_t v218;
  uint64_t *v219;
  uint64_t v220;
  uint64_t (*v221)(uint64_t, uint64_t);
  void (*v222)(uint64_t);
  id v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  _QWORD v228[6];
  uint64_t v229;
  uint64_t *v230;
  uint64_t v231;
  uint64_t (*v232)(uint64_t, uint64_t);
  void (*v233)(uint64_t);
  id v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  _QWORD v239[6];
  uint64_t v240;
  uint64_t *v241;
  uint64_t v242;
  uint64_t (*v243)(uint64_t, uint64_t);
  void (*v244)(uint64_t);
  id v245;
  _QWORD block[6];
  uint64_t v247;
  uint64_t *v248;
  uint64_t v249;
  uint64_t (*v250)(uint64_t, uint64_t);
  void (*v251)(uint64_t);
  id v252;
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  _BYTE v263[128];
  _BYTE v264[128];
  _BYTE v265[128];
  uint64_t v266;

  v266 = *MEMORY[0x1E0C80C00];
  v247 = 0;
  v248 = &v247;
  v249 = 0x3032000000;
  v250 = __Block_byref_object_copy_;
  v251 = __Block_byref_object_dispose_;
  v252 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke;
  block[3] = &unk_1E68DADB8;
  block[5] = &v247;
  v100 = self;
  block[4] = self;
  dispatch_sync(muckingWithInFlightCollections, block);
  v4 = (void *)v248[5];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel_sendFinishedToConsumerWithError_, v5);

  v240 = 0;
  v241 = &v240;
  v242 = 0x3032000000;
  v243 = __Block_byref_object_copy_;
  v244 = __Block_byref_object_dispose_;
  v245 = 0;
  v6 = v100->_muckingWithInFlightCollections;
  v239[0] = MEMORY[0x1E0C809B0];
  v239[1] = 3221225472;
  v239[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_156;
  v239[3] = &unk_1E68DADB8;
  v239[5] = &v240;
  v239[4] = v100;
  dispatch_sync(v6, v239);
  v238 = 0u;
  v237 = 0u;
  v236 = 0u;
  v235 = 0u;
  v7 = (id)v241[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v235, v265, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v236;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v236 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * i);
        objc_msgSend(v11, "consumer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "folderChange:finishedWithStatus:error:", v11, 0, v13);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v235, v265, 16);
    }
    while (v8);
  }

  v229 = 0;
  v230 = &v229;
  v231 = 0x3032000000;
  v232 = __Block_byref_object_copy_;
  v233 = __Block_byref_object_dispose_;
  v234 = 0;
  v14 = v100->_muckingWithInFlightCollections;
  v228[0] = MEMORY[0x1E0C809B0];
  v228[1] = 3221225472;
  v228[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_157;
  v228[3] = &unk_1E68DADB8;
  v228[5] = &v229;
  v228[4] = v100;
  dispatch_sync(v14, v228);
  v227 = 0u;
  v226 = 0u;
  v225 = 0u;
  v224 = 0u;
  v15 = (id)v230[5];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v224, v264, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v225;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v225 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 0, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "finishedWithError:", v20);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v224, v264, 16);
    }
    while (v16);
  }

  v218 = 0;
  v219 = &v218;
  v220 = 0x3032000000;
  v221 = __Block_byref_object_copy_;
  v222 = __Block_byref_object_dispose_;
  v223 = 0;
  v21 = v100->_muckingWithInFlightCollections;
  v217[0] = MEMORY[0x1E0C809B0];
  v217[1] = 3221225472;
  v217[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_158;
  v217[3] = &unk_1E68DADB8;
  v217[5] = &v218;
  v217[4] = v100;
  dispatch_sync(v21, v217);
  v216 = 0u;
  v215 = 0u;
  v214 = 0u;
  v213 = 0u;
  v22 = (id)v219[5];
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v213, v263, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v214;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v214 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "finishedWithError:", v27);

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v213, v263, 16);
    }
    while (v23);
  }

  v207 = 0;
  v208 = &v207;
  v209 = 0x3032000000;
  v210 = __Block_byref_object_copy_;
  v211 = __Block_byref_object_dispose_;
  v212 = 0;
  v28 = v100->_muckingWithInFlightCollections;
  v206[0] = MEMORY[0x1E0C809B0];
  v206[1] = 3221225472;
  v206[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_159;
  v206[3] = &unk_1E68DADB8;
  v206[5] = &v207;
  v206[4] = v100;
  dispatch_sync(v28, v206);
  v205 = 0u;
  v204 = 0u;
  v203 = 0u;
  v202 = 0u;
  v29 = (id)v208[5];
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v202, v262, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v203;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v203 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v202 + 1) + 8 * m);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "finishedWithResults:error:", 0, v34);

      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v202, v262, 16);
    }
    while (v30);
  }

  v196 = 0;
  v197 = &v196;
  v198 = 0x3032000000;
  v199 = __Block_byref_object_copy_;
  v200 = __Block_byref_object_dispose_;
  v201 = 0;
  v35 = v100->_muckingWithInFlightCollections;
  v195[0] = MEMORY[0x1E0C809B0];
  v195[1] = 3221225472;
  v195[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_160;
  v195[3] = &unk_1E68DADB8;
  v195[5] = &v196;
  v195[4] = v100;
  dispatch_sync(v35, v195);
  v194 = 0u;
  v193 = 0u;
  v192 = 0u;
  v191 = 0u;
  v36 = (id)v197[5];
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v191, v261, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v192;
    do
    {
      for (n = 0; n != v37; ++n)
      {
        if (*(_QWORD *)v192 != v38)
          objc_enumerationMutation(v36);
        v40 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * n);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "finishedWithError:", v41);

      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v191, v261, 16);
    }
    while (v37);
  }

  v185 = 0;
  v186 = &v185;
  v187 = 0x3032000000;
  v188 = __Block_byref_object_copy_;
  v189 = __Block_byref_object_dispose_;
  v190 = 0;
  v42 = v100->_muckingWithInFlightCollections;
  v184[0] = MEMORY[0x1E0C809B0];
  v184[1] = 3221225472;
  v184[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_161;
  v184[3] = &unk_1E68DADB8;
  v184[5] = &v185;
  v184[4] = v100;
  dispatch_sync(v42, v184);
  v183 = 0u;
  v182 = 0u;
  v181 = 0u;
  v180 = 0u;
  v43 = (id)v186[5];
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v180, v260, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v181;
    do
    {
      for (ii = 0; ii != v44; ++ii)
      {
        if (*(_QWORD *)v181 != v45)
          objc_enumerationMutation(v43);
        v47 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * ii);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "finishedWithError:exceededResultLimit:", v48, 0);

      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v180, v260, 16);
    }
    while (v44);
  }

  v174 = 0;
  v175 = &v174;
  v176 = 0x3032000000;
  v177 = __Block_byref_object_copy_;
  v178 = __Block_byref_object_dispose_;
  v179 = 0;
  v49 = v100->_muckingWithInFlightCollections;
  v173[0] = MEMORY[0x1E0C809B0];
  v173[1] = 3221225472;
  v173[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_162;
  v173[3] = &unk_1E68DADB8;
  v173[5] = &v174;
  v173[4] = v100;
  dispatch_sync(v49, v173);
  v172 = 0u;
  v171 = 0u;
  v170 = 0u;
  v169 = 0u;
  v50 = (id)v175[5];
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v169, v259, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v170;
    do
    {
      for (jj = 0; jj != v51; ++jj)
      {
        if (*(_QWORD *)v170 != v52)
          objc_enumerationMutation(v50);
        v54 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * jj);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "finishedWithError:", v55);

      }
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v169, v259, 16);
    }
    while (v51);
  }

  v163 = 0;
  v164 = &v163;
  v165 = 0x3032000000;
  v166 = __Block_byref_object_copy_;
  v167 = __Block_byref_object_dispose_;
  v168 = 0;
  v56 = v100->_muckingWithInFlightCollections;
  v162[0] = MEMORY[0x1E0C809B0];
  v162[1] = 3221225472;
  v162[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_163;
  v162[3] = &unk_1E68DADB8;
  v162[5] = &v163;
  v162[4] = v100;
  dispatch_sync(v56, v162);
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v57 = (id)v164[5];
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v158, v258, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v159;
    do
    {
      for (kk = 0; kk != v58; ++kk)
      {
        if (*(_QWORD *)v159 != v59)
          objc_enumerationMutation(v57);
        v61 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * kk);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "finishedWithError:", v62);

      }
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v158, v258, 16);
    }
    while (v58);
  }

  v152 = 0;
  v153 = &v152;
  v154 = 0x3032000000;
  v155 = __Block_byref_object_copy_;
  v156 = __Block_byref_object_dispose_;
  v157 = 0;
  v63 = v100->_muckingWithInFlightCollections;
  v151[0] = MEMORY[0x1E0C809B0];
  v151[1] = 3221225472;
  v151[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_164;
  v151[3] = &unk_1E68DADB8;
  v151[5] = &v152;
  v151[4] = v100;
  dispatch_sync(v63, v151);
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v64 = (id)v153[5];
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v147, v257, 16);
  if (v65)
  {
    v66 = *(_QWORD *)v148;
    do
    {
      for (mm = 0; mm != v65; ++mm)
      {
        if (*(_QWORD *)v148 != v66)
          objc_enumerationMutation(v64);
        v68 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * mm);
        objc_msgSend(v68, "consumer");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "oofRequestInfo:finishedWithResult:error:", v68, 0, v70);

      }
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v147, v257, 16);
    }
    while (v65);
  }

  v141 = 0;
  v142 = &v141;
  v143 = 0x3032000000;
  v144 = __Block_byref_object_copy_;
  v145 = __Block_byref_object_dispose_;
  v146 = 0;
  v71 = v100->_muckingWithInFlightCollections;
  v140[0] = MEMORY[0x1E0C809B0];
  v140[1] = 3221225472;
  v140[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_165;
  v140[3] = &unk_1E68DADB8;
  v140[5] = &v141;
  v140[4] = v100;
  dispatch_sync(v71, v140);
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v72 = (id)v142[5];
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v136, v256, 16);
  if (v73)
  {
    v74 = *(_QWORD *)v137;
    do
    {
      for (nn = 0; nn != v73; ++nn)
      {
        if (*(_QWORD *)v137 != v74)
          objc_enumerationMutation(v72);
        v76 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * nn);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "abortWithError:", v77);

      }
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v136, v256, 16);
    }
    while (v73);
  }

  v130 = 0;
  v131 = &v130;
  v132 = 0x3032000000;
  v133 = __Block_byref_object_copy_;
  v134 = __Block_byref_object_dispose_;
  v135 = 0;
  v78 = v100->_muckingWithInFlightCollections;
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_166;
  v129[3] = &unk_1E68DADB8;
  v129[4] = v100;
  v129[5] = &v130;
  dispatch_sync(v78, v129);
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v79 = (id)v131[5];
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v125, v255, 16);
  if (v80)
  {
    v81 = *(_QWORD *)v126;
    do
    {
      for (i1 = 0; i1 != v80; ++i1)
      {
        if (*(_QWORD *)v126 != v81)
          objc_enumerationMutation(v79);
        v83 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i1);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v123[0] = MEMORY[0x1E0C809B0];
        v123[1] = 3221225472;
        v123[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_167;
        v123[3] = &unk_1E68DADE0;
        v85 = v84;
        v124 = v85;
        objc_msgSend(v83, "asyncCallOutToDelegate:", v123);

      }
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v125, v255, 16);
    }
    while (v80);
  }

  v117 = 0;
  v118 = &v117;
  v119 = 0x3032000000;
  v120 = __Block_byref_object_copy_;
  v121 = __Block_byref_object_dispose_;
  v122 = 0;
  v86 = v100->_muckingWithInFlightCollections;
  v116[0] = MEMORY[0x1E0C809B0];
  v116[1] = 3221225472;
  v116[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_2;
  v116[3] = &unk_1E68DADB8;
  v116[4] = v100;
  v116[5] = &v117;
  dispatch_sync(v86, v116);
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v87 = (id)v118[5];
  v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v112, v254, 16);
  if (v88)
  {
    v89 = *(_QWORD *)v113;
    do
    {
      for (i2 = 0; i2 != v88; ++i2)
      {
        if (*(_QWORD *)v113 != v89)
          objc_enumerationMutation(v87);
        v91 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i2);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "finishedWithError:", v92);

      }
      v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v112, v254, 16);
    }
    while (v88);
  }

  v106 = 0;
  v107 = &v106;
  v108 = 0x3032000000;
  v109 = __Block_byref_object_copy_;
  v110 = __Block_byref_object_dispose_;
  v111 = 0;
  v93 = v100->_muckingWithInFlightCollections;
  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __41__DADConnection__tearDownInFlightObjects__block_invoke_169;
  v105[3] = &unk_1E68DADB8;
  v105[4] = v100;
  v105[5] = &v106;
  dispatch_sync(v93, v105);
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v94 = (id)v107[5];
  v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v101, v253, 16);
  if (v95)
  {
    v96 = *(_QWORD *)v102;
    do
    {
      for (i3 = 0; i3 != v95; ++i3)
      {
        if (*(_QWORD *)v102 != v96)
          objc_enumerationMutation(v94);
        v98 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i3);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "finishedWithError:", v99);

      }
      v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v101, v253, 16);
    }
    while (v95);
  }

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v117, 8);

  _Block_object_dispose(&v130, 8);
  _Block_object_dispose(&v141, 8);

  _Block_object_dispose(&v152, 8);
  _Block_object_dispose(&v163, 8);

  _Block_object_dispose(&v174, 8);
  _Block_object_dispose(&v185, 8);

  _Block_object_dispose(&v196, 8);
  _Block_object_dispose(&v207, 8);

  _Block_object_dispose(&v218, 8);
  _Block_object_dispose(&v229, 8);

  _Block_object_dispose(&v240, 8);
  _Block_object_dispose(&v247, 8);

}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing ALL search queries", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_156(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Failing all folder changes", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_157(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all attachment downloads", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_158(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all calendar availability lookups", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_159(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all granted delegates list requests", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_160(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all update-granted-delegate-permission requests", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_161(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all calendar search requests", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_162(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all group expansions", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_163(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all share requests", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_164(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all settings requests", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_165(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all office hours requests", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_166(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing all subscribed calendar downloads", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_167(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subscribedCalendarFailedWithError:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Remove all subscribed calendar junk checks", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeAllObjects");
}

uint64_t __41__DADConnection__tearDownInFlightObjects__block_invoke_169(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Remove all holiday calendar fetches", v7, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeAllObjects");
}

- (void)_serverDiedWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[2];

  v4 = a3;
  v5 = v4;
  if (v4 == (id)MEMORY[0x1E0C81258])
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v7 = "Daemon died, cleaning up.";
      v8 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v4 == (id)MEMORY[0x1E0C81260])
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      v7 = "LOOK AT ME!!!! dataaccessd couldn't be started.  We won't try again.  If you're seeing this, get ready for some pain";
      v8 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  -[DADConnection _tearDownInFlightObjects](self, "_tearDownInFlightObjects", v10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("DataAccessMonitoringConnectionFailed"), 0);

  -[DADConnection setRegistered:](self, "setRegistered:", 0);
}

- (id)_connection
{
  NSObject *muckingWithConn;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  muckingWithConn = self->_muckingWithConn;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__DADConnection__connection__block_invoke;
  v5[3] = &unk_1E68DAE08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(muckingWithConn, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__DADConnection__connection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "_initializeConnection");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)_initializeConnection
{
  const char *v3;
  NSObject *v4;
  OS_xpc_object *mach_service;
  OS_xpc_object *conn;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.dataaccess.dataaccessd"), "UTF8String");
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service(v3, v4, 0);
  conn = self->_conn;
  self->_conn = mach_service;

  if (self->_conn)
  {
    -[DADConnection _initializeXPCConnection:](self, "_initializeXPCConnection:");
  }
  else
  {
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = CFSTR("com.apple.dataaccess.dataaccessd");
      _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_ERROR, "Couldn't create a connection to [%@]", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_initializeConnectionWithXPCEndpoint:(id)a3
{
  id v4;
  NSObject *muckingWithConn;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  muckingWithConn = self->_muckingWithConn;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DADConnection__initializeConnectionWithXPCEndpoint___block_invoke;
  block[3] = &unk_1E68DAD40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(muckingWithConn, block);

}

void __54__DADConnection__initializeConnectionWithXPCEndpoint___block_invoke(uint64_t a1)
{
  xpc_connection_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = xpc_connection_create_from_endpoint(*(xpc_endpoint_t *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  if (v5[1])
  {
    objc_msgSend(v5, "_initializeXPCConnection:");
  }
  else
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_ERROR, "Couldn't create a connection to endpoint: [%@]", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_initializeXPCConnection:(id)a3
{
  _xpc_connection_s *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = (_xpc_connection_s *)a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__DADConnection__initializeXPCConnection___block_invoke;
  v5[3] = &unk_1E68DAE30;
  objc_copyWeak(&v6, &location);
  xpc_connection_set_event_handler(v4, v5);
  xpc_connection_resume(v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __42__DADConnection__initializeXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id WeakRetained;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x1B5E496FC]();
  if (v3 == MEMORY[0x1E0C81310])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_serverDiedWithReason:", v5);
    goto LABEL_5;
  }
  if (v3 == MEMORY[0x1E0C812F8])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_dispatchMessage:", v5);
LABEL_5:

  }
}

- (id)_createReplyToRequest:(id)a3 withProperties:(id)a4
{
  id v5;
  xpc_object_t reply;
  void *v7;
  id v8;
  _QWORD applier[4];
  id v11;

  v5 = a4;
  reply = xpc_dictionary_create_reply(a3);
  v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __54__DADConnection__createReplyToRequest_withProperties___block_invoke;
  applier[3] = &unk_1E68DAE58;
  v8 = reply;
  v11 = v8;
  xpc_dictionary_apply(v7, applier);

  return v8;
}

uint64_t __54__DADConnection__createReplyToRequest_withProperties___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

- (id)decodedErrorFromData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v10 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v10);
    v5 = v10;
    if (!v4)
    {
      DALoggingwithCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_DEFAULT, "Unable to read data to decode error: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("root"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_dictionarySuitableForLogging:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAESubCalPasswordKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("<redacted>"), CFSTR("kDAESubCalPasswordKey"));
  return v3;
}

+ (void)_logRequestID:(id)a3 forRequestAttributes:(id)a4 associatedContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  DALoggingwithCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "_dictionarySuitableForLogging:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1B5244000, v10, OS_LOG_TYPE_DEBUG, "Received request ID [%@] for request with attributes: [%@].  Associated context: [%@]", (uint8_t *)&v12, 0x20u);

  }
}

- (void)_policyKeyChanged:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__DADConnection__policyKeyChanged___block_invoke;
  block[3] = &unk_1E68DAD68;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __35__DADConnection__policyKeyChanged___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void **v6;
  const __CFString **v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEPolicyKeyKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEPolicyErrorCodeKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEAccountIdKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v10 = CFSTR("ASPolicyKey");
      v11 = CFSTR("ASPolicyErrorCodeKey");
      v12 = v1;
      v13 = v2;
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = &v12;
      v7 = &v10;
      v8 = 2;
    }
    else
    {
      v14 = CFSTR("ASPolicyKey");
      v15 = v1;
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = &v15;
      v7 = &v14;
      v8 = 1;
    }
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, v8, v10, v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:userInfo:](v4, "postNotificationName:object:userInfo:", CFSTR("ASPolicyKeyChangedNotification"), v3, v9);

  }
  else
  {
    DALoggingwithCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v0;
      _os_log_impl(&dword_1B5244000, v4, OS_LOG_TYPE_ERROR, "Malformed callback message from dataaccess daemon: bad account id (%@)", buf, 0xCu);
    }
  }

}

- (void)_foldersUpdated:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__DADConnection__foldersUpdated___block_invoke;
  block[3] = &unk_1E68DAD68;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __33__DADConnection__foldersUpdated___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  _QWORD v7[2];
  _QWORD v8[2];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEFolderIDsKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("kDAEAccountIdKey"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (!v1)
  {
    DALoggingwithCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v10 = v0;
    v6 = "Malformed callback message from dataaccess daemon: no folders (%@)";
LABEL_8:
    _os_log_impl(&dword_1B5244000, v4, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v2)
  {
    DALoggingwithCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v10 = v0;
    v6 = "Malformed callback message from dataaccess daemon: bad account id (%@)";
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("DAChangedFolders");
  v7[1] = CFSTR("DAChangedAccountID");
  v8[0] = v1;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject postNotificationName:object:userInfo:](v4, "postNotificationName:object:userInfo:", CFSTR("DataAccessMonitoredFolderUpdated"), 0, v5);

LABEL_9:
}

- (void)_logDataAccessStatus:(id)a3
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global);
}

void __38__DADConnection__logDataAccessStatus___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("ASClientAccountDumpStatusNotification"), 0);

}

- (void)_serverContactsSearchQueryFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD block[5];
  id v24;
  __int128 *p_buf;
  uint8_t v26[4];
  NSObject *v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAESearchIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "doServerContactsSearchQueryFinishedWithStatus called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__DADConnection__serverContactsSearchQueryFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  p_buf = &buf;
  block[4] = self;
  v10 = v6;
  v24 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAESearchResultsKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v22 = 0;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v11, &v22);
      v13 = v22;
      if (!v12)
      {
        DALoggingwithCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v26 = 138412290;
          v27 = v13;
          _os_log_impl(&dword_1B5244000, v14, OS_LOG_TYPE_DEFAULT, "Unable to read data to decode search results: %@", v26, 0xCu);
        }

      }
      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "decodeObjectOfClasses:forKey:", v17, CFSTR("root"));
      v18 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      DALoggingwithCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1B5244000, v13, OS_LOG_TYPE_INFO, "Could not deserialize search results from the xpc message", v26, 2u);
      }
      v18 = 0;
    }

    DALoggingwithCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v26 = 138412290;
      v27 = v18;
      _os_log_impl(&dword_1B5244000, v19, OS_LOG_TYPE_DEBUG, "Search results: %@", v26, 0xCu);
    }

    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "sendResultsToConsumer:", v18);
    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), (int)objc_msgSend(v7, "intValue"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendFinishedToConsumerWithError:", v21);

  }
  else
  {
    DALoggingwithCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1B5244000, v18, OS_LOG_TYPE_ERROR, "received results for an unknown search query", v26, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __52__DADConnection__serverContactsSearchQueryFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = a1[5];
    v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing query %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", a1[5]);
}

- (void)_folderChangeFinished:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *muckingWithInFlightCollections;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t v18[8];
  _QWORD block[5];
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAETaskIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEFolderIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEFolderNameKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1B5244000, v11, OS_LOG_TYPE_DEBUG, "folderChange finished with status %@, error %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__DADConnection__folderChangeFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v21 = buf;
  block[4] = self;
  v13 = v5;
  v20 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  v14 = *(_QWORD *)&buf[8];
  v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v15)
  {
    if (v7)
    {
      objc_msgSend(v15, "setFolderId:", v7);
      v14 = *(_QWORD *)&buf[8];
    }
    if (v8)
    {
      objc_msgSend(*(id *)(v14 + 40), "setDisplayName:", v8);
      v14 = *(_QWORD *)&buf[8];
    }
    objc_msgSend(*(id *)(v14 + 40), "consumer");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject folderChange:finishedWithStatus:error:](v16, "folderChange:finishedWithStatus:error:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), (int)objc_msgSend(v6, "intValue"), v10);
  }
  else
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_ERROR, "received results for an unknown folderChange", v18, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __39__DADConnection__folderChangeFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = a1[5];
    v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing folder change %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[4] + 64), "removeObjectForKey:", a1[5]);
}

- (void)_getStatusReportsFromClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__DADConnection__getStatusReportsFromClient___block_invoke;
  v7[3] = &unk_1E68DAD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__DADConnection__getStatusReportsFromClient___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _xpc_connection_s *v13;
  _xpc_connection_s *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v15);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v10);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        }
        while (v7);
      }

    }
  }
  v19 = CFSTR("kDAEStatusReportsKey");
  v20 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, (_QWORD)v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "_createReplyToRequest:withProperties:", *(_QWORD *)(a1 + 40), v11);
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 40));
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (*(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 8) == v13)
    xpc_connection_send_message(v13, v12);

}

- (void)_downloadProgress:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *muckingWithInFlightCollections;
  id v15;
  void *v16;
  id obj;
  _QWORD block[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAEAttachmentIdsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAEDownloadedBytesKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAETotalBytesKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = __Block_byref_object_copy_;
        v23 = __Block_byref_object_dispose_;
        v24 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __35__DADConnection__downloadProgress___block_invoke;
        block[3] = &unk_1E68DAEA0;
        block[5] = v13;
        block[6] = &v19;
        block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        objc_msgSend((id)v20[5], "updateProgressDownloadedByteCount:totalByteCount:", v6, v8, v15);
        _Block_object_dispose(&v19, 8);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

}

void __35__DADConnection__downloadProgress___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_downloadFinished:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *muckingWithInFlightCollections;
  id v13;
  void *v14;
  id obj;
  _QWORD block[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kDAEAttachmentIdsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v17 = 0;
        v18 = &v17;
        v19 = 0x3032000000;
        v20 = __Block_byref_object_copy_;
        v21 = __Block_byref_object_dispose_;
        v22 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __35__DADConnection__downloadFinished___block_invoke;
        block[3] = &unk_1E68DAEA0;
        block[5] = v11;
        block[6] = &v17;
        block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        objc_msgSend((id)v18[5], "finishedWithError:", v6, v13);
        _Block_object_dispose(&v17, 8);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

}

uint64_t __35__DADConnection__downloadFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 72), "removeObjectForKey:", a1[5]);
}

- (void)_shareResponseFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAESharedCalendarActionIdKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__DADConnection__shareResponseFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v13 = &v14;
  block[4] = self;
  v10 = v6;
  v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v15[5], "finishedWithError:", v8);

  _Block_object_dispose(&v14, 8);
}

uint64_t __40__DADConnection__shareResponseFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 104), "removeObjectForKey:", a1[5]);
}

- (void)_officeHoursRequestFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEOfficeHoursRequestIdKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__DADConnection__officeHoursRequestFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v16 = &v17;
  block[4] = self;
  v10 = v6;
  v15 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  v11 = (void *)v18[5];
  if (v11)
  {
    if (objc_msgSend(v11, "isFetch"))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEOfficeHoursDataKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[CalDAVOfficeHour officeHoursFromData:](CalDAVOfficeHour, "officeHoursFromData:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend((id)v18[5], "finishFetchWithOfficeHours:error:", v13, v8);

    }
    else
    {
      objc_msgSend((id)v18[5], "finishSetWithError:", v8);
    }
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __45__DADConnection__officeHoursRequestFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 120), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 120), "removeObjectForKey:", a1[5]);
}

- (void)_oofSettingsRequestsFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  DAOofParams *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  __int128 *p_buf;
  uint8_t v27[4];
  DAOofParams *v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEOofRequestIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "_oofSettingsRequestsFinished called back with status %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__DADConnection__oofSettingsRequestsFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  p_buf = &buf;
  block[4] = self;
  v10 = v6;
  v25 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    if (v7)
    {
      if (objc_msgSend(v7, "intValue") == 2)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEOofIsUpdateKey"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && -[NSObject BOOLValue](v11, "BOOLValue"))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "oofRequestInfo:finishedWithResult:error:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 0, 0);
        }
        else
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEOofSettingsResultKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v19 = -[DAOofParams initWithDictionary:]([DAOofParams alloc], "initWithDictionary:", v13);
            DALoggingwithCategory(0);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v27 = 138412290;
              v28 = v19;
              _os_log_impl(&dword_1B5244000, v20, OS_LOG_TYPE_DEBUG, "Oof settings request results: %@", v27, 0xCu);
            }

            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "oofRequestInfo:finishedWithResult:error:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v19, 0);
          }
          else
          {
            DALoggingwithCategory(0);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v27 = 0;
              _os_log_impl(&dword_1B5244000, v22, OS_LOG_TYPE_INFO, "Could not deserialize search results from the xpc message", v27, 2u);
            }

            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
            v19 = (DAOofParams *)objc_claimAutoreleasedReturnValue();
            v23 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 62, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[DAOofParams oofRequestInfo:finishedWithResult:error:](v19, "oofRequestInfo:finishedWithResult:error:", v23, 0, v21);
          }

        }
      }
      else
      {
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
        v12 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), (int)objc_msgSend(v7, "intValue"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject oofRequestInfo:finishedWithResult:error:](v12, "oofRequestInfo:finishedWithResult:error:", v17, 0, v18);

      }
    }
    else
    {
      DALoggingwithCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_1B5244000, v14, OS_LOG_TYPE_INFO, "Status missing from the xpc message", v27, 2u);
      }

      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "consumer");
      v12 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 62, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject oofRequestInfo:finishedWithResult:error:](v12, "oofRequestInfo:finishedWithResult:error:", v15, 0, v16);

    }
  }
  else
  {
    DALoggingwithCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1B5244000, v12, OS_LOG_TYPE_ERROR, "received results for an unknown oof settings request", v27, 2u);
    }
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __46__DADConnection__oofSettingsRequestsFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 112), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = a1[5];
    v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Removing from inflight dictionary: oof settings request %@ for key %@", (uint8_t *)&v9, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[4] + 112), "removeObjectForKey:", a1[5]);
}

- (void)_subscriptionCalendarJunkCheckFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECheckSubscribedCalendarIsJunkIdKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__DADConnection__subscriptionCalendarJunkCheckFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v15 = &v16;
  block[4] = self;
  v10 = v6;
  v14 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (v17[5])
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECheckSubscribedCalendarJunkStatusKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");
    objc_msgSend((id)v17[5], "setJunkStatus:", v12);
    objc_msgSend((id)v17[5], "finishedWithError:", v8);

  }
  _Block_object_dispose(&v16, 8);

}

uint64_t __56__DADConnection__subscriptionCalendarJunkCheckFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 152), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 152), "removeObjectForKey:", a1[5]);
}

- (void)_holidayCalendarFetchReturnedResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *muckingWithInFlightCollections;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEFetchHolidayCalendarsIdKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DADConnection__holidayCalendarFetchReturnedResults___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v23 = &v24;
  block[4] = self;
  v8 = v6;
  v22 = v8;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (v25[5])
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEFetchHolidayCalendarsResultsKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3710];
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v15, v9, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;

    if (!v16 || v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      DALoggingwithCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v17;
        _os_log_impl(&dword_1B5244000, v18, OS_LOG_TYPE_ERROR, "unable to unarchive results: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v16, "objectForKey:", CFSTR("kDAEFetchHolidayCalendarsResults_FetchResultsKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend((id)v25[5], "resultsReturned:", v19);
    }

  }
  _Block_object_dispose(&v24, 8);

}

void __54__DADConnection__holidayCalendarFetchReturnedResults___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 160), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_holidayCalendarFetchFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  void *v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEFetchHolidayCalendarsIdKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__DADConnection__holidayCalendarFetchFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v14 = &v15;
  block[4] = self;
  v10 = v6;
  v13 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  v11 = (void *)v16[5];
  if (v11)
    objc_msgSend(v11, "finishedWithError:", v8);

  _Block_object_dispose(&v15, 8);
}

uint64_t __47__DADConnection__holidayCalendarFetchFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 160), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 160), "removeObjectForKey:", a1[5]);
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_186);
  objc_msgSend((id)sharedConnection_gDADConnection, "reallyRegisterForInterrogation");
  return (id)sharedConnection_gDADConnection;
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  return -[DADConnection watchFoldersWithKeys:forAccountID:persistent:](self, "watchFoldersWithKeys:forAccountID:persistent:", a3, a4, 0);
}

- (BOOL)_checkInvalidIdExistsInXPCRely:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = MEMORY[0x1B5E496FC]();
  if (v4 == MEMORY[0x1E0C812F8])
  {
    v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kDAEInvalidAccountIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9 != 0;

  }
  else
  {
    v5 = v4;
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_ERROR, "Unsupported XPC reply type. Reply Type: %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)watchFoldersWithKeys:(id)a3 forAccountID:(id)a4 persistent:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _xpc_connection_s *v14;
  xpc_object_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  uint64_t v20;
  _QWORD v21[4];
  uint8_t buf[16];
  uint64_t v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[DADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v9, 127, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5, CFSTR("kDAEMessageNameKey"), CFSTR("kDAEAccountIdKey"), CFSTR("kDAEFolderIDsKey"), CFSTR("kDAEPersistentMonitoringKey"), CFSTR("kDAEBeginMonitoringFolders"), v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[DADConnection watchFoldersWithKeys:forAccountID:persistent:]";
    _os_log_impl(&dword_1B5244000, v12, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
  }

  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[DADConnection _connection](self, "_connection");
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v15 = xpc_connection_send_message_with_reply_sync(v14, v13);

  if (-[DADConnection _checkInvalidIdExistsInXPCRely:](self, "_checkInvalidIdExistsInXPCRely:", v15))
  {
    if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E68DB210;
      v23 = 0;
      ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
    {
      DALoggingwithCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_DEBUG, "Retry watchFoldersWithSyncKeyMap on exchangesyncd for accountID %{public}@", buf, 0xCu);
      }

      objc_msgSend(getESDConnectionClass(), "sharedConnection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "watchFoldersWithKeys:forAccountID:persistent:", v8, v9, v5);

    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = -[DADConnection _validateXPCReply:](self, "_validateXPCReply:", v15);
  }

  return v18;
}

- (BOOL)resumeWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _xpc_connection_s *v11;
  xpc_object_t v12;
  NSObject *v13;
  void *v14;
  char v15;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[16];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_conn)
  {
    -[DADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v7, 127, 0);
    v17[0] = CFSTR("kDAEMessageNameKey");
    v17[1] = CFSTR("kDAEAccountIdKey");
    v18[0] = CFSTR("kDAEResumeMonitoringFolders");
    v18[1] = v7;
    v17[2] = CFSTR("kDAEFolderIDsKey");
    v18[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v8 = objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[DADConnection resumeWatchingFoldersWithKeys:forAccountID:]";
      _os_log_impl(&dword_1B5244000, v9, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
    }

    v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[DADConnection _connection](self, "_connection");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v12 = xpc_connection_send_message_with_reply_sync(v11, v10);

    if (-[DADConnection _checkInvalidIdExistsInXPCRely:](self, "_checkInvalidIdExistsInXPCRely:", v12))
    {
      if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)buf = xmmword_1E68DB210;
        v20 = 0;
        ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
      {
        DALoggingwithCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v7;
          _os_log_impl(&dword_1B5244000, v13, OS_LOG_TYPE_DEBUG, "Retry resumeWatchingFoldersWithSyncKeyMap on exchangesyncd for accountID %{public}@", buf, 0xCu);
        }

        objc_msgSend(getESDConnectionClass(), "sharedConnection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "resumeWatchingFoldersWithKeys:forAccountID:", v6, v7);

      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = -[DADConnection _validateXPCReply:](self, "_validateXPCReply:", v12);
    }

  }
  else
  {
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_INFO, "[DADConnection resumeWatchingFoldersWithKeys:forAccountID] called without a connection. Will not resume.", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)suspendWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _xpc_connection_s *v11;
  xpc_object_t v12;
  NSObject *v13;
  void *v14;
  char v15;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[16];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17[0] = CFSTR("kDAEMessageNameKey");
  v17[1] = CFSTR("kDAEAccountIdKey");
  v18[0] = CFSTR("kDAESuspendMonitoringFolders");
  v18[1] = v7;
  v17[2] = CFSTR("kDAEFolderIDsKey");
  v18[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[DADConnection suspendWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_1B5244000, v9, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
  }

  v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[DADConnection _connection](self, "_connection");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v12 = xpc_connection_send_message_with_reply_sync(v11, v10);

  if (-[DADConnection _checkInvalidIdExistsInXPCRely:](self, "_checkInvalidIdExistsInXPCRely:", v12))
  {
    if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E68DB210;
      v20 = 0;
      ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
    {
      DALoggingwithCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v7;
        _os_log_impl(&dword_1B5244000, v13, OS_LOG_TYPE_DEBUG, "Retry suspendWatchingFoldersWithKeys on exchangesyncd for accountID %{public}@", buf, 0xCu);
      }

      objc_msgSend(getESDConnectionClass(), "sharedConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "suspendWatchingFoldersWithKeys:forAccountID:", v6, v7);

    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = -[DADConnection _validateXPCReply:](self, "_validateXPCReply:", v12);
  }

  return v15;
}

- (BOOL)stopWatchingFoldersWithKeys:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _xpc_connection_s *v11;
  xpc_object_t v12;
  NSObject *v13;
  void *v14;
  char v15;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[16];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17[0] = CFSTR("kDAEMessageNameKey");
  v17[1] = CFSTR("kDAEAccountIdKey");
  v18[0] = CFSTR("kDAEStopMonitoringFolders");
  v18[1] = v7;
  v17[2] = CFSTR("kDAEFolderIDsKey");
  v18[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DALoggingwithCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[DADConnection stopWatchingFoldersWithKeys:forAccountID:]";
    _os_log_impl(&dword_1B5244000, v9, OS_LOG_TYPE_INFO, "XPC call performed in: %s", buf, 0xCu);
  }

  v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[DADConnection _connection](self, "_connection");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v12 = xpc_connection_send_message_with_reply_sync(v11, v10);

  if (-[DADConnection _checkInvalidIdExistsInXPCRely:](self, "_checkInvalidIdExistsInXPCRely:", v12))
  {
    if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E68DB210;
      v20 = 0;
      ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
    {
      DALoggingwithCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v7;
        _os_log_impl(&dword_1B5244000, v13, OS_LOG_TYPE_DEBUG, "Retry stopWatchingFoldersWithKeys on exchangesyncd for accountID %{public}@", buf, 0xCu);
      }

      objc_msgSend(getESDConnectionClass(), "sharedConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "stopWatchingFoldersWithKeys:forAccountID:", v6, v7);

    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = -[DADConnection _validateXPCReply:](self, "_validateXPCReply:", v12);
  }

  return v15;
}

- (BOOL)_validateXPCReply:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = MEMORY[0x1B5E496FC]();
  if (v4 == MEMORY[0x1E0C812F8])
  {
    v6 = _CFXPCCreateCFObjectFromXPCObject();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");
    v7 = v9 == 2;
    if (v9 != 2)
    {
      DALoggingwithCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = (uint64_t)v8;
        _os_log_impl(&dword_1B5244000, v10, OS_LOG_TYPE_ERROR, "XPC Reply Failure. Status Code: %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }
  else
  {
    v5 = v4;
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_ERROR, "Unsupported XPC reply type. Reply Type: %@", (uint8_t *)&v12, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)requestPolicyUpdateForAccountID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v8 = xmmword_1E68DB210;
    v9 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v8) = 138543362;
      *(_QWORD *)((char *)&v8 + 4) = v3;
      _os_log_impl(&dword_1B5244000, v4, OS_LOG_TYPE_DEBUG, "Send current policy key to exchangesyncd for accountID %{public}@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "requestPolicyUpdateForAccountID:", v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)currentPolicyKeyForAccountID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v8 = xmmword_1E68DB210;
    v9 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v8) = 138543362;
      *(_QWORD *)((char *)&v8 + 4) = v3;
      _os_log_impl(&dword_1B5244000, v4, OS_LOG_TYPE_DEBUG, "Send current policy key to exchangesyncd for accountID %{public}@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentPolicyKeyForAccountID:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unint64_t)_nextStopMonitoringStatusToken
{
  unint64_t v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_nextStopMonitoringStatusToken_nextTokenLock);
  v2 = ++_nextStopMonitoringStatusToken_nextToken;
  os_unfair_lock_unlock((os_unfair_lock_t)&_nextStopMonitoringStatusToken_nextTokenLock);
  return v2;
}

- (void)_requestDaemonChangeAgentMonitoringStatus:(BOOL)a3 withToken:(unint64_t)a4 waitForReply:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v7;
  NSObject *v9;
  const __CFString *v10;
  __CFString **v11;
  void *v12;
  void *v13;
  void *v14;
  _xpc_connection_s *v15;
  _xpc_connection_s *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v5 = a5;
  v7 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("stop");
    if (v7)
      v10 = CFSTR("start");
    v21 = 138412290;
    v22 = (const char *)v10;
    _os_log_impl(&dword_1B5244000, v9, OS_LOG_TYPE_INFO, "Requesting that DataAccess %@ monitoring agents.", (uint8_t *)&v21, 0xCu);
  }

  v11 = kDAEStopMonitoringAgents;
  if (v7)
    v11 = kDAEStartMonitoringAgents;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", *v11, CFSTR("kDAEMessageNameKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("kDAEAgentMonitoringToken"));

  if (v5)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kDAEAgentMonitoringNeedsReply"));
    v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[DADConnection _connection](self, "_connection");
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v16 = (_xpc_connection_s *)xpc_connection_send_message_with_reply_sync(v15, v14);

    if (MEMORY[0x1B5E496FC](v16) == MEMORY[0x1E0C812F8])
    {
      v17 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18 || objc_msgSend(v18, "intValue") != 2)
      {
        DALoggingwithCategory(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = 136315394;
          v22 = "-[DADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:]";
          v23 = 2112;
          v24 = v19;
          _os_log_impl(&dword_1B5244000, v20, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v21, 0x16u);
        }

      }
    }
  }
  else
  {
    v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[DADConnection _connection](self, "_connection");
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v16, v14);
  }

}

- (void)requestDaemonStartMonitoringAgentsWithToken:(unint64_t)a3
{
  -[DADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 1, a3, 0);
}

- (unint64_t)requestDaemonStopMonitoringAgents
{
  unint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "_nextStopMonitoringStatusToken");
  -[DADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 0, v3, 0);
  return v3;
}

- (void)requestDaemonStartMonitoringAgentsSyncWithToken:(unint64_t)a3
{
  -[DADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 1, a3, 1);
}

- (unint64_t)requestDaemonStopMonitoringAgentsSync
{
  unint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "_nextStopMonitoringStatusToken");
  -[DADConnection _requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:](self, "_requestDaemonChangeAgentMonitoringStatus:withToken:waitForReply:", 0, v3, 1);
  return v3;
}

- (void)handleAccountChange:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  DALoggingwithCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEFAULT, "Handling account change: %{public}@", buf, 0xCu);
  }

  if (!v6)
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v17 = "No change info given";
    goto LABEL_11;
  }
  objc_msgSend(v6, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;
    if (v10)
    {
      v22[0] = CFSTR("kDAEMessageNameKey");
      v22[1] = CFSTR("kDAEHandleAccountChangeDataKey");
      v23[0] = CFSTR("kDAEHandleAccountChange");
      v23[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      -[DADConnection _connection](self, "_connection");
      v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(0, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __46__DADConnection_handleAccountChange_callback___block_invoke;
      v19[3] = &unk_1E68DAEE8;
      v20 = v7;
      xpc_connection_send_message_with_reply(v14, v13, v15, v19);

    }
    else
    {
      DALoggingwithCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v11;
        _os_log_impl(&dword_1B5244000, v18, OS_LOG_TYPE_ERROR, "Failed to encode account change info: %@", buf, 0xCu);
      }

      if (v7)
        (*((void (**)(id, id))v7 + 2))(v7, v11);
    }

    goto LABEL_19;
  }
  DALoggingwithCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v17 = "No account identifier given";
LABEL_11:
    _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
  }
LABEL_12:

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v7 + 2))(v7, v11);
LABEL_19:

  }
}

void __46__DADConnection_handleAccountChange_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1B5E496FC]() == MEMORY[0x1E0C812F8])
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "intValue") == 2)
    {
      v4 = 0;
    }
    else
    {
      DALoggingwithCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315394;
        v11 = "-[DADConnection handleAccountChange:callback:]_block_invoke";
        v12 = 2112;
        v13 = v7;
        _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v10, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), (int)objc_msgSend(v7, "intValue"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 10, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v4);

}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 requireChangedFolders:(BOOL)a5 isUserRequested:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _xpc_connection_s *v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[5];
  _BYTE buf[24];
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v6 = a6;
  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 1024;
    v24 = v7;
    v25 = 1024;
    v26 = v6;
    _os_log_impl(&dword_1B5244000, v11, OS_LOG_TYPE_DEBUG, "updateFolderListForAccountID %{public}@, dataclasses %lx, requireChangedFolders %d, isUserRequested %d", buf, 0x22u);
  }

  -[DADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v10, a4, v6);
  -[DADConnection _resetThrottleTimersForAccountId:](self, "_resetThrottleTimersForAccountId:", v10);
  v22[0] = CFSTR("kDAERequestFolderListUpdate");
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4, CFSTR("kDAEMessageNameKey"), CFSTR("kDAEAccountIdKey"), CFSTR("kDAEDataclassesBitmaskKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v12;
  v21[3] = CFSTR("kDAERequireChangedFoldersKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v13;
  v21[4] = CFSTR("kDAEIsUserRequestedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[DADConnection _connection](self, "_connection");
  v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v17, v16);

  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E68DB210;
    *(_QWORD *)&buf[16] = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1B5244000, v18, OS_LOG_TYPE_DEBUG, "Update folder list on exchangesyncd for accountID %{public}@", buf, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateFolderListForAccountID:andDataclasses:requireChangedFolders:isUserRequested:", v10, a4, v7, v6);

  }
  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  return -[DADConnection updateFolderListForAccountID:andDataclasses:requireChangedFolders:isUserRequested:](self, "updateFolderListForAccountID:andDataclasses:requireChangedFolders:isUserRequested:", a3, a4, 0, a5);
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclasses:(int64_t)a5 isUserRequested:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _xpc_connection_s *v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[5];
  _BYTE buf[24];
  int64_t v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  DALoggingwithCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    v24 = a5;
    v25 = 1024;
    v26 = v6;
    _os_log_impl(&dword_1B5244000, v12, OS_LOG_TYPE_DEBUG, "updateContentsOfFoldersWithKeys %@ for account id %{public}@, dataclasses 0x%lx isUserRequested %d", buf, 0x26u);
  }

  -[DADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v11, a5, v6);
  -[DADConnection _resetThrottleTimersForAccountId:](self, "_resetThrottleTimersForAccountId:", v11);
  v22[0] = CFSTR("kDAERequestFolderContentsUpdate");
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5, CFSTR("kDAEMessageNameKey"), CFSTR("kDAEAccountIdKey"), CFSTR("kDAEDataclassesBitmaskKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  v21[3] = CFSTR("kDAEIsUserRequestedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = CFSTR("kDAEFolderIDsKey");
  v22[3] = v14;
  v22[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[DADConnection _connection](self, "_connection");
  v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v17, v16);

  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E68DB210;
    *(_QWORD *)&buf[16] = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_1B5244000, v18, OS_LOG_TYPE_DEBUG, "Update contents of folders on exchangesyncd for accountID %{public}@", buf, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateContentsOfFoldersWithKeys:forAccountID:andDataclasses:isUserRequested:", v10, v11, a5, v6);

  }
  return 1;
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[4];
  _BYTE buf[24];
  _BOOL4 v21;
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  DALoggingwithCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 1024;
    v21 = v5;
    _os_log_impl(&dword_1B5244000, v9, OS_LOG_TYPE_DEBUG, "updateContentsOfAllFoldersForAccountID %{public}@, dataclasses 0x%lxx isUserRequested %d", buf, 0x1Cu);
  }

  -[DADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v8, a4, v5);
  -[DADConnection _resetThrottleTimersForAccountId:](self, "_resetThrottleTimersForAccountId:", v8);
  v19[0] = CFSTR("kDAERequestAllFolderContentsUpdate");
  v19[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4, CFSTR("kDAEMessageNameKey"), CFSTR("kDAEAccountIdKey"), CFSTR("kDAEDataclassesBitmaskKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  v18[3] = CFSTR("kDAEIsUserRequestedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[DADConnection _connection](self, "_connection");
  v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v14, v13);

  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E68DB210;
    *(_QWORD *)&buf[16] = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_1B5244000, v15, OS_LOG_TYPE_DEBUG, "Update contents of all folders on exchangesyncd for accountID %{public}@", buf, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateContentsOfAllFoldersForAccountID:andDataclasses:isUserRequested:", v8, a4, v5);

  }
  return 1;
}

- (BOOL)updateFolderListForAccountID:(id)a3 andDataclasses:(int64_t)a4
{
  return -[DADConnection updateFolderListForAccountID:andDataclasses:isUserRequested:](self, "updateFolderListForAccountID:andDataclasses:isUserRequested:", a3, a4, 0);
}

- (BOOL)updateContentsOfFoldersWithKeys:(id)a3 forAccountID:(id)a4 andDataclass:(int64_t)a5
{
  return -[DADConnection updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:](self, "updateContentsOfFoldersWithKeys:forAccountID:andDataclass:isUserRequested:", a3, a4, a5, 0);
}

- (BOOL)updateContentsOfAllFoldersForAccountID:(id)a3 andDataclass:(int64_t)a4
{
  return -[DADConnection updateContentsOfAllFoldersForAccountID:andDataclass:isUserRequested:](self, "updateContentsOfAllFoldersForAccountID:andDataclass:isUserRequested:", a3, a4, 0);
}

- (BOOL)performServerContactsSearch:(id)a3 forAccountWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  char v14;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *queue;
  _QWORD block[4];
  id v29;
  id v30;
  DADConnection *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  uint8_t buf[16];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DADConnection _resetCertWarningsForAccountId:andDataclasses:isUserRequested:](self, "_resetCertWarningsForAccountId:andDataclasses:isUserRequested:", v7, 8, 0);
  if (v7)
  {
    objc_msgSend(v6, "searchString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v32[0] = CFSTR("kDAEMessageNameKey");
      v32[1] = CFSTR("kDAEAccountIdKey");
      v33[0] = CFSTR("kDAEOpenServerContactsSearch");
      v33[1] = v7;
      v32[2] = CFSTR("kDAESearchQueryKey");
      objc_msgSend(v6, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      -[DADConnection _connection](self, "_connection");
      v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v13 = xpc_connection_send_message_with_reply_sync(v12, v11);

      if (MEMORY[0x1B5E496FC](v13) != MEMORY[0x1E0C812F8])
      {
LABEL_4:
        v14 = 0;
LABEL_25:

        goto LABEL_26;
      }
      v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");
      if (!v17 || (v19 = v18, v18 == 2))
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAEInvalidAccountIDKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          DALoggingwithCategory(0);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v21;
            _os_log_impl(&dword_1B5244000, v22, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
          }

          if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
          {
            *(_OWORD *)buf = xmmword_1E68DB210;
            v35 = 0;
            ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
          }
          if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
            goto LABEL_4;
          DALoggingwithCategory(0);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v7;
            _os_log_impl(&dword_1B5244000, v23, OS_LOG_TYPE_DEBUG, "Perform server contact search on exchangesyncd for accountID %{public}@", buf, 0xCu);
          }

          objc_msgSend(getESDConnectionClass(), "sharedConnection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v16, "performServerContactsSearch:forAccountWithID:", v6, v7);
        }
        else
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAESearchIDKey"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setSearchID:", v24);
          queue = self->_muckingWithInFlightCollections;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __62__DADConnection_performServerContactsSearch_forAccountWithID___block_invoke;
          block[3] = &unk_1E68DAD90;
          v29 = v6;
          v30 = v24;
          v31 = self;
          v25 = v24;
          dispatch_sync(queue, block);

          v14 = 1;
        }
      }
      else
      {
        objc_msgSend(v6, "sendResultsToConsumer:", 0);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sendFinishedToConsumerWithError:", v20);

        v14 = 0;
      }

      goto LABEL_25;
    }
    DALoggingwithCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "nil search string passed to performServerContactsSearch. Refusing to attempt search";
      goto LABEL_9;
    }
  }
  else
  {
    DALoggingwithCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "nil accountID passed to performServerContactsSearch. Refusing to attempt search";
LABEL_9:
      _os_log_impl(&dword_1B5244000, v10, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    }
  }
  v14 = 0;
LABEL_26:

  return v14;
}

uint64_t __62__DADConnection_performServerContactsSearch_forAccountWithID___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B5244000, v2, OS_LOG_TYPE_DEBUG, "Setting search query %@ for key %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1[6] + 56), "setObject:forKeyedSubscript:", a1[4], a1[5]);
}

- (void)cancelServerContactsSearch:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *muckingWithInFlightCollections;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[5];
  id v21;
  __int128 *p_buf;
  _QWORD v23[2];
  _QWORD v24[2];
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "searchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "setState:", 2);
    objc_msgSend(v4, "setConsumer:", 0);
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_DEBUG, "Cancelling search task %p", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v4, "searchID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__DADConnection_cancelServerContactsSearch___block_invoke;
    block[3] = &unk_1E68DAEA0;
    p_buf = &buf;
    block[4] = self;
    v11 = v8;
    v21 = v11;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v23[0] = CFSTR("kDAEMessageNameKey");
      v23[1] = CFSTR("kDAESearchIDKey");
      v24[0] = CFSTR("kDAECancelServerContactsSearch");
      v24[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      -[DADConnection _connection](self, "_connection");
      v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v14, v13);

      DALoggingwithCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v30) = 138412290;
        *(_QWORD *)((char *)&v30 + 4) = v11;
        _os_log_impl(&dword_1B5244000, v15, OS_LOG_TYPE_DEBUG, "Removing search query for key %@", (uint8_t *)&v30, 0xCu);
      }

      v16 = self->_muckingWithInFlightCollections;
      v18[0] = v10;
      v18[1] = 3221225472;
      v18[2] = __44__DADConnection_cancelServerContactsSearch___block_invoke_193;
      v18[3] = &unk_1E68DAD40;
      v18[4] = self;
      v19 = v11;
      dispatch_sync(v16, v18);
      objc_msgSend(v4, "setSearchID:", &stru_1E68DC130);

    }
    else
    {
      if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
      {
        v30 = xmmword_1E68DB210;
        v31 = 0;
        ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
        goto LABEL_15;
      DALoggingwithCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v30) = 138412290;
        *(_QWORD *)((char *)&v30 + 4) = v11;
        _os_log_impl(&dword_1B5244000, v17, OS_LOG_TYPE_DEBUG, "Cancel server contact search on exchangesyncd for searchID %@", (uint8_t *)&v30, 0xCu);
      }

      objc_msgSend(getESDConnectionClass(), "sharedConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cancelServerContactsSearch:", v4);
    }

LABEL_15:
    _Block_object_dispose(&buf, 8);

  }
}

void __44__DADConnection_cancelServerContactsSearch___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __44__DADConnection_cancelServerContactsSearch___block_invoke_193(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (BOOL)processMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  char v18;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v20 = xmmword_1E68DB210;
    v21 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v20) = 138543362;
      *(_QWORD *)((char *)&v20 + 4) = v15;
      _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_DEBUG, "Process meeting request on exchangesyncd for accountID %{public}@", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "processMeetingRequests:deliveryIdsToClear:deliveryIdsToSoftClear:inFolderWithId:forAccountWithId:", v11, v12, v13, v14, v15);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)asyncProcessMeetingRequests:(id)a3 deliveryIdsToClear:(id)a4 deliveryIdsToSoftClear:(id)a5 inFolderWithId:(id)a6 forAccountWithId:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v18 = xmmword_1E68DB210;
    v19 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v18) = 138543362;
      *(_QWORD *)((char *)&v18 + 4) = v15;
      _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_DEBUG, "Async process meeting request on exchangesyncd for accountID %{public}@", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "asyncProcessMeetingRequests:deliveryIdsToClear:deliveryIdsToSoftClear:inFolderWithId:forAccountWithId:", v11, v12, v13, v14, v15);

  }
}

- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5 forAccountID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  char v15;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v17 = xmmword_1E68DB210;
    v18 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v17) = 138543362;
      *(_QWORD *)((char *)&v17 + 4) = v12;
      _os_log_impl(&dword_1B5244000, v13, OS_LOG_TYPE_DEBUG, "Set folder IDs that external clients care about on exchangesyncd for accountID %{public}@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "setFolderIdsThatExternalClientsCareAboutAdded:deleted:foldersTag:forAccountID:", v9, v10, v11, v12);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)reportFolderItemsSyncSuccess:(BOOL)a3 forFolderWithID:(id)a4 withItemsCount:(unint64_t)a5 andAccountWithID:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v8 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v13 = xmmword_1E68DB210;
    v14 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v13) = 138543362;
      *(_QWORD *)((char *)&v13 + 4) = v10;
      _os_log_impl(&dword_1B5244000, v11, OS_LOG_TYPE_DEBUG, "Report folder items sync success on exchangesyncd for accountID %{public}@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportFolderItemsSyncSuccess:forFolderWithID:withItemsCount:andAccountWithID:", v8, v9, a5, v10);

  }
}

- (void)handleURL:(id)a3
{
  __CFString *v4;
  CFStringRef v5;
  void *v6;
  void *v7;
  _xpc_connection_s *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "absoluteString");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0, CFSTR("&="), 0x8000100u);
  v9[0] = CFSTR("kDAEMessageNameKey");
  v9[1] = CFSTR("kDAEURLStringKey");
  v10[0] = CFSTR("kDAEHandleURL");
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[DADConnection _connection](self, "_connection");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v8, v7);

  if (v5)
    CFRelease(v5);

}

- (void)_sendXPCMessageSynchronous:(BOOL)a3 withParameters:(id)a4 handlerBlock:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, xpc_object_t);
  _xpc_connection_s *v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  NSObject *v14;
  _QWORD aBlock[4];
  id v16;

  v5 = a3;
  v7 = a5;
  v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__DADConnection__sendXPCMessageSynchronous_withParameters_handlerBlock___block_invoke;
  aBlock[3] = &unk_1E68DAEE8;
  v16 = v7;
  v9 = v7;
  v10 = (void (**)(void *, xpc_object_t))_Block_copy(aBlock);
  -[DADConnection _connection](self, "_connection");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5)
  {
    v13 = xpc_connection_send_message_with_reply_sync(v11, v8);

    v10[2](v10, v13);
    v12 = (_xpc_connection_s *)v13;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message_with_reply(v12, v8, v14, v10);

  }
}

void __72__DADConnection__sendXPCMessageSynchronous_withParameters_handlerBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  id v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = v3;
    v4 = MEMORY[0x1B5E496FC]() == MEMORY[0x1E0C812F8];
    v3 = v6;
    if (v4)
    {
      v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      v3 = v6;
    }
  }

}

- (id)beginDownloadingAttachmentWithUUID:(id)a3 accountID:(id)a4 queue:(id)a5 progressBlock:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  DADownloadContext *v18;
  void *v19;
  DADownloadContext *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  DADownloadContext *v33;
  id v34;
  id v35;
  DADConnection *v36;
  _BYTE *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[3];
  _QWORD v48[3];
  uint8_t v49[16];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  DALoggingwithCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_1B5244000, v17, OS_LOG_TYPE_INFO, "Requesting download of attachment UUID %@ for accountID %{public}@", buf, 0x16u);
  }

  v18 = -[DADownloadContext initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:]([DADownloadContext alloc], "initWithAttachmentUUID:accountID:queue:downloadProgressBlock:completionBlock:", v12, v13, v14, v15, v16);
  v47[0] = CFSTR("kDAEMessageNameKey");
  v47[1] = CFSTR("kDAEAttachmentUUIDKey");
  v48[0] = CFSTR("kDAEBeginDownloadingAttachment");
  v48[1] = v12;
  v47[2] = CFSTR("kDAEAccountIdKey");
  v48[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __98__DADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke;
  v32 = &unk_1E68DAF38;
  v20 = v18;
  v33 = v20;
  v37 = buf;
  v21 = v12;
  v34 = v21;
  v22 = v13;
  v35 = v22;
  v36 = self;
  v38 = &v39;
  -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 1, v19, &v29);
  if (*((_BYTE *)v40 + 24))
  {
    if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)v49 = xmmword_1E68DB210;
      v50 = 0;
      ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
    {
      DALoggingwithCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v49 = 138543362;
        *(_QWORD *)&v49[4] = v22;
        _os_log_impl(&dword_1B5244000, v23, OS_LOG_TYPE_DEBUG, "Begin download attachment on exchangesyncd for accountID %{public}@", v49, 0xCu);
      }

      objc_msgSend(getESDConnectionClass(), "sharedConnection", v29, v30, v31, v32, v33, v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "beginDownloadingAttachmentWithUUID:accountID:queue:progressBlock:completionBlock:", v21, v22, v14, v15, v16);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v25;

    }
  }
  v27 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(buf, 8);

  return v27;
}

void __98__DADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEInvalidAccountIDKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    DALoggingwithCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v4;
      _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");
    if (v6)
      v8 = v7 == 2;
    else
      v8 = 1;
    if (v8)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEAttachmentDownloadIdKey"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      DALoggingwithCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v14 = *(_QWORD *)(a1 + 40);
        v15 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v25 = v13;
        v26 = 2114;
        v27 = v14;
        v28 = 2114;
        v29 = v15;
        _os_log_impl(&dword_1B5244000, v12, OS_LOG_TYPE_INFO, "Download context %@ set up for downloading attachment UUID %{public}@ on accountID %{public}@", buf, 0x20u);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __98__DADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_199;
      block[3] = &unk_1E68DAF10;
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(a1 + 64);
      v18 = *(NSObject **)(v16 + 24);
      block[1] = 3221225472;
      block[4] = v16;
      v23 = v17;
      v22 = *(id *)(a1 + 32);
      dispatch_sync(v18, block);

    }
    else
    {
      v19 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v7, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "finishedWithError:", v20);

    }
  }

}

uint64_t __98__DADConnection_beginDownloadingAttachmentWithUUID_accountID_queue_progressBlock_completionBlock___block_invoke_199(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 72), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)_cancelDownloadsWithIDs:(id)a3 error:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *muckingWithInFlightCollections;
  id obj;
  _QWORD block[7];
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v14[0] = 0;
        v14[1] = v14;
        v14[2] = 0x3032000000;
        v14[3] = __Block_byref_object_copy_;
        v14[4] = __Block_byref_object_dispose_;
        v15 = 0;
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __47__DADConnection__cancelDownloadsWithIDs_error___block_invoke;
        block[3] = &unk_1E68DAEA0;
        block[5] = v10;
        block[6] = v14;
        block[4] = self;
        dispatch_sync(muckingWithInFlightCollections, block);
        _Block_object_dispose(v14, 8);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

uint64_t __47__DADConnection__cancelDownloadsWithIDs_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 72), "removeObjectForKey:", a1[5]);
}

- (void)cancelDownloadingAttachmentWithDownloadID:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[3];
  _QWORD v17[3];
  uint8_t buf[16];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17[0] = CFSTR("kDAECancelDownloadingAttachment");
  v16[0] = CFSTR("kDAEMessageNameKey");
  v16[1] = CFSTR("kDAEErrorDataKey");
  v7 = (void *)MEMORY[0x1E0CB36F8];
  v8 = a4;
  objc_msgSend(v7, "archivedDataWithRootObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = CFSTR("kDAEAttachmentDownloadIdKey");
  v17[1] = v9;
  v17[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1B5244000, v11, OS_LOG_TYPE_INFO, "Cancelling Download of attachment with downloadID %@", buf, 0xCu);
  }

  -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v10, 0);
  v15 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection _cancelDownloadsWithIDs:error:](self, "_cancelDownloadsWithIDs:error:", v12, v8);

  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E68DB210;
    v19 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_1B5244000, v13, OS_LOG_TYPE_DEBUG, "Canceling downloading attachments on exchangesyncd for downloadIDs %@", buf, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancelDownloadingAttachmentWithDownloadID:error:", v6, 0);

  }
}

- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id, id, void *);
  NSObject *v16;
  DASharedCalendarContext *v17;
  void *v18;
  void *v19;
  DASharedCalendarContext *v20;
  NSObject *v21;
  _QWORD v22[4];
  DASharedCalendarContext *v23;
  id v24;
  id v25;
  DADConnection *v26;
  _QWORD v27[4];
  _QWORD v28[4];
  uint8_t buf[4];
  int64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, id, id, void *))a7;
  DALoggingwithCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v30 = a3;
    v31 = 2112;
    v32 = v12;
    v33 = 2114;
    v34 = v13;
    _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_DEBUG, "Requesting share response %ld for calendar %@ for accountID %{public}@", buf, 0x20u);
  }

  if (v12 && v13)
  {
    v17 = -[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]([DASharedCalendarContext alloc], "initWithCalendarID:accountID:queue:completionBlock:", v12, v13, v14, v15);
    -[DASharedCalendarContext setShouldSyncCalendar:](v17, "setShouldSyncCalendar:", a3 == 1);
    v27[0] = CFSTR("kDAEMessageNameKey");
    v27[1] = CFSTR("kDAEAccountIdKey");
    v28[0] = CFSTR("kDAERespondToSharedCalendar");
    v28[1] = v13;
    v27[2] = CFSTR("kDAESharedCalendarReponseTypeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = CFSTR("kDAESharedCalendarResponseCalendarIDKey");
    v28[2] = v18;
    v28[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __97__DADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke;
    v22[3] = &unk_1E68DAF60;
    v23 = v17;
    v24 = v12;
    v25 = v13;
    v26 = self;
    v20 = v17;
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v19, v22);

  }
  else
  {
    DALoggingwithCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v21, OS_LOG_TYPE_ERROR, "Not continuing with respondToSharedCalendarInvite. Given calendarId or accountId is nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v12, v13, v19);
  }

}

void __97__DADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAESharedCalendarActionIdKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v20 = v7;
      v21 = 2112;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "Share request %@ set up for sharing calendar id %@ on accountID %{public}@", buf, 0x20u);
    }

    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(NSObject **)(v11 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__DADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_202;
    block[3] = &unk_1E68DAD90;
    block[4] = v11;
    v17 = v7;
    v18 = *(id *)(a1 + 32);
    v13 = v7;
    dispatch_sync(v12, block);

  }
  else
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishedWithError:", v15);

  }
}

uint64_t __97__DADConnection_respondToSharedCalendarInvite_forCalendarWithID_accountID_queue_completionBlock___block_invoke_202(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 104), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, id, void *);
  NSObject *v14;
  DASharedCalendarContext *v15;
  void *v16;
  DASharedCalendarContext *v17;
  NSObject *v18;
  _QWORD v19[4];
  DASharedCalendarContext *v20;
  id v21;
  id v22;
  DADConnection *v23;
  _QWORD v24[3];
  _QWORD v25[3];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, id, void *))a6;
  DALoggingwithCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v10;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1B5244000, v14, OS_LOG_TYPE_DEBUG, "Reporting calendar %@ for accountID %{public}@ as junk", buf, 0x16u);
  }

  if (v10 && v11)
  {
    v15 = -[DASharedCalendarContext initWithCalendarID:accountID:queue:completionBlock:]([DASharedCalendarContext alloc], "initWithCalendarID:accountID:queue:completionBlock:", v10, v11, v12, v13);
    -[DASharedCalendarContext setShouldSyncCalendar:](v15, "setShouldSyncCalendar:", 0);
    v24[0] = CFSTR("kDAEMessageNameKey");
    v24[1] = CFSTR("kDAEAccountIdKey");
    v25[0] = CFSTR("kDAEReportSharedCalendarAsJunk");
    v25[1] = v11;
    v24[2] = CFSTR("kDAESharedCalendarResponseCalendarIDKey");
    v25[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__DADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke;
    v19[3] = &unk_1E68DAF60;
    v20 = v15;
    v21 = v10;
    v22 = v11;
    v23 = self;
    v17 = v15;
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v16, v19);

  }
  else
  {
    DALoggingwithCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v18, OS_LOG_TYPE_ERROR, "Not continuing with reportSharedCalendarInviteAsJunkForCalendarWithID. Given calendarId or accountId is nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v10, v11, v16);
  }

}

void __99__DADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAESharedCalendarActionIdKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v20 = v7;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "Share request %@ set up for sharing calendar id %@ on accountID %@", buf, 0x20u);
    }

    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(NSObject **)(v11 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__DADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_203;
    block[3] = &unk_1E68DAD90;
    block[4] = v11;
    v17 = v7;
    v18 = *(id *)(a1 + 32);
    v13 = v7;
    dispatch_sync(v12, block);

  }
  else
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishedWithError:", v15);

  }
}

uint64_t __99__DADConnection_reportSharedCalendarInviteAsJunkForCalendarWithID_accountID_queue_completionBlock___block_invoke_203(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 104), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)fetchOfficeHoursForAccountWithID:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  DADConnection *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    _os_log_impl(&dword_1B5244000, v11, OS_LOG_TYPE_DEBUG, "Fetching office hours for accountID %{public}@", buf, 0xCu);
  }

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setAccountID:", v8);
  objc_msgSend(v12, "setQueue:", v10);

  objc_msgSend(v12, "setFetchCompletionBlock:", v9);
  v20[0] = CFSTR("kDAEMessageNameKey");
  v20[1] = CFSTR("kDAEAccountIdKey");
  v21[0] = CFSTR("kDAEFetchOfficeHours");
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__DADConnection_fetchOfficeHoursForAccountWithID_queue_completionBlock___block_invoke;
  v16[3] = &unk_1E68DAF88;
  v17 = v12;
  v18 = v8;
  v19 = self;
  v14 = v8;
  v15 = v12;
  -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v13, v16);

}

void __72__DADConnection_fetchOfficeHoursForAccountWithID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEOfficeHoursRequestIdKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "Office hours fetch request %{public}@ set up for accountID %{public}@", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(NSObject **)(v10 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__DADConnection_fetchOfficeHoursForAccountWithID_queue_completionBlock___block_invoke_205;
    block[3] = &unk_1E68DAD90;
    block[4] = v10;
    v16 = v7;
    v17 = *(id *)(a1 + 32);
    v12 = v7;
    dispatch_sync(v11, block);

  }
  else
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "abortWithError:", v14);

  }
}

uint64_t __72__DADConnection_fetchOfficeHoursForAccountWithID_queue_completionBlock___block_invoke_205(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 120), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)setOfficeHours:(id)a3 forAccountWithID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, void *);
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  DADConnection *v23;
  _QWORD v24[3];
  _QWORD v25[3];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, void *))a6;
  DALoggingwithCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v11;
    _os_log_impl(&dword_1B5244000, v14, OS_LOG_TYPE_DEBUG, "Setting office hours for accountID %{public}@", buf, 0xCu);
  }

  if (!v10)
  {
    v16 = 0;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 91, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v11, v18);
    goto LABEL_9;
  }
  +[CalDAVOfficeHour dataFromOfficeHours:](CalDAVOfficeHour, "dataFromOfficeHours:", v10);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v11 || !v15)
    goto LABEL_8;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setAccountID:", v11);
  objc_msgSend(v17, "setQueue:", v12);
  objc_msgSend(v17, "setSetCompletionBlock:", v13);
  v24[0] = CFSTR("kDAEMessageNameKey");
  v24[1] = CFSTR("kDAEAccountIdKey");
  v25[0] = CFSTR("kDAESetOfficeHours");
  v25[1] = v11;
  v24[2] = CFSTR("kDAEOfficeHoursDataKey");
  v25[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__DADConnection_setOfficeHours_forAccountWithID_queue_completionBlock___block_invoke;
  v20[3] = &unk_1E68DAF88;
  v21 = v17;
  v22 = v11;
  v23 = self;
  v19 = v17;
  -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v18, v20);

LABEL_9:
}

void __71__DADConnection_setOfficeHours_forAccountWithID_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEOfficeHoursRequestIdKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "Office hours set request %{public}@ set up for accountID %{public}@", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(NSObject **)(v10 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__DADConnection_setOfficeHours_forAccountWithID_queue_completionBlock___block_invoke_206;
    block[3] = &unk_1E68DAD90;
    block[4] = v10;
    v16 = v7;
    v17 = *(id *)(a1 + 32);
    v12 = v7;
    dispatch_sync(v11, block);

  }
  else
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "abortWithError:", v14);

  }
}

uint64_t __71__DADConnection_setOfficeHours_forAccountWithID_queue_completionBlock___block_invoke_206(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 120), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)reportSubscriptionCalendarAsJunk:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[8];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Marking a subscription calendar as junk", v7, 2u);
  }

  v8[0] = CFSTR("kDAEMessageNameKey");
  v8[1] = CFSTR("kDAEURLStringKey");
  v9[0] = CFSTR("kDAEReportSubscribedCalendarAsJunk");
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v6, &__block_literal_global_207);
}

- (void)checkSubscriptionCalendarIsJunk:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, const __CFString *, _QWORD, void *);
  NSObject *v11;
  DACheckSubscribedCalendarIsJunkContext *v12;
  void *v13;
  DACheckSubscribedCalendarIsJunkContext *v14;
  NSObject *v15;
  _QWORD v16[4];
  DACheckSubscribedCalendarIsJunkContext *v17;
  id v18;
  DADConnection *v19;
  uint8_t buf[8];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, const __CFString *, _QWORD, void *))a5;
  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5244000, v11, OS_LOG_TYPE_DEBUG, "Checking whether a subscription calendar is junk", buf, 2u);
  }

  if (v8)
  {
    v12 = -[DACheckSubscribedCalendarIsJunkContext initWithURLString:completionBlock:]([DACheckSubscribedCalendarIsJunkContext alloc], "initWithURLString:completionBlock:", v8, v10);
    -[DACheckSubscribedCalendarIsJunkContext setQueue:](v12, "setQueue:", v9);
    v21[0] = CFSTR("kDAEMessageNameKey");
    v21[1] = CFSTR("kDAEURLStringKey");
    v22[0] = CFSTR("kDAECheckSubscribedCalendarIsJunk");
    v22[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__DADConnection_checkSubscriptionCalendarIsJunk_queue_completionBlock___block_invoke;
    v16[3] = &unk_1E68DAF88;
    v17 = v12;
    v18 = v8;
    v19 = self;
    v14 = v12;
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v13, v16);

  }
  else
  {
    DALoggingwithCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v15, OS_LOG_TYPE_ERROR, "Not continuing with checkSubscriptionCalendarIsJunk. Given urlString is nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, &stru_1E68DC130, 0, v13);
  }

}

void __71__DADConnection_checkSubscriptionCalendarIsJunk_queue_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAECheckSubscribedCalendarIsJunkIdKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "Check junk request %@ set up for subscribed calendar URL %@", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(NSObject **)(v10 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__DADConnection_checkSubscriptionCalendarIsJunk_queue_completionBlock___block_invoke_209;
    block[3] = &unk_1E68DAD90;
    block[4] = v10;
    v16 = v7;
    v17 = *(id *)(a1 + 32);
    v12 = v7;
    dispatch_sync(v11, block);

  }
  else
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishedWithError:", v14);

  }
}

uint64_t __71__DADConnection_checkSubscriptionCalendarIsJunk_queue_completionBlock___block_invoke_209(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 152), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)fetchAvailableHolidayCalendarsWithResultsBlock:(id)a3 completionBlock:(id)a4 queue:(id)a5
{
  id v8;
  void (**v9)(id, NSObject *);
  id v10;
  NSObject *v11;
  DAHolidayCalendarsFetchContext *v12;
  NSObject *v13;
  DAHolidayCalendarsFetchContext *v14;
  NSObject *v15;
  _QWORD v16[4];
  DAHolidayCalendarsFetchContext *v17;
  DADConnection *v18;
  uint8_t buf[8];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, NSObject *))a4;
  v10 = a5;
  DALoggingwithCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5244000, v11, OS_LOG_TYPE_DEBUG, "Fetching list of available holiday calendars", buf, 2u);
  }

  if (v9)
  {
    if (v8)
    {
      v12 = -[DAHolidayCalendarsFetchContext initWithResultsBlock:completionBlock:]([DAHolidayCalendarsFetchContext alloc], "initWithResultsBlock:completionBlock:", v8, v9);
      -[DAHolidayCalendarsFetchContext setQueue:](v12, "setQueue:", v10);
      v20 = CFSTR("kDAEMessageNameKey");
      v21[0] = CFSTR("kDAEFetchHolidayCalendars");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __86__DADConnection_fetchAvailableHolidayCalendarsWithResultsBlock_completionBlock_queue___block_invoke;
      v16[3] = &unk_1E68DAFF0;
      v17 = v12;
      v18 = self;
      v14 = v12;
      -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v13, v16);

    }
    else
    {
      DALoggingwithCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B5244000, v15, OS_LOG_TYPE_ERROR, "Not continuing with fetchAvailableHolidayCalendarsWithResultsBlock. resultsBlock is null.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13);
    }
  }
  else
  {
    DALoggingwithCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v13, OS_LOG_TYPE_ERROR, "Not continuing with fetchAvailableHolidayCalendarsWithResultsBlock. completionBlock is null.", buf, 2u);
    }
  }

}

void __86__DADConnection_fetchAvailableHolidayCalendarsWithResultsBlock_completionBlock_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEFetchHolidayCalendarsIdKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "Holiday calendar fetch request set up: %@", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = *(NSObject **)(v9 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__DADConnection_fetchAvailableHolidayCalendarsWithResultsBlock_completionBlock_queue___block_invoke_211;
    block[3] = &unk_1E68DAD90;
    block[4] = v9;
    v15 = v7;
    v16 = v10;
    v13 = v7;
    dispatch_sync(v11, block);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishedWithError:", v13);
  }

}

uint64_t __86__DADConnection_fetchAvailableHolidayCalendarsWithResultsBlock_completionBlock_queue___block_invoke_211(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 160), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (BOOL)processFolderChange:(id)a3 forAccountWithID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v11 = xmmword_1E68DB210;
    v12 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v11) = 138543362;
      *(_QWORD *)((char *)&v11 + 4) = v6;
      _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_DEBUG, "Process folder change on exchangesyncd for accountID %{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "processFolderChange:forAccountWithID:", v5, v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)statusReports
{
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD handler[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v21 = CFSTR("kDAEMessageNameKey");
  v22[0] = CFSTR("kDAEGetStatusReports");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v5 = dispatch_semaphore_create(0);
  -[DADConnection _connection](self, "_connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __30__DADConnection_statusReports__block_invoke;
  handler[3] = &unk_1E68DB018;
  v14 = &v15;
  v8 = v5;
  v13 = v8;
  xpc_connection_send_message_with_reply(v6, v4, v7, handler);

  v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __30__DADConnection_statusReports__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1B5E496FC]() == MEMORY[0x1E0C812F8])
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEStatusReportsKey"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8 || objc_msgSend(v8, "intValue") != 2)
    {
      DALoggingwithCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315394;
        v12 = "-[DADConnection statusReports]_block_invoke";
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1B5244000, v10, OS_LOG_TYPE_ERROR, "Server error in %s communicating with daemon: %@", (uint8_t *)&v11, 0x16u);
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)registerForInterrogationWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id statusReportBlock;

  v4 = a3;
  v5 = v4;
  if (self->_statusReportBlock != v4)
  {
    if (v4)
      v6 = (void *)objc_msgSend(v4, "copy");
    else
      v6 = 0;
    v7 = _Block_copy(v6);
    statusReportBlock = self->_statusReportBlock;
    self->_statusReportBlock = v7;

  }
  return 1;
}

- (void)fillOutCurrentEASTimeZoneInfo
{
  NSObject *v2;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E68DB210;
    v5 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v4) = 0;
      _os_log_impl(&dword_1B5244000, v2, OS_LOG_TYPE_DEBUG, "Fill out current EAS timezone info on exchangesyncd", (uint8_t *)&v4, 2u);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fillOutCurrentEASTimeZoneInfo");

  }
}

- (id)activeSyncDeviceIdentifier
{
  NSObject *v2;
  void *v3;
  void *v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v6 = xmmword_1E68DB210;
    v7 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
    return 0;
  DALoggingwithCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1B5244000, v2, OS_LOG_TYPE_DEBUG, "Get active sync device identifier on exchangesyncd", (uint8_t *)&v6, 2u);
  }

  objc_msgSend(getESDConnectionClass(), "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSyncDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_performOofSettingsRequest:(id)a3 forAccountWithID:(id)a4 forUpdate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _xpc_connection_s *v16;
  xpc_object_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  NSObject *muckingWithInFlightCollections;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  _QWORD block[4];
  id v32;
  id v33;
  DADConnection *v34;
  BOOL v35;
  uint8_t buf[8];
  _QWORD v37[3];
  _QWORD v38[4];

  v5 = a5;
  v38[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v37[0] = CFSTR("kDAEMessageNameKey");
    v37[1] = CFSTR("kDAEAccountIdKey");
    v38[0] = CFSTR("kDAEOofSettings");
    v38[1] = v9;
    v37[2] = CFSTR("kDAEOofIsUpdateKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithDictionary:", v12);

    if (v5)
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, CFSTR("kDAEOofSettingsRequestKey"));

    }
    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[DADConnection _connection](self, "_connection");
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v17 = xpc_connection_send_message_with_reply_sync(v16, v15);

    if (MEMORY[0x1B5E496FC](v17) == MEMORY[0x1E0C812F8])
    {
      v19 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kDAEOofRequestIDKey"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRequestID:");
      v30 = v19;
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");
      if (v20)
        v22 = v21 == 2;
      else
        v22 = 1;
      v18 = v22;
      if (v22)
      {
        muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __71__DADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke;
        block[3] = &unk_1E68DB040;
        v35 = v5;
        v32 = v8;
        v27 = v29;
        v33 = v29;
        v34 = self;
        dispatch_sync(muckingWithInFlightCollections, block);

        v25 = v32;
      }
      else
      {
        v24 = v21;
        objc_msgSend(v8, "consumer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v24, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "oofRequestInfo:finishedWithResult:error:", v8, 0, v26);

        v27 = v29;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    DALoggingwithCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v13, OS_LOG_TYPE_ERROR, "nil accountID passed to performASSettingsRequest. Cannot continue.", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

uint64_t __71__DADConnection__performOofSettingsRequest_forAccountWithID_forUpdate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(a1 + 56))
      v3 = CFSTR("update");
    else
      v3 = CFSTR("retrieve");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B5244000, v2, OS_LOG_TYPE_DEBUG, "Adding to inflight dictionary: oof %@ request %@ for key %@", (uint8_t *)&v7, 0x20u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 112), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)retrieveOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v11 = xmmword_1E68DB210;
    v12 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v11) = 138543362;
      *(_QWORD *)((char *)&v11 + 4) = v6;
      _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_DEBUG, "Retrieve OOF settings on exchangesyncd for accountID %{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "retrieveOofSettingsRequest:forAccountWithID:", v5, v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)updateOofSettingsRequest:(id)a3 forAccountWithID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v11 = xmmword_1E68DB210;
    v12 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v11) = 138543362;
      *(_QWORD *)((char *)&v11 + 4) = v6;
      _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_DEBUG, "Update OOF settings on exchangesyncd for accountID %{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "updateOofSettingsRequest:forAccountWithID:", v5, v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)isOofSettingsSupportedForAccountWithID:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_1E68DB210;
    v10 = 0;
    ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
  {
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v9) = 138543362;
      *(_QWORD *)((char *)&v9 + 4) = v5;
      _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_DEBUG, "Checking OOF supported on exchangesyncd for accountID %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(getESDConnectionClass(), "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isOofSettingsSupportedForAccountWithID:completionBlock:", v5, v6);

  }
}

- (id)requestCalendarAvailabilityWithAccountID:(id)a3 startDate:(id)a4 endDate:(id)a5 ignoredEventID:(id)a6 addresses:(id)a7 resultsBlock:(id)a8 completionBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id *v29;
  id *v30;
  id v31;
  NSObject *v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  NSObject *v44;
  id v45;
  _QWORD v46[3];
  _QWORD block[4];
  id v48;
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE buf[24];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v42 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy_;
  v58 = __Block_byref_object_dispose_;
  v59 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  if (!v15)
  {
    DALoggingwithCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = 0;
      v22 = "Invalid 'accountID' provided: [%{public}@].";
      v23 = v21;
      v24 = 12;
      goto LABEL_9;
    }
LABEL_10:

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v16 || !v17 || objc_msgSend(v16, "compare:", v17) == 1)
  {
    DALoggingwithCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      v22 = "Invalid 'startDate' [%@] and/or 'endDate' [%@] provided.";
      v23 = v21;
      v24 = 22;
LABEL_9:
      _os_log_impl(&dword_1B5244000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v18 && objc_msgSend(v18, "count"))
  {
    DALoggingwithCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v61 = v17;
      v62 = 2112;
      v63 = v42;
      v64 = 2112;
      v65 = v18;
      _os_log_impl(&dword_1B5244000, v33, OS_LOG_TYPE_DEBUG, "Preparing calendar availability request.  accountID: [%{public}@] startDate: [%@] endDate: [%@] ignoredEventID: [%@] addresses: [%@]", buf, 0x34u);
    }

    v27 = v19;
    v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v34, "setObject:forKey:", CFSTR("kDAERequestCalendarAvailability"), CFSTR("kDAEMessageNameKey"));
    objc_msgSend(v34, "setObject:forKey:", v15, CFSTR("kDAEAccountIdKey"));
    objc_msgSend(v34, "setObject:forKey:", v16, CFSTR("kDAEStartDateKey"));
    objc_msgSend(v34, "setObject:forKey:", v17, CFSTR("kDAEEndDateKey"));
    objc_msgSend(v34, "setObject:forKey:", v18, CFSTR("kDAEAddressesKey"));
    if (v42)
      objc_msgSend(v34, "setObject:forKey:", v42, CFSTR("kDAEIgnoredEventIDKey"));
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_216;
    v43[3] = &unk_1E68DB090;
    v41 = v20;
    v45 = v41;
    v46[1] = &v54;
    v35 = v19;
    v46[0] = v35;
    v43[4] = self;
    v28 = v34;
    v44 = v28;
    v46[2] = &v50;
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 1, v28, v43);
    if (*((_BYTE *)v51 + 24))
    {
      if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)buf = xmmword_1E68DB210;
        *(_QWORD *)&buf[16] = 0;
        ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
      {
        DALoggingwithCategory(0);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v15;
          _os_log_impl(&dword_1B5244000, v36, OS_LOG_TYPE_DEBUG, "Retry request calendar availability on exchangesyncd for accountID %{public}@", buf, 0xCu);
        }

        objc_msgSend(getESDConnectionClass(), "sharedConnection");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "requestCalendarAvailabilityWithAccountID:startDate:endDate:ignoredEventID:addresses:resultsBlock:completionBlock:", v15, v16, v17, v42, v18, v35, v41);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v55[5];
        v55[5] = v38;

      }
    }

    v25 = 0;
    v29 = &v45;
    v30 = (id *)v46;
    goto LABEL_15;
  }
  DALoggingwithCategory(0);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5244000, v40, OS_LOG_TYPE_DEBUG, "No 'addresses' provided.", buf, 2u);
  }

  v25 = 0;
LABEL_11:
  DALoggingwithCategory(0);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5244000, v26, OS_LOG_TYPE_DEFAULT, "Will not issue calendar availability request.", buf, 2u);
  }

  if (v20)
  {
    v27 = v19;
    dispatch_get_global_queue(0, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E68DB068;
    v29 = &v49;
    v49 = v20;
    v30 = &v48;
    v25 = v25;
    v48 = v25;
    dispatch_async(v28, block);
LABEL_15:

    v19 = v27;
  }
  v31 = (id)v55[5];

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return v31;
}

uint64_t __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_216(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  DAECalendarAvailabilityContext *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  DAECalendarAvailabilityContext *v17;
  _QWORD block[5];
  DAECalendarAvailabilityContext *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEInvalidAccountIDKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    DALoggingwithCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v4;
      _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");
    if (v6)
      v8 = v7 == 2;
    else
      v8 = 1;
    if (v8)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAECalendarAvailabilityRequestIDKey"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1[8] + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v12 = -[DAECalendarAvailabilityContext initWithResultsBlock:completionBlock:]([DAECalendarAvailabilityContext alloc], "initWithResultsBlock:completionBlock:", a1[7], a1[6]);
      objc_msgSend((id)objc_opt_class(), "_logRequestID:forRequestAttributes:associatedContext:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), a1[5], v12);
      v13 = a1[4];
      v14 = *(NSObject **)(v13 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2;
      block[3] = &unk_1E68DAF10;
      v15 = a1[8];
      v19 = v12;
      v20 = v15;
      block[4] = v13;
      v17 = v12;
      dispatch_sync(v14, block);

    }
    else
    {
      v16 = a1[6];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v7, 0);
      v17 = (DAECalendarAvailabilityContext *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, DAECalendarAvailabilityContext *))(v16 + 16))(v16, v17);
    }

  }
}

uint64_t __130__DADConnection_requestCalendarAvailabilityWithAccountID_startDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 80), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)cancelCalendarAvailabilityRequestWithID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *muckingWithInFlightCollections;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  uint8_t *v13;
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t v20[4];
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v22[0] = CFSTR("kDAEMessageNameKey");
    v22[1] = CFSTR("kDAECalendarAvailabilityRequestIDKey");
    v23[0] = CFSTR("kDAECancelCalendarAvailabilityRequest");
    v23[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v6, 0);
    *(_QWORD *)buf = 0;
    v15 = buf;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__DADConnection_cancelCalendarAvailabilityRequestWithID___block_invoke;
    block[3] = &unk_1E68DAEA0;
    v13 = buf;
    block[4] = self;
    v8 = v5;
    v12 = v8;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*((_QWORD *)v15 + 5))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v15 + 5), "finishedWithError:", v9);
    }
    else
    {
      DALoggingwithCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v20 = 138412290;
        v21 = v8;
        _os_log_impl(&dword_1B5244000, v10, OS_LOG_TYPE_DEBUG, "Retry canceling calendar availability request on exchangesyncd for requestID %@", v20, 0xCu);
      }

      objc_msgSend(getESDConnectionClass(), "sharedConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancelCalendarAvailabilityRequestWithID:", v8);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_DEBUG, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }

}

uint64_t __57__DADConnection_cancelCalendarAvailabilityRequestWithID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 80), "removeObjectForKey:", a1[5]);
}

- (void)_calendarAvailabilityRequestReturnedResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *muckingWithInFlightCollections;
  id v18;
  _QWORD block[5];
  id v20;
  __int128 *p_buf;
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarAvailabilityRequestIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarAvailabilityResultsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v13, v7, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;

  if (!v14)
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__DADConnection__calendarAvailabilityRequestReturnedResults___block_invoke;
  block[3] = &unk_1E68DAEA0;
  p_buf = &buf;
  block[4] = self;
  v18 = v6;
  v20 = v18;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "resultsReturned:", v14);

  _Block_object_dispose(&buf, 8);
}

void __61__DADConnection__calendarAvailabilityRequestReturnedResults___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_calendarAvailabilityRequestFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarAvailabilityRequestIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DADConnection__calendarAvailabilityRequestFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v13 = &v14;
  block[4] = self;
  v10 = v6;
  v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v15[5], "finishedWithError:", v8);

  _Block_object_dispose(&v14, 8);
}

uint64_t __54__DADConnection__calendarAvailabilityRequestFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 80), "removeObjectForKey:", a1[5]);
}

- (id)downloadSubscribedCalendarWithURL:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  DAESubscriptionCalendarDownloadContext *v12;
  DAESubscriptionCalendarDownloadContext *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  DAESubscriptionCalendarDownloadContext *v18;
  DADConnection *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKey:", CFSTR("kDAEDownloadSubscribedCalendar"), CFSTR("kDAEMessageNameKey"));
  objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("kDAESubCalDownloadURLKey"));
  v12 = objc_alloc_init(DAESubscriptionCalendarDownloadContext);
  -[DAESubscriptionCalendarDownloadContext setQueue:](v12, "setQueue:", v9);
  -[DAESubscriptionCalendarDownloadContext setDelegate:](v12, "setDelegate:", v10);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke;
  v17[3] = &unk_1E68DB0B8;
  v13 = v12;
  v21 = &v22;
  v18 = v13;
  v19 = self;
  v14 = v11;
  v20 = v14;
  -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 1, v14, v17);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAESubCalDownloadRequestIDKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend((id)objc_opt_class(), "_logRequestID:forRequestAttributes:associatedContext:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[6], a1[4]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[2] = __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_3;
    v17[3] = &unk_1E68DAF10;
    v11 = (void *)a1[4];
    v10 = a1[5];
    v12 = *(NSObject **)(v10 + 24);
    v17[1] = 3221225472;
    v13 = a1[7];
    v17[4] = v10;
    v19 = v13;
    v18 = v11;
    dispatch_sync(v12, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)a1[4];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_2;
    v20[3] = &unk_1E68DADE0;
    v21 = v14;
    v16 = v14;
    objc_msgSend(v15, "callOutToDelegate:", v20);

  }
}

uint64_t __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subscribedCalendarFailedWithError:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__DADConnection_downloadSubscribedCalendarWithURL_queue_delegate___block_invoke_3(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 144), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)cancelDownloadingSubscriptionCalendarWithDownloadID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *muckingWithInFlightCollections;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[5];
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v23[0] = CFSTR("kDAEMessageNameKey");
    v23[1] = CFSTR("kDAESubCalDownloadRequestIDKey");
    v24[0] = CFSTR("kDAECancelDownloadSubscribedCalendar");
    v24[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v6, 0);
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__DADConnection_cancelDownloadingSubscriptionCalendarWithDownloadID___block_invoke;
    block[3] = &unk_1E68DAEA0;
    v16 = buf;
    block[4] = self;
    v15 = v5;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*((_QWORD *)v18 + 5))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)*((_QWORD *)v18 + 5);
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __69__DADConnection_cancelDownloadingSubscriptionCalendarWithDownloadID___block_invoke_2;
      v12[3] = &unk_1E68DADE0;
      v11 = v9;
      v13 = v11;
      objc_msgSend(v10, "asyncCallOutToDelegate:", v12);

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_DEBUG, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }

}

uint64_t __69__DADConnection_cancelDownloadingSubscriptionCalendarWithDownloadID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 144), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 144), "removeObjectForKey:", a1[5]);
}

uint64_t __69__DADConnection_cancelDownloadingSubscriptionCalendarWithDownloadID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subscribedCalendarFailedWithError:", *(_QWORD *)(a1 + 32));
}

- (void)_downloadSubscribedCalendarProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *muckingWithInFlightCollections;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[6];
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAESubCalDownloadRequestIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEDownloadedBytesKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAETotalBytesKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__DADConnection__downloadSubscribedCalendarProgress___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v18 = &v19;
  block[4] = self;
  v13 = v6;
  v17 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  v14 = (void *)v20[5];
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __53__DADConnection__downloadSubscribedCalendarProgress___block_invoke_2;
  v15[3] = &__block_descriptor_48_e49_v16__0___DAESubscribedCalendarDownloadDelegate__8l;
  v15[4] = v8;
  v15[5] = v10;
  objc_msgSend(v14, "callOutToDelegate:", v15);

  _Block_object_dispose(&v19, 8);
}

void __53__DADConnection__downloadSubscribedCalendarProgress___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 144), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __53__DADConnection__downloadSubscribedCalendarProgress___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subscribedCalendarProgressedTo:totalBytes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_downloadSubscribedCalendarFinished:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *muckingWithInFlightCollections;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  __int128 *p_buf;
  id v27;
  id v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAESubCalDownloadRequestIDKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAESubCalDownloadSummaryDataKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v28;
    if (!v6)
    {
      DALoggingwithCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_ERROR, "Error unarchiving subcal summary data: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v27);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v27;
    if (!v10)
    {
      DALoggingwithCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1B5244000, v12, OS_LOG_TYPE_ERROR, "Error unarchiving subcal download error: %@", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  else
  {
    v10 = 0;
  }
  if (!(v5 | v10))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 10, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__DADConnection__downloadSubscribedCalendarFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  p_buf = &buf;
  block[4] = self;
  v15 = v20;
  v25 = v15;
  dispatch_sync(muckingWithInFlightCollections, block);
  v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __53__DADConnection__downloadSubscribedCalendarFinished___block_invoke_2;
  v21[3] = &unk_1E68DB100;
  v17 = v6;
  v22 = v17;
  v18 = (id)v10;
  v23 = v18;
  objc_msgSend(v16, "callOutToDelegate:", v21);

  _Block_object_dispose(&buf, 8);
}

uint64_t __53__DADConnection__downloadSubscribedCalendarFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 144), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 144), "removeObjectForKey:", a1[5]);
}

uint64_t __53__DADConnection__downloadSubscribedCalendarFinished___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(a2, "subscribedCalendarDidFinishLoading:");
  else
    return objc_msgSend(a2, "subscribedCalendarFailedWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_downloadSubscribedCalendarRequiresPassword:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *muckingWithInFlightCollections;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  DADConnection *v17;
  _QWORD block[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAESubCalDownloadRequestIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAESubCalDownloadURLKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v20 = &v21;
  block[4] = self;
  v10 = v6;
  v19 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  v11 = (void *)v22[5];
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke_2;
  v14[3] = &unk_1E68DB150;
  v12 = v7;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  v17 = self;
  objc_msgSend(v11, "callOutToDelegate:", v14);

  _Block_object_dispose(&v21, 8);
}

void __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 144), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke_3;
  v7[3] = &unk_1E68DB128;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  objc_msgSend(a2, "subscribedCalendarRequiresPassword:withContinuation:", v4, v7);

}

void __61__DADConnection__downloadSubscribedCalendarRequiresPassword___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    v12[0] = CFSTR("kDAEMessageNameKey");
    v12[1] = CFSTR("kDAESubCalDownloadRequestIDKey");
    v5 = *(_QWORD *)(a1 + 32);
    v13[0] = CFSTR("kDAESetPasswordForSubscribedCalendar");
    v13[1] = v5;
    v12[2] = CFSTR("kDAESubCalUsernameKey");
    v12[3] = CFSTR("kDAESubCalPasswordKey");
    v13[2] = a2;
    v13[3] = a3;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a3;
    v8 = a2;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v9, 0);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v8 = a3;
    v9 = a2;
    objc_msgSend(v11, "cancelDownloadingSubscriptionCalendarWithDownloadID:", v10);
  }

}

- (void)validateCandidateSubscriptionURLWithICloud:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;

  v6 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__DADConnection_validateCandidateSubscriptionURLWithICloud_queue_completionBlock___block_invoke;
  block[3] = &unk_1E68DB178;
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)a4, block);

}

uint64_t __82__DADConnection_validateCandidateSubscriptionURLWithICloud_queue_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)requestGrantedDelegatesListForAccountID:(id)a3 resultsBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (v6)
  {
    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "Preparing granted delegates list request for accountID: [%{public}@]", buf, 0xCu);
    }

    v31[0] = CFSTR("kDAEMessageNameKey");
    v31[1] = CFSTR("kDAEAccountIdKey");
    v32[0] = CFSTR("kDAERequestGrantedDelegatesList");
    v32[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__DADConnection_requestGrantedDelegatesListForAccountID_resultsBlock___block_invoke;
    v16[3] = &unk_1E68DB1A0;
    v10 = v7;
    v18 = v10;
    v19 = &v25;
    v16[4] = self;
    v11 = v9;
    v17 = v11;
    v20 = &v21;
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 1, v11, v16);
    if (*((_BYTE *)v22 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 15, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v12);

    }
    goto LABEL_11;
  }
  DALoggingwithCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = 0;
    _os_log_impl(&dword_1B5244000, v13, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%{public}@].", buf, 0xCu);
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v11);
LABEL_11:

  }
  v14 = (id)v26[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

void __70__DADConnection_requestGrantedDelegatesListForAccountID_resultsBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  DAEGrantedDelegatesListContext *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  DAEGrantedDelegatesListContext *v17;
  _QWORD block[5];
  DAEGrantedDelegatesListContext *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEInvalidAccountIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      DALoggingwithCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v9;
        _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEGrantedDelegatesListRequestIDKey"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[7] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = -[DAEGrantedDelegatesListContext initWithResultsBlock:]([DAEGrantedDelegatesListContext alloc], "initWithResultsBlock:", a1[6]);
      objc_msgSend((id)objc_opt_class(), "_logRequestID:forRequestAttributes:associatedContext:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[5], v13);
      v14 = a1[4];
      v15 = *(NSObject **)(v14 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__DADConnection_requestGrantedDelegatesListForAccountID_resultsBlock___block_invoke_2;
      block[3] = &unk_1E68DAF10;
      v16 = a1[7];
      v19 = v13;
      v20 = v16;
      block[4] = v14;
      v17 = v13;
      dispatch_sync(v15, block);

    }
  }
  else
  {
    v8 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
  }

}

uint64_t __70__DADConnection_requestGrantedDelegatesListForAccountID_resultsBlock___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 128), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)cancelGrantedDelegatesListRequestWithID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *muckingWithInFlightCollections;
  void *v8;
  _QWORD block[5];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v18[0] = CFSTR("kDAEMessageNameKey");
    v18[1] = CFSTR("kDAEGrantedDelegatesListRequestIDKey");
    v19[0] = CFSTR("kDAECancelGrantedDelegatesListRequest");
    v19[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v6, 0);
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__DADConnection_cancelGrantedDelegatesListRequestWithID___block_invoke;
    block[3] = &unk_1E68DAEA0;
    v11 = buf;
    block[4] = self;
    v10 = v5;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*((_QWORD *)v13 + 5))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v13 + 5), "finishedWithResults:error:", 0, v8);

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    DALoggingwithCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_DEBUG, "nil 'requestID' provided.  Will not cancel any calendar availability requests.", buf, 2u);
    }
  }

}

uint64_t __57__DADConnection_cancelGrantedDelegatesListRequestWithID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 128), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 128), "removeObjectForKey:", a1[5]);
}

- (void)_grantedDelegatesListRequestFinished:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *muckingWithInFlightCollections;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  __int128 *p_buf;
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEGrantedDelegatesListRequestIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kDAEGrantedDelegatesListResultsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3710];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v8, &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;

  if (!v13)
  {
    DALoggingwithCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1B5244000, v15, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DADConnection__grantedDelegatesListRequestFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  p_buf = &buf;
  block[4] = self;
  v17 = v5;
  v20 = v17;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "finishedWithResults:error:", v13, v7);

  _Block_object_dispose(&buf, 8);
}

uint64_t __54__DADConnection__grantedDelegatesListRequestFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 128), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 128), "removeObjectForKey:", a1[5]);
}

- (id)updateGrantedDelegateForAccountID:(id)a3 grantedDelegate:(id)a4 action:(int64_t)a5 resultsBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  NSObject *v24;
  id v25;
  uint64_t *v26;
  _QWORD *v27;
  id v28;
  _QWORD v29[3];
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[3];
  _QWORD v38[3];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  if (v9)
  {
    DALoggingwithCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v10, "uri");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "permission");
      *(_DWORD *)buf = 138543874;
      v40 = v9;
      v41 = 2112;
      v42 = v13;
      v43 = 2048;
      v44 = v14;
      _os_log_impl(&dword_1B5244000, v12, OS_LOG_TYPE_DEBUG, "Preparing update granted delegate permission for accountID: [%{public}@], delegate uri: %@, permission: %ld", buf, 0x20u);

    }
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v28;
    if (v16)
    {
      DALoggingwithCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "uri");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v18;
        _os_log_impl(&dword_1B5244000, v17, OS_LOG_TYPE_DEFAULT, "Unable to encode granted delegate with URI: %@", buf, 0xCu);

      }
    }
    else
    {
      v37[0] = CFSTR("kDAEMessageNameKey");
      v37[1] = CFSTR("kDAEAccountIdKey");
      v38[0] = CFSTR("kDAEUpdateGrantedDelegatePermissionRequest");
      v38[1] = v9;
      v37[2] = CFSTR("kDAEGrantedDelegateKey");
      v38[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __87__DADConnection_updateGrantedDelegateForAccountID_grantedDelegate_action_resultsBlock___block_invoke;
      v23[3] = &unk_1E68DB1A0;
      v25 = v11;
      v26 = &v31;
      v23[4] = self;
      v17 = v20;
      v24 = v17;
      v27 = v29;
      -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 1, v17, v23);

    }
    goto LABEL_13;
  }
  DALoggingwithCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = 0;
    _os_log_impl(&dword_1B5244000, v19, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%{public}@].", buf, 0xCu);
  }

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v11 + 2))(v11, v16);
LABEL_13:

  }
  v21 = (id)v32[5];
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);

  return v21;
}

void __87__DADConnection_updateGrantedDelegateForAccountID_grantedDelegate_action_resultsBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  DAEUpdateGrantedDelegatePermissionContext *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  DAEUpdateGrantedDelegatePermissionContext *v15;
  id v16;
  _QWORD block[5];
  DAEUpdateGrantedDelegatePermissionContext *v18;
  uint64_t v19;

  v16 = a2;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v3)
    v5 = v4 == 2;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAEInvalidAccountIDKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDAEUpdateGrantedDelegatePermissionRequestIDKey"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1[7] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = -[DAEUpdateGrantedDelegatePermissionContext initWithResultsBlock:]([DAEUpdateGrantedDelegatePermissionContext alloc], "initWithResultsBlock:", a1[6]);
      objc_msgSend((id)objc_opt_class(), "_logRequestID:forRequestAttributes:associatedContext:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[5], v11);
      v12 = a1[4];
      v13 = *(NSObject **)(v12 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __87__DADConnection_updateGrantedDelegateForAccountID_grantedDelegate_action_resultsBlock___block_invoke_2;
      block[3] = &unk_1E68DAF10;
      v14 = a1[7];
      v18 = v11;
      v19 = v14;
      block[4] = v12;
      v15 = v11;
      dispatch_sync(v13, block);

    }
  }
  else
  {
    v6 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }

}

uint64_t __87__DADConnection_updateGrantedDelegateForAccountID_grantedDelegate_action_resultsBlock___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 136), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)addExchangeDelegateWithName:(id)a3 emailAddress:(id)a4 toAccountWithID:(id)a5 completion:(id)a6
{
  void (**v6)(id, _QWORD, uint64_t, void *);
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v6 = (void (**)(id, _QWORD, uint64_t, void *))a6;
  DALoggingwithCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_ERROR, "Exchange delegates are not supported on this platform", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 10, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, -1, v8);

}

- (void)removeExchangeDelegateWithSourceID:(id)a3 fromParentAccountWithID:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = (void (**)(id, _QWORD, void *))a5;
  DALoggingwithCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_ERROR, "Exchange delegates are not supported on this platform", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v7);

}

- (void)_updateGrantedDelegatePermissionRequestFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *muckingWithInFlightCollections;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEUpdateGrantedDelegatePermissionRequestIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__DADConnection__updateGrantedDelegatePermissionRequestFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v13 = &v14;
  block[4] = self;
  v10 = v6;
  v12 = v10;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v15[5], "finishedWithError:", v8);

  _Block_object_dispose(&v14, 8);
}

uint64_t __65__DADConnection__updateGrantedDelegatePermissionRequestFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 136), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 136), "removeObjectForKey:", a1[5]);
}

- (id)performCalendarDirectorySearchWithAccountID:(id)a3 terms:(id)a4 recordTypes:(id)a5 resultLimit:(unint64_t)a6 resultsBlock:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id *v30;
  id *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v38;
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  DADConnection *v42;
  id v43;
  _QWORD v44[3];
  _QWORD block[4];
  id v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE buf[24];
  unint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy_;
  v56 = __Block_byref_object_dispose_;
  v57 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  if (v14)
  {
    if (v15 && objc_msgSend(v15, "count"))
    {
      if (v16 && objc_msgSend(v16, "count"))
      {
        DALoggingwithCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2048;
          v59 = a6;
          v60 = 2112;
          v61 = v15;
          _os_log_impl(&dword_1B5244000, v19, OS_LOG_TYPE_DEBUG, "Preparing calendar directory search.  accountID: [%{public}@] recordTypes:[%@] resultLimit: [%lu] terms: [%@]", buf, 0x2Au);
        }

        v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v20, "setObject:forKey:", CFSTR("kDAEPerformCalendarDirectorySearch"), CFSTR("kDAEMessageNameKey"));
        objc_msgSend(v20, "setObject:forKey:", v14, CFSTR("kDAEAccountIdKey"));
        objc_msgSend(v15, "allObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("kDAECalendarDirectorySearchTermsKey"));

        objc_msgSend(v16, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("kDAECalendarDirectorySearchRecordTypesKey"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v23, CFSTR("kDAECalendarDirectorySearchResultLimitKey"));

        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_226;
        v40[3] = &unk_1E68DB090;
        v39 = v18;
        v43 = v39;
        v44[1] = &v52;
        v38 = v17;
        v44[0] = v38;
        v24 = v20;
        v41 = v24;
        v42 = self;
        v44[2] = &v48;
        -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 1, v24, v40);
        if (*((_BYTE *)v49 + 24))
        {
          if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
          {
            *(_OWORD *)buf = xmmword_1E68DB210;
            *(_QWORD *)&buf[16] = 0;
            ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
          }
          if (ExchangeSyncExpressLibraryCore_frameworkLibrary)
          {
            DALoggingwithCategory(0);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v14;
              _os_log_impl(&dword_1B5244000, v25, OS_LOG_TYPE_DEBUG, "Retry calendar directory search on exchangesyncd for accountID %{public}@", buf, 0xCu);
            }

            objc_msgSend(getESDConnectionClass(), "sharedConnection");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "performCalendarDirectorySearchWithAccountID:terms:recordTypes:resultLimit:resultsBlock:completionBlock:", v14, v15, v16, a6, v38, v39);
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = (void *)v53[5];
            v53[5] = v27;

          }
        }

        v29 = 0;
        v30 = &v43;
        v31 = (id *)v44;
        goto LABEL_29;
      }
      DALoggingwithCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v33 = "No 'recordTypes' provided.";
    }
    else
    {
      DALoggingwithCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
LABEL_24:

        v29 = 0;
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      v33 = "No 'terms' provided.";
    }
    _os_log_impl(&dword_1B5244000, v32, OS_LOG_TYPE_DEBUG, v33, buf, 2u);
    goto LABEL_24;
  }
  DALoggingwithCategory(0);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = 0;
    _os_log_impl(&dword_1B5244000, v34, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%{public}@].", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
  v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
  DALoggingwithCategory(0);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5244000, v35, OS_LOG_TYPE_DEFAULT, "Will not issue calendar directory search.", buf, 2u);
  }

  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E68DB068;
    v30 = &v47;
    v47 = v18;
    v31 = &v46;
    v29 = v29;
    v46 = v29;
    dispatch_async(v24, block);
LABEL_29:

  }
  v36 = (id)v53[5];

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v36;
}

uint64_t __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_226(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  DAECalendarDirectorySearchContext *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  DAECalendarDirectorySearchContext *v20;
  _QWORD block[5];
  DAECalendarDirectorySearchContext *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  DAECalendarDirectorySearchContext *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEInvalidAccountIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      DALoggingwithCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v9;
        _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchIDKey"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[8] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = -[DAECalendarDirectorySearchContext initWithResultsBlock:completionBlock:]([DAECalendarDirectorySearchContext alloc], "initWithResultsBlock:completionBlock:", a1[7], a1[6]);
      DALoggingwithCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
        v16 = a1[4];
        *(_DWORD *)buf = 138412802;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_1B5244000, v14, OS_LOG_TYPE_DEBUG, "Received search ID [%@] for search with attributes: [%@].  Associated context: [%@]", buf, 0x20u);
      }

      v17 = a1[5];
      v18 = *(NSObject **)(v17 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_228;
      block[3] = &unk_1E68DAF10;
      v19 = a1[8];
      v22 = v13;
      v23 = v19;
      block[4] = v17;
      v20 = v13;
      dispatch_sync(v18, block);

    }
  }
  else
  {
    v8 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);
  }

}

uint64_t __120__DADConnection_performCalendarDirectorySearchWithAccountID_terms_recordTypes_resultLimit_resultsBlock_completionBlock___block_invoke_228(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 88), "setObject:forKeyedSubscript:", a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)cancelCalendarDirectorySearchWithID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *muckingWithInFlightCollections;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  uint8_t *v14;
  uint8_t v15[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  __int128 buf;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v21[0] = CFSTR("kDAEMessageNameKey");
    v21[1] = CFSTR("kDAECalendarDirectorySearchIDKey");
    v22[0] = CFSTR("kDAECancelCalendarDirectorySearch");
    v22[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v6 = objc_claimAutoreleasedReturnValue();
    -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v6, 0);
    *(_QWORD *)v15 = 0;
    v16 = v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__DADConnection_cancelCalendarDirectorySearchWithID___block_invoke;
    block[3] = &unk_1E68DAEA0;
    v14 = v15;
    block[4] = self;
    v8 = v5;
    v13 = v8;
    dispatch_sync(muckingWithInFlightCollections, block);
    if (*((_QWORD *)v16 + 5))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), -1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v16 + 5), "finishedWithError:exceededResultLimit:", v9, 0);
      DALoggingwithCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1B5244000, v10, OS_LOG_TYPE_DEBUG, "Cancelled calendar directory search with ID: [%@].", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
      {
        buf = xmmword_1E68DB210;
        v24 = 0;
        ExchangeSyncExpressLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (!ExchangeSyncExpressLibraryCore_frameworkLibrary)
        goto LABEL_15;
      DALoggingwithCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1B5244000, v11, OS_LOG_TYPE_DEBUG, "Retry canceling calendar directory search on exchangesyncd for searchID %@", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(getESDConnectionClass(), "sharedConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancelCalendarDirectorySearchWithID:", v8);
    }

LABEL_15:
    _Block_object_dispose(v15, 8);

    goto LABEL_16;
  }
  DALoggingwithCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_DEBUG, "nil 'searchID' provided.  Will not cancel any calendar directory searches.", v15, 2u);
  }
LABEL_16:

}

uint64_t __53__DADConnection_cancelCalendarDirectorySearchWithID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 88), "removeObjectForKey:", a1[5]);
}

- (void)_calendarDirectorySearchReturnedResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *muckingWithInFlightCollections;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[5];
  id v25;
  __int128 *p_buf;
  id v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchResultsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v13, v7, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;

  if (!v14)
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__DADConnection__calendarDirectorySearchReturnedResults___block_invoke;
  block[3] = &unk_1E68DAEA0;
  p_buf = &buf;
  block[4] = self;
  v19 = v6;
  v25 = v19;
  dispatch_sync(muckingWithInFlightCollections, block);
  v20 = objc_msgSend(v14, "count");
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __57__DADConnection__calendarDirectorySearchReturnedResults___block_invoke_2;
  v22[3] = &unk_1E68DB1C8;
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v20);
  v23 = v21;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v22);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "resultsReturned:", v21);

  _Block_object_dispose(&buf, 8);
}

void __57__DADConnection__calendarDirectorySearchReturnedResults___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __57__DADConnection__calendarDirectorySearchReturnedResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v7);
}

- (void)_calendarDirectorySearchFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *muckingWithInFlightCollections;
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchExceededResultLimitKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "BOOLValue");
  else
    v11 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__DADConnection__calendarDirectorySearchFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  v16 = &v17;
  block[4] = self;
  v13 = v6;
  v15 = v13;
  dispatch_sync(muckingWithInFlightCollections, block);
  objc_msgSend((id)v18[5], "finishedWithError:exceededResultLimit:", v8, v11);

  _Block_object_dispose(&v17, 8);
}

uint64_t __50__DADConnection__calendarDirectorySearchFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 88), "removeObjectForKey:", a1[5]);
}

- (void)performGroupExpansionWithAccountID:(id)a3 principalPath:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9 && objc_msgSend(v9, "length"))
    {
      DALoggingwithCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v24 = v8;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_1B5244000, v11, OS_LOG_TYPE_DEBUG, "Preparing group expansion.  accountID: [%{public}@]  principalPath: [%@]", buf, 0x16u);
      }

      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSObject setObject:forKey:](v12, "setObject:forKey:", CFSTR("kDAEPerformGroupExpansion"), CFSTR("kDAEMessageNameKey"));
      -[NSObject setObject:forKey:](v12, "setObject:forKey:", v8, CFSTR("kDAEAccountIdKey"));
      -[NSObject setObject:forKey:](v12, "setObject:forKey:", v9, CFSTR("kDAEGroupExpansionPrincipalPathKey"));
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke_231;
      v18[3] = &unk_1E68DB1F0;
      v13 = &v19;
      v18[4] = self;
      v19 = v10;
      -[DADConnection _sendXPCMessageSynchronous:withParameters:handlerBlock:](self, "_sendXPCMessageSynchronous:withParameters:handlerBlock:", 0, v12, v18);
      v14 = 0;
      goto LABEL_17;
    }
    DALoggingwithCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B5244000, v15, OS_LOG_TYPE_DEBUG, "No 'principalPath' provided.", buf, 2u);
    }

    v14 = 0;
  }
  else
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = 0;
      _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_DEFAULT, "Invalid 'accountID' provided: [%{public}@].", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 93, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  DALoggingwithCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5244000, v17, OS_LOG_TYPE_DEFAULT, "Will not do group expansion.", buf, 2u);
  }

  if (v10)
  {
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke;
    block[3] = &unk_1E68DB068;
    v13 = &v22;
    v22 = v10;
    v14 = v14;
    v21 = v14;
    dispatch_async(v12, block);

LABEL_17:
  }

}

uint64_t __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke_231(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  DAEGroupExpansionContext *v14;
  uint64_t v15;
  NSObject *v16;
  DAEGroupExpansionContext *v17;
  _QWORD block[5];
  id v19;
  DAEGroupExpansionContext *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEStatusKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEInvalidAccountIDKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      DALoggingwithCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v7;
        _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "The accountID %{public}@ is invalid for dataaccessd", buf, 0xCu);
      }

      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), 15, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v10);
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kDAEGroupExpansionIDKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[DAEGroupExpansionContext initWithCompletionBlock:]([DAEGroupExpansionContext alloc], "initWithCompletionBlock:", *(_QWORD *)(a1 + 40));
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(NSObject **)(v15 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke_2;
      block[3] = &unk_1E68DAD90;
      block[4] = v15;
      v19 = v13;
      v20 = v14;
      v17 = v14;
      v10 = v13;
      dispatch_sync(v16, block);

    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), v5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

  }
}

uint64_t __82__DADConnection_performGroupExpansionWithAccountID_principalPath_completionBlock___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 96), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)_groupExpansionFinished:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *muckingWithInFlightCollections;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD block[5];
  id v26;
  __int128 *p_buf;
  id v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEGroupExpansionIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAECalendarDirectorySearchResultsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v13, v7, &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;

  if (!v14)
  {
    DALoggingwithCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1B5244000, v16, OS_LOG_TYPE_DEFAULT, "Unable to decode results: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  muckingWithInFlightCollections = self->_muckingWithInFlightCollections;
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__DADConnection__groupExpansionFinished___block_invoke;
  block[3] = &unk_1E68DAEA0;
  p_buf = &buf;
  block[4] = self;
  v19 = v6;
  v26 = v19;
  dispatch_sync(muckingWithInFlightCollections, block);
  if (v15
    || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEErrorDataKey")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        -[DADConnection decodedErrorFromData:](self, "decodedErrorFromData:", v20),
        v15 = (id)objc_claimAutoreleasedReturnValue(),
        v20,
        v15))
  {
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "finishedWithError:", v15);
  }
  else
  {
    v21 = objc_msgSend(v14, "count");
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __41__DADConnection__groupExpansionFinished___block_invoke_2;
    v23[3] = &unk_1E68DB1C8;
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v21);
    v24 = v22;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v23);
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setResults:", v22);
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "finishedWithError:", 0);

    v15 = 0;
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __41__DADConnection__groupExpansionFinished___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 96), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 96), "removeObjectForKey:", a1[5]);
}

void __41__DADConnection__groupExpansionFinished___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v7);
}

- (DADConnection)init
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Should never call -init on DADConnection.  Use +sharedConnection... instead."), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[DADConnection _tearDownInFlightObjects](self, "_tearDownInFlightObjects");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DADConnection;
  -[DADConnection dealloc](&v4, sel_dealloc);
}

- (void)_resetCertWarningsForAccountId:(id)a3 andDataclasses:(int64_t)a4 isUserRequested:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  NSMutableSet *accountIdsWithAlreadyResetCerts;
  DADConnection *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  _xpc_connection_s *v16;
  id *v17;
  uint64_t v18;
  _QWORD v19[3];
  uint8_t buf[4];
  NSMutableSet *v21;
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  DALoggingwithCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    accountIdsWithAlreadyResetCerts = self->_accountIdsWithAlreadyResetCerts;
    *(_DWORD *)buf = 138543362;
    v21 = accountIdsWithAlreadyResetCerts;
    _os_log_impl(&dword_1B5244000, v9, OS_LOG_TYPE_DEBUG, "in _resetCertWarningsForAccount, _accountIdsWithAlreadyResetCerts is %{public}@", buf, 0xCu);
  }

  v11 = self;
  objc_sync_enter(v11);
  if (v8)
    v12 = -[NSMutableSet containsObject:](v11->_accountIdsWithAlreadyResetCerts, "containsObject:", v8) ^ 1;
  else
    v12 = 0;
  objc_sync_exit(v11);

  if (((v8 != 0) & (v12 | v5)) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4, CFSTR("kDAEMessageNameKey"), CFSTR("kDAEAccountIdKey"), CFSTR("kDAEDataclassesBitmaskKey"), CFSTR("kDAEResetCertWarnings"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[DADConnection _connection](v11, "_connection");
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v16, v15);

    v17 = v11;
    objc_sync_enter(v17);
    objc_msgSend(v17[4], "addObject:", v8);
    objc_sync_exit(v17);

  }
}

- (void)_resetThrottleTimersForAccountId:(id)a3
{
  id v5;
  NSObject *v6;
  const char *Name;
  NSMutableSet *accountIdsWithAlreadyResetThrottleTimers;
  DADConnection *v9;
  char v10;
  void *v11;
  void *v12;
  _xpc_connection_s *v13;
  DADConnection *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSMutableSet *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  DALoggingwithCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    Name = sel_getName(a2);
    accountIdsWithAlreadyResetThrottleTimers = self->_accountIdsWithAlreadyResetThrottleTimers;
    *(_DWORD *)buf = 136315394;
    v18 = Name;
    v19 = 2114;
    v20 = accountIdsWithAlreadyResetThrottleTimers;
    _os_log_impl(&dword_1B5244000, v6, OS_LOG_TYPE_DEBUG, "in %s, _accountIdsWithAlreadyResetThrottleTimers is %{public}@", buf, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  if (!v5)
  {
    objc_sync_exit(v9);
    v11 = v9;
    goto LABEL_7;
  }
  v10 = -[NSMutableSet containsObject:](v9->_accountIdsWithAlreadyResetThrottleTimers, "containsObject:", v5);
  objc_sync_exit(v9);

  if ((v10 & 1) == 0)
  {
    v15[0] = CFSTR("kDAEMessageNameKey");
    v15[1] = CFSTR("kDAEAccountIdKey");
    v16[0] = CFSTR("kDAEResetThrottleTimers");
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    -[DADConnection _connection](v9, "_connection");
    v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v13, v12);

    v14 = v9;
    objc_sync_enter(v14);
    -[NSMutableSet addObject:](v9->_accountIdsWithAlreadyResetThrottleTimers, "addObject:", v5);
    objc_sync_exit(v14);

LABEL_7:
  }

}

- (void)resetTimersAndWarnings
{
  NSObject *v3;
  DADConnection *v4;
  uint8_t v5[16];

  DALoggingwithCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B5244000, v3, OS_LOG_TYPE_DEBUG, "Resetting shouldResetCertWarnings and throttle timers", v5, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet removeAllObjects](v4->_accountIdsWithAlreadyResetCerts, "removeAllObjects");
  -[NSMutableSet removeAllObjects](v4->_accountIdsWithAlreadyResetThrottleTimers, "removeAllObjects");
  objc_sync_exit(v4);

}

- (void)_dispatchMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDAEMessageNameKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEFoldersUpdated")))
  {
    -[DADConnection _foldersUpdated:](self, "_foldersUpdated:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEPolicyKeyChanged")))
  {
    -[DADConnection _policyKeyChanged:](self, "_policyKeyChanged:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAELogDataAccessStatus")))
  {
    -[DADConnection _logDataAccessStatus:](self, "_logDataAccessStatus:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEServerContactsSearchQueryFinished")))
  {
    -[DADConnection _serverContactsSearchQueryFinished:](self, "_serverContactsSearchQueryFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEFolderChangeFinished")))
  {
    -[DADConnection _folderChangeFinished:](self, "_folderChangeFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEGetStatusReportsFromClient")))
  {
    -[DADConnection _getStatusReportsFromClient:](self, "_getStatusReportsFromClient:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEAttachmentDownloadProgress")))
  {
    -[DADConnection _downloadProgress:](self, "_downloadProgress:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEAttachmentDownloadFinished")))
  {
    -[DADConnection _downloadFinished:](self, "_downloadFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarShareResponseFinished")))
  {
    -[DADConnection _shareResponseFinished:](self, "_shareResponseFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEOfficeHoursRequestFinished")))
  {
    -[DADConnection _officeHoursRequestFinished:](self, "_officeHoursRequestFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEOofSettingsFinished")))
  {
    -[DADConnection _oofSettingsRequestsFinished:](self, "_oofSettingsRequestsFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarAvailabilityRequestReturnedResults")))
  {
    -[DADConnection _calendarAvailabilityRequestReturnedResults:](self, "_calendarAvailabilityRequestReturnedResults:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarAvailabilityRequestFinished")))
  {
    -[DADConnection _calendarAvailabilityRequestFinished:](self, "_calendarAvailabilityRequestFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEGrantedDelegatesListRequestFinished")))
  {
    -[DADConnection _grantedDelegatesListRequestFinished:](self, "_grantedDelegatesListRequestFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEUpdateGrantedDelegatePermissionRequestFinished")))
  {
    -[DADConnection _updateGrantedDelegatePermissionRequestFinished:](self, "_updateGrantedDelegatePermissionRequestFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarDirectorySearchReturnedResults")))
  {
    -[DADConnection _calendarDirectorySearchReturnedResults:](self, "_calendarDirectorySearchReturnedResults:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECalendarDirectorySearchFinished")))
  {
    -[DADConnection _calendarDirectorySearchFinished:](self, "_calendarDirectorySearchFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEGroupExpansionFinished")))
  {
    -[DADConnection _groupExpansionFinished:](self, "_groupExpansionFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEDownloadSubscribedCalendarProgress")))
  {
    -[DADConnection _downloadSubscribedCalendarProgress:](self, "_downloadSubscribedCalendarProgress:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEDownloadSubscribedCalendarFinished")))
  {
    -[DADConnection _downloadSubscribedCalendarFinished:](self, "_downloadSubscribedCalendarFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEDownloadSubscribedCalendarPasswordRequired")))
  {
    -[DADConnection _downloadSubscribedCalendarRequiresPassword:](self, "_downloadSubscribedCalendarRequiresPassword:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAECheckSubscribedCalendarIsJunkFinished")))
  {
    -[DADConnection _subscriptionCalendarJunkCheckFinished:](self, "_subscriptionCalendarJunkCheckFinished:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEFetchHolidayCalendarsReturnedResults")))
  {
    -[DADConnection _holidayCalendarFetchReturnedResults:](self, "_holidayCalendarFetchReturnedResults:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("kDAEFetchHolidayCalendarsFinished")))
  {
    -[DADConnection _holidayCalendarFetchFinished:](self, "_holidayCalendarFetchFinished:", v4);
  }
  else
  {
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1B5244000, v7, OS_LOG_TYPE_ERROR, "unknown request sent to connection.", (uint8_t *)&v9, 2u);
    }

    DALoggingwithCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_ERROR, "request: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)beginCalDAVServerSimulationWithHostname:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _xpc_connection_s *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("kDAEMessageNameKey");
  v9[1] = CFSTR("kDAEServerSimulatorHostnameKey");
  v10[0] = CFSTR("kDAEManageCalDAVServerSimulator");
  v10[1] = a3;
  v9[2] = CFSTR("kDAEServerSimulatorActionKey");
  v10[2] = CFSTR("kDAEServerSimulatorActionBegin");
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[DADConnection _connection](self, "_connection");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v8, v7);

}

- (void)endCalDAVServerSimulationWithHostname:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _xpc_connection_s *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("kDAEMessageNameKey");
  v9[1] = CFSTR("kDAEServerSimulatorHostnameKey");
  v10[0] = CFSTR("kDAEManageCalDAVServerSimulator");
  v10[1] = a3;
  v9[2] = CFSTR("kDAEServerSimulatorActionKey");
  v10[2] = CFSTR("kDAEServerSimulatorActionEnd");
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  -[DADConnection _connection](self, "_connection");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v8, v7);

}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightHolidayCalendarFetches, 0);
  objc_storeStrong((id *)&self->_inFlightSubscribedCalendarJunkChecks, 0);
  objc_storeStrong((id *)&self->_inFlightSubscribedCalendarDownloads, 0);
  objc_storeStrong((id *)&self->_inFlightUpdateGrantedDelegatePermissionRequests, 0);
  objc_storeStrong((id *)&self->_inFlightGrantedDelegatesListRequests, 0);
  objc_storeStrong((id *)&self->_inFlightOfficeHoursRequests, 0);
  objc_storeStrong((id *)&self->_inFlightOofSettingsRequests, 0);
  objc_storeStrong((id *)&self->_inFlightShareRequests, 0);
  objc_storeStrong((id *)&self->_inFlightGroupExpansions, 0);
  objc_storeStrong((id *)&self->_inFlightCalendarDirectorySearches, 0);
  objc_storeStrong((id *)&self->_inFlightCalendarAvailabilityRequests, 0);
  objc_storeStrong((id *)&self->_inFlightAttachmentDownloads, 0);
  objc_storeStrong((id *)&self->_inFlightFolderChanges, 0);
  objc_storeStrong((id *)&self->_inFlightSearchQueries, 0);
  objc_storeStrong(&self->_statusReportBlock, 0);
  objc_storeStrong((id *)&self->_accountIdsWithAlreadyResetThrottleTimers, 0);
  objc_storeStrong((id *)&self->_accountIdsWithAlreadyResetCerts, 0);
  objc_storeStrong((id *)&self->_muckingWithInFlightCollections, 0);
  objc_storeStrong((id *)&self->_muckingWithConn, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end
