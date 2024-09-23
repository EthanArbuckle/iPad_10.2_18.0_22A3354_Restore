@implementation PFCloudKitSetupAssistant

- (PFCloudKitSetupAssistant)initWithSetupRequest:(id)a3 mirroringOptions:(id)a4 observedStore:(id)a5
{
  PFCloudKitSetupAssistant *v8;
  NSCloudKitMirroringDelegateOptions *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PFCloudKitSetupAssistant;
  v8 = -[PFCloudKitSetupAssistant init](&v11, sel_init);
  if (v8)
  {
    v8->_setupRequest = (NSCloudKitMirroringDelegateSetupRequest *)a3;
    v8->_cloudKitSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v9 = (NSCloudKitMirroringDelegateOptions *)a4;
    v8->_mirroringOptions = v9;
    if (v9)
      v9 = (NSCloudKitMirroringDelegateOptions *)v9->_storeMonitorProvider;
    v8->_storeMonitor = (PFCloudKitStoreMonitor *)-[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:](v9, (uint64_t)a5);
  }
  return v8;
}

- (void)dealloc
{
  NSObject *cloudKitSemaphore;
  objc_super v4;

  self->_container = 0;
  self->_database = 0;

  self->_databaseSubscription = 0;
  self->_largeBlobDirectoryURL = 0;

  self->_currentUserRecordID = 0;
  cloudKitSemaphore = self->_cloudKitSemaphore;
  if (cloudKitSemaphore)
    dispatch_release(cloudKitSemaphore);
  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitSetupAssistant;
  -[PFCloudKitSetupAssistant dealloc](&v4, sel_dealloc);
}

- (uint64_t)_initializeCloudKitForObservedStore:(_BYTE *)a3 andNoteMetadataInitialization:
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  uint64_t v10;
  __CFString *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void (*v15)(uint64_t);
  NSObject *v16;
  char v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  int v51;
  _QWORD *v52;
  NSObject *v53;
  _QWORD *v54;
  void *v55;
  void (*v56)(uint64_t);
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __CFString *v68;
  int v69;
  void (*v70)(uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  void (*v74)(uint64_t);
  uint64_t v75;
  NSObject *v76;
  void *v77;
  _QWORD *v78;
  void *v79;
  __CFString *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  uint64_t *v97;
  uint64_t *v98;
  void (*v99)(uint64_t);
  NSObject *v100;
  void *v101;
  _QWORD *v102;
  void *v103;
  __CFString *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  int v140;
  uint64_t *v141;
  int v142;
  uint64_t v143;
  _BOOL4 v144;
  void *v145;
  _QWORD *v146;
  _QWORD *v147;
  _BYTE *v148;
  id v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  NSObject *v158;
  uint64_t v159;
  __CFString **v160;
  id v161;
  void *v162;
  uint64_t v163;
  NSObject *v164;
  id v165;
  void *v166;
  void (*v167)(uint64_t);
  __CFString *v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  void (*v173)(uint64_t);
  NSObject *v174;
  uint64_t v175;
  __CFString *v176;
  void *v177;
  int v178;
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  NSObject *v188;
  void (*v189)(uint64_t);
  __CFString *v190;
  id v191;
  void *v192;
  void (*v193)(uint64_t);
  __CFString *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  NSObject *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  NSObject *v210;
  char v211;
  void *v212;
  void *v213;
  void *v214;
  __CFString *v215;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void (*v230)(uint64_t, uint64_t);
  void (*v231)(uint64_t);
  _BYTE *v232;
  _BYTE *v233;
  uint64_t *v234;
  _BYTE *v235;
  uint64_t v236;
  _BYTE v237[24];
  char v238;
  _BYTE v239[24];
  void (*v240)(uint64_t, uint64_t);
  void (*v241)(uint64_t);
  uint64_t v242;
  _BYTE v243[12];
  __int16 v244;
  int v245;
  uint8_t v246[8];
  uint64_t v247;
  uint64_t v248;
  void (*v249)(uint64_t, uint64_t);
  void (*v250)(uint64_t);
  uint64_t *v251;
  uint64_t *v252;
  _BYTE *v253;
  uint64_t v254;
  uint64_t v255;
  void (*v256)(uint64_t);
  __CFString *v257;
  uint64_t v258;
  _BYTE v259[24];
  void *v260;
  _QWORD *v261;
  uint64_t *v262;
  uint64_t *v263;
  uint8_t *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t *v269;
  uint64_t v270;
  char v271;
  _BYTE v272[24];
  uint64_t v273;
  _BYTE buf[24];
  void (*v275)(uint64_t, uint64_t);
  void (*v276)(uint64_t);
  uint64_t v277;
  _BYTE v278[24];
  char v279;
  uint64_t v280;

  v280 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v4 = result;
  v5 = *(_QWORD *)(result + 8);
  if (v5)
    v6 = *(_BYTE *)(v5 + 12) != 0;
  else
    v6 = 0;
  v227 = 0;
  v228 = (uint64_t)&v227;
  v229 = 0x2020000000;
  LOBYTE(v230) = 1;
  *(_QWORD *)v246 = 0;
  v247 = (uint64_t)v246;
  v248 = 0x3052000000;
  v249 = __Block_byref_object_copy__26;
  v250 = __Block_byref_object_dispose__26;
  v251 = 0;
  -[PFCloudKitSetupAssistant beginActivityForPhase:](result, 1);
  v7 = *(_QWORD *)(v4 + 56);
  *(_QWORD *)v259 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v259[8] = 3221225472;
  *(_QWORD *)&v259[16] = __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke;
  v260 = &unk_1E1EDD7B8;
  v261 = (_QWORD *)v7;
  v262 = (uint64_t *)v4;
  v263 = &v227;
  v264 = v246;
  -[PFCloudKitStoreMonitor performBlock:](v7, (uint64_t)v259);
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v4, 1, *(_QWORD *)(v247 + 40));
  if (*(_BYTE *)(v228 + 24))
    goto LABEL_5;
  v8 = (__CFString *)*(id *)(v247 + 40);
  if (!v8)
  {
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v27 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 187;
      _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
LABEL_5:
    v8 = 0;
  }

  *(_QWORD *)(v247 + 40) = 0;
  v9 = *(unsigned __int8 *)(v228 + 24);
  _Block_object_dispose(v246, 8);
  _Block_object_dispose(&v227, 8);
  if (!v9)
  {
LABEL_70:
    v11 = v8;
    goto LABEL_71;
  }
  *a3 = 1;
  if (v6)
    goto LABEL_9;
  *(_QWORD *)v239 = 0;
  *(_QWORD *)&v239[8] = v239;
  *(_QWORD *)&v239[16] = 0x2020000000;
  LOBYTE(v240) = 1;
  v227 = 0;
  v228 = (uint64_t)&v227;
  v229 = 0x3052000000;
  v230 = __Block_byref_object_copy__26;
  v231 = __Block_byref_object_dispose__26;
  v232 = 0;
  v12 = *(_QWORD **)(v4 + 8);
  if (v12)
    v13 = (void *)v12[10];
  else
    v13 = 0;
  v14 = (id)objc_msgSend(v13, "containerWithIdentifier:options:", objc_msgSend(v12, "containerIdentifier"), objc_msgSend(*(id *)(v4 + 8), "containerOptions"));
  -[PFCloudKitSetupAssistant beginActivityForPhase:](v4, 2);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v275 = __Block_byref_object_copy__26;
  v276 = __Block_byref_object_dispose__26;
  v277 = 0;
  v15 = (void (*)(uint64_t))*(id *)(v4 + 56);
  *(_QWORD *)v246 = MEMORY[0x1E0C809B0];
  v247 = 3221225472;
  v248 = (uint64_t)__48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke;
  v249 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFAB0;
  v250 = v15;
  v251 = &v227;
  v252 = (uint64_t *)buf;
  v253 = v239;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v15, (uint64_t)v246);
  if (*(_BYTE *)(*(_QWORD *)&v239[8] + 24))
  {
    if (v14)
    {
      v16 = *(NSObject **)(v4 + 48);
      v17 = objc_msgSend(*(id *)(v4 + 8), "useDeviceToDeviceEncryption");
      v18 = *(_QWORD **)(v4 + 56);
      if (v18)
        v18 = (_QWORD *)v18[6];
      v19 = v18;
      *(_QWORD *)v259 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v259[8] = 3221225472;
      *(_QWORD *)&v259[16] = __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_31;
      v260 = &unk_1E1EDFB00;
      LOBYTE(v267) = v17;
      v265 = (uint64_t)buf;
      v266 = (uint64_t)&v227;
      v261 = v19;
      v262 = (uint64_t *)v4;
      v263 = (uint64_t *)v16;
      v264 = v239;
      objc_msgSend(v14, "accountInfoWithCompletionHandler:", v259);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)&v239[8] + 24) = 0;
      v29 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v272 = *MEMORY[0x1E0CB2D68];
      v30 = (void *)MEMORY[0x1E0CB3940];
      v225 = objc_msgSend(*(id *)(v4 + 8), "containerIdentifier");
      *(_QWORD *)v259 = objc_msgSend(v30, "stringWithFormat:", CFSTR("Failed to get a container back for the identifier: %@"));
      v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v259, v272, 1);
      v32 = (id)objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134400, v31);
      *(_QWORD *)(v228 + 40) = v32;
    }
  }
  *(_QWORD *)(v4 + 16) = v14;
  if (*(_BYTE *)(*(_QWORD *)&v239[8] + 24))
  {
    v33 = objc_msgSend(*(id *)(v4 + 8), "databaseScope");
    switch(v33)
    {
      case 3:
        v34 = (id)objc_msgSend(*(id *)(v4 + 16), "sharedCloudDatabase");
        break;
      case 2:
        v34 = (id)objc_msgSend(*(id *)(v4 + 16), "privateCloudDatabase");
        break;
      case 1:
        v34 = (id)objc_msgSend(*(id *)(v4 + 16), "publicCloudDatabase");
        break;
      default:
        *(_BYTE *)(*(_QWORD *)&v239[8] + 24) = 0;
        v43 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)v237 = *MEMORY[0x1E0CB2D68];
        v44 = (void *)MEMORY[0x1E0CB3940];
        v225 = softLinkCKDatabaseScopeString(objc_msgSend(*(id *)(v4 + 8), "databaseScope"));
        v268 = objc_msgSend(v44, "stringWithFormat:", CFSTR("CloudKit integration does not support the '%@' database scope."));
        v45 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v268, v237, 1);
        v46 = (id)objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134400, v45);
        *(_QWORD *)(v228 + 40) = v46;
        goto LABEL_36;
    }
    *(_QWORD *)(v4 + 24) = v34;
