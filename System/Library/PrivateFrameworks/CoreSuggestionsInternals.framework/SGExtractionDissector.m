@implementation SGExtractionDissector

- (SGExtractionDissector)init
{
  SGExtractionDissector *v2;
  void *v3;
  SGExtractionDissector *WeakRetained;
  SGExtractionDissector *v5;
  SGExtractionDissector *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *classifierCache;
  uint64_t v14;
  GDXPCKnosisService *knosisService;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SGExtractionDissector;
  v2 = -[SGExtractionDissector init](&v17, sel_init);
  if (!v2)
    goto LABEL_7;
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  WeakRetained = (SGExtractionDissector *)objc_loadWeakRetained(&sharedInstance_23381);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
  }
  else
  {
    v7 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF8FBD48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.reversetemplated"), 0);
    objc_storeStrong((id *)&v2->_xpcConnection, v9);
    objc_msgSend(v9, "setRemoteObjectInterface:", v8);
    objc_msgSend(v9, "resume");

    objc_autoreleasePoolPop(v7);
    v10 = objc_alloc(MEMORY[0x1E0D815F0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    classifierCache = v2->_classifierCache;
    v2->_classifierCache = (_PASLock *)v12;

    objc_storeWeak(&sharedInstance_23381, v2);
    v2->shouldExtractFromFwdMail = _os_feature_enabled_impl();
  }

  objc_sync_exit(v3);
  if (!v5)
  {
    v14 = objc_opt_new();
    knosisService = v2->knosisService;
    v2->knosisService = (GDXPCKnosisService *)v14;

LABEL_7:
    v5 = v2;
  }

  return v5;
}

- (void)dealloc
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  objc_super v5;

  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection invalidate](xpcConnection, "invalidate");
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SGExtractionDissector;
  -[SGExtractionDissector dealloc](&v5, sel_dealloc);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  SGReverseTemplateJS *reverseTemplateJSNoXPC;
  NSXPCConnection *xpcConnection;

  reverseTemplateJSNoXPC = self->_reverseTemplateJSNoXPC;
  if (reverseTemplateJSNoXPC)
    return reverseTemplateJSNoXPC;
  xpcConnection = self->_xpcConnection;
  if (!a3)
    a3 = &__block_literal_global_23379;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)entityForOutputItem:(id)a3 parentEntity:(id)a4 outputExceptions:(id)a5 outputInfos:(id)a6
{
  return -[SGExtractionDissector entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:](self, "entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:", a3, 0, a4, a5, a6, 0);
}

- (id)entityForOutputItem:(id)a3 parentEntity:(id)a4 outputExceptions:(id)a5 outputInfos:(id)a6 interaction:(id)a7
{
  return -[SGExtractionDissector entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:](self, "entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:", a3, 0, a4, a5, a6, a7);
}

- (id)entityForOutputItem:(id)a3 withSiblings:(id)a4 parentEntity:(id)a5 outputExceptions:(id)a6 outputInfos:(id)a7 interaction:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  int v79;
  NSObject *v80;
  void *v81;
  SGPipelineEnrichment *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  char v97;
  void *v98;
  void *v99;
  __CFString *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  NSObject *v105;
  const __CFString *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  uint64_t v114;
  SGPipelineEnrichment *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  __CFString *v121;
  __CFString *v122;
  id v123;
  void *v124;
  uint64_t v125;
  NSObject *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  const __CFString *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  char v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  const __CFString *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  const __CFString *v161;
  void *v162;
  __CFString *v163;
  void *v164;
  void *v165;
  int v166;
  char v167;
  void *v168;
  void *v169;
  NSObject *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  int v185;
  NSObject *v186;
  NSObject *v187;
  void *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  void *v192;
  void *v193;
  void *v194;
  char v195;
  void *v196;
  double v197;
  double v198;
  double v199;
  double v200;
  void *v201;
  double v202;
  double v203;
  unint64_t v204;
  void *v205;
  void *v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  int v211;
  void *v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void *v216;
  char isKindOfClass;
  SGExtractionDissector *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  char v223;
  void *v224;
  __CFString *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  id v231;
  void *v232;
  void *v233;
  uint64_t v234;
  void *v235;
  id v236;
  void *v237;
  uint64_t v238;
  id v239;
  uint64_t v240;
  NSObject *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  id v248;
  void *v249;
  void *v250;
  __CFString *v251;
  void *v252;
  void *v253;
  void *v254;
  NSObject *v255;
  void *v257;
  void *v258;
  void *context;
  void *contexta;
  int v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v267;
  id v268;
  char v269;
  id v270;
  id v271;
  void *v272;
  void *v273;
  int v274;
  __CFString *v275;
  id v276;
  void *v277;
  void (**v278)(_QWORD, _QWORD);
  void *v279;
  void *v280;
  void *v281;
  SEL v282;
  void *v283;
  id v284;
  void *v285;
  void *v286;
  id v287;
  id v288;
  void *v289;
  id v290;
  void *v291;
  _QWORD v292[4];
  id v293;
  id v294;
  char v295;
  _QWORD v296[4];
  id v297;
  id v298;
  uint8_t buf[4];
  __CFString *v300;
  __int16 v301;
  void *v302;
  __int16 v303;
  void *v304;
  _QWORD v305[3];

  v305[1] = *MEMORY[0x1E0C80C00];
  v290 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v287 = a7;
  v284 = a8;
  v289 = v14;
  if (v14)
  {
    if ((objc_msgSend(v14, "containsObject:", v290) & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v14, "arrayByAddingObject:", v290);
      v18 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v17);
      v289 = (void *)v18;
    }
  }
  else
  {
    v305[0] = v290;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v305, 1);
    v289 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("transportation"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v291 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("event"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("cancelled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__paramsOnceToken != -1)
    dispatch_once(&entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__paramsOnceToken, &__block_literal_global_375);
  v23 = (void *)MEMORY[0x1C3BD4F6C]();
  v24 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__paramsSharedKeySet);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v23);
  v288 = v25;

  v286 = v16;
  v274 = v22;
  if (!v291
    || (objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("graph")),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "isEqual:", CFSTR("iata")),
        v26,
        !v27))
  {
    v60 = v289;
    v61 = 0;
    v283 = 0;
    v285 = 0;
    goto LABEL_30;
  }
  v282 = a2;
  v268 = v15;
  v28 = MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("carrier"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGFlightData sharedInstance](SGFlightData, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("code"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v280 = v20;
  if (v31)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("code"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v288, "setObject:forKeyedSubscript:", v32, &unk_1E7E0C7B8);
  }
  else
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("name"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v89)
    {
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("name"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "carrierIataCodeForCarrierName:", v90);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(v288, "setObject:forKeyedSubscript:", v32, &unk_1E7E0C7B8);
        objc_msgSend(v287, "addObject:", CFSTR("flightDataResolvedCarrierCode"));
      }
      else
      {
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("name"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v288, "setObject:forKeyedSubscript:", v131, &unk_1E7E0C7B8);

      }
    }
    else
    {
      v32 = 0;
    }
  }
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("name"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("name"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v288, "setObject:forKeyedSubscript:", v34, &unk_1E7E0C7D0);
LABEL_13:

    goto LABEL_14;
  }
  if (v32)
  {
    objc_msgSend(v30, "nameForCarrier:", v32);
    v91 = objc_claimAutoreleasedReturnValue();
    if (v91)
    {
      v34 = (void *)v91;
      objc_msgSend(v288, "setObject:forKeyedSubscript:", v91, &unk_1E7E0C7D0);
      objc_msgSend(v287, "addObject:", CFSTR("flightDataResolvedCarrierName"));
      goto LABEL_13;
    }
    objc_msgSend(v288, "setObject:forKeyedSubscript:", v32, &unk_1E7E0C7D0);
  }
LABEL_14:
  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");
  objc_msgSend(v291, "setObject:forKeyedSubscript:", v36, CFSTR("origin"));

  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "mutableCopy");
  objc_msgSend(v291, "setObject:forKeyedSubscript:", v38, CFSTR("destination"));

  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("code"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("code"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
    v43 = v40 == 0;
  else
    v43 = 1;
  if (v43 && !v32)
    objc_msgSend(v287, "addObject:", CFSTR("flightMissingCarrierCode"));
  v296[0] = MEMORY[0x1E0C809B0];
  v296[1] = 3221225472;
  v296[2] = __112__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction___block_invoke_399;
  v296[3] = &unk_1E7DB0AD0;
  v297 = v289;
  v298 = v29;
  v276 = v298;
  v278 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v296);
  v44 = v288;
  if (v40)
  {
    v45 = v268;
    goto LABEL_112;
  }
  v45 = v268;
  if (!v32)
    goto LABEL_112;
  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("name"));
  v47 = objc_claimAutoreleasedReturnValue();
  if (!v47)
  {
    v40 = 0;
LABEL_110:

    goto LABEL_111;
  }
  v48 = (void *)v47;
  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("routeDesignation"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("name"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v278)[2](v278, v50);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("routeDesignation"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "numberWithInteger:", objc_msgSend(v52, "integerValue"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v46, "containsObject:", v53);

    if ((v54 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "handleFailureInMethod:object:file:lineNumber:description:", v282, self, CFSTR("SGExtractionDissector.m"), 433, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[flightNumbers containsObject:@([transportationDict[@\"routeDesignation\"] integerValue])]"));

    }
    objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("name"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("routeDesignation"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "airportCodeForAirportName:flightCarrier:flightNumber:otherKnownFlightsToAirport:outputInfos:", v56, v32, (unsigned __int16)objc_msgSend(v57, "integerValue"), v46, v287);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v40, CFSTR("code"));

      v59 = CFSTR("flightDataResolvedAirportCode");
    }
    else
    {
      v59 = CFSTR("flightMissingData");
    }
    v45 = v268;
    objc_msgSend(v287, "addObject:", v59);
    goto LABEL_110;
  }
LABEL_111:
  v44 = v288;
LABEL_112:
  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("name"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (v133)
  {
    objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("name"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v135, &unk_1E7E0C7E8);

    if (!v40)
    {
LABEL_118:
      v285 = 0;
      if (v42)
        goto LABEL_138;
LABEL_126:
      if (!v32)
        goto LABEL_138;
      objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("name"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("routeDesignation"));
        v140 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v140)
        {
          v42 = 0;
LABEL_137:
          v44 = v288;
          goto LABEL_138;
        }
        objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("name"));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v278)[2](v278, v142);
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        v143 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("routeDesignation"));
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "numberWithInteger:", objc_msgSend(v144, "integerValue"));
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = objc_msgSend(v139, "containsObject:", v145);

        if ((v146 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v258, "handleFailureInMethod:object:file:lineNumber:description:", v282, self, CFSTR("SGExtractionDissector.m"), 472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[flightNumbers containsObject:@([transportationDict[@\"routeDesignation\"] integerValue])]"));

        }
        objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("name"));
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("routeDesignation"));
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "airportCodeForAirportName:flightCarrier:flightNumber:otherKnownFlightsToAirport:outputInfos:", v148, v32, (unsigned __int16)objc_msgSend(v149, "integerValue"), v139, v287);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "setObject:forKeyedSubscript:", v42, CFSTR("code"));

          v151 = CFSTR("flightDataResolvedAirportCode");
        }
        else
        {
          v151 = CFSTR("flightMissingData");
        }
        v45 = v268;
        objc_msgSend(v287, "addObject:", v151);
      }

      goto LABEL_137;
    }
  }
  else
  {
    if (!v40)
      goto LABEL_118;
    objc_msgSend(v30, "bestLocalizedNameForAirport:", v40);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (v136)
    {
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v136, &unk_1E7E0C7E8);
      objc_msgSend(v287, "addObject:", CFSTR("flightDataResolvedAirportName"));
    }
    else
    {
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v40, &unk_1E7E0C7E8);
    }

  }
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v40, &unk_1E7E0C788);
  objc_msgSend(v30, "timezoneOlsonCodeForAirport:", v40);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if (v137)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v137);
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = CFSTR("flightDataResolvedAirportTZ");
  }
  else
  {
    v285 = 0;
    v138 = CFSTR("flightMissingTZForAirportCode");
  }
  objc_msgSend(v287, "addObject:", v138);

  if (!v42)
    goto LABEL_126;
LABEL_138:
  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "objectForKeyedSubscript:", CFSTR("name"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  if (v153)
  {
    objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("name"));
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v155, &unk_1E7E0C800);

    if (!v42)
      goto LABEL_144;
  }
  else
  {
    if (!v42)
    {
LABEL_144:
      v157 = v45;
      v158 = v30;
      v159 = (void *)v28;
      v283 = 0;
      goto LABEL_151;
    }
    objc_msgSend(v30, "bestLocalizedNameForAirport:", v42);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    if (v156)
    {
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v156, &unk_1E7E0C800);
      objc_msgSend(v287, "addObject:", CFSTR("flightDataResolvedAirportName"));
    }
    else
    {
      objc_msgSend(v44, "setObject:forKeyedSubscript:", v42, &unk_1E7E0C800);
    }

  }
  v157 = v45;
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v42, &unk_1E7E0C7A0);
  objc_msgSend(v30, "timezoneOlsonCodeForAirport:", v42);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v30;
  if (v160)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v160);
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = CFSTR("flightDataResolvedAirportTZ");
  }
  else
  {
    v283 = 0;
    v161 = CFSTR("flightMissingTZForAirportCode");
  }
  v159 = (void *)v28;
  objc_msgSend(v287, "addObject:", v161);

LABEL_151:
  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "objectForKeyedSubscript:", CFSTR("code"));
  v163 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "objectForKeyedSubscript:", CFSTR("code"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  v166 = objc_msgSend(v165, "isEqual:", v163);
  v167 = v166;
  v168 = v159;
  v169 = v158;
  v15 = v157;
  if (v166)
  {
    sgEventsLogHandle();
    v170 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("templateName"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("templateShortName"));
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v300 = v163;
      v301 = 2112;
      v302 = v171;
      v303 = 2112;
      v304 = v172;
      _os_log_debug_impl(&dword_1C3607000, v170, OS_LOG_TYPE_DEBUG, "The same origin and destination: %@ (template: %@, short %@)", buf, 0x20u);

      v15 = v268;
    }

    objc_msgSend(v286, "addObject:", CFSTR("flightHasSameOriginAndDestination"));
  }

  objc_autoreleasePoolPop(v168);
  v81 = v286;
  if ((v167 & 1) == 0)
  {
    v60 = v289;
    v61 = 1;
    v20 = v280;
    v24 = 0x1E0C99000;
LABEL_30:
    objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("title"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGExtractionDissector addParams:toParameterizedString:allowAlternatives:](SGExtractionDissector, "addParams:toParameterizedString:allowAlternatives:", v288, v62, 1);
    v279 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("groupId"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGExtractionDissector addParams:toParameterizedString:](SGExtractionDissector, "addParams:toParameterizedString:", v288, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v277 = v64;
    v289 = v60;
    if (!objc_msgSend(v64, "length"))
    {
      sgEventsLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v80, OS_LOG_TYPE_ERROR, "SGExtractionDissector - groupId is empty. Unable to create Duplicate keys", buf, 2u);
      }

      v81 = v286;
      objc_msgSend(v286, "addObject:", CFSTR("emptyGroupId"));
      v82 = 0;
      v83 = v20;
      goto LABEL_252;
    }
    objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("fallbackGroupId"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGExtractionDissector addParams:toParameterizedString:](SGExtractionDissector, "addParams:toParameterizedString:", v288, v65);
    v267 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("notes"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGExtractionDissector addParams:toParameterizedString:](SGExtractionDissector, "addParams:toParameterizedString:", v288, v66);
    v265 = (void *)objc_claimAutoreleasedReturnValue();

    v281 = v20;
    if (v291)
    {
      v269 = v61;
      v67 = (void *)MEMORY[0x1E0C99D78];
      objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("dateTime"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "sg_dateComponentsFromISO8601String:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v71 = (void *)MEMORY[0x1E0C99D78];
      objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("dateTime"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "sg_dateComponentsFromISO8601String:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      v75 = v70;
      objc_msgSend(v70, "timeZone");
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v76 && v285)
        objc_msgSend(v70, "setTimeZone:", v285);
      objc_msgSend(v74, "timeZone");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      v78 = 0;
      v273 = v74;
      if (!v77 && v283)
      {
        objc_msgSend(v74, "setTimeZone:");
        v78 = 0;
      }
      v79 = v274;
      v24 = 0x1E0C99000;
      v61 = v269;
    }
    else if (v20)
    {
      v270 = v15;
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("start"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = v274;
      if (v84)
      {
        v85 = (void *)MEMORY[0x1E0C99D78];
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("start"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("dateTime"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "sg_dateComponentsFromISO8601String:", v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v88 = 0;
      }
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("end"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v92)
        goto LABEL_58;
      v93 = (void *)MEMORY[0x1E0C99D78];
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("end"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("dateTime"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "sg_dateComponentsFromISO8601String:", v95);
      v96 = objc_claimAutoreleasedReturnValue();

      v273 = (void *)v96;
      if (v96)
      {
        v78 = 0;
        v75 = v88;
      }
      else
      {
LABEL_58:
        v75 = v88;
        if (objc_msgSend(v88, "hour") == 0x7FFFFFFFFFFFFFFFLL)
        {
          v273 = 0;
          v78 = 0;
        }
        else
        {
          v273 = (void *)objc_msgSend(v88, "copy");
          objc_msgSend(v273, "setMinute:", objc_msgSend(v273, "minute") + 90);
          v78 = 1;
        }
      }
      v15 = v270;
    }
    else
    {
      v75 = 0;
      v273 = 0;
      v78 = 0;
      v79 = v274;
    }
    if (v75)
      v97 = 1;
    else
      v97 = v79;
    if ((v97 & 1) != 0)
    {
      v261 = v78;
      if (entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__locationsOnceToken != -1)
        dispatch_once(&entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__locationsOnceToken, &__block_literal_global_456);
      v98 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(*(id *)(v24 + 3592), "dictionaryWithSharedKeySet:", entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__locationsSharedKeySet);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v98);
      v100 = v99;

      v101 = (void *)objc_opt_new();
      if (v20
        && (objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("location")),
            v102 = (void *)objc_claimAutoreleasedReturnValue(),
            v102,
            v102))
      {
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("location"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = &unk_1E7E0C788;
      }
      else
      {
        if (!v291)
          goto LABEL_83;
        objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();

        if (v108)
        {
          objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("origin"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString setObject:forKeyedSubscript:](v100, "setObject:forKeyedSubscript:", v109, &unk_1E7E0C7B8);

        }
        objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v110)
        {
LABEL_83:
          v292[0] = MEMORY[0x1E0C809B0];
          v292[1] = 3221225472;
          v292[2] = __112__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction___block_invoke_2;
          v292[3] = &unk_1E7DB0B18;
          v295 = v61;
          v111 = v287;
          v293 = v111;
          v112 = v101;
          v294 = v112;
          -[__CFString enumerateKeysAndObjectsUsingBlock:](v100, "enumerateKeysAndObjectsUsingBlock:", v292);
          objc_msgSend(v15, "duplicateKey");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDuplicateKey duplicateKeyForPseudoEventWithGroupId:parentKey:](SGDuplicateKey, "duplicateKeyForPseudoEventWithGroupId:parentKey:", v277, v113);
          v114 = objc_claimAutoreleasedReturnValue();

          v263 = (void *)v114;
          v115 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:]([SGPipelineEnrichment alloc], "initWithDuplicateKey:title:parent:", v114, v279, v15);
          if (v267)
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extraKey:");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v115, "addTag:", v116);

          }
          -[SGEntity setState:](v115, "setState:", 1);
          if (v79)
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedEventCancellation");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v115, "addTag:", v117);

          }
          objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("category"));
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v262 = v118;
          if (objc_msgSend(v118, "isEqual:", CFSTR("flight")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedFlight");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v118, "isEqual:", CFSTR("bus")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedBus");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v118, "isEqual:", CFSTR("train")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedTrain");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v118, "isEqual:", CFSTR("boat")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedBoat");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v118, "isEqual:", CFSTR("hotel")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedHotel");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v118, "isEqual:", CFSTR("carRental")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedCarRental");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v118, "isEqual:", CFSTR("ticket")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedTicket");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v118, "isEqual:", CFSTR("movie")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedMovie");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v118, "isEqual:", CFSTR("food")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedFood");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!objc_msgSend(v118, "isEqual:", CFSTR("social")))
              goto LABEL_172;
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedSocial");
            v119 = objc_claimAutoreleasedReturnValue();
          }
          v173 = (void *)v119;
          -[SGEntity addTag:](v115, "addTag:", v119);

