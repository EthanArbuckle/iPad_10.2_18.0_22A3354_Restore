@implementation BMInteractionProvider

- (BMInteractionProvider)initWithInteractionStore:(id)a3
{
  return -[BMInteractionProvider initWithInteractionStore:bmMiningTaskConfig:](self, "initWithInteractionStore:bmMiningTaskConfig:", a3, 0);
}

- (BMInteractionProvider)initWithInteractionStore:(id)a3 bmMiningTaskConfig:(id)a4
{
  id v7;
  id v8;
  BMInteractionProvider *v9;
  BMInteractionProvider *v10;
  id contextKitClient;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  objc_super v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BMInteractionProvider;
  v9 = -[BMInteractionProvider init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_interactionStore, a3);
    contextKitClient = v10->_contextKitClient;
    v10->_contextKitClient = 0;

    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v12 = (void *)getCKContextClientClass_softClass;
    v22 = getCKContextClientClass_softClass;
    if (!getCKContextClientClass_softClass)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __getCKContextClientClass_block_invoke;
      v18[3] = &unk_24D21EAF0;
      v18[4] = &v19;
      __getCKContextClientClass_block_invoke((uint64_t)v18);
      v12 = (void *)v20[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v19, 8);
    objc_msgSend(v13, "clientWithDefaultRequestType:", 9);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v10->_contextKitClient;
    v10->_contextKitClient = (id)v14;

    objc_storeStrong((id *)&v10->_bmMiningTaskConfig, a4);
  }

  return v10;
}

- (BMInteractionProvider)init
{
  void *v3;
  void *v4;
  BMInteractionProvider *v5;

  objc_msgSend(MEMORY[0x24BE1AFC0], "defaultDatabaseDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFC0], "storeWithDirectory:readOnly:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMInteractionProvider initWithInteractionStore:](self, "initWithInteractionStore:", v4);

  return v5;
}

- (BMInteractionProvider)initWithBMMiningTaskConfig:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BMInteractionProvider *v8;

  v4 = (void *)MEMORY[0x24BE1AFC0];
  v5 = a3;
  objc_msgSend(v4, "defaultDatabaseDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AFC0], "storeWithDirectory:readOnly:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMInteractionProvider initWithInteractionStore:bmMiningTaskConfig:](self, "initWithInteractionStore:bmMiningTaskConfig:", v7, v5);

  return v8;
}