LABEL_36:
    if (*(_BYTE *)(*(_QWORD *)&v239[8] + 24) && !*(_QWORD *)(v4 + 24))
    {
      *(_BYTE *)(*(_QWORD *)&v239[8] + 24) = 0;
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v258 = *MEMORY[0x1E0CB2D68];
      v48 = (void *)MEMORY[0x1E0CB3940];
      v225 = softLinkCKDatabaseScopeString(objc_msgSend(*(id *)(v4 + 8), "databaseScope"));
      *(_QWORD *)v243 = objc_msgSend(v48, "stringWithFormat:", CFSTR("Failed to get a database back for scope '%@' from container: %@"));
      v49 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v243, &v258, 1);
      v50 = (id)objc_msgSend(v47, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134400, v49);
      *(_QWORD *)(v228 + 40) = v50;
    }
  }
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v4, 2, *(_QWORD *)(v228 + 40));
  if (*(_BYTE *)(*(_QWORD *)&v239[8] + 24))
  {
LABEL_40:
    v11 = v8;
    goto LABEL_42;
  }
  v11 = (__CFString *)*(id *)(v228 + 40);
  if (!v11)
  {
    v89 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v89, v90, v91, v92, v93, v94, v95, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v96 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v278 = 136315394;
      *(_QWORD *)&v278[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
      *(_WORD *)&v278[12] = 1024;
      *(_DWORD *)&v278[14] = 479;
      _os_log_fault_impl(&dword_18A253000, v96, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v278, 0x12u);
    }
    goto LABEL_40;
  }
LABEL_42:

  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
  *(_QWORD *)(v228 + 40) = 0;
  v51 = *(unsigned __int8 *)(*(_QWORD *)&v239[8] + 24);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v227, 8);
  _Block_object_dispose(v239, 8);
  if (!v51)
    goto LABEL_71;
  *(_QWORD *)v278 = 0;
  *(_QWORD *)&v278[8] = v278;
  *(_QWORD *)&v278[16] = 0x2020000000;
  v279 = 0;
  -[PFCloudKitSetupAssistant beginActivityForPhase:](v4, 3);
  v227 = 0;
  v228 = (uint64_t)&v227;
  v229 = 0x3052000000;
  v230 = __Block_byref_object_copy__26;
  v231 = __Block_byref_object_dispose__26;
  v232 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v275 = __Block_byref_object_copy__26;
  v276 = __Block_byref_object_dispose__26;
  v277 = 0;
  v52 = *(_QWORD **)(v4 + 56);
  if (v52)
    v52 = (_QWORD *)v52[6];
  v53 = *(NSObject **)(v4 + 48);
  v54 = v52;
  v55 = *(void **)(v4 + 16);
  *(_QWORD *)v259 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v259[8] = 3221225472;
  *(_QWORD *)&v259[16] = __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke;
  v260 = &unk_1E1EDFD58;
  v263 = (uint64_t *)v278;
  v264 = (uint8_t *)&v227;
  v265 = (uint64_t)buf;
  v261 = v54;
  v262 = (uint64_t *)v53;
  objc_msgSend(v55, "fetchUserRecordIDWithCompletionHandler:", v259);
  dispatch_semaphore_wait(v53, 0xFFFFFFFFFFFFFFFFLL);
  v56 = (void (*)(uint64_t))*(id *)(v4 + 56);
  if (*(_BYTE *)(*(_QWORD *)&v278[8] + 24))
  {
    *(_QWORD *)(v4 + 80) = *(id *)(v228 + 40);
    *(_QWORD *)v246 = MEMORY[0x1E0C809B0];
    v247 = 3221225472;
    v248 = (uint64_t)__47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2;
    v249 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFDD0;
    v250 = v56;
    v251 = (uint64_t *)v4;
    v252 = &v227;
    v253 = v278;
    v254 = (uint64_t)buf;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v56, (uint64_t)v246);
    v57 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (!v57)
    {
      v8 = 0;
      goto LABEL_55;
    }
    goto LABEL_53;
  }
  v58 = (void *)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "domain");
  if (!objc_msgSend(v58, "isEqualToString:", getCloudKitCKErrorDomain[0]())
    || objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code") != 9)
  {
    v59 = (void *)MEMORY[0x18D76B4E4]();
    v60 = __ckLoggingOverride;
    v61 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Identity fetch failed with unknown error: %@"));
    _NSCoreDataLog(v60 != 0, v61, v62, v63, v64, v65, v66, v67, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]");
    objc_autoreleasePoolPop(v59);
    v57 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (!v57)
    {
      v113 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Identity fetch failed but did not set an error.");
      _NSCoreDataLog(17, v113, v114, v115, v116, v117, v118, v119, v225);
      v120 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v246 = 0;
        _os_log_fault_impl(&dword_18A253000, v120, OS_LOG_TYPE_FAULT, "CoreData: Identity fetch failed but did not set an error.", v246, 2u);
      }
      v121 = (void *)MEMORY[0x1E0CB35C8];
      v122 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v122)
      {
        *(_QWORD *)v272 = *MEMORY[0x1E0CB3388];
        *(_QWORD *)v246 = v122;
        v123 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v246, v272, 1);
      }
      else
      {
        v123 = 0;
      }
      v68 = (__CFString *)objc_msgSend(v121, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134400, v123);
      goto LABEL_54;
    }
LABEL_53:
    v68 = v57;
LABEL_54:
    v8 = v68;
    goto LABEL_55;
  }
  *(_QWORD *)v239 = 0;
  *(_QWORD *)&v239[8] = v239;
  *(_QWORD *)&v239[16] = 0x3052000000;
  v240 = __Block_byref_object_copy__26;
  v241 = __Block_byref_object_dispose__26;
  v242 = 0;
  *(_QWORD *)v246 = MEMORY[0x1E0C809B0];
  v247 = 3221225472;
  v248 = (uint64_t)__47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_116;
  v249 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFDD0;
  v252 = (uint64_t *)v278;
  v253 = v239;
  v250 = v56;
  v251 = (uint64_t *)v4;
  v254 = (uint64_t)buf;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v56, (uint64_t)v246);
  if (*(_BYTE *)(*(_QWORD *)&v278[8] + 24))
    v8 = 0;
  else
    v8 = (__CFString *)*(id *)(*(_QWORD *)&v239[8] + 40);

  *(_QWORD *)(*(_QWORD *)&v239[8] + 40) = 0;
  _Block_object_dispose(v239, 8);
LABEL_55:
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v4, 3, (uint64_t)v8);
  if (*(_BYTE *)(*(_QWORD *)&v278[8] + 24))
  {
LABEL_56:
    v8 = v11;
    goto LABEL_58;
  }
  if (!v8)
  {
    v105 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v105, v106, v107, v108, v109, v110, v111, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v112 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v239 = 136315394;
      *(_QWORD *)&v239[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
      *(_WORD *)&v239[12] = 1024;
      *(_DWORD *)&v239[14] = 1630;
      _os_log_fault_impl(&dword_18A253000, v112, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v239, 0x12u);
    }
    goto LABEL_56;
  }