LABEL_172:
          v264 = v75;
          objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("geocodingMode"));
          v174 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v174)
            goto LABEL_183;
          objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("geocodingMode"));
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v175, "isEqual:", CFSTR("address")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "geocodingModeAddressOnly");
            v176 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v175, "isEqual:", CFSTR("poi")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "geocodingModePOIOnly");
            v176 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v175, "isEqual:", CFSTR("address+poi")))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "geocodingModeAddressThenPOI");
            v176 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!objc_msgSend(v175, "isEqual:", CFSTR("canonical")))
            {
LABEL_182:

LABEL_183:
              objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("ekEventAvailabilityState"));
              v178 = (void *)objc_claimAutoreleasedReturnValue();

              if (v178)
              {
                objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("ekEventAvailabilityState"));
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D197F0], "ekEventAvailabilityState:", v179);
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                -[SGEntity addTag:](v115, "addTag:", v180);

              }
              objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("poiGeocodingFilters"));
              v181 = (void *)objc_claimAutoreleasedReturnValue();

              if (v181)
              {
                objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("poiGeocodingFilters"));
                v182 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D197F0], "poiFilters:", v182);
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                -[SGEntity addTag:](v115, "addTag:", v183);

              }
              v75 = v264;
              objc_msgSend(MEMORY[0x1E0D19940], "rangeWithGregorianStartComponents:endComponents:", v264, v273);
              v184 = (void *)objc_claimAutoreleasedReturnValue();
              v185 = v79 | objc_msgSend(MEMORY[0x1E0D198F0], "showPastEvents");
              v83 = v20;
              if ((v185 & 1) == 0 && -[SGExtractionDissector _isPastEvent:](self, "_isPastEvent:", v184))
              {
                sgDeveloperLogHandle();
                v186 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C3607000, v186, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – reservation end date in the past.", buf, 2u);
                }

                objc_msgSend(v286, "addObject:", CFSTR("pastEvent"));
                if (-[SGExtractionDissector _isPastEventOverOneYear:](self, "_isPastEventOverOneYear:", v184))
                {
                  sgEventsLogHandle();
                  v187 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1C3607000, v187, OS_LOG_TYPE_DEFAULT, "SGExtractionEntity entityForOutputItem: Event is over one year in the past, processing stopped.", buf, 2u);
                  }

                  v82 = 0;
                  v81 = v286;
                  goto LABEL_250;
                }
              }
              v275 = v100;
              if (objc_msgSend(v264, "hour") == 0x7FFFFFFFFFFFFFFFLL
                && (objc_msgSend(v264, "timeZone"),
                    v188 = (void *)objc_claimAutoreleasedReturnValue(),
                    v188,
                    !v188))
              {
                v204 = 0x1E0D19000uLL;
                objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
                v205 = (void *)objc_claimAutoreleasedReturnValue();
                -[SGEntity addTag:](v115, "addTag:", v205);

                v81 = v286;
              }
              else
              {
                objc_msgSend(v264, "timeZone");
                v189 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v189)
                {
                  v190 = (void *)MEMORY[0x1C3BD4F6C]();
                  if (objc_msgSend(v112, "indexOfObjectPassingTest:", &__block_literal_global_497) == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("minDurationForAllDayIfNoTz"));
                    v191 = objc_claimAutoreleasedReturnValue();
                    if (v191)
                    {
                      v192 = (void *)v191;
                      context = v190;
                      v271 = v15;
                      objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("minDurationForAllDayIfNoTz"));
                      v193 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0C99E38], "null");
                      v194 = (void *)objc_claimAutoreleasedReturnValue();
                      v195 = objc_msgSend(v193, "isEqual:", v194);

                      if ((v195 & 1) == 0)
                      {
                        objc_msgSend(v184, "absoluteRange");
                        v196 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v196, "end");
                        v198 = v197;
                        objc_msgSend(v196, "start");
                        v200 = v198 - v199;
                        objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("minDurationForAllDayIfNoTz"));
                        v201 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v201, "doubleValue");
                        v203 = v202;

                        v83 = v20;
                        v100 = v275;
                        if (v200 < v203)
                        {
                          v81 = v286;
                          objc_msgSend(v286, "addObject:", CFSTR("noTimezone"));

                          objc_autoreleasePoolPop(context);
                          v82 = 0;
                          v15 = v271;
                          v75 = v264;
LABEL_250:

LABEL_251:
LABEL_252:

                          goto LABEL_253;
                        }
                        objc_msgSend(v111, "addObject:", CFSTR("convertedToAllDay"));
                        objc_msgSend(v264, "setHour:", 0x7FFFFFFFFFFFFFFFLL);
                        objc_msgSend(v264, "setMinute:", 0x7FFFFFFFFFFFFFFFLL);
                        objc_msgSend(v264, "setSecond:", 0x7FFFFFFFFFFFFFFFLL);
                        objc_msgSend(v264, "setNanosecond:", 0x7FFFFFFFFFFFFFFFLL);
                        objc_msgSend(v273, "setHour:", 0x7FFFFFFFFFFFFFFFLL);
                        objc_msgSend(v273, "setMinute:", 0x7FFFFFFFFFFFFFFFLL);
                        objc_msgSend(v273, "setSecond:", 0x7FFFFFFFFFFFFFFFLL);
                        objc_msgSend(v273, "setNanosecond:", 0x7FFFFFFFFFFFFFFFLL);
                        objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
                        v206 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SGEntity addTag:](v115, "addTag:", v206);

                        objc_msgSend(MEMORY[0x1E0D19940], "rangeWithGregorianStartComponents:endComponents:", v264, v273);
                        v207 = objc_claimAutoreleasedReturnValue();

                        v184 = (void *)v207;
                      }
                      v15 = v271;
                      v190 = context;
                    }
                  }
                  objc_autoreleasePoolPop(v190);
                }
                v81 = v286;
                v204 = 0x1E0D19000uLL;
              }
              if (v261)
              {
                objc_msgSend(MEMORY[0x1E0D197F0], "defaultDuration");
                v208 = (void *)objc_claimAutoreleasedReturnValue();
                -[SGEntity addTag:](v115, "addTag:", v208);

              }
              -[SGEntity setTimeRange:](v115, "setTimeRange:", v184);
              -[SGEntity tags](v115, "tags");
              v209 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
              v210 = (void *)objc_claimAutoreleasedReturnValue();
              v211 = objc_msgSend(v209, "containsObject:", v210);

              if (v211 && (objc_msgSend(v184, "isValidAllDayRange") & 1) == 0)
                __assert_rtn("-[SGExtractionDissector entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:]", "SGExtractionDissector.m", 784, "[timeRange isValidAllDayRange]");
              -[SGEntity setTitle:](v115, "setTitle:", v279);
              -[SGEntity setContent:](v115, "setContent:", v265);
              -[SGEntity locations](v115, "locations");
              v212 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v212, "addObjectsFromArray:", v112);

              objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("schemas"));
              v213 = objc_claimAutoreleasedReturnValue();
              contexta = v184;
              if (!v213)
              {
                v231 = v112;
                v232 = 0;
                objc_msgSend(v81, "addObject:", CFSTR("outputWithoutSchema"));
                v82 = 0;
LABEL_249:
                v83 = v281;
                v75 = v264;
                v100 = v275;

                v112 = v231;
                v184 = contexta;
                goto LABEL_250;
              }
              if (v284)
              {
                -[SGEntity duplicateKey](v115, "duplicateKey");
                v214 = (void *)objc_claimAutoreleasedReturnValue();
                v215 = objc_msgSend(v214, "entityType");

                if (v215 == 2)
                {
                  objc_msgSend(v284, "intent");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();

                  v218 = self;
                  if ((isKindOfClass & 1) != 0)
                  {
                    objc_msgSend(v284, "intent");
                    v219 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v219, "reservationContainerReference");
                    v220 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v220)
                    {
                      objc_msgSend(MEMORY[0x1E0D197F0], "reservationContainerReference:", v220);
                      v221 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SGEntity addTag:](v115, "addTag:", v221);

                    }
                  }
                  objc_msgSend(v284, "intentResponse");
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v223 = objc_opt_isKindOfClass();

                  if ((v223 & 1) != 0)
                  {
                    objc_msgSend(v284, "intentResponse");
                    v224 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v224, "userActivity");
                    v225 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    if (v225)
                    {
                      -[__CFString sg_serialize](v225, "sg_serialize");
                      v226 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v226)
                      {
                        objc_msgSend(MEMORY[0x1E0D197F0], "intentResponseUserActivityString:", v226);
                        v227 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v227)
                        {
                          -[SGEntity addTag:](v115, "addTag:", v227);
                        }
                        else
                        {
                          v239 = v112;
                          v240 = v213;
                          sgLogHandle();
                          v241 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v241, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v300 = v225;
                            _os_log_error_impl(&dword_1C3607000, v241, OS_LOG_TYPE_ERROR, "Could not create tag from NSUserActivity %@", buf, 0xCu);
                          }

                          v213 = v240;
                          v112 = v239;
                        }

                        v218 = self;
                      }

                    }
                  }
                  -[SGExtractionDissector getAndRemoveItemReferencesFromSchemas:](v218, "getAndRemoveItemReferencesFromSchemas:", v213);
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  v231 = v112;
                  if (objc_msgSend(v242, "count"))
                  {
                    objc_msgSend(MEMORY[0x1E0D197F0], "reservationItemReferences:", v242);
                    v243 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SGEntity addTag:](v115, "addTag:", v243);

                    objc_msgSend(v242, "firstObject");
                    v244 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SGExtractionDissector eventActivitiesForReservationWithReference:inParentEntity:interaction:](v218, "eventActivitiesForReservationWithReference:inParentEntity:interaction:", v244, v15, v284);
                    v233 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v233 = 0;
                  }

                  goto LABEL_242;
                }
              }
              -[SGEntity duplicateKey](v115, "duplicateKey");
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v228, "entityType") == 2)
              {
                -[SGEntity duplicateKey](v115, "duplicateKey");
                v229 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v229, "parentKey");
                v230 = (void *)objc_claimAutoreleasedReturnValue();
                v231 = v112;
                if (objc_msgSend(v230, "entityType") == 5)
                {

LABEL_231:
                  -[SGExtractionDissector eventActivitiesForReservationWithSchema:enrichment:](self, "eventActivitiesForReservationWithSchema:enrichment:", v213, v115);
                  v233 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_242;
                }
                -[SGEntity duplicateKey](v115, "duplicateKey");
                v234 = v213;
                v235 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v235, "parentKey");
                v236 = v15;
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                v238 = objc_msgSend(v237, "entityType");

                v15 = v236;
                v204 = 0x1E0D19000;

                v213 = v234;
                if (v238 == 17)
                  goto LABEL_231;
              }
              else
              {
                v231 = v112;

              }
              v233 = 0;
LABEL_242:
              v232 = (void *)v213;
              objc_msgSend(*(id *)(v204 + 2032), "schemaOrg:", v213);
              v245 = (void *)objc_claimAutoreleasedReturnValue();
              if (v245)
                -[SGEntity addTag:](v115, "addTag:", v245);
              v272 = v15;
              objc_msgSend(v15, "duplicateKey");
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v246, "bundleId");
              v247 = (void *)objc_claimAutoreleasedReturnValue();

              v248 = objc_alloc(MEMORY[0x1E0D19818]);
              objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("categoryType"));
              v249 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("schemas"));
              v250 = (void *)objc_claimAutoreleasedReturnValue();
              v251 = (__CFString *)objc_msgSend(v248, "initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:eventActivities:", 1, v249, v247, v250, 0, v233, 1.0);

              -[__CFString toJsonString](v251, "toJsonString");
              v252 = (void *)objc_claimAutoreleasedReturnValue();
              if (v252)
              {
                v253 = (void *)MEMORY[0x1E0D197F0];
                -[__CFString toJsonString](v251, "toJsonString");
                v254 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v253, "eventMetadata:", v254);
                v255 = objc_claimAutoreleasedReturnValue();

                -[SGEntity addTag:](v115, "addTag:", v255);
              }
              else
              {
                sgLogHandle();
                v255 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v255, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v300 = v251;
                  _os_log_error_impl(&dword_1C3607000, v255, OS_LOG_TYPE_ERROR, "Failed to convert object to JSON: %@", buf, 0xCu);
                }
              }

              objc_msgSend(v272, "creationTimestamp");
              -[SGPipelineEnrichment setCreationTimestamp:](v115, "setCreationTimestamp:");
              objc_msgSend(v272, "lastModifiedTimestamp");
              -[SGPipelineEnrichment setLastModifiedTimestamp:](v115, "setLastModifiedTimestamp:");
              v82 = v115;

              v15 = v272;
              v81 = v286;
              goto LABEL_249;
            }
            objc_msgSend(MEMORY[0x1E0D197F0], "geocodingModeAddressWithCanonicalSearch");
            v176 = objc_claimAutoreleasedReturnValue();
          }
          v177 = (void *)v176;
          -[SGEntity addTag:](v115, "addTag:", v176);

          goto LABEL_182;
        }
        objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("destination"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = &unk_1E7E0C7E8;
      }
      -[__CFString setObject:forKeyedSubscript:](v100, "setObject:forKeyedSubscript:", v103, v104);

      goto LABEL_83;
    }
    sgDeveloperLogHandle();
    v105 = objc_claimAutoreleasedReturnValue();
    v81 = v286;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v105, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – reservation start date components invalid.", buf, 2u);
    }

    v83 = v20;
    if (!os_variant_has_internal_diagnostics())
    {
      v100 = CFSTR("[redacted]");
LABEL_101:
      sgLogHandle();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("templateName"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("templateShortName"));
        v128 = v15;
        v129 = v75;
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v300 = v100;
        v301 = 2112;
        v302 = v127;
        v303 = 2112;
        v304 = v130;
        _os_log_impl(&dword_1C3607000, v126, OS_LOG_TYPE_INFO, "Couldn't parse date: %@ (template: %@, short %@)", buf, 0x20u);

        v75 = v129;
        v15 = v128;

      }
      objc_msgSend(v286, "addObject:", CFSTR("dateParseIssue"));
      v82 = 0;
      goto LABEL_251;
    }
    if (v291)
    {
      v106 = CFSTR("origin");
      v107 = v291;
    }
    else
    {
      if (!v20)
      {
        v121 = CFSTR("[redacted]");
        goto LABEL_97;
      }
      v106 = CFSTR("start");
      v107 = v20;
    }
    objc_msgSend(v107, "objectForKeyedSubscript:", v106);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("dateTime"));
    v121 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_97:
    v122 = CFSTR("[unavailable]");
    if (v121)
      v122 = v121;
    v100 = v122;

    if ((unint64_t)-[__CFString length](v100, "length") >= 0x1A)
    {
      v123 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[__CFString substringToIndex:](v100, "substringToIndex:", 25);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v123, "initWithFormat:", CFSTR("%@... (length %lu)"), v124, -[__CFString length](v100, "length"));

      v100 = (__CFString *)v125;
    }
    goto LABEL_101;
  }
  v82 = 0;
  v83 = v280;