- (id)batchFetchedPhotoSuggestionsForInteractions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v9, "attachments");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              objc_msgSend(v15, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v15, "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "UUIDString");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v18);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithLocalIdentifiers:options:", v4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setSharingStream:", 3);
  objc_msgSend(MEMORY[0x24BDE35E0], "batchFetchSuggestedRecipientsForAssets:options:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)getResultsForRequest:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v4 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__BMInteractionProvider_getResultsForRequest___block_invoke;
  v10[3] = &unk_24D21EBE0;
  v12 = &v13;
  v5 = v4;
  v11 = v5;
  objc_msgSend(v3, "executeWithReply:", v10);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    BMLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = &unk_24D223678;
      _os_log_impl(&dword_2147C2000, v7, OS_LOG_TYPE_INFO, "Timeout after %@ msec waiting for an answer from ContextKit", buf, 0xCu);
    }

    v8 = 0;
  }
  else
  {
    v8 = (id)v14[5];
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __46__BMInteractionProvider_getResultsForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)interactionEventsForTypes:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t i;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  BMEvent *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  BMEvent *v55;
  void *v56;
  BMEvent *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  BMEvent *v64;
  void *v65;
  BMEvent *v66;
  void *v67;
  int v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  BMEvent *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  BMEvent *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  char v99;
  uint64_t v100;
  void *v101;
  int v102;
  BMEvent *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v125;
  int v126;
  BMEvent *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  int v133;
  NSObject *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  int v138;
  void *v139;
  NSObject *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  NSObject *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t j;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  BMEvent *v155;
  NSObject *v156;
  void *v157;
  void *v158;
  NSObject *v159;
  NSObject *v160;
  void *v161;
  void *v162;
  int v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t k;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  id v177;
  void *v178;
  void *v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t m;
  void *v185;
  void *v186;
  void *v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  void *v194;
  uint64_t v195;
  NSObject *v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t n;
  uint64_t v202;
  void *v203;
  void *v204;
  BMEvent *v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  NSObject *v210;
  id v211;
  id v212;
  void *v213;
  uint64_t v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  uint64_t v223;
  void *v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t ii;
  void *v230;
  double v231;
  double v232;
  uint64_t v233;
  void *v234;
  void *v235;
  uint64_t v236;
  void *v237;
  BOOL v238;
  double v239;
  double v240;
  void *v241;
  void *v242;
  uint64_t v243;
  void *v244;
  id v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t jj;
  void *v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t kk;
  uint64_t v256;
  void *v257;
  void *v258;
  BMEvent *v259;
  uint64_t v260;
  id v261;
  void *v262;
  void *v264;
  void *v265;
  void *v266;
  id v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  uint64_t v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  id obj;
  void *v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  void *v288;
  uint64_t v289;
  void *v290;
  id v291;
  void *v292;
  BMInteractionProvider *v293;
  id v294;
  id v295;
  id v296;
  void *v297;
  uint64_t v298;
  NSObject *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *context;
  void *contexta;
  id contextb;
  void *v306;
  uint64_t v307;
  void *v308;
  void *v309;
  void *v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  id v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  char v324;
  char v325[15];
  char v326;
  char v327[15];
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  char v332;
  char v333[15];
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  id v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  _BYTE v351[128];
  _BYTE v352[128];
  _BYTE v353[128];
  _BYTE v354[128];
  uint8_t v355[4];
  uint64_t v356;
  _BYTE v357[128];
  _BYTE v358[128];
  _QWORD v359[2];
  _QWORD v360[2];
  const __CFString *v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  _QWORD v366[2];
  _QWORD v367[2];
  _BYTE v368[128];
  uint8_t v369[32];
  __int128 v370;
  __int128 v371;
  uint8_t buf[4];
  void *v373;
  __int16 v374;
  id v375;
  _QWORD v376[4];

  v376[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x2199D5B54]();
  v7 = 0x24D21E000uLL;
  +[BMItemType interactionItemTypes](BMItemType, "interactionItemTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "intersectsSet:", v8);

  if ((v9 & 1) == 0)
  {
    objc_autoreleasePoolPop(v6);
    v261 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_207;
  }
  v284 = v6;
  objc_msgSend(MEMORY[0x24BE719B8], "defaultConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v273 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.PeopleSuggester"));
  objc_msgSend(v273, "BOOLForKey:", CFSTR("_PSAllowNonSupportedBundleIDs"));
  _PSShareSheetSuggestionBundleIDs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.mobilemail"), CFSTR("com.apple.UIKit.activity.Mail"), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.UIKit.activity.Message"), 0);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = v11;
  v13 = (void *)objc_msgSend(v11, "mutableCopy");
  v287 = (void *)v12;
  objc_msgSend(v13, "minusSet:", v12);
  _PSShareSheetExtensionBundleIDToAppBundleIDMapping();
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v271 = v13;
  BMInteractionPredicate(4, v13, v10);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDBCF20];
  v361 = CFSTR("com.apple.UIKit.activity.Mail");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v361, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BMInteractionPredicate(1, v17, v10);
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDD14C0];
  v269 = (void *)v18;
  v270 = (void *)v14;
  v360[0] = v14;
  v360[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v360, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "orPredicateWithSubpredicates:", v20);
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDD1758];
  v23 = (void *)MEMORY[0x24BDBCF20];
  v274 = v10;
  objc_msgSend(v10, "suggestionModel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageDirections");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "predicateWithFormat:", CFSTR("(direction IN %@)"), v26);
  v27 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x24BDD14C0];
  v266 = (void *)v27;
  v359[0] = v27;
  v268 = (void *)v21;
  v359[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v359, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "andPredicateWithSubpredicates:", v29);
  v30 = objc_claimAutoreleasedReturnValue();

  -[BMInteractionProvider interactionStore](self, "interactionStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v342 = 0;
  v265 = (void *)v30;
  objc_msgSend(v31, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v30, 0, 0, &v342);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v342;

  v267 = v33;
  v264 = v32;
  if (!v32)
  {
    v262 = 0;
    v34 = v284;
    goto LABEL_204;
  }
  -[BMInteractionProvider batchFetchedPhotoSuggestionsForInteractions:](self, "batchFetchedPhotoSuggestionsForInteractions:", v32);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  v338 = 0u;
  v339 = 0u;
  v340 = 0u;
  v341 = 0u;
  obj = v32;
  v286 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v338, v358, 16);
  if (!v286)
  {
    v306 = 0;
    v34 = v284;
    goto LABEL_203;
  }
  v306 = 0;
  v285 = *(_QWORD *)v339;
  v276 = *MEMORY[0x24BDE3750];
  v293 = self;
  v294 = v5;
  v34 = v284;
  do
  {
    for (i = 0; i != v286; ++i)
    {
      if (*(_QWORD *)v339 != v285)
        objc_enumerationMutation(obj);
      v36 = *(void **)(*((_QWORD *)&v338 + 1) + 8 * i);
      v37 = (void *)MEMORY[0x2199D5B54]();
      if (objc_msgSend(v36, "mechanism") == 13)
        objc_msgSend(v36, "targetBundleId");
      else
        objc_msgSend(v36, "bundleId");
      v38 = (id)objc_claimAutoreleasedReturnValue();

      v292 = v38;
      if (objc_msgSend(v287, "containsObject:", v38))
      {
        objc_msgSend(v36, "recipients");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");

        if (v40 > 1)
          goto LABEL_197;
      }
      v288 = v37;
      v289 = i;
      objc_msgSend(v36, "startDate");
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "endDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        v43 = v41;
      }
      else
      {
        objc_msgSend(v36, "startDate");
        v43 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(*(id *)(v7 + 464), "interactionMechanism");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v5, "containsObject:", v44);

      if (v45)
      {
        objc_msgSend(*(id *)(v7 + 464), "interactionMechanism");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v36, "mechanism"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[BMItem itemWithType:numberValue:](BMItem, "itemWithType:numberValue:", v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = -[BMEvent initWithStartDate:endDate:item:]([BMEvent alloc], "initWithStartDate:endDate:item:", v310, v43, v48);
        objc_msgSend(v309, "addObject:", v49);

      }
      objc_msgSend(*(id *)(v7 + 464), "interactionDirection");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v5, "containsObject:", v50);

      if (v51)
      {
        objc_msgSend(*(id *)(v7 + 464), "interactionDirection");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v36, "direction"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[BMItem itemWithType:numberValue:](BMItem, "itemWithType:numberValue:", v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = [BMEvent alloc];
        objc_msgSend(v36, "endDate");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[BMEvent initWithStartDate:endDate:item:](v55, "initWithStartDate:endDate:item:", v310, v56, v54);

        objc_msgSend(v309, "addObject:", v57);
      }
      objc_msgSend(*(id *)(v7 + 464), "interactionSharingSourceBundleID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v5, "containsObject:", v58);

      if (v59)
      {
        if (objc_msgSend(v36, "mechanism") == 13)
        {
          objc_msgSend(v36, "bundleId");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v60)
          {
            objc_msgSend(*(id *)(v7 + 464), "interactionSharingSourceBundleID");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "bundleId");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v61, v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            v64 = [BMEvent alloc];
            objc_msgSend(v36, "endDate");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = -[BMEvent initWithStartDate:endDate:item:](v64, "initWithStartDate:endDate:item:", v310, v65, v63);

            objc_msgSend(v309, "addObject:", v66);
          }
        }
      }
      objc_msgSend(*(id *)(v7 + 464), "interactionTargetBundleID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v5, "containsObject:", v67);

      if (v68)
      {
        objc_msgSend(v281, "objectForKeyedSubscript:", v292);
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = (void *)v69;
        if (v69)
          v71 = (void *)v69;
        else
          v71 = v292;
        v72 = v71;

        if (v72)
        {
          objc_msgSend(*(id *)(v7 + 464), "interactionTargetBundleID");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v73, v72);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = -[BMEvent initWithStartDate:endDate:item:]([BMEvent alloc], "initWithStartDate:endDate:item:", v310, v43, v74);
          objc_msgSend(v309, "addObject:", v75);

        }
      }
      v290 = v36;
      objc_msgSend(v36, "sender");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "identifier");
      v77 = objc_claimAutoreleasedReturnValue();
      if (v77)
      {
        v78 = (void *)v77;
        objc_msgSend(*(id *)(v7 + 464), "interactionSender");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v5, "containsObject:", v79);

        if (!v80)
          goto LABEL_35;
        objc_msgSend(*(id *)(v7 + 464), "interactionSender");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "sender");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "identifier");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v81, v83);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        v84 = -[BMEvent initWithStartDate:endDate:item:]([BMEvent alloc], "initWithStartDate:endDate:item:", v310, v43, v76);
        objc_msgSend(v309, "addObject:", v84);

      }