LABEL_58:

  *(_QWORD *)(v228 + 40) = 0;
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

  v69 = *(unsigned __int8 *)(*(_QWORD *)&v278[8] + 24);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v227, 8);
  _Block_object_dispose(v278, 8);
  if (!v69)
    goto LABEL_70;
  v268 = 0;
  v269 = &v268;
  v270 = 0x2020000000;
  v271 = 1;
  v257 = 0;
  *(_QWORD *)v239 = 0;
  *(_QWORD *)&v239[8] = v239;
  *(_QWORD *)&v239[16] = 0x3052000000;
  v240 = __Block_byref_object_copy__26;
  v241 = __Block_byref_object_dispose__26;
  v242 = 0;
  v70 = (void (*)(uint64_t))*(id *)(v4 + 56);
  *(_QWORD *)v237 = 0;
  *(_QWORD *)&v237[8] = v237;
  *(_QWORD *)&v237[16] = 0x2020000000;
  v238 = 0;
  v71 = objc_msgSend(*(id *)(v4 + 8), "databaseScope");
  -[PFCloudKitSetupAssistant beginActivityForPhase:](v4, 4);
  *(_QWORD *)v278 = 0;
  *(_QWORD *)&v278[8] = v278;
  *(_QWORD *)&v278[16] = 0x2020000000;
  v279 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v275 = __Block_byref_object_copy__26;
  v276 = __Block_byref_object_dispose__26;
  v277 = 0;
  v72 = objc_msgSend(*(id *)(v4 + 8), "databaseScope");
  if (v72 == 3)
  {
    v97 = (uint64_t *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v98 = (uint64_t *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v99 = (void (*)(uint64_t))*(id *)(v4 + 56);
    *(_QWORD *)v246 = MEMORY[0x1E0C809B0];
    v247 = 3221225472;
    v248 = (uint64_t)__71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_70;
    v249 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFB50;
    v254 = 3;
    v252 = (uint64_t *)buf;
    v253 = v278;
    v250 = v99;
    v251 = v98;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v99, (uint64_t)v246);

    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && objc_msgSend(v98, "count"))
    {
      v100 = dispatch_semaphore_create(0);
      v101 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKModifyRecordsOperationClass[0]()), "initWithRecordsToSave:recordIDsToDelete:", 0, objc_msgSend(v98, "allObjects"));
      objc_msgSend(v101, "setMarkAsParticipantNeedsNewInvitationToken:", 1);
      v227 = MEMORY[0x1E0C809B0];
      v228 = 3221225472;
      v229 = (uint64_t)__71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3_74;
      v230 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFBC8;
      v232 = v278;
      v233 = buf;
      v231 = (void (*)(uint64_t))v100;
      objc_msgSend(v101, "setModifyRecordsCompletionBlock:", &v227);
      objc_msgSend(*(id *)(v4 + 24), "addOperation:", v101);

      dispatch_semaphore_wait(v100, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v100);
    }
    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && objc_msgSend(v97, "count"))
    {
      v102 = *(id *)(v4 + 56);
      *(_QWORD *)v259 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v259[8] = 3221225472;
      *(_QWORD *)&v259[16] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4_77;
      v260 = &unk_1E1EDFB28;
      v261 = v102;
      v262 = v97;
      v265 = (uint64_t)v278;
      v266 = 3;
      v263 = (uint64_t *)v4;
      v264 = buf;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v102, (uint64_t)v259);

    }
    v103 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v103)
    {
      v104 = v103;
      if (v104)
      {
        v257 = v104;
      }
      else
      {
        v132 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v132, v133, v134, v135, v136, v137, v138, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
        v139 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v272 = 136315394;
          *(_QWORD *)&v272[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKi"
                                "tSetupAssistant.m";
          *(_WORD *)&v272[12] = 1024;
          *(_DWORD *)&v272[14] = 769;
          _os_log_fault_impl(&dword_18A253000, v139, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v272, 0x12u);
        }
      }
      goto LABEL_100;
    }
  }
  else if (v72 == 2)
  {
    v73 = (uint64_t *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v74 = (void (*)(uint64_t))*(id *)(v4 + 56);
    *(_QWORD *)v246 = MEMORY[0x1E0C809B0];
    v247 = 3221225472;
    v248 = (uint64_t)__71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke;
    v249 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFB50;
    v254 = 2;
    v252 = (uint64_t *)buf;
    v253 = v278;
    v250 = v74;
    v251 = v73;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v74, (uint64_t)v246);

    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && objc_msgSend(v73, "count"))
    {
      v75 = objc_msgSend(v73, "allObjects");
      v76 = dispatch_semaphore_create(0);
      v77 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKModifyRecordZonesOperationClass[0]()), "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v75);
      v227 = MEMORY[0x1E0C809B0];
      v228 = 3221225472;
      v229 = (uint64_t)__71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3;
      v230 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFB78;
      v233 = v278;
      v234 = (uint64_t *)buf;
      v231 = (void (*)(uint64_t))v75;
      v232 = v76;
      objc_msgSend(v77, "setModifyRecordZonesCompletionBlock:", &v227);
      objc_msgSend(*(id *)(v4 + 24), "addOperation:", v77);

      dispatch_semaphore_wait(v76, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v76);
    }
    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && objc_msgSend(v73, "count"))
    {
      v78 = *(id *)(v4 + 56);
      *(_QWORD *)v259 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v259[8] = 3221225472;
      *(_QWORD *)&v259[16] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4;
      v260 = &unk_1E1EDFB28;
      v261 = v78;
      v262 = v73;
      v265 = (uint64_t)v278;
      v266 = 2;
      v263 = (uint64_t *)v4;
      v264 = buf;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v78, (uint64_t)v259);

    }
    v79 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v79)
    {
      v80 = v79;
      if (v80)
      {
        v257 = v80;
      }
      else
      {
        v124 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v124, v125, v126, v127, v128, v129, v130, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
        v131 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v272 = 136315394;
          *(_QWORD *)&v272[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKi"
                                "tSetupAssistant.m";
          *(_WORD *)&v272[12] = 1024;
          *(_DWORD *)&v272[14] = 630;
          _os_log_fault_impl(&dword_18A253000, v131, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v272, 0x12u);
        }
      }
LABEL_100:

      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
    }
  }
  v140 = *(unsigned __int8 *)(*(_QWORD *)&v278[8] + 24);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v278, 8);
  v141 = v269;
  *((_BYTE *)v269 + 24) = v140;
  if (v140)
  {
    if ((unint64_t)(v71 - 1) > 1)
    {
      *(_BYTE *)(*(_QWORD *)&v237[8] + 24) = 1;
    }
    else
    {
      v227 = MEMORY[0x1E0C809B0];
      v228 = 3221225472;
      v229 = (uint64_t)__51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke;
      v230 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFC18;
      v231 = v70;
      v232 = (_BYTE *)v4;
      v233 = v237;
      v234 = &v268;
      v235 = v239;
      v236 = v71;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v70, (uint64_t)&v227);
      v141 = v269;
    }
  }
  if (*((_BYTE *)v141 + 24) && !*(_BYTE *)(*(_QWORD *)&v237[8] + 24))
  {
    *((_BYTE *)v141 + 24) = 0;
    if (v71 == 3)
    {
      *((_BYTE *)v141 + 24) = 1;
      goto LABEL_107;
    }
    if (v71 != 2)
    {
      v161 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", v71);
      v162 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneClass[0]()), "initWithZoneID:", v161);
      *(_QWORD *)v278 = 0;
      *(_QWORD *)&v278[8] = v278;
      *(_QWORD *)&v278[16] = 0x2020000000;
      v279 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3052000000;
      v275 = __Block_byref_object_copy__26;
      v276 = __Block_byref_object_dispose__26;
      v277 = 0;
      v163 = objc_msgSend(*(id *)(v4 + 8), "databaseScope");
      v164 = *(NSObject **)(v4 + 48);
      v165 = objc_alloc((Class)getCloudKitCKFetchRecordZonesOperationClass[0]());
      v258 = objc_msgSend(v162, "zoneID");
      v166 = (void *)objc_msgSend(v165, "initWithRecordZoneIDs:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v258, 1));
      -[NSCloudKitMirroringRequestOptions applyToOperation:](objc_msgSend(*(id *)(v4 + 72), "options"), v166);
      *(_QWORD *)v272 = 0;
      *(_QWORD *)&v272[8] = v272;
      *(_QWORD *)&v272[16] = 0x2020000000;
      v273 = 0;
      *(_QWORD *)v259 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v259[8] = 3221225472;
      *(_QWORD *)&v259[16] = __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke;
      v260 = &unk_1E1EDFC68;
      v263 = (uint64_t *)buf;
      v264 = v278;
      v265 = (uint64_t)v272;
      v266 = v163;
      v261 = v162;
      v262 = (uint64_t *)v164;
      objc_msgSend(v166, "setFetchRecordZonesCompletionBlock:", v259);
      objc_msgSend(*(id *)(v4 + 24), "addOperation:", v166);
      dispatch_semaphore_wait(v164, 0xFFFFFFFFFFFFFFFFLL);
      if (*(_BYTE *)(*(_QWORD *)&v278[8] + 24))
      {
        v167 = (void (*)(uint64_t))*(id *)(v4 + 56);
        *(_QWORD *)v246 = MEMORY[0x1E0C809B0];
        v247 = 3221225472;
        v248 = (uint64_t)__53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_87;
        v249 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFC18;
        v250 = v167;
        v251 = (uint64_t *)v162;
        v252 = (uint64_t *)v272;
        v253 = v278;
        v254 = (uint64_t)buf;
        v255 = v163;
        -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v167, (uint64_t)v246);

      }
      else if (v163 == 1 && objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code") == 9)
      {
        v179 = (void *)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "domain");
        if (objc_msgSend(v179, "isEqualToString:", getCloudKitCKErrorDomain[0]()))
        {
          v180 = (void *)objc_msgSend((id)objc_msgSend(v162, "zoneID"), "zoneName");
          if ((objc_msgSend(v180, "isEqualToString:", getCloudKitCKRecordZoneDefaultName[0]()) & 1) == 0)
          {
            v181 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Custom zones aren't supported yet with the public database.");
            _NSCoreDataLog(17, v181, v182, v183, v184, v185, v186, v187, v225);
            v188 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v246 = 0;
              _os_log_fault_impl(&dword_18A253000, v188, OS_LOG_TYPE_FAULT, "CoreData: Custom zones aren't supported yet with the public database.", v246, 2u);
            }
          }
          *(_BYTE *)(*(_QWORD *)&v278[8] + 24) = 1;

          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
          v189 = (void (*)(uint64_t))*(id *)(v4 + 56);
          *(_QWORD *)v246 = MEMORY[0x1E0C809B0];
          v247 = 3221225472;
          v248 = (uint64_t)__53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_89;
          v249 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFC90;
          v250 = v189;
          v251 = (uint64_t *)v162;
          v254 = 1;
          v252 = (uint64_t *)v278;
          v253 = buf;
          -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v189, (uint64_t)v246);

        }
      }

      if (!*(_BYTE *)(*(_QWORD *)&v278[8] + 24))
      {
        v190 = (__CFString *)*(id *)(*(_QWORD *)&buf[8] + 40);
        if (v190)
        {
          v257 = v190;
        }
        else
        {
          v203 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v203, v204, v205, v206, v207, v208, v209, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
          v210 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v243 = 136315394;
            *(_QWORD *)&v243[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloud"
                                  "KitSetupAssistant.m";
            v244 = 1024;
            v245 = 1169;
            _os_log_fault_impl(&dword_18A253000, v210, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v243, 0x12u);
          }
        }
      }

      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
      v211 = *(_BYTE *)(*(_QWORD *)&v278[8] + 24);
      _Block_object_dispose(v272, 8);
      _Block_object_dispose(buf, 8);
      _Block_object_dispose(v278, 8);
      *((_BYTE *)v269 + 24) = v211;

      goto LABEL_107;
    }
    v149 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", 2);
    v150 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneClass[0]()), "initWithZoneID:", v149);
    if (-[PFCloudKitSetupAssistant _saveZone:error:](v4, (uint64_t)v150, &v257))
    {
      *((_BYTE *)v269 + 24) = 1;
LABEL_185:

      goto LABEL_107;
    }
    v176 = v257;
    v177 = (void *)-[__CFString domain](v257, "domain");
    if (objc_msgSend(v177, "isEqualToString:", getCloudKitCKErrorDomain[0]()))
    {
      if (-[__CFString code](v176, "code") == 112)
        goto LABEL_149;
      if (-[__CFString code](v176, "code") == 2)
      {
        v212 = (void *)-[__CFString userInfo](v176, "userInfo");
        v213 = (void *)objc_msgSend((id)objc_msgSend(v212, "objectForKey:", getCloudKitCKPartialErrorsByItemIDKey[0]()), "objectForKey:", objc_msgSend(v150, "zoneID"));
        v214 = (void *)objc_msgSend(v213, "domain");
        if (objc_msgSend(v214, "isEqualToString:", getCloudKitCKErrorDomain[0]()))
        {
          if (objc_msgSend(v213, "code") == 112)
          {
LABEL_149:
            *(_QWORD *)v259 = 0;
            if ((-[PFCloudKitSetupAssistant _deleteZone:error:](v4, v150, v259) & 1) == 0)
            {
              v178 = *((unsigned __int8 *)v269 + 24);
              goto LABEL_181;
            }
LABEL_150:
            v178 = -[PFCloudKitSetupAssistant _saveZone:error:](v4, (uint64_t)v150, v259);
            *((_BYTE *)v269 + 24) = v178;
LABEL_181:
            if (v178)
            {
              v215 = 0;
            }
            else
            {
              v216 = (void *)MEMORY[0x18D76B4E4]();
              v217 = __ckLoggingOverride;
              v218 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@ unable to recover from error: %@\nEncountered subsequent error: %@"));
              _NSCoreDataLog(v217 != 0, v218, v219, v220, v221, v222, v223, v224, (uint64_t)"-[PFCloudKitSetupAssistant _createZoneIfNecessary:]");
              objc_autoreleasePoolPop(v216);
              v215 = *(__CFString **)v259;
            }
            v257 = v215;
            goto LABEL_185;
          }
          if (objc_msgSend(v213, "code") == 14)
          {
            *(_QWORD *)v259 = 0;
            goto LABEL_150;
          }
        }
      }
    }
    *((_BYTE *)v269 + 24) = 0;
    goto LABEL_185;
  }