LABEL_253:

  return v82;
}

- (id)packedJSMailMessageFromMailMessage:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v45;
  id v46;
  __CFString *v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[2];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v48 = a4;
  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("epoch"));

  objc_msgSend(v5, "from");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emailAddress");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E7DB83A8;
  v47 = v13;

  objc_msgSend(v5, "htmlContentData");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = (void *)*MEMORY[0x1E0D81688];
  if (v14)
    v16 = (void *)v14;
  v46 = v16;

  objc_msgSend((id)objc_opt_class(), "subjectFromMailMessage:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v45 = v17;
  }
  else
  {
    objc_msgSend(v5, "subject");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (__CFString *)v19;
    else
      v21 = &stru_1E7DB83A8;
    v45 = v21;

  }
  v49 = v5;
  objc_msgSend(v5, "headers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v29, "key");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v30;
        objc_msgSend(v29, "value");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v32);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v26);
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, CFSTR("from"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, CFSTR("subject"));
  v33 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("headers"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, CFSTR("html"));
  objc_msgSend(v49, "textContent");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    v36 = (const __CFString *)v34;
  else
    v36 = &stru_1E7DB83A8;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("text"));

  objc_msgSend(v49, "accountHandles");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v49, "accountHandles");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("accountHandles"));

  }
  +[SGAccountsAdapter sharedInstance](SGAccountsAdapter, "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "source");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "serverIdentifierForAccount:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v42, CFSTR("accountServerIdentifier"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("email"), CFSTR("documentType"));
  if (v48)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v48, "extractionMode"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("extractionMode"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E7E0C788, CFSTR("extractionMode"));
  }

  return v6;
}

- (id)packedJSMailMessageFromMailMessage:(id)a3
{
  return -[SGExtractionDissector packedJSMailMessageFromMailMessage:context:](self, "packedJSMailMessageFromMailMessage:context:", a3, 0);
}

- (id)packedJSTextMessageFromTextMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  v18[0] = CFSTR("epoch");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v18[1] = CFSTR("plain");
  objc_msgSend(v3, "textContent");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E7DB83A8;
  v19[1] = v10;
  v18[2] = CFSTR("from");
  objc_msgSend(v3, "author");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E7DB83A8;
  v18[3] = CFSTR("documentType");
  v19[2] = v15;
  v19[3] = CFSTR("sms");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v16;
}

- (id)packedJSInteractionFromInteraction:(id)a3 bundleIdentifier:(id)a4 creationTimestamp:(double)a5
{
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  v14[0] = CFSTR("epoch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = CFSTR("interaction");
  v14[1] = CFSTR("documentType");
  v14[2] = CFSTR("bundleID");
  if (v8)
    v11 = v8;
  else
    v11 = &stru_1E7DB83A8;
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v12;
}

- (id)packedJSURLFromURL:(id)a3 title:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "timeIntervalSince1970");
  -[SGExtractionDissector packedJSURLFromURL:title:payload:creationTimestamp:](self, "packedJSURLFromURL:title:payload:creationTimestamp:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)packedJSURLFromURL:(id)a3 title:(id)a4 payload:(id)a5 creationTimestamp:(double)a6
{
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;

  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = (__CFString *)a5;
  v12 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v9, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("www."), CFSTR("na@"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  v16 = v15;
  if (v14)
    v17 = v14;
  else
    v17 = &stru_1E7DB83A8;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("from"));
  if (v10)
    v18 = v10;
  else
    v18 = &stru_1E7DB83A8;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("subject"));
  if (v11)
    v19 = v11;
  else
    v19 = &stru_1E7DB83A8;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("html"));
  objc_msgSend(v9, "absoluteString");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_1E7DB83A8;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("url"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("epoch"));

  objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("webpage"), CFSTR("documentType"));
  objc_autoreleasePoolPop(v12);

  return v16;
}

- (id)packedJSSchemaFromSchemaOrgItems:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("schemas");
  v8[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)exceedsMaxHTMLContentLength:(unint64_t)a3
{
  NSObject *v4;
  int v6;
  unint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 > 0xC8000)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 134218240;
      v7 = a3;
      v8 = 1024;
      v9 = 819200;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "Skipping reverse template dissector: contentLen = %llu > %i", (uint8_t *)&v6, 0x12u);
    }

  }
  return a3 > 0xC8000;
}

- (BOOL)shouldDownloadFull:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SGExtractionDissector_shouldDownloadFull___block_invoke;
  v7[3] = &unk_1E7DB0B80;
  v7[4] = &v8;
  objc_msgSend(v5, "shouldDownloadFull:reply:", v4, v7);

  LOBYTE(v5) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

- (id)outputFromPackedJSSchema:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__23084;
  v13 = __Block_byref_object_dispose__23085;
  v14 = 0;
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SGExtractionDissector_outputFromPackedJSSchema___block_invoke;
  v8[3] = &unk_1E7DB0BA8;
  v8[4] = &v9;
  objc_msgSend(v5, "schemaOrgToOutput:reply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)outputFromPackedJSMailMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__23084;
  v13 = __Block_byref_object_dispose__23085;
  v14 = 0;
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SGExtractionDissector_outputFromPackedJSMailMessage___block_invoke;
  v8[3] = &unk_1E7DB0BA8;
  v8[4] = &v9;
  objc_msgSend(v5, "emailToOutput:reply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)outputFromPackedJSTextMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__23084;
  v13 = __Block_byref_object_dispose__23085;
  v14 = 0;
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SGExtractionDissector_outputFromPackedJSTextMessage___block_invoke;
  v8[3] = &unk_1E7DB0BA8;
  v8[4] = &v9;
  objc_msgSend(v5, "textMessageToOutput:reply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)eventsFromSchemaOrgItems:(id)a3
{
  SGExtractionDissector *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  SGPipelineEntity *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  SGExtractionDissector *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v3 = self;
  v41 = *MEMORY[0x1E0C80C00];
  -[SGExtractionDissector packedJSSchemaFromSchemaOrgItems:](self, "packedJSSchemaFromSchemaOrgItems:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDissector outputFromPackedJSSchema:](v3, "outputFromPackedJSSchema:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  +[SGSqlEntityStore sqlStoreInMemory](SGSqlEntityStore, "sqlStoreInMemory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v23 = v6;
    v24 = v4;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = v6;
    v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v33;
      v25 = v7;
      v26 = v3;
      v27 = v8;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(v8);
          v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          +[SGDuplicateKey duplicateKeyForSchemaOrg](SGDuplicateKey, "duplicateKeyForSchemaOrg", v23, v24);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[SGPipelineEntity initWithDuplicateKey:title:]([SGPipelineEntity alloc], "initWithDuplicateKey:title:", v11, &stru_1E7DB83A8);
          v13 = (void *)objc_opt_new();
          v14 = (void *)objc_opt_new();
          -[SGExtractionDissector entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:](v3, "entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:", v10, v8, v12, v13, v14, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v31 = v11;
            objc_msgSend(v28, "writeEnrichment:", v15);
            objc_msgSend(v15, "duplicateKey");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "loadEventByDuplicateKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "convertToEvent:", v28);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            sgEventsLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              -[SGEntity loggingIdentifier](v12, "loggingIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "loggingIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v37 = v20;
              v38 = 2114;
              v39 = v21;
              _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "[SGPipelineEnrichment (%{public}@)] -> [SGEvent (%{public}@)]", buf, 0x16u);

              v3 = v26;
              v7 = v25;
            }

            objc_msgSend(v7, "addObject:", v18);
            v8 = v27;
            v11 = v31;
          }

        }
        v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v30);
    }

    v6 = v23;
    v4 = v24;
  }

  return v7;
}

- (id)resolveSenderEmailAddressOnKnosis:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  GDXPCKnosisService *knosisService;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("pvp(PS520, qselect(NIL, pvp(PS406, '%@')))"), v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3DFC8]), "initWithKGQ:query:limit:offset:", v6, CFSTR("Suggestions Sender Relevancy Query"), &unk_1E7E0C818, &unk_1E7E0C788);
  knosisService = self->knosisService;
  v15 = 0;
  -[GDXPCKnosisService executeKGQ:error:](knosisService, "executeKGQ:error:", v7, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v10)
  {
    sgEventsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "debugDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "SGExtractionDissector resolveSenderEmailAddressOnKnosis error: %@", buf, 0xCu);

    }
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (BOOL)isSenderRelevant:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  const char *v12;
  uint8_t *v13;
  uint8_t v15[16];
  __int16 v16;
  uint8_t buf[2];

  v4 = a3;
  v5 = v4;
  if (!self->shouldExtractFromFwdMail)
  {
    sgEventsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "SGExtractionDissector: 'CoreSuggestionsInternals/ForwardedEmailEventExtraction' is disabled";
      v13 = buf;
      goto LABEL_12;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  if (!v4)
    goto LABEL_8;
  objc_msgSend(v4, "answers");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v5, "answers"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        !v9))
  {
LABEL_8:
    sgEventsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v12 = "SGExtractionDissector: ignoring email from unknown sender";
      v13 = (uint8_t *)&v16;
LABEL_12:
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  sgEventsLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: extracting from forwarded / reply email", v15, 2u);
  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (id)getSenderNameOnContacts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "answers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v6 = *(_QWORD *)v27;
      v21 = v5;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v8, "facts");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v23;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v23 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                objc_msgSend(v14, "predicateId");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PS33")) & 1) != 0)
                {
                  objc_msgSend(v14, "objectID");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v16)
                  {
                    objc_msgSend(v14, "objectID");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();

                    v5 = v21;
                    goto LABEL_23;
                  }
                }
                else
                {

                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v11);
          }

          v5 = v21;
          v6 = v19;
        }
        v17 = 0;
        v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v20);
    }
    else
    {
      v17 = 0;
    }
LABEL_23:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isPastEvent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend(v4, "absoluteRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "end");
  LOBYTE(v4) = v7 > v9;

  return (char)v4;
}

- (BOOL)_isPastEventOverOneYear:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend(v4, "absoluteRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "end");
  LOBYTE(v4) = v7 - v9 > 31536000.0;

  return (char)v4;
}

- (BOOL)_isPastEventFromEnrichment:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "showPastEvents") & 1) != 0)
  {
    v5 = 0;
  }
  else if (v4
         && (objc_msgSend(v4, "timeRange"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(v4, "timeRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SGExtractionDissector _isPastEvent:](self, "_isPastEvent:", v7);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  int v48;
  _PASLock *classifierCache;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  int v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  SGOutput *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  void *v93;
  int v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  SGExtractionDissector *v101;
  id v102;
  _BYTE *v103;
  char v104;
  _QWORD v105[4];
  id v106;
  _BYTE *v107;
  _BYTE v108[128];
  void *v109;
  uint8_t v110[4];
  void *v111;
  _BYTE buf[24];
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  void *v116;
  _QWORD v117[4];

  v117[1] = *MEMORY[0x1E0C80C00];
  v91 = a3;
  v90 = a4;
  v89 = a5;
  sgEventsLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v91, "spotlightUniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "loggingIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGPipelineEntity: Starting dissection of mail [SGSimpleMailMessage (%{public}@)], [SGPipelineEntity (%{public}@)]", buf, 0x16u);

  }
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEvents") & 1) != 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEventsML"))
    {
      sgEventsLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v90, "loggingIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector dissectMailMessage: Not dissecting because ML extraction is on. [SGPipelineEntity (%{public}@)]", buf, 0xCu);

        v12 = v11;
      }
    }
    else
    {
      v88 = objc_opt_new();
      objc_msgSend(v91, "from");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v91, "from");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v117[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setValue:forKey:](v88, "setValue:forKey:", v18, CFSTR("authors"));

      }
      objc_msgSend(v91, "from");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "emailAddress");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v91, "from");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "emailAddress");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setValue:forKey:](v88, "setValue:forKey:", v23, CFSTR("authorEmailAddresses"));

      }
      objc_msgSend(v91, "subject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v91, "subject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setValue:forKey:](v88, "setValue:forKey:", v25, CFSTR("subject"));

      }
      objc_msgSend(v91, "date");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v91, "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v27, 1, 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setValue:forKey:](v88, "setValue:forKey:", v28, CFSTR("dateReceived"));

      }
      objc_msgSend(v91, "textContent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v91, "textContent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (unint64_t)objc_msgSend(v30, "length") > 0x96;
        objc_msgSend(v91, "textContent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v31)
        {
          objc_msgSend(v32, "substringToIndex:", 150);
          v34 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v34;
        }

        -[NSObject setValue:forKey:](v88, "setValue:forKey:", v33, CFSTR("bodySnippet"));
      }
      objc_msgSend(v91, "from");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "emailAddress");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGExtractionDissector resolveSenderEmailAddressOnKnosis:](self, "resolveSenderEmailAddressOnKnosis:", v36);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = -[SGExtractionDissector isSenderRelevant:](self, "isSenderRelevant:", v86);
      v94 = v37;
      if ((_DWORD)v37)
      {
        -[SGExtractionDissector getSenderNameOnContacts:](self, "getSenderNameOnContacts:", v86);
        v38 = objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          objc_msgSend(v91, "from");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "name");
          v40 = objc_claimAutoreleasedReturnValue();

          v38 = v40;
          if (!v40)
          {
            objc_msgSend(v91, "from");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "emailAddress");
            v42 = objc_claimAutoreleasedReturnValue();

            v38 = v42;
          }
        }
        v93 = (void *)v38;
        v37 = -[NSObject setValue:forKey:](v88, "setValue:forKey:");
      }
      else
      {
        v93 = 0;
      }
      v43 = (void *)MEMORY[0x1C3BD4F6C](v37);
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v88, 0, 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v43);
      if (v87)
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v87, 4);
      else
        v44 = 0;
      v45 = mach_absolute_time();
      v46 = (void *)MEMORY[0x1C3BD4F6C]();
      -[SGExtractionDissector packedJSMailMessageFromMailMessage:context:](self, "packedJSMailMessageFromMailMessage:context:", v91, v89);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v46);
      objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("html"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SGExtractionDissector exceedsMaxHTMLContentLength:](self, "exceedsMaxHTMLContentLength:", objc_msgSend(v84, "length")))
      {
        sgEventsLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v90, "loggingIdentifier");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v81;
          _os_log_error_impl(&dword_1C3607000, v47, OS_LOG_TYPE_ERROR, "SGExtractionDissector dissectMailMessage: HTML content exceeding max length. [SGPipelineEntity (%{public}@)]", buf, 0xCu);

        }
      }
      else
      {
        v48 = objc_msgSend(v90, "isPartiallyDownloaded");
        objc_msgSend(v90, "releaseDissectorLock");
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v113 = __Block_byref_object_copy__23084;
        v114 = __Block_byref_object_dispose__23085;
        classifierCache = self->_classifierCache;
        v50 = MEMORY[0x1E0C809B0];
        v115 = 0;
        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = __59__SGExtractionDissector_dissectMailMessage_entity_context___block_invoke;
        v105[3] = &unk_1E7DB1180;
        v107 = buf;
        v51 = v91;
        v106 = v51;
        -[_PASLock runWithLockAcquired:](classifierCache, "runWithLockAcquired:", v105);
        v52 = objc_alloc(MEMORY[0x1E0D815E8]);
        v99[0] = v50;
        v99[1] = 3221225472;
        v99[2] = __59__SGExtractionDissector_dissectMailMessage_entity_context___block_invoke_2;
        v99[3] = &unk_1E7DB0BF8;
        v104 = v94;
        v103 = buf;
        v92 = v51;
        v100 = v92;
        v101 = self;
        v53 = v85;
        v102 = v53;
        v83 = (void *)objc_msgSend(v52, "initWithBlock:", v99);
        if (v48
          && (objc_msgSend(v83, "result"),
              v54 = (void *)objc_claimAutoreleasedReturnValue(),
              v55 = objc_msgSend(v54, "BOOLValue"),
              v54,
              v55))
        {
          objc_msgSend(v90, "acquireDissectorLock");
          objc_msgSend(v90, "requestFullDownload");
          sgEventsLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v90, "loggingIdentifier");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v110 = 138543362;
            v111 = v57;
            _os_log_impl(&dword_1C3607000, v56, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector dissectMailMessage: Email is not fully downloaded. Requesting full download. [SGPipelineEntity (%{public}@)]", v110, 0xCu);

          }
          +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "logAggregateSummaryForInteraction:", CFSTR("emailDownloadRequested"));
        }
        else
        {
          if (v94)
            objc_msgSend(v53, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isForwarded"));
          v59 = (void *)MEMORY[0x1C3BD4F6C]();
          -[SGExtractionDissector outputFromPackedJSMailMessage:](self, "outputFromPackedJSMailMessage:", v53);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v59);
          if (_os_feature_enabled_impl()
            && -[SGExtractionDissector requiredFieldsMissingForOutput:](self, "requiredFieldsMissingForOutput:", v60))
          {
            if (v60)
            {
              objc_msgSend(v60, "outputItems");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v61 = 0;
            }
            objc_msgSend(v90, "sourceKey");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGExtractionDissector extractMissingValuesFromMLForMail:outputItems:fromSuggestTool:](self, "extractMissingValuesFromMLForMail:outputItems:fromSuggestTool:", v92, v61, objc_msgSend(v62, "isEqualToString:", CFSTR("suggest_tool")));
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (v60)
            if (v63)
            {
              v109 = v63;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGExtractionDissector outputFromSchemas:inMessage:](self, "outputFromSchemas:inMessage:", v64, v92);
              v65 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v66 = [SGOutput alloc];
              objc_msgSend(v60, "sourceMetadata");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "exceptionTemplates");
              v67 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "jsMessageLogs");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = -[SGOutput initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:](v66, "initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:", 0, v64, v67, v68);

              v60 = (void *)v67;
            }

            v60 = (void *)v65;
          }
          v82 = v60;
          if (v60)
          {
            v69 = (void *)MEMORY[0x1C3BD4F6C]();
            -[SGExtractionDissector _addEnrichmentsToEntityForOutput:entity:startTime:backPressureHazard:](self, "_addEnrichmentsToEntityForOutput:entity:startTime:backPressureHazard:", v60, v90, v45, objc_msgSend(v89, "backpressureHazard"));
            objc_autoreleasePoolPop(v69);
          }
          objc_msgSend(v90, "acquireDissectorLock");
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          objc_msgSend(v90, "enrichments");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
          if (v71)
          {
            v72 = *(_QWORD *)v96;
            do
            {
              for (i = 0; i != v71; ++i)
              {
                if (*(_QWORD *)v96 != v72)
                  objc_enumerationMutation(v70);
                v74 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
                if (v44)
                {
                  objc_msgSend(MEMORY[0x1E0D197F0], "eventSourceMetadata:", v44);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "addTag:", v75);

                }
                if (v94)
                {
                  objc_msgSend(MEMORY[0x1E0D197F0], "isForwardedMail:", 1);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "addTag:", v76);

                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "from");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "emailAddress");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "setValue:forKey:", v79, CFSTR("email"));

                  objc_msgSend(v77, "setValue:forKey:", v93, CFSTR("name"));
                  objc_msgSend(MEMORY[0x1E0D197F0], "author:", v77);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v80)
                    objc_msgSend(v74, "addTag:", v80);

                }
              }
              v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
            }
            while (v71);
          }

          v58 = v82;
        }

        _Block_object_dispose(buf, 8);
      }

      v12 = v88;
    }
  }
  else
  {
    sgEventsLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector dissectMailMessage: Skipping reverse template dissector: detectStructuredEvents is OFF.", buf, 2u);
    }
  }

}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int16 v20;
  uint8_t buf[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEvents") & 1) == 0)
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v12 = "Skipping reverse template dissector: detectStructuredEvents is OFF";
      v13 = buf;
      goto LABEL_12;
    }
