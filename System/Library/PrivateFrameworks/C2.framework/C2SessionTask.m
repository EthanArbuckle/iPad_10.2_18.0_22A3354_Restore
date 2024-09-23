@implementation C2SessionTask

- (void)captureMetricsWithError:(id)a3 eventType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __objc2_class_ro **p_info;
  NSObject *v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  uint64_t v77;
  void *v78;
  const __CFString *v79;
  uint64_t v80;
  void *v81;
  const __CFString *v82;
  uint64_t v83;
  void *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  _BOOL4 v95;
  const __CFString *v96;
  void *v97;
  void *v98;
  __CFString *v99;
  __CFString *v100;
  id v101;
  uint64_t v102;
  void *v103;
  _BOOL4 v104;
  void *v105;
  void *v106;
  void *v107;
  const __CFString *v108;
  void *v109;
  void *v110;
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
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  const __CFString *v135;
  void *v136;
  char isKindOfClass;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  const __CFString *v146;
  void *v147;
  void *v148;
  void *v149;
  __CFString *v150;
  NSObject *v151;
  void *v152;
  void *v153;
  char v154;
  void *v155;
  void *v156;
  void *v157;
  _BOOL8 v158;
  void *v159;
  uint64_t v160;
  C2MPNetworkEvent *v161;
  C2SessionTask *v162;
  C2MPNetworkEvent *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  NSObject *v176;
  NSObject *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  char v183;
  void *v184;
  NSObject *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  double v190;
  double v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  uint32_t path_count;
  uint32_t v198;
  uint32_t i;
  NSObject *v200;
  C2MPPathInfo *v201;
  nw_interface_type_t type;
  C2MPPathInfo *v203;
  const __CFString *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  const __CFString *v216;
  const __CFString *v217;
  id v218;
  const __CFString *v219;
  const __CFString *v220;
  const __CFString *v221;
  const __CFString *v222;
  const __CFString *v223;
  const __CFString *v224;
  const __CFString *v225;
  uint64_t v226;
  const __CFString *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const __CFString *v231;
  uint64_t v232;
  const __CFString *v233;
  const __CFString *v234;
  uint64_t v235;
  const __CFString *v236;
  const __CFString *v237;
  const __CFString *v238;
  const __CFString *v239;
  const __CFString *v240;
  const __CFString *v241;
  const __CFString *v242;
  const __CFString *v243;
  const __CFString *v244;
  id v245;
  void *v246;
  void *v247;
  void *v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  NSObject *log;
  os_log_t loga;
  int64_t v257;
  int64_t v258;
  uint64_t v259;
  void *v260;
  void *v261;
  void *v262;
  id v263;
  id v264;
  id v265;
  double v266;
  double v267;
  NSObject *report;
  C2SessionTask *v269;
  void *v270;
  const __CFString *v271;
  void *v272;
  uint8_t buf[4];
  const __CFString *v274;
  __int16 v275;
  const __CFString *v276;
  __int16 v277;
  const __CFString *v278;
  __int16 v279;
  const __CFString *v280;
  __int16 v281;
  const __CFString *v282;
  __int16 v283;
  const __CFString *v284;
  __int16 v285;
  const __CFString *v286;
  __int16 v287;
  const __CFString *v288;
  __int16 v289;
  id v290;
  __int16 v291;
  const __CFString *v292;
  __int16 v293;
  const __CFString *v294;
  __int16 v295;
  uint64_t v296;
  __int16 v297;
  const __CFString *v298;
  __int16 v299;
  const __CFString *v300;
  __int16 v301;
  const __CFString *v302;
  __int16 v303;
  uint64_t v304;
  __int16 v305;
  uint64_t v306;
  __int16 v307;
  uint64_t v308;
  __int16 v309;
  uint64_t v310;
  __int16 v311;
  uint64_t v312;
  __int16 v313;
  uint64_t v314;
  __int16 v315;
  uint64_t v316;
  __int16 v317;
  uint64_t v318;
  __int16 v319;
  uint64_t v320;
  __int16 v321;
  uint64_t v322;
  __int16 v323;
  const __CFString *v324;
  __int16 v325;
  const __CFString *v326;
  __int16 v327;
  const __CFString *v328;
  __int16 v329;
  const __CFString *v330;
  __int16 v331;
  const __CFString *v332;
  __int16 v333;
  const __CFString *v334;
  __int16 v335;
  const __CFString *v336;
  __int16 v337;
  const __CFString *v338;
  __int16 v339;
  const __CFString *v340;
  __int16 v341;
  id v342;
  __int16 v343;
  id v344;
  __int16 v345;
  uint64_t v346;
  __int16 v347;
  uint64_t v348;
  __int16 v349;
  const __CFString *v350;
  __int16 v351;
  const __CFString *v352;
  uint64_t v353;

  v353 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSURLSessionDataTask _timingData](self->_task, "_timingData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskMetrics transactionMetrics](self->_taskMetrics, "transactionMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_dataTransferReport");
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSURLSessionDataTask currentRequest](self->_task, "currentRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  +[C2SessionTask captureMetricsForTimingData:withKey:](C2SessionTask, "captureMetricsForTimingData:withKey:", v7, CFSTR("_kCFNTimingDataDomainLookupStart"));
  v13 = v12;
  +[C2SessionTask captureMetricsForTimingData:withKey:](C2SessionTask, "captureMetricsForTimingData:withKey:", v7, CFSTR("_kCFNTimingDataDomainLookupEnd"));
  v15 = v14;
  +[C2SessionTask captureMetricsForTimingData:withKey:](C2SessionTask, "captureMetricsForTimingData:withKey:", v7, CFSTR("_kCFNTimingDataConnectStart"));
  v17 = v16;
  +[C2SessionTask captureMetricsForTimingData:withKey:](C2SessionTask, "captureMetricsForTimingData:withKey:", v7, CFSTR("_kCFNTimingDataConnectEnd"));
  v266 = v18;
  +[C2SessionTask captureMetricsForTimingData:withKey:](C2SessionTask, "captureMetricsForTimingData:withKey:", v7, CFSTR("_kCFNTimingDataSecureConnectionStart"));
  v20 = v19;
  +[C2SessionTask captureMetricsForTimingData:withKey:](C2SessionTask, "captureMetricsForTimingData:withKey:", v7, CFSTR("_kCFNTimingDataRequestStart"));
  v22 = v21;
  +[C2SessionTask captureMetricsForTimingData:withKey:](C2SessionTask, "captureMetricsForTimingData:withKey:", v7, CFSTR("_kCFNTimingDataRequestEnd"));
  v24 = v23;
  +[C2SessionTask captureMetricsForTimingData:withKey:](C2SessionTask, "captureMetricsForTimingData:withKey:", v7, CFSTR("_kCFNTimingDataResponseStart"));
  v26 = v25;
  +[C2SessionTask captureMetricsForTimingData:withKey:](C2SessionTask, "captureMetricsForTimingData:withKey:", v7, CFSTR("_kCFNTimingDataResponseEnd"));
  v28 = v27;
  p_info = C2MetricOperationOptions.info;
  if (C2_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_57);
  v30 = (id)C2_DEFAULT_LOG_INTERNAL_3;
  report = v10;
  v269 = self;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v257 = a4;
    -[NSURLSessionDataTask taskDescription](self->_task, "taskDescription");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = &stru_1E989B0F0;
    v248 = (void *)v31;
    if (v31)
      v33 = (const __CFString *)v31;
    else
      v33 = &stru_1E989B0F0;
    v244 = v33;
    objc_msgSend(v270, "host");
    v34 = objc_claimAutoreleasedReturnValue();
    v247 = (void *)v34;
    if (v34)
      v35 = (const __CFString *)v34;
    else
      v35 = &stru_1E989B0F0;
    v243 = v35;
    log = v30;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRemoteAddressAndPort"));
      v36 = objc_claimAutoreleasedReturnValue();
      v215 = (void *)v36;
      if (v36)
        v37 = (const __CFString *)v36;
      else
        v37 = &stru_1E989B0F0;
      v242 = v37;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataLocalAddressAndPort"));
      v38 = objc_claimAutoreleasedReturnValue();
      v214 = (void *)v38;
      if (v38)
        v39 = (const __CFString *)v38;
      else
        v39 = &stru_1E989B0F0;
      v241 = v39;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionUUID"));
      v40 = objc_claimAutoreleasedReturnValue();
      v213 = (void *)v40;
      if (v40)
        v41 = (const __CFString *)v40;
      else
        v41 = &stru_1E989B0F0;
      v240 = v41;
    }
    else
    {
      v241 = &stru_1E989B0F0;
      v242 = &stru_1E989B0F0;
      v240 = &stru_1E989B0F0;
    }
    +[C2RequestOptions stringForQualityOfService:](C2RequestOptions, "stringForQualityOfService:", -[C2RequestOptions qualityOfService](self->_options, "qualityOfService"));
    v42 = objc_claimAutoreleasedReturnValue();
    v246 = (void *)v42;
    if (v42)
      v43 = (const __CFString *)v42;
    else
      v43 = &stru_1E989B0F0;
    v239 = v43;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionReused"));
      v44 = objc_claimAutoreleasedReturnValue();
      v212 = (void *)v44;
      if (v44)
        v45 = (const __CFString *)v44;
      else
        v45 = &stru_1E989B0F0;
      v238 = v45;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionInterfaceIdentifier"));
      v46 = objc_claimAutoreleasedReturnValue();
      v211 = (void *)v46;
      if (v46)
        v47 = (const __CFString *)v46;
      else
        v47 = &stru_1E989B0F0;
      v237 = v47;
    }
    else
    {
      v237 = &stru_1E989B0F0;
      v238 = &stru_1E989B0F0;
    }
    objc_msgSend(v9, "c2_NegotiatedTLSProtocolVersionString");
    v245 = (id)objc_claimAutoreleasedReturnValue();
    v260 = v11;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataNetworkProtocolName"));
      v48 = objc_claimAutoreleasedReturnValue();
      v210 = (void *)v48;
      if (v48)
        v49 = (const __CFString *)v48;
      else
        v49 = &stru_1E989B0F0;
      v236 = v49;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRequestHeaderSize"));
      v50 = objc_claimAutoreleasedReturnValue();
      v209 = (void *)v50;
      if (v50)
        v51 = (const __CFString *)v50;
      else
        v51 = &stru_1E989B0F0;
      v234 = v51;
      v235 = -[NSURLSessionDataTask countOfBytesSent](self->_task, "countOfBytesSent");
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseHeaderSize"));
      v52 = objc_claimAutoreleasedReturnValue();
      v208 = (void *)v52;
      if (v52)
        v53 = (const __CFString *)v52;
      else
        v53 = &stru_1E989B0F0;
      v233 = v53;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseBodyBytesReceived"));
      v54 = objc_claimAutoreleasedReturnValue();
      v207 = (void *)v54;
      if (v54)
        v55 = (const __CFString *)v54;
      else
        v55 = &stru_1E989B0F0;
      v231 = v55;
    }
    else
    {
      v235 = -[NSURLSessionDataTask countOfBytesSent](self->_task, "countOfBytesSent");
      v236 = &stru_1E989B0F0;
      v233 = &stru_1E989B0F0;
      v234 = &stru_1E989B0F0;
      v231 = &stru_1E989B0F0;
    }
    v263 = v6;
    if (v6)
      v56 = CFSTR("T");
    else
      v56 = CFSTR("F");
    v227 = v56;
    v249 = v13;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v13, v15);
    v230 = v57;
    v250 = v15;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v15, v17);
    v229 = v58;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v17, v266);
    v226 = v59;
    v251 = v17;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v17, v20);
    v232 = v60;
    v267 = v20;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v20, v22);
    v62 = v61;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v266, v22);
    v64 = v63;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v22, v24);
    v65 = v24;
    v67 = v66;
    v252 = v65;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v65, v26);
    v228 = v68;
    v253 = v26;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v26, v28);
    v70 = v69;
    v254 = v28;
    +[C2SessionTask captureMetricDurationBetweenStart:andEnd:](C2SessionTask, "captureMetricDurationBetweenStart:andEnd:", v22, v28);
    v72 = v71;
    if (-[C2RequestOptions outOfProcess](self->_options, "outOfProcess"))
      v73 = CFSTR("T");
    else
      v73 = CFSTR("F");
    v225 = v73;
    if (-[C2RequestOptions allowsCellularAccess](self->_options, "allowsCellularAccess"))
      v74 = CFSTR("T");
    else
      v74 = CFSTR("F");
    v224 = v74;
    if (-[C2RequestOptions _allowsExpensiveAccess](self->_options, "_allowsExpensiveAccess"))
      v75 = CFSTR("T");
    else
      v75 = CFSTR("F");
    v223 = v75;
    if (-[C2RequestOptions _allowsPowerNapScheduling](self->_options, "_allowsPowerNapScheduling"))
      v76 = CFSTR("T");
    else
      v76 = CFSTR("F");
    v222 = v76;
    -[C2RequestOptions _sourceApplicationBundleIdentifier](self->_options, "_sourceApplicationBundleIdentifier");
    v77 = objc_claimAutoreleasedReturnValue();
    v78 = (void *)v77;
    if (v77)
      v79 = (const __CFString *)v77;
    else
      v79 = &stru_1E989B0F0;
    v221 = v79;
    -[C2RequestOptions _sourceApplicationSecondaryIdentifier](self->_options, "_sourceApplicationSecondaryIdentifier");
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)v80;
    if (v80)
      v82 = (const __CFString *)v80;
    else
      v82 = &stru_1E989B0F0;
    v220 = v82;
    -[C2RequestOptions outOfProcessPoolName](self->_options, "outOfProcessPoolName");
    v83 = objc_claimAutoreleasedReturnValue();
    v84 = (void *)v83;
    if (v83)
      v85 = (const __CFString *)v83;
    else
      v85 = &stru_1E989B0F0;
    v219 = v85;
    if (-[C2RequestOptions tlsPinning](self->_options, "tlsPinning"))
      v86 = CFSTR("T");
    else
      v86 = CFSTR("F");
    v217 = v86;
    if (-[C2RequestOptions _allowsRetryForBackgroundDataTasks](self->_options, "_allowsRetryForBackgroundDataTasks"))
      v87 = CFSTR("T");
    else
      v87 = CFSTR("F");
    v216 = v87;
    +[C2RequestOptions stringForDiscretionaryNetworkBehavior:](C2RequestOptions, "stringForDiscretionaryNetworkBehavior:", -[C2RequestOptions discretionaryNetworkBehavior](self->_options, "discretionaryNetworkBehavior"));
    v218 = (id)objc_claimAutoreleasedReturnValue();
    +[C2RequestOptions stringForDuetPreClearedMode:](C2RequestOptions, "stringForDuetPreClearedMode:", -[C2RequestOptions duetPreClearedMode](self->_options, "duetPreClearedMode"));
    v88 = (id)objc_claimAutoreleasedReturnValue();
    -[C2RequestOptions _timeoutIntervalForRequest](self->_options, "_timeoutIntervalForRequest");
    v90 = v89;
    -[C2RequestOptions _timeoutIntervalForResource](self->_options, "_timeoutIntervalForResource");
    v92 = v91;
    -[C2RequestOptions _appleIDContextSessionIdentifier](self->_options, "_appleIDContextSessionIdentifier");
    v93 = objc_claimAutoreleasedReturnValue();
    v94 = (void *)v93;
    if (v93)
      v32 = (const __CFString *)v93;
    v95 = -[C2RequestOptions metricRequest](self->_options, "metricRequest");
    v274 = v244;
    if (v95)
      v96 = CFSTR("T");
    else
      v96 = CFSTR("F");
    v276 = v243;
    v278 = v242;
    v277 = 2113;
    v279 = 2113;
    v280 = v241;
    v282 = v240;
    v284 = v239;
    v286 = v238;
    v288 = v237;
    v292 = v236;
    v294 = v234;
    v296 = v235;
    v298 = v233;
    v300 = v231;
    v301 = 2112;
    v302 = v227;
    v324 = v225;
    v304 = v230;
    v306 = v229;
    v308 = v226;
    v312 = v62;
    v314 = v64;
    v316 = v67;
    v320 = v70;
    v322 = v72;
    v326 = v224;
    v328 = v223;
    v330 = v222;
    v332 = v221;
    v334 = v220;
    v336 = v219;
    v338 = v217;
    v340 = v216;
    v295 = 2048;
    v303 = 2048;
    v305 = 2048;
    v307 = 2048;
    v309 = 2048;
    v311 = 2048;
    v313 = 2048;
    v315 = 2048;
    v317 = 2048;
    v319 = 2048;
    v321 = 2048;
    v345 = 2048;
    v347 = 2048;
    v352 = v96;
    v344 = v88;
    v346 = v90;
    v348 = v92;
    v350 = v32;
    v275 = 2114;
    v281 = 2114;
    v283 = 2114;
    v285 = 2114;
    v287 = 2114;
    v289 = 2114;
    v291 = 2114;
    v293 = 2114;
    v297 = 2114;
    v299 = 2114;
    v323 = 2114;
    v325 = 2114;
    v327 = 2114;
    v329 = 2114;
    v331 = 2114;
    v333 = 2114;
    v335 = 2114;
    v337 = 2114;
    v339 = 2114;
    v341 = 2114;
    v343 = 2114;
    v349 = 2114;
    v351 = 2114;
    *(_DWORD *)buf = 138553347;
    v290 = v245;
    v310 = v232;
    v318 = v228;
    v342 = v218;
    _os_log_impl(&dword_1D4DC3000, log, OS_LOG_TYPE_DEFAULT, "captureMetricsForTask=%{public}@:host=%{public}@:remoteAddress=%{private}@:localAddress=%{private}@:connectionUUID=%{public}@:qualityOfService=%{public}@:reuse=%{public}@:i=%{public}@:tlsVersion=%{public}@:protocol=%{public}@:requestHeaderBytes=%{public}@:requestBodyBytes=%llu:responseHeaderBytes=%{public}@:responseBodyBytes=%{public}@:err=%@:dnsDuration=%.3f:tcpStartDelay=%.3f:tcpDuration=%.3f:sslStartDelay=%.3f:sslDuration=%.3f:requestStartDelay=%.3f:requestDuration=%.3f:responseStartDelay=%.3f:responseDuration=%.3f:transactionDuration=%.3f:outOfProcess=%{public}@:allowCellular=%{public}@:allowExpensive=%{public}@:powerNap=%{public}@:app=%{public}@:2app=%{public}@:pool=%{public}@:tlsPinning=%{public}@:retryNetworkFailures=%{public}@:disc=%{public}@:duet=%{public}@:reqTimeout=%.2f:resTimeout=%.2f:appleIdSessionId=%{public}@:metricRequest=%{public}@", buf, 0x192u);

    if (v7)
    {

      a4 = v257;
      p_info = (__objc2_class_ro **)(C2MetricOperationOptions + 32);
      v97 = v214;
      v98 = v215;
    }
    else
    {
      v97 = v245;
      v98 = v246;
      a4 = v257;
      p_info = C2MetricOperationOptions.info;
    }

    v6 = v263;
    v11 = v260;
    v26 = v253;
    v28 = v254;
    v24 = v252;
    v20 = v267;
    v15 = v250;
    v17 = v251;
    v13 = v249;
    v30 = log;
  }

  if (v6)
  {
    v99 = CFSTR("RetryableNetworkingError");
    if (a4 == 1)
      v99 = CFSTR("NetworkingError");
    v100 = v99;
    if (p_info[213] != (__objc2_class_ro *)-1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_89);
    v101 = (id)C2_DEFAULT_LOG_INTERNAL_3;
    +[C2Logging printToLog:withDescription:object:](C2Logging, "printToLog:withDescription:object:", v101, v100, v6);

  }
  -[C2RequestOptions metricOptions](self->_options, "metricOptions");
  v102 = objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v103 = (void *)v102;
    v104 = +[C2RequestOptions triesteMetricsEnabled](C2RequestOptions, "triesteMetricsEnabled");

    if (v104)
    {
      v258 = a4;
      v261 = v11;
      v105 = (void *)objc_opt_new();
      v106 = (void *)objc_opt_new();
      objc_msgSend(v105, "setObject:forKeyedSubscript:", v106, CFSTR("client"));
      -[NSURLSessionDataTask taskDescription](self->_task, "taskDescription");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setObject:forKeyedSubscript:", v107, CFSTR("taskDescription"));

      if (v6)
        v108 = CFSTR("T");
      else
        v108 = CFSTR("F");
      objc_msgSend(v106, "setObject:forKeyedSubscript:", v108, CFSTR("error"));
      v109 = (void *)objc_opt_new();
      objc_msgSend(v105, "setObject:forKeyedSubscript:", v109, CFSTR("timing"));
      if (v13 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v13));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v110, CFSTR("dnsStart"));

      }
      if (v15 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v15));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v111, CFSTR("dnsEnd"));

      }
      if (v17 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v17));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v112, CFSTR("tcpStart"));

      }
      if (v266 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v266));
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v113, CFSTR("tcpEnd"));

      }
      if (v20 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v20));
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v114, CFSTR("sslStart"));

      }
      if (v22 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v22));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v115, CFSTR("reqStart"));

      }
      if (v24 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v24));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v116, CFSTR("reqEnd"));

      }
      if (v26 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v26));
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v117, CFSTR("resStart"));

      }
      v262 = v9;
      v264 = v6;
      if (v28 != -1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v28));
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v118, CFSTR("resEnd"));

      }
      v119 = (void *)objc_opt_new();
      objc_msgSend(v105, "setObject:forKeyedSubscript:", v119, CFSTR("request"));
      v120 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v270, "scheme");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "host");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "port");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v270, "path");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "stringWithFormat:", CFSTR("%@://%@:%@/%@"), v121, v122, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setObject:forKeyedSubscript:", v125, CFSTR("urlWithoutQuery"));

      if (v7)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRequestHeaderSize"));
        v126 = objc_claimAutoreleasedReturnValue();
        v127 = (void *)v126;
        if (v126)
          v128 = (const __CFString *)v126;
        else
          v128 = &stru_1E989B0F0;
        objc_msgSend(v119, "setObject:forKeyedSubscript:", v128, CFSTR("headerBytes"));

      }
      else
      {
        objc_msgSend(v119, "setObject:forKeyedSubscript:", &stru_1E989B0F0, CFSTR("headerBytes"));
      }
      -[NSURLSessionDataTask currentRequest](v269->_task, "currentRequest");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "valueForHTTPHeaderField:", CFSTR("X-Apple-Request-UUID"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setObject:forKeyedSubscript:", v130, CFSTR("uuid"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NSURLSessionDataTask countOfBytesSent](v269->_task, "countOfBytesSent"));
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setObject:forKeyedSubscript:", v131, CFSTR("bodyBytes"));

      v132 = (void *)objc_opt_new();
      objc_msgSend(v105, "setObject:forKeyedSubscript:", v132, CFSTR("response"));
      if (v7)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseHeaderSize"));
        v133 = objc_claimAutoreleasedReturnValue();
        v134 = (void *)v133;
        if (v133)
          v135 = (const __CFString *)v133;
        else
          v135 = &stru_1E989B0F0;
        objc_msgSend(v132, "setObject:forKeyedSubscript:", v135, CFSTR("headerBytes"));

      }
      else
      {
        objc_msgSend(v132, "setObject:forKeyedSubscript:", &stru_1E989B0F0, CFSTR("headerBytes"));
      }
      -[NSURLSessionDataTask response](v269->_task, "response");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v138 = (void *)MEMORY[0x1E0CB37E8];
        -[NSURLSessionDataTask response](v269->_task, "response");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "numberWithUnsignedLongLong:", objc_msgSend(v139, "statusCode"));
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "setObject:forKeyedSubscript:", v140, CFSTR("statusCode"));

        -[NSURLSessionDataTask response](v269->_task, "response");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "allHeaderFields");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("X-Apple-Request-UUID"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "setObject:forKeyedSubscript:", v143, CFSTR("uuid"));

      }
      if (v7)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseBodyBytesReceived"));
        v144 = objc_claimAutoreleasedReturnValue();
        v145 = (void *)v144;
        if (v144)
          v146 = (const __CFString *)v144;
        else
          v146 = &stru_1E989B0F0;
        objc_msgSend(v132, "setObject:forKeyedSubscript:", v146, CFSTR("bodyBytes"));

      }
      else
      {
        objc_msgSend(v132, "setObject:forKeyedSubscript:", &stru_1E989B0F0, CFSTR("bodyBytes"));
      }
      v6 = v264;
      v147 = (void *)MEMORY[0x1E0CB36D8];
      v271 = CFSTR("triesteSummary");
      v272 = v105;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v272, &v271, 1);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "dataWithJSONObject:options:error:", v148, 1, 0);
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      v150 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v149, 4);
      if (C2_TRIESTE_LOG_BLOCK != -1)
        dispatch_once(&C2_TRIESTE_LOG_BLOCK, &__block_literal_global_142_0);
      v151 = (id)C2_TRIESTE_LOG_INTERNAL;
      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v274 = v150;
        _os_log_impl(&dword_1D4DC3000, v151, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      v11 = v261;
      v9 = v262;
      v10 = report;
      self = v269;
      a4 = v258;
    }
  }
  -[C2RequestOptions metricOptions](self->_options, "metricOptions");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v152 || -[C2RequestOptions metricRequest](self->_options, "metricRequest"))
  {

    if (a4 == 2)
      goto LABEL_150;
    goto LABEL_151;
  }

  if (a4 == 2)
  {
LABEL_150:
    ++self->_attemptCount;
    self->_resetTime = CFAbsoluteTimeGetCurrent();
    goto LABEL_151;
  }
  if (a4 == 1)
  {
    -[NSURLSessionDataTask response](self->_task, "response");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v154 = objc_opt_isKindOfClass();

    if ((v154 & 1) != 0)
    {
      -[NSURLSessionDataTask response](self->_task, "response");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "allHeaderFields");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "objectForKey:", CFSTR("x-apple-report-metrics"));
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = v157 != 0;

    }
    else
    {
      v158 = 0;
    }
    -[C2RequestOptions metricOptions](self->_options, "metricOptions");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = objc_msgSend(v159, "generateTriggerWithResponseHeader:", v158);

    v161 = objc_alloc_init(C2MPNetworkEvent);
    v162 = self;
    v163 = v161;
    if (v161)
    {
      v259 = v160;
      -[C2MPNetworkEvent setTriggers:](v161, "setTriggers:", (int)v160);
      -[C2RequestOptions metricOptions](v162->_options, "metricOptions");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setReportFrequency:](v163, "setReportFrequency:", objc_msgSend(v164, "reportFrequency"));

      -[C2RequestOptions metricOptions](v162->_options, "metricOptions");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setReportFrequencyBase:](v163, "setReportFrequencyBase:", objc_msgSend(v165, "reportFrequencyBase"));

      -[NSURLSessionDataTask taskDescription](v162->_task, "taskDescription");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setNetworkTaskDescription:](v163, "setNetworkTaskDescription:", v166);

      if (-[C2RequestOptions redactRemoteEndpointFromNetworkMetrics](v162->_options, "redactRemoteEndpointFromNetworkMetrics")|| objc_msgSend(v9, "isProxyConnection"))
      {
        -[C2MPNetworkEvent setNetworkHostname:](v163, "setNetworkHostname:", CFSTR("redacted"));
        -[C2MPNetworkEvent setNetworkRemoteAddresssAndPort:](v163, "setNetworkRemoteAddresssAndPort:", CFSTR("redacted"));
      }
      else
      {
        objc_msgSend(v270, "host");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        -[C2MPNetworkEvent setNetworkHostname:](v163, "setNetworkHostname:", v167);

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRemoteAddressAndPort"));
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        -[C2MPNetworkEvent setNetworkRemoteAddresssAndPort:](v163, "setNetworkRemoteAddresssAndPort:", v168);

      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionUUID"));
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setNetworkConnectionUuid:](v163, "setNetworkConnectionUuid:", v169);

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionReused"));
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setNetworkConnectionReused:](v163, "setNetworkConnectionReused:", objc_msgSend(v170, "BOOLValue"));

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectionInterfaceIdentifier"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setNetworkInterfaceIdentifier:](v163, "setNetworkInterfaceIdentifier:", v171);

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataNetworkProtocolName"));
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setNetworkProtocolName:](v163, "setNetworkProtocolName:", v172);

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRequestHeaderSize"));
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setNetworkRequestHeaderSize:](v163, "setNetworkRequestHeaderSize:", objc_msgSend(v173, "intValue"));

      -[C2MPNetworkEvent setNetworkRequestBodyBytesSent:](v163, "setNetworkRequestBodyBytesSent:", -[NSURLSessionDataTask countOfBytesSent](v269->_task, "countOfBytesSent"));
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseHeaderSize"));
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setNetworkResponseHeaderSize:](v163, "setNetworkResponseHeaderSize:", objc_msgSend(v174, "intValue"));

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseBodyBytesReceived"));
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setNetworkResponseBodyBytesReceived:](v163, "setNetworkResponseBodyBytesReceived:", objc_msgSend(v175, "longLongValue"));

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_kCFNBackgroundMetricsIsDiscretionary"));
      v176 = objc_claimAutoreleasedReturnValue();
      v177 = v176;
      if (v176)
        -[C2MPNetworkEvent setNetworkIsDiscretionary:](v163, "setNetworkIsDiscretionary:", -[NSObject BOOLValue](v176, "BOOLValue"));
      loga = v177;
      -[NSURLSessionTaskMetrics transactionMetrics](v269->_taskMetrics, "transactionMetrics");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "lastObject");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "c2_NegotiatedTLSProtocolVersionString");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setNetworkNegotiatedTlsProtocolVersion:](v163, "setNetworkNegotiatedTlsProtocolVersion:", v180);

      -[C2MPNetworkEvent setNetworkPreviousAttemptCount:](v163, "setNetworkPreviousAttemptCount:", v269->_attemptCount);
      if (v6)
      {
        +[C2Metric generateError:](C2Metric, "generateError:", v6);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        -[C2MPNetworkEvent setNetworkFatalError:](v163, "setNetworkFatalError:", v181);

      }
      -[NSURLSessionDataTask response](v269->_task, "response");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v183 = objc_opt_isKindOfClass();

      if ((v183 & 1) != 0)
      {
        -[NSURLSessionDataTask response](v269->_task, "response");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        -[C2MPNetworkEvent setNetworkStatusCode:](v163, "setNetworkStatusCode:", objc_msgSend(v184, "statusCode"));

      }
      v185 = report;
      if (-[C2RequestOptions redactUniformResourceIdentifierFromNetworkMetrics](v269->_options, "redactUniformResourceIdentifierFromNetworkMetrics"))
      {
        -[C2MPNetworkEvent setNetworkRequestUri:](v163, "setNetworkRequestUri:", CFSTR("redacted"));
      }
      else
      {
        -[NSURLSessionDataTask currentRequest](v269->_task, "currentRequest");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "URL");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "path");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        -[C2MPNetworkEvent setNetworkRequestUri:](v163, "setNetworkRequestUri:", v188);

      }
      -[C2MPNetworkEvent setTimestampC2Init:](v163, "setTimestampC2Init:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v269->_initTime));
      -[C2MPNetworkEvent setTimestampC2Start:](v163, "setTimestampC2Start:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v269->_resetTime));
      -[C2MPNetworkEvent setTimestampC2Now:](v163, "setTimestampC2Now:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", CFAbsoluteTimeGetCurrent()));
      if (v13 != -1.0)
        -[C2MPNetworkEvent setTimestampDnsStart:](v163, "setTimestampDnsStart:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v13));
      if (v15 != -1.0)
        -[C2MPNetworkEvent setTimestampDnsEnd:](v163, "setTimestampDnsEnd:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v15));
      if (v17 != -1.0)
        -[C2MPNetworkEvent setTimestampTcpStart:](v163, "setTimestampTcpStart:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v17));
      if (v266 != -1.0)
        -[C2MPNetworkEvent setTimestampTcpEnd:](v163, "setTimestampTcpEnd:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v266));
      if (v20 != -1.0)
        -[C2MPNetworkEvent setTimestampSslStart:](v163, "setTimestampSslStart:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v20));
      if (v22 != -1.0)
        -[C2MPNetworkEvent setTimestampRequestStart:](v163, "setTimestampRequestStart:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v22));
      if (v24 != -1.0)
        -[C2MPNetworkEvent setTimestampRequestEnd:](v163, "setTimestampRequestEnd:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v24));
      if (v26 != -1.0)
        -[C2MPNetworkEvent setTimestampResponseStart:](v163, "setTimestampResponseStart:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v26));
      v265 = v6;
      if (v28 != -1.0)
        -[C2MPNetworkEvent setTimestampResponseEnd:](v163, "setTimestampResponseEnd:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v28));
      +[C2RequestOptions stringForQualityOfService:](C2RequestOptions, "stringForQualityOfService:", -[C2RequestOptions qualityOfService](v269->_options, "qualityOfService"));
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setOptionsQualityOfService:](v163, "setOptionsQualityOfService:", v189);

      -[C2MPNetworkEvent setOptionsOutOfProcess:](v163, "setOptionsOutOfProcess:", -[C2RequestOptions outOfProcess](v269->_options, "outOfProcess"));
      -[C2MPNetworkEvent setOptionsOutOfProcessForceDiscretionary:](v163, "setOptionsOutOfProcessForceDiscretionary:", -[C2RequestOptions discretionaryNetworkBehavior](v269->_options, "discretionaryNetworkBehavior") == 2);
      -[C2MPNetworkEvent setOptionsAllowCellularAccess:](v163, "setOptionsAllowCellularAccess:", -[C2RequestOptions allowsCellularAccess](v269->_options, "allowsCellularAccess"));
      -[C2MPNetworkEvent setOptionsAllowExpensiveAccess:](v163, "setOptionsAllowExpensiveAccess:", -[C2RequestOptions _allowsExpensiveAccess](v269->_options, "_allowsExpensiveAccess"));
      -[C2MPNetworkEvent setOptionsAllowPowerNapScheduling:](v163, "setOptionsAllowPowerNapScheduling:", -[C2RequestOptions _allowsPowerNapScheduling](v269->_options, "_allowsPowerNapScheduling"));
      -[C2RequestOptions _timeoutIntervalForRequest](v269->_options, "_timeoutIntervalForRequest");
      -[C2MPNetworkEvent setOptionsTimeoutIntervalForRequest:](v163, "setOptionsTimeoutIntervalForRequest:", v190);
      -[C2RequestOptions _timeoutIntervalForResource](v269->_options, "_timeoutIntervalForResource");
      -[C2MPNetworkEvent setOptionsTimeoutIntervalForResource:](v163, "setOptionsTimeoutIntervalForResource:", v191);
      -[C2RequestOptions _sourceApplicationBundleIdentifier](v269->_options, "_sourceApplicationBundleIdentifier");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setOptionsSourceApplicationBundleIdentifier:](v163, "setOptionsSourceApplicationBundleIdentifier:", v192);

      -[C2RequestOptions _sourceApplicationSecondaryIdentifier](v269->_options, "_sourceApplicationSecondaryIdentifier");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setOptionsSourceApplicationSecondaryIdentifier:](v163, "setOptionsSourceApplicationSecondaryIdentifier:", v193);

      -[C2RequestOptions _appleIDContextSessionIdentifier](v269->_options, "_appleIDContextSessionIdentifier");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setOptionsAppleIdContext:](v163, "setOptionsAppleIdContext:", v194 != 0);

      -[C2MPNetworkEvent setOptionsTlsPinningRequired:](v163, "setOptionsTlsPinningRequired:", -[C2RequestOptions tlsPinning](v269->_options, "tlsPinning"));
      +[C2RequestOptions stringForDiscretionaryNetworkBehavior:](C2RequestOptions, "stringForDiscretionaryNetworkBehavior:", -[C2RequestOptions discretionaryNetworkBehavior](v269->_options, "discretionaryNetworkBehavior"));
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setOptionsDiscretionaryNetworkBehavior:](v163, "setOptionsDiscretionaryNetworkBehavior:", v195);

      +[C2RequestOptions stringForDuetPreClearedMode:](C2RequestOptions, "stringForDuetPreClearedMode:", -[C2RequestOptions duetPreClearedMode](v269->_options, "duetPreClearedMode"));
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      -[C2MPNetworkEvent setOptionsDuetPreClearedMode:](v163, "setOptionsDuetPreClearedMode:", v196);

      if (report)
      {
        path_count = nw_data_transfer_report_get_path_count(report);
        if (path_count)
        {
          v198 = path_count;
          for (i = 0; v198 != i; ++i)
          {
            v200 = nw_data_transfer_report_copy_path_interface(v185, i);
            v201 = objc_alloc_init(C2MPPathInfo);
            type = nw_interface_get_type(v200);
            switch(type)
            {
              case nw_interface_type_wired:
                v203 = v201;
                v204 = CFSTR("wired");
                break;
              case nw_interface_type_cellular:
                -[C2MPPathInfo setInterfaceType:](v201, "setInterfaceType:", CFSTR("cellular"));
                if (nw_interface_get_radio_type() - 128 > 5)
                {
                  -[C2MPPathInfo setRadioType:](v201, "setRadioType:", CFSTR("unknown"));
                }
                else
                {
                  v205 = (void *)MEMORY[0x1E0CB3940];
                  nw_interface_get_radio_type();
                  objc_msgSend(v205, "stringWithCString:encoding:", nw_interface_radio_type_to_string(), 4);
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  -[C2MPPathInfo setRadioType:](v201, "setRadioType:", v206);

                  v185 = report;
                }
                goto LABEL_197;
              case nw_interface_type_wifi:
                v203 = v201;
                v204 = CFSTR("wifi");
                break;
              default:
                v203 = v201;
                v204 = CFSTR("unknown");
                break;
            }
            -[C2MPPathInfo setInterfaceType:](v203, "setInterfaceType:", v204);
LABEL_197:
            -[C2MPPathInfo setApplicationBytesSent:](v201, "setApplicationBytesSent:", nw_data_transfer_report_get_sent_application_byte_count(v185, i));
            -[C2MPPathInfo setApplicationBytesReceived:](v201, "setApplicationBytesReceived:", nw_data_transfer_report_get_received_application_byte_count(v185, i));
            -[C2MPNetworkEvent addNetworkPathInfo:](v163, "addNetworkPathInfo:", v201);

          }
        }
      }
      +[C2ReportMetrics reportNetworkEvent:triggers:originalSessionTask:](C2ReportMetrics, "reportNetworkEvent:triggers:originalSessionTask:", v163, v259, v269);

      v6 = v265;
    }

    v10 = report;
  }
LABEL_151:

}

+ (double)captureMetricDurationBetweenStart:(double)a3 andEnd:(double)a4
{
  BOOL v4;
  double result;

  v4 = a4 == -1.0 || a3 == -1.0;
  result = a4 - a3;
  if (v4)
    return -1.0;
  return result;
}

+ (double)captureMetricsForTimingData:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v7;
        objc_msgSend(v7, "doubleValue");
        v9 = v8;

        goto LABEL_7;
      }
    }
  }
  else
  {
    v7 = 0;
  }
  v9 = -1.0;