LABEL_107:
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v4, 4, *(_QWORD *)(*(_QWORD *)&v239[8] + 40));
  if (*((_BYTE *)v269 + 24))
  {
LABEL_108:
    v11 = v8;
    goto LABEL_109;
  }
  v145 = *(void **)(*(_QWORD *)&v239[8] + 40);
  if (v145)
  {
    v11 = v145;
    v257 = v11;
    if (!v11)
    {
LABEL_123:
      v151 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v151, v152, v153, v154, v155, v156, v157, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      v158 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v259 = 136315394;
        *(_QWORD *)&v259[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        *(_WORD *)&v259[12] = 1024;
        *(_DWORD *)&v259[14] = 896;
        _os_log_fault_impl(&dword_18A253000, v158, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v259, 0x12u);
      }
      goto LABEL_108;
    }
  }
  else
  {
    v11 = v257;
    if (!v257)
      goto LABEL_123;
  }
LABEL_109:

  *(_QWORD *)(*(_QWORD *)&v239[8] + 40) = 0;
  v142 = *((unsigned __int8 *)v269 + 24);
  _Block_object_dispose(v237, 8);
  _Block_object_dispose(v239, 8);
  _Block_object_dispose(&v268, 8);
  if (!v142)
    goto LABEL_71;
  *(_QWORD *)v239 = 0;
  *(_QWORD *)&v239[8] = v239;
  *(_QWORD *)&v239[16] = 0x2020000000;
  LOBYTE(v240) = 1;
  *(_QWORD *)v278 = 0;
  *(_QWORD *)&v278[8] = v278;
  *(_QWORD *)&v278[16] = 0x2020000000;
  v279 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v275 = __Block_byref_object_copy__26;
  v276 = __Block_byref_object_dispose__26;
  v277 = 0;
  *(_QWORD *)v272 = 0;
  *(_QWORD *)&v272[8] = v272;
  *(_QWORD *)&v272[16] = 0x2020000000;
  LOBYTE(v273) = 0;
  v268 = 0;
  v269 = &v268;
  v270 = 0x2020000000;
  v271 = 0;
  v143 = objc_msgSend(*(id *)(v4 + 8), "databaseScope");
  if (v143 == 1)
  {
    v144 = 1;
    goto LABEL_167;
  }
  -[PFCloudKitSetupAssistant beginActivityForPhase:](v4, 5);
  v146 = *(id *)(v4 + 56);
  v147 = v146;
  if (v143 == 3)
  {
    *(_QWORD *)v259 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v259[8] = 3221225472;
    *(_QWORD *)&v259[16] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_3;
    v260 = &unk_1E1EDFD08;
    v265 = 3;
    v261 = v146;
    v262 = (uint64_t *)v272;
    v263 = (uint64_t *)v239;
    v264 = buf;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v146, (uint64_t)v259);
  }
  else if (v143 == 2)
  {
    v148 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", 2);
    *(_QWORD *)v259 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v259[8] = 3221225472;
    *(_QWORD *)&v259[16] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke;
    v260 = &unk_1E1EDFCE0;
    v261 = v147;
    v262 = (uint64_t *)v148;
    v267 = 2;
    v263 = &v268;
    v264 = v272;
    v265 = (uint64_t)v239;
    v266 = (uint64_t)buf;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v147, (uint64_t)v259);

  }
  if (*(_BYTE *)(*(_QWORD *)&v239[8] + 24))
  {
    v159 = objc_msgSend(*(id *)(v4 + 8), "databaseScope");
    switch(v159)
    {
      case 1:
        v160 = PFPublicDatabaseSubscriptionID;
        break;
      case 2:
        v160 = PFPrivateDatabaseSubscriptionID;
        break;
      case 3:
        v160 = PFSharedDatabaseSubscriptionID;
        break;
      default:
        *(_BYTE *)(*(_QWORD *)&v239[8] + 24) = 0;
        v169 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v258 = *MEMORY[0x1E0CB2D68];
        *(_QWORD *)v243 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CloudKit integration does not support the '%@' database scope."), softLinkCKDatabaseScopeString(objc_msgSend(*(id *)(v4 + 8), "databaseScope")));
        v170 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v243, &v258, 1);
        v171 = objc_msgSend(v169, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134400, v170);
        v168 = 0;
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v171;
LABEL_142:
        if (*(_BYTE *)(*(_QWORD *)&v239[8] + 24))
        {
          *(_QWORD *)(v4 + 32) = objc_msgSend(objc_alloc((Class)getCloudKitCKDatabaseSubscriptionClass[0]()), "initWithSubscriptionID:", v168);
          v172 = objc_alloc_init((Class)getCloudKitCKNotificationInfoClass[0]());
          objc_msgSend(v172, "setShouldSendContentAvailable:", 1);
          objc_msgSend(*(id *)(v4 + 32), "setNotificationInfo:", v172);

          if (*(_BYTE *)(*(_QWORD *)&v272[8] + 24))
          {
            *(_BYTE *)(*(_QWORD *)&v239[8] + 24) = 1;
          }
          else
          {
            *(_BYTE *)(*(_QWORD *)&v239[8] + 24) = 0;
            v173 = (void (*)(uint64_t))*(id *)(v4 + 32);
            v174 = *(NSObject **)(v4 + 48);
            if (*((_BYTE *)v269 + 24))
            {
              v257 = CFSTR("com.apple.coredata.cloudkit.zone.subscription");
              v175 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v257, 1);
            }
            else
            {
              v175 = 0;
            }
            v191 = objc_alloc((Class)getCloudKitCKModifySubscriptionsOperationClass[0]());
            v256 = v173;
            v192 = (void *)objc_msgSend(v191, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v256, 1), v175);
            -[NSCloudKitMirroringRequestOptions applyToOperation:](objc_msgSend(*(id *)(v4 + 72), "options"), v192);
            *(_QWORD *)v246 = MEMORY[0x1E0C809B0];
            v247 = 3221225472;
            v248 = (uint64_t)__66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_5;
            v249 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFD30;
            v252 = (uint64_t *)v239;
            v253 = buf;
            v254 = (uint64_t)v278;
            v250 = v173;
            v251 = (uint64_t *)v174;
            objc_msgSend(v192, "setModifySubscriptionsCompletionBlock:", v246);
            objc_msgSend(*(id *)(v4 + 24), "addOperation:", v192);
            dispatch_semaphore_wait(v174, 0xFFFFFFFFFFFFFFFFLL);
            v193 = (void (*)(uint64_t))*(id *)(v4 + 56);
            v227 = MEMORY[0x1E0C809B0];
            v228 = 3221225472;
            v229 = (uint64_t)__66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_102;
            v230 = (void (*)(uint64_t, uint64_t))&unk_1E1EDFD08;
            v231 = v193;
            v232 = v239;
            v233 = v278;
            v234 = (uint64_t *)buf;
            v235 = (_BYTE *)v143;
            -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v193, (uint64_t)&v227);

          }
        }
        goto LABEL_163;
    }
    v168 = *v160;
    goto LABEL_142;
  }
LABEL_163:
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v4, 5, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  if (!*(_BYTE *)(*(_QWORD *)&v239[8] + 24))
  {
    v194 = (__CFString *)*(id *)(*(_QWORD *)&buf[8] + 40);
    if (v194)
      goto LABEL_166;
    v195 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v195, v196, v197, v198, v199, v200, v201, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v202 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v237 = 136315394;
      *(_QWORD *)&v237[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
      *(_WORD *)&v237[12] = 1024;
      *(_DWORD *)&v237[14] = 1426;
      _os_log_fault_impl(&dword_18A253000, v202, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v237, 0x12u);
    }
  }
  v194 = v11;
LABEL_166:

  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
  v144 = *(_BYTE *)(*(_QWORD *)&v239[8] + 24) != 0;
  v11 = v194;
LABEL_167:
  _Block_object_dispose(&v268, 8);
  _Block_object_dispose(v272, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v278, 8);
  _Block_object_dispose(v239, 8);
  v8 = v11;
  if (v144)
  {
LABEL_9:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v275) = 1;
    *(_QWORD *)v246 = 0;
    v247 = (uint64_t)v246;
    v248 = 0x3052000000;
    v249 = __Block_byref_object_copy__26;
    v250 = __Block_byref_object_dispose__26;
    v251 = 0;
    v10 = *(_QWORD *)(v4 + 56);
    v227 = 0;
    v228 = (uint64_t)&v227;
    v229 = 0x3052000000;
    v230 = __Block_byref_object_copy__26;
    v231 = __Block_byref_object_dispose__26;
    v232 = 0;
    -[PFCloudKitSetupAssistant beginActivityForPhase:](v4, 6);
    *(_QWORD *)v259 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v259[8] = 3221225472;
    *(_QWORD *)&v259[16] = __60__PFCloudKitSetupAssistant__initializeAssetStorageURLError___block_invoke;
    v260 = &unk_1E1EDFAB0;
    v261 = (_QWORD *)v10;
    v262 = &v227;
    v263 = (uint64_t *)buf;
    v264 = v246;
    -[PFCloudKitStoreMonitor performBlock:](v10, (uint64_t)v259);
    -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v4, 6, *(_QWORD *)(v247 + 40));
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      *(_QWORD *)(v4 + 40) = *(id *)(v228 + 40);
    }
    else
    {
      v11 = (__CFString *)*(id *)(v247 + 40);
      if (v11)
      {
LABEL_22:

        *(_QWORD *)(v228 + 40) = 0;
        *(_QWORD *)(v247 + 40) = 0;
        v28 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
        _Block_object_dispose(&v227, 8);
        _Block_object_dispose(v246, 8);
        _Block_object_dispose(buf, 8);
        if (v28)
          return 1;
        goto LABEL_71;
      }
      v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v35, v36, v37, v38, v39, v40, v41, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      v42 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v239 = 136315394;
        *(_QWORD *)&v239[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        *(_WORD *)&v239[12] = 1024;
        *(_DWORD *)&v239[14] = 275;
        _os_log_fault_impl(&dword_18A253000, v42, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v239, 0x12u);
      }
    }
    v11 = v8;
    goto LABEL_22;
  }