LABEL_35:
      objc_msgSend(*(id *)(v7 + 464), "interactionRecipients");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v5, "containsObject:", v85);

      v87 = v290;
      if (v86)
      {
        if (objc_msgSend(v287, "containsObject:", v292))
        {
          objc_msgSend(v290, "recipients");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend(v88, "count");

          if (v89 == 1)
          {
            objc_msgSend(*(id *)(v7 + 464), "interactionRecipients");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = (void *)MEMORY[0x24BE1AFB8];
            objc_msgSend(v290, "recipients");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "generateConversationIdFromInteractionRecipients:", v92);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v90, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            v87 = v290;
            goto LABEL_49;
          }
        }
        if (objc_msgSend(v282, "containsObject:", v292)
          && (objc_msgSend(v290, "domainIdentifier"),
              v95 = (void *)objc_claimAutoreleasedReturnValue(),
              v95,
              v95))
        {
          objc_msgSend(v290, "domainIdentifier");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v96, "containsString:", CFSTR("SMS")))
          {

LABEL_47:
            objc_msgSend(*(id *)(v7 + 464), "interactionRecipients");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v290, "domainIdentifier");
            v100 = objc_claimAutoreleasedReturnValue();
            goto LABEL_48;
          }
          objc_msgSend(v290, "domainIdentifier");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v101, "containsString:", CFSTR("iMessage"));

          if (v102)
            goto LABEL_47;
        }
        else
        {
          objc_msgSend(v290, "derivedIntentIdentifier");
          v97 = objc_claimAutoreleasedReturnValue();
          if (v97)
          {
            v98 = (void *)v97;
            v99 = objc_msgSend(v282, "containsObject:", v292);

            if ((v99 & 1) == 0)
            {
              objc_msgSend(*(id *)(v7 + 464), "interactionRecipients");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v290, "derivedIntentIdentifier");
              v100 = objc_claimAutoreleasedReturnValue();
LABEL_48:
              v92 = (void *)v100;
              +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v90, v100);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:

              if (v94)
              {
                v103 = -[BMEvent initWithStartDate:endDate:item:]([BMEvent alloc], "initWithStartDate:endDate:item:", v310, v43, v94);
                objc_msgSend(v309, "addObject:", v103);

              }
            }
          }
        }
      }
      v336 = 0u;
      v337 = 0u;
      v334 = 0u;
      v335 = 0u;
      objc_msgSend(v87, "attachments");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      context = (void *)objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v334, v357, 16);
      if (!context)
        goto LABEL_99;
      v301 = *(_QWORD *)v335;
      v295 = v104;
      do
      {
        v105 = 0;
        do
        {
          if (*(_QWORD *)v335 != v301)
            objc_enumerationMutation(v104);
          v307 = v105;
          v106 = *(void **)(*((_QWORD *)&v334 + 1) + 8 * v105);
          objc_msgSend(v106, "contentURL");
          v107 = objc_claimAutoreleasedReturnValue();
          if (v107)
          {
            v108 = (void *)v107;
            objc_msgSend(v106, "contentURL");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "host");
            v110 = objc_claimAutoreleasedReturnValue();
            if (v110)
            {
              v111 = (void *)v110;
              +[BMItemType interactionContentURL](BMItemType, "interactionContentURL");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = objc_msgSend(v5, "containsObject:", v112);

              if (v113)
              {
                v7 = 0x24D21E000uLL;
                +[BMItemType interactionContentURL](BMItemType, "interactionContentURL");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "contentURL");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "host");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v114, v116);
                v117 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_68;
              }
            }
            else
            {

            }
          }
          objc_msgSend(v106, "uti");
          v118 = objc_claimAutoreleasedReturnValue();
          v7 = 0x24D21E000uLL;
          if (v118)
          {
            v119 = (void *)v118;
            +[BMItemType interactionUTIType](BMItemType, "interactionUTIType");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = objc_msgSend(v5, "containsObject:", v120);

            if (v121)
            {
              +[BMItemType interactionUTIType](BMItemType, "interactionUTIType");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "uti");
              v122 = objc_claimAutoreleasedReturnValue();
              goto LABEL_67;
            }
          }
          objc_msgSend(v106, "personInPhoto");
          v123 = objc_claimAutoreleasedReturnValue();
          if (v123)
          {
            v124 = (void *)v123;
            +[BMItemType interactionPhotoContact](BMItemType, "interactionPhotoContact");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = objc_msgSend(v5, "containsObject:", v125);

            if (v126)
            {
              +[BMItemType interactionPhotoContact](BMItemType, "interactionPhotoContact");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "personInPhoto");
              v122 = objc_claimAutoreleasedReturnValue();
LABEL_67:
              v115 = (void *)v122;
              +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v114, v122);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_68:

              v127 = -[BMEvent initWithStartDate:endDate:item:]([BMEvent alloc], "initWithStartDate:endDate:item:", v310, v43, v117);
              objc_msgSend(v309, "addObject:", v127);

            }
          }
          -[BMInteractionProvider contextKitClient](self, "contextKitClient");
          v128 = objc_claimAutoreleasedReturnValue();
          if (v128)
          {
            v129 = (void *)v128;
            -[BMInteractionProvider bmMiningTaskConfig](self, "bmMiningTaskConfig");
            v130 = objc_claimAutoreleasedReturnValue();
            if (v130)
            {
              v131 = (void *)v130;
              -[BMInteractionProvider bmMiningTaskConfig](self, "bmMiningTaskConfig");
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              v133 = objc_msgSend(v132, "interactionExtractedTopicFromAttachmentFactorInUse");

              if (v133)
              {
                BMLog();
                v134 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
                  -[BMInteractionProvider interactionEventsForTypes:error:].cold.4(&v332, v333);

                objc_msgSend(v106, "contentText");
                v135 = objc_claimAutoreleasedReturnValue();
                if (v135)
                {
                  v136 = (void *)v135;
                  +[BMItemType interactionExtractedTopicFromAttachment](BMItemType, "interactionExtractedTopicFromAttachment");
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  v138 = objc_msgSend(v5, "containsObject:", v137);

                  if (v138)
                  {
                    -[BMInteractionProvider contextKitClient](self, "contextKitClient");
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    v140 = objc_msgSend(v139, "newRequest");

                    objc_msgSend(v106, "contentURL");
                    v141 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v141, "absoluteString");
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setUrl:](v140, "setUrl:", v142);

                    -[NSObject setIncludeHigherLevelTopics:](v140, "setIncludeHigherLevelTopics:", 1);
                    v299 = v140;
                    -[BMInteractionProvider getResultsForRequest:](self, "getResultsForRequest:", v140);
                    v143 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "error");
                    v144 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v144)
                    {
                      BMLog();
                      v145 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
                        -[BMInteractionProvider interactionEventsForTypes:error:].cold.3(v355, v143, &v356, v145);

                    }
                    v330 = 0u;
                    v331 = 0u;
                    v328 = 0u;
                    v329 = 0u;
                    v297 = v143;
                    objc_msgSend(v143, "level1Topics");
                    v146 = (void *)objc_claimAutoreleasedReturnValue();
                    v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v328, v354, 16);
                    if (v147)
                    {
                      v148 = v147;
                      v149 = *(_QWORD *)v329;
                      do
                      {
                        for (j = 0; j != v148; ++j)
                        {
                          if (*(_QWORD *)v329 != v149)
                            objc_enumerationMutation(v146);
                          v151 = *(void **)(*((_QWORD *)&v328 + 1) + 8 * j);
                          objc_msgSend(*(id *)(v7 + 464), "interactionExtractedTopicFromAttachment");
                          v152 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v151, "topicId");
                          v153 = (void *)objc_claimAutoreleasedReturnValue();
                          +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v152, v153);
                          v154 = (void *)objc_claimAutoreleasedReturnValue();

                          v155 = -[BMEvent initWithStartDate:endDate:item:]([BMEvent alloc], "initWithStartDate:endDate:item:", v310, v43, v154);
                          BMLog();
                          v156 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
                          {
                            objc_msgSend(v151, "title");
                            v157 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v151, "topicId");
                            v158 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412546;
                            v373 = v157;
                            v374 = 2112;
                            v375 = v158;
                            _os_log_impl(&dword_2147C2000, v156, OS_LOG_TYPE_INFO, "Topic extracted from content URL via contextKit: %@, %@", buf, 0x16u);

                            v7 = 0x24D21E000;
                          }

                          objc_msgSend(v309, "addObject:", v155);
                        }
                        v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v328, v354, 16);
                      }
                      while (v148);
                    }

                    self = v293;
                    v5 = v294;
                    v104 = v295;
                    v159 = v299;