LABEL_7:
  if (v9 == 0.0)
    v9 = -1.0;

  return v9;
}

- (id)taskDescription
{
  C2SessionTask *v3;
  NSURLSessionDataTask *task;
  void *v5;
  void *v7;
  void *v8;

  v3 = self;
  objc_sync_enter(v3);
  task = v3->_task;
  if (!task)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("C2SessionTask.m"), 115, CFSTR("task must not be nil"));

    task = v3->_task;
  }
  -[NSURLSessionDataTask taskDescription](task, "taskDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("C2SessionTask.m"), 117, CFSTR("task description must not be nil"));

  }
  objc_sync_exit(v3);

  return v5;
}

- (void)handleCallbackForTask:(id)a3 callback:(id)a4
{
  id v7;
  void (**v8)(id, C2SessionTask *, id);
  C2SessionTask *v9;
  C2RequestDelegate *v10;
  NSURLSessionDataTask *task;
  uint64_t v12;
  C2SessionCallbackMetrics *v13;
  C2SessionTask *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, C2SessionTask *, id))a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  v9 = self;
  objc_sync_enter(v9);
  v10 = 0;
  if (!v9->_isComplete)
  {
    v10 = v9->_delegate;
    if (v10)
    {
      task = v9->_task;
      if (!task)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("C2SessionTask.m"), 84, CFSTR("task must not be nil"));

        task = v9->_task;
      }
      v12 = -[NSURLSessionDataTask taskIdentifier](task, "taskIdentifier");
      if (v12 != objc_msgSend(v7, "taskIdentifier"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("C2SessionTask.m"), 85, CFSTR("taskIdentifier (%llu) found but expected (%llu)."), -[NSURLSessionDataTask taskIdentifier](v9->_task, "taskIdentifier"), objc_msgSend(v7, "taskIdentifier"));

      }
    }
  }
  v13 = objc_alloc_init(C2SessionCallbackMetrics);
  -[C2SessionCallbackMetrics setStartTime:](v13, "setStartTime:", mach_absolute_time());
  -[NSMutableSet addObject:](v9->_outstandingCallbacks, "addObject:", v13);
  objc_sync_exit(v9);

  v8[2](v8, v9, v10);
  v14 = v9;
  objc_sync_enter(v14);
  -[NSMutableSet removeObject:](v9->_outstandingCallbacks, "removeObject:", v13);
  objc_sync_exit(v14);

  mach_absolute_time();
  -[C2SessionCallbackMetrics startTime](v13, "startTime");
  TMConvertTicksToSeconds();
  v16 = v15;
  if (v15 > 1.0)
  {
    if (C2_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_23_1);
    v17 = C2_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v22 = v16;
      _os_log_impl(&dword_1D4DC3000, v17, OS_LOG_TYPE_ERROR, "C2RequestDelegate took %.3f seconds.", buf, 0xCu);
    }
  }

  os_activity_scope_leave(&state);
}