LABEL_6:

    goto LABEL_10;
  }
  if (objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEventsML"))
  {
    sgEventsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v20 = 0;
      v12 = "SGExtractionDissector: Not dissecting because ML extraction is on";
      v13 = (uint8_t *)&v20;
LABEL_12:
      _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, v12, v13, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  v14 = mach_absolute_time();
  v15 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGExtractionDissector packedJSTextMessageFromTextMessage:](self, "packedJSTextMessageFromTextMessage:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v15);
  v17 = (void *)MEMORY[0x1C3BD4F6C](objc_msgSend(v9, "releaseDissectorLock"));
  -[SGExtractionDissector outputFromPackedJSTextMessage:](self, "outputFromPackedJSTextMessage:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v17);
  if (v18)
  {
    v19 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SGExtractionDissector _addEnrichmentsToEntityForOutput:entity:startTime:backPressureHazard:](self, "_addEnrichmentsToEntityForOutput:entity:startTime:backPressureHazard:", v18, v9, v14, objc_msgSend(v10, "backpressureHazard"));
    objc_autoreleasePoolPop(v19);
  }
  objc_msgSend(v9, "acquireDissectorLock");

LABEL_10:
}

- (void)dissectInteraction:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sgEventsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "sg_LoggingIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v12;
    v29 = 2114;
    v30 = v13;
    _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Starting dissection of interaction [INIteraction (%{public}@)], [SGPipelineEntity (%{public}@)]", buf, 0x16u);

  }
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEvents") & 1) != 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEventsML"))
    {
      sgEventsLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v15 = "SGExtractionDissector dissectInteraction: Not dissecting because ML extraction is on";
LABEL_9:
        _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, v15, buf, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    v26 = mach_absolute_time();
    v16 = (void *)MEMORY[0x1C3BD4F6C](objc_msgSend(v9, "releaseDissectorLock"));
    objc_msgSend(v8, "toSchemas");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v16);
    v17 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v9, "duplicateKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "creationTimestamp");
    -[SGExtractionDissector packedJSInteractionFromInteraction:bundleIdentifier:creationTimestamp:](self, "packedJSInteractionFromInteraction:bundleIdentifier:creationTimestamp:", v8, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    objc_autoreleasePoolPop(v17);
    if (v14)
    {
      v22 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("schemas"));
      -[SGExtractionDissector outputFromPackedJSSchema:](self, "outputFromPackedJSSchema:", v21);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v22);
      if (!v23)
      {
LABEL_16:
        objc_msgSend(v9, "acquireDissectorLock");

        goto LABEL_17;
      }
      v24 = (void *)MEMORY[0x1C3BD4F6C]();
      -[SGExtractionDissector _addEnrichmentsToEntityForOutput:interaction:entity:startTime:backPressureHazard:](self, "_addEnrichmentsToEntityForOutput:interaction:entity:startTime:backPressureHazard:", v23, v8, v9, v26, objc_msgSend(v10, "backpressureHazard"));
      objc_autoreleasePoolPop(v24);
    }
    else
    {
      sgEventsLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "sg_LoggingIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v25;
        _os_log_error_impl(&dword_1C3607000, v23, OS_LOG_TYPE_ERROR, "SGExtractionDissector dissectInteraction: Could not convert INInteraction (%@) to schema", buf, 0xCu);

      }
    }

    goto LABEL_16;
  }
  sgEventsLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    v15 = "SGExtractionDissector dissectInteraction: Skipping reverse template dissector: detectStructuredEvents is OFF";
    goto LABEL_9;
  }
LABEL_17:

}

- (void)_addEnrichmentsToEntityForOutput:(id)a3 entity:(id)a4 startTime:(unint64_t)a5 backPressureHazard:(int)a6
{
  -[SGExtractionDissector _addEnrichmentsToEntityForOutput:interaction:entity:startTime:backPressureHazard:](self, "_addEnrichmentsToEntityForOutput:interaction:entity:startTime:backPressureHazard:", a3, 0, a4, a5, *(_QWORD *)&a6);
}

- (void)_addEnrichmentsToEntityForOutput:(id)a3 interaction:(id)a4 entity:(id)a5 startTime:(unint64_t)a6 backPressureHazard:(int)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v14, "outputItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionTemplates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsMessageLogs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = a7;
  -[SGExtractionDissector addEnrichmentsToEntityForOutputItems:exceptions:jsMessageLogs:interaction:entity:startTime:backPressureHazard:](self, "addEnrichmentsToEntityForOutputItems:exceptions:jsMessageLogs:interaction:entity:startTime:backPressureHazard:", v15, v16, v17, v13, v12, a6, v19);

  objc_msgSend(v14, "sourceMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("needsSourceVerification"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setNeedsSourceVerification:", objc_msgSend(v20, "BOOLValue"));
}

- (void)addEnrichmentsToEntityForOutputItems:(id)a3 exceptions:(id)a4 jsMessageLogs:(id)a5 interaction:(id)a6 entity:(id)a7 startTime:(unint64_t)a8 backPressureHazard:(int)a9
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  int v56;
  void *v57;
  char v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  char v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unsigned int v128;
  uint64_t v129;
  uint64_t k;
  void *v131;
  void *v132;
  void *v133;
  char v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  void *v138;
  void *v139;
  SGStorageEvent *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  id obj;
  uint64_t v146;
  id v147;
  uint64_t v148;
  char v150;
  void *v151;
  void *context;
  uint64_t v153;
  void *v154;
  unint64_t v155;
  void *v156;
  void *v157;
  id v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _BYTE v175[128];
  const __CFString *v176;
  void *v177;
  const __CFString *v178;
  void *v179;
  _BYTE v180[128];
  uint8_t v181[128];
  uint8_t buf[4];
  uint64_t v183;
  __int16 v184;
  uint64_t v185;
  __int16 v186;
  void *v187;
  __int16 v188;
  void *v189;
  __int16 v190;
  void *v191;
  __int16 v192;
  void *v193;
  __int16 v194;
  void *v195;
  const __CFString *v196;
  void *v197;
  _BYTE v198[128];
  uint64_t v199;

  v199 = *MEMORY[0x1E0C80C00];
  v137 = a3;
  v14 = a4;
  v158 = a5;
  v15 = a6;
  v16 = a7;
  v17 = mach_absolute_time() - a8;
  if (SGMachTimeToNanoseconds_onceToken != -1)
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_13797);
  v155 = v17 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1ED52979C / 0xF4240;
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(v16, "duplicateKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "entityType") == 13 || objc_msgSend(v137, "count"))
      goto LABEL_6;
    v135 = objc_msgSend(v14, "count");

    if (!v135)
    {
      +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logEventExtractionForTemplateName:extractionStatus:outputExceptions:outputInfos:jsMessageLogs:jsOutputLogs:timingProcessing:", 0, 3, 0, 0, v158, 0, v155);
LABEL_6:

    }
  }
  v143 = v15;
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  obj = v14;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v198, 16);
  v144 = v16;
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v172;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v172 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * i);
        sgEventsLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("templateExceptionMessage"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("templateName"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("templateShortName"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "loggingIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v183 = (uint64_t)v29;
          v184 = 2114;
          v185 = (uint64_t)v30;
          v186 = 2114;
          v187 = v31;
          v188 = 2114;
          v189 = v32;
          _os_log_error_impl(&dword_1C3607000, v24, OS_LOG_TYPE_ERROR, "JS Extraction Status: Template exception %{public}@, in template: %{public}@ (%{public}@). [SGPipelineEntity (%{public}@)]", buf, 0x2Au);

          v16 = v144;
        }

        +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("templateName"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v196 = CFSTR("templateExceptionMessage");
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("templateExceptionMessage"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v197, &v196, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logEventExtractionForTemplateName:extractionStatus:outputExceptions:outputInfos:jsMessageLogs:jsOutputLogs:timingProcessing:", v26, 1, 0, 0, v158, v28, v155);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v198, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v137, "count"))
  {
    sgEventsLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "loggingIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v137, "count");
      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("assetVersion"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("deviceLocale"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("documentType"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("containsSchemaorg"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("bundleID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v183 = (uint64_t)v34;
      v184 = 2048;
      v185 = v35;
      v186 = 2114;
      v187 = v36;
      v188 = 2114;
      v189 = v37;
      v190 = 2114;
      v191 = v38;
      v192 = 2114;
      v193 = v39;
      v194 = 2114;
      v195 = v40;
      _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_DEFAULT, "JS OUTPUT for [SGPipelineEntity (%{public}@)]: %lu output(s). Asset version: %{public}@. Device locale: %{public}@. Document type: %{public}@. Contains schemaOrg?: %{public}@. Bundle ID: %{public}@", buf, 0x48u);

    }
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v41 = v137;
    v42 = v143;
    v148 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v167, v181, 16);
    if (v148)
    {
      v146 = *(_QWORD *)v168;
      v43 = 0x1E0D19000uLL;
      v147 = v41;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v168 != v146)
            objc_enumerationMutation(v41);
          v153 = v44;
          v157 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * v44);
          context = (void *)MEMORY[0x1C3BD4F6C]();
          sgEventsLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v157, "objectForKeyedSubscript:", CFSTR("templateName"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "objectForKeyedSubscript:", CFSTR("templateShortName"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "loggingIdentifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v183 = (uint64_t)v46;
            v184 = 2112;
            v185 = (uint64_t)v47;
            v186 = 2114;
            v187 = v48;
            _os_log_impl(&dword_1C3607000, v45, OS_LOG_TYPE_DEFAULT, "JS template match: %@ shortName:%@. [SGPipelineEntity (%{public}@)]", buf, 0x20u);

          }
          sgPrivateLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v16, "loggingIdentifier");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v183 = (uint64_t)v120;
            v184 = 2112;
            v185 = (uint64_t)v157;
            _os_log_debug_impl(&dword_1C3607000, v49, OS_LOG_TYPE_DEBUG, "[SGEntity (%{public}@)] - Complete JS output: %@", buf, 0x16u);

          }
          v50 = objc_opt_new();
          v51 = objc_opt_new();
          objc_msgSend(v157, "objectForKeyedSubscript:", CFSTR("jsOutputLogs"));
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = (void *)v50;
          v151 = (void *)v51;
          -[SGExtractionDissector entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:](self, "entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:", v157, v41, v16, v50, v51, v42);
          v52 = objc_claimAutoreleasedReturnValue();
          LODWORD(v53) = -[SGExtractionDissector _isPastEventFromEnrichment:](self, "_isPastEventFromEnrichment:", v52);
          sgEventsLogHandle();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "loggingIdentifier");
            v55 = v42;
            v56 = v53;
            v53 = objc_claimAutoreleasedReturnValue();
            -[NSObject loggingIdentifier](v52, "loggingIdentifier");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v183 = v53;
            v184 = 2114;
            v185 = (uint64_t)v57;
            _os_log_impl(&dword_1C3607000, v54, OS_LOG_TYPE_DEFAULT, "[SGPipelineEntity (%{public}@)] -> [SGPipelineEnrichment (%{public}@)]", buf, 0x16u);

            LODWORD(v53) = v56;
            v42 = v55;
          }

          if (v52)
            v58 = v53;
          else
            v58 = 1;
          if ((v58 & 1) == 0)
          {
            v150 = v53;
            objc_msgSend(v16, "acquireDissectorLock");
            v165 = 0u;
            v166 = 0u;
            v163 = 0u;
            v164 = 0u;
            objc_msgSend(v16, "tags");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v163, v180, 16);
            if (v77)
            {
              v78 = v77;
              v79 = *(_QWORD *)v164;
              do
              {
                for (j = 0; j != v78; ++j)
                {
                  if (*(_QWORD *)v164 != v79)
                    objc_enumerationMutation(v76);
                  -[NSObject addTag:](v52, "addTag:", *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * j));
                }
                v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v163, v180, 16);
              }
              while (v78);
            }

            v81 = *(void **)(v43 + 2032);
            objc_msgSend(v157, "objectForKeyedSubscript:", CFSTR("templateShortName"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "extractedFromTemplateWithShortName:", v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addTag:](v52, "addTag:", v83);

            v84 = *(void **)(v43 + 2032);
            objc_msgSend(v157, "objectForKeyedSubscript:", CFSTR("templateName"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "extractedFromTemplateWithName:", v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addTag:](v52, "addTag:", v86);

            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("domain"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            if (v87)
            {
              v88 = *(void **)(v43 + 2032);
              objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("domain"));
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "domain:", v89);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addTag:](v52, "addTag:", v90);

            }
            objc_msgSend(*(id *)(v43 + 2032), "inhuman");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addTag:", v91);

            objc_msgSend(*(id *)(v43 + 2032), "fromExtractedDomain");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addTag:", v92);

            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("reverseMapped_EVENT_TIME__START_DATETIME"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();

            if (v93)
            {
              objc_msgSend(*(id *)(v43 + 2032), "fieldReverseMapped:", CFSTR("reverseMapped_EVENT_TIME__START_DATETIME"));
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addTag:](v52, "addTag:", v94);

            }
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("reverseMapped_EVENT_LOCATION__START_ADDRESS"));
            v95 = (void *)objc_claimAutoreleasedReturnValue();

            if (v95)
            {
              objc_msgSend(*(id *)(v43 + 2032), "fieldReverseMapped:", CFSTR("reverseMapped_EVENT_LOCATION__START_ADDRESS"));
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addTag:](v52, "addTag:", v96);

            }
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("reverseMapped_EVENT_LOCATION__START_PLACE"));
            v97 = (void *)objc_claimAutoreleasedReturnValue();

            if (v97)
            {
              objc_msgSend(*(id *)(v43 + 2032), "fieldReverseMapped:", CFSTR("reverseMapped_EVENT_LOCATION__START_PLACE"));
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addTag:](v52, "addTag:", v98);

            }
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("reverseMapped_TITLE__HOTEL_RESTAURANT_NAME"));
            v99 = (void *)objc_claimAutoreleasedReturnValue();

            if (v99)
            {
              objc_msgSend(*(id *)(v43 + 2032), "fieldReverseMapped:", CFSTR("reverseMapped_TITLE__HOTEL_RESTAURANT_NAME"));
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addTag:](v52, "addTag:", v100);

            }
            objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("reverseMapped_TITLE__MOVIE_TICKET_NAME"));
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            if (v101)
            {
              objc_msgSend(*(id *)(v43 + 2032), "fieldReverseMapped:", CFSTR("reverseMapped_TITLE__MOVIE_TICKET_NAME"));
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addTag:](v52, "addTag:", v102);

            }
            v178 = CFSTR("locationType");
            +[SGRTCLogging locationTypeForEntity:](SGRTCLogging, "locationTypeForEntity:", v52);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v179 = v103;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "addEntriesFromDictionary:", v104);

            v176 = CFSTR("isAllDay");
            v105 = (void *)MEMORY[0x1E0CB37E8];
            -[NSObject tags](v52, "tags");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v43 + 2032), "allDay");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "numberWithBool:", objc_msgSend(v106, "containsObject:", v107));
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v177 = v108;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "addEntriesFromDictionary:", v109);

            *(_BYTE *)(objc_msgSend(v16, "inhumanFeatures") + 8) = 1;
            if (v42)
              -[SGExtractionDissector addInteractionTagsToEnrichment:inEntity:interaction:](self, "addInteractionTagsToEnrichment:inEntity:interaction:", v52, v16, v42);
            objc_msgSend(v16, "addEnrichment:", v52);
            objc_msgSend(v16, "releaseDissectorLock");
            sgEventsLogHandle();
            v110 = objc_claimAutoreleasedReturnValue();
            v41 = v147;
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "loggingIdentifier");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v183 = (uint64_t)v111;
              _os_log_impl(&dword_1C3607000, v110, OS_LOG_TYPE_DEFAULT, "JS Extraction Status: Event. [SGPipelineEntity (%{public}@)]", buf, 0xCu);

            }
            sgEventsLogHandle();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject loggingIdentifier](v52, "loggingIdentifier");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v156, "objectForKeyedSubscript:", CFSTR("locationType"));
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v157, "objectForKeyedSubscript:", CFSTR("geocodingMode"));
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v156, "objectForKeyedSubscript:", CFSTR("isAllDay"));
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v156, "objectForKeyedSubscript:", CFSTR("outputUsecase"));
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v156, "objectForKeyedSubscript:", CFSTR("outputCategory"));
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              v183 = (uint64_t)v112;
              v184 = 2112;
              v185 = (uint64_t)v113;
              v186 = 2112;
              v187 = v114;
              v188 = 2112;
              v189 = v115;
              v190 = 2112;
              v191 = v116;
              v192 = 2112;
              v193 = v117;
              _os_log_impl(&dword_1C3607000, v60, OS_LOG_TYPE_DEFAULT, "JS outputItem for enrichment [SGPipelineEnrichment (%{public}@)]: LocationType: %@. Geocoding Mode: %@. isAllDay?: %@. Output Usecase: %@. Output Category: %@.", buf, 0x3Eu);

              v16 = v144;
              v42 = v143;

              v41 = v147;
            }
            v75 = 0;
            goto LABEL_67;
          }
          sgEventsLogHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = v59;
          if (v52 && ((v53 ^ 1) & 1) == 0)
          {
            v150 = v53;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3607000, v60, OS_LOG_TYPE_DEFAULT, "Converting pastEvent enrichments to SGStorageEvent and calling SGEnrichmentWritebackAdapter:addEvent", buf, 2u);
            }

            v140 = [SGStorageEvent alloc];
            -[NSObject recordId](v52, "recordId");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject duplicateKey](v52, "duplicateKey");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject sourceKey](v52, "sourceKey");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject content](v52, "content");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject title](v52, "title");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject creationTimestamp](v52, "creationTimestamp");
            v65 = v64;
            -[NSObject lastModifiedTimestamp](v52, "lastModifiedTimestamp");
            v67 = v66;
            -[NSObject tags](v52, "tags");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject timeRange](v52, "timeRange");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject locations](v52, "locations");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject structuredData](v52, "structuredData");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = -[NSObject state](v52, "state");
            -[NSObject duplicateKey](v52, "duplicateKey");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            BYTE4(v136) = objc_msgSend(v72, "entityType") == 1;
            LODWORD(v136) = v71;
            v141 = -[SGStorageEvent initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:](v140, "initWithRecordId:duplicateKey:sourceKey:content:title:creationTimestamp:lastModifiedTimestamp:tags:when:locations:structuredData:state:curated:", v61, v62, v63, v142, v139, v68, v65, v67, v138, v69, v70, v136);

            v73 = (void *)objc_opt_new();
            objc_msgSend(v73, "addEvent:", v141);

            sgEventsLogHandle();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3607000, v74, OS_LOG_TYPE_DEFAULT, "SGEnrichmentWritebackAdapter addEvent passed, setting enrichment=nil to avoid banner for past event.", buf, 2u);
            }

            v75 = 2;
            v60 = v52;
            v52 = v141;
            v42 = v143;
            v16 = v144;
            v41 = v147;