LABEL_96:

                    goto LABEL_97;
                  }
                }
                goto LABEL_97;
              }
            }
            else
            {

            }
          }
          BMLog();
          v160 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
            -[BMInteractionProvider interactionEventsForTypes:error:].cold.2(&v326, v327);

          -[BMInteractionProvider bmMiningTaskConfig](self, "bmMiningTaskConfig");
          v161 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v161)
          {
            BMLog();
            v159 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
              -[BMInteractionProvider interactionEventsForTypes:error:].cold.1(&v324, v325);
            goto LABEL_96;
          }
LABEL_97:
          v105 = v307 + 1;
        }
        while ((void *)(v307 + 1) != context);
        context = (void *)objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v334, v357, 16);
      }
      while (context);
LABEL_99:

      objc_msgSend(*(id *)(v7 + 464), "interactionPhotoScene");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = objc_msgSend(v5, "containsObject:", v162);

      if (v163)
      {
        v164 = (void *)MEMORY[0x24BDBCEB8];
        objc_msgSend(v290, "attachments");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "arrayWithCapacity:", objc_msgSend(v165, "count"));
        v308 = (void *)objc_claimAutoreleasedReturnValue();

        v322 = 0u;
        v323 = 0u;
        v320 = 0u;
        v321 = 0u;
        objc_msgSend(v290, "attachments");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v320, v353, 16);
        if (v167)
        {
          v168 = v167;
          v169 = *(_QWORD *)v321;
          do
          {
            for (k = 0; k != v168; ++k)
            {
              if (*(_QWORD *)v321 != v169)
                objc_enumerationMutation(v166);
              v171 = *(void **)(*((_QWORD *)&v320 + 1) + 8 * k);
              objc_msgSend(v171, "identifier");
              v172 = (void *)objc_claimAutoreleasedReturnValue();

              if (v172)
              {
                objc_msgSend(v171, "identifier");
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v173, "UUIDString");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v308, "addObject:", v174);

              }
            }
            v168 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v320, v353, 16);
          }
          while (v168);
        }

        v175 = v308;
        if (objc_msgSend(v308, "count"))
        {
          v176 = v308;
          v177 = v280;
          v178 = (void *)MEMORY[0x2199D5B54]();
          if (v176 && objc_msgSend(v176, "count"))
          {
            contexta = v178;
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            v362 = 0u;
            v363 = 0u;
            v364 = 0u;
            v365 = 0u;
            v180 = v176;
            v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v362, buf, 16);
            if (v181)
            {
              v182 = v181;
              v183 = *(_QWORD *)v363;
              do
              {
                for (m = 0; m != v182; ++m)
                {
                  if (*(_QWORD *)v363 != v183)
                    objc_enumerationMutation(v180);
                  objc_msgSend(MEMORY[0x24BDE3488], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v362 + 1) + 8 * m));
                  v185 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v177, "objectForKeyedSubscript:", v185);
                  v186 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v179, "addObjectsFromArray:", v186);
                }
                v182 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v362, buf, 16);
              }
              while (v182);
            }

            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            v347 = 0u;
            v348 = 0u;
            v349 = 0u;
            v350 = 0u;
            v188 = v179;
            v189 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v347, v368, 16);
            if (v189)
            {
              v190 = v189;
              v191 = *(_QWORD *)v348;
LABEL_121:
              v192 = 0;
              while (1)
              {
                if (*(_QWORD *)v348 != v191)
                  objc_enumerationMutation(v188);
                objc_msgSend(*(id *)(*((_QWORD *)&v347 + 1) + 8 * v192), "objectForKeyedSubscript:", CFSTR("localIdentifier"));
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                v194 = v193;
                if (v193 && objc_msgSend(v193, "length"))
                  objc_msgSend(v187, "addObject:", v194);
                v195 = objc_msgSend(v187, "count");

                if (v195 == 4)
                  break;
                if (v190 == ++v192)
                {
                  v190 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v347, v368, 16);
                  if (v190)
                    goto LABEL_121;
                  break;
                }
              }
            }

            BMLog();
            v196 = objc_claimAutoreleasedReturnValue();
            v5 = v294;
            if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
            {
              v260 = objc_msgSend(v187, "count");
              *(_DWORD *)v369 = 138412546;
              *(_QWORD *)&v369[4] = v187;
              *(_WORD *)&v369[12] = 2048;
              *(_QWORD *)&v369[14] = v260;
              _os_log_debug_impl(&dword_2147C2000, v196, OS_LOG_TYPE_DEBUG, "People Array = %@,%lu", v369, 0x16u);
            }

            v197 = (void *)objc_msgSend(v187, "copy");
            self = v293;
            v178 = contexta;
          }
          else
          {
            v197 = (void *)MEMORY[0x24BDBD1A8];
          }
          objc_autoreleasePoolPop(v178);

          v316 = 0u;
          v317 = 0u;
          v318 = 0u;
          v319 = 0u;
          contextb = v197;
          v198 = objc_msgSend(contextb, "countByEnumeratingWithState:objects:count:", &v316, v352, 16);
          if (v198)
          {
            v199 = v198;
            v200 = *(_QWORD *)v317;
            do
            {
              for (n = 0; n != v199; ++n)
              {
                if (*(_QWORD *)v317 != v200)
                  objc_enumerationMutation(contextb);
                v202 = *(_QWORD *)(*((_QWORD *)&v316 + 1) + 8 * n);
                +[BMItemType interactionPhotoContact](BMItemType, "interactionPhotoContact");
                v203 = (void *)objc_claimAutoreleasedReturnValue();
                +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v203, v202);
                v204 = (void *)objc_claimAutoreleasedReturnValue();

                v205 = -[BMEvent initWithStartDate:endDate:item:]([BMEvent alloc], "initWithStartDate:endDate:item:", v310, v43, v204);
                objc_msgSend(v309, "addObject:", v205);

              }
              v199 = objc_msgSend(contextb, "countByEnumeratingWithState:objects:count:", &v316, v352, 16);
            }
            while (v199);
          }

          if (!objc_msgSend(contextb, "count"))
          {
            v206 = v306;
            if (!v306)
            {
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v207 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v207, "URLForResource:withExtension:", CFSTR("blacklistedPhotoScenes"), CFSTR("plist"));
              v208 = (void *)objc_claimAutoreleasedReturnValue();

              v315 = 0;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfURL:error:", v208, &v315);
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              v209 = v315;
              if (v209)
              {
                BMLog();
                v210 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v210, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v373 = v208;
                  v374 = 2112;
                  v375 = v209;
                  _os_log_error_impl(&dword_2147C2000, v210, OS_LOG_TYPE_ERROR, "Error loading photo scene blacklist from URL %@, %@", buf, 0x16u);
                }

              }
            }
            v211 = v176;
            v212 = v206;
            v213 = (void *)MEMORY[0x2199D5B54]();
            v306 = v212;
            if (v176 && (v214 = objc_msgSend(v211, "count"), v212))
            {
              v215 = (void *)MEMORY[0x24BDBD1A8];
              if (v214)
              {
                v279 = v213;
                v216 = (void *)MEMORY[0x24BDE3570];
                objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
                v217 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v216, "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", v217);
                v218 = (void *)objc_claimAutoreleasedReturnValue();

                v376[0] = v276;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v376, 1);
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v218, "setFetchPropertySets:", v219);

                v291 = v211;
                v278 = v218;
                objc_msgSend(MEMORY[0x24BDE3488], "fetchAssetsWithLocalIdentifiers:options:", v211, v218);
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
                v221 = (void *)objc_claimAutoreleasedReturnValue();
                v347 = 0u;
                v348 = 0u;
                v349 = 0u;
                v350 = 0u;
                v277 = v220;
                objc_msgSend(v220, "fetchedObjects");
                v296 = (id)objc_claimAutoreleasedReturnValue();
                v222 = v306;
                v300 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v347, buf, 16);
                if (v300)
                {
                  v298 = *(_QWORD *)v348;
                  do
                  {
                    v223 = 0;
                    do
                    {
                      if (*(_QWORD *)v348 != v298)
                        objc_enumerationMutation(v296);
                      v302 = v223;
                      v224 = *(void **)(*((_QWORD *)&v347 + 1) + 8 * v223);
                      memset(v369, 0, sizeof(v369));
                      v370 = 0u;
                      v371 = 0u;
                      objc_msgSend(v224, "sceneClassifications");
                      v225 = (void *)objc_claimAutoreleasedReturnValue();
                      v226 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", v369, v368, 16);
                      if (v226)
                      {
                        v227 = v226;
                        v228 = **(_QWORD **)&v369[16];
                        do
                        {
                          for (ii = 0; ii != v227; ++ii)
                          {
                            if (**(_QWORD **)&v369[16] != v228)
                              objc_enumerationMutation(v225);
                            v230 = *(void **)(*(_QWORD *)&v369[8] + 8 * ii);
                            objc_msgSend(v230, "confidence");
                            v232 = v231;
                            v233 = objc_msgSend(v230, "sceneIdentifier");
                            objc_msgSend(MEMORY[0x24BE72440], "sharedTaxonomy");
                            v234 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v234, "nodeForSceneClassId:", v233);
                            v235 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v235, "name");
                            v236 = objc_claimAutoreleasedReturnValue();
                            v237 = (void *)v236;
                            if (v235)
                              v238 = v236 == 0;
                            else
                              v238 = 1;
                            if (!v238 && (objc_msgSend(v222, "containsObject:", v236) & 1) == 0)
                            {
                              objc_msgSend(v235, "highPrecisionThreshold");
                              if (v232 >= v239)
                              {
                                objc_msgSend(v235, "highRecallThreshold");
                                if (v232 >= v240)
                                {
                                  v367[0] = v237;
                                  v366[0] = CFSTR("name");
                                  v366[1] = CFSTR("confidence");
                                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v232);
                                  v241 = (void *)objc_claimAutoreleasedReturnValue();
                                  v367[1] = v241;
                                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v367, v366, 2);
                                  v242 = (void *)objc_claimAutoreleasedReturnValue();

                                  v243 = objc_msgSend(v221, "indexOfObject:inSortedRange:options:usingComparator:", v242, 0, objc_msgSend(v221, "count"), 1024, &__block_literal_global_12);
                                  if (v243 != 0x7FFFFFFFFFFFFFFFLL)
                                    objc_msgSend(v221, "insertObject:atIndex:", v242, v243);
                                  if ((unint64_t)objc_msgSend(v221, "count") >= 5)
                                    objc_msgSend(v221, "removeLastObject");

                                  v222 = v306;
                                }
                              }
                            }

                          }
                          v227 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", v369, v368, 16);
                        }
                        while (v227);
                      }

                      v223 = v302 + 1;
                    }
                    while (v302 + 1 != v300);
                    v300 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v347, buf, 16);
                  }
                  while (v300);
                }

                objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v221, "count"));
                v244 = (void *)objc_claimAutoreleasedReturnValue();
                v343 = 0u;
                v344 = 0u;
                v345 = 0u;
                v346 = 0u;
                v245 = v221;
                v246 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v343, &v362, 16);
                self = v293;
                v5 = v294;
                if (v246)
                {
                  v247 = v246;
                  v248 = *(_QWORD *)v344;
                  do
                  {
                    for (jj = 0; jj != v247; ++jj)
                    {
                      if (*(_QWORD *)v344 != v248)
                        objc_enumerationMutation(v245);
                      objc_msgSend(*(id *)(*((_QWORD *)&v343 + 1) + 8 * jj), "objectForKeyedSubscript:", CFSTR("name"));
                      v250 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v244, "addObject:", v250);

                    }
                    v247 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v343, &v362, 16);
                  }
                  while (v247);
                }

                v215 = (void *)objc_msgSend(v244, "copy");
                v211 = v291;
                v213 = v279;
              }
            }
            else
            {
              v215 = (void *)MEMORY[0x24BDBD1A8];
            }
            objc_autoreleasePoolPop(v213);

            v311 = 0u;
            v312 = 0u;
            v313 = 0u;
            v314 = 0u;
            v251 = v215;
            v252 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v311, v351, 16);
            if (v252)
            {
              v253 = v252;
              v254 = *(_QWORD *)v312;
              do
              {
                for (kk = 0; kk != v253; ++kk)
                {
                  if (*(_QWORD *)v312 != v254)
                    objc_enumerationMutation(v251);
                  v256 = *(_QWORD *)(*((_QWORD *)&v311 + 1) + 8 * kk);
                  +[BMItemType interactionPhotoScene](BMItemType, "interactionPhotoScene");
                  v257 = (void *)objc_claimAutoreleasedReturnValue();
                  +[BMItem itemWithType:stringValue:](BMItem, "itemWithType:stringValue:", v257, v256);
                  v258 = (void *)objc_claimAutoreleasedReturnValue();

                  v259 = -[BMEvent initWithStartDate:endDate:item:]([BMEvent alloc], "initWithStartDate:endDate:item:", v310, v43, v258);
                  objc_msgSend(v309, "addObject:", v259);

                }
                v253 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v311, v351, 16);
              }
              while (v253);
            }

          }
          v7 = 0x24D21E000;

          v175 = v308;
        }

      }
      v34 = v284;
      v37 = v288;
      i = v289;