LABEL_71:
  if (v11)
  {
    if (a2)
    {
      result = 0;
      *a2 = v11;
      return result;
    }
  }
  else
  {
    v81 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v81, v82, v83, v84, v85, v86, v87, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v88 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)v259 = 136315394;
    *(_QWORD *)&v259[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
    *(_WORD *)&v259[12] = 1024;
    *(_DWORD *)&v259[14] = 104;
    _os_log_fault_impl(&dword_18A253000, v88, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v259, 0x12u);
  }
  return 0;
}

- (void)beginActivityForPhase:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
    v4 = *(void **)(v3 + 72);
  else
    v4 = 0;
  v5 = (id)objc_msgSend(v4, "beginActivityForPhase:", a2);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "progressProvider"), "publishActivity:", v5);

}

- (void)endActivityForPhase:(uint64_t)a3 withError:
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 72);
  if (v4)
    v5 = *(void **)(v4 + 72);
  else
    v5 = 0;
  v6 = (id)objc_msgSend(v5, "endActivityForPhase:withError:", a2, a3);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "progressProvider"), "publishActivity:", v6);

}

void __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  NSManagedObjectContext *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[7];
  _QWORD v36[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (!v2)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v47 = *MEMORY[0x1E0CB2D68];
    v48 = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v12);
    goto LABEL_23;
  }
  v3 = a1[4];
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    v5 = a1[4];
  }
  else
  {
    v5 = 0;
    WeakRetained = 0;
  }
  v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v5);
  -[NSManagedObjectContext setTransactionAuthor:](v6, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
  v7 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke_2;
  v35[3] = &unk_1E1EDD790;
  v35[4] = v2;
  v35[5] = v6;
  v35[6] = a1[5];
  -[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v35);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = +[PFCloudKitMetadataModel checkAndRepairSchemaOfStore:withManagedObjectContext:error:]((uint64_t)PFCloudKitMetadataModel, v2, (uint64_t)v6, (_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v8 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v8 + 24))
    goto LABEL_17;
  if (!a1[5])
  {
LABEL_16:
    *(_BYTE *)(v8 + 24) = 0;
LABEL_17:
    v24 = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)(a1[7] + 8);
  v41 = 0;
  v42 = &v41;
  v43 = 0x3052000000;
  v44 = __Block_byref_object_copy__26;
  v45 = __Block_byref_object_dispose__26;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  v36[0] = v7;
  v36[1] = 3221225472;
  v36[2] = __96__PFCloudKitSetupAssistant__checkAndTruncateEventHistoryIfNeededWithManagedObjectContext_error___block_invoke;
  v36[3] = &unk_1E1EDDC88;
  v36[4] = v6;
  v36[5] = &v41;
  v36[6] = &v37;
  -[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v36);
  if (!*((_BYTE *)v38 + 24))
  {
    v10 = (id)v42[5];
    if (v10)
    {
      *(_QWORD *)(v9 + 40) = v10;
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        v51 = 1024;
        v52 = 1684;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v42[5] = 0;
  v21 = *((unsigned __int8 *)v38 + 24);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  if (!v21)
  {
    v8 = *(_QWORD *)(a1[6] + 8);
    goto LABEL_16;
  }
  v22 = (void *)+[NSCKEvent beginEventForRequest:withMonitor:error:]((uint64_t)NSCKEvent, *(_QWORD *)(a1[5] + 72), a1[4], (_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v23 = v22;
  if (v22)
  {
    *(_QWORD *)(a1[5] + 64) = v22;
    objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 8), "progressProvider"), "eventUpdated:", v23);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    v25 = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
  }

LABEL_20:
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v26 = (void *)MEMORY[0x18D76B4E4](v24);
    v27 = __ckLoggingOverride != 0;
    v28 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to initialize CloudKit metadata: %@"));
    _NSCoreDataLog(v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[PFCloudKitSetupAssistant _checkAndInitializeMetadata:]_block_invoke");
    objc_autoreleasePoolPop(v26);
  }

LABEL_23:
}

void __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke_2(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    v11 = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), &v11) & 1) == 0)
    {
      v2 = (void *)MEMORY[0x18D76B4E4]();
      v3 = __ckLoggingOverride != 0;
      v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Unable to set query generation on moc: %@"));
      _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitSetupAssistant _checkAndInitializeMetadata:]_block_invoke_2");
      objc_autoreleasePoolPop(v2);
    }
  }
}

void __60__PFCloudKitSetupAssistant__initializeAssetStorageURLError___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  __objc2_class_ro **p_info;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  id v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (v2)
  {
    v38 = 0;
    v3 = a1[4];
    if (v3)
      WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    else
      WeakRetained = 0;
    p_info = PFCloudKitSchemaGenerator.info;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = (id)+[PFCloudKitSerializer assetStorageDirectoryURLForStore:]((uint64_t)PFCloudKitSerializer, v2);
    if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = *MEMORY[0x1E0CB28A8];
      v41 = *MEMORY[0x1E0CB2D68];
      v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create largeBlobDirectoryURL with observed store: %@"), v2);
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 134403, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
LABEL_29:

      goto LABEL_30;
    }
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v37 = 0;
    if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "path"), &v37))
    {
      v7 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      if (v37)
      {
        v30 = WeakRetained;
        v31 = v2;
        v8 = (void *)objc_msgSend(v6, "subpathsAtPath:", objc_msgSend(v7, "path"));
        v36 = 0;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v33 != v11)
                objc_enumerationMutation(v8);
              v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
              if ((objc_msgSend(v6, "removeItemAtURL:error:", v13, &v36) & 1) == 0
                && unlink((const char *)objc_msgSend((id)objc_msgSend(v13, "path"), "fileSystemRepresentation")))
              {
                v14 = (void *)MEMORY[0x18D76B4E4]();
                v15 = __ckLoggingOverride != 0;
                v16 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to asset file (and unlink:%d) at url: %@\n%@"));
                __error();
                _NSCoreDataLog(v15, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[PFCloudKitSetupAssistant _initializeAssetStorageURLError:]_block_invoke");
                objc_autoreleasePoolPop(v14);
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
          }
          while (v10);
        }
        v23 = a1 + 6;
        WeakRetained = v30;
        v2 = v31;
        p_info = (__objc2_class_ro **)(PFCloudKitSchemaGenerator + 32);
        goto LABEL_24;
      }
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v6, "removeItemAtURL:error:", v7, &v38);
    }
    v23 = a1 + 6;
    if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      goto LABEL_27;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), 1, 0, &v38);
    if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      goto LABEL_27;
    v28 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    v43 = *MEMORY[0x1E0C999D8];
    v44 = MEMORY[0x1E0C9AAB0];
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v28, "setResourceValues:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1), &v38);
LABEL_24:
    if (*(_BYTE *)(*(_QWORD *)(*v23 + 8) + 24))
    {
      v29 = (void *)+[PFCloudKitSerializer oldAssetStorageDirectoryURLForStore:]((uint64_t)(p_info + 1), v2);
      if (objc_msgSend(v6, "fileExistsAtPath:", objc_msgSend(v29, "path")))
        *(_BYTE *)(*(_QWORD *)(*v23 + 8) + 24) = objc_msgSend(v6, "removeItemAtURL:error:", v29, &v38);
      goto LABEL_28;
    }
LABEL_27:
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = v38;
LABEL_28:

    goto LABEL_29;
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v25 = *MEMORY[0x1E0CB28A8];
  v39 = *MEMORY[0x1E0CB2D60];
  v40 = CFSTR("Failed to initialize the asset storage url because the store was removed from the coordinator.");
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
LABEL_30:

}

void __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[6];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_2;
    v6[3] = &unk_1E1EDFAD8;
    v6[4] = v2;
    v6[5] = v3;
    v7 = *(_OWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v6);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v5 = *MEMORY[0x1E0CB28A8];
    v9 = *MEMORY[0x1E0CB2D68];
    v10[0] = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }

}

id __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (result)
  {
    result = (id)objc_msgSend(result, "stringValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  return result;
}

intptr_t __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  int v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  char v49;
  id v50;
  uint64_t v51;
  void *v52;
  const __CFString **v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 3)
    v7 = 3;
  else
    v7 = __ckLoggingOverride;
  v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Fetched account info for store %@: %@\n%@"));
  _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[PFCloudKitSetupAssistant _checkAccountStatus:]_block_invoke");
  objc_autoreleasePoolPop(v6);
  if (!a2)
  {
    v25 = (void *)objc_msgSend(a3, "domain");
    if (objc_msgSend(v25, "isEqualToString:", getCloudKitCKErrorDomain[0]())
      && objc_msgSend(a3, "code") == 9)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v16, "setObject:forKey:", CFSTR("Unable to initialize without an iCloud account (CKErrorNotAuthenticated)."), *MEMORY[0x1E0CB2D68]);
      objc_msgSend(v16, "setObject:forKey:", a3, *MEMORY[0x1E0CB3388]);
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = *MEMORY[0x1E0CB28A8];
      v19 = 134400;
      goto LABEL_20;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v27 = a3;
    goto LABEL_22;
  }
  v15 = objc_msgSend(a2, "accountStatus");
  if (v15 != 1 || !objc_msgSend(a2, "hasValidCredentials"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = v20;
    if (a3)
      objc_msgSend(v20, "setObject:forKey:", a3, *MEMORY[0x1E0CB3388]);
    if (v15 == 3)
    {
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (v21)
      {
        objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("PFCloudKitOldUserIdentityKey"));
        objc_msgSend(v16, "setObject:forKey:", &unk_1E1F4B600, CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey"));
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v23 = *MEMORY[0x1E0CB28A8];
        v24 = 134405;
LABEL_38:
        v38 = (void *)objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, v16);
        goto LABEL_39;
      }
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "databaseScope") == 1)
      {
        v38 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_39:
        v26 = v38;
        goto LABEL_40;
      }
      objc_msgSend(a2, "hasValidCredentials");
      objc_opt_self();
      v47 = *MEMORY[0x1E0CB2D68];
      v29 = CFSTR("Unable to initialize without an iCloud account (CKAccountStatusNoAccount).");
    }
    else
    {
      v28 = objc_msgSend(a2, "hasValidCredentials");
      objc_opt_self();
      v29 = CFSTR("Unable to determine the status of the iCloud account (CKAccountStatusCouldNotDetermine).");
      switch(v15)
      {
        case 0:
          break;
        case 1:
          if (v28)
          {
            v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "failureReasonForAccountStatus was called with an available account and valid credentials.");
            _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, v55);
            v37 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: failureReasonForAccountStatus was called with an available account and valid credentials.", buf, 2u);
            }
          }
          v29 = CFSTR("Unable to initialize because even though there is an available account it does not have valid credentials. The user will need to enter their password in settings, or via a password prompt.");
          break;
        case 2:
          v29 = CFSTR("Unable to initialize without a valid iCloud account (CKAccountStatusRestricted).");
          break;
        case 4:
          v29 = CFSTR("Unable to initialize without a valid iCloud account (CKAccountStatusTemporarilyUnavailable).");
          break;
        default:
          v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Cannot generate a failure reason for an unknown account status: %ld");
          _NSCoreDataLog(17, v39, v40, v41, v42, v43, v44, v45, v15);
          v46 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v61 = v15;
            _os_log_fault_impl(&dword_18A253000, v46, OS_LOG_TYPE_FAULT, "CoreData: Cannot generate a failure reason for an unknown account status: %ld", buf, 0xCu);
          }
          v29 = CFSTR("Unknown account status");
          break;
      }
      v47 = *MEMORY[0x1E0CB2D68];
    }
    objc_msgSend(v16, "setObject:forKey:", v29, v47);
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB28A8];
    v24 = 134400;
    goto LABEL_38;
  }
  if (!*(_BYTE *)(a1 + 80)
    || (objc_msgSend(a2, "deviceToDeviceEncryptionAvailability") & 1) != 0
    && (objc_msgSend(a2, "deviceToDeviceEncryptionAvailability") & 2) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v16, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), CFSTR("PFCloudKitOldUserIdentityKey"));
    objc_msgSend(v16, "setObject:forKey:", &unk_1E1F4B600, CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey"));
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB28A8];
    v19 = 134405;