LABEL_67:
            LOBYTE(v53) = v150;
            goto LABEL_71;
          }
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v154, "_pas_componentsJoinedByString:", CFSTR(", "));
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "loggingIdentifier");
            v122 = v53;
            v53 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v183 = (uint64_t)v121;
            v184 = 2114;
            v185 = v53;
            _os_log_error_impl(&dword_1C3607000, v60, OS_LOG_TYPE_ERROR, "JS Extraction Status: Output Exception %@. [SGPipelineEntity (%{public}@)]", buf, 0x16u);

            LOBYTE(v53) = v122;
          }
          v75 = 2;
LABEL_71:

          if ((v53 & 1) == 0)
          {
            +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "objectForKeyedSubscript:", CFSTR("templateName"));
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "logEventExtractionForTemplateName:extractionStatus:outputExceptions:outputInfos:jsMessageLogs:jsOutputLogs:timingProcessing:", v119, v75, v154, v151, v158, v156, v155);

          }
          objc_autoreleasePoolPop(context);
          v44 = v153 + 1;
          v43 = 0x1E0D19000;
        }
        while (v153 + 1 != v148);
        v148 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v167, v181, 16);
      }
      while (v148);
    }

  }
  else if (objc_msgSend(obj, "count"))
  {
    objc_msgSend(v16, "acquireDissectorLock");
    objc_msgSend(MEMORY[0x1E0D197F0], "templateException");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTag:", v123);

    objc_msgSend(v16, "releaseDissectorLock");
  }
  objc_msgSend(v16, "acquireDissectorLock");
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  objc_msgSend(v16, "enrichments");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v159, v175, 16);
  if (v125)
  {
    v126 = v125;
    v127 = *(_QWORD *)v160;
    if (a9 == 1)
      v128 = 12;
    else
      v128 = 0;
    if (a9)
      v129 = v128;
    else
      v129 = 13;
    do
    {
      for (k = 0; k != v126; ++k)
      {
        if (*(_QWORD *)v160 != v127)
          objc_enumerationMutation(v124);
        v131 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * k);
        v132 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v131, "duplicateKey");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "entityType");
        if (SGEntityTypeIsEvent())
        {
          v134 = objc_msgSend(v131, "isNaturalLanguageEvent");

          if ((v134 & 1) != 0)
            goto LABEL_92;
          +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "logEventInteractionForEntity:interface:actionType:", v131, 0, v129);
        }

LABEL_92:
        objc_autoreleasePoolPop(v132);
      }
      v126 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v159, v175, 16);
    }
    while (v126);
  }

  objc_msgSend(v144, "releaseDissectorLock");
}

- (id)eventClassificationForMailMessage:(id)a3
{
  id v4;
  _PASLock *classifierCache;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SGExtractionDissector *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23084;
  v17 = __Block_byref_object_dispose__23085;
  classifierCache = self->_classifierCache;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SGExtractionDissector_eventClassificationForMailMessage___block_invoke;
  v9[3] = &unk_1E7DB0C48;
  v12 = &v13;
  v6 = v4;
  v10 = v6;
  v11 = self;
  -[_PASLock runWithLockAcquired:](classifierCache, "runWithLockAcquired:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)privacyAwareLogsForMLExtractions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__23084;
  v14 = __Block_byref_object_dispose__23085;
  v15 = 0;
  -[SGExtractionDissector packedJSMailMessageFromMailMessage:](self, "packedJSMailMessageFromMailMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SGExtractionDissector_privacyAwareLogsForMLExtractions___block_invoke;
  v9[3] = &unk_1E7DB0C20;
  v9[4] = &v10;
  objc_msgSend(v6, "privacyAwareLogsForMLExtractions:reply:", v5, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)diffSchemas:(id)a3 withExpectedSchemas:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23084;
  v16 = __Block_byref_object_dispose__23085;
  v17 = 0;
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__SGExtractionDissector_diffSchemas_withExpectedSchemas___block_invoke;
  v11[3] = &unk_1E7DB0C20;
  v11[4] = &v12;
  objc_msgSend(v8, "diffSchemas:withExpectedSchemas:reply:", v6, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)mergeSchemas:(id)a3 withExpectedSchemas:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23084;
  v16 = __Block_byref_object_dispose__23085;
  v17 = 0;
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__SGExtractionDissector_mergeSchemas_withExpectedSchemas___block_invoke;
  v11[3] = &unk_1E7DB0C20;
  v11[4] = &v12;
  objc_msgSend(v8, "mergeSchemas:withExpectedSchemas:reply:", v6, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)eventClassificationWithoutXPCForMailMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if (eventClassificationWithoutXPCForMailMessage___pasOnceToken62 != -1)
    dispatch_once(&eventClassificationWithoutXPCForMailMessage___pasOnceToken62, &__block_literal_global_595);
  v5 = (id)eventClassificationWithoutXPCForMailMessage___pasExprOnceResult;
  -[SGExtractionDissector packedJSMailMessageFromMailMessage:](self, "packedJSMailMessageFromMailMessage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__23084;
  v14 = __Block_byref_object_dispose__23085;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SGExtractionDissector_eventClassificationWithoutXPCForMailMessage___block_invoke_2;
  v9[3] = &unk_1E7DB0C20;
  v9[4] = &v10;
  objc_msgSend(v5, "eventClassificationForEntity:reply:", v6, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)parseHTML:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__23084;
  v13 = __Block_byref_object_dispose__23085;
  v14 = 0;
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__SGExtractionDissector_parseHTML___block_invoke;
  v8[3] = &unk_1E7DB0C90;
  v8[4] = &v9;
  objc_msgSend(v5, "parseHTML:reply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)resolveCandidates:(id)a3 forCategory:(id)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__23084;
  v26 = __Block_byref_object_dispose__23085;
  v27 = 0;
  -[SGExtractionDissector jsDictForResolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:](self, "jsDictForResolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:", v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__SGExtractionDissector_resolveCandidates_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke;
  v21[3] = &unk_1E7DB4A08;
  v21[4] = &v22;
  objc_msgSend(v18, "resolveCandidatesForJSDict:reply:", v17, v21);

  v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (id)resolveCandidatesWithoutXPC:(id)a3 forCategory:(id)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__23084;
  v26 = __Block_byref_object_dispose__23085;
  v27 = 0;
  -[SGExtractionDissector jsDictForResolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:](self, "jsDictForResolveCandidates:forCategory:label:rawIndexSet:taggedCharacterRanges:", v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasOnceToken63 != -1)
    dispatch_once(&resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasOnceToken63, &__block_literal_global_599);
  v18 = (id)resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasExprOnceResult;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __105__SGExtractionDissector_resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke_2;
  v21[3] = &unk_1E7DB4A08;
  v21[4] = &v22;
  objc_msgSend(v18, "resolveCandidatesForJSDict:reply:", v17, v21);
  v19 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v19;
}

- (id)jsDictForResolveCandidates:(id)a3 forCategory:(id)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7
{
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  id v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v12 = a6;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a4;
  v15 = (__CFString *)a3;
  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __104__SGExtractionDissector_jsDictForResolveCandidates_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke;
  v25[3] = &unk_1E7DB72C0;
  v26 = v11;
  v27 = v16;
  v17 = v16;
  v18 = v11;
  objc_msgSend(v12, "enumerateRangesUsingBlock:", v25);

  v19 = &stru_1E7DB83A8;
  if (v15)
    v20 = v15;
  else
    v20 = &stru_1E7DB83A8;
  v28[0] = CFSTR("candidates");
  v28[1] = CFSTR("category");
  if (v14)
    v21 = v14;
  else
    v21 = &stru_1E7DB83A8;
  v29[0] = v20;
  v29[1] = v21;
  v28[2] = CFSTR("label");
  v28[3] = CFSTR("candidateTaggedCharacterRanges");
  if (v13)
    v22 = v13;
  else
    v22 = &stru_1E7DB83A8;
  if (v17)
    v19 = v17;
  v29[2] = v22;
  v29[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_ensureHtmlIsString:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("html"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("html"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v8, 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("html"));

    v3 = v6;
  }
  return v3;
}

- (id)jsonLdOutputFromPackedJSEntity:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  -[SGExtractionDissector _ensureHtmlIsString:](self, "_ensureHtmlIsString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("fromSuggestTool"));
  v4 = (void *)objc_opt_new();
  if (jsonLdOutputFromPackedJSEntity___pasOnceToken64 != -1)
    dispatch_once(&jsonLdOutputFromPackedJSEntity___pasOnceToken64, &__block_literal_global_608);
  v5 = (id)jsonLdOutputFromPackedJSEntity___pasExprOnceResult;
  if (objc_msgSend(v5, "shouldDownloadFull:", v3))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("schemas"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke_2;
      v19[3] = &unk_1E7DB0CF8;
      v7 = &v20;
      v20 = v4;
      objc_msgSend(v5, "schemaOrgToJsonLd:reply:", v3, v19);
    }
    else
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke_3;
      v17 = &unk_1E7DB0CF8;
      v7 = &v18;
      v18 = v4;
      objc_msgSend(v5, "emailToJsonLd:reply:", v3, &v14);
    }

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("jsEntity"), v14, v15, v16, v17);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jsEntity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("html"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMonochrome stringByExtractingPlainTextFromHTML:tableDelimiters:stripLinks:](SGMonochrome, "stringByExtractingPlainTextFromHTML:tableDelimiters:stripLinks:", v9, 1, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E7DB83A8;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("monochrome"));

  return v4;
}

- (id)reverseMapMailMessage:(id)a3 withPreprocessedHTML:(id)a4 forCategory:(id)a5 withSchemExpectation:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[SGExtractionDissector packedJSMailMessageFromMailMessage:](self, "packedJSMailMessageFromMailMessage:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDissector _ensureHtmlIsString:](self, "_ensureHtmlIsString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("plainText"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("webKitPlainText"));

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ddResult"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("webKitPlainTextDDResult"));
  if (reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasOnceToken65 != -1)
    dispatch_once(&reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasOnceToken65, &__block_literal_global_618);
  objc_msgSend((id)reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasExprOnceResult, "reverseMapEntity:forCategory:withSchemaExpectation:", v15, v11, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)jsonLdOutputFromMailMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;

  v4 = a3;
  -[SGExtractionDissector packedJSMailMessageFromMailMessage:](self, "packedJSMailMessageFromMailMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "from");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDissector resolveSenderEmailAddressOnKnosis:](self, "resolveSenderEmailAddressOnKnosis:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SGExtractionDissector isSenderRelevant:](self, "isSenderRelevant:", v8);

  if (v9)
    objc_msgSend(v5, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isForwarded"));
  -[SGExtractionDissector jsonLdOutputFromPackedJSEntity:](self, "jsonLdOutputFromPackedJSEntity:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)jsonLdOutputFromMailMessage:(id)a3 schema:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[SGExtractionDissector packedJSMailMessageFromMailMessage:](self, "packedJSMailMessageFromMailMessage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v7, "from");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "emailAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDissector resolveSenderEmailAddressOnKnosis:](self, "resolveSenderEmailAddressOnKnosis:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SGExtractionDissector isSenderRelevant:](self, "isSenderRelevant:", v12);

  if (v13)
  {
    sgEventsLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_INFO, "SGExtractionDissector jsonLdOutputFromMailMessage setting isForwardedKey to YES", v19, 2u);
    }

    objc_msgSend(v9, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isForwarded"));
  }
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("schemas"));
  v16 = (void *)objc_msgSend(v9, "copy");
  -[SGExtractionDissector jsonLdOutputFromPackedJSEntity:](self, "jsonLdOutputFromPackedJSEntity:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)jsonLdOutputFromTextMessage:(id)a3
{
  void *v4;
  void *v5;

  -[SGExtractionDissector packedJSTextMessageFromTextMessage:](self, "packedJSTextMessageFromTextMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDissector jsonLdOutputFromPackedJSEntity:](self, "jsonLdOutputFromPackedJSEntity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)jsonLdOutputFromURL:(id)a3 title:(id)a4 payload:(id)a5 extractionDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a6, "timeIntervalSince1970");
  -[SGExtractionDissector packedJSURLFromURL:title:payload:creationTimestamp:](self, "packedJSURLFromURL:title:payload:creationTimestamp:", v12, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGExtractionDissector jsonLdOutputFromPackedJSEntity:](self, "jsonLdOutputFromPackedJSEntity:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isStructuredEventCandidateForURL:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGExtractionDissector packedJSURLFromURL:title:payload:](self, "packedJSURLFromURL:title:payload:", v6, v7, &stru_1E7DB83A8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SGExtractionDissector shouldDownloadFull:](self, "shouldDownloadFull:", v9);

  objc_autoreleasePoolPop(v8);
  return (char)self;
}

- (void)dissectURL:(id)a3 title:(id)a4 htmlPayload:(id)a5 entity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  sgEventsLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "loggingIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138740227;
    v25 = v10;
    v26 = 2114;
    v27 = v15;
    _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Starting dissection of webpage (%{sensitive}@). [SGPipelineEntity (%{public}@)]", (uint8_t *)&v24, 0x16u);

  }
  v16 = mach_absolute_time();
  objc_msgSend(v11, "creationTimestamp");
  -[SGExtractionDissector packedJSURLFromURL:title:payload:creationTimestamp:](self, "packedJSURLFromURL:title:payload:creationTimestamp:", v13, v10, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("html"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SGExtractionDissector exceedsMaxHTMLContentLength:](self, "exceedsMaxHTMLContentLength:", objc_msgSend(v18, "length")))
  {
    sgEventsLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "loggingIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v20;
      _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "SGExtractionDissector dissectURL: Webpage processing stopped: HTML content exceeding max length. [SGPipelineEntity (%{public}@)]", (uint8_t *)&v24, 0xCu);

    }
  }
  else
  {
    -[SGExtractionDissector outputFromPackedJSMailMessage:](self, "outputFromPackedJSMailMessage:", v17);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v19 = v21;
      -[SGExtractionDissector _addEnrichmentsToEntityForOutput:interaction:entity:startTime:backPressureHazard:](self, "_addEnrichmentsToEntityForOutput:interaction:entity:startTime:backPressureHazard:", v21, 0, v11, v16, 1);
    }
    else
    {
      sgEventsLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "loggingIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v23;
        _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "SGExtractionDissector dissectURL: SGOutput is null. [SGPipelineEntity (%{public}@)]", (uint8_t *)&v24, 0xCu);

      }
      v19 = 0;
    }
  }

}