- (void)didFinishCollectingMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_taskMetrics, a3);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_isComplete)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2SessionTask.m"), 157, CFSTR("should be complete"));

  }
  v5.receiver = self;
  v5.super_class = (Class)C2SessionTask;
  -[C2SessionTask dealloc](&v5, sel_dealloc);
}

- (C2RequestOptions)options
{
  return self->_options;
}

- (void)C2Session:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_activity_scope_state_s v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v11);
  -[C2SessionTaskDelegate C2Session:task:didCompleteWithError:](self->_sessionTaskDelegate, "C2Session:task:didCompleteWithError:", v8, v9, v10);
  -[C2SessionTask invalidate](self, "invalidate");
  os_activity_scope_leave(&v11);

}

- (void)invalidate
{
  C2SessionTask *v3;
  NSURLSessionDataTask *task;
  C2RequestDelegate *delegate;
  void *v6;
  C2SessionTask *obj;

  obj = self;
  objc_sync_enter(obj);
  v3 = obj;
  if (obj->_isComplete)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("C2SessionTask.m"), 134, CFSTR("received duplicate callbacks"));

    v3 = obj;
  }
  v3->_isComplete = 1;
  task = v3->_task;
  v3->_task = 0;

  delegate = obj->_delegate;
  obj->_delegate = 0;

  objc_sync_exit(obj);
}