LABEL_20:
    v26 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, v19, v16);
LABEL_40:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v26;

    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  v49 = objc_msgSend(a2, "deviceToDeviceEncryptionAvailability");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v51 = *MEMORY[0x1E0CB28A8];
  if ((v49 & 1) != 0)
  {
    v58 = *MEMORY[0x1E0CB2D68];
    v59 = CFSTR("Unable to initialize the CloudKit container because this device does not support device to device encryption.");
    v52 = (void *)MEMORY[0x1E0C99D80];
    v53 = &v59;
    v54 = &v58;
  }
  else
  {
    v56 = *MEMORY[0x1E0CB2D68];
    v57 = CFSTR("Unable to initialize the CloudKit container because this account does not support device to device encryption.");
    v52 = (void *)MEMORY[0x1E0C99D80];
    v53 = &v57;
    v54 = &v56;
  }
  v27 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 134400, objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, 1));
LABEL_22:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v27;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[6];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2;
    v7[3] = &unk_1E1EDFB28;
    v7[4] = v2;
    v7[5] = v3;
    v4 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = v4;
    v8 = *(_OWORD *)(a1 + 40);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }

}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2(uint64_t a1)
{
  NSFetchRequest *v2;
  void *v3;
  id result;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  id v14[5];
  _BYTE v15[128];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14[0] = 0;
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
  v16[0] = *(_QWORD *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1));
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("database.databaseScopeNum = %@ AND %K == YES"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72)), CFSTR("needsRecoveryFromIdentityLoss")));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v2, v14);
  if (v14[0])
  {
    result = v14[0];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    v5 = v3;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    result = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    v6 = result;
    if (result)
    {
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          v9 = (void *)objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "ckRecordZoneName"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "ckOwnerName"));
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        result = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

intptr_t __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a4;
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v6 = __ckLoggingOverride != 0;
    v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Deleting zones %@ in response to Manatee identity loss failed, %@"));
    _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke_3");
    objc_autoreleasePoolPop(v5);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[7];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5;
    v7[3] = &unk_1E1EDFBA0;
    v7[4] = *(_QWORD *)(a1 + 40);
    v7[5] = v2;
    v7[6] = v3;
    v4 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = v4;
    v8 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("The mirroring delegate could not recovery from Manatee identity loss because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }

}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5(uint64_t a1)
{
  void *v2;
  id result;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSManagedObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = *(void **)(a1 + 32);
  result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  v4 = result;
  if (result)
  {
    v5 = *(_QWORD *)v29;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v6);
        v27 = 0;
        v8 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v7, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v27);
        v9 = v27;
        if (v27)
          goto LABEL_17;
        if (v8)
        {
          -[NSManagedObject setNeedsRecoveryFromIdentityLoss:](v8, "setNeedsRecoveryFromIdentityLoss:", 0);
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@");
          _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v27);
          v17 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = (uint64_t)v27;
            _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@", buf, 0xCu);
          }
        }
        if (objc_msgSend(*(id *)(a1 + 48), "hasChanges"))
        {
          if ((objc_msgSend(*(id *)(a1 + 48), "save:", &v27) & 1) == 0)
          {
            v18 = (void *)MEMORY[0x18D76B4E4]();
            v19 = __ckLoggingOverride;
            v20 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to save metadata while un-marking zones needing recovery from Manatee identity loss: %@"));
            _NSCoreDataLog(v19 != 0, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke");
            objc_autoreleasePoolPop(v18);
            v9 = v27;
            if (v27)
            {
LABEL_17:
              result = v9;
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
              return result;
            }
          }
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_70(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[6];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2_71;
    v7[3] = &unk_1E1EDFB28;
    v7[4] = v2;
    v7[5] = v3;
    v4 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = v4;
    v8 = *(_OWORD *)(a1 + 40);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }

}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2_71(uint64_t a1)
{
  NSFetchRequest *v2;
  void *v3;
  id result;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16[5];
  _BYTE v17[128];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v16[0] = 0;
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath](NSCKRecordZoneMetadata, "entityPath"));
  v18[0] = *(_QWORD *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1));
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("database.databaseScopeNum = %@ AND %K == YES"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72)), CFSTR("needsNewShareInvitation")));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v2, v16);
  if (v16[0])
  {
    result = v16[0];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    v5 = v3;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    result = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    v6 = result;
    if (result)
    {
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v9 = -[NSCKRecordZoneMetadata createRecordZoneID](*(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8));
          v10 = objc_alloc((Class)getCloudKitCKRecordIDClass[0]());
          v11 = (void *)objc_msgSend(v10, "initWithRecordName:zoneID:", getCloudKitCKRecordNameZoneWideShare(), v9);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        result = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

intptr_t __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3_74(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a4;
    v5 = (void *)MEMORY[0x18D76B4E4]();
    v6 = __ckLoggingOverride != 0;
    v7 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Deleting records in Shared database %@ in response to Manatee identity loss failed, %@"));
    _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke_3");
    objc_autoreleasePoolPop(v5);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4_77(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[7];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5_78;
    v7[3] = &unk_1E1EDFBA0;
    v7[4] = *(_QWORD *)(a1 + 40);
    v7[5] = v2;
    v7[6] = v3;
    v4 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = v4;
    v8 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("The mirroring delegate could not recovery from Manatee identity loss because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }

}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5_78(uint64_t a1)
{
  void *v2;
  id result;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSManagedObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = *(void **)(a1 + 32);
  result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  v4 = result;
  if (result)
  {
    v5 = *(_QWORD *)v29;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v6);
        v27 = 0;
        v8 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v7, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v27);
        v9 = v27;
        if (v27)
          goto LABEL_17;
        if (v8)
        {
          -[NSManagedObject setNeedsRecoveryFromIdentityLoss:](v8, "setNeedsRecoveryFromIdentityLoss:", 0);
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@");
          _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v27);
          v17 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = (uint64_t)v27;
            _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@", buf, 0xCu);
          }
        }
        if (objc_msgSend(*(id *)(a1 + 48), "hasChanges"))
        {
          if ((objc_msgSend(*(id *)(a1 + 48), "save:", &v27) & 1) == 0)
          {
            v18 = (void *)MEMORY[0x18D76B4E4]();
            v19 = __ckLoggingOverride;
            v20 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Failed to save metadata while un-marking zones needing recovery from Manatee identity loss: %@"));
            _NSCoreDataLog(v19 != 0, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke");
            objc_autoreleasePoolPop(v18);
            v9 = v27;
            if (v27)
            {
LABEL_17:
              result = v9;
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
              return result;
            }
          }
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

void __51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[7];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke_2;
    v7[3] = &unk_1E1EDFBF0;
    v7[4] = *(_QWORD *)(a1 + 40);
    v7[5] = v2;
    v7[6] = v3;
    v8 = *(_OWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }

}

void __51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSManagedObject *v5;
  id v6[6];

  v6[5] = *(id *)MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v2 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", *(_QWORD *)(a1 + 80));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 8);
  else
    v4 = 0;
  v5 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v2, objc_msgSend(v4, "databaseScope"), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v6);
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -[NSManagedObject hasRecordZone](v5, "hasRecordZone");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v6[0];
  }

}