LABEL_197:

      objc_autoreleasePoolPop(v37);
    }
    v286 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v338, v358, 16);
  }
  while (v286);
LABEL_203:

  v262 = (void *)objc_msgSend(v309, "copy");
LABEL_204:

  objc_autoreleasePoolPop(v34);
  if (a4)
    *a4 = objc_retainAutorelease(v267);
  v261 = v262;

LABEL_207:
  return v261;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (id)contextKitClient
{
  return self->_contextKitClient;
}

- (void)setContextKitClient:(id)a3
{
  objc_storeStrong(&self->_contextKitClient, a3);
}

- (BMMiningTaskConfig)bmMiningTaskConfig
{
  return (BMMiningTaskConfig *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBmMiningTaskConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmMiningTaskConfig, 0);
  objc_storeStrong(&self->_contextKitClient, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
}

- (void)interactionEventsForTypes:(_BYTE *)a1 error:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_0_2(&dword_2147C2000, v2, v3, "ContextKit usage is blocked due to missing config file ", v4);
}

- (void)interactionEventsForTypes:(_BYTE *)a1 error:(_BYTE *)a2 .cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_0_2(&dword_2147C2000, v2, v3, "ContextKit is NOT being used to extract topic factor from interactions", v4);
}

- (void)interactionEventsForTypes:(_QWORD *)a3 error:(NSObject *)a4 .cold.3(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_2147C2000, a4, OS_LOG_TYPE_ERROR, "ContextKit topic extraction failed with error %@", a1, 0xCu);

}

- (void)interactionEventsForTypes:(_BYTE *)a1 error:(_BYTE *)a2 .cold.4(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_0_2(&dword_2147C2000, v2, v3, "ContextKit is being used to extract topic factor from interactions", v4);
}

@end