- (void)setTask:(id)a3
{
  NSURLSessionDataTask *v5;
  NSObject *v6;
  C2SessionTask *v7;
  NSURLSessionDataTask *task;
  void *v9;
  int v10;
  C2SessionTask *v11;
  __int16 v12;
  NSURLSessionDataTask *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (NSURLSessionDataTask *)a3;
  if (C2_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_24_0);
  v6 = C2_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1D4DC3000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ setTask:%{public}@]", (uint8_t *)&v10, 0x16u);
  }
  v7 = self;
  objc_sync_enter(v7);
  if (v7->_task)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("C2SessionTask.m"), 107, CFSTR("task must be nil"));

  }
  task = v7->_task;
  v7->_task = v5;

  objc_sync_exit(v7);
}

- (id)taskIdentifier
{
  C2SessionTask *v3;
  NSURLSessionDataTask *task;
  void *v5;
  void *v7;
  void *v8;

  v3 = self;
  objc_sync_enter(v3);
  task = v3->_task;
  if (!task)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("C2SessionTask.m"), 125, CFSTR("task must not be nil"));

    task = v3->_task;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSURLSessionDataTask taskIdentifier](task, "taskIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("C2SessionTask.m"), 127, CFSTR("task identifier must not be nil"));

  }
  objc_sync_exit(v3);

  return v5;
}