- (void)addInteractionTagsToEnrichment:(id)a3 inEntity:(id)a4 interaction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D197F0], "fromInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addTag:", v9);

  v10 = (void *)MEMORY[0x1E0D197F0];
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "interactionId:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addTag:", v12);

  objc_msgSend(v7, "duplicateKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entityKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "duplicateKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entityKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D197F0], "interactionBundleId:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addTag:", v19);

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0D198C8], "originWithType:sourceKey:externalKey:bundleId:fromForwardedMessage:", 5, v18, &stru_1E7DB83A8, v18, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "teamId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0D197F0], "interactionTeamId:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addTag:", v22);

      }
    }

  }
  objc_msgSend(v8, "groupIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0D197F0];
    objc_msgSend(v8, "groupIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "interactionGroupId:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addTag:", v26);

  }
}

- (id)getAndRemoveItemReferencesFromSchemas:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v20 = 0;
    v5 = *(_QWORD *)v22;
    v6 = CFSTR("itemReferenceIdentifier");
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v8, "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("itemReferenceName"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (!v13)
        {
          v14 = v6;
          v15 = v5;
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC00]), "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v10, v11, 0);
          v17 = v20;
          if (!v20)
            v17 = (void *)objc_opt_new();
          v20 = v17;
          objc_msgSend(v17, "addObject:", v16);

          v5 = v15;
          v6 = v14;
        }
        objc_msgSend(v8, "removeObjectForKey:", v6);
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("itemReferenceName"));

        objc_autoreleasePoolPop(v9);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)eventActivitiesForReservationWithSchema:(id)a3 enrichment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  id obj;
  void *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  const __CFString *v78;
  void *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5
    && (objc_msgSend(v6, "tags"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x1E0D197F0], "extractedFlight"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "containsObject:", v9),
        v9,
        v8,
        v10))
  {
    v65 = v7;
    v66 = v5;
    v67 = (id)objc_opt_new();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = v5;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v75;
      v69 = *(_QWORD *)v75;
      do
      {
        v14 = 0;
        v70 = v12;
        do
        {
          if (*(_QWORD *)v75 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v14);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("potentialAction"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("flightNumber"));
          v18 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("target"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          v73 = (void *)v18;
          if (v16)
            v21 = v18 == 0;
          else
            v21 = 1;
          if (!v21 && v19 != 0)
          {
            v72 = (void *)v19;
            objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("startTime"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = (void *)MEMORY[0x1E0C99D78];
            if (v24)
            {
              v26 = v23;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("startTime"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "sg_dateComponentsFromISO8601String:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = 0;
            }
            else
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("reservationFor"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("departureTime"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "sg_dateComponentsFromISO8601String:", v31);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v23, "dateFromComponents:", v27);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "dateByAddingTimeInterval:", -86400.0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = v23;
              objc_msgSend(v23, "components:fromDate:", 1048828, v33);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              v28 = 0;
            }

            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("endTime"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = (void *)MEMORY[0x1E0C99D78];
            if (v34)
            {
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("endTime"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "sg_dateComponentsFromISO8601String:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("reservationFor"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("departureTime"));
              v38 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "sg_dateComponentsFromISO8601String:", v38);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v28 = (void *)v38;
            }

            v39 = v26;
            v20 = v72;
            if (v29 && v37)
            {
              v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.internal.mail.checkinActivity"));
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("@type"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v41;
              if (v41 && objc_msgSend(v41, "isEqualToString:", CFSTR("http://schema.org/CheckInAction")))
              {
                +[SGFoundInAppsStrings foundInAppsStringForCheckInAction:](SGFoundInAppsStrings, "foundInAppsStringForCheckInAction:", v73);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "setTitle:", v43);

                v78 = CFSTR("reservationId");
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("reservationId"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v79 = v44;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "setUserInfo:", v45);

                v46 = (void *)MEMORY[0x1C3BD4F6C]();
                v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("reservationId"), 0);
                objc_autoreleasePoolPop(v46);
                objc_msgSend(v40, "setRequiredUserInfoKeys:", v47);

                v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v72);
                objc_msgSend(v40, "setWebpageURL:", v48);

                objc_msgSend(v29, "timeZone");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v49;
                if (v49)
                {
                  v51 = v49;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
                  v51 = (id)objc_claimAutoreleasedReturnValue();
                }
                v52 = v51;

                v68 = v52;
                objc_msgSend(v39, "setTimeZone:", v52);
                objc_msgSend(v39, "dateFromComponents:", v29);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "timeIntervalSinceReferenceDate");
                v55 = v54;

                objc_msgSend(v37, "timeZone");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v56;
                if (v56)
                {
                  v58 = v56;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
                  v58 = (id)objc_claimAutoreleasedReturnValue();
                }
                v59 = v58;

                objc_msgSend(v39, "setTimeZone:", v59);
                objc_msgSend(v39, "dateFromComponents:", v37);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "timeIntervalSinceReferenceDate");
                v62 = v61;

                v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19808]), "initWithTeamIdentifier:type:userActivity:validStartDate:validEndDate:", CFSTR("NoTeamId"), 1, v40, v55, v62);
                objc_msgSend(v67, "addObject:", v63);

              }
            }

            v13 = v69;
            v12 = v70;
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
      }
      while (v12);
    }

    v7 = v65;
    v5 = v66;
  }
  else
  {
    v67 = 0;
  }

  return v67;
}

- (id)eventActivitiesForReservationWithReference:(id)a3 inParentEntity:(id)a4 interaction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v59;
  void *context;
  void *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id obj;
  void *v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  NSObject *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v69 = a4;
  v8 = a5;
  v9 = v8;
  if (v8
    && (objc_msgSend(v8, "intentResponse"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        (isKindOfClass & 1) != 0))
  {
    context = (void *)MEMORY[0x1C3BD4F6C]();
    v61 = v9;
    objc_msgSend(v9, "intentResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (id)objc_opt_new();
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v59 = v12;
    objc_msgSend(v12, "reservations");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v82;
      v62 = *(_QWORD *)v82;
      v63 = v7;
      v70 = v13;
      do
      {
        v17 = 0;
        v64 = v15;
        do
        {
          if (*(_QWORD *)v82 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v18, "itemReference");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqual:", v7);

          if (v21)
          {
            v66 = v19;
            v67 = v17;
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            objc_msgSend(v18, "actions");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
            v24 = v69;
            if (v23)
            {
              v25 = v23;
              v26 = *(_QWORD *)v78;
              v71 = *(_QWORD *)v78;
              v72 = v22;
              do
              {
                v27 = 0;
                v75 = v25;
                do
                {
                  if (*(_QWORD *)v78 != v26)
                    objc_enumerationMutation(v22);
                  v28 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v27);
                  v29 = (void *)MEMORY[0x1C3BD4F6C]();
                  if (objc_msgSend(v28, "type") == 1)
                  {
                    objc_msgSend(v28, "validDuration");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "startDateComponents");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v28, "validDuration");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "endDateComponents");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v31)
                      v34 = v33 == 0;
                    else
                      v34 = 1;
                    if (!v34)
                    {
                      objc_msgSend(v31, "timeZone");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = v35;
                      if (v35)
                      {
                        v37 = v35;
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
                        v37 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      v38 = v37;

                      objc_msgSend(v13, "setTimeZone:", v38);
                      objc_msgSend(v13, "dateFromComponents:", v31);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "timeIntervalSinceReferenceDate");
                      v41 = v40;

                      objc_msgSend(v33, "timeZone");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = v42;
                      v74 = v38;
                      if (v42)
                      {
                        v44 = v42;
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
                        v44 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      v45 = v44;

                      v73 = v45;
                      objc_msgSend(v13, "setTimeZone:", v45);
                      objc_msgSend(v13, "dateFromComponents:", v33);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v46, "timeIntervalSinceReferenceDate");
                      v48 = v47;

                      objc_msgSend(v24, "duplicateKey");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "bundleId");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v50)
                      {
                        v76 = 0;
                        objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v50, 0, &v76);
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        v52 = v76;
                        if (!v51)
                        {
                          sgLogHandle();
                          v53 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412546;
                            v86 = v50;
                            v87 = 2112;
                            v88 = v52;
                            _os_log_impl(&dword_1C3607000, v53, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: no record found for bundle id %@:%@", buf, 0x16u);
                          }

                        }
                        objc_msgSend(v51, "teamIdentifier");
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v54)
                        {
                          v55 = objc_alloc(MEMORY[0x1E0D19808]);
                          objc_msgSend(v28, "userActivity");
                          v56 = (void *)objc_claimAutoreleasedReturnValue();
                          v57 = (void *)objc_msgSend(v55, "initWithTeamIdentifier:type:userActivity:validStartDate:validEndDate:", v54, 1, v56, v41, v48);

                          objc_msgSend(v68, "addObject:", v57);
                          v24 = v69;
                        }

                        v13 = v70;
                        v22 = v72;
                      }
                      else
                      {
                        sgLogHandle();
                        v52 = objc_claimAutoreleasedReturnValue();
                        v22 = v72;
                        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1C3607000, v52, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: no bundle identifier identified", buf, 2u);
                        }
                      }

                      v26 = v71;
                    }

                    v25 = v75;
                  }
                  objc_autoreleasePoolPop(v29);
                  ++v27;
                }
                while (v25 != v27);
                v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
              }
              while (v25);
            }

            v16 = v62;
            v7 = v63;
            v15 = v64;
            v19 = v66;
            v17 = v67;
          }
          objc_autoreleasePoolPop(v19);
          ++v17;
        }
        while (v17 != v15);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      }
      while (v15);
    }

    objc_autoreleasePoolPop(context);
    v9 = v61;
  }
  else
  {
    v68 = 0;
  }

  return v68;
}

- (id)enrichmentsFromSchemas:(id)a3 inMessage:(id)a4 parentEntity:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a5;
  -[SGExtractionDissector outputFromSchemas:inMessage:](self, "outputFromSchemas:inMessage:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_opt_new();
  if (v8)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v8, "outputItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
          v14 = (void *)objc_opt_new();
          v15 = (void *)objc_opt_new();
          objc_msgSend(v8, "outputItems");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGExtractionDissector entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:](self, "entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:", v13, v16, v21, v14, v15, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 && !-[SGExtractionDissector _isPastEventFromEnrichment:](self, "_isPastEventFromEnrichment:", v17))
            objc_msgSend(v19, "addObject:", v17);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

  }
  return v19;
}

