@implementation BCCloudAssetAnnotationManager

- (BCCloudAssetAnnotationManager)initWithCloudDataSource:(id)a3 cloudKitController:(id)a4
{
  id v7;
  id v8;
  BCCloudAssetAnnotationManager *v9;
  uint64_t v10;
  BCCloudDataSyncManager *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  BCCloudDataManager *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id WeakRetained;
  const char *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  dispatch_queue_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  id v57;
  NSObject *v58;
  id v60;
  objc_super v61;

  v7 = a3;
  v8 = a4;
  v61.receiver = self;
  v61.super_class = (Class)BCCloudAssetAnnotationManager;
  v9 = -[BCCloudAssetAnnotationManager init](&v61, sel_init);
  v10 = (uint64_t)v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_annotationsDataSource, a3);
    objc_storeWeak((id *)(v10 + 24), v8);
    v11 = [BCCloudDataSyncManager alloc];
    v15 = objc_msgSend_initWithCloudKitController_(v11, v12, (uint64_t)v8, v13, v14);
    v16 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v15;

    objc_msgSend_setDelegate_(*(void **)(v10 + 40), v17, v10, v18, v19);
    v20 = [BCCloudDataManager alloc];
    objc_msgSend_entityName((void *)v10, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = *(_QWORD *)(v10 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(v10 + 24));
    v31 = objc_msgSend_initWithCloudDataSource_entityName_notificationName_immutableClass_mutableClass_syncManager_cloudKitController_(v20, v30, (uint64_t)v7, (uint64_t)v25, (uint64_t)CFSTR("BCCloudAssetAnnotationManagerChanged"), v26, v27, v28, WeakRetained);
    v32 = *(void **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = v31;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create("com.apple.BCCloudAssetAnnotationManager", v33);
    v35 = *(void **)(v10 + 8);
    *(_QWORD *)(v10 + 8) = v34;

    objc_msgSend_applicationCacheDirectory(BDSApplication, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v40, v41, (uint64_t)CFSTR("BCCloudAssetAnnotationManagerAssetCache"), v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v45, (uint64_t)v44, v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = *(void **)(v10 + 56);
    *(_QWORD *)(v10 + 56) = v48;

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = *(_QWORD *)(v10 + 56);
    v60 = 0;
    objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v54, v56, v55, 1, 0, &v60);
    v57 = v60;

    if (v57)
    {
      BDSCloudKitLog();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        sub_227E5AA68((uint64_t *)(v10 + 56), (uint64_t)v57, v58);

    }
  }

  return (BCCloudAssetAnnotationManager *)v10;
}

- (id)entityName
{
  return CFSTR("BCAssetAnnotations");
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_setDelegate_(self->_syncManager, a2, 0, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)BCCloudAssetAnnotationManager;
  -[BCCloudAssetAnnotationManager dealloc](&v5, sel_dealloc);
}