- (C2SessionTask)initWithOptions:(id)a3 delegate:(id)a4 sessionTaskDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  C2SessionTask *v13;
  C2SessionTask *v14;
  NSURLSessionDataTask *task;
  os_activity_t v16;
  OS_os_activity *activity;
  CFAbsoluteTime Current;
  NSMutableSet *v19;
  void *outstandingCallbacks;
  NSObject *v21;
  C2SessionTask *v22;
  NSObject *v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9 && v10 && v11)
  {
    v26.receiver = self;
    v26.super_class = (Class)C2SessionTask;
    v13 = -[C2SessionTask init](&v26, sel_init);
    v14 = v13;
    if (v13)
    {
      task = v13->_task;
      v13->_task = 0;

      objc_storeStrong((id *)&v14->_options, a3);
      objc_storeStrong((id *)&v14->_delegate, a4);
      objc_storeStrong((id *)&v14->_sessionTaskDelegate, a5);
      v16 = _os_activity_create(&dword_1D4DC3000, "c2-request-task", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      activity = v14->_activity;
      v14->_activity = (OS_os_activity *)v16;

      if (v14->_activity)
      {
        v14->_isComplete = 0;
        Current = CFAbsoluteTimeGetCurrent();
        v14->_initTime = Current;
        v14->_resetTime = Current;
        v14->_attemptCount = 0;
        v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        outstandingCallbacks = v14->_outstandingCallbacks;
        v14->_outstandingCallbacks = v19;
LABEL_23:

        self = v14;
        v22 = self;
        goto LABEL_24;
      }
      if (C2_DEFAULT_LOG_BLOCK_3 != -1)
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_12_0);
      v23 = C2_DEFAULT_LOG_INTERNAL_3;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4DC3000, v23, OS_LOG_TYPE_ERROR, "failed to create os_activity for C2SessionTask", buf, 2u);
      }
    }
    if (C2_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_14_0);
    v24 = C2_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4DC3000, v24, OS_LOG_TYPE_ERROR, "failed to create C2SessionTask", buf, 2u);
    }
    if (v14)
    {
      v14->_isComplete = 1;
      outstandingCallbacks = v14;
      v14 = 0;
    }
    else
    {
      outstandingCallbacks = 0;
    }
    goto LABEL_23;
  }
  if (C2_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_8);
  v21 = C2_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v28 = v9;
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32 = v12;
    _os_log_impl(&dword_1D4DC3000, v21, OS_LOG_TYPE_ERROR, "missing required arguments - [C2SessionTask initWithOptions:%{public}@ delegate:%{public}@ sessionTaskDelegate:%{public}@]", buf, 0x20u);
  }
  v22 = 0;