- (id)outputFromSchemas:(id)a3 inMessage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[SGExtractionDissector packedJSMailMessageFromMailMessage:](self, "packedJSMailMessageFromMailMessage:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("schemas"));
  -[SGExtractionDissector outputFromPackedJSSchema:](self, "outputFromPackedJSSchema:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)enrichmentsFromSchemas:(id)a3 inTextMessage:(id)a4 parentEntity:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  id v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26 = a5;
  -[SGExtractionDissector packedJSTextMessageFromTextMessage:](self, "packedJSTextMessageFromTextMessage:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("schemas"));
  -[SGExtractionDissector outputFromPackedJSSchema:](self, "outputFromPackedJSSchema:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_opt_new();
  if (v11)
  {
    v22 = v10;
    v23 = v8;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v11, "outputItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
          v17 = (void *)objc_opt_new();
          v18 = (void *)objc_opt_new();
          objc_msgSend(v11, "outputItems");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGExtractionDissector entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:](self, "entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:", v16, v19, v26, v17, v18, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20 && !-[SGExtractionDissector _isPastEventFromEnrichment:](self, "_isPastEventFromEnrichment:", v20))
            objc_msgSend(v24, "addObject:", v20);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    v10 = v22;
    v8 = v23;
  }

  return v24;
}

- (id)getFlightReferencesAndReservationId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__23084;
  v14 = __Block_byref_object_dispose__23085;
  v15 = 0;
  -[SGExtractionDissector packedJSTextMessageFromTextMessage:](self, "packedJSTextMessageFromTextMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SGExtractionDissector_getFlightReferencesAndReservationId___block_invoke;
  v9[3] = &unk_1E7DB0C20;
  v9[4] = &v10;
  objc_msgSend(v6, "getFlightReferencesAndReservationId:reply:", v5, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__23084;
  v19 = __Block_byref_object_dispose__23085;
  v20 = 0;
  -[SGExtractionDissector synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__SGExtractionDissector_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke;
  v14[3] = &unk_1E7DB1380;
  v14[4] = &v15;
  objc_msgSend(v11, "flightInformationWithAirlineCode:flightNumber:flightDate:reply:", v8, v9, v10, v14);

  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (BOOL)requiredFieldsMissingForOutput:(id)a3
{
  void *v4;

  if (!a3)
    return 1;
  objc_msgSend(a3, "outputItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SGExtractionDissector requiredFieldsMissingForOutputItems:](self, "requiredFieldsMissingForOutputItems:", v4);

  return (char)self;
}

- (BOOL)requiredFieldsMissingForOutputItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("requiredFieldsWithMissingValues"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v19;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v19 != v14)
                  objc_enumerationMutation(v11);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "count"))
                {

                  v16 = 1;
                  goto LABEL_21;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              if (v13)
                continue;
              break;
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v16 = 0;
      }
      while (v7);
    }
    else
    {
      v16 = 0;
    }
LABEL_21:

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (id)extractMissingValuesFromMLForMail:(id)a3 outputItems:(id)a4 fromSuggestTool:(BOOL)a5
{
  return -[SGExtractionDissector extractMissingValuesFromMLForMail:outputItems:fromSuggestTool:withFiEMLResults:](self, "extractMissingValuesFromMLForMail:outputItems:fromSuggestTool:withFiEMLResults:", a3, a4, a5, 0);
}

- (id)extractMissingValuesFromMLForMail:(id)a3 outputItems:(id)a4 fromSuggestTool:(BOOL)a5 withFiEMLResults:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  SGExtractionDissector *v28;
  _BOOL4 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v7 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11)
  {
    v28 = self;
    v29 = v7;
    v13 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v18), "objectForKeyedSubscript:", CFSTR("schemas"), v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v13, "addObjectsFromArray:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v13, "count"))
    {
      if ((unint64_t)objc_msgSend(v13, "count") <= 1)
      {
        objc_msgSend(v14, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("schemas"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("requiredFieldsWithMissingValues"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v25, "count"))
        {
          -[SGExtractionDissector extractMissingValueFromMLForMail:schema:fromSuggestTool:withFiEMLResults:](v28, "extractMissingValueFromMLForMail:schema:fromSuggestTool:withFiEMLResults:", v10, v23, v29, v12);
          v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = v23;
        }
        v20 = v26;

      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      -[SGExtractionDissector extractMissingValueFromMLForMail:schema:fromSuggestTool:withFiEMLResults:](v28, "extractMissingValueFromMLForMail:schema:fromSuggestTool:withFiEMLResults:", v10, 0, v29, v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[SGExtractionDissector extractMissingValueFromMLForMail:schema:fromSuggestTool:withFiEMLResults:](self, "extractMissingValueFromMLForMail:schema:fromSuggestTool:withFiEMLResults:", v10, 0, v7, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)extractMissingValueFromMLForMail:(id)a3 schema:(id)a4 fromSuggestTool:(BOOL)a5 withFiEMLResults:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v7)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "eventClassificationWithoutXPCForMailMessage:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1C3BD4F6C]();
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "eventClassificationForMailMessage:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v15);
  }
  -[SGExtractionDissector extractSchemaFromMLForMail:fromSuggestTool:withEventClassification:withFiEMLResults:](self, "extractSchemaFromMLForMail:fromSuggestTool:withEventClassification:withFiEMLResults:", v10, v7, v14, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)objc_opt_new();
    if (v11)
    {
      v19 = objc_msgSend(v11, "mutableCopy");

      v18 = (void *)v19;
    }
    -[SGExtractionDissector fillReverseTemplateSchema:usingDUFoundInEvent:eventClassification:fromSuggestTool:](self, "fillReverseTemplateSchema:usingDUFoundInEvent:eventClassification:fromSuggestTool:", v18, v17, v14, v7);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)extractSchemaFromMLForMail:(id)a3 fromSuggestTool:(BOOL)a4 withEventClassification:(id)a5 withFiEMLResults:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!-[SGExtractionDissector checkHybridMLSupportForSenderOfMail:](self, "checkHybridMLSupportForSenderOfMail:", v10))
    goto LABEL_14;
  objc_msgSend(v10, "htmlBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    sgEventsLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: No HTML body found. Bailing early from ensemble's ML pipeline extraction.", (uint8_t *)&v19, 2u);
    }
    goto LABEL_13;
  }
  if (!v11)
  {
    sgEventsLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, "SGExtractionDissector: eventClassification is nil, bailing", (uint8_t *)&v19, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!-[SGExtractionDissector checkMLSupportForMailWithEventClassification:](self, "checkMLSupportForMailWithEventClassification:", v11))
  {
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  sgEventsLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138412290;
    v20 = v11;
    _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "SGExtractionDissector eventClassification: %@", (uint8_t *)&v19, 0xCu);
  }

  if (a4)
  {
    v15 = v12;
  }
  else
  {
    -[SGExtractionDissector DUFoundInEventResultForMail:](self, "DUFoundInEventResultForMail:", v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v15;
LABEL_15:

  return v17;
}

- (BOOL)checkHybridMLSupportForSenderOfMail:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint8_t v12[16];

  v3 = a3;
  objc_msgSend(v3, "from");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[SGStructuredEventExtractionModel sharedInstance](SGStructuredEventExtractionModel, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "from");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emailAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isSenderSupportedForMLHybridExtraction:", v8);

  }
  else
  {
    sgEventsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: No sender mail address found. Bailing from ensemble's ML pipeline.", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)checkMLSupportForMailWithEventClassification:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  uint8_t v9[16];

  v4 = a3;
  if (objc_msgSend(v4, "useCase") && objc_msgSend(v4, "useCase") != 1)
  {
    objc_msgSend(v4, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SGExtractionDissector checkMLExtractionSupportForMailLocale:](self, "checkMLExtractionSupportForMailLocale:", v7))
    {
      v6 = -[SGExtractionDissector checkMLSupportForMailCategory:](self, "checkMLSupportForMailCategory:", objc_msgSend(v4, "category"));
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    sgEventsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Not classified as event, bailing", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (BOOL)checkMLExtractionSupportForMailLocale:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "substringWithRange:", 0, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("en"));

  return v4;
}

- (BOOL)checkMLSupportForMailCategory:(unsigned __int8)a3
{
  return (a3 - 4) < 5;
}

- (id)DUFoundInEventResultForMail:(id)a3
{
  id v3;
  SGSimpleMailMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v4 = [SGSimpleMailMessage alloc];
  -[SGSimpleMailMessage convertMailMessageToBMMailMessage:](v4, "convertMailMessageToBMMailMessage:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "encodeAsProto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23084;
  v15 = __Block_byref_object_dispose__23085;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__SGExtractionDissector_DUFoundInEventResultForMail___block_invoke;
  v10[3] = &unk_1E7DB0D40;
  v10[4] = &v11;
  objc_msgSend(v7, "foundInEventResultWithSerializedDocument:documentType:completion:", v6, 0, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)fillReverseTemplateSchema:(id)a3 usingDUFoundInEvent:(id)a4 eventClassification:(id)a5 fromSuggestTool:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  void *v168;
  __CFString *v169;
  __CFString *v170;
  __CFString *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  _QWORD *v191;
  _QWORD *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  id v197;
  void *v198;
  __CFString *v199;
  __CFString *v200;
  __CFString *v201;
  void *v202;
  __CFString *v203;
  __CFString *v204;
  __CFString *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  id v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  id v216;
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
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  __CFString *v232;
  void *v233;
  void *v234;
  __CFString *v235;
  __CFString *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  id v241;
  id v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  __CFString *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  __CFString *v262;
  void *v263;
  __CFString *v264;
  void *v265;
  _QWORD v266[2];
  _QWORD v267[2];
  _QWORD v268[3];
  _QWORD v269[3];
  _QWORD v270[4];
  _QWORD v271[4];
  _QWORD v272[2];
  _QWORD v273[2];
  _QWORD v274[3];
  _QWORD v275[3];
  _QWORD v276[5];
  _QWORD v277[5];
  _QWORD v278[2];
  _QWORD v279[2];
  _QWORD v280[2];
  _QWORD v281[2];
  _QWORD v282[3];
  _QWORD v283[3];
  _QWORD v284[3];
  _QWORD v285[3];
  _QWORD v286[2];
  _QWORD v287[2];
  _QWORD v288[3];
  _QWORD v289[3];
  _QWORD v290[2];
  _QWORD v291[2];
  _QWORD v292[3];
  _QWORD v293[5];

  v293[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  if ((objc_msgSend(v9, "detectedEventPolarity") & 1) == 0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E7E109C8, CFSTR("missingEntities"));
    goto LABEL_239;
  }
  objc_msgSend(v9, "reservationIdError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reservationId");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hotelName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "movieName");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAddressError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAddressComponents");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAddress");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endAddressError");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endAddressComponents");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endAddress");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startPlaceError");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startPlace");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endPlaceError");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endPlace");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v264 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v262 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "guestName");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v251 = v13;
  v252 = v11;
  v250 = v15;
  switch(objc_msgSend(v10, "category"))
  {
    case 4u:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        if (v13)
          v17 = v13;
        else
          v17 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("reservationId"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("checkinTime"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        if (v264)
          v19 = v264;
        else
          v19 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("checkinTime"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("checkoutTime"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        if (v262)
          v21 = v262;
        else
          v21 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("checkoutTime"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("name"));
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("address"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
LABEL_98:
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("underName"));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("name"));
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v108)
          {
            v286[1] = CFSTR("name");
            v287[0] = CFSTR("http://schema.org/Person");
            v286[0] = CFSTR("@type");
            v109 = v265;
            if (!v265)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v287[1] = v109;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v287, v286, 2);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v110, CFSTR("underName"));

            if (!v265)
          }
          if (objc_msgSend(v10, "isCancelled"))
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("name"));
            v111 = objc_claimAutoreleasedReturnValue();
            if (v111)
            {
              v93 = (void *)v111;
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationId"));
              v94 = objc_claimAutoreleasedReturnValue();
              if (v94)
                goto LABEL_106;
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("checkinTime"));
              v193 = (void *)objc_claimAutoreleasedReturnValue();

              if (v193)
                goto LABEL_225;
            }
            else
            {

            }
          }
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("name"));
          v157 = objc_claimAutoreleasedReturnValue();
          if (!v157)
            goto LABEL_233;
          v112 = (void *)v157;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("checkinTime"));
          v158 = objc_claimAutoreleasedReturnValue();
          if (v158)
          {
            v159 = (void *)v158;
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("checkoutTime"));
            v156 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_152;
          }
          goto LABEL_166;
        }
      }
      else
      {

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("name"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v97;
      v246 = v12;
      if (v97 || (v98 = v14) != 0)
      {
        v99 = v98;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v99 = (id)objc_claimAutoreleasedReturnValue();
      }
      v100 = v99;
      v249 = v14;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("address"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = v102;
      if (v102 || (v103 = v263) != 0 || (v103 = v258) != 0)
      {
        v104 = v103;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v104 = (id)objc_claimAutoreleasedReturnValue();
      }
      v105 = v104;

      v288[0] = CFSTR("@type");
      v288[1] = CFSTR("name");
      v289[0] = CFSTR("http://schema.org/LodgingBusiness");
      v289[1] = v100;
      v288[2] = CFSTR("address");
      v289[2] = v105;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v289, v288, 3);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v106, CFSTR("reservationFor"));

      v12 = v246;
      v14 = v249;
      goto LABEL_98;
    case 5u:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        if (v13)
          v29 = v13;
        else
          v29 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("reservationId"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pickupTime"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        if (v264)
          v31 = v264;
        else
          v31 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("pickupTime"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pickupLocation"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("address"));
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)v33;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pickupLocation"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("name"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
          goto LABEL_116;
      }
      else
      {

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pickupLocation"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("address"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = v114;
      if (v114 || (v115 = v263) != 0 || (v115 = v258) != 0)
      {
        v116 = v12;
        v117 = v115;
      }
      else
      {
        v116 = v12;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v117 = (id)objc_claimAutoreleasedReturnValue();
      }
      v118 = v117;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pickupLocation"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("name"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v120;
      if (v120 || (v121 = v260) != 0)
      {
        v122 = v121;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v122 = (id)objc_claimAutoreleasedReturnValue();
      }
      v123 = v122;

      v284[0] = CFSTR("@type");
      v284[1] = CFSTR("address");
      v285[0] = CFSTR("http://schema.org/Place");
      v285[1] = v118;
      v284[2] = CFSTR("name");
      v285[2] = v123;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v285, v284, 3);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v124, CFSTR("pickupLocation"));

      v12 = v116;
LABEL_116:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dropoffTime"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v125)
      {
        if (v262)
          v126 = v262;
        else
          v126 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v126, CFSTR("dropoffTime"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dropoffLocation"));
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("address"));
      v128 = objc_claimAutoreleasedReturnValue();
      if (v128)
      {
        v129 = (void *)v128;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dropoffLocation"));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("name"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();

        if (v131)
          goto LABEL_133;
      }
      else
      {

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dropoffLocation"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("address"));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = v133;
      if (v133 || (v134 = v256) != 0 || (v134 = v253) != 0)
      {
        v135 = v12;
        v136 = v134;
      }
      else
      {
        v135 = v12;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v136 = (id)objc_claimAutoreleasedReturnValue();
      }
      v137 = v136;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dropoffLocation"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("name"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = v139;
      if (v139 || (v140 = v255) != 0)
      {
        v141 = v140;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v141 = (id)objc_claimAutoreleasedReturnValue();
      }
      v142 = v141;

      v282[0] = CFSTR("@type");
      v282[1] = CFSTR("address");
      v283[0] = CFSTR("http://schema.org/Place");
      v283[1] = v137;
      v282[2] = CFSTR("name");
      v283[2] = v142;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v283, v282, 3);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v143, CFSTR("dropoffLocation"));

      v12 = v135;
LABEL_133:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("provider"));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("name"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v145)
      {
        v281[0] = CFSTR("http://schema.org/Organization");
        v280[0] = CFSTR("@type");
        v280[1] = CFSTR("name");
        objc_msgSend(v10, "providerName");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v281[1] = v146;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v281, v280, 2);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v147, CFSTR("provider"));

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("underName"));
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("name"));
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v149)
      {
        v278[1] = CFSTR("name");
        v279[0] = CFSTR("http://schema.org/Person");
        v278[0] = CFSTR("@type");
        v150 = v265;
        if (!v265)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v279[1] = v150;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v279, v278, 2);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v151, CFSTR("underName"));

        if (!v265)
      }
      if (!objc_msgSend(v10, "isCancelled"))
        goto LABEL_157;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("provider"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("name"));
      v152 = objc_claimAutoreleasedReturnValue();
      if (v152)
      {
        v93 = (void *)v152;
        if (!v12)
          goto LABEL_234;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pickupTime"));
        v153 = (void *)objc_claimAutoreleasedReturnValue();

        if (v153)
          goto LABEL_225;
      }
      else
      {

      }
LABEL_157:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("provider"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("name"));
      v160 = objc_claimAutoreleasedReturnValue();
      if (!v160)
        goto LABEL_233;
      v112 = (void *)v160;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pickupTime"));
      v161 = objc_claimAutoreleasedReturnValue();
      if (!v161)
      {
LABEL_166:
        v91 = v8;
        v8 = 0;
        goto LABEL_167;
      }
      v162 = (void *)v161;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dropoffTime"));
      v163 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      if (!v163)
        goto LABEL_235;
      v13 = v251;
      v11 = v252;
      v15 = v250;
      if (v12 || v250 || v261 || v257 || v254)
        goto LABEL_237;
      goto LABEL_238;
    case 6u:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        if (v13)
          v38 = v13;
        else
          v38 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, CFSTR("reservationId"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("name"));
      v40 = objc_claimAutoreleasedReturnValue();
      v241 = v10;
      v243 = v12;
      v247 = v14;
      if (!v40)
        goto LABEL_197;
      v41 = (void *)v40;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("startDate"));
      v43 = objc_claimAutoreleasedReturnValue();
      if (!v43)
        goto LABEL_196;
      v44 = (void *)v43;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("endDate"));
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_195;
      v233 = (void *)v46;
      v237 = v45;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("location"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("name"));
      v48 = objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        v49 = (void *)v48;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("location"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("address"));
        v230 = v47;
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v241;
        v12 = v243;
        v14 = v247;
        if (v52)
          goto LABEL_215;
      }
      else
      {

LABEL_195:
LABEL_196:

LABEL_197:
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "objectForKeyedSubscript:", CFSTR("name"));
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v196 = v195;
      if (v195 || (v196 = v259) != 0)
      {
        v197 = v196;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v197 = (id)objc_claimAutoreleasedReturnValue();
      }
      v240 = v197;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "objectForKeyedSubscript:", CFSTR("startDate"));
      v199 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v200 = v199;
      if (v199 || (v200 = v264) != 0)
      {
        v201 = v200;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v201 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v236 = v201;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "objectForKeyedSubscript:", CFSTR("endDate"));
      v203 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v204 = v203;
      if (v203 || (v204 = v262) != 0)
      {
        v205 = v204;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v205 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v232 = v205;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "objectForKeyedSubscript:", CFSTR("location"));
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "objectForKeyedSubscript:", CFSTR("name"));
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v209 = v208;
      if (v208 || (v209 = v260) != 0)
      {
        v210 = v209;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v210 = (id)objc_claimAutoreleasedReturnValue();
      }
      v211 = v210;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "objectForKeyedSubscript:", CFSTR("location"));
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "objectForKeyedSubscript:", CFSTR("address"));
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      v215 = v214;
      if (v214 || (v215 = v263) != 0 || (v215 = v258) != 0)
      {
        v216 = v215;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v216 = (id)objc_claimAutoreleasedReturnValue();
      }
      v217 = v216;

      v276[0] = CFSTR("@type");
      v276[1] = CFSTR("name");
      v277[0] = CFSTR("http://schema.org/Event");
      v277[1] = v240;
      v276[2] = CFSTR("startDate");
      v276[3] = CFSTR("endDate");
      v277[2] = v236;
      v277[3] = v232;
      v276[4] = CFSTR("location");
      v274[0] = CFSTR("@type");
      v274[1] = CFSTR("name");
      v275[0] = CFSTR("http://schema.org/Place");
      v275[1] = v211;
      v274[2] = CFSTR("address");
      v275[2] = v217;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v275, v274, 3);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      v277[4] = v218;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v277, v276, 5);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v219, CFSTR("reservationFor"));

      v10 = v241;
      v12 = v243;
      v14 = v247;
LABEL_215:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("underName"));
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "objectForKeyedSubscript:", CFSTR("name"));
      v221 = (void *)objc_claimAutoreleasedReturnValue();

      if (v221)
        goto LABEL_221;
      v272[1] = CFSTR("name");
      v273[0] = CFSTR("http://schema.org/Person");
      v272[0] = CFSTR("@type");
      v188 = v265;
      v189 = v265;
      if (!v265)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v273[1] = v189;
      v190 = (void *)MEMORY[0x1E0C99D80];
      v191 = v273;
      v192 = v272;
      goto LABEL_219;
    case 7u:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v53)
      {
        if (v13)
          v54 = v13;
        else
          v54 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v54, CFSTR("reservationId"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("name"));
      v56 = objc_claimAutoreleasedReturnValue();
      v242 = v10;
      v244 = v12;
      v248 = v14;
      if (!v56)
        goto LABEL_170;
      v57 = (void *)v56;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("startDate"));
      v59 = objc_claimAutoreleasedReturnValue();
      if (!v59)
        goto LABEL_169;
      v60 = (void *)v59;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "objectForKeyedSubscript:", CFSTR("location"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("name"));
      v62 = objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        v63 = (void *)v62;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("location"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("address"));
        v234 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v242;
        v12 = v244;
        v14 = v248;
        if (v234)
          goto LABEL_185;
      }
      else
      {

LABEL_169:
LABEL_170:

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "objectForKeyedSubscript:", CFSTR("name"));
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = v165;
      if (v165 || (v166 = v259) != 0)
      {
        v167 = v166;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v167 = (id)objc_claimAutoreleasedReturnValue();
      }
      v239 = v167;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "objectForKeyedSubscript:", CFSTR("startDate"));
      v169 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v170 = v169;
      if (v169 || (v170 = v264) != 0)
      {
        v171 = v170;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v171 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v235 = v171;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "objectForKeyedSubscript:", CFSTR("location"));
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "objectForKeyedSubscript:", CFSTR("name"));
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = v174;
      if (v174 || (v175 = v260) != 0)
      {
        v176 = v175;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v176 = (id)objc_claimAutoreleasedReturnValue();
      }
      v177 = v176;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "objectForKeyedSubscript:", CFSTR("location"));
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "objectForKeyedSubscript:", CFSTR("address"));
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = v180;
      if (v180 || (v181 = v263) != 0 || (v181 = v258) != 0)
      {
        v182 = v181;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v182 = (id)objc_claimAutoreleasedReturnValue();
      }
      v183 = v182;

      v270[0] = CFSTR("@type");
      v270[1] = CFSTR("name");
      v271[0] = CFSTR("http://schema.org/ScreeningEvent");
      v271[1] = v239;
      v271[2] = v235;
      v270[2] = CFSTR("startDate");
      v270[3] = CFSTR("location");
      v268[0] = CFSTR("@type");
      v268[1] = CFSTR("name");
      v269[0] = CFSTR("http://schema.org/Place");
      v269[1] = v177;
      v268[2] = CFSTR("address");
      v269[2] = v183;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v269, v268, 3);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v271[3] = v184;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v271, v270, 4);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v185, CFSTR("reservationFor"));

      v10 = v242;
      v12 = v244;
      v14 = v248;