- (uint64_t)_saveZone:(_QWORD *)a3 error:
{
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v23[10];
  _QWORD v24[9];
  _QWORD v25[4];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__26;
  v30 = __Block_byref_object_dispose__26;
  v31 = 0;
  v6 = *(NSObject **)(a1 + 48);
  v7 = objc_alloc((Class)getCloudKitCKModifyRecordZonesOperationClass[0]());
  v40[0] = a2;
  v8 = (void *)objc_msgSend(v7, "initWithRecordZonesToSave:recordZoneIDsToDelete:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1), 0);
  -[NSCloudKitMirroringRequestOptions applyToOperation:](objc_msgSend(*(id *)(a1 + 72), "options"), v8);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v9 = MEMORY[0x1E0C809B0];
  v25[3] = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke;
  v24[3] = &unk_1E1EDFD30;
  v24[6] = &v26;
  v24[7] = v25;
  v24[8] = &v32;
  v24[4] = a2;
  v24[5] = v6;
  objc_msgSend(v8, "setModifyRecordZonesCompletionBlock:", v24);
  objc_msgSend(*(id *)(a1 + 24), "addOperation:", v8);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  if (!*((_BYTE *)v33 + 24))
    goto LABEL_3;
  v10 = objc_msgSend(*(id *)(a1 + 8), "databaseScope");
  v11 = *(id *)(a1 + 56);
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_2;
  v23[3] = &unk_1E1EDFC18;
  v23[4] = v11;
  v23[5] = a2;
  v23[6] = v25;
  v23[7] = &v32;
  v23[8] = &v26;
  v23[9] = v10;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v11, (uint64_t)v23);

  if (!*((_BYTE *)v33 + 24))
  {
LABEL_3:
    v12 = (id)v27[5];
    if (v12)
    {
      if (a3)
        *a3 = v12;
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        v38 = 1024;
        v39 = 982;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v27[5] = 0;
  v21 = *((unsigned __int8 *)v33 + 24);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v21;
}

- (uint64_t)_deleteZone:(_QWORD *)a3 error:
{
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__26;
  v26 = __Block_byref_object_dispose__26;
  v27 = 0;
  v6 = *(NSObject **)(a1 + 48);
  v7 = objc_alloc((Class)getCloudKitCKModifyRecordZonesOperationClass[0]());
  v36[0] = objc_msgSend(a2, "zoneID");
  v8 = (void *)objc_msgSend(v7, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1));
  -[NSCloudKitMirroringRequestOptions applyToOperation:](objc_msgSend(*(id *)(a1 + 72), "options"), v8);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __46__PFCloudKitSetupAssistant__deleteZone_error___block_invoke;
  v21[3] = &unk_1E1EDFC40;
  v21[6] = &v28;
  v21[7] = &v22;
  v21[4] = a2;
  v21[5] = v6;
  objc_msgSend(v8, "setModifyRecordZonesCompletionBlock:", v21);
  objc_msgSend(*(id *)(a1 + 24), "addOperation:", v8);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  v9 = (id)v23[5];
  if (!*((_BYTE *)v29 + 24))
  {
    v12 = v23[5];
    if (v12)
    {
      if (a3)
        *a3 = v12;
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        v34 = 1024;
        v35 = 1015;
        _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  v10 = *((unsigned __int8 *)v29 + 24);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v10;
}

intptr_t __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a4;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(a2);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v10, "zoneID"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "zoneID")))
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "capabilities");
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          }
        }
        v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[7];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_3;
    v7[3] = &unk_1E1EDFBF0;
    v7[4] = *(_QWORD *)(a1 + 40);
    v7[5] = v2;
    v7[6] = v3;
    v8 = *(_OWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }

}

uint64_t __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_3(uint64_t a1)
{
  NSManagedObject *v2;
  NSManagedObject *v3;
  uint64_t result;
  id v5;

  v5 = 0;
  v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend(*(id *)(a1 + 32), "zoneID"), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v5);
  if (!v2
    || (v3 = v2,
        -[NSManagedObject setSupportsFetchChanges:](v2, "setSupportsFetchChanges:", *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) & 1), -[NSManagedObject setSupportsRecordSharing:](v3, "setSupportsRecordSharing:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >> 2) & 1), -[NSManagedObject setSupportsAtomicChanges:](v3, "setSupportsAtomicChanges:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >> 1) & 1), -[NSManagedObject setSupportsZoneSharing:](v3, "setSupportsZoneSharing:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >> 3) & 1), -[NSManagedObject setHasRecordZone:](v3, "setHasRecordZone:", 1), result = objc_msgSend(*(id *)(a1 + 48), "save:", &v5), (result & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    result = (uint64_t)v5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = result;
  }
  return result;
}

intptr_t __46__PFCloudKitSetupAssistant__deleteZone_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (objc_msgSend(a3, "containsObject:", objc_msgSend(*(id *)(a1 + 32), "zoneID")))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v20;
  uint8_t buf[8];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
LABEL_11:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v4;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  if (!a2)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Zone fetch didn't return an error or a dictionary of zones");
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v20);
    v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Zone fetch didn't return an error or a dictionary of zones", buf, 2u);
    }
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB28A8];
    v22 = *MEMORY[0x1E0CB2D68];
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not locate the desired zone in the database with scope '%@': %@"), softLinkCKDatabaseScopeString(*(_QWORD *)(a1 + 72)), objc_msgSend(*(id *)(a1 + 32), "zoneID"));
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v23;
    v18 = &v22;
    goto LABEL_10;
  }
  v5 = (void *)objc_msgSend(a2, "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "zoneID"));
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB28A8];
    v24 = *MEMORY[0x1E0CB2D68];
    v25[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not locate the desired zone in the database with scope '%@': %@"), softLinkCKDatabaseScopeString(*(_QWORD *)(a1 + 72)), objc_msgSend(*(id *)(a1 + 32), "zoneID"));
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = v25;
    v18 = &v24;
LABEL_10:
    v4 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 134400, objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1));
    goto LABEL_11;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v5, "capabilities");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_87(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[7];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2;
    v7[3] = &unk_1E1EDFBF0;
    v7[4] = *(_QWORD *)(a1 + 40);
    v7[5] = v2;
    v7[6] = v3;
    v8 = *(_OWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }

}

uint64_t __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2(uint64_t a1)
{
  NSManagedObject *v2;
  NSManagedObject *v3;
  uint64_t result;
  id v5;

  v5 = 0;
  v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend(*(id *)(a1 + 32), "zoneID"), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v5);
  if (!v2
    || (v3 = v2,
        -[NSManagedObject setSupportsFetchChanges:](v2, "setSupportsFetchChanges:", *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) & 1), -[NSManagedObject setSupportsRecordSharing:](v3, "setSupportsRecordSharing:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >> 2) & 1), -[NSManagedObject setSupportsAtomicChanges:](v3, "setSupportsAtomicChanges:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >> 1) & 1), -[NSManagedObject setHasRecordZone:](v3, "setHasRecordZone:", 1), result = objc_msgSend(*(id *)(a1 + 48), "save:", &v5), (result & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    result = (uint64_t)v5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = result;
  }
  return result;
}

void __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_89(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[7];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2_90;
    v6[3] = &unk_1E1EDF960;
    v8 = *(_QWORD *)(a1 + 64);
    v6[4] = *(_QWORD *)(a1 + 40);
    v6[5] = v2;
    v6[6] = v3;
    v7 = *(_OWORD *)(a1 + 48);
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v6);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v5 = *MEMORY[0x1E0CB28A8];
    v9 = *MEMORY[0x1E0CB2D68];
    v10[0] = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }

}

uint64_t __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2_90(uint64_t a1)
{
  NSManagedObject *v2;
  NSManagedObject *v3;
  uint64_t result;
  id v5;

  v5 = 0;
  v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)objc_msgSend(*(id *)(a1 + 32), "zoneID"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v5);
  if (!v2
    || (v3 = v2,
        -[NSManagedObject setSupportsFetchChanges:](v2, "setSupportsFetchChanges:", 0),
        -[NSManagedObject setSupportsRecordSharing:](v3, "setSupportsRecordSharing:", 0),
        -[NSManagedObject setSupportsAtomicChanges:](v3, "setSupportsAtomicChanges:", 1),
        -[NSManagedObject setHasRecordZone:](v3, "setHasRecordZone:", 1),
        result = objc_msgSend(*(id *)(a1 + 48), "save:", &v5),
        (result & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    result = (uint64_t)v5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  }
  return result;
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  __int128 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[7];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v8[1] = 3221225472;
    v4 = *(_OWORD *)(a1 + 64);
    v9 = *(_OWORD *)(a1 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[2] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2;
    v8[3] = &unk_1E1EDFCB8;
    v5 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 80);
    v8[4] = v5;
    v8[5] = v2;
    v8[6] = v3;
    v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v8);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = *MEMORY[0x1E0CB28A8];
    v12 = *MEMORY[0x1E0CB2D68];
    v13[0] = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
  }

}

uint64_t __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2(uint64_t a1)
{
  NSManagedObject *v2;
  NSManagedObject *v3;
  uint64_t result;
  id v5[6];

  v5[5] = *(id *)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(a1 + 32), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v5);
  v3 = v2;
  if (!v2
    || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -[NSManagedObject hasSubscription](v2, "hasSubscription"), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend((id)-[NSManagedObject database](v3, "database"), "hasSubscription"), result = objc_msgSend(*(id *)(a1 + 48), "save:", v5), (result & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    result = (uint64_t)v5[0];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = result;
  }
  return result;
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[6];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_4;
    v7[3] = &unk_1E1EDFC18;
    v7[4] = v2;
    v7[5] = v3;
    v8 = *(_OWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("The mirroring delegate could not initialize because it's store was removed from the coordinator.");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }

}

uint64_t __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_4(uint64_t a1)
{
  NSManagedObject *v2;
  uint64_t result;
  id v4[6];

  v4[5] = *(id *)MEMORY[0x1E0C80C00];
  v4[0] = 0;
  v2 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)v4);
  if (!v2
    || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[NSManagedObject hasSubscription](v2, "hasSubscription"), result = objc_msgSend(*(id *)(a1 + 40), "save:", v4), (result & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    result = (uint64_t)v4[0];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  }
  return result;
}

intptr_t __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v10)
        objc_enumerationMutation(a2);
      if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v11), "subscriptionID"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "subscriptionID")) & 1) != 0)break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = 1;
    if (a2)
      goto LABEL_13;
  }
  else
  {
LABEL_9:
    v12 = 0;
    if (a2)
      goto LABEL_13;
  }
  v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Saved subscriptions was unexpectedly nil.");
  _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, v44);
  v20 = __pflogFaultLog;
  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
LABEL_13:
    if (a4)
      goto LABEL_14;
LABEL_21:
    if ((v12 & 1) != 0)
      goto LABEL_22;
    v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v42 = *MEMORY[0x1E0CB28A8];
    v49 = *MEMORY[0x1E0CB2D68];
    v50 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Subscription save succeeded but did not return '%@' as a saved subscription"), objc_msgSend(*(id *)(a1 + 32), "subscriptionID"));
    v40 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 134400, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
LABEL_24:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v40;
    goto LABEL_25;
  }
  *(_WORD *)buf = 0;
  _os_log_fault_impl(&dword_18A253000, v20, OS_LOG_TYPE_FAULT, "CoreData: Saved subscriptions was unexpectedly nil.", buf, 2u);
  if (!a4)
    goto LABEL_21;
LABEL_14:
  if (v12)
  {
    v21 = (void *)MEMORY[0x18D76B4E4]();
    v22 = __ckLoggingOverride != 0;
    v23 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to save our subscription and had an operation error, %@"));
    _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitSetupAssistant _setupDatabaseSubscriptionIfNecessary:]_block_invoke");
    objc_autoreleasePoolPop(v21);