LABEL_24:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_outstandingCallbacks, 0);
  objc_storeStrong((id *)&self->_sessionTaskDelegate, 0);
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  if (!callbackHealthQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("com.apple.c2.callback.health", v4);
    v3 = (void *)callbackHealthQueue;
    callbackHealthQueue = (uint64_t)v2;

  }
}

+ (id)callbackHealthQueue
{
  return (id)callbackHealthQueue;
}

void __62__C2SessionTask_initWithOptions_delegate_sessionTaskDelegate___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_3;
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __62__C2SessionTask_initWithOptions_delegate_sessionTaskDelegate___block_invoke_11()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_3;
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __62__C2SessionTask_initWithOptions_delegate_sessionTaskDelegate___block_invoke_13()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_3;
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __48__C2SessionTask_handleCallbackForTask_callback___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_3;
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __25__C2SessionTask_setTask___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_3;
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

- (BOOL)callbackHung
{
  C2SessionTask *v2;
  NSMutableSet *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (-[NSMutableSet count](v2->_outstandingCallbacks, "count"))
  {
    mach_absolute_time();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = v2->_outstandingCallbacks;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = 0;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "startTime", (_QWORD)v13);
          TMConvertTicksToSeconds();
          v9 = v8;
          -[C2RequestOptions taskCallbackConsideredHangInSeconds](v2->_options, "taskCallbackConsideredHangInSeconds");
          if (v9 > v10)
            v5 = 1;
        }
        v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
      v11 = v5 & 1;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  objc_sync_exit(v2);

  return v11;
}