LABEL_185:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("underName"));
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "objectForKeyedSubscript:", CFSTR("name"));
      v187 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v187)
      {
        v266[1] = CFSTR("name");
        v267[0] = CFSTR("http://schema.org/Person");
        v266[0] = CFSTR("@type");
        v188 = v265;
        v189 = v265;
        if (!v265)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v267[1] = v189;
        v190 = (void *)MEMORY[0x1E0C99D80];
        v191 = v267;
        v192 = v266;
LABEL_219:
        objc_msgSend(v190, "dictionaryWithObjects:forKeys:count:", v191, v192, 2);
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v222, CFSTR("underName"));

        if (!v188)
      }
LABEL_221:
      if (!objc_msgSend(v10, "isCancelled"))
        goto LABEL_227;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("name"));
      v223 = objc_claimAutoreleasedReturnValue();
      if (v223)
      {
        v93 = (void *)v223;
        if (!v12)
          goto LABEL_234;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v224, "objectForKeyedSubscript:", CFSTR("startDate"));
        v225 = (void *)objc_claimAutoreleasedReturnValue();

        if (v225)
          goto LABEL_225;
      }
      else
      {

      }
LABEL_227:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("name"));
      v226 = objc_claimAutoreleasedReturnValue();
      if (!v226)
        goto LABEL_233;
      v227 = (void *)v226;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "objectForKeyedSubscript:", CFSTR("startDate"));
      v229 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      if (!v229)
        goto LABEL_235;
      v11 = v252;
      if (v12)
        goto LABEL_236;
      v15 = v250;
      v13 = v251;
      if (v250 || v261)
        goto LABEL_237;
      goto LABEL_238;
    case 8u:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationId"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v66)
      {
        if (v13)
          v67 = v13;
        else
          v67 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v67, CFSTR("reservationId"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("name"));
      v69 = objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        v70 = (void *)v69;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("address"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
          goto LABEL_74;
      }
      else
      {

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("name"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74;
      v245 = v12;
      if (v74 || (v75 = v14) != 0)
      {
        v76 = v75;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v76 = (id)objc_claimAutoreleasedReturnValue();
      }
      v77 = v76;
      v78 = v14;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("address"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v80;
      if (v80 || (v81 = v263) != 0 || (v81 = v258) != 0)
      {
        v82 = v81;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v82 = (id)objc_claimAutoreleasedReturnValue();
      }
      v83 = v82;

      v292[0] = CFSTR("@type");
      v292[1] = CFSTR("name");
      v293[0] = CFSTR("http://schema.org/FoodEstablishment");
      v293[1] = v77;
      v292[2] = CFSTR("address");
      v293[2] = v83;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v293, v292, 3);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v84, CFSTR("reservationFor"));

      v12 = v245;
      v14 = v78;
LABEL_74:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startTime"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v85)
      {
        if (v264)
          v86 = v264;
        else
          v86 = &stru_1E7DB83A8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v86, CFSTR("startTime"));
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("underName"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("name"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v88)
      {
        v290[1] = CFSTR("name");
        v291[0] = CFSTR("http://schema.org/Person");
        v290[0] = CFSTR("@type");
        v89 = v265;
        if (!v265)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v291[1] = v89;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v291, v290, 2);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v90, CFSTR("underName"));

        if (!v265)
      }
      if (!objc_msgSend(v10, "isCancelled"))
        goto LABEL_146;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("name"));
      v92 = objc_claimAutoreleasedReturnValue();
      if (v92)
      {
        v93 = (void *)v92;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationId"));
        v94 = objc_claimAutoreleasedReturnValue();
        if (v94)
        {
LABEL_106:
          v112 = (void *)v94;
LABEL_167:

          goto LABEL_234;
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startTime"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        if (v95)
        {
LABEL_225:
          v13 = v251;
          v11 = v252;
          v15 = v250;
          goto LABEL_238;
        }
      }
      else
      {

      }
LABEL_146:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("name"));
      v154 = objc_claimAutoreleasedReturnValue();
      if (!v154)
      {
LABEL_233:
        v91 = v8;
        v8 = 0;
LABEL_234:
        v27 = v8;

        v8 = v91;
        goto LABEL_235;
      }
      v155 = (void *)v154;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startTime"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_152:
      v27 = 0;
      if (!v156)
      {
LABEL_235:
        v11 = v252;
LABEL_236:
        v15 = v250;
        v13 = v251;
        goto LABEL_237;
      }
      v13 = v251;
      v11 = v252;
      v15 = v250;
      if (v12 || v250)
      {
LABEL_237:

        v8 = v27;
      }
LABEL_238:

LABEL_239:
      return;
    default:
      v27 = 0;
      goto LABEL_237;
  }
}

- (void)addSchemaAsEnrichment:(id)a3 inMessage:(id)a4 parentEntity:(id)a5 eventClassification:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  __int128 v32;
  id obj;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  void *v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35 = a6;
  v37 = v10;
  v47[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v11;
  -[SGExtractionDissector enrichmentsFromSchemas:inMessage:parentEntity:](self, "enrichmentsFromSchemas:inMessage:parentEntity:", v13, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v14;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v38)
  {
    v34 = *(_QWORD *)v40;
    *(_QWORD *)&v15 = 138412290;
    v32 = v15;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v36, "from");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "emailAddress");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        emailAddressDomain(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(MEMORY[0x1E0D197F0], "domain:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addTag:", v22);

        }
        objc_msgSend(v12, "duplicateKey", v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bundleId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_alloc(MEMORY[0x1E0D19818]);
        +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", objc_msgSend(v35, "category"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v25, "initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:eventActivities:", 1, v26, v24, v27, 0, 0, 1.0);

        objc_msgSend(v28, "toJsonString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(MEMORY[0x1E0D197F0], "eventMetadata:", v29);
          v30 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addTag:", v30);
        }
        else
        {
          sgLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            v44 = v28;
            _os_log_error_impl(&dword_1C3607000, v30, OS_LOG_TYPE_ERROR, "Failed to convert object to JSON: %@", buf, 0xCu);
          }
        }

        objc_msgSend(v12, "addEnrichment:", v17);
        sgEventsLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEFAULT, "Added enrichment", buf, 2u);
        }

        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v38 != v16);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v38);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->knosisService, 0);
  objc_storeStrong((id *)&self->_classifierCache, 0);
  objc_storeStrong((id *)&self->_reverseTemplateJSNoXPC, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __53__SGExtractionDissector_DUFoundInEventResultForMail___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v5 = a2;
  if (a3)
  {
    sgEventsLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: FoundInEvents DU XPC call error", v9, 2u);
    }

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

void __82__SGExtractionDissector_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __61__SGExtractionDissector_getFlightReferencesAndReservationId___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __101__SGExtractionDissector_reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasExprOnceResult;
  reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
}

uint64_t __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
}

void __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)jsonLdOutputFromPackedJSEntity___pasExprOnceResult;
  jsonLdOutputFromPackedJSEntity___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __104__SGExtractionDissector_jsDictForResolveCandidates_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", a2, a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v12, "dictRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v6, "addObject:", v14);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

void __105__SGExtractionDissector_resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __105__SGExtractionDissector_resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasExprOnceResult;
  resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __95__SGExtractionDissector_resolveCandidates_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__SGExtractionDissector_parseHTML___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__SGExtractionDissector_eventClassificationWithoutXPCForMailMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SGStructuredEventClassification *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = -[SGStructuredEventClassification initWithDictionary:]([SGStructuredEventClassification alloc], "initWithDictionary:", v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __69__SGExtractionDissector_eventClassificationWithoutXPCForMailMessage___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)eventClassificationWithoutXPCForMailMessage___pasExprOnceResult;
  eventClassificationWithoutXPCForMailMessage___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __58__SGExtractionDissector_mergeSchemas_withExpectedSchemas___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__SGExtractionDissector_diffSchemas_withExpectedSchemas___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__SGExtractionDissector_privacyAwareLogsForMLExtractions___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __59__SGExtractionDissector_eventClassificationForMailMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "messageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    sgEventsLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "spotlightUniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "Found cached event classification for email %{public}@", buf, 0xCu);
LABEL_9:

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "packedJSMailMessageFromMailMessage:", *(_QWORD *)(a1 + 32));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__SGExtractionDissector_eventClassificationForMailMessage___block_invoke_2;
    v13[3] = &unk_1E7DB0C20;
    v13[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v10, "eventClassificationForEntity:reply:", v8, v13);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if ((unint64_t)objc_msgSend(v3, "count") >= 0x32)
        objc_msgSend(v3, "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 32), "messageId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 32), "messageId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v9);
        goto LABEL_9;
      }
    }
  }

}

void __59__SGExtractionDissector_eventClassificationForMailMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SGStructuredEventClassification *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = -[SGStructuredEventClassification initWithDictionary:]([SGStructuredEventClassification alloc], "initWithDictionary:", v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __59__SGExtractionDissector_dissectMailMessage_entity_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "messageId");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id __59__SGExtractionDissector_dissectMailMessage_entity_context___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  void *v5;
  const char *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    sgEventsLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
LABEL_3:

      return MEMORY[0x1E0C9AAB0];
    }
    objc_msgSend(*(id *)(a1 + 32), "spotlightUniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    v6 = "Found forwarded / reply email %{public}@";
LABEL_11:
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v7, 0xCu);

    goto LABEL_3;
  }
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v4 && objc_msgSend(v4, "isCandidateForExtraction"))
  {
    sgEventsLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      goto LABEL_3;
    objc_msgSend(*(id *)(a1 + 32), "spotlightUniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    v6 = "Found cached event classification for email %{public}@";
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "shouldDownloadFull:", *(_QWORD *)(a1 + 48)));
  return (id)objc_claimAutoreleasedReturnValue();
}

void __55__SGExtractionDissector_outputFromPackedJSTextMessage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  SGOutput *v13;
  uint64_t v14;
  void *v15;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = -[SGOutput initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:]([SGOutput alloc], "initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:", v12, v11, v10, v9);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __55__SGExtractionDissector_outputFromPackedJSMailMessage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  SGOutput *v13;
  uint64_t v14;
  void *v15;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = -[SGOutput initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:]([SGOutput alloc], "initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:", v12, v11, v10, v9);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __50__SGExtractionDissector_outputFromPackedJSSchema___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  SGOutput *v13;
  uint64_t v14;
  void *v15;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = -[SGOutput initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:]([SGOutput alloc], "initWithOutputItems:sourceMetadata:exeptionTemplates:jsMessageLogs:", v12, v11, v10, v9);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

uint64_t __44__SGExtractionDissector_shouldDownloadFull___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

id __112__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction___block_invoke_399(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v23 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("transportation"), v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("graph"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", CFSTR("iata"));

          if (v11)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("carrier"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(v26 + 40));

            if (v13)
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("origin"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("name"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "isEqual:", v25))
              {

              }
              else
              {
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("destination"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("name"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v17, "isEqual:", v25);

                if (!v24)
                  goto LABEL_15;
              }
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("routeDesignation"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v18)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "integerValue"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObject:", v20);

              }
            }
          }
        }
LABEL_15:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }

  v21 = (void *)objc_msgSend(v23, "copy");
  return v21;
}

void __112__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  SGStorageLocation *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  SGStorageLocation *v42;
  void *v43;
  SGStorageLocation *v44;
  NSObject *v45;
  SGStorageLocation *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntValue");
  v7 = v5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("address"));
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("address"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("address"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGExtractionDissector addressDictionaryToString:](SGExtractionDissector, "addressDictionaryToString:", v11);
      v8 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("address"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("address"));
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("code"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[SGFlightData sharedInstance](SGFlightData, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("code"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bestLocalizedNameForAirport:", v17);
        v14 = objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("flightDataResolvedAirportNameForLocation"));
          goto LABEL_14;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("code"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_14;
      }
    }
    v14 = (uint64_t)(id)v8;
  }
LABEL_14:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("coordinates"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("coordinates"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("coordinates"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    if (v22 >= -90.0 && v22 <= 90.0 && v26 >= -180.0 && v26 <= 180.0)
    {
      v27 = *(void **)(a1 + 40);
      v28 = [SGStorageLocation alloc];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("code"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[SGStorageLocation initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](v28, "initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", v6, v14, v8, v29, 0, v22, v26, 0.0, 0.0);
LABEL_34:
      v47 = (void *)v30;
      objc_msgSend(v27, "addObject:", v30);

      goto LABEL_35;
    }
  }
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("code"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      +[SGFlightData sharedInstance](SGFlightData, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("code"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "latitudeAndLongitudeForAirport:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("flightDataResolvedAirportCoordinates"));
        objc_msgSend(v34, "first");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v37 = v36;

        objc_msgSend(v34, "second");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        v40 = v39;

        if (v37 >= -90.0 && v37 <= 90.0 && v40 >= -180.0 && v40 <= 180.0)
        {
          v41 = *(void **)(a1 + 40);
          v42 = [SGStorageLocation alloc];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("code"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = -[SGStorageLocation initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](v42, "initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", v6, v14, v8, v43, 0, v37, v40, 0.0, 0.0);
          objc_msgSend(v41, "addObject:", v44);

          goto LABEL_35;
        }
        sgLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          +[SGAsset asset](SGAsset, "asset");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 134217984;
          v50 = objc_msgSend(v48, "assetVersion");
          _os_log_error_impl(&dword_1C3607000, v45, OS_LOG_TYPE_ERROR, "Invalid airport latitude or longitude. Asset version: %lu", (uint8_t *)&v49, 0xCu);

        }
      }

    }
  }
  if (v14 | v8)
  {
    v27 = *(void **)(a1 + 40);
    v46 = [SGStorageLocation alloc];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("code"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[SGStorageLocation initWithType:label:address:airportCode:accuracy:quality:](v46, "initWithType:label:address:airportCode:accuracy:quality:", v6, v14, v8, v29, 0.0, 0.0);
    goto LABEL_34;
  }
LABEL_35:

}

BOOL __112__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction___block_invoke_495(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __112__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction___block_invoke_455()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", &unk_1E7E109B0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__locationsSharedKeySet;
  entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__locationsSharedKeySet = v0;

}

void __112__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", &unk_1E7E10998);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__paramsSharedKeySet;
  entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction__paramsSharedKeySet = v0;

}

void __70__SGExtractionDissector_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1C3607000, v3, OS_LOG_TYPE_ERROR, "SGExtractionDissector: XPC error %@", (uint8_t *)&v4, 0xCu);
  }

}

+ (id)addParams:(id)a3 toParameterizedString:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "addParams:toParameterizedString:allowAlternatives:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)addParams:(id)a3 toParameterizedString:(id)a4 allowAlternatives:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __75__SGExtractionDissector_addParams_toParameterizedString_allowAlternatives___block_invoke;
      v22[3] = &unk_1E7DB0A88;
      v10 = v7;
      v23 = v10;
      v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1C3BD5158](v22);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        ((void (**)(_QWORD, id, id, _BOOL8))v11)[2](v11, v10, v8, v5);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        v9 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0 && v5)
        {
          v20 = 0u;
          v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          v12 = v8;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v19;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v19 != v15)
                  objc_enumerationMutation(v12);
                ((void (**)(_QWORD, id, _QWORD, uint64_t))v11)[2](v11, v10, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), 1);
                v9 = (id)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v9, "length", (_QWORD)v18))
                {

                  goto LABEL_19;
                }

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
              if (v14)
                continue;
              break;
            }
          }

          v9 = 0;
        }
      }
LABEL_19:

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)addressDictionaryToString:(id)a3
{
  id v3;
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

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Street"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStreet:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("City"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCity:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("State"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", v8);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ZIP"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPostalCode:", v9);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Country"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountry:", v10);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CountryCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setISOCountryCode:", v11);

  objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _PASCollapseWhitespaceAndStrip();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v13;
}

+ (id)subjectFromMailMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__23084;
  v12 = __Block_byref_object_dispose__23085;
  v13 = 0;
  objc_msgSend(v3, "subject");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SGExtractionDissector_subjectFromMailMessage___block_invoke;
  v7[3] = &unk_1E7DB0BD0;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (BOOL)emailIsForwardOrReply:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(v3, "headers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SGExtractionDissector_emailIsForwardOrReply___block_invoke;
  v6[3] = &unk_1E7DB0BD0;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __47__SGExtractionDissector_emailIsForwardOrReply___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a2, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", CFSTR("in-reply-to")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "found forward or reply header in email", v8, 2u);
    }

  }
}

void __48__SGExtractionDissector_subjectFromMailMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", CFSTR("subject")))
  {
    objc_msgSend(v7, "value");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

id __75__SGExtractionDissector_addParams_toParameterizedString_allowAlternatives___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("segments"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "appendString:", v12);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendString:", v14);

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v15 && (a4 & 1) != 0)
                {

                  v17 = 0;
                  goto LABEL_22;
                }
              }
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          continue;
        break;
      }
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:
    v16 = v6;
    goto LABEL_20;
  }
  v16 = v5;
LABEL_20:
  v17 = v16;
LABEL_22:

  return v17;
}

@end