LABEL_22:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_25;
  }
  if (!objc_msgSend(a2, "count"))
  {
    v40 = a4;
    goto LABEL_24;
  }
  v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Saved some subscriptions (%lu) %@, but had an operation error, %@");
  v31 = objc_msgSend(a2, "count");
  _NSCoreDataLog(17, v30, v32, v33, v34, v35, v36, v37, v31);
  v38 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    v39 = objc_msgSend(a2, "count");
    *(_DWORD *)buf = 134218498;
    v52 = v39;
    v53 = 2112;
    v54 = a2;
    v55 = 2112;
    v56 = a4;
    _os_log_fault_impl(&dword_18A253000, v38, OS_LOG_TYPE_FAULT, "CoreData: Saved some subscriptions (%lu) %@, but had an operation error, %@", buf, 0x20u);
  }
LABEL_25:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(a3, "containsObject:", CFSTR("com.apple.coredata.cloudkit.zone.subscription"));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_102(uint64_t a1)
{
  NSManagedObjectContext *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[6];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v4)
  {
    v2 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v2, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2_103;
    v5[3] = &unk_1E1EDFC18;
    v5[4] = v4;
    v5[5] = v2;
    v6 = *(_OWORD *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = v3;
    -[NSManagedObjectContext performBlockAndWait:](v2, "performBlockAndWait:", v5);

  }
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2_103(uint64_t a1)
{
  uint64_t v2;
  id v3;
  NSManagedObject *v4;
  _BYTE *v5;
  NSManagedObject *v6;
  NSManagedObject *v7;
  uint64_t v8;
  id v9;

  v9 = 0;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2 == 2)
  {
    v3 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", 2);
    v4 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v3, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v9);
    v5 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v4)
    {
      v6 = v4;
      if (*v5)
        objc_msgSend((id)-[NSManagedObject database](v4, "database"), "setHasSubscription:", 1);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        -[NSManagedObject setHasSubscription:](v6, "setHasSubscription:", 0);
      if ((objc_msgSend(*(id *)(a1 + 40), "save:", &v9) & 1) != 0)
        goto LABEL_10;
      v5 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    *v5 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v9;
LABEL_10:

    return;
  }
  v7 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, v2, *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v9);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!v7)
    goto LABEL_15;
  if (*(_BYTE *)(v8 + 24))
  {
    -[NSManagedObject setHasSubscription:](v7, "setHasSubscription:", 1);
    if ((objc_msgSend(*(id *)(a1 + 40), "save:", &v9) & 1) == 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
LABEL_15:
      *(_BYTE *)(v8 + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v9;
    }
  }
}

intptr_t __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v6 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 3)
    v7 = 3;
  else
    v7 = __ckLoggingOverride;
  v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Fetched user recordID for store %@: %@\n%@"));
  _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke");
  objc_autoreleasePoolPop(v6);
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v15 = a2;
    v16 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    v15 = a3;
    v16 = *(_QWORD *)(a1 + 64);
  }
  *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40) = v15;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2(uint64_t a1)
{
  NSManagedObjectContext *v2;
  __int128 v3;
  id v4;
  _QWORD v5[6];
  __int128 v6;
  __int128 v7;

  v4 = (id)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v4)
  {
    v2 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v2, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_3;
    v5[3] = &unk_1E1EDFD80;
    v5[4] = v4;
    v5[5] = v2;
    v3 = *(_OWORD *)(a1 + 56);
    v6 = *(_OWORD *)(a1 + 40);
    v7 = v3;
    -[NSManagedObjectContext performBlockAndWait:](v2, "performBlockAndWait:", v5);

  }
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSManagedObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41[5];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v41[0] = 0;
  v46[0] = CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey");
  v46[1] = CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey");
  v2 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)v41);
  v3 = v2;
  if (!v2)
  {
    v18 = a1 + 64;
LABEL_24:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v18 + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v41[0];
    return;
  }
  v4 = (NSManagedObject *)objc_msgSend(v2, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"));
  if (!v4)
    v4 = +[NSCKMetadataEntry insertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"), 0, *(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  if (!-[NSManagedObject BOOLValue](v4, "BOOLValue"))
  {
    -[NSManagedObject setBoolValue:](v4, "setBoolValue:", 1);
    +[NSCKMetadataEntry insertMetadataEntryWithKey:stringValue:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "recordName"), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
    goto LABEL_22;
  }
  v5 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"));
  v6 = v5;
  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v19 = (void *)MEMORY[0x18D76B4E4]();
    v20 = __ckLoggingOverride;
    v21 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: CKIdentity record changed from nil to %@"));
    if (v20 >= 3)
      v28 = 3;
    else
      v28 = v20;
    _NSCoreDataLog(v28, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke");
    objc_autoreleasePoolPop(v19);
    v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v42[0] = CFSTR("PFCloudKitNewUserIdentityKey");
    v30 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "recordName");
    v42[1] = CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey");
    v43[0] = v30;
    v43[1] = &unk_1E1F4B630;
    v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    goto LABEL_21;
  }
  v7 = objc_msgSend((id)objc_msgSend(v5, "stringValue"), "isEqualToString:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "recordName"));
  v8 = (void *)MEMORY[0x18D76B4E4]();
  v9 = __ckLoggingOverride;
  if ((v7 & 1) == 0)
  {
    if ((unint64_t)__ckLoggingOverride >= 3)
      v32 = 3;
    else
      v32 = __ckLoggingOverride;
    v33 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: CKIdentity record has changed from %@ to %@"));
    objc_msgSend(v6, "stringValue");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "recordName");
    _NSCoreDataLog(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke_3");
    objc_autoreleasePoolPop(v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v44[0] = CFSTR("PFCloudKitOldUserIdentityKey");
    v45[0] = objc_msgSend(v6, "stringValue");
    v44[1] = CFSTR("PFCloudKitNewUserIdentityKey");
    v40 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "recordName");
    v44[2] = CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey");
    v45[1] = v40;
    v45[2] = &unk_1E1F4B618;
    v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
LABEL_21:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v29, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134405, v31);
    goto LABEL_22;
  }
  v10 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: CKIdentity record matches store: %@"));
  if (v9 >= 0x10)
    v17 = 16;
  else
    v17 = v9;
  _NSCoreDataLog(v17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke");
  objc_autoreleasePoolPop(v8);
LABEL_22:
  v18 = a1 + 64;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 40), "save:", v41) & 1) == 0)
  {
    goto LABEL_24;
  }
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_116(uint64_t a1)
{
  void *v2;
  NSManagedObjectContext *v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  _QWORD v7[6];
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(_QWORD *)(a1 + 32));
    -[NSManagedObjectContext setTransactionAuthor:](v3, "setTransactionAuthor:", CFSTR("NSCloudKitMirroringDelegate.setup"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2_117;
    v7[3] = &unk_1E1EDFDA8;
    v7[4] = v2;
    v7[5] = v3;
    v4 = *(_OWORD *)(a1 + 56);
    v8 = *(_OWORD *)(a1 + 40);
    v9 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v3, "performBlockAndWait:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = *MEMORY[0x1E0CB28A8];
    v10 = *MEMORY[0x1E0CB2D68];
    v11[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identity check was cancelled because the store was removed from the coordinator."));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134407, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
  }

}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2_117(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v33[0] = CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey");
  v33[1] = CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey");
  v2 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v30);
  if (!v2)
    goto LABEL_16;
  v3 = v2;
  if (!objc_msgSend((id)objc_msgSend(v2, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey")), "BOOLValue"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v11 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v12 = 16;
    else
      v12 = __ckLoggingOverride;
    v13 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: First identity fetch failed due to authentication but store was never assigned to a user record: %@"));
    _NSCoreDataLog(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke_2");
    objc_autoreleasePoolPop(v11);
    v20 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"));
    if (v20)
      objc_msgSend(v20, "setBoolValue:", 1);
    else
      +[NSCKMetadataEntry insertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, (uint64_t)CFSTR("NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"), 1, *(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
    if ((objc_msgSend(*(id *)(a1 + 40), "save:", &v30) & 1) != 0)
      return;
LABEL_16:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v10 = v30;
    goto LABEL_17;
  }
  v4 = objc_msgSend(v3, "objectForKey:", CFSTR("NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v4)
  {
    v6 = (void *)v4;
    *(_BYTE *)(v5 + 24) = 0;
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = *MEMORY[0x1E0CB28A8];
    v31[0] = CFSTR("PFCloudKitOldUserIdentityKey");
    v9 = objc_msgSend(v6, "stringValue");
    v31[1] = CFSTR("NSCloudKitMirroringDelegateResetSyncReasonKey");
    v32[0] = v9;
    v32[1] = &unk_1E1F4B600;
    v10 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 134405, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
LABEL_17:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v10;
    return;
  }
  *(_BYTE *)(v5 + 24) = 1;
  v21 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v22 = 16;
  else
    v22 = __ckLoggingOverride;
  v23 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Identity fetch failed due to authentication but store was never assigned to a user record: %@"));
  _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke_2");
  objc_autoreleasePoolPop(v21);
}

void __96__PFCloudKitSetupAssistant__checkAndTruncateEventHistoryIfNeededWithManagedObjectContext_error___block_invoke(uint64_t *a1)
{
  NSFetchRequest *v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  NSBatchDeleteRequest *v7;
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKEvent entityPath](NSCKEvent, "entityPath"));
  v3 = a1[4];
  if (v3)
  {
    v4 = -[NSManagedObjectContext _countForFetchRequest_:error:](v3, v2, (id *)(*(_QWORD *)(a1[5] + 8) + 40));
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
      v5 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
    }
    else if (v4 >= 0x4E21)
    {
      -[NSFetchRequest setFetchLimit:](v2, "setFetchLimit:", v4 - 10000);
      -[NSFetchRequest setResultType:](v2, "setResultType:", 1);
      v10[0] = objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("SELF"), 1);
      -[NSFetchRequest setSortDescriptors:](v2, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1));
      v6 = objc_msgSend((id)a1[4], "executeFetchRequest:error:", v2, *(_QWORD *)(a1[5] + 8) + 40);
      if (v6)
      {
        v7 = -[NSBatchDeleteRequest initWithObjectIDs:]([NSBatchDeleteRequest alloc], "initWithObjectIDs:", v6);
        -[NSBatchDeleteRequest setResultType:](v7, "setResultType:", 0);
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1[4], "executeRequest:error:", v7, *(_QWORD *)(a1[5] + 8) + 40), "result"), "BOOLValue");
        if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
          v8 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);

      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
        v9 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
      }
    }
  }
}

@end