- (void)testBehavior_triggerCallbackHang
{
  C2SessionTask *v2;
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2->_outstandingCallbacks;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        v8 = mach_absolute_time();
        TMConvertTicksToSeconds();
        v10 = v9;
        -[C2RequestOptions taskCallbackConsideredHangInSeconds](v2->_options, "taskCallbackConsideredHangInSeconds", (_QWORD)v12);
        objc_msgSend(v7, "setStartTime:", (unint64_t)((double)v8 - (double)(unint64_t)((double)v8 / v10) * (v11 + v11)));
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

void __51__C2SessionTask_captureMetricsWithError_eventType___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_3;
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __51__C2SessionTask_captureMetricsWithError_eventType___block_invoke_88()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_3;
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __51__C2SessionTask_captureMetricsWithError_eventType___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "trieste");
  v1 = (void *)C2_TRIESTE_LOG_INTERNAL;
  C2_TRIESTE_LOG_INTERNAL = (uint64_t)v0;

}

- (C2RequestDelegate)delegate
{
  return self->_delegate;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (NSURLSessionTaskMetrics)taskMetrics
{
  return self->_taskMetrics;
}

- (void)setTaskMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_taskMetrics, a3);
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (C2SessionTaskDelegate)sessionTaskDelegate
{
  return self->_sessionTaskDelegate;
}

- (void)setSessionTaskDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTaskDelegate, a3);
}

- (double)initTime
{
  return self->_initTime;
}

- (void)setInitTime:(double)a3
{
  self->_initTime = a3;
}

- (double)resetTime
{
  return self->_resetTime;
}

- (void)setResetTime:(double)a3
{
  self->_resetTime = a3;
}

- (unsigned)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unsigned int)a3
{
  self->_attemptCount = a3;
}

- (NSMutableSet)outstandingCallbacks
{
  return self->_outstandingCallbacks;
}

- (void)setOutstandingCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingCallbacks, a3);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

@end