- (void)setEnableCloudSync:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  int v64;
  const __CFString *v65;
  uint64_t v66;

  v5 = a3;
  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_shared(MEMORY[0x24BE0FC08], a2, a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_verboseLoggingEnabled(v7, v8, v9, v10, v11);

  if (v12)
  {
    BDSCloudKitDevelopmentLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("NO");
      if (v5)
        v18 = CFSTR("YES");
      v64 = 138412290;
      v65 = v18;
      _os_log_impl(&dword_227D4F000, v17, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudAssetAnnotationManager #enableCloudSync setEnableCloudSync %@\\\"\", (uint8_t *)&v64, 0xCu);
    }

  }
  if (self->_enableCloudSync != v5)
  {
    self->_enableCloudSync = v5;
    if (v5)
    {
      objc_msgSend_cloudKitController(self, v13, v14, v15, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_privateCloudDatabaseController(v19, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncManager(self, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObserver_recordType_(v24, v30, (uint64_t)v29, (uint64_t)CFSTR("assetAnnotations"), v31);

      objc_msgSend_cloudKitController(self, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transactionManager(v36, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_entityName(self, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncManager(self, v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v41, v52, (uint64_t)v46, (uint64_t)v51, v53);

    }
    else
    {
      objc_msgSend_sharedInstance(BCCloudKitController, v13, v14, v15, v16);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_privateCloudDatabaseController(v36, v54, v55, v56, v57);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncManager(self, v58, v59, v60, v61);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObserver_recordType_(v41, v62, (uint64_t)v46, (uint64_t)CFSTR("assetAnnotations"), v63);
    }

  }
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_dataManager(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dissociateCloudDataFromSyncWithCompletion_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)assetWithID:(id)a3 updatedAnnotations:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t isAnnotationDeleted;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t IsUnderline;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  double v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  const char *v336;
  BCMutableAssetAnnotations *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  id v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  void *v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  void *v367;
  void *v368;
  id v370;
  void *v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  _BYTE v376[128];
  uint64_t v377;

  v377 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v370 = a5;
  v9 = (void *)objc_opt_new();
  v371 = v7;
  objc_msgSend_setAssetID_(v9, v10, (uint64_t)v7, v11, v12);
  objc_msgSend_appVersion(BDSAppVersion, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppVersion_(v9, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_lastObject(v8, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  BUProtocolCast();
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v368 = v26;
  objc_msgSend_assetVersion(v26, v27, v28, v29, v30);
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetVersion_(v9, v31, (uint64_t)v367, v32, v33);
  v374 = 0u;
  v375 = 0u;
  v372 = 0u;
  v373 = 0u;
  v34 = v8;
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v372, (uint64_t)v376, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v373;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v373 != v38)
          objc_enumerationMutation(v34);
        v40 = *(void **)(*((_QWORD *)&v372 + 1) + 8 * v39);
        v41 = (void *)objc_opt_new();
        objc_msgSend_annotationCreatorIdentifier(v40, v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCreatorIdentifier_(v41, v47, (uint64_t)v46, v48, v49);

        objc_msgSend_annotationUuid(v40, v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setUuid_(v41, v55, (uint64_t)v54, v56, v57);

        objc_msgSend_annotationModificationDate(v40, v58, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceReferenceDate(v62, v63, v64, v65, v66);
        objc_msgSend_setModificationDate_(v41, v67, v68, v69, v70);

        if (objc_msgSend_isAnnotationDeleted(v40, v71, v72, v73, v74))
        {
          bc_turnProtoAnnotationIntoTombstone(v41);
        }
        else
        {
          objc_msgSend_annotationCreationDate(v40, v75, v76, v77, v78);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v83, v84, v85, v86, v87);
          objc_msgSend_setCreationDate_(v41, v88, v89, v90, v91);

          isAnnotationDeleted = objc_msgSend_isAnnotationDeleted(v40, v92, v93, v94, v95);
          objc_msgSend_setDeleted_(v41, v97, isAnnotationDeleted, v98, v99);
          IsUnderline = objc_msgSend_annotationIsUnderline(v40, v100, v101, v102, v103);
          objc_msgSend_setIsUnderline_(v41, v105, IsUnderline, v106, v107);
          objc_msgSend_annotationLocation(v40, v108, v109, v110, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setLocationCFIString_(v41, v113, (uint64_t)v112, v114, v115);

          objc_msgSend_annotationNote(v40, v116, v117, v118, v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setNote_(v41, v121, (uint64_t)v120, v122, v123);

          objc_msgSend_annotationRepresentativeText(v40, v124, v125, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRepresentativeText_(v41, v129, (uint64_t)v128, v130, v131);

          objc_msgSend_annotationSelectedText(v40, v132, v133, v134, v135);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setSelectedText_(v41, v137, (uint64_t)v136, v138, v139);

          objc_msgSend_annotationStyleNumber(v40, v140, v141, v142, v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = objc_msgSend_intValue(v144, v145, v146, v147, v148);
          objc_msgSend_setStyle_(v41, v150, v149, v151, v152);

          objc_msgSend_annotationTypeNumber(v40, v153, v154, v155, v156);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          v162 = objc_msgSend_intValue(v157, v158, v159, v160, v161);
          objc_msgSend_setType_(v41, v163, v162, v164, v165);

          objc_msgSend_physicalPageNumber(v40, v166, v167, v168, v169);
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setPhysicalPageNumber_(v41, v171, (uint64_t)v170, v172, v173);

          objc_msgSend_annotationVersion(v40, v174, v175, v176, v177);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAnnotationVersion_(v41, v179, (uint64_t)v178, v180, v181);

          objc_msgSend_assetVersion(v40, v182, v183, v184, v185);
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAssetVersion_(v41, v187, (uint64_t)v186, v188, v189);

          objc_msgSend_attachments(v40, v190, v191, v192, v193);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAttachments_(v41, v195, (uint64_t)v194, v196, v197);

          objc_msgSend_chapterTitle(v40, v198, v199, v200, v201);
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setChapterTitle_(v41, v203, (uint64_t)v202, v204, v205);

          objc_msgSend_userModificationDate(v40, v206, v207, v208, v209);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v210, v211, v212, v213, v214);
          objc_msgSend_setUserModificationDate_(v41, v215, v216, v217, v218);

          v219 = (void *)objc_opt_new();
          v224 = objc_msgSend_annotationSelectedTextRange(v40, v220, v221, v222, v223);
          objc_msgSend_setLocation_(v219, v225, v224, v226, v227);
          objc_msgSend_annotationSelectedTextRange(v40, v228, v229, v230, v231);
          objc_msgSend_setLength_(v219, v232, (uint64_t)v232, v233, v234);
          objc_msgSend_setSelectedTextRange_(v41, v235, (uint64_t)v219, v236, v237);
          objc_msgSend_readingProgressHighWaterMark(v40, v238, v239, v240, v241);
          objc_msgSend_setReadingProgressHighWaterMark_(v41, v242, v243, v244, v245);
          v250 = objc_msgSend_spineIndexUpdated(v40, v246, v247, v248, v249);
          objc_msgSend_setSpineIndexUpdated_(v41, v251, v250, v252, v253);
          objc_msgSend_readingProgress(v40, v254, v255, v256, v257);
          BUClamp();
          *(float *)&v258 = v258;
          objc_msgSend_setReadingProgress_(v41, v259, v260, v261, v262, v258);
          objc_msgSend_futureProofing12(v40, v263, v264, v265, v266);
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setFutureProofing12_(v41, v268, (uint64_t)v267, v269, v270);

          objc_msgSend_plAbsolutePhysicalLocation(v40, v271, v272, v273, v274);
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          v280 = objc_msgSend_intValue(v275, v276, v277, v278, v279);
          objc_msgSend_setPlAbsolutePhysicalLocation_(v41, v281, v280, v282, v283);

          objc_msgSend_plLocationRangeEnd(v40, v284, v285, v286, v287);
          v288 = (void *)objc_claimAutoreleasedReturnValue();
          v293 = objc_msgSend_intValue(v288, v289, v290, v291, v292);
          objc_msgSend_setPlLocationRangeEnd_(v41, v294, v293, v295, v296);

          objc_msgSend_plLocationRangeStart(v40, v297, v298, v299, v300);
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          v306 = objc_msgSend_intValue(v301, v302, v303, v304, v305);
          objc_msgSend_setPlLocationRangeStart_(v41, v307, v306, v308, v309);

          objc_msgSend_plStorageUUID(v40, v310, v311, v312, v313);
          v314 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setPlLocationStorageUUID_(v41, v315, (uint64_t)v314, v316, v317);

          objc_msgSend_plUserData(v40, v318, v319, v320, v321);
          v322 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setPlUserData_(v41, v323, (uint64_t)v322, v324, v325);

        }
        objc_msgSend_locationModificationDate(v40, v79, v80, v81, v82);
        v326 = (void *)objc_claimAutoreleasedReturnValue();
        v331 = v326;
        if (v326)
        {
          objc_msgSend_timeIntervalSinceReferenceDate(v326, v327, v328, v329, v330);
          objc_msgSend_setLocationModificationDate_(v41, v332, v333, v334, v335);
        }
        objc_msgSend_addAnnotation_(v9, v327, (uint64_t)v41, v329, v330);

        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v336, (uint64_t)&v372, (uint64_t)v376, 16);
    }
    while (v37);
  }

  v337 = [BCMutableAssetAnnotations alloc];
  v341 = (void *)objc_msgSend_initWithAssetID_(v337, v338, (uint64_t)v371, v339, v340);
  objc_msgSend_setAssetVersion_(v341, v342, (uint64_t)v367, v343, v344);
  v345 = objc_alloc_init(MEMORY[0x24BE7AF00]);
  objc_msgSend_writeTo_(v9, v346, (uint64_t)v345, v347, v348);
  objc_msgSend_immutableData(v345, v349, v350, v351, v352);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBookAnnotations_(v341, v354, (uint64_t)v353, v355, v356);

  objc_msgSend_dataManager(self, v357, v358, v359, v360);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v362, (uint64_t)CFSTR("assetID = %@"), v363, v364, v371);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCloudData_predicate_completion_(v361, v366, (uint64_t)v341, (uint64_t)v365, (uint64_t)v370);

}

- (id)fileURLForCachingCKAssetWithAssetID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  objc_msgSend_dataUsingEncoding_(v4, v5, 4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bu_md5(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_length(v13, v14, v15, v16, v17)
    || (objc_msgSend_ckAssetStoreDirectory(self, v18, v19, v20, v21),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_URLByAppendingPathComponent_(v22, v23, (uint64_t)v13, v24, v25),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        !v26))
  {
    BDSCloudKitLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_227E5AAE8(self, (const char *)v4, v27, v28, v29);

    v26 = 0;
  }

  return v26;
}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (objc_msgSend_enableCloudSync(self, v7, v8, v9, v10))
  {
    objc_msgSend_dataManager(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startSyncToCKWithSyncManager_completion_(v15, v16, (uint64_t)v19, (uint64_t)v6, v17);
  }
  else
  {
    v18 = _Block_copy(v6);
    v15 = v18;
    if (v18)
      (*((void (**)(void *))v18 + 2))(v18);
  }

}

- (void)signalSyncToCKForSyncManager:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  id v27;

  if (objc_msgSend_enableCloudSync(self, a2, (uint64_t)a3, v3, v4))
  {
    objc_msgSend_cloudKitController(self, v6, v7, v8, v9);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transactionManager(v27, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entityName(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_syncManager(self, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signalSyncToCKTransactionForEntityName_syncManager_(v14, v25, (uint64_t)v19, (uint64_t)v24, v26);

  }
}

- (void)syncManager:(id)a3 removeCloudDataForIDs:(id)a4 completion:(id)a5
{
  void *v5;
  id v6;

  v5 = _Block_copy(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(void *, uint64_t, _QWORD))v5 + 2))(v5, 1, 0);
    v5 = v6;
  }

}

- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDBCED8];
  v14 = objc_msgSend_count(v7, v10, v11, v12, v13);
  objc_msgSend_dictionaryWithCapacity_(v9, v15, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v19 = v7;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v49, (uint64_t)v53, 16);
  if (v21)
  {
    v26 = v21;
    v27 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v50 != v27)
          objc_enumerationMutation(v19);
        v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend_assetID(v29, v22, v23, v24, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v18, v31, (uint64_t)v29, (uint64_t)v30, v32);

      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v49, (uint64_t)v53, 16);
    }
    while (v26);
  }

  objc_msgSend_dataManager(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend_allKeys(v18, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v38, v44, (uint64_t)CFSTR("assetID IN %@"), v45, v46, v43);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateSyncGenerationFromCloudData_predicate_propertyIDKey_completion_(v37, v48, (uint64_t)v18, (uint64_t)v47, (uint64_t)CFSTR("assetID"), v8);

}

- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12))
  {
    objc_msgSend_dataManager(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D8C960;
    v22[3] = &unk_24F08A200;
    v23 = v8;
    objc_msgSend_resolveConflictsForRecords_completion_(v17, v18, (uint64_t)v7, (uint64_t)v22, v19);

  }
  else
  {
    v20 = _Block_copy(v8);
    v21 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);

  }
}

- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend_enableCloudSync(self, v9, v10, v11, v12))
  {
    objc_msgSend_dataManager(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = sub_227D8CA9C;
    v22[3] = &unk_24F08A228;
    v23 = v8;
    objc_msgSend_failedRecordIDs_completion_(v17, v18, (uint64_t)v7, (uint64_t)v22, v19);

  }
  else
  {
    v20 = _Block_copy(v8);
    v21 = v20;
    if (v20)
      (*((void (**)(void *, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);

  }
}

- (void)getAnnotationChangesSince:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend_dataManager(self, v8, v9, v10, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  objc_msgSend_getChangesSince_forEntityClass_completion_(v14, v13, (uint64_t)v7, v12, (uint64_t)v6);

}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (BCCloudKitController)cloudKitController
{
  return (BCCloudKitController *)objc_loadWeakRetained((id *)&self->_cloudKitController);
}

- (void)setCloudKitController:(id)a3
{
  objc_storeWeak((id *)&self->_cloudKitController, a3);
}

- (BCCloudDataSource)annotationsDataSource
{
  return self->_annotationsDataSource;
}

- (void)setAnnotationsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_annotationsDataSource, a3);
}

- (BCCloudDataSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncManager, a3);
}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (void)setDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataManager, a3);
}

- (NSURL)ckAssetStoreDirectory
{
  return self->_ckAssetStoreDirectory;
}

- (void)setCkAssetStoreDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_ckAssetStoreDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckAssetStoreDirectory, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_annotationsDataSource, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
